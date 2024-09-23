@implementation AVPlayerPlaybackCoordinator

- (id)identifierForPlayerItem:(id)a3
{
  id v5;
  void *v6;

  v5 = -[AVPlayerPlaybackCoordinator delegate](self, "delegate");
  if (v5 && (v6 = v5, (objc_opt_respondsToSelector() & 1) != 0))
    return (id)objc_msgSend(v6, "playbackCoordinator:identifierForPlayerItem:", self, a3);
  else
    return 0;
}

- (id)interstitialTimeRangesForPlayerItem:(id)a3
{
  id v5;
  void *v6;

  v5 = -[AVPlayerPlaybackCoordinator delegate](self, "delegate");
  if (v5 && (v6 = v5, (objc_opt_respondsToSelector() & 1) != 0))
    return (id)objc_msgSend(v6, "playbackCoordinator:interstitialTimeRangesForPlayerItem:", self, a3);
  else
    return 0;
}

- (id)delegate
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3052000000;
  v8 = __Block_byref_object_copy__33;
  v9 = __Block_byref_object_dispose__33;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__AVPlayerPlaybackCoordinator_delegate__block_invoke;
  v4[3] = &unk_1E3034B58;
  v4[4] = &v5;
  -[AVPlayerPlaybackCoordinator _storageRead:](self, "_storageRead:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (AVPlayerPlaybackCoordinator)initWithPlayer:(id)a3
{
  id *v4;
  AVPlayerPlaybackCoordinator *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSMutableArray *suspensionReasonsThatTriggerWaiting;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  AVPlayerPlaybackCoordinator *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)AVPlayerPlaybackCoordinator;
  v4 = -[AVPlaybackCoordinator initInternal](&v23, sel_initInternal);
  v5 = (AVPlayerPlaybackCoordinator *)v4;
  if (v4)
  {
    objc_storeWeak(v4 + 1, a3);
    v5->_otherParticipants = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5->_ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avplaybackcoordinator.ivars");
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5->_figPlaybackCoordinatorConfigQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avplaybackcoordinator.figplaybackcoordinator.config", v6);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5->_localParticipantUUIDConfigQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avplaybackcoordinator.localparticipantuuid.config", v7);
    v5->_suspensionReasons = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5->_storage = objc_alloc_init(AVPlayerPlaybackCoordinatorStorage);
    v5->_storage->controlStates = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5->_storage->participantStates = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5->_isInExpanseMediaPlayback = 0;
    v5->_storage->participantLimitPerSuspensionReason = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5->_storage->suspensionReasonsThatTriggerWaiting = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", CFSTR("AVCoordinatedPlaybackSuspensionReasonUserIsChangingCurrentTime"), 0);
    v5->_storage->waitingPoliciesArray = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5->_currentSuspensions = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5->_storage->pauseSnapsToMediaTimeOfOriginator = 1;
    objc_storeWeak((id *)&v5->_weakPrimaryPlaybackCoordinator, 0);
    v5->_interstitialPlaybackCoordinator = 0;
    v5->_pendingFigPlaybackCoordinatorProperties = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5->_integratedTimeline = 0;
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v18 = v5;
    suspensionReasonsThatTriggerWaiting = v5->_storage->suspensionReasonsThatTriggerWaiting;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](suspensionReasonsThatTriggerWaiting, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      v13 = *MEMORY[0x1E0CA53F0];
      v14 = *MEMORY[0x1E0C9AE50];
      v15 = *MEMORY[0x1E0CA53E8];
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(suspensionReasonsThatTriggerWaiting);
          objc_msgSend(v8, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", AVPlaybackCoordinatorFigSuspensionReasonForAVFReason(*(void **)(*((_QWORD *)&v19 + 1) + 8 * i)), v13, v14, v15, 0));
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](suspensionReasonsThatTriggerWaiting, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v11);
    }
    v5 = v18;
    -[AVPlayerPlaybackCoordinator _updateWaitingPoliciesArray:withPolicies:](v18, "_updateWaitingPoliciesArray:withPolicies:", v18->_storage->waitingPoliciesArray, v8);
  }
  return v5;
}

- (OpaqueFigPlaybackCoordinator)_copyFigPlaybackCoordinator
{
  NSObject *ivarAccessQueue;
  OpaqueFigPlaybackCoordinator *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__AVPlayerPlaybackCoordinator__copyFigPlaybackCoordinator__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (OpaqueFigPlaybackCoordinator *)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __48__AVPlayerPlaybackCoordinator_otherParticipants__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

CFTypeRef __58__AVPlayerPlaybackCoordinator__copyFigPlaybackCoordinator__block_invoke(uint64_t a1)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 40);
  if (result)
    result = CFRetain(result);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
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
  v9 = __Block_byref_object_copy__33;
  v10 = __Block_byref_object_dispose__33;
  v11 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__AVPlayerPlaybackCoordinator_otherParticipants__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setDelegate:(id)delegate
{
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__AVPlayerPlaybackCoordinator_setDelegate___block_invoke;
  v4[3] = &unk_1E3034B30;
  v4[4] = delegate;
  v4[5] = &v5;
  -[AVPlayerPlaybackCoordinator _storageWrite:](self, "_storageWrite:", v4);
  if (*((_BYTE *)v6 + 24))
  {
    objc_msgSend(-[AVPlayerPlaybackCoordinator interstitialPlaybackCoordinator](self, "interstitialPlaybackCoordinator"), "_reactToNewDelegate");
    -[AVPlayerPlaybackCoordinator _reactToNewDelegate](self, "_reactToNewDelegate");
  }
  _Block_object_dispose(&v5, 8);
}

uint64_t __71__AVPlayerPlaybackCoordinator_trackedTransportControlStateDictionaries__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a2 + 16), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

uint64_t __66__AVPlayerPlaybackCoordinator_suspensionReasonsThatTriggerWaiting__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a2 + 40), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

uint64_t __64__AVPlayerPlaybackCoordinator_pauseSnapsToMediaTimeOfOriginator__block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_BYTE *)(a2 + 48);
  return result;
}

void __57__AVPlayerPlaybackCoordinator_setFigPlaybackCoordinator___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t CMBaseObject;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  int v12;
  uint64_t v13;
  void (*v14)(uint64_t, _QWORD, uint64_t);
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  float v22;
  float v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  unsigned int (*v28)(uint64_t, void *);
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  const void *v30;
  uint64_t v31;
  uint64_t v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  CMTime v42;
  CMTime v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CC4C68], 0);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v39 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
        v8 = objc_msgSend(*(id *)(a1 + 32), "_pendingFigPlaybackCoordinatorPropertyForKey:", v7);
        if (v8)
        {
          v9 = v8;
          CMBaseObject = FigPlaybackCoordinatorGetCMBaseObject();
          v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
          if (v11)
            v11(CMBaseObject, v7, v9);
        }
        objc_msgSend(*(id *)(a1 + 32), "_setPendingFigPlaybackCoordinatorProperty:forKey:", 0, v7);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    }
    while (v4);
  }
  objc_msgSend(*(id *)(a1 + 32), "_updateWaitingPoliciesOnFigPlaybackCoordinator:", *(_QWORD *)(a1 + 40));
  v12 = objc_msgSend(*(id *)(a1 + 32), "pauseSnapsToMediaTimeOfOriginator");
  v13 = FigPlaybackCoordinatorGetCMBaseObject();
  v14 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v14)
  {
    if (v12)
      v15 = *MEMORY[0x1E0C9AE50];
    else
      v15 = *MEMORY[0x1E0C9AE40];
    v14(v13, *MEMORY[0x1E0CA5370], v15);
  }
  v16 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "trackedTransportControlStateDictionaries"), "allValues");
  objc_msgSend(*(id *)(a1 + 32), "_replaceAllParticipantStateDictionariesOnFigPlaybackCoordinator:", *(_QWORD *)(a1 + 40));
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v16;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v35 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
        if (objc_msgSend(*(id *)(a1 + 32), "interstitialPlaybackCoordinator", v31, v32))
        {
          objc_msgSend((id)objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("Rate")), "floatValue");
          if (v22 != 0.0)
          {
            memset(&v42, 0, sizeof(v42));
            objc_msgSend((id)objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("Time")), "floatValue");
            CMTimeMakeWithSeconds(&v42, v23, 1000);
            v24 = objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("NetworkTime"));
            v25 = objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("Rate"));
            v26 = *(void **)(a1 + 32);
            v43 = v42;
            objc_msgSend(v26, "_applyAdjustedIntegratedSeekTimeFromTime:withNetworkTime:rate:", &v43, v24, v25);
          }
        }
        v27 = *(_QWORD *)(a1 + 40);
        v28 = *(unsigned int (**)(uint64_t, void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 80);
        if (!v28 || v28(v27, v21))
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
    }
    while (v18);
  }
  v30 = *(const void **)(a1 + 40);
  if (v30)
    CFRelease(v30);
}

CFTypeRef __57__AVPlayerPlaybackCoordinator_setFigPlaybackCoordinator___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  CFTypeRef v3;
  CFTypeRef result;

  v2 = a1[4];
  v3 = *(CFTypeRef *)(v2 + 40);
  result = (CFTypeRef)a1[6];
  if (v3 != result)
  {
    if (v3)
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("FigPlaybackCoordinator associated with an AVPlayer should not change"), 0));
    if (result)
    {
      result = CFRetain(result);
      v2 = a1[4];
    }
    *(_QWORD *)(v2 + 40) = result;
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  }
  return result;
}

uint64_t __49__AVPlayerPlaybackCoordinator_currentSuspensions__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)trackedTransportControlStateDictionaries
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3052000000;
  v8 = __Block_byref_object_copy__33;
  v9 = __Block_byref_object_dispose__33;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__AVPlayerPlaybackCoordinator_trackedTransportControlStateDictionaries__block_invoke;
  v4[3] = &unk_1E3034B58;
  v4[4] = &v5;
  -[AVPlayerPlaybackCoordinator _storageRead:](self, "_storageRead:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (id)suspensionReasonsThatTriggerWaiting
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3052000000;
  v8 = __Block_byref_object_copy__33;
  v9 = __Block_byref_object_dispose__33;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__AVPlayerPlaybackCoordinator_suspensionReasonsThatTriggerWaiting__block_invoke;
  v4[3] = &unk_1E3034B58;
  v4[4] = &v5;
  -[AVPlayerPlaybackCoordinator _storageRead:](self, "_storageRead:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setFigPlaybackCoordinator:(OpaqueFigPlaybackCoordinator *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *ivarAccessQueue;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void (*v17)(OpaqueFigPlaybackCoordinator *, uint64_t);
  uint64_t (*v18)(OpaqueFigPlaybackCoordinator *, AVPlayerPlaybackCoordinator *, _OWORD *);
  int v19;
  NSObject *figPlaybackCoordinatorConfigQueue;
  void *v21;
  _QWORD v22[6];
  int v23;
  _OWORD v24[2];
  void (*v25)(void *, uint64_t, uint64_t, void (*)(uint64_t));
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD block[7];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v21 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v3, v4, v5, v6, v7, (uint64_t)"figPlaybackCoordinator != NULL"), 0);
    objc_exception_throw(v21);
  }
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v11 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__AVPlayerPlaybackCoordinator_setFigPlaybackCoordinator___block_invoke;
  block[3] = &unk_1E3031868;
  block[5] = &v31;
  block[6] = a3;
  block[4] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((_BYTE *)v32 + 24))
  {
    -[AVPlayerPlaybackCoordinator _addFigPlaybackCoordinatorListeners:](self, "_addFigPlaybackCoordinatorListeners:", a3);
    if (-[AVPlayerPlaybackCoordinator primaryPlaybackCoordinatorForInterstitial](self, "primaryPlaybackCoordinatorForInterstitial"))
    {
      -[AVPlayerPlaybackCoordinator _setIntegratedTimelineCreatingNew:](self, "_setIntegratedTimelineCreatingNew:", 1);
    }
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v12 = -[AVPlayerPlaybackCoordinator currentSuspensions](self, "currentSuspensions");
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v27 != v14)
            objc_enumerationMutation(v12);
          v16 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          v17 = *(void (**)(OpaqueFigPlaybackCoordinator *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                               + 8);
          if (v17)
            v17(a3, v16);
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
      }
      while (v13);
    }
    v24[0] = xmmword_1E3034B00;
    v24[1] = *(_OWORD *)off_1E3034B10;
    v25 = AVPlayerPlaybackCoordinatorAsynchronouslyReloadTransportControlStateCallback;
    v18 = *(uint64_t (**)(OpaqueFigPlaybackCoordinator *, AVPlayerPlaybackCoordinator *, _OWORD *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
    if (v18)
      v19 = v18(a3, self, v24);
    else
      v19 = -12782;
    -[AVPlayerPlaybackCoordinator _updateLocalParticipantUUIDOnFigPlaybackCoordinator:](self, "_updateLocalParticipantUUIDOnFigPlaybackCoordinator:", a3);
    CFRetain(a3);
    figPlaybackCoordinatorConfigQueue = self->_figPlaybackCoordinatorConfigQueue;
    v22[0] = v11;
    v22[1] = 3221225472;
    v22[2] = __57__AVPlayerPlaybackCoordinator_setFigPlaybackCoordinator___block_invoke_2;
    v22[3] = &unk_1E3032660;
    v22[4] = self;
    v22[5] = a3;
    v23 = v19;
    dispatch_async(figPlaybackCoordinatorConfigQueue, v22);
  }
  _Block_object_dispose(&v31, 8);
}

- (BOOL)pauseSnapsToMediaTimeOfOriginator
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 1;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__AVPlayerPlaybackCoordinator_pauseSnapsToMediaTimeOfOriginator__block_invoke;
  v4[3] = &unk_1E3034B58;
  v4[4] = &v5;
  -[AVPlayerPlaybackCoordinator _storageRead:](self, "_storageRead:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)dealloc
{
  NSObject *ivarAccessQueue;
  NSObject *figPlaybackCoordinatorConfigQueue;
  NSObject *localParticipantUUIDConfigQueue;
  OpaqueFigPlaybackCoordinator *figPlaybackCoordinator;
  objc_super v7;

  if (self->_suspensionsChangedNotificationToken)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self->_suspensionsChangedNotificationToken);

    self->_suspensionsChangedNotificationToken = 0;
  }
  if (self->_participantsChangedNotificationToken)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self->_participantsChangedNotificationToken);

    self->_participantsChangedNotificationToken = 0;
  }
  if (self->_didIssueCommandToPlaybackObjectNotificationToken)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self->_didIssueCommandToPlaybackObjectNotificationToken);

    self->_didIssueCommandToPlaybackObjectNotificationToken = 0;
  }

  ivarAccessQueue = self->_ivarAccessQueue;
  if (ivarAccessQueue)
    dispatch_release(ivarAccessQueue);
  figPlaybackCoordinatorConfigQueue = self->_figPlaybackCoordinatorConfigQueue;
  if (figPlaybackCoordinatorConfigQueue)
    dispatch_release(figPlaybackCoordinatorConfigQueue);
  localParticipantUUIDConfigQueue = self->_localParticipantUUIDConfigQueue;
  if (localParticipantUUIDConfigQueue)
    dispatch_release(localParticipantUUIDConfigQueue);
  figPlaybackCoordinator = self->_figPlaybackCoordinator;
  if (figPlaybackCoordinator)
    CFRelease(figPlaybackCoordinator);

  v7.receiver = self;
  v7.super_class = (Class)AVPlayerPlaybackCoordinator;
  -[AVPlayerPlaybackCoordinator dealloc](&v7, sel_dealloc);
}

- (id)currentSuspensions
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
  v9 = __Block_byref_object_copy__33;
  v10 = __Block_byref_object_dispose__33;
  v11 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__AVPlayerPlaybackCoordinator_currentSuspensions__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_addFigPlaybackCoordinatorListeners:(OpaqueFigPlaybackCoordinator *)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  objc_initWeak(&location, self);
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = *MEMORY[0x1E0CC4C60];
  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __67__AVPlayerPlaybackCoordinator__addFigPlaybackCoordinatorListeners___block_invoke;
  v16[3] = &unk_1E302FA38;
  objc_copyWeak(&v17, &location);
  self->_suspensionsChangedNotificationToken = (id)objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", v6, a3, 0, v16);
  v8 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = *MEMORY[0x1E0CC4C58];
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __67__AVPlayerPlaybackCoordinator__addFigPlaybackCoordinatorListeners___block_invoke_2;
  v14[3] = &unk_1E302FA38;
  objc_copyWeak(&v15, &location);
  self->_participantsChangedNotificationToken = (id)objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", v9, a3, 0, v14);
  v10 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = *MEMORY[0x1E0CC4C50];
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __67__AVPlayerPlaybackCoordinator__addFigPlaybackCoordinatorListeners___block_invoke_3;
  v12[3] = &unk_1E302FA38;
  objc_copyWeak(&v13, &location);
  self->_didIssueCommandToPlaybackObjectNotificationToken = (id)objc_msgSend(v10, "addObserverForName:object:queue:usingBlock:", v11, a3, 0, v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weakPrimaryPlaybackCoordinator);
  objc_destroyWeak((id *)&self->_weakPlayer);
}

uint64_t __67__AVPlayerPlaybackCoordinator__addFigPlaybackCoordinatorListeners___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t result;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(a2, "userInfo");
  result = objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CC4C48]);
  if (result)
  {
    v5 = (void *)result;
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v5);
          objc_msgSend(v6, "addObject:", AVPlaybackCoordinatorAVFSuspensionReasonForFigReason(*(__CFString **)(*((_QWORD *)&v12 + 1) + 8 * v10++)));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }
    v11 = (id *)(a1 + 32);
    objc_msgSend(objc_loadWeak(v11), "_updateSuspensionReasons:", v6);
    return objc_msgSend((id)objc_msgSend(objc_loadWeak(v11), "primaryPlaybackCoordinatorForInterstitial"), "_updateSuspensionReasons:", v6);
  }
  return result;
}

uint64_t __67__AVPlayerPlaybackCoordinator__addFigPlaybackCoordinatorListeners___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)objc_msgSend(a2, "userInfo");
  return objc_msgSend(objc_loadWeak((id *)(a1 + 32)), "_updateOtherParticipantsUsingFigParticipantUUIDs:", objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CC4C40]));
}

uint64_t __67__AVPlayerPlaybackCoordinator__addFigPlaybackCoordinatorListeners___block_invoke_3(id *a1, void *a2)
{
  id UserInfoForDidIssueCommandToPlaybackObjectNotification;

  UserInfoForDidIssueCommandToPlaybackObjectNotification = AVPlaybackCoordinatorMakeUserInfoForDidIssueCommandToPlaybackObjectNotification((void *)objc_msgSend(a2, "userInfo"));
  a1 += 4;
  objc_msgSend(objc_loadWeak(a1), "_postNotificationWithName:userInfo:", CFSTR("AVPlaybackCoordinatorDidIssueCommandToPlaybackObjectNotification"), UserInfoForDidIssueCommandToPlaybackObjectNotification);
  return objc_msgSend((id)objc_msgSend(objc_loadWeak(a1), "primaryPlaybackCoordinatorForInterstitial"), "_postNotificationWithName:userInfo:", CFSTR("AVPlaybackCoordinatorDidIssueCommandToPlaybackObjectNotification"), UserInfoForDidIssueCommandToPlaybackObjectNotification);
}

- (void)_postNotificationWithName:(id)a3 userInfo:(id)a4
{
  uint64_t v4;

  v4 = objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", a3, self, a4);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v4);
}

- (void)_storageRead:(id)a3
{
  NSObject *rwQueue;
  _QWORD v4[6];

  rwQueue = self->_storage->rwQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__AVPlayerPlaybackCoordinator__storageRead___block_invoke;
  v4[3] = &unk_1E3032448;
  v4[4] = self;
  v4[5] = a3;
  av_readwrite_dispatch_queue_read(rwQueue, v4);
}

uint64_t __44__AVPlayerPlaybackCoordinator__storageRead___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
}

- (void)_storageWrite:(id)a3
{
  NSObject *rwQueue;
  _QWORD v4[6];

  rwQueue = self->_storage->rwQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__AVPlayerPlaybackCoordinator__storageWrite___block_invoke;
  v4[3] = &unk_1E3032448;
  v4[4] = self;
  v4[5] = a3;
  av_readwrite_dispatch_queue_write(rwQueue, v4);
}

uint64_t __45__AVPlayerPlaybackCoordinator__storageWrite___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
}

- (id)description
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
  v9 = __Block_byref_object_copy__33;
  v10 = __Block_byref_object_dispose__33;
  v11 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __42__AVPlayerPlaybackCoordinator_description__block_invoke;
  v5[3] = &unk_1E302FDB0;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__AVPlayerPlaybackCoordinator_description__block_invoke(uint64_t a1)
{
  _BOOL8 v2;
  id v3;
  objc_class *v4;
  uint64_t result;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) == 0;
  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  result = objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p, type = %d>"), NSStringFromClass(v4), *(_QWORD *)(a1 + 32), v2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (AVPlayer)player
{
  return (AVPlayer *)objc_loadWeak((id *)&self->_weakPlayer);
}

- (BOOL)_hasFigPlaybackCoordinator
{
  OpaqueFigPlaybackCoordinator *v2;
  OpaqueFigPlaybackCoordinator *v3;

  v2 = -[AVPlayerPlaybackCoordinator _copyFigPlaybackCoordinator](self, "_copyFigPlaybackCoordinator");
  v3 = v2;
  if (v2)
    CFRelease(v2);
  return v3 != 0;
}

- (id)_pendingFigPlaybackCoordinatorProperties
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
  v9 = __Block_byref_object_copy__33;
  v10 = __Block_byref_object_dispose__33;
  v11 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__AVPlayerPlaybackCoordinator__pendingFigPlaybackCoordinatorProperties__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __71__AVPlayerPlaybackCoordinator__pendingFigPlaybackCoordinatorProperties__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)_pendingFigPlaybackCoordinatorPropertyForKey:(id)a3
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
  v10 = __Block_byref_object_copy__33;
  v11 = __Block_byref_object_dispose__33;
  v12 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__AVPlayerPlaybackCoordinator__pendingFigPlaybackCoordinatorPropertyForKey___block_invoke;
  block[3] = &unk_1E3030FB8;
  block[5] = a3;
  block[6] = &v7;
  block[4] = self;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __76__AVPlayerPlaybackCoordinator__pendingFigPlaybackCoordinatorPropertyForKey___block_invoke(_QWORD *a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(a1[4] + 104), "objectForKey:", a1[5]);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
  return result;
}

- (void)_setPendingFigPlaybackCoordinatorProperty:(id)a3 forKey:(id)a4
{
  NSObject *ivarAccessQueue;
  _QWORD block[7];

  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__AVPlayerPlaybackCoordinator__setPendingFigPlaybackCoordinatorProperty_forKey___block_invoke;
  block[3] = &unk_1E302FD88;
  block[4] = a3;
  block[5] = self;
  block[6] = a4;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
}

uint64_t __80__AVPlayerPlaybackCoordinator__setPendingFigPlaybackCoordinatorProperty_forKey___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;

  v2 = a1[4];
  v3 = *(void **)(a1[5] + 104);
  if (v2)
    return objc_msgSend(v3, "setObject:forKey:", v2, a1[6]);
  else
    return objc_msgSend(v3, "removeObjectForKey:", a1[6]);
}

- (void)_setInterstitialActive:(unsigned __int8)a3
{
  uint64_t v3;
  uint64_t *v5;
  OpaqueFigPlaybackCoordinator *v6;
  NSObject *figPlaybackCoordinatorConfigQueue;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[3];
  int v14;

  v3 = a3;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v14 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v5 = (uint64_t *)MEMORY[0x1E0C9AE50];
  if (!a3)
    v5 = (uint64_t *)MEMORY[0x1E0C9AE40];
  v12 = *v5;
  v6 = -[AVPlayerPlaybackCoordinator _copyFigPlaybackCoordinator](self, "_copyFigPlaybackCoordinator");
  if (v6)
  {
    figPlaybackCoordinatorConfigQueue = self->_figPlaybackCoordinatorConfigQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__AVPlayerPlaybackCoordinator__setInterstitialActive___block_invoke;
    block[3] = &unk_1E3031F48;
    block[4] = v13;
    block[5] = &v9;
    block[6] = v6;
    dispatch_async(figPlaybackCoordinatorConfigQueue, block);
    CFRelease(v6);
  }
  else
  {
    -[AVPlayerPlaybackCoordinator _setPendingFigPlaybackCoordinatorProperty:forKey:](self, "_setPendingFigPlaybackCoordinatorProperty:forKey:", v10[3], *MEMORY[0x1E0CC4C68]);
  }
  objc_msgSend(-[AVPlayerPlaybackCoordinator interstitialPlaybackCoordinator](self, "interstitialPlaybackCoordinator"), "_setInterstitialActive:", v3);
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(v13, 8);
}

uint64_t __54__AVPlayerPlaybackCoordinator__setInterstitialActive___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t CMBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t result;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  CMBaseObject = FigPlaybackCoordinatorGetCMBaseObject();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
    result = v4(CMBaseObject, *MEMORY[0x1E0CC4C68], v2);
  else
    result = 4294954514;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)setInterstitialPlaybackCoordinator:(id)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v6[6];

  objc_msgSend(a3, "_setStorage:", self->_storage);
  ivarAccessQueue = self->_ivarAccessQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__AVPlayerPlaybackCoordinator_setInterstitialPlaybackCoordinator___block_invoke;
  v6[3] = &unk_1E302FCE8;
  v6[4] = a3;
  v6[5] = self;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v6);
}

_QWORD *__66__AVPlayerPlaybackCoordinator_setInterstitialPlaybackCoordinator___block_invoke(_QWORD *result)
{
  void *v1;
  _QWORD *v2;

  v1 = *(void **)(result[5] + 88);
  if ((void *)result[4] != v1)
  {
    v2 = result;

    result = (id)v2[4];
    *(_QWORD *)(v2[5] + 88) = result;
  }
  return result;
}

- (void)_setIntegratedTimelineCreatingNew:(unsigned __int8)a3
{
  id v5;
  AVPlayerPlaybackCoordinator *v6;
  uint64_t v7;
  NSObject *ivarAccessQueue;
  _QWORD block[6];
  unsigned __int8 v10;

  v5 = -[AVPlayerPlaybackCoordinator interstitialPlaybackCoordinator](self, "interstitialPlaybackCoordinator");
  v6 = self;
  if (!v5)
  {
    if (!-[AVPlayerPlaybackCoordinator primaryPlaybackCoordinatorForInterstitial](self, "primaryPlaybackCoordinatorForInterstitial"))return;
    v6 = -[AVPlayerPlaybackCoordinator primaryPlaybackCoordinatorForInterstitial](self, "primaryPlaybackCoordinatorForInterstitial");
  }
  v7 = -[AVPlayer currentItem](-[AVPlayerPlaybackCoordinator player](v6, "player"), "currentItem");
  if (v7)
  {
    ivarAccessQueue = self->_ivarAccessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__AVPlayerPlaybackCoordinator__setIntegratedTimelineCreatingNew___block_invoke;
    block[3] = &unk_1E302FD10;
    v10 = a3;
    block[4] = self;
    block[5] = v7;
    av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  }
}

uint64_t __65__AVPlayerPlaybackCoordinator__setIntegratedTimelineCreatingNew___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t result;

  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(void **)(a1 + 40);
  if (v2)
    result = objc_msgSend(v3, "integratedTimeline");
  else
    result = objc_msgSend(v3, "_copyIntegratedTimelineIfCreated");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) = result;
  return result;
}

- (void)_setStorage:(id)a3
{
  NSObject *ivarAccessQueue;
  _QWORD v4[6];

  ivarAccessQueue = self->_ivarAccessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__AVPlayerPlaybackCoordinator__setStorage___block_invoke;
  v4[3] = &unk_1E302FCE8;
  v4[4] = self;
  v4[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

id __43__AVPlayerPlaybackCoordinator__setStorage___block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(a1 + 40);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = result;
  return result;
}

- (void)setWeakReferenceToPrimaryPlaybackCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_weakPrimaryPlaybackCoordinator, a3);
}

- (id)interstitialPlaybackCoordinator
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
  v9 = __Block_byref_object_copy__33;
  v10 = __Block_byref_object_dispose__33;
  v11 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__AVPlayerPlaybackCoordinator_interstitialPlaybackCoordinator__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __62__AVPlayerPlaybackCoordinator_interstitialPlaybackCoordinator__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 88);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)primaryPlaybackCoordinatorForInterstitial
{
  return objc_loadWeak((id *)&self->_weakPrimaryPlaybackCoordinator);
}

- (id)integratedTimeline
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
  v9 = __Block_byref_object_copy__33;
  v10 = __Block_byref_object_dispose__33;
  v11 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__AVPlayerPlaybackCoordinator_integratedTimeline__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __49__AVPlayerPlaybackCoordinator_integratedTimeline__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 136);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)_figPlaybackCoordinatorConfigQueue
{
  return self->_figPlaybackCoordinatorConfigQueue;
}

id __43__AVPlayerPlaybackCoordinator_setDelegate___block_invoke(uint64_t a1, uint64_t a2)
{
  id *v3;
  id result;
  id v5;

  v3 = (id *)(a2 + 72);
  result = objc_loadWeak((id *)(a2 + 72));
  v5 = *(id *)(a1 + 32);
  if (result != v5)
  {
    result = objc_storeWeak(v3, v5);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

- (void)_reactToNewDelegate
{
  uint64_t v2;

  v2 = objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("AVPlaybackCoordinatorItemIdentifierForCoordinatedPlaybackDidChangeNotification"), self);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v2);
}

id __39__AVPlayerPlaybackCoordinator_delegate__block_invoke(uint64_t a1, uint64_t a2)
{
  id result;

  result = objc_loadWeakRetained((id *)(a2 + 72));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (void)_updateLocalParticipantUUIDOnFigPlaybackCoordinator:(OpaqueFigPlaybackCoordinator *)a3
{
  NSObject *localParticipantUUIDConfigQueue;
  _QWORD v4[6];

  localParticipantUUIDConfigQueue = self->_localParticipantUUIDConfigQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __83__AVPlayerPlaybackCoordinator__updateLocalParticipantUUIDOnFigPlaybackCoordinator___block_invoke;
  v4[3] = &unk_1E302FE78;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(localParticipantUUIDConfigQueue, v4);
}

void __83__AVPlayerPlaybackCoordinator__updateLocalParticipantUUIDOnFigPlaybackCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  const __CFString *v4;
  CFUUIDRef v5;
  uint64_t v6;
  void (*v7)(uint64_t, CFUUIDRef);
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  uint64_t v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3052000000;
  v18 = __Block_byref_object_copy__33;
  v19 = __Block_byref_object_dispose__33;
  v20 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__33;
  v13 = __Block_byref_object_dispose__33;
  v14 = 0;
  v2 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__AVPlayerPlaybackCoordinator__updateLocalParticipantUUIDOnFigPlaybackCoordinator___block_invoke_2;
  v8[3] = &unk_1E3034B80;
  v8[4] = &v15;
  v8[5] = &v9;
  objc_msgSend(v2, "_storageRead:", v8);
  v3 = (void *)v16[5];
  if (v3)
  {
    v4 = (const __CFString *)objc_msgSend(v3, "UUIDString");
    v5 = CFUUIDCreateFromString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v4);
  }
  else
  {
    v5 = 0;
  }
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void (**)(uint64_t, CFUUIDRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
  if (v7)
    v7(v6, v5);
  if (v5)
    CFRelease(v5);

  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v15, 8);
}

id __83__AVPlayerPlaybackCoordinator__updateLocalParticipantUUIDOnFigPlaybackCoordinator___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id result;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = objc_msgSend(*(id *)(a2 + 64), "copy");
  result = objc_loadWeakRetained((id *)(a2 + 80));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)_setIsInExpanseMediaPlaybackOnAVAudioSession
{
  AVAudioSession *v3;
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
  v3 = -[AVPlayer audioSession](-[AVPlayerPlaybackCoordinator player](self, "player"), "audioSession");
  if (!v3)
    v3 = (AVAudioSession *)objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__AVPlayerPlaybackCoordinator__setIsInExpanseMediaPlaybackOnAVAudioSession__block_invoke;
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
    -[AVAudioSession setIsExpanseMediaSession:error:](v3, "setIsExpanseMediaSession:error:", v5 != 0, &v6);
  }
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
}

uint64_t __75__AVPlayerPlaybackCoordinator__setIsInExpanseMediaPlaybackOnAVAudioSession__block_invoke(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;
  int v4;

  result = objc_msgSend(*(id *)(a1[4] + 56), "count");
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result != 0;
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = *(_BYTE *)(a1[4] + 96);
  v3 = a1[4];
  v4 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);
  if (*(unsigned __int8 *)(v3 + 96) != v4)
  {
    if (a1[5])
      *(_BYTE *)(v3 + 96) = v4;
  }
  return result;
}

- (id)avfParticipantsForFigParticipantsUUIDs:(id)a3
{
  OpaqueFigPlaybackCoordinator *v5;
  OpaqueFigPlaybackCoordinator *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  const __CFUUID *v10;
  id NSUUIDFromCFUUID;
  void *v12;
  void (*v13)(OpaqueFigPlaybackCoordinator *, const __CFUUID *, CFTypeRef *);
  _BOOL8 v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  AVCoordinatedPlaybackParticipant *v20;
  id obj;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  CFTypeRef cf;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v24 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = -[AVPlayerPlaybackCoordinator _copyFigPlaybackCoordinator](self, "_copyFigPlaybackCoordinator");
  if (v5)
  {
    v6 = v5;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v7)
    {
      v8 = v7;
      obj = a3;
      v23 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v31 != v23)
            objc_enumerationMutation(obj);
          v10 = *(const __CFUUID **)(*((_QWORD *)&v30 + 1) + 8 * i);
          NSUUIDFromCFUUID = AVPlaybackCoordinatorGetNSUUIDFromCFUUID(v10);
          v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          cf = 0;
          v13 = *(void (**)(OpaqueFigPlaybackCoordinator *, const __CFUUID *, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 48);
          if (v13)
            v13(v6, v10, &cf);
          if (cf)
          {
            v14 = FigTimelineCoordinationParticipantSnapshotIsReadyToSetNonZeroRate() != 0;
            v15 = (void *)FigTimelineCoordinationParticipantSnapshotCopySuspensionReasons();
            v25 = 0u;
            v26 = 0u;
            v27 = 0u;
            v28 = 0u;
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
            if (v16)
            {
              v17 = v16;
              v18 = *(_QWORD *)v26;
              do
              {
                for (j = 0; j != v17; ++j)
                {
                  if (*(_QWORD *)v26 != v18)
                    objc_enumerationMutation(v15);
                  objc_msgSend(v12, "addObject:", AVPlaybackCoordinatorAVFSuspensionReasonForFigReason(*(__CFString **)(*((_QWORD *)&v25 + 1) + 8 * j)));
                }
                v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
              }
              while (v17);
            }

            if (cf)
              CFRelease(cf);
          }
          else
          {
            v14 = 0;
          }
          v20 = -[AVCoordinatedPlaybackParticipant initWithParticipantIdentifier:readyToPlay:suspensionReasons:]([AVCoordinatedPlaybackParticipant alloc], "initWithParticipantIdentifier:readyToPlay:suspensionReasons:", NSUUIDFromCFUUID, v14, v12);
          objc_msgSend(v24, "addObject:", v20);

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v8);
    }
    CFRelease(v6);
  }
  return v24;
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
  v4 = -[AVPlayerPlaybackCoordinator avfParticipantsForFigParticipantsUUIDs:](self, "avfParticipantsForFigParticipantsUUIDs:", a3);
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__AVPlayerPlaybackCoordinator__updateOtherParticipantsUsingFigParticipantUUIDs___block_invoke;
  block[3] = &unk_1E302FE00;
  block[4] = self;
  block[5] = v4;
  block[6] = &v8;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  if (*((_BYTE *)v9 + 24))
  {
    v6 = objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("AVPlaybackCoordinatorOtherParticipantsDidChangeNotification"), self);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v6);
    -[AVPlayerPlaybackCoordinator _setIsInExpanseMediaPlaybackOnAVAudioSession](self, "_setIsInExpanseMediaPlaybackOnAVAudioSession");
  }
  _Block_object_dispose(&v8, 8);
}

uint64_t __80__AVPlayerPlaybackCoordinator__updateOtherParticipantsUsingFigParticipantUUIDs___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = AVPlaybackCoordinatorArrayContainsSameElementsAsArray(*(_QWORD *)(a1[4] + 56), a1[5]);
  if ((result & 1) == 0)
  {

    result = objc_msgSend((id)a1[5], "copy");
    *(_QWORD *)(a1[4] + 56) = result;
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }
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
  v10 = __Block_byref_object_copy__33;
  v11 = __Block_byref_object_dispose__33;
  v12 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__AVPlayerPlaybackCoordinator_participantForIdentifier___block_invoke;
  block[3] = &unk_1E302FE00;
  block[4] = self;
  block[5] = a3;
  block[6] = &v7;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __56__AVPlayerPlaybackCoordinator_participantForIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  id result;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[2] = __56__AVPlayerPlaybackCoordinator_participantForIdentifier___block_invoke_2;
  v5[3] = &unk_1E3032978;
  v2 = a1[5];
  v3 = *(void **)(a1[4] + 56);
  v5[1] = 3221225472;
  v5[4] = v2;
  result = (id)objc_msgSend(v3, "indexOfObjectPassingTest:", v5);
  if (result != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    result = (id)objc_msgSend(*(id *)(a1[4] + 56), "objectAtIndexedSubscript:", result);
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
  }
  return result;
}

uint64_t __56__AVPlayerPlaybackCoordinator_participantForIdentifier___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(a2, "identifier"), "isEqual:", *(_QWORD *)(a1 + 32));
  *a4 = result;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)expectedItemTimeAtHostTime:(SEL)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v7;
  void (*v8)($3CC8671D27C23BF42ADDB32F2B5E48AE *, __int128 *, $3CC8671D27C23BF42ADDB32F2B5E48AE *);
  __int128 v9;
  int64_t var3;
  __int128 v11;
  int64_t v12;

  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  result = -[AVPlayerPlaybackCoordinator _copyFigPlaybackCoordinator](self, "_copyFigPlaybackCoordinator");
  if (result)
  {
    v7 = result;
    v9 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    v8 = *(void (**)($3CC8671D27C23BF42ADDB32F2B5E48AE *, __int128 *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 72);
    if (v8)
    {
      v11 = v9;
      v12 = var3;
      v8(v7, &v11, retstr);
    }
    CFRelease(v7);
  }
  return result;
}

- (void)setCoordinationMediumDelegate:(id)a3
{
  uint64_t v5;
  _QWORD v6[6];

  v5 = objc_msgSend(a3, "localParticipantUUIDForPlaybackCoordinator:", self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__AVPlayerPlaybackCoordinator_setCoordinationMediumDelegate___block_invoke;
  v6[3] = &unk_1E3034BA8;
  v6[4] = a3;
  v6[5] = v5;
  -[AVPlayerPlaybackCoordinator _storageWrite:](self, "_storageWrite:", v6);
  -[AVPlayerPlaybackCoordinator _updateCoordinationMediumDelegateOnFigPlaybackCoordinator](self, "_updateCoordinationMediumDelegateOnFigPlaybackCoordinator");
  objc_msgSend(-[AVPlayerPlaybackCoordinator interstitialPlaybackCoordinator](self, "interstitialPlaybackCoordinator"), "_updateCoordinationMediumDelegateOnFigPlaybackCoordinator");
}

void __61__AVPlayerPlaybackCoordinator_setCoordinationMediumDelegate___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;

  objc_msgSend(*(id *)(a2 + 16), "removeAllObjects");
  objc_msgSend(*(id *)(a2 + 24), "removeAllObjects");
  objc_storeWeak((id *)(a2 + 80), *(id *)(a1 + 32));
  v4 = *(id *)(a2 + 64);
  *(_QWORD *)(a2 + 64) = objc_msgSend(*(id *)(a1 + 40), "copy");

}

- (void)_updateCoordinationMediumDelegateOnFigPlaybackCoordinator
{
  OpaqueFigPlaybackCoordinator *v3;
  OpaqueFigPlaybackCoordinator *v4;

  v3 = -[AVPlayerPlaybackCoordinator _copyFigPlaybackCoordinator](self, "_copyFigPlaybackCoordinator");
  if (v3)
  {
    v4 = v3;
    -[AVPlayerPlaybackCoordinator _updateLocalParticipantUUIDOnFigPlaybackCoordinator:](self, "_updateLocalParticipantUUIDOnFigPlaybackCoordinator:", v3);
    CFRelease(v4);
  }
}

- (id)coordinationMediumDelegate
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3052000000;
  v8 = __Block_byref_object_copy__33;
  v9 = __Block_byref_object_dispose__33;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__AVPlayerPlaybackCoordinator_coordinationMediumDelegate__block_invoke;
  v4[3] = &unk_1E3034B58;
  v4[4] = &v5;
  -[AVPlayerPlaybackCoordinator _storageRead:](self, "_storageRead:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

id __57__AVPlayerPlaybackCoordinator_coordinationMediumDelegate__block_invoke(uint64_t a1, uint64_t a2)
{
  id result;

  result = objc_loadWeakRetained((id *)(a2 + 80));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (void)setMediumLoggingIdentifier:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__AVPlayerPlaybackCoordinator_setMediumLoggingIdentifier___block_invoke;
  v3[3] = &unk_1E3034BD0;
  v3[4] = a3;
  -[AVPlayerPlaybackCoordinator _storageWrite:](self, "_storageWrite:", v3);
}

uint64_t __58__AVPlayerPlaybackCoordinator_setMediumLoggingIdentifier___block_invoke(uint64_t result, uint64_t a2)
{
  void *v2;
  uint64_t v4;

  v2 = *(void **)(a2 + 88);
  if (*(void **)(result + 32) != v2)
  {
    v4 = result;

    result = objc_msgSend(*(id *)(v4 + 32), "copy");
    *(_QWORD *)(a2 + 88) = result;
  }
  return result;
}

- (id)mediumLoggingIdentifier
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3052000000;
  v8 = __Block_byref_object_copy__33;
  v9 = __Block_byref_object_dispose__33;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__AVPlayerPlaybackCoordinator_mediumLoggingIdentifier__block_invoke;
  v4[3] = &unk_1E3034B58;
  v4[4] = &v5;
  -[AVPlayerPlaybackCoordinator _storageRead:](self, "_storageRead:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __54__AVPlayerPlaybackCoordinator_mediumLoggingIdentifier__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a2 + 88), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (void)_updateTransportControlStateDictionaryWithTransportControlState:(id)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __95__AVPlayerPlaybackCoordinator__updateTransportControlStateDictionaryWithTransportControlState___block_invoke;
  v3[3] = &unk_1E3034BA8;
  v3[4] = a3;
  v3[5] = self;
  -[AVPlayerPlaybackCoordinator _storageWrite:](self, "_storageWrite:", v3);
}

void __95__AVPlayerPlaybackCoordinator__updateTransportControlStateDictionaryWithTransportControlState___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v4 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("Identifier"));
  v5 = (void *)objc_msgSend(*(id *)(a2 + 16), "objectForKeyedSubscript:", v4);
  if (!v5)
    goto LABEL_9;
  v6 = v5;
  v7 = objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("LamportTimestamp")), "intValue");
  v8 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("LamportTimestamp")), "intValue");
  if ((objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("IsAuthoritative")), "BOOLValue") & 1) != 0|| v8 > v7)
  {
    goto LABEL_9;
  }
  if (v8 == v7)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("OriginatorUUID")));
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("OriginatorUUID")));
    v11 = objc_msgSend(v10, "compare:", v9);
    if (v11 == 1)
    {
LABEL_8:

LABEL_9:
      objc_msgSend(*(id *)(a2 + 16), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), v4);
      return;
    }
    if (!v11)
    {
      if ((objc_msgSend(v10, "isEqual:", *(_QWORD *)(a2 + 64)) & 1) != 0)
        goto LABEL_8;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }

  }
  else if (dword_1ECDECDF8)
  {
    v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void)_removeUnusedTransportControlStates
{
  -[AVPlayerPlaybackCoordinator _storageWrite:](self, "_storageWrite:", &__block_literal_global_34);
}

uint64_t __66__AVPlayerPlaybackCoordinator__removeUnusedTransportControlStates__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(*(id *)(a2 + 16), "allKeys");
  v11 = a2;
  v4 = (void *)objc_msgSend(*(id *)(a2 + 24), "allValues");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (result)
  {
    v6 = result;
    v7 = *(_QWORD *)v14;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v3);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        v12[0] = v8;
        v12[1] = 3221225472;
        v12[2] = __66__AVPlayerPlaybackCoordinator__removeUnusedTransportControlStates__block_invoke_2;
        v12[3] = &unk_1E30329A0;
        v12[4] = v10;
        if (objc_msgSend(v4, "indexOfObjectPassingTest:", v12) == 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(*(id *)(v11 + 16), "removeObjectForKey:", v10);
        ++v9;
      }
      while (v6 != v9);
      result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v6 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __66__AVPlayerPlaybackCoordinator__removeUnusedTransportControlStates__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CurrentIdentifier")), "isEqualToString:", *(_QWORD *)(a1 + 32));
  *a4 = result;
  return result;
}

- (void)_updateParticipantStateDictionaryWithParticipantState:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __85__AVPlayerPlaybackCoordinator__updateParticipantStateDictionaryWithParticipantState___block_invoke;
  v3[3] = &unk_1E3034BD0;
  v3[4] = a3;
  -[AVPlayerPlaybackCoordinator _storageWrite:](self, "_storageWrite:", v3);
}

uint64_t __85__AVPlayerPlaybackCoordinator__updateParticipantStateDictionaryWithParticipantState___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 24), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("UUID")));
}

- (void)handleNewTransportControlStateDictionary:(id)a3
{
  uint64_t v5;

  -[AVPlayerPlaybackCoordinator _updateTransportControlStateDictionaryWithTransportControlState:](self, "_updateTransportControlStateDictionaryWithTransportControlState:");
  v5 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Identifier"));
  -[AVPlayerPlaybackCoordinator _updateTransportControlStateDictionaryOnFigPlaybackCoordinatorForItemIdentifier:](self, "_updateTransportControlStateDictionaryOnFigPlaybackCoordinatorForItemIdentifier:", v5);
  objc_msgSend(-[AVPlayerPlaybackCoordinator interstitialPlaybackCoordinator](self, "interstitialPlaybackCoordinator"), "_updateTransportControlStateDictionaryOnFigPlaybackCoordinatorForItemIdentifier:", v5);
}

- (void)_updateTransportControlStateDictionaryOnFigPlaybackCoordinatorForItemIdentifier:(id)a3
{
  OpaqueFigPlaybackCoordinator *v5;
  NSObject *figPlaybackCoordinatorConfigQueue;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _QWORD block[27];

  block[26] = *MEMORY[0x1E0C80C00];
  v5 = -[AVPlayerPlaybackCoordinator _copyFigPlaybackCoordinator](self, "_copyFigPlaybackCoordinator");
  if (v5)
  {
    figPlaybackCoordinatorConfigQueue = self->_figPlaybackCoordinatorConfigQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __111__AVPlayerPlaybackCoordinator__updateTransportControlStateDictionaryOnFigPlaybackCoordinatorForItemIdentifier___block_invoke;
    block[3] = &unk_1E302FEE0;
    block[4] = self;
    block[5] = a3;
    block[6] = v5;
    dispatch_async(figPlaybackCoordinatorConfigQueue, block);
  }
  else
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

void __111__AVPlayerPlaybackCoordinator__updateTransportControlStateDictionaryOnFigPlaybackCoordinatorForItemIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  float v3;
  float v4;
  float v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(uint64_t, uint64_t);
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  const void *v15;
  CMTime v16;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  uint64_t v23;
  CMTime v24[5];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = &v18;
  v20 = 0x3052000000;
  v21 = __Block_byref_object_copy__33;
  v22 = __Block_byref_object_dispose__33;
  v23 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __111__AVPlayerPlaybackCoordinator__updateTransportControlStateDictionaryOnFigPlaybackCoordinatorForItemIdentifier___block_invoke_2;
  v17[3] = &unk_1E3034C18;
  v2 = *(void **)(a1 + 32);
  v17[4] = *(_QWORD *)(a1 + 40);
  v17[5] = &v18;
  objc_msgSend(v2, "_storageRead:", v17);
  memset(&v16, 0, sizeof(v16));
  objc_msgSend((id)objc_msgSend((id)v19[5], "objectForKeyedSubscript:", CFSTR("Time")), "floatValue");
  CMTimeMakeWithSeconds(&v16, v3, 1000);
  objc_msgSend((id)objc_msgSend((id)v19[5], "objectForKeyedSubscript:", CFSTR("Rate")), "floatValue");
  v5 = v4;
  v6 = objc_msgSend(*(id *)(a1 + 32), "interstitialPlaybackCoordinator");
  v7 = *(void **)(a1 + 32);
  if (v6 && v5 == 0.0)
  {
    v24[0] = v16;
    objc_msgSend(v7, "_applyIntegratedTimelineSeek:", v24);
  }
  else if (objc_msgSend(v7, "interstitialPlaybackCoordinator") && v5 != 0.0)
  {
    v8 = objc_msgSend((id)v19[5], "objectForKeyedSubscript:", CFSTR("NetworkTime"));
    v9 = objc_msgSend((id)v19[5], "objectForKeyedSubscript:", CFSTR("Rate"));
    v10 = *(void **)(a1 + 32);
    v24[0] = v16;
    objc_msgSend(v10, "_applyAdjustedIntegratedSeekTimeFromTime:withNetworkTime:rate:", v24, v8, v9);
  }
  v11 = *(_QWORD *)(a1 + 48);
  v12 = v19[5];
  v13 = *(unsigned int (**)(uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 80);
  if (!v13 || v13(v11, v12))
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }

  v15 = *(const void **)(a1 + 48);
  if (v15)
    CFRelease(v15);
  _Block_object_dispose(&v18, 8);
}

uint64_t __111__AVPlayerPlaybackCoordinator__updateTransportControlStateDictionaryOnFigPlaybackCoordinatorForItemIdentifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a2 + 16), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32)), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)handleNewParticipantStateDictionary:(id)a3
{
  uint64_t v5;

  -[AVPlayerPlaybackCoordinator _updateParticipantStateDictionaryWithParticipantState:](self, "_updateParticipantStateDictionaryWithParticipantState:");
  -[AVPlayerPlaybackCoordinator _removeUnusedTransportControlStates](self, "_removeUnusedTransportControlStates");
  v5 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("UUID"));
  -[AVPlayerPlaybackCoordinator _updateParticipantStateOnFigPlaybackCoordinatorForItemWithIdentifier:](self, "_updateParticipantStateOnFigPlaybackCoordinatorForItemWithIdentifier:", v5);
  objc_msgSend(-[AVPlayerPlaybackCoordinator interstitialPlaybackCoordinator](self, "interstitialPlaybackCoordinator"), "_updateParticipantStateOnFigPlaybackCoordinatorForItemWithIdentifier:", v5);
}

- (void)_updateParticipantStateOnFigPlaybackCoordinatorForItemWithIdentifier:(id)a3
{
  OpaqueFigPlaybackCoordinator *v5;
  NSObject *figPlaybackCoordinatorConfigQueue;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _QWORD block[27];

  block[26] = *MEMORY[0x1E0C80C00];
  v5 = -[AVPlayerPlaybackCoordinator _copyFigPlaybackCoordinator](self, "_copyFigPlaybackCoordinator");
  if (v5)
  {
    figPlaybackCoordinatorConfigQueue = self->_figPlaybackCoordinatorConfigQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __100__AVPlayerPlaybackCoordinator__updateParticipantStateOnFigPlaybackCoordinatorForItemWithIdentifier___block_invoke;
    block[3] = &unk_1E302FEE0;
    block[4] = self;
    block[5] = a3;
    block[6] = v5;
    dispatch_async(figPlaybackCoordinatorConfigQueue, block);
  }
  else
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

void __100__AVPlayerPlaybackCoordinator__updateParticipantStateOnFigPlaybackCoordinatorForItemWithIdentifier___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int (*v5)(uint64_t, uint64_t);
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  const void *v7;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__33;
  v13 = __Block_byref_object_dispose__33;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __100__AVPlayerPlaybackCoordinator__updateParticipantStateOnFigPlaybackCoordinatorForItemWithIdentifier___block_invoke_2;
  v8[3] = &unk_1E3034C18;
  v2 = (void *)a1[4];
  v8[4] = a1[5];
  v8[5] = &v9;
  objc_msgSend(v2, "_storageRead:", v8);
  v3 = a1[6];
  v4 = v10[5];
  v5 = *(unsigned int (**)(uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 96);
  if (!v5 || v5(v3, v4))
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }

  v7 = (const void *)a1[6];
  if (v7)
    CFRelease(v7);
  _Block_object_dispose(&v9, 8);
}

uint64_t __100__AVPlayerPlaybackCoordinator__updateParticipantStateOnFigPlaybackCoordinatorForItemWithIdentifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a2 + 24), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32)), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)handleReplacementParticipantStateDictionaries:(id)a3
{
  uint64_t v4;
  OpaqueFigPlaybackCoordinator *v5;
  NSObject *figPlaybackCoordinatorConfigQueue;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _QWORD block[6];
  _QWORD v9[25];

  v4 = MEMORY[0x1E0C809B0];
  v9[24] = *MEMORY[0x1E0C80C00];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__AVPlayerPlaybackCoordinator_handleReplacementParticipantStateDictionaries___block_invoke;
  v9[3] = &unk_1E3034BD0;
  v9[4] = a3;
  -[AVPlayerPlaybackCoordinator _storageWrite:](self, "_storageWrite:", v9);
  -[AVPlayerPlaybackCoordinator _removeUnusedTransportControlStates](self, "_removeUnusedTransportControlStates");
  v5 = -[AVPlayerPlaybackCoordinator _copyFigPlaybackCoordinator](self, "_copyFigPlaybackCoordinator");
  if (v5)
  {
    figPlaybackCoordinatorConfigQueue = self->_figPlaybackCoordinatorConfigQueue;
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __77__AVPlayerPlaybackCoordinator_handleReplacementParticipantStateDictionaries___block_invoke_2;
    block[3] = &unk_1E302FE78;
    block[4] = self;
    block[5] = v5;
    dispatch_async(figPlaybackCoordinatorConfigQueue, block);
  }
  else
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

uint64_t __77__AVPlayerPlaybackCoordinator_handleReplacementParticipantStateDictionaries___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a2 + 24), "removeAllObjects");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = *(void **)(a1 + 32);
  result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (result)
  {
    v6 = result;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(a2 + 24), "setObject:forKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8), objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8), "objectForKeyedSubscript:", CFSTR("UUID")));
        ++v8;
      }
      while (v6 != v8);
      result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v6 = result;
    }
    while (result);
  }
  return result;
}

void __77__AVPlayerPlaybackCoordinator_handleReplacementParticipantStateDictionaries___block_invoke_2(uint64_t a1)
{
  const void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_replaceAllParticipantStateDictionariesOnFigPlaybackCoordinator:", *(_QWORD *)(a1 + 40));
  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRelease(v2);
}

- (void)_replaceAllParticipantStateDictionariesOnFigPlaybackCoordinator:(OpaqueFigPlaybackCoordinator *)a3
{
  uint64_t v4;
  unsigned int (*v5)(OpaqueFigPlaybackCoordinator *, uint64_t);
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__33;
  v12 = __Block_byref_object_dispose__33;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __95__AVPlayerPlaybackCoordinator__replaceAllParticipantStateDictionariesOnFigPlaybackCoordinator___block_invoke;
  v7[3] = &unk_1E3034B58;
  v7[4] = &v8;
  -[AVPlayerPlaybackCoordinator _storageRead:](self, "_storageRead:", v7);
  v4 = v9[5];
  v5 = *(unsigned int (**)(OpaqueFigPlaybackCoordinator *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                              + 88);
  if (!v5 || v5(a3, v4))
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }

  _Block_object_dispose(&v8, 8);
}

uint64_t __95__AVPlayerPlaybackCoordinator__replaceAllParticipantStateDictionariesOnFigPlaybackCoordinator___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a2 + 24), "allValues"), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (void)handleRemovalOfParticipant:(id)a3
{
  uint64_t v5;
  OpaqueFigPlaybackCoordinator *v6;
  NSObject *figPlaybackCoordinatorConfigQueue;
  _QWORD block[6];
  _QWORD v9[5];

  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__AVPlayerPlaybackCoordinator_handleRemovalOfParticipant___block_invoke;
  v9[3] = &unk_1E3034BD0;
  v9[4] = a3;
  -[AVPlayerPlaybackCoordinator _storageWrite:](self, "_storageWrite:", v9);
  -[AVPlayerPlaybackCoordinator _removeUnusedTransportControlStates](self, "_removeUnusedTransportControlStates");
  v6 = -[AVPlayerPlaybackCoordinator _copyFigPlaybackCoordinator](self, "_copyFigPlaybackCoordinator");
  if (v6)
  {
    figPlaybackCoordinatorConfigQueue = self->_figPlaybackCoordinatorConfigQueue;
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __58__AVPlayerPlaybackCoordinator_handleRemovalOfParticipant___block_invoke_2;
    block[3] = &unk_1E302FE78;
    block[4] = a3;
    block[5] = v6;
    dispatch_async(figPlaybackCoordinatorConfigQueue, block);
  }
}

uint64_t __58__AVPlayerPlaybackCoordinator_handleRemovalOfParticipant___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a2 + 24), "removeObjectForKey:", objc_msgSend(*(id *)(a1 + 32), "UUIDString"));
}

void __58__AVPlayerPlaybackCoordinator_handleRemovalOfParticipant___block_invoke_2(uint64_t a1)
{
  void *v2;
  CFUUIDRef v3;
  uint64_t v4;
  void (*v5)(uint64_t, CFUUIDRef);
  const void *v6;

  v2 = *(void **)(a1 + 32);
  if (v2)
    v3 = CFUUIDCreateFromString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFStringRef)objc_msgSend(v2, "UUIDString"));
  else
    v3 = 0;
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void (**)(uint64_t, CFUUIDRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 64);
  if (v5)
    v5(v4, v3);
  if (v3)
    CFRelease(v3);
  v6 = *(const void **)(a1 + 40);
  if (v6)
    CFRelease(v6);
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
  block[2] = __56__AVPlayerPlaybackCoordinator__updateSuspensionReasons___block_invoke;
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

uint64_t __56__AVPlayerPlaybackCoordinator__updateSuspensionReasons___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = AVPlaybackCoordinatorArrayContainsSameElementsAsArray(*(_QWORD *)(a1[4] + 48), a1[5]);
  if ((result & 1) == 0)
  {

    result = objc_msgSend((id)a1[5], "copy");
    *(_QWORD *)(a1[4] + 48) = result;
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
  v9 = __Block_byref_object_copy__33;
  v10 = __Block_byref_object_dispose__33;
  v11 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__AVPlayerPlaybackCoordinator_suspensionReasons__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __48__AVPlayerPlaybackCoordinator_suspensionReasons__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)beginSuspensionForReason:(id)a3
{
  AVCoordinatedPlaybackSuspension *v5;
  NSObject *ivarAccessQueue;
  OpaqueFigPlaybackCoordinator *v7;
  OpaqueFigPlaybackCoordinator *v8;
  uint64_t v9;
  void (*v10)(OpaqueFigPlaybackCoordinator *, uint64_t);
  _QWORD v12[6];

  v5 = -[AVCoordinatedPlaybackSuspension initWithCoordinator:reason:]([AVCoordinatedPlaybackSuspension alloc], "initWithCoordinator:reason:", self, a3);
  ivarAccessQueue = self->_ivarAccessQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __56__AVPlayerPlaybackCoordinator_beginSuspensionForReason___block_invoke;
  v12[3] = &unk_1E302FCE8;
  v12[4] = self;
  v12[5] = v5;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v12);
  v7 = -[AVPlayerPlaybackCoordinator _copyFigPlaybackCoordinator](self, "_copyFigPlaybackCoordinator");
  if (v7)
  {
    v8 = v7;
    v9 = -[AVCoordinatedPlaybackSuspension _figSuspension](v5, "_figSuspension");
    v10 = *(void (**)(OpaqueFigPlaybackCoordinator *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                         + 8);
    if (v10)
      v10(v8, v9);
    CFRelease(v8);
  }
  objc_msgSend(-[AVPlayerPlaybackCoordinator interstitialPlaybackCoordinator](self, "interstitialPlaybackCoordinator"), "beginSuspensionForReason:", a3);
  return v5;
}

uint64_t __56__AVPlayerPlaybackCoordinator_beginSuspensionForReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "addObject:", objc_msgSend(*(id *)(a1 + 40), "_figSuspension"));
}

- (void)_synchronizeFigPlayerEvents
{
  OpaqueFigPlayer *v2;
  OpaqueFigPlayer *v3;
  uint64_t FigBaseObject;
  void (*v5)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  CFTypeRef cf;

  v2 = -[AVPlayer _copyFigPlayer](-[AVPlayerPlaybackCoordinator player](self, "player"), "_copyFigPlayer");
  if (v2)
  {
    v3 = v2;
    cf = 0;
    FigBaseObject = FigPlayerGetFigBaseObject();
    v5 = *(void (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (v5)
    {
      v5(FigBaseObject, *MEMORY[0x1E0CC5B58], *MEMORY[0x1E0C9AE00], &cf);
      if (cf)
        CFRelease(cf);
    }
    CFRelease(v3);
  }
}

- (void)_synchronizeWorkOnPlayerQueue:(id)a3
{
  OpaqueFigPlayer *v5;
  OpaqueFigPlayer *v6;

  v5 = -[AVPlayer _copyFigPlayer](-[AVPlayerPlaybackCoordinator player](self, "player"), "_copyFigPlayer");
  if (v5)
  {
    v6 = v5;
    if (FigPlayerAsyncDispatchToPlayerQueue())
    {
      -[AVPlayerPlaybackCoordinator _synchronizeFigPlayerEvents](self, "_synchronizeFigPlayerEvents");
      (*((void (**)(id))a3 + 2))(a3);
    }
    CFRelease(v6);
  }
  else
  {
    -[AVPlayerPlaybackCoordinator _synchronizeFigPlayerEvents](self, "_synchronizeFigPlayerEvents");
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)_endSuspension:(OpaqueFigTimelineCoordinatorSuspension *)a3
{
  NSObject *ivarAccessQueue;
  uint64_t v6;
  OpaqueFigPlaybackCoordinator *v7;
  OpaqueFigPlaybackCoordinator *v8;
  _QWORD v9[6];
  _QWORD block[6];

  ivarAccessQueue = self->_ivarAccessQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__AVPlayerPlaybackCoordinator__endSuspension___block_invoke;
  block[3] = &unk_1E302FE78;
  block[4] = self;
  block[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v7 = -[AVPlayerPlaybackCoordinator _copyFigPlaybackCoordinator](self, "_copyFigPlaybackCoordinator");
  if (v7)
  {
    v8 = v7;
    if (a3)
      CFRetain(a3);
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __46__AVPlayerPlaybackCoordinator__endSuspension___block_invoke_2;
    v9[3] = &__block_descriptor_48_e5_v8__0l;
    v9[4] = v8;
    v9[5] = a3;
    -[AVPlayerPlaybackCoordinator _synchronizeWorkOnPlayerQueue:](self, "_synchronizeWorkOnPlayerQueue:", v9);
  }
}

uint64_t __46__AVPlayerPlaybackCoordinator__endSuspension___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeObject:", *(_QWORD *)(a1 + 40));
}

void __46__AVPlayerPlaybackCoordinator__endSuspension___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  const void *v5;
  const void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
  if (v4)
    v4(v2, v3);
  v5 = *(const void **)(a1 + 40);
  if (v5)
    CFRelease(v5);
  v6 = *(const void **)(a1 + 32);
  if (v6)
    CFRelease(v6);
}

- (void)_endSuspension:(OpaqueFigTimelineCoordinatorSuspension *)a3 proposingNewTime:(id *)a4
{
  NSObject *ivarAccessQueue;
  uint64_t v8;
  OpaqueFigPlaybackCoordinator *v9;
  OpaqueFigPlaybackCoordinator *v10;
  _QWORD v11[6];
  __int128 v12;
  int64_t var3;
  _QWORD block[6];

  ivarAccessQueue = self->_ivarAccessQueue;
  v8 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__AVPlayerPlaybackCoordinator__endSuspension_proposingNewTime___block_invoke;
  block[3] = &unk_1E302FE78;
  block[4] = self;
  block[5] = a3;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v9 = -[AVPlayerPlaybackCoordinator _copyFigPlaybackCoordinator](self, "_copyFigPlaybackCoordinator");
  if (v9)
  {
    v10 = v9;
    if (a3)
      CFRetain(a3);
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __63__AVPlayerPlaybackCoordinator__endSuspension_proposingNewTime___block_invoke_2;
    v11[3] = &__block_descriptor_72_e5_v8__0l;
    v11[4] = v10;
    v11[5] = a3;
    v12 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    -[AVPlayerPlaybackCoordinator _synchronizeWorkOnPlayerQueue:](self, "_synchronizeWorkOnPlayerQueue:", v11);
  }
}

uint64_t __63__AVPlayerPlaybackCoordinator__endSuspension_proposingNewTime___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeObject:", *(_QWORD *)(a1 + 40));
}

void __63__AVPlayerPlaybackCoordinator__endSuspension_proposingNewTime___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t, __int128 *);
  const void *v5;
  const void *v6;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v7 = *(_OWORD *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 64);
  v4 = *(void (**)(uint64_t, uint64_t, __int128 *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
  if (v4)
  {
    v9 = v7;
    v10 = v8;
    v4(v2, v3, &v9);
  }
  v5 = *(const void **)(a1 + 40);
  if (v5)
    CFRelease(v5);
  v6 = *(const void **)(a1 + 32);
  if (v6)
    CFRelease(v6);
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
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3052000000;
  v8 = __Block_byref_object_copy__33;
  v9 = __Block_byref_object_dispose__33;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__AVPlayerPlaybackCoordinator__currentWaitingPoliciesArray__block_invoke;
  v4[3] = &unk_1E3034B58;
  v4[4] = &v5;
  -[AVPlayerPlaybackCoordinator _storageRead:](self, "_storageRead:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __59__AVPlayerPlaybackCoordinator__currentWaitingPoliciesArray__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a2 + 56), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (void)_updateWaitingPoliciesOnFigPlaybackCoordinator:(OpaqueFigPlaybackCoordinator *)a3
{
  id v3;
  uint64_t CMBaseObject;
  void (*v5)(uint64_t, _QWORD, id);

  v3 = -[AVPlayerPlaybackCoordinator _currentWaitingPoliciesArray](self, "_currentWaitingPoliciesArray");
  CMBaseObject = FigPlaybackCoordinatorGetCMBaseObject();
  v5 = *(void (**)(uint64_t, _QWORD, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v5)
    v5(CMBaseObject, *MEMORY[0x1E0CA5378], v3);
}

- (void)setParticipantLimit:(int64_t)a3 forWaitingOutSuspensionsWithReason:(id)a4
{
  _QWORD v6[7];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __86__AVPlayerPlaybackCoordinator_setParticipantLimit_forWaitingOutSuspensionsWithReason___block_invoke;
  v6[3] = &unk_1E3034C60;
  v6[5] = self;
  v6[6] = a3;
  v6[4] = a4;
  -[AVPlayerPlaybackCoordinator _storageWrite:](self, "_storageWrite:", v6);
  -[AVPlayerPlaybackCoordinator _updateParticipantLimitOnFigPlaybackCoordinatorWithReason:](self, "_updateParticipantLimitOnFigPlaybackCoordinatorWithReason:", a4);
  objc_msgSend(-[AVPlayerPlaybackCoordinator interstitialPlaybackCoordinator](self, "interstitialPlaybackCoordinator"), "_updateParticipantLimitOnFigPlaybackCoordinatorWithReason:", a4);
}

uint64_t __86__AVPlayerPlaybackCoordinator_setParticipantLimit_forWaitingOutSuspensionsWithReason___block_invoke(uint64_t a1, uint64_t a2)
{
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a2 + 32), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48)), *(_QWORD *)(a1 + 32));
  v4 = objc_msgSend(*(id *)(a2 + 40), "containsObject:", *(_QWORD *)(a1 + 32));
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = AVPlaybackCoordinatorFigSuspensionReasonForAVFReason(*(void **)(a1 + 32));
  v7 = *MEMORY[0x1E0CA53F0];
  v8 = (uint64_t *)MEMORY[0x1E0C9AE50];
  if (!v4)
    v8 = (uint64_t *)MEMORY[0x1E0C9AE40];
  v9 = *v8;
  v10 = *MEMORY[0x1E0CA53E8];
  v11 = objc_msgSend(*(id *)(a2 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v12 = objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", v6, v7, v9, v10, v11, *MEMORY[0x1E0CA53E0], 0);
  v13 = *(void **)(a1 + 40);
  v14 = *(_QWORD *)(a2 + 56);
  v16[0] = v12;
  return objc_msgSend(v13, "_updateWaitingPoliciesArray:withPolicies:", v14, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1));
}

- (void)_updateParticipantLimitOnFigPlaybackCoordinatorWithReason:(id)a3
{
  OpaqueFigPlaybackCoordinator *v4;
  NSObject *figPlaybackCoordinatorConfigQueue;
  _QWORD v6[6];

  v4 = -[AVPlayerPlaybackCoordinator _copyFigPlaybackCoordinator](self, "_copyFigPlaybackCoordinator", a3);
  if (v4)
  {
    figPlaybackCoordinatorConfigQueue = self->_figPlaybackCoordinatorConfigQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __89__AVPlayerPlaybackCoordinator__updateParticipantLimitOnFigPlaybackCoordinatorWithReason___block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_async(figPlaybackCoordinatorConfigQueue, v6);
  }
}

void __89__AVPlayerPlaybackCoordinator__updateParticipantLimitOnFigPlaybackCoordinatorWithReason___block_invoke(uint64_t a1)
{
  const void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_updateWaitingPoliciesOnFigPlaybackCoordinator:", *(_QWORD *)(a1 + 40));
  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRelease(v2);
}

- (int64_t)participantLimitForWaitingOutSuspensionsWithReason:(id)a3
{
  void *v3;
  int64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__33;
  v11 = __Block_byref_object_dispose__33;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __82__AVPlayerPlaybackCoordinator_participantLimitForWaitingOutSuspensionsWithReason___block_invoke;
  v6[3] = &unk_1E3034C18;
  v6[4] = a3;
  v6[5] = &v7;
  -[AVPlayerPlaybackCoordinator _storageRead:](self, "_storageRead:", v6);
  v3 = (void *)v8[5];
  if (v3)
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = 0x7FFFFFFFFFFFFFFFLL;
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __82__AVPlayerPlaybackCoordinator_participantLimitForWaitingOutSuspensionsWithReason___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a2 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setSuspensionReasonsThatTriggerWaiting:(id)a3
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __70__AVPlayerPlaybackCoordinator_setSuspensionReasonsThatTriggerWaiting___block_invoke;
  v4[3] = &unk_1E3034BA8;
  v4[4] = a3;
  v4[5] = self;
  -[AVPlayerPlaybackCoordinator _storageWrite:](self, "_storageWrite:", v4);
  -[AVPlayerPlaybackCoordinator _updateSuspensionReasonsThatTriggerWaitingOFigPlaybackCoordinator](self, "_updateSuspensionReasonsThatTriggerWaitingOFigPlaybackCoordinator");
  objc_msgSend(-[AVPlayerPlaybackCoordinator interstitialPlaybackCoordinator](self, "interstitialPlaybackCoordinator"), "_updateSuspensionReasonsThatTriggerWaitingOFigPlaybackCoordinator");
}

uint64_t __70__AVPlayerPlaybackCoordinator_setSuspensionReasonsThatTriggerWaiting___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[5];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if ((AVPlaybackCoordinatorArrayContainsSameElementsAsArray(*(_QWORD *)(a2 + 40), *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", *(_QWORD *)(a2 + 40));
    objc_msgSend(v5, "removeObjectsInArray:", v4);
    if (objc_msgSend(v5, "count"))
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __70__AVPlayerPlaybackCoordinator_setSuspensionReasonsThatTriggerWaiting___block_invoke_2;
      v22[3] = &unk_1E3030F20;
      v22[4] = a2;
      objc_msgSend(v5, "enumerateObjectsUsingBlock:", v22);
    }

    *(_QWORD *)(a2 + 40) = objc_msgSend(*(id *)(a1 + 32), "copy");
  }
  v16 = a1;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v17 = a2;
  v7 = *(void **)(a2 + 40);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    v11 = *MEMORY[0x1E0CA53F0];
    v12 = *MEMORY[0x1E0C9AE50];
    v13 = *MEMORY[0x1E0CA53E8];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", AVPlaybackCoordinatorFigSuspensionReasonForAVFReason(*(void **)(*((_QWORD *)&v18 + 1) + 8 * i)), v11, v12, v13, 0));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v9);
  }
  return objc_msgSend(*(id *)(v16 + 40), "_updateWaitingPoliciesArray:withPolicies:", *(_QWORD *)(v17 + 56), v6);
}

uint64_t __70__AVPlayerPlaybackCoordinator_setSuspensionReasonsThatTriggerWaiting___block_invoke_2(uint64_t a1, void *a2)
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
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
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
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObject:", v10);
}

- (void)_updateSuspensionReasonsThatTriggerWaitingOFigPlaybackCoordinator
{
  OpaqueFigPlaybackCoordinator *v3;
  NSObject *figPlaybackCoordinatorConfigQueue;
  _QWORD v5[6];

  v3 = -[AVPlayerPlaybackCoordinator _copyFigPlaybackCoordinator](self, "_copyFigPlaybackCoordinator");
  if (v3)
  {
    figPlaybackCoordinatorConfigQueue = self->_figPlaybackCoordinatorConfigQueue;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __96__AVPlayerPlaybackCoordinator__updateSuspensionReasonsThatTriggerWaitingOFigPlaybackCoordinator__block_invoke;
    v5[3] = &unk_1E302FE78;
    v5[4] = self;
    v5[5] = v3;
    dispatch_async(figPlaybackCoordinatorConfigQueue, v5);
  }
}

void __96__AVPlayerPlaybackCoordinator__updateSuspensionReasonsThatTriggerWaitingOFigPlaybackCoordinator__block_invoke(uint64_t a1)
{
  const void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_updateWaitingPoliciesOnFigPlaybackCoordinator:", *(_QWORD *)(a1 + 40));
  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRelease(v2);
}

- (void)setPauseSnapsToMediaTimeOfOriginator:(BOOL)a3
{
  _QWORD v4[4];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__AVPlayerPlaybackCoordinator_setPauseSnapsToMediaTimeOfOriginator___block_invoke;
  v4[3] = &__block_descriptor_33_e44_v16__0__AVPlayerPlaybackCoordinatorStorage_8l;
  v5 = a3;
  -[AVPlayerPlaybackCoordinator _storageWrite:](self, "_storageWrite:", v4);
  -[AVPlayerPlaybackCoordinator _updatePauseSnapsToMediaTimeOfOriginatorOnFigPlaybackCoordinator](self, "_updatePauseSnapsToMediaTimeOfOriginatorOnFigPlaybackCoordinator");
  objc_msgSend(-[AVPlayerPlaybackCoordinator interstitialPlaybackCoordinator](self, "interstitialPlaybackCoordinator"), "_updatePauseSnapsToMediaTimeOfOriginatorOnFigPlaybackCoordinator");
}

uint64_t __68__AVPlayerPlaybackCoordinator_setPauseSnapsToMediaTimeOfOriginator___block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(a2 + 48) = *(_BYTE *)(result + 32);
  return result;
}

- (void)_updatePauseSnapsToMediaTimeOfOriginatorOnFigPlaybackCoordinator
{
  OpaqueFigPlaybackCoordinator *v3;
  NSObject *figPlaybackCoordinatorConfigQueue;
  _QWORD v5[6];

  v3 = -[AVPlayerPlaybackCoordinator _copyFigPlaybackCoordinator](self, "_copyFigPlaybackCoordinator");
  if (v3)
  {
    figPlaybackCoordinatorConfigQueue = self->_figPlaybackCoordinatorConfigQueue;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __95__AVPlayerPlaybackCoordinator__updatePauseSnapsToMediaTimeOfOriginatorOnFigPlaybackCoordinator__block_invoke;
    v5[3] = &unk_1E302FE78;
    v5[4] = self;
    v5[5] = v3;
    dispatch_async(figPlaybackCoordinatorConfigQueue, v5);
  }
}

void __95__AVPlayerPlaybackCoordinator__updatePauseSnapsToMediaTimeOfOriginatorOnFigPlaybackCoordinator__block_invoke(uint64_t a1)
{
  int v2;
  uint64_t CMBaseObject;
  void (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;
  const void *v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "pauseSnapsToMediaTimeOfOriginator");
  CMBaseObject = FigPlaybackCoordinatorGetCMBaseObject();
  v4 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
  {
    if (v2)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    v4(CMBaseObject, *MEMORY[0x1E0CA5370], v5);
  }
  v6 = *(const void **)(a1 + 40);
  if (v6)
    CFRelease(v6);
}

- (void)_applyIntegratedTimelineSeek:(id *)a3
{
  uint64_t v5;
  CMTimeEpoch epoch;
  id v7;
  CMTimeFlags flags;
  CMTimeScale v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  CMTime v14;
  CMTime rhs;
  CMTime time;
  CMTime lhs;
  CMTime v18;
  CMTime v19;
  _QWORD v20[2];
  _QWORD v21[2];
  CMTimeValue v22;
  CMTimeScale v23;
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  memset(&v19, 0, sizeof(v19));
  CMTimeMake(&v19, 1, 10);
  v5 = MEMORY[0x1E0CA2E18];
  value = *MEMORY[0x1E0CA2E18];
  timescale = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 8);
  epoch = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  *(_OWORD *)&v18.value = *MEMORY[0x1E0CA2E18];
  v18.epoch = epoch;
  if ((a3->var2 & 1) != 0)
  {
    if (!-[AVPlayerPlaybackCoordinator integratedTimeline](self, "integratedTimeline"))
      -[AVPlayerPlaybackCoordinator _setIntegratedTimelineCreatingNew:](self, "_setIntegratedTimelineCreatingNew:", 0);
    if (-[AVPlayerPlaybackCoordinator integratedTimeline](self, "integratedTimeline")
      && !objc_msgSend(-[AVPlayerPlaybackCoordinator suspensionReasons](self, "suspensionReasons"), "count"))
    {
      if (objc_msgSend(-[AVPlayerPlaybackCoordinator integratedTimeline](self, "integratedTimeline"), "_getPendingSeekID"))
      {
        v7 = -[AVPlayerPlaybackCoordinator integratedTimeline](self, "integratedTimeline");
        if (v7)
        {
          objc_msgSend(v7, "_getPendingSeekTime");
          flags = lhs.flags;
          epoch = lhs.epoch;
        }
        else
        {
          epoch = 0;
          flags = 0;
          memset(&lhs, 0, sizeof(lhs));
        }
        value = lhs.value;
        timescale = lhs.timescale;
        if ((flags & 1) == 0)
          goto LABEL_13;
      }
      else
      {
        flags = *(_DWORD *)(v5 + 12);
        if ((flags & 1) == 0)
        {
LABEL_13:
          v10 = -[AVPlayerPlaybackCoordinator integratedTimeline](self, "integratedTimeline");
          if (v10)
          {
            objc_msgSend(v10, "currentTime");
            flags = lhs.flags;
            epoch = lhs.epoch;
          }
          else
          {
            epoch = 0;
            flags = 0;
            memset(&lhs, 0, sizeof(lhs));
          }
          v22 = lhs.value;
          v9 = lhs.timescale;
          goto LABEL_17;
        }
      }
      v22 = value;
      v9 = timescale;
LABEL_17:
      v23 = v9;
      lhs = (CMTime)*a3;
      rhs.value = v22;
      rhs.timescale = v9;
      rhs.flags = flags;
      rhs.epoch = epoch;
      CMTimeSubtract(&time, &lhs, &rhs);
      CMTimeAbsoluteValue(&v18, &time);
      lhs = v18;
      rhs = v19;
      if (CMTimeCompare(&lhs, &rhs) >= 1)
      {
        v20[0] = *MEMORY[0x1E0CC5490];
        v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 32);
        v20[1] = *MEMORY[0x1E0CC5488];
        v21[0] = v11;
        v21[1] = &unk_1E3093730;
        v12 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
        v13 = -[AVPlayerPlaybackCoordinator integratedTimeline](self, "integratedTimeline");
        lhs = (CMTime)*a3;
        rhs = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
        v14 = rhs;
        objc_msgSend(v13, "_seekToTime:toleranceBefore:toleranceAfter:options:completionHandler:", &lhs, &rhs, &v14, v12, 0);
      }
    }
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)networkToHostTimeOffset
{
  NSObject *ivarAccessQueue;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  _QWORD block[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3810000000;
  v10 = &unk_1935931BF;
  v11 = *MEMORY[0x1E0CA2E18];
  v12 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__AVPlayerPlaybackCoordinator_networkToHostTimeOffset__block_invoke;
  block[3] = &unk_1E302FD60;
  block[4] = self;
  block[5] = &v7;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, block);
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v8 + 4);
  _Block_object_dispose(&v7, 8);
  return result;
}

__n128 __54__AVPlayerPlaybackCoordinator_networkToHostTimeOffset__block_invoke(uint64_t a1)
{
  __n128 *v1;
  __n128 *v2;
  unint64_t v3;
  __n128 result;

  v1 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
  v2 = (__n128 *)(*(_QWORD *)(a1 + 32) + 112);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128);
  result = *v2;
  v1[2] = *v2;
  v1[3].n128_u64[0] = v3;
  return result;
}

- (void)_setNetworkToHostTimeOffset
{
  OpaqueFigPlaybackCoordinator *v3;
  OpaqueFigPlaybackCoordinator *v4;
  uint64_t CMBaseObject;
  void (*v6)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  CFTypeID v7;
  NSObject *ivarAccessQueue;
  _QWORD v9[5];
  CMTime v10;
  CMTime v11;
  CFTypeRef v12;

  v3 = -[AVPlayerPlaybackCoordinator _copyFigPlaybackCoordinator](self, "_copyFigPlaybackCoordinator");
  if (v3)
  {
    v4 = v3;
    v12 = 0;
    v11 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
    CMBaseObject = FigPlaybackCoordinatorGetCMBaseObject();
    v6 = *(void (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (v6)
    {
      v6(CMBaseObject, *MEMORY[0x1E0CA5368], *MEMORY[0x1E0C9AE00], &v12);
      if (v12)
      {
        v7 = CFGetTypeID(v12);
        if (v7 == CFDictionaryGetTypeID())
          CMTimeMakeFromDictionary(&v11, (CFDictionaryRef)v12);
      }
    }
    ivarAccessQueue = self->_ivarAccessQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __58__AVPlayerPlaybackCoordinator__setNetworkToHostTimeOffset__block_invoke;
    v9[3] = &unk_1E3031E68;
    v9[4] = self;
    v10 = v11;
    av_readwrite_dispatch_queue_write(ivarAccessQueue, v9);
    if (v12)
      CFRelease(v12);
    CFRelease(v4);
  }
}

__n128 __58__AVPlayerPlaybackCoordinator__setNetworkToHostTimeOffset__block_invoke(uint64_t a1)
{
  __n128 *v1;
  unint64_t v2;
  __n128 result;

  v1 = (__n128 *)(*(_QWORD *)(a1 + 32) + 112);
  v2 = *(_QWORD *)(a1 + 56);
  result = *(__n128 *)(a1 + 40);
  *v1 = result;
  v1[1].n128_u64[0] = v2;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_convertToMediaTimeForTime:(SEL)a3 withNetworkTime:(id *)a4 rate:(id)a5
{
  uint64_t v10;
  __int128 v11;
  int64_t v12;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *v13;
  OpaqueCMClock *HostTimeClock;
  CMTimeEpoch epoch;
  float v16;
  Float64 v17;
  __int128 v18;
  CMTime time;
  CMTime v20;
  CMTime rhs;
  CMTime lhs;
  void *v23;
  void *value;
  CMTime v25;
  CMTime v26;
  CMTime v27;
  CMTime v28;

  *(_QWORD *)&v28.timescale = 0;
  v10 = MEMORY[0x1E0CA2E18];
  v11 = *MEMORY[0x1E0CA2E18];
  *(_OWORD *)&retstr->var0 = *MEMORY[0x1E0CA2E18];
  v12 = *(_QWORD *)(v10 + 16);
  retstr->var3 = v12;
  v28.value = 0;
  v28.epoch = 0;
  if (self)
  {
    v18 = v11;
    self = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE networkToHostTimeOffset](self, "networkToHostTimeOffset");
    v11 = v18;
  }
  *(_OWORD *)&v27.value = v11;
  v27.epoch = v12;
  *(_OWORD *)&v26.value = v11;
  v26.epoch = v12;
  *(_OWORD *)&v25.value = v11;
  v25.epoch = v12;
  v23 = 0;
  value = 0;
  if (a5)
  {
    if ((a4->var2 & 1) != 0)
    {
      v13 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CFGetTypeID(a5);
      self = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CFDictionaryGetTypeID();
      if (v13 == self)
      {
        CFDictionaryGetValueIfPresent((CFDictionaryRef)a5, (const void *)*MEMORY[0x1E0CA5328], (const void **)&value);
        CFDictionaryGetValueIfPresent((CFDictionaryRef)a5, (const void *)*MEMORY[0x1E0CA5330], (const void **)&v23);
        FigCFNumberGetUInt64();
        FigCFNumberGetUInt64();
        FigTimeOfDayTimeFromNTPTimestamp();
        lhs = v28;
        rhs = v27;
        CMTimeAdd(&v26, &lhs, &rhs);
        HostTimeClock = CMClockGetHostTimeClock();
        CMClockGetTime(&v25, HostTimeClock);
        lhs = v26;
        rhs = v25;
        self = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeCompare(&lhs, &rhs);
        if ((self & 0x80000000) != 0)
        {
          objc_msgSend(a6, "floatValue");
          v17 = v16;
          lhs = v25;
          rhs = v26;
          CMTimeSubtract(&time, &lhs, &rhs);
          CMTimeMultiplyByFloat64(&v20, &time, v17);
          rhs = (CMTime)*a4;
          self = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeAdd(&lhs, &rhs, &v20);
          *(_OWORD *)&retstr->var0 = *(_OWORD *)&lhs.value;
          epoch = lhs.epoch;
        }
        else
        {
          *(_OWORD *)&retstr->var0 = *(_OWORD *)&a4->var0;
          epoch = a4->var3;
        }
        retstr->var3 = epoch;
      }
    }
  }
  return self;
}

- (void)_applyAdjustedIntegratedSeekTimeFromTime:(id *)a3 withNetworkTime:(id)a4 rate:(id)a5
{
  __int128 v9;
  int64_t var3;
  __int128 v11;
  int64_t v12;
  char v13;

  if (self)
  {
    -[AVPlayerPlaybackCoordinator networkToHostTimeOffset](self, "networkToHostTimeOffset");
    if ((v13 & 1) == 0)
      -[AVPlayerPlaybackCoordinator _setNetworkToHostTimeOffset](self, "_setNetworkToHostTimeOffset");
    v11 = 0uLL;
    v12 = 0;
    v9 = *(_OWORD *)&a3->var0;
    var3 = a3->var3;
    -[AVPlayerPlaybackCoordinator _convertToMediaTimeForTime:withNetworkTime:rate:](self, "_convertToMediaTimeForTime:withNetworkTime:rate:", &v9, a4, a5);
    if ((BYTE12(v11) & 1) != 0)
    {
      v9 = v11;
      var3 = v12;
      -[AVPlayerPlaybackCoordinator _applyIntegratedTimelineSeek:](self, "_applyIntegratedTimelineSeek:", &v9);
    }
  }
  else
  {
    objc_msgSend(0, "_setNetworkToHostTimeOffset", a3, a4, a5);
  }
}

- (void)_resetGroupTimelineExpectations
{
  OpaqueFigPlaybackCoordinator *v3;
  id v4;
  void (*v5)(OpaqueFigPlaybackCoordinator *);

  v3 = -[AVPlayerPlaybackCoordinator _copyFigPlaybackCoordinator](self, "_copyFigPlaybackCoordinator");
  v4 = -[AVPlayerPlaybackCoordinator interstitialPlaybackCoordinator](self, "interstitialPlaybackCoordinator");
  if (v3)
  {
    v5 = *(void (**)(OpaqueFigPlaybackCoordinator *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 120);
    if (v5)
      v5(v3);
  }
  if (v4)
    objc_msgSend(v4, "_resetGroupTimelineExpectations");
  if (v3)
    CFRelease(v3);
}

- (BOOL)isDefunct
{
  OpaqueFigPlaybackCoordinator *v2;
  OpaqueFigPlaybackCoordinator *v3;
  _QWORD *v4;
  uint64_t (*v5)(OpaqueFigPlaybackCoordinator *, char *);
  int v6;
  char v8;

  v8 = 0;
  v2 = -[AVPlayerPlaybackCoordinator _copyFigPlaybackCoordinator](self, "_copyFigPlaybackCoordinator");
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD **)(CMBaseObjectGetVTable() + 8);
    if (*v4 < 5uLL
      || (v5 = (uint64_t (*)(OpaqueFigPlaybackCoordinator *, char *))v4[11]) == 0
      || (v6 = v5(v3, &v8), !v8) && v6)
    {
      v8 = 1;
    }
    CFRelease(v3);
    LOBYTE(v2) = v8 == 1;
  }
  return (char)v2;
}

@end
