@implementation AVDelegatingPlaybackCoordinator

- (void)_setIsInExpanseMediaPlaybackOnAVAudioSession
{
  void *v3;
  NSObject *ivarAccessQueue;
  int v5;
  uint64_t v6;
  _QWORD block[8];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__AVDelegatingPlaybackCoordinator__setIsInExpanseMediaPlaybackOnAVAudioSession__block_invoke;
  block[3] = &unk_1E302FF70;
  block[6] = &v12;
  block[7] = &v8;
  block[4] = self;
  block[5] = v3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v5 = *((unsigned __int8 *)v13 + 24);
  if (*((unsigned __int8 *)v9 + 24) != v5 && v3)
  {
    v6 = 0;
    objc_msgSend(v3, "setIsExpanseMediaSession:error:", v5 != 0, &v6);
  }
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
}

uint64_t __79__AVDelegatingPlaybackCoordinator__setIsInExpanseMediaPlaybackOnAVAudioSession__block_invoke(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;
  int v4;

  result = objc_msgSend(*(id *)(a1[4] + 88), "count");
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result != 0;
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = *(_BYTE *)(a1[4] + 160);
  v3 = a1[4];
  v4 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
  if (*(unsigned __int8 *)(v3 + 160) != v4)
  {
    if (a1[5])
      *(_BYTE *)(v3 + 160) = v4;
  }
  return result;
}

- (void)_prepareToInitiatePlayback
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier");
  objc_msgSend(v2, "setAttribute:forKey:error:", v3, *MEMORY[0x1E0D47E80], 0);
}

- (AVDelegatingPlaybackCoordinator)initWithPlaybackControlDelegate:(id)playbackControlDelegate
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  OpaqueFigTimelineCoordinator *v16;
  uint64_t v17;
  void *v18;
  OpaqueFigTimelineCoordinator *v19;
  void *v20;
  OpaqueFigTimelineCoordinator *v21;
  OpaqueFigTimelineCoordinator **p_figTimelineCoordinator;
  AVDelegatingPlaybackCoordinator *val;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id location;
  __int128 v32;
  __int128 v33;
  void (*v34)(void *, uint64_t, uint64_t, void (*)(uint64_t));
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  objc_super v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v42.receiver = self;
  v42.super_class = (Class)AVDelegatingPlaybackCoordinator;
  val = -[AVPlaybackCoordinator initInternal](&v42, sel_initInternal);
  if (!val)
    return 0;
  v4 = *MEMORY[0x1E0C9AE50];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CA52F8]);
  v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  val->_timelineControlQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.avdelegatingplaybackcoordinator.timelinecontrol", v5);
  v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  val->_figTimelineCoordinatorConfigQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avdelegatingplaybackcoordinator.figtimelinecoordinator.config", v6);
  v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  val->_currentItemIDConfigQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avdelegatingplaybackcoordinator.currentitemidentifier.config", v7);
  val->_ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avfoundation.avdelegatingplaybackcoordinator.ivars");
  objc_storeWeak((id *)&val->_delegate, playbackControlDelegate);
  val->_controlStates = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  val->_participantStates = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  val->_otherParticipants = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  val->_suspensionReasons = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  val->_participantLimitPerSuspensionReason = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  val->_suspensionReasonsThatTriggerWaiting = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", CFSTR("AVCoordinatedPlaybackSuspensionReasonUserIsChangingCurrentTime"), 0);
  val->_waitingPoliciesArray = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  val->_pauseSnapsToMediaTimeOfOriginator = 1;
  v39 = xmmword_1E3032918;
  v40 = *(_OWORD *)&off_1E3032928;
  v41 = xmmword_1E3032938;
  p_figTimelineCoordinator = &val->_figTimelineCoordinator;
  if (FigTimelineCoordinatorCreate())
    goto LABEL_12;
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v9 = -[AVDelegatingPlaybackCoordinator suspensionReasonsThatTriggerWaiting](val, "suspensionReasonsThatTriggerWaiting");
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v36;
    v12 = *MEMORY[0x1E0CA53F0];
    v13 = *MEMORY[0x1E0CA53E8];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v36 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(v8, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", AVPlaybackCoordinatorFigSuspensionReasonForAVFReason(*(void **)(*((_QWORD *)&v35 + 1) + 8 * i)), v12, v4, v13, 0));
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v10);
  }
  -[AVDelegatingPlaybackCoordinator _updateWaitingPoliciesArray:withPolicies:](val, "_updateWaitingPoliciesArray:withPolicies:", val->_waitingPoliciesArray, v8);
  -[AVDelegatingPlaybackCoordinator _setWaitingPolicies:](val, "_setWaitingPolicies:", val->_waitingPoliciesArray);
  v32 = xmmword_1E3032948;
  v33 = *(_OWORD *)off_1E3032958;
  v34 = AVDelegatingPlaybackCoordinatorAsynchronouslyReloadTimelineStateCallback;
  if (FigTimelineCoordinatorSetWeakMediumAndCallbacks())
  {
LABEL_12:

    return 0;
  }
  objc_initWeak(&location, val);
  v15 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v16 = *p_figTimelineCoordinator;
  v17 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __67__AVDelegatingPlaybackCoordinator_initWithPlaybackControlDelegate___block_invoke;
  v29[3] = &unk_1E302FA38;
  objc_copyWeak(&v30, &location);
  val->_suspensionsChangedNotificationToken = (id)objc_msgSend(v15, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x1E0CA5358], v16, 0, v29);
  v18 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v19 = *p_figTimelineCoordinator;
  v27[0] = v17;
  v27[1] = 3221225472;
  v27[2] = __67__AVDelegatingPlaybackCoordinator_initWithPlaybackControlDelegate___block_invoke_2;
  v27[3] = &unk_1E302FA38;
  objc_copyWeak(&v28, &location);
  val->_participantsChangedNotificationToken = (id)objc_msgSend(v18, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x1E0CA5350], v19, 0, v27);
  v20 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v21 = *p_figTimelineCoordinator;
  v25[0] = v17;
  v25[1] = 3221225472;
  v25[2] = __67__AVDelegatingPlaybackCoordinator_initWithPlaybackControlDelegate___block_invoke_3;
  v25[3] = &unk_1E302FA38;
  objc_copyWeak(&v26, &location);
  val->_didIssueCommandToPlaybackObjectNotificationToken = (id)objc_msgSend(v20, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x1E0CA5348], v21, 0, v25);
  -[AVDelegatingPlaybackCoordinator applyFigPauseSnapsToMediaTimeOfOriginator](val, "applyFigPauseSnapsToMediaTimeOfOriginator");
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
  return val;
}

uint64_t __67__AVDelegatingPlaybackCoordinator_initWithPlaybackControlDelegate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t result;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(a2, "userInfo");
  result = objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CA5340]);
  if (result)
  {
    v5 = (void *)result;
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v5);
          objc_msgSend(v6, "addObject:", AVPlaybackCoordinatorAVFSuspensionReasonForFigReason(*(__CFString **)(*((_QWORD *)&v11 + 1) + 8 * v10++)));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }
    return objc_msgSend(objc_loadWeak((id *)(a1 + 32)), "_updateSuspensionReasons:", v6);
  }
  return result;
}

uint64_t __67__AVDelegatingPlaybackCoordinator_initWithPlaybackControlDelegate___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t result;

  v3 = (void *)objc_msgSend(a2, "userInfo");
  result = objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CA5338]);
  if (result)
    return objc_msgSend(objc_loadWeak((id *)(a1 + 32)), "_updateOtherParticipantsUsingFigParticipantUUIDs:", result);
  return result;
}

uint64_t __67__AVDelegatingPlaybackCoordinator_initWithPlaybackControlDelegate___block_invoke_3(uint64_t a1, void *a2)
{
  id Weak;

  Weak = objc_loadWeak((id *)(a1 + 32));
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", CFSTR("AVPlaybackCoordinatorDidIssueCommandToPlaybackObjectNotification"), Weak, AVPlaybackCoordinatorMakeUserInfoForDidIssueCommandToPlaybackObjectNotification((void *)objc_msgSend(a2, "userInfo"))));
}

- (void)dealloc
{
  NSObject *timelineControlQueue;
  NSObject *ivarAccessQueue;
  NSObject *figTimelineCoordinatorConfigQueue;
  NSObject *currentItemIDConfigQueue;
  OpaqueFigTimelineCoordinator *figTimelineCoordinator;
  objc_super v8;

  if (self->_suspensionsChangedNotificationToken)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self->_suspensionsChangedNotificationToken);

  }
  if (self->_participantsChangedNotificationToken)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self->_participantsChangedNotificationToken);

  }
  if (self->_didIssueCommandToPlaybackObjectNotificationToken)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self->_didIssueCommandToPlaybackObjectNotificationToken);

  }
  timelineControlQueue = self->_timelineControlQueue;
  if (timelineControlQueue)
    dispatch_release(timelineControlQueue);
  ivarAccessQueue = self->_ivarAccessQueue;
  if (ivarAccessQueue)
    dispatch_release(ivarAccessQueue);
  figTimelineCoordinatorConfigQueue = self->_figTimelineCoordinatorConfigQueue;
  if (figTimelineCoordinatorConfigQueue)
    dispatch_release(figTimelineCoordinatorConfigQueue);
  currentItemIDConfigQueue = self->_currentItemIDConfigQueue;
  if (currentItemIDConfigQueue)
    dispatch_release(currentItemIDConfigQueue);
  figTimelineCoordinator = self->_figTimelineCoordinator;
  if (figTimelineCoordinator)
    CFRelease(figTimelineCoordinator);
  v8.receiver = self;
  v8.super_class = (Class)AVDelegatingPlaybackCoordinator;
  -[AVDelegatingPlaybackCoordinator dealloc](&v8, sel_dealloc);
}

- (id)playbackControlDelegate
{
  return objc_loadWeak((id *)&self->_delegate);
}

- (id)_figTimelineCoordinatorConfigQueue
{
  return self->_figTimelineCoordinatorConfigQueue;
}

- (void)coordinateRateChangeToRate:(float)rate options:(AVDelegatingPlaybackCoordinatorRateChangeOptions)options
{
  FigTimelineCoordinatorCoordinateRateChange();
}

- (void)coordinateSeekToTime:(CMTime *)time options:(AVDelegatingPlaybackCoordinatorSeekOptions)options
{
  FigTimelineCoordinatorCoordinateJumpToTime();
}

- (NSString)currentItemIdentifier
{
  NSObject *ivarAccessQueue;
  NSString *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__12;
  v10 = __Block_byref_object_dispose__12;
  v11 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__AVDelegatingPlaybackCoordinator_currentItemIdentifier__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __56__AVDelegatingPlaybackCoordinator_currentItemIdentifier__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)transitionToItemWithIdentifier:(NSString *)itemIdentifier proposingInitialTimingBasedOnTimebase:(CMTimebaseRef)snapshotTimebase
{
  NSObject *ivarAccessQueue;
  uint64_t v7;
  NSObject *currentItemIDConfigQueue;
  _QWORD v9[6];
  _QWORD block[6];

  ivarAccessQueue = self->_ivarAccessQueue;
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __104__AVDelegatingPlaybackCoordinator_transitionToItemWithIdentifier_proposingInitialTimingBasedOnTimebase___block_invoke;
  block[3] = &unk_1E302FCE8;
  block[4] = self;
  block[5] = itemIdentifier;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  currentItemIDConfigQueue = self->_currentItemIDConfigQueue;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __104__AVDelegatingPlaybackCoordinator_transitionToItemWithIdentifier_proposingInitialTimingBasedOnTimebase___block_invoke_2;
  v9[3] = &unk_1E302FE78;
  v9[4] = self;
  v9[5] = snapshotTimebase;
  dispatch_sync(currentItemIDConfigQueue, v9);
}

uint64_t __104__AVDelegatingPlaybackCoordinator_transitionToItemWithIdentifier_proposingInitialTimingBasedOnTimebase___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 40), "copy");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144) = result;
  return result;
}

uint64_t __104__AVDelegatingPlaybackCoordinator_transitionToItemWithIdentifier_proposingInitialTimingBasedOnTimebase___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "currentItemIdentifier");
  return FigTimelineCoordinatorHandleTransitionToNewTimelineFromTimelineControl();
}

- (void)reapplyCurrentItemStateToPlaybackControlDelegate
{
  FigTimelineCoordinatorReapplyGroupStateViaTimelineControl();
}

- (id)avfParticipantsForFigParticipantsUUIDs:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id NSUUIDFromCFUUID;
  void *v9;
  _BOOL8 v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  AVCoordinatedPlaybackParticipant *v16;
  id obj;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  CFTypeRef cf;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v19 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = a3;
  v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(obj);
        NSUUIDFromCFUUID = AVPlaybackCoordinatorGetNSUUIDFromCFUUID(*(CFUUIDRef *)(*((_QWORD *)&v25 + 1) + 8 * i));
        v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        cf = 0;
        FigTimelineCoordinatorCopyParticipantSnapshotForUUID();
        if (cf)
        {
          v10 = FigTimelineCoordinationParticipantSnapshotIsReadyToSetNonZeroRate() != 0;
          v11 = (void *)FigTimelineCoordinationParticipantSnapshotCopySuspensionReasons();
          v20 = 0u;
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v21;
            do
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v21 != v14)
                  objc_enumerationMutation(v11);
                objc_msgSend(v9, "addObject:", AVPlaybackCoordinatorAVFSuspensionReasonForFigReason(*(__CFString **)(*((_QWORD *)&v20 + 1) + 8 * j)));
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
            }
            while (v13);
          }

          if (cf)
            CFRelease(cf);
        }
        else
        {
          v10 = 0;
        }
        v16 = -[AVCoordinatedPlaybackParticipant initWithParticipantIdentifier:readyToPlay:suspensionReasons:]([AVCoordinatedPlaybackParticipant alloc], "initWithParticipantIdentifier:readyToPlay:suspensionReasons:", NSUUIDFromCFUUID, v10, v9);
        objc_msgSend(v19, "addObject:", v16);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v5);
  }
  return v19;
}

- (void)_updateOtherParticipantsUsingFigParticipantUUIDs:(id)a3
{
  id v4;
  NSObject *ivarAccessQueue;
  uint64_t v6;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v4 = -[AVDelegatingPlaybackCoordinator avfParticipantsForFigParticipantsUUIDs:](self, "avfParticipantsForFigParticipantsUUIDs:", a3);
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__AVDelegatingPlaybackCoordinator__updateOtherParticipantsUsingFigParticipantUUIDs___block_invoke;
  block[3] = &unk_1E302FE00;
  block[4] = self;
  block[5] = v4;
  block[6] = &v8;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((_BYTE *)v9 + 24))
  {
    v6 = objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("AVPlaybackCoordinatorOtherParticipantsDidChangeNotification"), self);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v6);
    -[AVDelegatingPlaybackCoordinator _setIsInExpanseMediaPlaybackOnAVAudioSession](self, "_setIsInExpanseMediaPlaybackOnAVAudioSession");
  }
  _Block_object_dispose(&v8, 8);
}

uint64_t __84__AVDelegatingPlaybackCoordinator__updateOtherParticipantsUsingFigParticipantUUIDs___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = AVPlaybackCoordinatorArrayContainsSameElementsAsArray(*(_QWORD *)(a1[4] + 88), a1[5]);
  if ((result & 1) == 0)
  {

    result = objc_msgSend((id)a1[5], "copy");
    *(_QWORD *)(a1[4] + 88) = result;
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }
  return result;
}

- (id)otherParticipants
{
  NSObject *ivarAccessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__12;
  v10 = __Block_byref_object_dispose__12;
  v11 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__AVDelegatingPlaybackCoordinator_otherParticipants__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __52__AVDelegatingPlaybackCoordinator_otherParticipants__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)participantForIdentifier:(id)a3
{
  NSObject *ivarAccessQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__12;
  v11 = __Block_byref_object_dispose__12;
  v12 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__AVDelegatingPlaybackCoordinator_participantForIdentifier___block_invoke;
  block[3] = &unk_1E302FE00;
  block[4] = self;
  block[5] = a3;
  block[6] = &v7;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __60__AVDelegatingPlaybackCoordinator_participantForIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  id result;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[2] = __60__AVDelegatingPlaybackCoordinator_participantForIdentifier___block_invoke_2;
  v5[3] = &unk_1E3032978;
  v2 = a1[5];
  v3 = *(void **)(a1[4] + 88);
  v5[1] = 3221225472;
  v5[4] = v2;
  result = (id)objc_msgSend(v3, "indexOfObjectPassingTest:", v5);
  if (result != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    result = (id)objc_msgSend(*(id *)(a1[4] + 88), "objectAtIndexedSubscript:", result);
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
  }
  return result;
}

uint64_t __60__AVDelegatingPlaybackCoordinator_participantForIdentifier___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(a2, "identifier"), "isEqual:", *(_QWORD *)(a1 + 32));
  *a4 = result;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)expectedItemTimeAtHostTime:(SEL)a3
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)FigTimelineCoordinatorGetExpectedTimeAtHostTime();
}

- (void)setCoordinationMediumDelegate:(id)a3
{
  NSObject *ivarAccessQueue;
  uint64_t v5;
  NSObject *figTimelineCoordinatorConfigQueue;
  _QWORD v7[5];
  _QWORD block[6];

  ivarAccessQueue = self->_ivarAccessQueue;
  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__AVDelegatingPlaybackCoordinator_setCoordinationMediumDelegate___block_invoke;
  block[3] = &unk_1E302FCE8;
  block[4] = a3;
  block[5] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  figTimelineCoordinatorConfigQueue = self->_figTimelineCoordinatorConfigQueue;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __65__AVDelegatingPlaybackCoordinator_setCoordinationMediumDelegate___block_invoke_2;
  v7[3] = &unk_1E302FA10;
  v7[4] = self;
  dispatch_async(figTimelineCoordinatorConfigQueue, v7);
}

id __65__AVDelegatingPlaybackCoordinator_setCoordinationMediumDelegate___block_invoke(uint64_t a1)
{
  id Weak;
  void *v3;

  if (*(_QWORD *)(a1 + 32) && (Weak = objc_loadWeak((id *)(*(_QWORD *)(a1 + 40) + 152)), Weak == *(id *)(a1 + 32)))
  {
    v3 = Weak;
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "removeAllObjects");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "removeAllObjects");
    v3 = *(void **)(a1 + 32);
  }
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 40) + 152), v3);
}

void __65__AVDelegatingPlaybackCoordinator_setCoordinationMediumDelegate___block_invoke_2(uint64_t a1)
{
  CFUUIDRef CFUUIDFromNSUUID;

  CFUUIDFromNSUUID = AVPlaybackCoordinatorCreateCFUUIDFromNSUUID((CFUUIDRef)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "coordinationMediumDelegate"), "localParticipantUUIDForPlaybackCoordinator:", *(_QWORD *)(a1 + 32)));
  FigTimelineCoordinatorHandleAssignmentOfUUIDToLocalParticipantByMedium();
  if (CFUUIDFromNSUUID)
    CFRelease(CFUUIDFromNSUUID);
}

- (id)coordinationMediumDelegate
{
  NSObject *ivarAccessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__12;
  v10 = __Block_byref_object_dispose__12;
  v11 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__AVDelegatingPlaybackCoordinator_coordinationMediumDelegate__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __61__AVDelegatingPlaybackCoordinator_coordinationMediumDelegate__block_invoke(uint64_t a1)
{
  id result;

  result = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 152));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setMediumLoggingIdentifier:(id)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v4[6];

  ivarAccessQueue = self->_ivarAccessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__AVDelegatingPlaybackCoordinator_setMediumLoggingIdentifier___block_invoke;
  v4[3] = &unk_1E302FCE8;
  v4[4] = a3;
  v4[5] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

uint64_t __62__AVDelegatingPlaybackCoordinator_setMediumLoggingIdentifier___block_invoke(uint64_t result)
{
  void *v1;
  uint64_t v2;

  v1 = *(void **)(*(_QWORD *)(result + 40) + 168);
  if (*(void **)(result + 32) != v1)
  {
    v2 = result;

    result = objc_msgSend(*(id *)(v2 + 32), "copy");
    *(_QWORD *)(*(_QWORD *)(v2 + 40) + 168) = result;
  }
  return result;
}

- (id)mediumLoggingIdentifier
{
  NSObject *ivarAccessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__12;
  v10 = __Block_byref_object_dispose__12;
  v11 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__AVDelegatingPlaybackCoordinator_mediumLoggingIdentifier__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __58__AVDelegatingPlaybackCoordinator_mediumLoggingIdentifier__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)trackedTransportControlStateDictionaries
{
  NSObject *ivarAccessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__12;
  v10 = __Block_byref_object_dispose__12;
  v11 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__AVDelegatingPlaybackCoordinator_trackedTransportControlStateDictionaries__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __75__AVDelegatingPlaybackCoordinator_trackedTransportControlStateDictionaries__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_updateTransportControlStateDictionaryWithTransportControlState:(id)a3
{
  uint64_t v5;
  NSObject *ivarAccessQueue;
  _QWORD block[7];

  v5 = objc_msgSend(-[AVDelegatingPlaybackCoordinator coordinationMediumDelegate](self, "coordinationMediumDelegate"), "localParticipantUUIDForPlaybackCoordinator:", self);
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__AVDelegatingPlaybackCoordinator__updateTransportControlStateDictionaryWithTransportControlState___block_invoke;
  block[3] = &unk_1E302FD88;
  block[4] = a3;
  block[5] = self;
  block[6] = v5;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
}

void __99__AVDelegatingPlaybackCoordinator__updateTransportControlStateDictionaryWithTransportControlState___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  int v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v2 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("Identifier"));
  v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "objectForKeyedSubscript:", v2);
  if (!v3)
    goto LABEL_9;
  v4 = v3;
  v5 = objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("LamportTimestamp")), "intValue");
  v6 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("LamportTimestamp")), "intValue");
  if ((objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("IsAuthoritative")), "BOOLValue") & 1) != 0|| v6 > v5)
  {
    goto LABEL_9;
  }
  if (v6 == v5)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("OriginatorUUID")));
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("OriginatorUUID")));
    v9 = objc_msgSend(v8, "compare:", v7);
    if (v9 == 1)
    {
LABEL_8:

LABEL_9:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), v2);
      return;
    }
    if (!v9)
    {
      if ((objc_msgSend(v8, "isEqual:", *(_QWORD *)(a1 + 48)) & 1) != 0)
        goto LABEL_8;
      if (dword_1ECDECDF8)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }

  }
  else if (dword_1ECDECDF8)
  {
    v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (id)_transportControlStateForItemIdentifier:(id)a3
{
  NSObject *ivarAccessQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__12;
  v11 = __Block_byref_object_dispose__12;
  v12 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__AVDelegatingPlaybackCoordinator__transportControlStateForItemIdentifier___block_invoke;
  block[3] = &unk_1E3030FB8;
  block[5] = a3;
  block[6] = &v7;
  block[4] = self;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __75__AVDelegatingPlaybackCoordinator__transportControlStateForItemIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 96), "objectForKeyedSubscript:", a1[5]), "copy");
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
  return result;
}

- (void)_removeUnusedTransportControlStates
{
  NSObject *ivarAccessQueue;
  _QWORD block[5];

  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__AVDelegatingPlaybackCoordinator__removeUnusedTransportControlStates__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
}

uint64_t __70__AVDelegatingPlaybackCoordinator__removeUnusedTransportControlStates__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "allKeys");
  v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "allValues");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v12;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v2);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
        v10[0] = v7;
        v10[1] = 3221225472;
        v10[2] = __70__AVDelegatingPlaybackCoordinator__removeUnusedTransportControlStates__block_invoke_2;
        v10[3] = &unk_1E30329A0;
        v10[4] = v9;
        if (objc_msgSend(v3, "indexOfObjectPassingTest:", v10) == 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "removeObjectForKey:", v9);
        ++v8;
      }
      while (v5 != v8);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v5 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __70__AVDelegatingPlaybackCoordinator__removeUnusedTransportControlStates__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CurrentIdentifier")), "isEqualToString:", *(_QWORD *)(a1 + 32));
  *a4 = result;
  return result;
}

- (id)participantStates
{
  NSObject *ivarAccessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__12;
  v10 = __Block_byref_object_dispose__12;
  v11 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__AVDelegatingPlaybackCoordinator_participantStates__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __52__AVDelegatingPlaybackCoordinator_participantStates__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_updateParticipantStateDictionaryWithParticipantState:(id)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v4[6];

  ivarAccessQueue = self->_ivarAccessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __89__AVDelegatingPlaybackCoordinator__updateParticipantStateDictionaryWithParticipantState___block_invoke;
  v4[3] = &unk_1E302FCE8;
  v4[4] = self;
  v4[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

uint64_t __89__AVDelegatingPlaybackCoordinator__updateParticipantStateDictionaryWithParticipantState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("UUID")));
}

- (id)_participantStateForIdentifier:(id)a3
{
  NSObject *ivarAccessQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__12;
  v11 = __Block_byref_object_dispose__12;
  v12 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__AVDelegatingPlaybackCoordinator__participantStateForIdentifier___block_invoke;
  block[3] = &unk_1E3030FB8;
  block[5] = a3;
  block[6] = &v7;
  block[4] = self;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __66__AVDelegatingPlaybackCoordinator__participantStateForIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1[4] + 104), "objectForKeyedSubscript:", a1[5]), "copy");
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
  return result;
}

- (void)_removeParticipantStateWithIdentifier:(id)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v4[6];

  ivarAccessQueue = self->_ivarAccessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __73__AVDelegatingPlaybackCoordinator__removeParticipantStateWithIdentifier___block_invoke;
  v4[3] = &unk_1E302FCE8;
  v4[4] = self;
  v4[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

uint64_t __73__AVDelegatingPlaybackCoordinator__removeParticipantStateWithIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "removeObjectForKey:", objc_msgSend(*(id *)(a1 + 40), "UUIDString"));
}

- (void)_replaceParticipantStates:(id)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v4[6];

  ivarAccessQueue = self->_ivarAccessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__AVDelegatingPlaybackCoordinator__replaceParticipantStates___block_invoke;
  v4[3] = &unk_1E302FCE8;
  v4[4] = self;
  v4[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

uint64_t __61__AVDelegatingPlaybackCoordinator__replaceParticipantStates___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "removeAllObjects");
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v2 = *(void **)(a1 + 40);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setObject:forKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6), objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6), "objectForKeyedSubscript:", CFSTR("UUID")));
        ++v6;
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)handleNewTransportControlStateDictionary:(id)a3
{
  uint64_t v5;
  NSObject *figTimelineCoordinatorConfigQueue;
  _QWORD v7[6];

  -[AVDelegatingPlaybackCoordinator _updateTransportControlStateDictionaryWithTransportControlState:](self, "_updateTransportControlStateDictionaryWithTransportControlState:");
  v5 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Identifier"));
  figTimelineCoordinatorConfigQueue = self->_figTimelineCoordinatorConfigQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__AVDelegatingPlaybackCoordinator_handleNewTransportControlStateDictionary___block_invoke;
  v7[3] = &unk_1E302FCE8;
  v7[4] = self;
  v7[5] = v5;
  dispatch_async(figTimelineCoordinatorConfigQueue, v7);
}

uint64_t __76__AVDelegatingPlaybackCoordinator_handleNewTransportControlStateDictionary___block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  objc_msgSend(*(id *)(a1 + 32), "_transportControlStateForItemIdentifier:", *(_QWORD *)(a1 + 40));
  result = FigTimelineCoordinatorHandleUpdatedTimelineStateFromMedium();
  if ((_DWORD)result)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

- (void)handleNewParticipantStateDictionary:(id)a3
{
  uint64_t v5;
  NSObject *figTimelineCoordinatorConfigQueue;
  _QWORD v7[6];

  -[AVDelegatingPlaybackCoordinator _updateParticipantStateDictionaryWithParticipantState:](self, "_updateParticipantStateDictionaryWithParticipantState:");
  -[AVDelegatingPlaybackCoordinator _removeUnusedTransportControlStates](self, "_removeUnusedTransportControlStates");
  v5 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("UUID"));
  figTimelineCoordinatorConfigQueue = self->_figTimelineCoordinatorConfigQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__AVDelegatingPlaybackCoordinator_handleNewParticipantStateDictionary___block_invoke;
  v7[3] = &unk_1E302FCE8;
  v7[4] = self;
  v7[5] = v5;
  dispatch_async(figTimelineCoordinatorConfigQueue, v7);
}

uint64_t __71__AVDelegatingPlaybackCoordinator_handleNewParticipantStateDictionary___block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  objc_msgSend(*(id *)(a1 + 32), "_participantStateForIdentifier:", *(_QWORD *)(a1 + 40));
  result = FigTimelineCoordinatorHandleUpdatedParticipantStateFromMedium();
  if ((_DWORD)result)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

- (void)handleReplacementParticipantStateDictionaries:(id)a3
{
  NSObject *figTimelineCoordinatorConfigQueue;
  _QWORD block[5];

  -[AVDelegatingPlaybackCoordinator _replaceParticipantStates:](self, "_replaceParticipantStates:", a3);
  -[AVDelegatingPlaybackCoordinator _removeUnusedTransportControlStates](self, "_removeUnusedTransportControlStates");
  figTimelineCoordinatorConfigQueue = self->_figTimelineCoordinatorConfigQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__AVDelegatingPlaybackCoordinator_handleReplacementParticipantStateDictionaries___block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  dispatch_async(figTimelineCoordinatorConfigQueue, block);
}

uint64_t __81__AVDelegatingPlaybackCoordinator_handleReplacementParticipantStateDictionaries___block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "participantStates"), "allValues");
  result = FigTimelineCoordinatorHandleReplacementOfAllParticipantStatesFromMedium();
  if ((_DWORD)result)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

- (void)handleRemovalOfParticipant:(id)a3
{
  NSObject *figTimelineCoordinatorConfigQueue;
  _QWORD v6[6];

  -[AVDelegatingPlaybackCoordinator _removeParticipantStateWithIdentifier:](self, "_removeParticipantStateWithIdentifier:");
  -[AVDelegatingPlaybackCoordinator _removeUnusedTransportControlStates](self, "_removeUnusedTransportControlStates");
  figTimelineCoordinatorConfigQueue = self->_figTimelineCoordinatorConfigQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__AVDelegatingPlaybackCoordinator_handleRemovalOfParticipant___block_invoke;
  v6[3] = &unk_1E302FCE8;
  v6[4] = a3;
  v6[5] = self;
  dispatch_async(figTimelineCoordinatorConfigQueue, v6);
}

void __62__AVDelegatingPlaybackCoordinator_handleRemovalOfParticipant___block_invoke(uint64_t a1)
{
  CFUUIDRef CFUUIDFromNSUUID;

  CFUUIDFromNSUUID = AVPlaybackCoordinatorCreateCFUUIDFromNSUUID(*(CFUUIDRef *)(a1 + 32));
  FigTimelineCoordinatorHandleRemovalOfParticipantStateFromMedium();
  if (CFUUIDFromNSUUID)
    CFRelease(CFUUIDFromNSUUID);
}

- (void)_updateSuspensionReasons:(id)a3
{
  NSObject *ivarAccessQueue;
  uint64_t v5;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__AVDelegatingPlaybackCoordinator__updateSuspensionReasons___block_invoke;
  block[3] = &unk_1E302FE00;
  block[4] = self;
  block[5] = a3;
  block[6] = &v7;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((_BYTE *)v8 + 24))
  {
    v5 = objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("AVPlaybackCoordinatorSuspensionReasonsDidChangeNotification"), self);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v5);
  }
  _Block_object_dispose(&v7, 8);
}

uint64_t __60__AVDelegatingPlaybackCoordinator__updateSuspensionReasons___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = AVPlaybackCoordinatorArrayContainsSameElementsAsArray(*(_QWORD *)(a1[4] + 80), a1[5]);
  if ((result & 1) == 0)
  {

    result = objc_msgSend((id)a1[5], "copy");
    *(_QWORD *)(a1[4] + 80) = result;
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }
  return result;
}

- (id)suspensionReasons
{
  NSObject *ivarAccessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__12;
  v10 = __Block_byref_object_dispose__12;
  v11 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__AVDelegatingPlaybackCoordinator_suspensionReasons__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __52__AVDelegatingPlaybackCoordinator_suspensionReasons__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)beginSuspensionForReason:(id)a3
{
  AVCoordinatedPlaybackSuspension *v3;

  v3 = -[AVCoordinatedPlaybackSuspension initWithCoordinator:reason:]([AVCoordinatedPlaybackSuspension alloc], "initWithCoordinator:reason:", self, a3);
  -[AVCoordinatedPlaybackSuspension _figSuspension](v3, "_figSuspension");
  FigTimelineCoordinatorBeginSuspension();
  return v3;
}

- (void)_endSuspension:(OpaqueFigTimelineCoordinatorSuspension *)a3
{
  FigTimelineCoordinatorEndSuspension();
}

- (void)_endSuspension:(OpaqueFigTimelineCoordinatorSuspension *)a3 proposingNewTime:(id *)a4
{
  FigTimelineCoordinatorEndSuspensionProposingNewTime();
}

- (void)_updateWaitingPoliciesArray:(id)a3 withPolicies:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v5)
  {
    v6 = v5;
    v16 = *(_QWORD *)v22;
    v7 = *MEMORY[0x1E0CA53F0];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(a4);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v18;
          while (2)
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v18 != v12)
                objc_enumerationMutation(a3);
              v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * j);
              objc_msgSend(v14, "objectForKeyedSubscript:", v7);
              objc_msgSend(v9, "objectForKeyedSubscript:", v7);
              if (FigCFEqual())
              {
                if (v14)
                  objc_msgSend(a3, "removeObject:", v14);
                goto LABEL_17;
              }
            }
            v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
            if (v11)
              continue;
            break;
          }
        }
LABEL_17:
        objc_msgSend(a3, "addObject:", v9);
      }
      v6 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v6);
  }
}

- (id)_currentWaitingPoliciesArray
{
  NSObject *ivarAccessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__12;
  v10 = __Block_byref_object_dispose__12;
  v11 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__AVDelegatingPlaybackCoordinator__currentWaitingPoliciesArray__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __63__AVDelegatingPlaybackCoordinator__currentWaitingPoliciesArray__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_setWaitingPolicies:(id)a3
{
  FigTimelineCoordinatorSetProperty();
}

- (void)setParticipantLimit:(int64_t)a3 forWaitingOutSuspensionsWithReason:(id)a4
{
  NSObject *ivarAccessQueue;
  uint64_t v6;
  NSObject *figTimelineCoordinatorConfigQueue;
  _QWORD v8[5];
  _QWORD block[7];

  ivarAccessQueue = self->_ivarAccessQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__AVDelegatingPlaybackCoordinator_setParticipantLimit_forWaitingOutSuspensionsWithReason___block_invoke;
  block[3] = &unk_1E302FEE0;
  block[4] = self;
  block[5] = a4;
  block[6] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  figTimelineCoordinatorConfigQueue = self->_figTimelineCoordinatorConfigQueue;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __90__AVDelegatingPlaybackCoordinator_setParticipantLimit_forWaitingOutSuspensionsWithReason___block_invoke_2;
  v8[3] = &unk_1E302FA10;
  v8[4] = self;
  dispatch_async(figTimelineCoordinatorConfigQueue, v8);
}

uint64_t __90__AVDelegatingPlaybackCoordinator_setParticipantLimit_forWaitingOutSuspensionsWithReason___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48)), *(_QWORD *)(a1 + 40));
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "containsObject:", *(_QWORD *)(a1 + 40));
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = AVPlaybackCoordinatorFigSuspensionReasonForAVFReason(*(void **)(a1 + 40));
  v5 = *MEMORY[0x1E0CA53F0];
  v6 = (uint64_t *)MEMORY[0x1E0C9AE50];
  if (!v2)
    v6 = (uint64_t *)MEMORY[0x1E0C9AE40];
  v7 = *v6;
  v8 = *MEMORY[0x1E0CA53E8];
  v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v10 = objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v4, v5, v7, v8, v9, *MEMORY[0x1E0CA53E0], 0);
  v11 = *(_QWORD **)(a1 + 32);
  v12 = v11[16];
  v14[0] = v10;
  return objc_msgSend(v11, "_updateWaitingPoliciesArray:withPolicies:", v12, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1));
}

uint64_t __90__AVDelegatingPlaybackCoordinator_setParticipantLimit_forWaitingOutSuspensionsWithReason___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setWaitingPolicies:", objc_msgSend(*(id *)(a1 + 32), "_currentWaitingPoliciesArray"));
}

- (int64_t)participantLimitForWaitingOutSuspensionsWithReason:(id)a3
{
  NSObject *ivarAccessQueue;
  void *v4;
  int64_t v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__12;
  v12 = __Block_byref_object_dispose__12;
  v13 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__AVDelegatingPlaybackCoordinator_participantLimitForWaitingOutSuspensionsWithReason___block_invoke;
  block[3] = &unk_1E3030FB8;
  block[5] = a3;
  block[6] = &v8;
  block[4] = self;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  v4 = (void *)v9[5];
  if (v4)
    v5 = objc_msgSend(v4, "integerValue");
  else
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __86__AVDelegatingPlaybackCoordinator_participantLimitForWaitingOutSuspensionsWithReason___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 112), "objectForKeyedSubscript:", a1[5]);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
  return result;
}

- (void)setSuspensionReasonsThatTriggerWaiting:(id)a3
{
  NSObject *ivarAccessQueue;
  uint64_t v5;
  NSObject *figTimelineCoordinatorConfigQueue;
  _QWORD v7[5];
  _QWORD block[6];

  ivarAccessQueue = self->_ivarAccessQueue;
  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__AVDelegatingPlaybackCoordinator_setSuspensionReasonsThatTriggerWaiting___block_invoke;
  block[3] = &unk_1E302FCE8;
  block[4] = self;
  block[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  figTimelineCoordinatorConfigQueue = self->_figTimelineCoordinatorConfigQueue;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __74__AVDelegatingPlaybackCoordinator_setSuspensionReasonsThatTriggerWaiting___block_invoke_3;
  v7[3] = &unk_1E302FA10;
  v7[4] = self;
  dispatch_async(figTimelineCoordinatorConfigQueue, v7);
}

uint64_t __74__AVDelegatingPlaybackCoordinator_setSuspensionReasonsThatTriggerWaiting___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[5];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((AVPlaybackCoordinatorArrayContainsSameElementsAsArray(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 120), *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    v2 = AVPlaybackCoordinatorArrayMinusArray(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 120), *(_QWORD *)(a1 + 40));
    if (objc_msgSend(v2, "count"))
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __74__AVDelegatingPlaybackCoordinator_setSuspensionReasonsThatTriggerWaiting___block_invoke_2;
      v18[3] = &unk_1E3030F20;
      v18[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v2, "enumerateObjectsUsingBlock:", v18);
    }

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120) = objc_msgSend(*(id *)(a1 + 40), "copy");
  }
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v13 = a1;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    v8 = *MEMORY[0x1E0CA53F0];
    v9 = *MEMORY[0x1E0C9AE50];
    v10 = *MEMORY[0x1E0CA53E8];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", AVPlaybackCoordinatorFigSuspensionReasonForAVFReason(*(void **)(*((_QWORD *)&v14 + 1) + 8 * i)), v8, v9, v10, 0));
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v6);
  }
  return objc_msgSend(*(id *)(v13 + 32), "_updateWaitingPoliciesArray:withPolicies:", *(_QWORD *)(*(_QWORD *)(v13 + 32) + 128), v3);
}

uint64_t __74__AVDelegatingPlaybackCoordinator_setSuspensionReasonsThatTriggerWaiting___block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    v8 = *MEMORY[0x1E0CA53F0];
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v7)
        objc_enumerationMutation(v4);
      v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
      objc_msgSend(v10, "objectForKeyedSubscript:", v8);
      AVPlaybackCoordinatorFigSuspensionReasonForAVFReason(a2);
      if (FigCFEqual())
        break;
      if (v6 == ++v9)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v10 = 0;
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "removeObject:", v10);
}

uint64_t __74__AVDelegatingPlaybackCoordinator_setSuspensionReasonsThatTriggerWaiting___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setWaitingPolicies:", objc_msgSend(*(id *)(a1 + 32), "_currentWaitingPoliciesArray"));
}

- (id)suspensionReasonsThatTriggerWaiting
{
  NSObject *ivarAccessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__12;
  v10 = __Block_byref_object_dispose__12;
  v11 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__AVDelegatingPlaybackCoordinator_suspensionReasonsThatTriggerWaiting__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __70__AVDelegatingPlaybackCoordinator_suspensionReasonsThatTriggerWaiting__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)applyFigPauseSnapsToMediaTimeOfOriginator
{
  NSObject *figTimelineCoordinatorConfigQueue;
  _QWORD block[5];

  figTimelineCoordinatorConfigQueue = self->_figTimelineCoordinatorConfigQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__AVDelegatingPlaybackCoordinator_applyFigPauseSnapsToMediaTimeOfOriginator__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  dispatch_async(figTimelineCoordinatorConfigQueue, block);
}

uint64_t __76__AVDelegatingPlaybackCoordinator_applyFigPauseSnapsToMediaTimeOfOriginator__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "pauseSnapsToMediaTimeOfOriginator");
  objc_msgSend(*(id *)(a1 + 32), "pauseSnapsToMediaTimeOfOriginator");
  return FigTimelineCoordinatorSetProperty();
}

- (void)setPauseSnapsToMediaTimeOfOriginator:(BOOL)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v5[5];
  BOOL v6;

  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__AVDelegatingPlaybackCoordinator_setPauseSnapsToMediaTimeOfOriginator___block_invoke;
  v5[3] = &unk_1E302FD38;
  v5[4] = self;
  v6 = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v5);
  -[AVDelegatingPlaybackCoordinator applyFigPauseSnapsToMediaTimeOfOriginator](self, "applyFigPauseSnapsToMediaTimeOfOriginator");
}

uint64_t __72__AVDelegatingPlaybackCoordinator_setPauseSnapsToMediaTimeOfOriginator___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 136) = *(_BYTE *)(result + 40);
  return result;
}

- (BOOL)pauseSnapsToMediaTimeOfOriginator
{
  NSObject *ivarAccessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__AVDelegatingPlaybackCoordinator_pauseSnapsToMediaTimeOfOriginator__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __68__AVDelegatingPlaybackCoordinator_pauseSnapsToMediaTimeOfOriginator__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 136);
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_coordinationMediumDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
