@implementation NTKLocalTimelineComplicationController

+ (BOOL)_acceptsComplicationType:(unint64_t)a3 family:(int64_t)a4 forDevice:(id)a5
{
  return +[NTKComplicationDataSource dataSourceClassForComplicationType:family:forDevice:](NTKComplicationDataSource, "dataSourceClassForComplicationType:family:forDevice:", a3, a4, a5) != 0;
}

- (NTKLocalTimelineComplicationController)initWithComplication:(id)a3 variant:(id)a4 device:(id)a5
{
  id v8;
  id v9;
  id v10;
  NTKLocalTimelineComplicationController *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  CLKCComplicationDataSource *dataSource;
  NSMutableSet *v17;
  NSMutableSet *suspendedRightBoundaryDates;
  NSMutableSet *v19;
  NSMutableSet *delayedBlocks;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)NTKLocalTimelineComplicationController;
  v11 = -[NTKComplicationController initWithComplication:variant:device:](&v22, sel_initWithComplication_variant_device_, v8, v9, v10);
  if (v11)
  {
    v12 = (objc_class *)objc_msgSend((id)objc_opt_class(), "complicationDataSourceClassForComplication:family:device:", v8, objc_msgSend(v9, "family"), v10);
    v13 = (void *)objc_opt_new();
    objc_msgSend(v9, "metrics");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setShowsBackground:", objc_msgSend(v14, "opaque"));

    v15 = objc_msgSend([v12 alloc], "initWithComplication:family:forDevice:context:", v8, objc_msgSend(v9, "family"), v10, v13);
    dataSource = v11->_dataSource;
    v11->_dataSource = (CLKCComplicationDataSource *)v15;

    -[CLKCComplicationDataSource setDelegate:](v11->_dataSource, "setDelegate:", v11);
    v11->_dataSourceState = 0;
    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    suspendedRightBoundaryDates = v11->_suspendedRightBoundaryDates;
    v11->_suspendedRightBoundaryDates = v17;

    v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    delayedBlocks = v11->_delayedBlocks;
    v11->_delayedBlocks = v19;

    v11->_hasBeenLive = 0;
    -[NTKLocalTimelineComplicationController invalidateSwitcherTemplate](v11, "invalidateSwitcherTemplate");

  }
  return v11;
}

+ (Class)complicationDataSourceClassForComplication:(id)a3 family:(int64_t)a4 device:(id)a5
{
  id v7;
  void *v8;

  v7 = a5;
  +[NTKComplicationDataSource dataSourceClassForComplicationType:family:forDevice:](NTKComplicationDataSource, "dataSourceClassForComplicationType:family:forDevice:", objc_msgSend(a3, "complicationType"), a4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v8;
}

- (void)setIgnoreNewTemplates:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  CLKCComplicationDataSource *dataSource;
  objc_super v7;
  uint8_t buf[4];
  NTKLocalTimelineComplicationController *v9;
  __int16 v10;
  CLKCComplicationDataSource *v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  if (-[NTKTimelineComplicationController ignoreNewTemplates](self, "ignoreNewTemplates") != a3)
  {
    _NTKLoggingObjectForDomain(40, (uint64_t)"NTKLoggingDomainTritium");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      dataSource = self->_dataSource;
      *(_DWORD *)buf = 138412802;
      v9 = self;
      v10 = 2112;
      v11 = dataSource;
      v12 = 1024;
      v13 = v3;
      _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "%@ %@ setIgnoreNewTemplates: %i", buf, 0x1Cu);
    }

  }
  v7.receiver = self;
  v7.super_class = (Class)NTKLocalTimelineComplicationController;
  -[NTKTimelineComplicationController setIgnoreNewTemplates:](&v7, sel_setIgnoreNewTemplates_, v3);
  if (!v3)
    -[NTKLocalTimelineComplicationController _updateAllDisplayWrappersToCurrentTemplateWithReason:](self, "_updateAllDisplayWrappersToCurrentTemplateWithReason:", 0);
}

- (void)_activate
{
  self->_hasBeenLive = 0;
}

- (void)_deactivate
{
  NTKTimelineDataOperation *currentOperation;

  -[NTKTimelineDataOperation cancel](self->_currentOperation, "cancel");
  currentOperation = self->_currentOperation;
  self->_currentOperation = 0;

  -[NTKLocalTimelineComplicationController _cancelDelayedBlocks](self, "_cancelDelayedBlocks");
}

- (void)_resetTimelineForCachingChange
{
  id v3;

  -[TLTimeline nowEntry](self->_timeline, "nowEntry");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[TLTimeline resetWithEntry:](self->_timeline, "resetWithEntry:", v3);
  -[NSMutableSet removeAllObjects](self->_suspendedRightBoundaryDates, "removeAllObjects");
  -[NTKLocalTimelineComplicationController _queueAnimationForNextUpdate:](self, "_queueAnimationForNextUpdate:", 1);

}

- (void)_applyCachingMode
{
  int64_t v3;

  v3 = -[NTKComplicationController cachingMode](self, "cachingMode");
  if (v3 == 2)
  {
    -[NTKLocalTimelineComplicationController _startSetupOperationIfPossible](self, "_startSetupOperationIfPossible");
  }
  else
  {
    if (v3 != 1)
    {
      if (v3)
        return;
      self->_hasBeenLive = 0;
    }
    -[NTKLocalTimelineComplicationController _resetTimelineForCachingChange](self, "_resetTimelineForCachingChange");
  }
}

- (void)_applyUpdatingMode
{
  if (-[NTKComplicationController updatingMode](self, "updatingMode") == 1)
  {
    if (!self->_hasBeenLive)
    {
      self->_hasBeenLive = 1;
      -[NTKLocalTimelineComplicationController _startSetupOperationIfPossible](self, "_startSetupOperationIfPossible");
    }
    -[NTKLocalTimelineComplicationController _requestDataSourceToUpdateToState:](self, "_requestDataSourceToUpdateToState:", 1);
    -[TLTimeline setPaused:](self->_timeline, "setPaused:", 0);
  }
  else
  {
    -[NTKLocalTimelineComplicationController _requestDataSourceToUpdateToState:](self, "_requestDataSourceToUpdateToState:", 0);
    -[TLTimeline setPaused:](self->_timeline, "setPaused:", 1);
    -[NTKComplicationController enumerateDisplayWrappersWithBlock:](self, "enumerateDisplayWrappersWithBlock:", &__block_literal_global_140);
  }
}

uint64_t __60__NTKLocalTimelineComplicationController__applyUpdatingMode__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDimmed:", 0);
}

- (void)_requestDataSourceToUpdateToState:(int64_t)a3
{
  int64_t dataSourceState;

  dataSourceState = self->_dataSourceState;
  if (a3 != 1 || dataSourceState)
  {
    if (!a3 && dataSourceState == 1)
    {
      self->_dataSourceState = 0;
      -[CLKCComplicationDataSource pause](self->_dataSource, "pause");
    }
  }
  else
  {
    self->_dataSourceState = 1;
    -[CLKCComplicationDataSource resume](self->_dataSource, "resume");
  }
}

- (void)_applyAnimationMode
{
  int64_t v3;
  CLKCComplicationDataSource *dataSource;

  v3 = -[NTKComplicationController animationMode](self, "animationMode");
  dataSource = self->_dataSource;
  if (v3 == 1)
    -[CLKCComplicationDataSource resumeAnimations](dataSource, "resumeAnimations");
  else
    -[CLKCComplicationDataSource pauseAnimations](dataSource, "pauseAnimations");
}

- (void)_updateIsComplicationActive:(BOOL)a3
{
  CLKCComplicationDataSource *dataSource;

  dataSource = self->_dataSource;
  if (a3)
    -[CLKCComplicationDataSource becomeActive](dataSource, "becomeActive");
  else
    -[CLKCComplicationDataSource becomeInactive](dataSource, "becomeInactive");
}

- (void)setDisplayProperties:(id)a3 forDisplayWrapper:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  CLKCComplicationDataSource *dataSource;
  uint64_t v14;
  CLKComplicationTemplate *v15;
  CLKComplicationTemplate *switcherTemplate;
  NTKLocalTimelineComplicationController *v17;
  uint64_t v18;
  _QWORD v19[5];
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  objc_super v25;

  v6 = a3;
  v7 = a4;
  v8 = -[NTKComplicationController effectiveFaceDataMode](self, "effectiveFaceDataMode");
  v25.receiver = self;
  v25.super_class = (Class)NTKLocalTimelineComplicationController;
  -[NTKComplicationController setDisplayProperties:forDisplayWrapper:](&v25, sel_setDisplayProperties_forDisplayWrapper_, v6, v7);
  v9 = -[NTKComplicationController effectiveFaceDataMode](self, "effectiveFaceDataMode");
  v10 = objc_msgSend(v6, "faceDataMode");
  if (v9 != v8)
  {
    v11 = v10;
    _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[NTKLocalTimelineComplicationController setDisplayProperties:forDisplayWrapper:].cold.1((uint64_t)self, v9, v12);

    if (v9 == 1)
    {
      v21 = 0;
      v22 = &v21;
      v23 = 0x2020000000;
      dataSource = self->_dataSource;
      v14 = MEMORY[0x1E0C809B0];
      v24 = 0;
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __81__NTKLocalTimelineComplicationController_setDisplayProperties_forDisplayWrapper___block_invoke;
      v20[3] = &unk_1E6BD8A10;
      v20[4] = &v21;
      -[CLKCComplicationDataSource getTimelineEndDateWithHandler:](dataSource, "getTimelineEndDateWithHandler:", v20);
      if (self->_hasBeenLive && (unint64_t)(v8 - 3) <= 2 && *((_BYTE *)v22 + 24))
      {
        v19[0] = v14;
        v19[1] = 3221225472;
        v19[2] = __81__NTKLocalTimelineComplicationController_setDisplayProperties_forDisplayWrapper___block_invoke_2;
        v19[3] = &unk_1E6BCD5F0;
        v19[4] = self;
        dispatch_async(MEMORY[0x1E0C80D38], v19);
      }
      else
      {
        -[NTKLocalTimelineComplicationController _updateAllDisplayWrappersToCurrentTemplateWithReason:](self, "_updateAllDisplayWrappersToCurrentTemplateWithReason:", 0);
      }
      _Block_object_dispose(&v21, 8);
    }
    else if (-[CLKCComplicationDataSource alwaysShowIdealizedTemplateInSwitcher](self->_dataSource, "alwaysShowIdealizedTemplateInSwitcher")|| v9 == 3 && !self->_hasBeenLive && !self->_switcherTemplate)
    {
      -[CLKCComplicationDataSource currentSwitcherTemplate](self->_dataSource, "currentSwitcherTemplate");
      v15 = (CLKComplicationTemplate *)objc_claimAutoreleasedReturnValue();
      switcherTemplate = self->_switcherTemplate;
      self->_switcherTemplate = v15;

      -[CLKComplicationTemplate finalize](self->_switcherTemplate, "finalize");
      if (v11 == 3 && v8 == 1)
      {
        v17 = self;
        v18 = 2;
      }
      else
      {
        v17 = self;
        v18 = 0;
      }
      -[NTKLocalTimelineComplicationController _updateAllDisplayWrappersToCurrentTemplateWithReason:](v17, "_updateAllDisplayWrappersToCurrentTemplateWithReason:", v18);
    }
  }

}

uint64_t __81__NTKLocalTimelineComplicationController_setDisplayProperties_forDisplayWrapper___block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2 != 0;
  return result;
}

uint64_t __81__NTKLocalTimelineComplicationController_setDisplayProperties_forDisplayWrapper___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_extendTimelineIfNecessaryAndPossible");
}

- (void)setShowsLockedUI:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  uint64_t v6;
  objc_super v7;

  v3 = a3;
  v5 = -[NTKComplicationController showsLockedUI](self, "showsLockedUI");
  v7.receiver = self;
  v7.super_class = (Class)NTKLocalTimelineComplicationController;
  -[NTKComplicationController setShowsLockedUI:](&v7, sel_setShowsLockedUI_, v3);
  if (v5 != v3)
  {
    if (v3)
      v6 = 3;
    else
      v6 = 1;
    -[NTKLocalTimelineComplicationController _updateAllDisplayWrappersToCurrentTemplateWithReason:](self, "_updateAllDisplayWrappersToCurrentTemplateWithReason:", v6);
  }
}

- (void)addDisplayWrapper:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKLocalTimelineComplicationController;
  v4 = a3;
  -[NTKComplicationController addDisplayWrapper:](&v6, sel_addDisplayWrapper_, v4);
  -[NTKLocalTimelineComplicationController activeDisplayTemplateForDisplayWrapper:](self, "activeDisplayTemplateForDisplayWrapper:", v4, v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setComplicationTemplate:reason:animation:", v5, 0, 0);

  objc_msgSend(v4, "setDimmed:", 0);
}

- (void)_updateAllDisplayWrappersToCurrentTemplateWithReason:(int64_t)a3
{
  -[NTKLocalTimelineComplicationController _updateAllDisplayWrappersToCurrentTemplateWithReason:animation:](self, "_updateAllDisplayWrappersToCurrentTemplateWithReason:animation:", a3, 0);
}

- (void)_queueAnimationForNextUpdate:(unint64_t)a3
{
  if (-[CLKCComplicationDataSource timelineAnimationBehavior](self->_dataSource, "timelineAnimationBehavior"))
  {
    self->_hasQueuedAnimation = 1;
    self->_queuedAnimation = a3;
  }
}

- (void)_updateAllDisplayWrappersToCurrentTemplateWithReason:(int64_t)a3 animation:(unint64_t)queuedAnimation
{
  _QWORD v7[7];

  if (!-[NTKTimelineComplicationController ignoreNewTemplates](self, "ignoreNewTemplates"))
  {
    if (!-[NTKComplicationController showsLockedUI](self, "showsLockedUI"))
    {
      if (!self->_timeTravelDate
        && self->_hasQueuedAnimation
        && -[NTKComplicationController updatingMode](self, "updatingMode") == 1)
      {
        queuedAnimation = self->_queuedAnimation;
      }
      if (-[NTKComplicationController updatingMode](self, "updatingMode") == 1)
        self->_hasQueuedAnimation = 0;
    }
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __105__NTKLocalTimelineComplicationController__updateAllDisplayWrappersToCurrentTemplateWithReason_animation___block_invoke;
    v7[3] = &unk_1E6BD8A38;
    v7[4] = self;
    v7[5] = a3;
    v7[6] = queuedAnimation;
    -[NTKComplicationController enumerateDisplayWrappersWithBlock:](self, "enumerateDisplayWrappersWithBlock:", v7);
  }
}

uint64_t __105__NTKLocalTimelineComplicationController__updateAllDisplayWrappersToCurrentTemplateWithReason_animation___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateDisplayWrapper:toCurrentTemplateWithReason:animation:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_updateDisplayWrapper:(id)a3 toCurrentTemplateWithReason:(int64_t)a4 animation:(unint64_t)a5
{
  void *v8;
  void *v9;
  BOOL v10;
  id v11;

  v11 = a3;
  -[NTKLocalTimelineComplicationController activeDisplayTemplateForDisplayWrapper:](self, "activeDisplayTemplateForDisplayWrapper:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NTKComplicationController showsLockedUI](self, "showsLockedUI"))
  {
    -[NTKLocalTimelineComplicationController lockedTemplate](self, "lockedTemplate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8 == v9;

    if (v10)
      a5 = 0;
  }
  objc_msgSend(v11, "setComplicationTemplate:reason:animation:", v8, a4, a5);

}

- (double)minimumIntervalBetweenTimelineEntries
{
  return 60.0;
}

- (void)invalidateEntries
{
  NTKTimelineDataOperation *currentOperation;

  -[NTKTimelineDataOperation cancel](self->_currentOperation, "cancel");
  currentOperation = self->_currentOperation;
  self->_currentOperation = 0;

  -[NTKLocalTimelineComplicationController _cancelDelayedBlocks](self, "_cancelDelayedBlocks");
  -[NSMutableSet removeAllObjects](self->_suspendedRightBoundaryDates, "removeAllObjects");
  -[NTKLocalTimelineComplicationController _startSetupOperationIfPossible](self, "_startSetupOperationIfPossible");
}

- (void)setTimelineEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_timelineEndDate, a3);
  -[NTKLocalTimelineComplicationController _updateDimStateForCurrentTimeline](self, "_updateDimStateForCurrentTimeline");
}

- (void)appendEntries:(id)a3
{
  -[NTKLocalTimelineComplicationController appendEntries:withTritiumUpdatePriority:](self, "appendEntries:withTritiumUpdatePriority:", a3, 0);
}

- (void)appendEntries:(id)a3 withTritiumUpdatePriority:(int64_t)a4
{
  TLTimeline *timeline;
  id v6;
  id v7;

  timeline = self->_timeline;
  v6 = a3;
  -[TLTimeline _rightmostDate](timeline, "_rightmostDate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[TLTimeline extendTimelineFromDate:withEntries:](self->_timeline, "extendTimelineFromDate:withEntries:", v7, v6);

}

- (void)invalidateSwitcherTemplate
{
  CLKComplicationTemplate *switcherTemplate;
  CLKComplicationTemplate *v4;
  CLKComplicationTemplate *v5;

  switcherTemplate = self->_switcherTemplate;
  self->_switcherTemplate = 0;

  if (!self->_hasBeenLive)
  {
    -[CLKCComplicationDataSource currentSwitcherTemplate](self->_dataSource, "currentSwitcherTemplate");
    v4 = (CLKComplicationTemplate *)objc_claimAutoreleasedReturnValue();
    v5 = self->_switcherTemplate;
    self->_switcherTemplate = v4;

    -[CLKComplicationTemplate finalize](self->_switcherTemplate, "finalize");
    -[NTKLocalTimelineComplicationController _updateAllDisplayWrappersToCurrentTemplateWithReason:](self, "_updateAllDisplayWrappersToCurrentTemplateWithReason:", 0);
  }
}

- (void)timeline:(id)a3 didChangeNowEntryFrom:(id)a4 to:(id)a5
{
  CLKCComplicationDataSource *dataSource;
  id v8;
  id v9;
  unint64_t v10;

  if (!self->_timeTravelDate)
  {
    dataSource = self->_dataSource;
    v8 = a5;
    v9 = a4;
    v10 = -[NTKTimelineComplicationController _animationForTimelineEntryTransitionFrom:to:withAnimationBehavior:](self, "_animationForTimelineEntryTransitionFrom:to:withAnimationBehavior:", v9, v8, -[CLKCComplicationDataSource timelineAnimationBehavior](dataSource, "timelineAnimationBehavior"));

    -[NTKLocalTimelineComplicationController _updateAllDisplayWrappersToCurrentTemplateWithReason:animation:](self, "_updateAllDisplayWrappersToCurrentTemplateWithReason:animation:", 1, v10);
    -[NTKLocalTimelineComplicationController _extendTimelineIfNecessaryAndPossible](self, "_extendTimelineIfNecessaryAndPossible");
  }
}

- (void)entriesDidChangeInTimeline:(id)a3
{
  -[NTKComplicationController notifyDelegateOnTimelineChangeWithTritiumUpdatePriority:](self, "notifyDelegateOnTimelineChangeWithTritiumUpdatePriority:", objc_msgSend((id)objc_opt_class(), "tritiumUpdatePriority"));
}

- (void)_completeSetupOperationWithEndDate:(id)a3 currentEntry:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NTKTimelineDataOperation *currentOperation;
  CLKCComplicationDataSource *dataSource;
  NTKTimelineDataOperation *v11;
  TLTimeline *timeline;
  NSObject *v13;
  CLKCComplicationDataSource *v14;
  TLTimeline *v15;
  TLTimeline *v16;
  int v17;
  void *v18;
  __int16 v19;
  CLKCComplicationDataSource *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    currentOperation = self->_currentOperation;
    dataSource = self->_dataSource;
    v17 = 138412546;
    v18 = currentOperation;
    v19 = 2112;
    v20 = dataSource;
    _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_DEFAULT, "Timeline setup operation %@ completed for %@", (uint8_t *)&v17, 0x16u);
  }

  objc_msgSend(v7, "finalize");
  v11 = self->_currentOperation;
  self->_currentOperation = 0;

  self->_supportsTimeTravelForward = v6 != 0;
  -[NTKLocalTimelineComplicationController setTimelineEndDate:](self, "setTimelineEndDate:", v6);
  if (v7)
  {
    timeline = self->_timeline;
    if (timeline)
    {
      -[TLTimeline resetWithEntry:](timeline, "resetWithEntry:", v7);
    }
    else
    {
      v15 = (TLTimeline *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBF118]), "initWithEntry:", v7);
      v16 = self->_timeline;
      self->_timeline = v15;

      -[TLTimeline setDelegate:](self->_timeline, "setDelegate:", self);
    }
    -[NTKLocalTimelineComplicationController _updateAllDisplayWrappersToCurrentTemplateWithReason:](self, "_updateAllDisplayWrappersToCurrentTemplateWithReason:", 1);
    -[NTKLocalTimelineComplicationController _extendTimelineIfNecessaryAndPossible](self, "_extendTimelineIfNecessaryAndPossible");
  }
  else
  {
    _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = self->_dataSource;
      v17 = 138412290;
      v18 = v14;
      _os_log_impl(&dword_1B72A3000, v13, OS_LOG_TYPE_DEFAULT, "**** First-party complication data source gave us a nil timeline entry; this will result in a blank complication: %@",
        (uint8_t *)&v17,
        0xCu);
    }

  }
}

- (void)_startSetupOperationIfPossible
{
  NTKTimelineDataOperation **p_currentOperation;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *, uint64_t, uint64_t, void *);
  void *v8;
  id v9;
  id location;

  p_currentOperation = &self->_currentOperation;
  if (!self->_currentOperation && self->_hasBeenLive)
  {
    objc_initWeak(&location, self);
    +[NTKTimelineDataOperation operationWithLocalDataSource:](NTKTimelineSetupOperation, "operationWithLocalDataSource:", self->_dataSource);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v6 = 3221225472;
    v7 = __72__NTKLocalTimelineComplicationController__startSetupOperationIfPossible__block_invoke;
    v8 = &unk_1E6BD8A60;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v4, "setHandler:", &v5);
    objc_storeStrong((id *)p_currentOperation, v4);
    objc_msgSend(v4, "start", v5, v6, v7, v8);
    objc_destroyWeak(&v9);

    objc_destroyWeak(&location);
  }
}

void __72__NTKLocalTimelineComplicationController__startSetupOperationIfPossible__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id *v6;
  id v7;
  id v8;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a5;
  v8 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_completeSetupOperationWithEndDate:currentEntry:", v8, v7);

}

- (id)alwaysOnTemplate
{
  void *v2;

  -[CLKCComplicationDataSource alwaysOnTemplate](self->_dataSource, "alwaysOnTemplate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finalize");
  return v2;
}

- (void)_extendTimelineIfNecessaryAndPossible
{
  TLTimeline *timeline;
  id v4;

  if (!self->_currentOperation
    && self->_timeline
    && -[NTKComplicationController effectiveFaceDataMode](self, "effectiveFaceDataMode") != 3
    && -[NTKComplicationController effectiveFaceDataMode](self, "effectiveFaceDataMode") != 4
    && -[NTKComplicationController effectiveFaceDataMode](self, "effectiveFaceDataMode") != 5)
  {
    timeline = self->_timeline;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[NTKLocalTimelineComplicationController _startExtendOperationIfNecessaryForTimeline:withDate:minBuffer:](self, "_startExtendOperationIfNecessaryForTimeline:withDate:minBuffer:", timeline, v4, 300.0);

  }
}

- (void)_startExtendOperationIfNecessaryForTimeline:(id)a3 withDate:(id)a4 minBuffer:(double)a5
{
  id v8;
  void *v9;
  double v10;
  double v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;

  v8 = a4;
  objc_msgSend(a3, "_rightmostDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceDate:", v8);
  v11 = v10;

  if (self->_supportsTimeTravelForward)
  {
    if (v11 >= a5)
    {
      v12 = 0;
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v12 = 0;
  if ((objc_msgSend(v9, "isEqualToDate:", v9) & 1) == 0 && v11 < a5)
LABEL_6:
    v12 = -[NSMutableSet containsObject:](self->_suspendedRightBoundaryDates, "containsObject:", v9) ^ 1;
LABEL_7:
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __105__NTKLocalTimelineComplicationController__startExtendOperationIfNecessaryForTimeline_withDate_minBuffer___block_invoke;
  v16[3] = &unk_1E6BCD778;
  v16[4] = self;
  v17 = v9;
  v13 = v9;
  v14 = _Block_copy(v16);
  v15 = v14;
  if (v12)
    (*((void (**)(void *))v14 + 2))(v14);

}

uint64_t __105__NTKLocalTimelineComplicationController__startExtendOperationIfNecessaryForTimeline_withDate_minBuffer___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_startExtendRightOperationFromDate:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_suspendRightBoundaryDate:", *(_QWORD *)(a1 + 40));
}

- (void)_suspendRightBoundaryDate:(id)a3
{
  id v4;
  NTKDelayedBlock *v5;
  id v6;
  NTKDelayedBlock *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void *v11;
  NTKLocalTimelineComplicationController *v12;
  id v13;

  v4 = a3;
  -[NSMutableSet addObject:](self->_suspendedRightBoundaryDates, "addObject:", v4);
  v5 = [NTKDelayedBlock alloc];
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __68__NTKLocalTimelineComplicationController__suspendRightBoundaryDate___block_invoke;
  v11 = &unk_1E6BD8A88;
  v12 = self;
  v13 = v4;
  v6 = v4;
  v7 = -[NTKDelayedBlock initWithDelay:action:](v5, "initWithDelay:action:", &v8, 120.0);
  -[NSMutableSet addObject:](self->_delayedBlocks, "addObject:", v7, v8, v9, v10, v11, v12);

}

uint64_t __68__NTKLocalTimelineComplicationController__suspendRightBoundaryDate___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "removeObject:", a2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "removeObject:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_extendTimelineIfNecessaryAndPossible");
}

- (void)_cancelDelayedBlocks
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_delayedBlocks;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "cancel", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[NSMutableSet removeAllObjects](self->_delayedBlocks, "removeAllObjects");
}

- (void)_completeExtendRightOperationWithBoundaryDate:(id)a3 entries:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NTKTimelineDataOperation *currentOperation;
  CLKCComplicationDataSource *dataSource;
  NTKTimelineDataOperation *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  NTKTimelineDataOperation *v23;
  __int16 v24;
  CLKCComplicationDataSource *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    currentOperation = self->_currentOperation;
    dataSource = self->_dataSource;
    *(_DWORD *)buf = 138412802;
    v23 = currentOperation;
    v24 = 2112;
    v25 = dataSource;
    v26 = 2048;
    v27 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_1B72A3000, v8, OS_LOG_TYPE_DEFAULT, "Timeline extend right operation %@ completed for %@ with %lu entries", buf, 0x20u);
  }

  v11 = self->_currentOperation;
  self->_currentOperation = 0;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16++), "finalize", (_QWORD)v17);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v14);
  }

  -[TLTimeline extendTimelineFromDate:withEntries:](self->_timeline, "extendTimelineFromDate:withEntries:", v6, v12);
  -[NTKLocalTimelineComplicationController _extendTimelineIfNecessaryAndPossible](self, "_extendTimelineIfNecessaryAndPossible");

}

- (void)_startExtendRightOperationFromDate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  +[NTKTimelineDataOperation operationWithLocalDataSource:](NTKTimelineExtendDataOperation, "operationWithLocalDataSource:", self->_dataSource);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExtendsRightFromDate:", v4);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__NTKLocalTimelineComplicationController__startExtendRightOperationFromDate___block_invoke;
  v7[3] = &unk_1E6BD8AB0;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "setHandler:", v7);
  objc_storeStrong((id *)&self->_currentOperation, v5);
  objc_msgSend(v5, "start");

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __77__NTKLocalTimelineComplicationController__startExtendRightOperationFromDate___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_completeExtendRightOperationWithBoundaryDate:entries:", *(_QWORD *)(a1 + 32), v4);

}

- (BOOL)hasTapAction
{
  return -[CLKCComplicationDataSource supportsTapAction](self->_dataSource, "supportsTapAction");
}

- (void)didTouchDownInView:(id)a3
{
  -[CLKCComplicationDataSource didTouchDownInView:](self->_dataSource, "didTouchDownInView:", a3);
}

- (void)didTouchUpInsideView:(id)a3
{
  -[CLKCComplicationDataSource didTouchUpInsideView:](self->_dataSource, "didTouchUpInsideView:", a3);
}

- (id)complicationApplicationIdentifier
{
  return -[CLKCComplicationDataSource complicationApplicationIdentifier](self->_dataSource, "complicationApplicationIdentifier");
}

- (Class)richComplicationDisplayViewClass
{
  CLKCComplicationDataSource *dataSource;
  void *v4;
  void *v5;
  id v6;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    dataSource = self->_dataSource;
    -[NTKComplicationController device](self, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)-[CLKCComplicationDataSource richComplicationDisplayViewClassForDevice:](dataSource, "richComplicationDisplayViewClassForDevice:", v4);

    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (Class)v6;
}

- (id)_currentEntry
{
  return -[TLTimeline nowEntry](self->_timeline, "nowEntry");
}

- (id)activeDisplayTemplateForDisplayWrapper:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  CLKComplicationTemplate *v7;
  void *v8;
  CLKComplicationTemplate *v9;
  CLKComplicationTemplate *switcherTemplate;

  -[NTKComplicationController displayPropertiesForDisplayWrapper:](self, "displayPropertiesForDisplayWrapper:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "showPreview");

  if (v5
    && (-[CLKCComplicationDataSource sampleTemplate](self->_dataSource, "sampleTemplate"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    -[CLKCComplicationDataSource sampleTemplate](self->_dataSource, "sampleTemplate");
    v7 = (CLKComplicationTemplate *)objc_claimAutoreleasedReturnValue();
  }
  else if (!-[NTKComplicationController showsLockedUI](self, "showsLockedUI")
         || (-[NTKLocalTimelineComplicationController lockedTemplate](self, "lockedTemplate"),
             (v7 = (CLKComplicationTemplate *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (!-[CLKCComplicationDataSource alwaysShowIdealizedTemplateInSwitcher](self->_dataSource, "alwaysShowIdealizedTemplateInSwitcher")|| -[NTKComplicationController effectiveFaceDataMode](self, "effectiveFaceDataMode") != 3|| (v7 = self->_switcherTemplate) == 0)
    {
      -[NTKLocalTimelineComplicationController _currentEntry](self, "_currentEntry");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "complicationTemplate");
      v9 = (CLKComplicationTemplate *)objc_claimAutoreleasedReturnValue();
      switcherTemplate = v9;
      if (!v9)
        switcherTemplate = self->_switcherTemplate;
      v7 = switcherTemplate;

    }
  }
  return v7;
}

- (id)lockedTemplate
{
  void *v2;

  -[CLKCComplicationDataSource lockedTemplate](self->_dataSource, "lockedTemplate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finalize");
  return v2;
}

- (void)_updateDimStateForCurrentTimeline
{
  void *v3;
  NSDate *timelineEndDate;
  NSDate *v5;
  BOOL v6;
  NSDate *v7;
  _QWORD v8[4];
  BOOL v9;

  if (self->_timeTravelDate)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_supportsTimeTravelForward)
    {
      timelineEndDate = self->_timelineEndDate;
      if (timelineEndDate)
      {
        v5 = timelineEndDate;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
        v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    v7 = v5;
    v6 = -[NSDate compare:](self->_timeTravelDate, "compare:", v3) != NSOrderedDescending
      || -[NSDate compare:](self->_timeTravelDate, "compare:", v7) != NSOrderedAscending;

  }
  else
  {
    v6 = 0;
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__NTKLocalTimelineComplicationController__updateDimStateForCurrentTimeline__block_invoke;
  v8[3] = &__block_descriptor_33_e43_v16__0__NTKComplicationDisplayWrapperView_8l;
  v9 = v6;
  -[NTKComplicationController enumerateDisplayWrappersWithBlock:](self, "enumerateDisplayWrappersWithBlock:", v8);
}

uint64_t __75__NTKLocalTimelineComplicationController__updateDimStateForCurrentTimeline__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDimmed:", *(unsigned __int8 *)(a1 + 32));
}

- (CLKComplicationTemplate)sharingTemplate
{
  CLKComplicationTemplate *v3;
  CLKComplicationTemplate *v4;
  CLKComplicationTemplate *switcherTemplate;
  CLKComplicationTemplate *v6;

  -[CLKCComplicationDataSource sampleTemplate](self->_dataSource, "sampleTemplate");
  v3 = (CLKComplicationTemplate *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    -[CLKComplicationTemplate finalize](v3, "finalize");
    switcherTemplate = v4;
  }
  else
  {
    switcherTemplate = self->_switcherTemplate;
  }
  v6 = switcherTemplate;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_switcherTemplate, 0);
  objc_storeStrong((id *)&self->_delayedBlocks, 0);
  objc_storeStrong((id *)&self->_suspendedRightBoundaryDates, 0);
  objc_storeStrong((id *)&self->_currentOperation, 0);
  objc_storeStrong((id *)&self->_timeline, 0);
  objc_storeStrong((id *)&self->_timelineEndDate, 0);
  objc_storeStrong((id *)&self->_timeTravelDate, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

- (void)setDisplayProperties:(NSObject *)a3 forDisplayWrapper:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  NTKFaceDataModeDescription(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_debug_impl(&dword_1B72A3000, a3, OS_LOG_TYPE_DEBUG, "Updating %@ to data mode to \"%@\", (uint8_t *)&v6, 0x16u);

}

@end
