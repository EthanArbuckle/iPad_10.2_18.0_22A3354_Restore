@implementation NTKPeopleComplicationDataSource

- (NTKPeopleComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  id v9;
  NTKPeopleComplicationDataSource *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  uint64_t v14;
  void *switcherEntry;
  NTKPeopleComplicationEntry *v16;
  void *v17;
  uint64_t v18;
  NTKPeopleComplicationEntry *v19;
  objc_super v21;

  v9 = a3;
  v21.receiver = self;
  v21.super_class = (Class)NTKPeopleComplicationDataSource;
  v10 = -[CLKCComplicationDataSource initWithComplication:family:forDevice:](&v21, sel_initWithComplication_family_forDevice_, v9, a4, a5);
  if (v10)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.NanoTimeKit.NTKPeopleComplicationDataSource", v11);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v10->_complication, a3);
    if (NTKIsDaemonOrFaceSnapshotService())
    {
      -[NTKPeopleComplicationDataSource _loadTimelineEntry](v10, "_loadTimelineEntry");
      v14 = objc_claimAutoreleasedReturnValue();
      switcherEntry = v10->_switcherEntry;
      v10->_switcherEntry = (NTKPeopleComplicationEntry *)v14;
    }
    else
    {
      v16 = [NTKPeopleComplicationEntry alloc];
      objc_msgSend(v9, "fullName");
      switcherEntry = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "abbreviation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[NTKPeopleComplicationEntry initWithFullName:abbreviation:profileImage:](v16, "initWithFullName:abbreviation:profileImage:", switcherEntry, v17, 0);
      v19 = v10->_switcherEntry;
      v10->_switcherEntry = (NTKPeopleComplicationEntry *)v18;

    }
    v10->_isPaused = 0;
    v10->_needsInvalidation = 1;
    -[NTKPeopleComplicationDataSource _setupNotifications](v10, "_setupNotifications");

  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[NTKPeopleComplicationDataSource _tearDownNotifications](self, "_tearDownNotifications");
  v3.receiver = self;
  v3.super_class = (Class)NTKPeopleComplicationDataSource;
  -[NTKPeopleComplicationDataSource dealloc](&v3, sel_dealloc);
}

- (BOOL)supportsTapAction
{
  return 1;
}

- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(id, void *);

  v9 = (void (**)(id, void *))a5;
  -[NTKPeopleComplication storeBackedContactID](self->_complication, "storeBackedContactID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("contact://show?id="), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  v9[2](v9, v8);

}

- (unint64_t)timelineAnimationBehavior
{
  return 0;
}

- (void)getCurrentTimelineEntryWithHandler:(id)a3
{
  void (**v4)(id, void *);
  NTKPeopleComplicationEntry *timelineEntry;
  void *v6;
  NSObject *queue;
  _QWORD block[5];

  v4 = (void (**)(id, void *))a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  timelineEntry = self->_timelineEntry;
  if (timelineEntry)
  {
    -[NTKTimelineEntryModel entryForComplicationFamily:](timelineEntry, "entryForComplicationFamily:", -[CLKCComplicationDataSource family](self, "family"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v6);

  }
  else
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__NTKPeopleComplicationDataSource_getCurrentTimelineEntryWithHandler___block_invoke;
    block[3] = &unk_1E6BCD5F0;
    block[4] = self;
    dispatch_async(queue, block);
  }

}

uint64_t __70__NTKPeopleComplicationDataSource_getCurrentTimelineEntryWithHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_reloadTimelineEntry");
}

- (id)lockedTemplate
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (NTKIsDaemonOrFaceSnapshotService())
  {
    _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[NTKPeopleComplication contactID](self->_complication, "contactID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "People complication: asked for lockedEntry in daemon for id: %@", (uint8_t *)&v9, 0xCu);

    }
  }
  +[NTKPeopleComplicationEntry lockedEntry](NTKPeopleComplicationEntry, "lockedEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entryForComplicationFamily:", -[CLKCComplicationDataSource family](self, "family"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "complicationTemplate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)currentSwitcherTemplate
{
  NTKPeopleComplicationEntry *timelineEntry;
  NSObject *queue;
  void *v5;
  void *v6;
  _QWORD block[5];

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  timelineEntry = self->_timelineEntry;
  if (!timelineEntry)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__NTKPeopleComplicationDataSource_currentSwitcherTemplate__block_invoke;
    block[3] = &unk_1E6BCD5F0;
    block[4] = self;
    dispatch_async(queue, block);
    timelineEntry = self->_switcherEntry;
  }
  -[NTKTimelineEntryModel entryForComplicationFamily:](timelineEntry, "entryForComplicationFamily:", -[CLKCComplicationDataSource family](self, "family"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "complicationTemplate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __58__NTKPeopleComplicationDataSource_currentSwitcherTemplate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_reloadTimelineEntry");
}

- (id)complicationApplicationIdentifier
{
  return CFSTR("com.apple.NanoPhone");
}

- (void)resume
{
  void *v3;

  self->_isPaused = 0;
  +[NTKPeopleComplicationContactsCache sharedCache](NTKPeopleComplicationContactsCache, "sharedCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setupNotificationsIfNecessary");

  -[NTKPeopleComplicationDataSource _invalidateIfNeeded](self, "_invalidateIfNeeded");
}

- (void)pause
{
  self->_isPaused = 1;
}

+ (BOOL)acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4
{
  return a3 == 37;
}

+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  BOOL result;

  result = 1;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 8 && *MEMORY[0x1E0C93E90] != a3)
  {
    if ((unint64_t)a3 <= 0xC)
      return (0x1495u >> a3) & 1;
    else
      return 0;
  }
  return result;
}

+ (int64_t)tritiumUpdatePriority
{
  return 1;
}

- (void)_invalidateIfNeeded
{
  void *v3;
  void *v4;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (self->_needsInvalidation)
  {
    -[CLKCComplicationDataSource delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidateEntries");

    -[CLKCComplicationDataSource delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidateSwitcherTemplate");

    self->_needsInvalidation = 0;
  }
}

- (void)_queue_reloadTimelineEntry
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NTKPeopleComplicationDataSource _loadTimelineEntry](self, "_loadTimelineEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __61__NTKPeopleComplicationDataSource__queue_reloadTimelineEntry__block_invoke;
    v5[3] = &unk_1E6BCD778;
    v5[4] = self;
    v6 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  }
}

uint64_t __61__NTKPeopleComplicationDataSource__queue_reloadTimelineEntry__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), *(id *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 57) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateIfNeeded");
}

- (id)_loadTimelineEntry
{
  void *v3;
  NTKPeopleComplication **p_complication;
  void *v5;
  void *v6;
  NSObject *v7;
  __CFString *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  const __CFString *v14;
  NTKPeopleComplicationEntry *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NTKPeopleComplicationEntry *v22;
  const __CFString *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v32;
  void *v33;
  __int16 v34;
  const __CFString *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  +[NTKPeopleComplicationContactsCache sharedCache](NTKPeopleComplicationContactsCache, "sharedCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_complication = &self->_complication;
  -[NTKPeopleComplication storeBackedContactID](self->_complication, "storeBackedContactID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contactForId:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v3, "fullNameForContact:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "abbreviatedNameForContact:", v6);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (objc_msgSend(v6, "isKeyAvailable:", *MEMORY[0x1E0C96890])
        && (objc_msgSend(v6, "thumbnailImageData"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            v9,
            v9))
      {
        v10 = objc_alloc(MEMORY[0x1E0DC3870]);
        objc_msgSend(v6, "thumbnailImageData");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "initWithData:", v11);

        _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = CFSTR("No");
          if (!v12)
            v14 = CFSTR("Yes");
          v32 = 138412546;
          v33 = v5;
          v34 = 2112;
          v35 = v14;
          _os_log_impl(&dword_1B72A3000, v13, OS_LOG_TYPE_DEFAULT, "People complication: is _roundedProfileImageFromImage for id: %@ nil? %@", (uint8_t *)&v32, 0x16u);
        }
      }
      else
      {
        _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[NTKPeopleComplicationDataSource _loadTimelineEntry].cold.3((uint64_t)v5, v13, v16, v17, v18, v19, v20, v21);
        v12 = 0;
      }

      v22 = [NTKPeopleComplicationEntry alloc];
      if (v8)
        v23 = v8;
      else
        v23 = &stru_1E6BDC918;
      v15 = -[NTKPeopleComplicationEntry initWithFullName:abbreviation:profileImage:](v22, "initWithFullName:abbreviation:profileImage:", v7, v23, v12);
    }
    else
    {
      _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[NTKPeopleComplicationDataSource _loadTimelineEntry].cold.2(v12, v24, v25, v26, v27, v28, v29, v30);
      v15 = 0;
    }

  }
  else
  {
    _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[NTKPeopleComplicationDataSource _loadTimelineEntry].cold.1((id *)p_complication, (uint64_t)v5, v7);
    v15 = 0;
  }

  return v15;
}

- (void)_setupNotifications
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "%@ _setupNotifications,addObserver", (uint8_t *)&v7, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__didReceiveContactsCachceChangedNotification, CFSTR("NTKPeopleComplicationContactsCacheDidChangeNotification"), 0);

}

- (void)_tearDownNotifications
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "%@ tearDownNotification,removeObserver", (uint8_t *)&v7, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

}

- (void)_didReceiveContactsCachceChangedNotification
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v9 = v5;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "%@ _didReceiveContactsCachceChangedNotification", buf, 0xCu);

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__NTKPeopleComplicationDataSource__didReceiveContactsCachceChangedNotification__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __79__NTKPeopleComplicationDataSource__didReceiveContactsCachceChangedNotification__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_reloadTimelineEntry");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_switcherEntry, 0);
  objc_storeStrong((id *)&self->_timelineEntry, 0);
  objc_storeStrong((id *)&self->_storeBackedContactID, 0);
  objc_storeStrong((id *)&self->_secondaryContactID, 0);
  objc_storeStrong((id *)&self->_complication, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_loadTimelineEntry
{
  OUTLINED_FUNCTION_0(&dword_1B72A3000, a2, a3, "People complication: contact thumbnailImageData is nil for id: %@", a5, a6, a7, a8, 2u);
}

@end
