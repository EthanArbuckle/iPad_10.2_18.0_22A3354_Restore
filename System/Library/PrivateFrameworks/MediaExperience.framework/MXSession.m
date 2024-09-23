@implementation MXSession

void __36__MXSession_InterfaceImpl___dealloc__block_invoke(_QWORD *a1)
{
  void *v2;

  v2 = *(void **)(*(_QWORD *)(a1[4] + 8) + 40);
  if (a1[6])
  {
    +[MXSession updateIsPlaying:](MXSession, "updateIsPlaying:", v2);
    +[MXSession updateIsRecording:](MXSession, "updateIsRecording:", v2);
    +[MXSession updatePreferredAudioHardwareFormat:withMaxOutputChannels:andCalledFromDealloc:](MXSession, "updatePreferredAudioHardwareFormat:withMaxOutputChannels:andCalledFromDealloc:", v2, +[MXSession getResolvedPreferredNumberOfOutputChannels:](MXSession, "getResolvedPreferredNumberOfOutputChannels:", v2), 1);
    if (+[MXSession isCoreSessionFormatValidForMaxOutputChannels:](MXSession, "isCoreSessionFormatValidForMaxOutputChannels:", objc_msgSend(v2, "preferredHardwareFormat")))
    {
      +[MXSession updatePreferredNumberOfOutputChannels:](MXSession, "updatePreferredNumberOfOutputChannels:", v2);
    }
    +[MXSession updatePreferredOutputSampleRate:](MXSession, "updatePreferredOutputSampleRate:", v2);
    +[MXSession updateDoesntActuallyPlayAudio:](MXSession, "updateDoesntActuallyPlayAudio:", v2);
  }
  else
  {
    MXCoreSessionTeardown(*(void **)(*(_QWORD *)(a1[4] + 8) + 40));
  }

  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
    MX_FeatureFlags_IsMandrakeEverywhereEnabled();
}

- (BOOL)getIsPlaying
{
  return self->mIsPlaying;
}

- (MXSession)initWithSession:(opaqueCMSession *)a3
{
  MXSession *v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v6;
  objc_super v8;
  id location[17];

  location[16] = *(id *)MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)MXSession;
  v4 = -[MXSession init](&v8, sel_init);
  if (v4)
  {
    if (a3)
    {
      v4->mRecursiveLock = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
      v4->mCoreSession = (MXCoreSession *)a3->var1;
      v4->mPreferredOutputSampleRate = 0.0;
      v4->mPreferredAudioHardwareFormat = (NSString *)CFSTR("LPCM");
      v4->mIsPlaying = 0;
      v4->mClientIsPlaying = 0;
      v4->mAudioToolboxIsPlaying = 0;
      v4->mPreferredNumberOfOutputChannels = 0;
      v4->mMutePriority = (NSString *)CFSTR("MutePriority_Two");
      v4->mIAmPiP = 0;
      v4->mIsMuted = 0;
      v4->mDoesntActuallyPlayAudio = 0;
      v4->mIsPlayingOutput = 0;
      v4->mClientType = 1;
      v4->mCoreSessionID = -[NSNumber unsignedLongLongValue](-[MXCoreSessionBase ID](v4->mCoreSession, "ID"), "unsignedLongLongValue");
      v4->mID = FigAtomicIncrement64();
      v4->mSourceFormatInfo = 0;
      v4->mBestAvailableContentType = 0;
      v4->mCurrentlyPlayingSourceFormatInfo = 0;
      v4->mCurrentlyPlayingBufferedAudioFormatInfo = 0;
      v4->mCurrentlyPlayingContentIsEligibleForSpatialization = 0;
      if (dword_1EE2B3F38)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v4->mDescription = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<MXSessionID = %llx, CoreSessionID = %lld>"), v4->mID, v4->mCoreSessionID);
      objc_initWeak(location, v4);
      -[MXCoreSession mxSessionListAddSession:](v4->mCoreSession, "mxSessionListAddSession:", objc_loadWeak(location));
      objc_destroyWeak(location);
    }
    else
    {
      v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      return 0;
    }
  }
  return v4;
}

- (int)setMutePriority:(id)a3
{
  id v5;
  int result;
  __int16 IsAnyMXSessionPlayingWithEachMutePriority;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = -[MXSession getMutePriority](self, "getMutePriority");
  if ((objc_msgSend(a3, "isEqualToString:", v5) & 1) != 0)
    return 0;
  IsAnyMXSessionPlayingWithEachMutePriority = CMSMUtility_IsAnyMXSessionPlayingWithEachMutePriority();
  if ((_BYTE)IsAnyMXSessionPlayingWithEachMutePriority
    && objc_msgSend(a3, "isEqualToString:", CFSTR("MutePriority_One")))
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[NSRecursiveLock lock](self->mRecursiveLock, "lock", v10, v12);

  self->mMutePriority = (NSString *)a3;
  -[NSRecursiveLock unlock](self->mRecursiveLock, "unlock");
  if (dword_1EE2B3F38)
  {
    v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("MutePriority_One"), v11, v13) & 1) == 0
    && !objc_msgSend(v5, "isEqualToString:", CFSTR("MutePriority_Three")))
  {
    return MX_FeatureFlags_IsMandrakeEverywhereEnabled();
  }
  if (!objc_msgSend(a3, "isEqualToString:", CFSTR("MutePriority_Two")))
    return MX_FeatureFlags_IsMandrakeEverywhereEnabled();
  if ((IsAnyMXSessionPlayingWithEachMutePriority & 0xFF00) == 0)
    return MX_FeatureFlags_IsMandrakeEverywhereEnabled();
  if (!self->mIsPlaying)
    return MX_FeatureFlags_IsMandrakeEverywhereEnabled();
  result = cmsBeginInterruptionGuts(self->mCoreSession, 0, 2);
  if (!result)
    return MX_FeatureFlags_IsMandrakeEverywhereEnabled();
  return result;
}

- (id)info
{
  unint64_t mID;
  unint64_t mCoreSessionID;
  void *v5;
  NSString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  id v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;

  mID = self->mID;
  mCoreSessionID = self->mCoreSessionID;
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = -[MXCoreSessionBase clientName](self->mCoreSession, "clientName");
  if (self->mIsMuted)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (self->mClientIsPlaying)
    v8 = CFSTR("PLAYING");
  else
    v8 = CFSTR("STOPPED");
  if (self->mAudioToolboxIsPlaying)
    v9 = CFSTR("PLAYING");
  else
    v9 = CFSTR("STOPPED");
  v10 = -[MXSession getMutePriority](self, "getMutePriority");
  if (self->mIAmPiP)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  if (self->mDoesntActuallyPlayAudio)
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  if (self->mIsPlayingOutput)
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("<ID: %llx, CoreSessionID = %lld Name = %@, Muted = %@, ClientIsPlaying = %@, AudioToolboxIsPlaying = %@, MutePriority = %@, PiP = %@, DoesntActuallyPlayAudio = %@, clientType = %x, IsPlayingOutput = %@"), mID, mCoreSessionID, v6, v7, v8, v9, v10, v11, v12, self->mClientType, v13);
}

- (id)getMutePriority
{
  NSString *v3;

  -[NSRecursiveLock lock](self->mRecursiveLock, "lock");
  v3 = self->mMutePriority;
  -[NSRecursiveLock unlock](self->mRecursiveLock, "unlock");
  return v3;
}

- (int)setPropertiesInternal:(id)a3 usingErrorHandlingStrategy:(unsigned __int8)a4 outPropertiesErrors:(id *)a5
{
  int v6;
  id v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  id *v35;
  int v36;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  os_log_type_t type;
  int v52;
  uint64_t v53;
  uint64_t v54;
  _BYTE v55[128];
  uint64_t v56;
  uint64_t v57;
  _BYTE v58[128];
  uint64_t v59;
  uint64_t v60;
  _BYTE v61[128];
  uint64_t v62;

  v6 = a4;
  v62 = *MEMORY[0x1E0C80C00];
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v35 = a5;
  if (a3)
  {
    if (dword_1EE2B3F38)
    {
      v52 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    CMSMDebugUtility_PrintDictionary(a3);
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v10 = (void *)sOrderedMXSessionProperties;
    v11 = objc_msgSend((id)sOrderedMXSessionProperties, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v48 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
          v16 = objc_msgSend(a3, "objectForKey:", v15, v33, v34);
          if (v16)
          {
            v59 = v15;
            v60 = v16;
            objc_msgSend(v8, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1));
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
      }
      while (v12);
    }
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v17 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v43, v58, 16, v33, v34);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v44;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v44 != v19)
            objc_enumerationMutation(a3);
          v21 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j);
          if ((objc_msgSend((id)sOrderedMXSessionProperties, "containsObject:", v21) & 1) == 0)
          {
            v56 = v21;
            v57 = objc_msgSend(a3, "objectForKey:", v21);
            objc_msgSend(v8, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1));
          }
        }
        v18 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v43, v58, 16);
      }
      while (v18);
    }
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v22 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
    if (v22)
    {
      v23 = v22;
      v36 = 0;
      v24 = *(_QWORD *)v40;
      do
      {
        for (k = 0; k != v23; ++k)
        {
          if (*(_QWORD *)v40 != v24)
            objc_enumerationMutation(v8);
          v26 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * k);
          v27 = (void *)MEMORY[0x194035B20]();
          v28 = objc_msgSend((id)objc_msgSend(v26, "allKeys"), "firstObject");
          v29 = objc_msgSend(v26, "objectForKey:", v28);
          if (v29 == objc_msgSend(MEMORY[0x1E0C99E38], "null"))
            v30 = 0;
          else
            v30 = v29;
          v31 = -[MXSession setPropertyForKeyInternal:value:fromPropertiesBatch:](self, "setPropertyForKeyInternal:value:fromPropertiesBatch:", v28, v30, a3);
          v53 = v28;
          v54 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v31);
          objc_msgSend(v38, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1));
          if (v6 == 2)
          {
            if ((_DWORD)v31)
              v36 = FigSignalErrorAt();
          }
          else if (v6 == 1 && (_DWORD)v31)
          {
            v36 = FigSignalErrorAt();
            objc_autoreleasePoolPop(v27);
            goto LABEL_40;
          }
          objc_autoreleasePoolPop(v27);
        }
        v23 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
      }
      while (v23);
    }
    else
    {
      v36 = 0;
    }
  }
  else
  {
    v36 = FigSignalErrorAt();
  }
LABEL_40:
  if (v35)
    *v35 = v38;
  else

  return v36;
}

- (int)setPropertyForKey:(id)a3 value:(id)a4
{
  int v7;
  NSObject *v8;
  _QWORD v10[8];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  if (+[MXSession isNonSerializedSetProperty:](MXSession, "isNonSerializedSetProperty:")
    || +[MXSession isNonSerializedSetPropertyWhenSessionIsInactive:](MXSession, "isNonSerializedSetPropertyWhenSessionIsInactive:", a3)&& (objc_msgSend(-[MXSession getCoreSession](self, "getCoreSession"), "isActive") & 1) == 0|| MX_FeatureFlags_IsSessionBasedMutingEnabled()&& objc_msgSend(a3, "isEqualToString:", CFSTR("IsRecordingMuted")))
  {
    v7 = -[MXSession setPropertyForKeyInternal:value:fromPropertiesBatch:](self, "setPropertyForKeyInternal:value:fromPropertiesBatch:", a3, a4, 0);
    *((_DWORD *)v12 + 6) = v7;
  }
  else
  {
    v8 = MXGetSerialQueue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __37__MXSession_setPropertyForKey_value___block_invoke;
    v10[3] = &unk_1E3098CC8;
    v10[4] = self;
    v10[5] = a3;
    v10[6] = a4;
    v10[7] = &v11;
    MXDispatchAsyncAndWait((uint64_t)"-[MXSession setPropertyForKey:value:]", (uint64_t)"MXSession_ObjCInterface.m", 268, 0, 0, v8, (uint64_t)v10);
    v7 = *((_DWORD *)v12 + 6);
  }
  _Block_object_dispose(&v11, 8);
  return v7;
}

- (int)setPropertyForKeyInternal:(id)a3 value:(id)a4 fromPropertiesBatch:(id)a5
{
  CFTypeID v9;
  int v10;
  CFTypeID v11;
  CFTypeID v12;
  CFTypeID v13;
  CFTypeID v14;
  CFTypeID v15;
  CFTypeID v16;
  CFTypeID v17;
  _BOOL4 v18;
  int v19;
  CFTypeID v20;
  CFTypeID v21;
  _BOOL4 mClientIsPlaying;
  NSObject *v23;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  CFTypeID v25;
  CFTypeID v26;
  id v27;
  _BOOL4 v28;
  _BOOL8 v29;
  _BOOL4 mAudioToolboxIsPlaying;
  NSObject *v31;
  CFTypeID v33;
  CFTypeID v34;
  float v35;
  uint64_t v36;
  uint64_t v37;
  _DWORD valuePtr[32];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("BestAvailableContentType")))
  {
    if (!a4 || (v9 = CFGetTypeID(a4), v9 == CFStringGetTypeID()))
    {
      v10 = -[MXSession setBestAvailableContentType:](self, "setBestAvailableContentType:", a4);
      goto LABEL_75;
    }
    goto LABEL_87;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("ClientType")))
  {
    v11 = CFGetTypeID(a4);
    if (v11 == CFNumberGetTypeID())
    {
      valuePtr[0] = 1;
      CFNumberGetValue((CFNumberRef)a4, kCFNumberSInt32Type, valuePtr);
      if ((valuePtr[0] - 5) > 0xFFFFFFFB)
      {
        v10 = -[MXSession setClientType:](self, "setClientType:");
        goto LABEL_75;
      }
    }
    goto LABEL_87;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("CurrentlyPlayingContentIsEligibleForSpatialization")))
  {
    if (a4)
    {
      v12 = CFGetTypeID(a4);
      if (v12 == CFBooleanGetTypeID())
      {
        v10 = -[MXSession setCurrentlyPlayingContentIsEligibleForSpatialization:](self, "setCurrentlyPlayingContentIsEligibleForSpatialization:", *MEMORY[0x1E0C9AE50] == (_QWORD)a4);
        goto LABEL_75;
      }
    }
    goto LABEL_87;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("CurrentlyPlayingSourceFormatInfo")))
  {
    if (!a4 || (v13 = CFGetTypeID(a4), v13 == CFDictionaryGetTypeID()))
    {
      v10 = -[MXSession setCurrentlyPlayingSourceFormatInfo:](self, "setCurrentlyPlayingSourceFormatInfo:", a4);
      goto LABEL_75;
    }
    goto LABEL_87;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("CurrentlyPlayingBufferedAudioFormatInfo")))
  {
    if (!a4 || (v14 = CFGetTypeID(a4), v14 == CFDictionaryGetTypeID()))
    {
      v10 = -[MXSession setCurrentlyPlayingBufferedAudioFormatInfo:](self, "setCurrentlyPlayingBufferedAudioFormatInfo:", a4);
      goto LABEL_75;
    }
    goto LABEL_87;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("IAmPiP")))
  {
    if (a4)
    {
      v15 = CFGetTypeID(a4);
      if (v15 == CFBooleanGetTypeID())
      {
        v10 = -[MXSession setIAmPiP:](self, "setIAmPiP:", *MEMORY[0x1E0C9AE50] == (_QWORD)a4);
        goto LABEL_75;
      }
    }
    goto LABEL_87;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("SourceFormatInfo")))
  {
    if (!a4 || (v16 = CFGetTypeID(a4), v16 == CFDictionaryGetTypeID()))
    {
      v10 = -[MXSession setSourceFormatInfo:](self, "setSourceFormatInfo:", a4);
      goto LABEL_75;
    }
    goto LABEL_87;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("AudioToolboxIsPlaying")))
  {
    if (a4)
    {
      v17 = CFGetTypeID(a4);
      if (v17 == CFBooleanGetTypeID())
      {
        v18 = *MEMORY[0x1E0C9AE50] == (_QWORD)a4;
        if (self->mAudioToolboxIsPlaying == v18)
          return 0;
        self->mAudioToolboxIsPlaying = v18;
        if (dword_1EE2B3F38)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        if (self->mClientIsPlaying)
          goto LABEL_56;
        mAudioToolboxIsPlaying = self->mAudioToolboxIsPlaying;
        goto LABEL_73;
      }
    }
    goto LABEL_87;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("DoesntActuallyPlayAudio")))
  {
    if (a4)
    {
      v20 = CFGetTypeID(a4);
      if (v20 == CFBooleanGetTypeID())
      {
        v10 = -[MXSession setDoesntActuallyPlayAudio:](self, "setDoesntActuallyPlayAudio:", *MEMORY[0x1E0C9AE50] == (_QWORD)a4);
        goto LABEL_75;
      }
    }
    goto LABEL_87;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("IsPlaying")))
  {
    if (a4)
    {
      v21 = CFGetTypeID(a4);
      if (v21 == CFBooleanGetTypeID())
      {
        mClientIsPlaying = *MEMORY[0x1E0C9AE50] == (_QWORD)a4;
        if (self->mClientIsPlaying == mClientIsPlaying)
          return 0;
        self->mClientIsPlaying = mClientIsPlaying;
        if (dword_1EE2B3F38)
        {
          v23 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          mClientIsPlaying = self->mClientIsPlaying;
        }
        if (mClientIsPlaying)
        {
LABEL_56:
          v29 = 1;
LABEL_74:
          v10 = -[MXSession setIsPlaying:](self, "setIsPlaying:", v29, v36, v37);
          goto LABEL_75;
        }
        mAudioToolboxIsPlaying = self->mAudioToolboxIsPlaying;
LABEL_73:
        v29 = mAudioToolboxIsPlaying;
        goto LABEL_74;
      }
    }
LABEL_87:
    v10 = FigSignalErrorAt();
    goto LABEL_75;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("IsPlayingOutput")))
  {
    if (a4)
    {
      v25 = CFGetTypeID(a4);
      if (v25 == CFBooleanGetTypeID())
      {
        v10 = -[MXSession setIsPlayingOutput:](self, "setIsPlayingOutput:", objc_msgSend(a4, "BOOLValue"));
        goto LABEL_75;
      }
    }
    goto LABEL_87;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("IsRecording")))
  {
    if (a4)
    {
      v26 = CFGetTypeID(a4);
      if (v26 == CFBooleanGetTypeID())
      {
        v27 = (id)*MEMORY[0x1E0C9AE50];
        v28 = *MEMORY[0x1E0C9AE50] == (_QWORD)a4;
        if (v28 != -[MXSession getIsRecording](self, "getIsRecording"))
        {
          v10 = -[MXSession setIsRecording:](self, "setIsRecording:", v27 == a4);
          goto LABEL_75;
        }
        return 0;
      }
    }
    goto LABEL_87;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("MutePriority")))
  {
    if (a4
      && (CFEqual(a4, CFSTR("MutePriority_One"))
       || CFEqual(a4, CFSTR("MutePriority_Two"))
       || CFEqual(a4, CFSTR("MutePriority_Three"))
       || CFEqual(a4, CFSTR("MutePriority_Four"))))
    {
      v10 = -[MXSession setMutePriority:](self, "setMutePriority:", a4);
      goto LABEL_75;
    }
    goto LABEL_87;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("PreferredAudioHardwareFormat")))
  {
    if (a4 && (CFEqual(a4, CFSTR("LPCM")) || CFEqual(a4, CFSTR("AC-3")) || CFEqual(a4, CFSTR("MATAtmos"))))
    {
      v10 = -[MXSession setPreferredAudioHardwareFormat:](self, "setPreferredAudioHardwareFormat:", a4);
      goto LABEL_75;
    }
    goto LABEL_87;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("PreferredNumberOfOutputChannels")))
  {
    if (!a4 || (v33 = CFGetTypeID(a4), v33 == CFNumberGetTypeID()))
    {
      valuePtr[0] = 0;
      CFNumberGetValue((CFNumberRef)a4, kCFNumberSInt32Type, valuePtr);
      v10 = -[MXSession setPreferredNumberOfOutputChannels:](self, "setPreferredNumberOfOutputChannels:", valuePtr[0]);
      goto LABEL_75;
    }
    goto LABEL_87;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("PreferredOutputSampleRate")) & 1) != 0
    || objc_msgSend(a3, "isEqualToString:", CFSTR("PreferredAudioHardwareSampleRate")))
  {
    if (a4)
    {
      v34 = CFGetTypeID(a4);
      if (v34 == CFNumberGetTypeID())
      {
        objc_msgSend(a4, "floatValue");
        v10 = -[MXSession setPreferredOutputSampleRate:](self, "setPreferredOutputSampleRate:", v35);
        goto LABEL_75;
      }
    }
    goto LABEL_87;
  }
  v10 = MXCoreSessionSetProperty(self->mCoreSession, (const __CFString *)a3, (NSDictionary *)a4, a5);
LABEL_75:
  v19 = v10;
  if (v10)
  {
    v31 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v19;
}

+ (BOOL)isNonSerializedSetProperty:(id)a3
{
  return objc_msgSend((id)sNonSerializedSetProperties, "containsObject:", a3);
}

- (int)copyPropertyForKeyInternal:(id)a3 valueOut:(id *)a4
{
  int *v7;
  CFNumberRef *v8;
  CFNumberRef v9;
  _BOOL4 v10;
  const __CFAllocator *v11;
  CFNumberType v12;
  void *v13;
  int v14;
  unint64_t v15;
  unint64_t valuePtr;

  if (!a3)
  {
    LODWORD(v9) = -15682;
    return (int)v9;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("AudioToolboxIsPlaying")))
  {
    v7 = &OBJC_IVAR___MXSession_mAudioToolboxIsPlaying;
    goto LABEL_4;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("BestAvailableContentType")))
  {
    v9 = -[MXSession getBestAvailableContentType](self, "getBestAvailableContentType");
    goto LABEL_18;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("CurrentlyPlayingContentIsEligibleForSpatialization")))
  {
    v10 = -[MXSession getCurrentlyPlayingContentIsEligibleForSpatialization](self, "getCurrentlyPlayingContentIsEligibleForSpatialization");
    goto LABEL_12;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("CurrentlyPlayingSourceFormatInfo")))
  {
    v9 = -[MXSession getCurrentlyPlayingSourceFormatInfo](self, "getCurrentlyPlayingSourceFormatInfo");
    goto LABEL_18;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("CurrentlyPlayingBufferedAudioFormatInfo")))
  {
    v9 = -[MXSession copyCurrentlyPlayingBufferedAudioSourceFormatInfo](self, "copyCurrentlyPlayingBufferedAudioSourceFormatInfo");
LABEL_28:
    v13 = v9;
    LODWORD(v9) = 0;
LABEL_29:
    *a4 = v13;
    return (int)v9;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("DoesntActuallyPlayAudio")))
  {
    v10 = -[MXSession getDoesntActuallyPlayAudio](self, "getDoesntActuallyPlayAudio");
    goto LABEL_12;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("MXSessionID")))
  {
    valuePtr = -[MXSession getID](self, "getID");
    v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v12 = kCFNumberSInt64Type;
LABEL_27:
    v9 = CFNumberCreate(v11, v12, &valuePtr);
    goto LABEL_28;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("IsMuted")))
  {
    v10 = -[MXSession getIsMuted](self, "getIsMuted");
LABEL_12:
    v8 = (CFNumberRef *)MEMORY[0x1E0C9AE50];
    if (!v10)
      v8 = (CFNumberRef *)MEMORY[0x1E0C9AE40];
    goto LABEL_14;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("IsPlaying")))
  {
    v7 = &OBJC_IVAR___MXSession_mClientIsPlaying;
    goto LABEL_4;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("IsPlayingOutput")))
  {
    v7 = &OBJC_IVAR___MXSession_mIsPlayingOutput;
    goto LABEL_4;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("IsRecording")))
  {
    v7 = &OBJC_IVAR___MXSession_mIsRecording;
LABEL_4:
    if (*((_BYTE *)&self->super.isa + *v7))
      v8 = (CFNumberRef *)MEMORY[0x1E0C9AE50];
    else
      v8 = (CFNumberRef *)MEMORY[0x1E0C9AE40];
LABEL_14:
    v9 = *v8;
LABEL_15:
    *a4 = v9;
LABEL_19:
    CFRetain(v9);
    LODWORD(v9) = 0;
    return (int)v9;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("PreferredAudioHardwareFormat")))
  {
    v9 = -[MXSession getPreferredAudioHardwareFormat](self, "getPreferredAudioHardwareFormat");
    goto LABEL_15;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("PreferredNumberOfOutputChannels")))
  {
    v14 = -[MXSession getPreferredNumberOfOutputChannels](self, "getPreferredNumberOfOutputChannels");
LABEL_42:
    LODWORD(valuePtr) = v14;
    v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v12 = kCFNumberSInt32Type;
    goto LABEL_27;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("PreferredOutputSampleRate")) & 1) != 0
    || objc_msgSend(a3, "isEqualToString:", CFSTR("PreferredAudioHardwareSampleRate")))
  {
    -[MXSession getPreferredOutputSampleRate](self, "getPreferredOutputSampleRate");
    valuePtr = v15;
    v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v12 = kCFNumberFloat64Type;
    goto LABEL_27;
  }
  if (!objc_msgSend(a3, "isEqualToString:", CFSTR("SourceFormatInfo")))
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("AudioQueueOptions")))
    {
      valuePtr = 0;
      LODWORD(v9) = MXCoreSessionCopyProperty(self->mCoreSession, a3, (const __CFAllocator *)*MEMORY[0x1E0C9AE00], &valuePtr);
      v13 = (void *)valuePtr;
      goto LABEL_29;
    }
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("ConsolidatedSourceFormatInfo")))
    {
      v9 = CMSUtility_CopyConsolidatedSourceFormatInfo(self->mCoreSession);
      goto LABEL_28;
    }
    if (!objc_msgSend(a3, "isEqualToString:", CFSTR("TestOnly_ClientType")))
    {
      LODWORD(v9) = MXCoreSessionCopyProperty(self->mCoreSession, a3, (const __CFAllocator *)*MEMORY[0x1E0C9AE00], a4);
      return (int)v9;
    }
    v14 = -[MXSession getClientType](self, "getClientType");
    goto LABEL_42;
  }
  v9 = -[MXSession getSourceFormatInfo](self, "getSourceFormatInfo");
LABEL_18:
  *a4 = v9;
  if (v9)
    goto LABEL_19;
  return (int)v9;
}

- (unint64_t)getID
{
  return self->mID;
}

- (int)setProperties:(id)a3 usingErrorHandlingStrategy:(unsigned __int8)a4 outPropertiesErrors:(id *)a5
{
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  int v13;
  NSObject *v14;
  id v15;
  int v16;
  _QWORD v18[8];
  char v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;
  _BYTE v28[128];
  uint64_t v29;

  v6 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  +[MXInitialization waitUntilMXIsFullyInitialized](MXInitialization, "waitUntilMXIsFullyInitialized");
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(a3);
        v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (!+[MXSession isNonSerializedSetProperty:](MXSession, "isNonSerializedSetProperty:", v12)
          && (!+[MXSession isNonSerializedSetPropertyWhenSessionIsInactive:](MXSession, "isNonSerializedSetPropertyWhenSessionIsInactive:", v12)|| (objc_msgSend(-[MXSession getCoreSession](self, "getCoreSession"), "isActive") & 1) != 0))
        {
          v14 = MXGetSerialQueue();
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __74__MXSession_setProperties_usingErrorHandlingStrategy_outPropertiesErrors___block_invoke;
          v18[3] = &unk_1E3098D18;
          v18[4] = self;
          v18[5] = a3;
          v19 = v6;
          v18[6] = &v24;
          v18[7] = a5;
          MXDispatchAsyncAndWait((uint64_t)"-[MXSession setProperties:usingErrorHandlingStrategy:outPropertiesErrors:]", (uint64_t)"MXSession_ObjCInterface.m", 78, 0, 0, v14, (uint64_t)v18);
          if (a5)
            v15 = *a5;
          goto LABEL_14;
        }
      }
      v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = -[MXSession setPropertiesInternal:usingErrorHandlingStrategy:outPropertiesErrors:](self, "setPropertiesInternal:usingErrorHandlingStrategy:outPropertiesErrors:", a3, v6, a5);
  *((_DWORD *)v25 + 6) = v13;
LABEL_14:
  v16 = *((_DWORD *)v25 + 6);
  _Block_object_dispose(&v24, 8);
  return v16;
}

- (int)setOrderedProperties:(id)a3 usingErrorHandlingStrategy:(unsigned __int8)a4 outPropertiesErrors:(id *)a5
{
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  int v13;
  NSObject *v14;
  id v15;
  int v16;
  _QWORD v18[8];
  char v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;
  _BYTE v28[128];
  uint64_t v29;

  v6 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  +[MXInitialization waitUntilMXIsFullyInitialized](MXInitialization, "waitUntilMXIsFullyInitialized");
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(a3);
        v12 = objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "allKeys"), "firstObject");
        if (!+[MXSession isNonSerializedSetProperty:](MXSession, "isNonSerializedSetProperty:", v12)
          && (!+[MXSession isNonSerializedSetPropertyWhenSessionIsInactive:](MXSession, "isNonSerializedSetPropertyWhenSessionIsInactive:", v12)|| (objc_msgSend(-[MXSession getCoreSession](self, "getCoreSession"), "isActive") & 1) != 0))
        {
          v14 = MXGetSerialQueue();
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __81__MXSession_setOrderedProperties_usingErrorHandlingStrategy_outPropertiesErrors___block_invoke;
          v18[3] = &unk_1E3098D18;
          v18[4] = self;
          v18[5] = a3;
          v19 = v6;
          v18[6] = &v24;
          v18[7] = a5;
          MXDispatchAsyncAndWait((uint64_t)"-[MXSession setOrderedProperties:usingErrorHandlingStrategy:outPropertiesErrors:]", (uint64_t)"MXSession_ObjCInterface.m", 120, 0, 0, v14, (uint64_t)v18);
          if (a5)
            v15 = *a5;
          goto LABEL_14;
        }
      }
      v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = -[MXSession setOrderedPropertiesInternal:usingErrorHandlingStrategy:outPropertiesErrors:](self, "setOrderedPropertiesInternal:usingErrorHandlingStrategy:outPropertiesErrors:", a3, v6, a5);
  *((_DWORD *)v25 + 6) = v13;
LABEL_14:
  v16 = *((_DWORD *)v25 + 6);
  _Block_object_dispose(&v24, 8);
  return v16;
}

+ (BOOL)isNonSerializedSetPropertyWhenSessionIsInactive:(id)a3
{
  return objc_msgSend((id)sNonSerializedSetPropertiesWhenSessionIsInactive, "containsObject:", a3);
}

- (id)getCoreSession
{
  return self->mCoreSession;
}

- (int)setOrderedPropertiesInternal:(id)a3 usingErrorHandlingStrategy:(unsigned __int8)a4 outPropertiesErrors:(id *)a5
{
  int v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  os_log_type_t type;
  int v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v6 = a4;
  v35 = *MEMORY[0x1E0C80C00];
  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (a3)
  {
    if (dword_1EE2B3F38)
    {
      v31 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    CMSMDebugUtility_PrintCollection(a3);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v9)
    {
      v11 = v9;
      LODWORD(v23) = 0;
      v12 = *(_QWORD *)v27;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(a3);
          v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v13);
          v15 = (void *)MEMORY[0x194035B20](v9, v10);
          v16 = objc_msgSend((id)objc_msgSend(v14, "allKeys"), "firstObject");
          v17 = objc_msgSend(v14, "objectForKey:", v16);
          if (v17 == objc_msgSend(MEMORY[0x1E0C99E38], "null"))
            v18 = 0;
          else
            v18 = v17;
          v19 = -[MXSession setPropertyForKeyInternal:value:fromPropertiesBatch:](self, "setPropertyForKeyInternal:value:fromPropertiesBatch:", v16, v18, 0, v21, v22);
          v32 = v16;
          v33 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v19);
          objc_msgSend(v25, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
          if (v6 == 2)
          {
            if ((_DWORD)v19)
              LODWORD(v23) = FigSignalErrorAt();
          }
          else if (v6 == 1 && (_DWORD)v19)
          {
            LODWORD(v23) = FigSignalErrorAt();
            objc_autoreleasePoolPop(v15);
            goto LABEL_22;
          }
          objc_autoreleasePoolPop(v15);
          ++v13;
        }
        while (v11 != v13);
        v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        v11 = v9;
      }
      while (v9);
    }
    else
    {
      LODWORD(v23) = 0;
    }
  }
  else
  {
    v23 = FigSignalErrorAt();
  }
LABEL_22:
  if (a5)
    *a5 = v25;
  else

  return v23;
}

- (int)setIsPlayingOutput:(BOOL)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->mIsPlayingOutput == a3)
    return 0;
  self->mIsPlayingOutput = a3;
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return +[MXSession updateIsPlayingOutput:](MXSession, "updateIsPlayingOutput:", self->mCoreSession, v6, v7);
}

- (int)setDoesntActuallyPlayAudio:(BOOL)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->mDoesntActuallyPlayAudio == a3)
    return 0;
  self->mDoesntActuallyPlayAudio = a3;
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  result = +[MXSession updateDoesntActuallyPlayAudio:](MXSession, "updateDoesntActuallyPlayAudio:", self->mCoreSession, v6, v7);
  if (!result)
  {
    if (!self->mDoesntActuallyPlayAudio && self->mIsPlaying)
      return MX_FeatureFlags_IsMandrakeEverywhereEnabled();
    return 0;
  }
  return result;
}

- (int)setCurrentlyPlayingSourceFormatInfo:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[NSRecursiveLock lock](self->mRecursiveLock, "lock");

  self->mCurrentlyPlayingSourceFormatInfo = (NSDictionary *)a3;
  -[NSRecursiveLock unlock](self->mRecursiveLock, "unlock");
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (-[MXSession getIsPlaying](self, "getIsPlaying", v7, v8))
    CMSMNotificationUtility_PostSourceFormatInfoDidChange();
  return 0;
}

- (int)setPreferredNumberOfOutputChannels:(unsigned int)a3
{
  self->mPreferredNumberOfOutputChannels = a3;
  return +[MXSession updatePreferredNumberOfOutputChannels:](MXSession, "updatePreferredNumberOfOutputChannels:", self->mCoreSession);
}

+ (int)updateIsPlaying:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t i;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSDictionary **v10;
  int IsMandrakeEverywhereEnabled;
  int v12;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(a3, "copyMXSessionList");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "getIsPlaying"))
          v6 = 1;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v10 = (NSDictionary **)MEMORY[0x1E0C9AE40];
  if ((v6 & 1) != 0)
    v10 = (NSDictionary **)MEMORY[0x1E0C9AE50];
  IsMandrakeEverywhereEnabled = MXCoreSessionSetProperty(a3, CFSTR("SomeMXSessionIsPlaying"), *v10, 0);
  if (IsMandrakeEverywhereEnabled
    || (v6 & 1) != 0 && (IsMandrakeEverywhereEnabled = MX_FeatureFlags_IsMandrakeEverywhereEnabled()) != 0)
  {
    v12 = IsMandrakeEverywhereEnabled;
  }
  else
  {
    CMSMNotificationUtility_PostSomeSessionIsPlayingDidChange();
    if (CMSUtility_IsAudioCategoryPrimary(a3))
    {
      CMSMNotificationUtility_PostSomePrimaryAudioCategoryIsPlayingDidChange(a3);
      CMSMNotificationUtility_PostSomeOtherPrimaryAudioCategoryIsPlayingDidChange(a3);
    }
    v12 = 0;
  }

  return v12;
}

- (int)copyPropertyForKey:(id)a3 valueOut:(id *)a4
{
  int v7;
  NSObject *v8;
  _QWORD v10[8];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  if (+[MXSession isNonSerializedCopyProperty:](MXSession, "isNonSerializedCopyProperty:"))
  {
    v7 = -[MXSession copyPropertyForKeyInternal:valueOut:](self, "copyPropertyForKeyInternal:valueOut:", a3, a4);
    *((_DWORD *)v12 + 6) = v7;
  }
  else
  {
    v8 = MXGetSerialQueue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __41__MXSession_copyPropertyForKey_valueOut___block_invoke;
    v10[3] = &unk_1E3098CF0;
    v10[4] = self;
    v10[5] = a3;
    v10[6] = &v11;
    v10[7] = a4;
    MXDispatchAsyncAndWait((uint64_t)"-[MXSession copyPropertyForKey:valueOut:]", (uint64_t)"MXSession_ObjCInterface.m", 297, 0, 0, v8, (uint64_t)v10);
    v7 = *((_DWORD *)v12 + 6);
  }
  _Block_object_dispose(&v11, 8);
  return v7;
}

+ (BOOL)isNonSerializedCopyProperty:(id)a3
{
  return objc_msgSend((id)sNonSerializedCopyProperties, "containsObject:", a3);
}

uint64_t __41__MXSession_copyPropertyForKey_valueOut___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_copyPropertyForKey:valueOut:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

id __74__MXSession_setProperties_usingErrorHandlingStrategy_outPropertiesErrors___block_invoke(uint64_t a1)
{
  id result;
  id *v3;

  result = (id)objc_msgSend(*(id *)(a1 + 32), "_setProperties:usingErrorHandlingStrategy:outPropertiesErrors:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56));
  v3 = *(id **)(a1 + 56);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (_DWORD)result;
  if (v3)
    return *v3;
  return result;
}

id __81__MXSession_setOrderedProperties_usingErrorHandlingStrategy_outPropertiesErrors___block_invoke(uint64_t a1)
{
  id result;
  id *v3;

  result = (id)objc_msgSend(*(id *)(a1 + 32), "_setOrderedProperties:usingErrorHandlingStrategy:outPropertiesErrors:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56));
  v3 = *(id **)(a1 + 56);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (_DWORD)result;
  if (v3)
    return *v3;
  return result;
}

id __46__MXSession_copyProperties_outPropertyErrors___block_invoke(uint64_t a1)
{
  id result;
  id *v3;

  result = (id)objc_msgSend(*(id *)(a1 + 32), "_copyProperties:outPropertyErrors:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
  v3 = *(id **)(a1 + 56);
  if (v3)
    return *v3;
  return result;
}

- (int)_setPropertyForKey:(id)a3 value:(id)a4
{
  return -[MXSession setPropertyForKeyInternal:value:fromPropertiesBatch:](self, "setPropertyForKeyInternal:value:fromPropertiesBatch:", a3, a4, 0);
}

+ (int)updateIsRecording:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t i;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSDictionary **v10;
  int v11;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(a3, "copyMXSessionList");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "getIsRecording"))
          v6 = 1;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v10 = (NSDictionary **)MEMORY[0x1E0C9AE40];
  if ((v6 & 1) != 0)
    v10 = (NSDictionary **)MEMORY[0x1E0C9AE50];
  v11 = MXCoreSessionSetProperty(a3, CFSTR("IsRecording"), *v10, 0);

  return v11;
}

- (BOOL)getIsRecording
{
  return self->mIsRecording;
}

- (int)setIsPlaying:(BOOL)a3
{
  _BOOL4 mIsPlaying;
  NSObject *v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int result;
  MXCoreSession *mCoreSession;

  if (self->mIsPlaying == a3)
    return 0;
  mIsPlaying = a3;
  if (!-[MXSessionManager isSpeechDetectCategory:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "isSpeechDetectCategory:", -[MXCoreSessionBase audioCategory](self->mCoreSession, "audioCategory")))
  {
    self->mIsPlaying = mIsPlaying;
    if (dword_1EE2B3F38)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      mIsPlaying = self->mIsPlaying;
    }
    mCoreSession = self->mCoreSession;
    if (mIsPlaying)
    {
      result = +[MXSession updateDoesntActuallyPlayAudio:](MXSession, "updateDoesntActuallyPlayAudio:", mCoreSession);
      if (result)
        return result;
      result = +[MXSession updateIsPlaying:](MXSession, "updateIsPlaying:", self->mCoreSession);
      if (result)
        return result;
      -[MXSession updateBadgeType](self, "updateBadgeType");
    }
    else
    {
      result = +[MXSession updateIsPlaying:](MXSession, "updateIsPlaying:", mCoreSession);
      if (result)
        return result;
      result = +[MXSession updateDoesntActuallyPlayAudio:](MXSession, "updateDoesntActuallyPlayAudio:", self->mCoreSession);
      if (result)
        return result;
      -[MXSession setCurrentlyPlayingBufferedAudioFormatInfo:](self, "setCurrentlyPlayingBufferedAudioFormatInfo:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionary"));
    }
    CMSMNotificationUtility_PostSourceFormatInfoDidChange();
    return 0;
  }
  if (dword_1EE2B3F38)
  {
    v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return -15685;
}

- (int)setClientType:(int)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  self->mClientType = a3;
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return 0;
}

- (id)getClientTypeAsString
{
  int v2;

  v2 = self->mClientType - 1;
  if (v2 > 3)
    return CFSTR("Invalid");
  else
    return *(&off_1E309E510 + v2);
}

+ (int)updateDoesntActuallyPlayAudio:(id)a3
{
  void *v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  int v8;
  uint64_t i;
  void *v10;
  char v11;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSDictionary **v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a3, "copyMXSessionList");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = 0;
    v7 = *(_QWORD *)v16;
    v8 = 1;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v10, "getIsPlaying"))
        {
          v8 &= objc_msgSend(v10, "getDoesntActuallyPlayAudio");
          v6 = 1;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
    v11 = v6 & v8;
    if ((v11 & 1) == objc_msgSend(a3, "doesntActuallyPlayAudio"))
    {
      LODWORD(v5) = 0;
      goto LABEL_18;
    }
  }
  else
  {
    v11 = 0;
    if ((objc_msgSend(a3, "doesntActuallyPlayAudio") & 1) == 0)
      goto LABEL_18;
  }
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v13 = (NSDictionary **)MEMORY[0x1E0C9AE40];
  if ((v11 & 1) != 0)
    v13 = (NSDictionary **)MEMORY[0x1E0C9AE50];
  LODWORD(v5) = MXCoreSessionSetProperty(a3, CFSTR("DoesntActuallyPlayAudio"), *v13, 0);
LABEL_18:

  return v5;
}

- (void)updateBadgeType
{
  unsigned int v3;
  MXCoreSession *mCoreSession;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned int v15;
  unsigned int v16;
  id v17;
  int *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  os_log_type_t type;
  unsigned int v25;
  int v26;
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = CMSUtility_SessionCanBeAndAllowedToBeNowPlayingApp(self->mCoreSession);
  mCoreSession = self->mCoreSession;
  if (v3)
  {
    v5 = -[MXCoreSession copyMXSessionList](mCoreSession, "copyMXSessionList");
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v5);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "getIsPlaying"))
          {
            if (!-[MXSession getIsMuted](self, "getIsMuted"))
            {
              -[NSRecursiveLock lock](self->mRecursiveLock, "lock");
              v11 = -[NSDictionary objectForKey:](self->mCurrentlyPlayingBufferedAudioFormatInfo, "objectForKey:", CFSTR("ContentType"));
              -[NSRecursiveLock unlock](self->mRecursiveLock, "unlock");
              if (v11)
                v8 = v11;
            }
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
      }
      while (v7);
    }
    else
    {
      v8 = 0;
    }
    v13 = -[MXSessionManager copyEvaluatedBadgeType:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "copyEvaluatedBadgeType:", v8);
    if (dword_1EE2B3F38)
    {
      v25 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v15 = v25;
      if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
        v16 = v15;
      else
        v16 = v15 & 0xFFFFFFFE;
      if (v16)
      {
        v17 = -[MXCoreSessionBase info](self->mCoreSession, "info");
        v26 = 136315650;
        v27 = "-[MXSession(InternalUse) updateBadgeType]";
        v28 = 2114;
        v29 = v13;
        v30 = 2114;
        v31 = v17;
        LODWORD(v19) = 32;
        v18 = &v26;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    -[MXCoreSession setBadgeType:](self->mCoreSession, "setBadgeType:", v13, v18, v19);

  }
  else
  {
    -[MXCoreSession setBadgeType:](mCoreSession, "setBadgeType:", CFSTR("NotApplicable"));
    if (dword_1EE2B3F38)
    {
      v25 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
}

- (BOOL)getDoesntActuallyPlayAudio
{
  return self->mDoesntActuallyPlayAudio;
}

+ (int)updateIsPlayingOutput:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSDictionary **v12;
  NSObject *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a3, "copyMXSessionList");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v7)
        objc_enumerationMutation(v4);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v8), "getIsPlayingOutput") & 1) != 0)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    if ((objc_msgSend(a3, "isPlayingOutput") & 1) != 0)
    {
      v10 = 0;
      goto LABEL_20;
    }
    v9 = 1;
  }
  else
  {
LABEL_9:
    v9 = 0;
    v10 = 0;
    if ((objc_msgSend(a3, "isPlayingOutput") & 1) == 0)
      goto LABEL_20;
  }
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v12 = (NSDictionary **)MEMORY[0x1E0C9AE40];
  if (v9)
    v12 = (NSDictionary **)MEMORY[0x1E0C9AE50];
  v10 = MXCoreSessionSetProperty(a3, CFSTR("IsPlayingOutput"), *v12, 0);
  if (v10)
  {
    v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
LABEL_20:

  return v10;
}

- (BOOL)getIsPlayingOutput
{
  return self->mIsPlayingOutput;
}

- (int)setPreferredAudioHardwareFormat:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", -[MXSession getPreferredAudioHardwareFormat](self, "getPreferredAudioHardwareFormat")) & 1) != 0)return 0;
  -[NSRecursiveLock lock](self->mRecursiveLock, "lock");

  self->mPreferredAudioHardwareFormat = (NSString *)a3;
  -[NSRecursiveLock unlock](self->mRecursiveLock, "unlock");
  return +[MXSession updatePreferredAudioHardwareFormat:withMaxOutputChannels:andCalledFromDealloc:](MXSession, "updatePreferredAudioHardwareFormat:withMaxOutputChannels:andCalledFromDealloc:", self->mCoreSession, 0, 0);
}

- (id)getPreferredAudioHardwareFormat
{
  NSString *v3;

  -[NSRecursiveLock lock](self->mRecursiveLock, "lock");
  v3 = self->mPreferredAudioHardwareFormat;
  -[NSRecursiveLock unlock](self->mRecursiveLock, "unlock");
  return v3;
}

+ (int)updatePreferredNumberOfOutputChannels:(id)a3
{
  int result;
  uint64_t v5;
  NSDictionary *v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  result = +[MXSession isCoreSessionFormatValidForMaxOutputChannels:](MXSession, "isCoreSessionFormatValidForMaxOutputChannels:", objc_msgSend(a3, "preferredHardwareFormat"));
  if (result)
  {
    v5 = +[MXSession getResolvedPreferredNumberOfOutputChannels:](MXSession, "getResolvedPreferredNumberOfOutputChannels:", a3);
    if (objc_msgSend(a3, "preferredNumberOfOutputChannels") == (_DWORD)v5)
    {
      return 0;
    }
    else
    {
      v6 = (NSDictionary *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
      if (dword_1EE2B3F38)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      return MXCoreSessionSetProperty(a3, CFSTR("PreferredNumberOfOutputChannels"), v6, 0);
    }
  }
  return result;
}

+ (BOOL)isCoreSessionFormatValidForMaxOutputChannels:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("AC-3")) & 1) != 0)
    return 0;
  else
    return objc_msgSend(a3, "isEqualToString:", CFSTR("MATAtmos")) ^ 1;
}

+ (unsigned)getResolvedPreferredNumberOfOutputChannels:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t i;
  unsigned int v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(a3, "copyMXSessionList");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "getPreferredNumberOfOutputChannels");
        if (v9 > v6)
          v6 = v9;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unsigned)getPreferredNumberOfOutputChannels
{
  return self->mPreferredNumberOfOutputChannels;
}

- (id)copyProperties:(id)a3 outPropertyErrors:(id *)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  _QWORD v15[8];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  +[MXInitialization waitUntilMXIsFullyInitialized](MXInitialization, "waitUntilMXIsFullyInitialized");
  v20 = 0;
  v21 = &v20;
  v22 = 0x3052000000;
  v23 = __Block_byref_object_copy__12;
  v24 = __Block_byref_object_dispose__12;
  v25 = 0;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(a3);
        if (!+[MXSession isNonSerializedCopyProperty:](MXSession, "isNonSerializedCopyProperty:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v9)))
        {
          v11 = MXGetSerialQueue();
          v15[0] = MEMORY[0x1E0C809B0];
          v15[1] = 3221225472;
          v15[2] = __46__MXSession_copyProperties_outPropertyErrors___block_invoke;
          v15[3] = &unk_1E3098CF0;
          v15[4] = self;
          v15[5] = a3;
          v15[6] = &v20;
          v15[7] = a4;
          MXDispatchAsyncAndWait((uint64_t)"-[MXSession copyProperties:outPropertyErrors:]", (uint64_t)"MXSession_ObjCInterface.m", 160, 0, 0, v11, (uint64_t)v15);
          if (a4)
            v12 = *a4;
          goto LABEL_12;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v26, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = -[MXSession copyPropertiesInternal:outPropertyErrors:](self, "copyPropertiesInternal:outPropertyErrors:", a3, a4);
  v21[5] = (uint64_t)v10;
LABEL_12:
  v13 = (void *)v21[5];
  _Block_object_dispose(&v20, 8);
  return v13;
}

- (id)copyPropertiesInternal:(id)a3 outPropertyErrors:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(a3);
        v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x194035B20]();
        v18 = 0;
        v13 = -[MXSession copyPropertyForKeyInternal:valueOut:](self, "copyPropertyForKeyInternal:valueOut:", v11, &v18);
        if ((_DWORD)v13)
          v14 = 1;
        else
          v14 = v18 == 0;
        if (!v14)
          objc_msgSend(v17, "setObject:forKey:");
        objc_msgSend(v6, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v13), v11);

        objc_autoreleasePoolPop(v12);
      }
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }
  if (a4)
    *a4 = v6;
  else

  return v17;
}

- (id)getCurrentlyPlayingSourceFormatInfo
{
  NSDictionary *v3;

  -[NSRecursiveLock lock](self->mRecursiveLock, "lock");
  v3 = self->mCurrentlyPlayingSourceFormatInfo;
  -[NSRecursiveLock unlock](self->mRecursiveLock, "unlock");
  return v3;
}

- (int)setBestAvailableContentType:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "isEqualToString:", -[MXSession getBestAvailableContentType](self, "getBestAvailableContentType")) & 1) == 0)
  {
    -[NSRecursiveLock lock](self->mRecursiveLock, "lock");

    self->mBestAvailableContentType = (NSString *)a3;
    -[NSRecursiveLock unlock](self->mRecursiveLock, "unlock");
    if (dword_1EE2B3F38)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (-[MXSession getIsPlaying](self, "getIsPlaying", v7, v8)
      || -[MXSession getClientType](self, "getClientType") == 2)
    {
      CMSMNotificationUtility_PostSourceFormatInfoDidChange();
    }
  }
  return 0;
}

- (id)getBestAvailableContentType
{
  NSString *v3;

  -[NSRecursiveLock lock](self->mRecursiveLock, "lock");
  v3 = self->mBestAvailableContentType;
  -[NSRecursiveLock unlock](self->mRecursiveLock, "unlock");
  return v3;
}

- (int)getClientType
{
  return self->mClientType;
}

- (int)_beginInterruptionWithSecTask:(__SecTask *)a3 andFlags:(unint64_t)a4
{
  return MXCoreSessionBeginInterruption_WithSecTaskAndFlags(self->mCoreSession, a3, a4, 0);
}

- (int)setIsRecording:(BOOL)a3
{
  _BOOL4 mIsRecording;
  int result;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  mIsRecording = self->mIsRecording;
  if (mIsRecording == a3)
    return 0;
  if (-[MXSessionManager isSpeechDetectCategory:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "isSpeechDetectCategory:", -[MXCoreSessionBase audioCategory](self->mCoreSession, "audioCategory")))
  {
    if (dword_1EE2B3F38)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return -15685;
  }
  else
  {
    self->mIsRecording = a3;
    if (dword_1EE2B3F38)
    {
      v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    result = +[MXSession updateIsRecording:](MXSession, "updateIsRecording:", self->mCoreSession, v9, v10);
    if (result)
      self->mIsRecording = mIsRecording;
  }
  return result;
}

- (double)getPreferredOutputSampleRate
{
  return self->mPreferredOutputSampleRate;
}

- (void)_dealloc
{
  unint64_t v3;
  unint64_t mID;
  void *v5;
  unint64_t mCoreSessionID;
  NSString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  _BOOL4 v13;
  _BOOL4 v14;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v16;
  NSObject *v17;
  _QWORD v18[7];
  os_log_type_t type;
  int v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  _QWORD v25[17];

  v25[16] = *MEMORY[0x1E0C80C00];
  v3 = -[MXCoreSession mxSessionListAddSession:](self->mCoreSession, "mxSessionListAddSession:", 0);
  mID = self->mID;
  v5 = (void *)MEMORY[0x1E0CB3940];
  mCoreSessionID = self->mCoreSessionID;
  v7 = -[MXCoreSessionBase clientName](self->mCoreSession, "clientName");
  v8 = CFSTR("YES");
  if (self->mIsMuted)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  if (self->mIsPlaying)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  if (self->mIAmPiP)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  if (self->mDoesntActuallyPlayAudio)
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  if (!self->mIsPlayingOutput)
    v8 = CFSTR("NO");
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<MXSessionID: %llx, CoreSessionID = %lld Name = %@, Muted = %@, Playing = %@, MutePriority = %@, PiP = %@, DoesntActuallyPlayAudio = %@, clientType = %x, IsPlayingOutput = %@"), mID, mCoreSessionID, v7, v9, v10, self->mMutePriority, v11, v12, self->mClientType, v8);
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v13 = -[NSString isEqualToString:](self->mMutePriority, "isEqualToString:", CFSTR("MutePriority_One"));
  if (v3)
    v14 = 0;
  else
    v14 = v13;
  if (v14)
  {
    if (dword_1EE2B3F38)
    {
      v20 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    *((_BYTE *)v22 + 24) = 1;
  }
  else if (dword_1EE2B3F38)
  {
    v20 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3052000000;
  v25[3] = __Block_byref_object_copy__9;
  v25[4] = __Block_byref_object_dispose__9;
  v25[5] = self->mCoreSession;
  v17 = MXGetSerialQueue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __36__MXSession_InterfaceImpl___dealloc__block_invoke;
  v18[3] = &unk_1E309C7E0;
  v18[4] = v25;
  v18[5] = &v21;
  v18[6] = v3;
  MXDispatchAsync((uint64_t)"-[MXSession(InterfaceImpl) _dealloc]", (uint64_t)"MXSession_Impl_Embedded.m", 1568, 0, 0, v17, (uint64_t)v18);

  self->mDescription = 0;
  self->mPreferredAudioHardwareFormat = 0;

  self->mMutePriority = 0;
  self->mSourceFormatInfo = 0;

  self->mCurrentlyPlayingSourceFormatInfo = 0;
  self->mCurrentlyPlayingBufferedAudioFormatInfo = 0;

  self->mBestAvailableContentType = 0;
  self->mRecursiveLock = 0;
  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v21, 8);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)MEMORY[0x194035B20](self, a2);
  -[MXSession _dealloc](self, "_dealloc");
  v4.receiver = self;
  v4.super_class = (Class)MXSession;
  -[MXSession dealloc](&v4, sel_dealloc);
  objc_autoreleasePoolPop(v3);
}

+ (int)updatePreferredOutputSampleRate:(id)a3
{
  void *v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  double v11;
  NSDictionary *v12;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a3, "copyMXSessionList");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v17;
    v9 = 0.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "getPreferredOutputSampleRate");
        if (v11 > v9)
          v9 = v11;
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
    *(float *)&v6 = v9;
  }
  else
  {
    LODWORD(v6) = 0;
  }
  v12 = (NSDictionary *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v14 = MXCoreSessionSetProperty(a3, CFSTR("PreferredOutputSampleRate"), v12, 0);

  return v14;
}

+ (int)updatePreferredAudioHardwareFormat:(id)a3 withMaxOutputChannels:(unsigned int)a4 andCalledFromDealloc:(BOOL)a5
{
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  uint64_t i;
  void *v12;
  const __CFString *UpdatedHardwareFormatBasedOnPreferredNumberOfOutputChannelsAndPreferredHardwareFormat;
  int v14;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v5 = a5;
  v24 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(a3, "copyMXSessionList");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (!v7)
  {
    v10 = CFSTR("LPCM");
    if (!v5)
      goto LABEL_17;
    goto LABEL_15;
  }
  v8 = v7;
  v9 = *(_QWORD *)v20;
  v10 = CFSTR("LPCM");
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v20 != v9)
        objc_enumerationMutation(v6);
      v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "getPreferredAudioHardwareFormat");
      if ((objc_msgSend(v12, "isEqualToString:", CFSTR("MATAtmos")) & 1) != 0)
      {
        v10 = CFSTR("MATAtmos");
        goto LABEL_14;
      }
      if (objc_msgSend(v12, "isEqualToString:", CFSTR("AC-3"))
        && -[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("LPCM")))
      {
        v10 = CFSTR("AC-3");
      }
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
      continue;
    break;
  }
LABEL_14:
  if (v5)
  {
LABEL_15:
    UpdatedHardwareFormatBasedOnPreferredNumberOfOutputChannelsAndPreferredHardwareFormat = CMSessionMgrGetUpdatedHardwareFormatBasedOnPreferredNumberOfOutputChannelsAndPreferredHardwareFormat(a4, (uint64_t)v10);
    if (!FigCFEqual())
      v10 = (__CFString *)UpdatedHardwareFormatBasedOnPreferredNumberOfOutputChannelsAndPreferredHardwareFormat;
  }
LABEL_17:
  if ((objc_msgSend((id)objc_msgSend(a3, "preferredHardwareFormat"), "isEqualToString:", v10) & 1) != 0)
  {
    v14 = 0;
  }
  else
  {
    if (dword_1EE2B3F38)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v14 = MXCoreSessionSetProperty(a3, CFSTR("PreferredAudioHardwareFormat"), (NSDictionary *)v10, 0);
  }

  return v14;
}

- (BOOL)getIsMuted
{
  return self->mIsMuted;
}

- (BOOL)getIAmPiP
{
  return self->mIAmPiP;
}

- (BOOL)getActuallyPlaysAudio
{
  return !self->mDoesntActuallyPlayAudio;
}

+ (void)initialize
{
  if ((id)objc_opt_self() == a1)
  {
    sNonSerializedCopyProperties = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("ActivationContext"), CFSTR("AirPlayVideoIsActive"), CFSTR("AllowedRouteTypes"), CFSTR("AllowedToUseHardwareAudioCodec"), CFSTR("AllowMixableAudioWhileRecording"), CFSTR("AllowSystemSoundsWhileRecording"), CFSTR("AudioBehaviour"), CFSTR("AudioCategory"), CFSTR("AudioHardwareControlFlags"), CFSTR("AudioMode"), CFSTR("AudioOnlyAirPlayVideoIsActive"), CFSTR("AudioToolboxIsPlaying"), CFSTR("BestAvailableContentType"), CFSTR("BadgeType"), CFSTR("DoesGameAudioNeedToBeSpatialized"), CFSTR("CanBeginInterruption"), CFSTR("DefaultBuiltInRoute"),
                                     CFSTR("EnableBluetoothRecording"),
                                     CFSTR("ClientName"),
                                     CFSTR("ClientPID"),
                                     CFSTR("ClientPriority"),
                                     CFSTR("ConstantOutputVolumeLeveldB"),
                                     CFSTR("ControlsRoute"),
                                     CFSTR("AudioSessionID"),
                                     CFSTR("CurrentAudioHardwareSampleRate"),
                                     CFSTR("CurrentInputSampleRate"),
                                     CFSTR("CurrentlyPlayingContentIsEligibleForSpatialization"),
                                     CFSTR("CurrentlyPlayingSourceFormatInfo"),
                                     CFSTR("CurrentlyPlayingBufferedAudioFormatInfo"),
                                     CFSTR("CurrentOutputSampleRate"),
                                     CFSTR("CurrentSpeechDetectionDeviceSampleRate"),
                                     CFSTR("DefaultVPChatMode"),
                                     CFSTR("DetailedActiveAudioRoute"),
                                     CFSTR("DoesntActuallyPlayAudio"),
                                     CFSTR("DoNotNotifyOtherSessionsOnNextInactive"),
                                     CFSTR("DoNotResetAudioCategoryOnNextInactive"),
                                     CFSTR("DuckFadeDuration"),
                                     CFSTR("DuckToLevelDB"),
                                     CFSTR("DuckToLevelScalar"),
                                     CFSTR("ForceSoundCheck"),
                                     CFSTR("HapticEngineIsPlaying"),
                                     CFSTR("HandsOverInterruptionsToInterruptor"),
                                     CFSTR("HostApplicationDisplayID"),
                                     CFSTR("HostProcessAttribution"),
                                     CFSTR("IAmTheAssistant"),
                                     CFSTR("MXSessionID"),
                                     CFSTR("InterruptionFadeDuration"),
                                     CFSTR("InterruptionStyle"),
                                     CFSTR("IsActive"),
                                     CFSTR("IsAirPlayReceiverSession"),
                                     CFSTR("BypassSystemSpatialAudioForGame"),
                                     CFSTR("IsAudioSession"),
                                     CFSTR("IsEligibleForBTSmartRoutingConsideration"),
                                     CFSTR("IsEligibleForNowPlayingAppConsideration"),
                                     CFSTR("IsEligibleForBTTriangleConsideration"),
                                     CFSTR("IsExpanseCallSession"),
                                     CFSTR("IsExpanseMediaSession"),
                                     CFSTR("IsFigInstantiatedAudioSession"),
                                     CFSTR("IsInterrupted"),
                                     CFSTR("IsLongFormAudio"),
                                     CFSTR("IsMuted"));
    sNonSerializedSetProperties = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("AirPlayVideoIsActive"), CFSTR("AllowMixableAudioWhileRecording"), CFSTR("AudioOnlyAirPlayVideoIsActive"), CFSTR("AuditToken"), CFSTR("AllowSystemSoundsWhileRecording"), CFSTR("BestAvailableContentType"), CFSTR("ClientName"), CFSTR("ClientPID"), CFSTR("ClientSecTask"), CFSTR("ClientType"), CFSTR("CurrentlyPlayingContentIsEligibleForSpatialization"), CFSTR("CurrentlyPlayingSourceFormatInfo"), CFSTR("DisallowAudioFormatChanges"), CFSTR("DoesInterAppAudio"), CFSTR("DoNotNotifyOtherSessionsOnNextInactive"), CFSTR("DoNotResetAudioCategoryOnNextInactive"), CFSTR("DuckFadeDuration"),
                                    CFSTR("DuckToLevelDB"),
                                    CFSTR("ForceSoundCheck"),
                                    CFSTR("HandsOverInterruptionsToInterruptor"),
                                    CFSTR("HostProcessAttribution"),
                                    CFSTR("IAmIDSMXCoreSession"),
                                    CFSTR("IAmHardwareSafetySession"),
                                    CFSTR("IAmPiP"),
                                    CFSTR("IAmCar"),
                                    CFSTR("InterruptionFadeDuration"),
                                    CFSTR("IsAirPlayReceiverSession"),
                                    CFSTR("IsAudioSession"),
                                    CFSTR("IsEligibleForNowPlayingAppConsideration"),
                                    CFSTR("IsFigInstantiatedAudioSession"),
                                    CFSTR("IsLongFormAudio"),
                                    CFSTR("IsSharedAVAudioSessionInstance"),
                                    CFSTR("IsSharePlayCapableCallSession"),
                                    CFSTR("IsUsingBuiltInMicForRecording"),
                                    CFSTR("IsRecordingMutedForRemoteDevice"),
                                    CFSTR("IsUsingCamera"),
                                    CFSTR("NeroSuspended"),
                                    CFSTR("OptOutOfMutePriority"),
                                    CFSTR("PrefersBeingInterruptedByNextActiveRecordingClient"),
                                    CFSTR("PrefersBluetoothAccessoryMuting"),
                                    CFSTR("PrefersConcurrentAirPlayAudio"),
                                    CFSTR("PrefersNoDucking"),
                                    CFSTR("PrefersNoInterruptionsByMixableSessions"),
                                    CFSTR("PrefersNoInterruptionsDuringRemoteDeviceControl"),
                                    CFSTR("PrefersSpeechDetectEnabled"),
                                    CFSTR("PrefersToPlayDuringWombat"),
                                    CFSTR("PrefersToTakeHWControlFlagsFromAnotherSession"),
                                    CFSTR("PrefersToVibeWhenVibrationsAreDisabled"),
                                    CFSTR("ProcessAssertionAuditTokens"),
                                    CFSTR("ReporterIDs"),
                                    CFSTR("SourceFormatInfo"),
                                    CFSTR("SubscribeToNotifications"),
                                    CFSTR("TemporaryAssertionEnabled"),
                                    CFSTR("UnduckFadeDuration"),
                                    CFSTR("VibrationData"),
                                    CFSTR("WantsAutomaticClusterPairingOnPlaybackStart"),
                                    CFSTR("WantsToBeVolumeButtonClient"),
                                    CFSTR("WantsToPauseSpokenAudio"),
                                    CFSTR("WantsToSendResumableEndInterruptionWhenBackgrounded"),
                                    CFSTR("WantsVibrationNotifications"),
                                    CFSTR("WantsVolumeChangesWhenPaused"));
    sNonSerializedSetPropertiesWhenSessionIsInactive = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("AllowedRouteTypes"), CFSTR("AudioClockDevice"), CFSTR("AudioCategory"), CFSTR("AudioMode"), CFSTR("AudioHardwareControlFlags"), CFSTR("CameraParameters"), CFSTR("CaptureOrientationOverride"), CFSTR("DefaultBuiltInRoute"), CFSTR("EnableBluetoothRecording"), CFSTR("ClientPriority"), CFSTR("ConstantOutputVolumeLeveldB"), CFSTR("AudioSessionID"), CFSTR("CreateSpeakerDevice"), CFSTR("DefaultVPChatMode"), CFSTR("DeselectedInputs"), CFSTR("DuckToLevelScalar"), CFSTR("ExcludedRoutes"),
                                                         CFSTR("IAmTheAssistant"),
                                                         CFSTR("IgnoreRingerSwitch"),
                                                         CFSTR("InputGainScalar"),
                                                         CFSTR("InterruptionStyle"),
                                                         CFSTR("IsEligibleForBTSmartRoutingConsideration"),
                                                         CFSTR("IsEligibleForBTTriangleConsideration"),
                                                         CFSTR("MutesAudioBasedOnRingerSwitchState"),
                                                         CFSTR("OrientationOverride"),
                                                         CFSTR("PreferredAudioHardwareFormat"),
                                                         CFSTR("PreferredAudioHardwareIOBufferFrameDuration"),
                                                         CFSTR("PreferredAudioHardwareIOBufferFrames"),
                                                         CFSTR("PreferredDecoupledInputOutput"),
                                                         CFSTR("PreferredInputs"),
                                                         CFSTR("PreferredInputSampleRate"),
                                                         CFSTR("PreferredPersistentRoute"),
                                                         CFSTR("PreferredStereoInputOrientation"),
                                                         CFSTR("PrefersEchoCancelledInput"),
                                                         CFSTR("PrefersInterruptionOnRouteDisconnect"),
                                                         CFSTR("PrefersNoInterruptionsByRingtonesAndAlerts"),
                                                         CFSTR("PreferredRouteControlFeatures"),
                                                         CFSTR("RequiresAggregatedInputOutput"),
                                                         CFSTR("SelectedInputs"),
                                                         CFSTR("SelectedOutputs"),
                                                         CFSTR("UnduckToLevelScalar"),
                                                         CFSTR("VPBlockConfiguration"),
                                                         0);
    sOrderedMXSessionProperties = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithObjects:", CFSTR("ClientType"), CFSTR("ClientName"), CFSTR("IsAudioSession"), CFSTR("AudioSessionID"), CFSTR("ClientPID"), CFSTR("ClientSecTask"), CFSTR("AuditToken"), CFSTR("IAmTheAssistant"), CFSTR("IAmCar"), CFSTR("IAmIDSMXCoreSession"), CFSTR("IAmHardwareSafetySession"), CFSTR("AudioCategory"), CFSTR("AudioMode"), CFSTR("EnableBluetoothRecording"), CFSTR("DefaultBuiltInRoute"), CFSTR("ClientPriority"), CFSTR("InterruptionStyle"),
                                    CFSTR("RouteSharingPolicy"),
                                    CFSTR("ActivationContext"),
                                    CFSTR("DoesntActuallyPlayAudio"),
                                    CFSTR("IsSharePlayCapableCallSession"),
                                    CFSTR("IsExpanseCallSession"),
                                    CFSTR("IsExpanseMediaSession"),
                                    CFSTR("IsEligibleForBTTriangleConsideration"),
                                    CFSTR("IsEligibleForBTSmartRoutingConsideration"),
                                    CFSTR("VibrationData"),
                                    CFSTR("VibratorOn"),
                                    0);
  }
}

- (id)getSourceFormatInfo
{
  NSDictionary *v3;

  -[NSRecursiveLock lock](self->mRecursiveLock, "lock");
  v3 = self->mSourceFormatInfo;
  -[NSRecursiveLock unlock](self->mRecursiveLock, "unlock");
  return v3;
}

- (id)copyCurrentlyPlayingBufferedAudioSourceFormatInfo
{
  NSDictionary *v3;

  -[NSRecursiveLock lock](self->mRecursiveLock, "lock");
  v3 = self->mCurrentlyPlayingBufferedAudioFormatInfo;
  -[NSRecursiveLock unlock](self->mRecursiveLock, "unlock");
  return v3;
}

- (BOOL)getCurrentlyPlayingContentIsEligibleForSpatialization
{
  return self->mCurrentlyPlayingContentIsEligibleForSpatialization;
}

- (int)setID:(unint64_t)a3
{
  self->mID = a3;
  return 0;
}

- (int)setIAmPiP:(BOOL)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (self->mIAmPiP != a3)
  {
    self->mIAmPiP = a3;
    if (dword_1EE2B3F38)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  return 0;
}

- (int)resetIsPlayingStates
{
  self->mIsPlaying = 0;
  self->mClientIsPlaying = 0;
  self->mAudioToolboxIsPlaying = 0;
  self->mIsPlayingOutput = 0;
  return 0;
}

- (int)setPreferredOutputSampleRate:(double)a3
{
  if (self->mPreferredOutputSampleRate == a3)
    return 0;
  self->mPreferredOutputSampleRate = a3;
  return +[MXSession updatePreferredOutputSampleRate:](MXSession, "updatePreferredOutputSampleRate:", self->mCoreSession);
}

- (int)setIsMuted:(BOOL)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->mIsMuted != a3)
  {
    self->mIsMuted = a3;
    if (dword_1EE2B3F38)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (CMSUtility_IsAudioCategoryPrimary(self->mCoreSession))
    {
      CMSMNotificationUtility_PostSomePrimaryAudioCategoryIsPlayingDidChange(self->mCoreSession);
      CMSMNotificationUtility_PostSomeOtherPrimaryAudioCategoryIsPlayingDidChange(self->mCoreSession);
    }
    -[MXSession updateBadgeType](self, "updateBadgeType", v6, v7);
  }
  return 0;
}

- (int)setSourceFormatInfo:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[NSRecursiveLock lock](self->mRecursiveLock, "lock");

  self->mSourceFormatInfo = (NSDictionary *)a3;
  -[NSRecursiveLock unlock](self->mRecursiveLock, "unlock");
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (-[MXSession getIsPlaying](self, "getIsPlaying", v7, v8))
    CMSMNotificationUtility_PostSourceFormatInfoDidChange();
  return 0;
}

- (int)setCurrentlyPlayingBufferedAudioFormatInfo:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[NSRecursiveLock lock](self->mRecursiveLock, "lock");

  self->mCurrentlyPlayingBufferedAudioFormatInfo = (NSDictionary *)a3;
  -[NSRecursiveLock unlock](self->mRecursiveLock, "unlock");
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[MXSession updateBadgeType](self, "updateBadgeType", v7, v8);
  return 0;
}

- (int)setCurrentlyPlayingContentIsEligibleForSpatialization:(BOOL)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->mCurrentlyPlayingContentIsEligibleForSpatialization != a3)
  {
    self->mCurrentlyPlayingContentIsEligibleForSpatialization = a3;
    if (dword_1EE2B3F38)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (-[MXSession getIsPlaying](self, "getIsPlaying", v6, v7))
      CMSMNotificationUtility_PostSourceFormatInfoDidChange();
  }
  return 0;
}

- (void)setInterruptionCalledOffAudioControlQueue:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a3;
  v8 = *MEMORY[0x1E0C80C00];
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[MXCoreSession setIsInterruptionCalledOffAudioControlQueue:](self->mCoreSession, "setIsInterruptionCalledOffAudioControlQueue:", v3, v6, v7);
}

- (void)mute
{
  if (!self->mIsMuted)
  {
    CMSMUtility_AudioToolboxHandleInterruptionCommandWithMXSessionID(self->mCoreSession, self->mID, 8);
    -[MXSession setIsMuted:](self, "setIsMuted:", 1);
    -[MXSession postIsMutedDidChange](self, "postIsMutedDidChange");
  }
}

- (void)unmute
{
  if (self->mIsMuted)
  {
    CMSMUtility_AudioToolboxHandleInterruptionCommandWithMXSessionID(self->mCoreSession, self->mID, 9);
    -[MXSession setIsMuted:](self, "setIsMuted:", 0);
    -[MXSession postIsMutedDidChange](self, "postIsMutedDidChange");
  }
}

- (void)postIsMutedDidChange
{
  MXSession *v3;
  NSObject *v4;
  _QWORD v5[5];

  if (self)
  {
    v3 = self;
    v4 = MXGetNotificationSenderQueue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __46__MXSession_InternalUse__postIsMutedDidChange__block_invoke;
    v5[3] = &unk_1E3099900;
    v5[4] = self;
    MXDispatchAsync((uint64_t)"-[MXSession(InternalUse) postIsMutedDidChange]", (uint64_t)"MXSession_Impl_Embedded.m", 1370, 0, 0, v4, (uint64_t)v5);
  }
}

void __46__MXSession_InternalUse__postIsMutedDidChange__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;

  v2 = objc_alloc(MEMORY[0x1E0C99D80]);
  v3 = (void *)objc_msgSend(v2, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "getIsMuted")), CFSTR("Muted"), 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("IsMutedDidChange"), *(_QWORD *)(a1 + 32), v3);

}

+ (id)copyMXSessionForID:(unint64_t)a3
{
  void *v4;
  __objc2_class **p_superclass;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v19;
  NSPointerArray *obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x194035B20](a1, a2);
  p_superclass = MXSession.superclass;
  -[MXSessionManager mxCoreSessionListBeginIteration](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mxCoreSessionListBeginIteration");
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = -[MXSessionManager mxCoreSessionList](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "mxCoreSessionList");
  v6 = -[NSPointerArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v6)
  {
    v7 = v6;
    v19 = v4;
    v8 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v10, "mxSessionListBeginIteration", v19);
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        v11 = (void *)objc_msgSend(v10, "mxSessionList");
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v22;
LABEL_8:
          v15 = 0;
          while (1)
          {
            if (*(_QWORD *)v22 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v15);
            if (objc_msgSend(v16, "getID") == a3)
              break;
            if (v13 == ++v15)
            {
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
              if (v13)
                goto LABEL_8;
              goto LABEL_14;
            }
          }
          v17 = v16;
          objc_msgSend(v10, "mxSessionListEndIteration");
          if (v17)
            goto LABEL_19;
        }
        else
        {
LABEL_14:
          objc_msgSend(v10, "mxSessionListEndIteration");
        }
      }
      v7 = -[NSPointerArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v7);
    v17 = 0;
LABEL_19:
    v4 = v19;
    p_superclass = (__objc2_class **)(MXSession + 8);
  }
  else
  {
    v17 = 0;
  }
  objc_msgSend((id)objc_msgSend(p_superclass + 104, "sharedInstance"), "mxCoreSessionListEndIteration");
  objc_autoreleasePoolPop(v4);
  return v17;
}

+ (id)getSetPropertiesOrder
{
  return (id)sOrderedMXSessionProperties;
}

- (void)dumpInfo
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (int)_addResource:(__CFString *)a3 resourceInfo:(__CFDictionary *)a4 token:(OpaqueCMSessionResourceToken *)a5
{
  return MXCoreSessionAddResource(self->mCoreSession, (uint64_t)a3, (uint64_t)a4, a5);
}

- (int)_removeResourceWithToken:(OpaqueCMSessionResourceToken *)a3
{
  return MXCoreSessionRemoveResource((uint64_t)self->mCoreSession, a3);
}

- (int)_endInterruptionWithSecTask:(__SecTask *)a3 andStatus:(__CFString *)a4
{
  return MXCoreSessionEndInterruption_WithSecTaskAndStatus(self->mCoreSession, a3, a4, 0);
}

+ (BOOL)isSessionMuted:(unint64_t)a3
{
  id v4;
  char v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  +[MXInitialization waitUntilMXIsFullyInitialized](MXInitialization, "waitUntilMXIsFullyInitialized");
  v4 = +[MXSession copyMXSessionForID:](MXSession, "copyMXSessionForID:", a3);
  v5 = objc_msgSend(v4, "getIsMuted");
  if (dword_1EE2B3F38)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }

  return v5;
}

uint64_t __37__MXSession_setPropertyForKey_value___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_setPropertyForKey:value:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

@end
