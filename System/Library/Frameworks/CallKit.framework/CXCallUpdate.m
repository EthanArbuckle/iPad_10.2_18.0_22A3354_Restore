@implementation CXCallUpdate

- (CXCallUpdate)init
{
  CXCallUpdate *v2;
  CXCallUpdate *v3;
  uint64_t v4;
  NSUUID *UUID;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CXCallUpdate;
  v2 = -[CXCallUpdate init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_accessorLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = objc_claimAutoreleasedReturnValue();
    UUID = v3->_UUID;
    v3->_UUID = (NSUUID *)v4;

    *((_WORD *)&v3->_hasSet + 4) = 0;
    *(_QWORD *)&v3->_hasSet = 0;
  }
  return v3;
}

+ (CXCallUpdate)callUpdateWithDefaultValuesSet
{
  id v2;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "setSupportsHolding:", 1);
  objc_msgSend(v2, "setSupportsGrouping:", 1);
  objc_msgSend(v2, "setSupportsUngrouping:", 1);
  objc_msgSend(v2, "setSupportsDTMF:", 1);
  objc_msgSend(v2, "setSupportsUnambiguousMultiPartyState:", 1);
  objc_msgSend(v2, "setSupportsAddCall:", 1);
  objc_msgSend(v2, "setSupportsRecording:", 1);
  objc_msgSend(v2, "setSupportsScreening:", 1);
  return (CXCallUpdate *)v2;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int16 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int16 v29;
  char v30;
  char v31;
  char v32;
  char v33;
  char v34;
  char v35;
  char v36;
  __int16 v37;
  __int16 v38;
  id v39;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXCallUpdate UUID](self, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" UUID=%@"), v5);

  if ((-[CXCallUpdate hasSet](self, "hasSet") & 1) != 0)
  {
    -[CXCallUpdate account](self, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" account=%@"), v6);

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 2) != 0)
  {
    -[CXCallUpdate activeRemoteParticipant](self, "activeRemoteParticipant");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" activeRemoteParticipant=%@"), v7);

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x200) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" blocked=%d"), -[CXCallUpdate isBlocked](self, "isBlocked"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x20) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" emergency=%d"), -[CXCallUpdate isEmergency](self, "isEmergency"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x40) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" failureExpected=%d"), -[CXCallUpdate isFailureExpected](self, "isFailureExpected"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x80) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" supportsEmergencyFallback=%d"), -[CXCallUpdate supportsEmergencyFallback](self, "supportsEmergencyFallback"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x100) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" usingBaseband=%d"), -[CXCallUpdate isUsingBaseband](self, "isUsingBaseband"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 4) != 0)
  {
    -[CXCallUpdate remoteHandle](self, "remoteHandle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" remoteHandle=%@"), v8);

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 8) != 0)
  {
    -[CXCallUpdate localizedCallerName](self, "localizedCallerName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" localizedCallerName=%@"), v9);

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x10) != 0)
  {
    -[CXCallUpdate localizedCallerImageURL](self, "localizedCallerImageURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" localizedCallerImageURL=%@"), v10);

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x400) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" ttyType=%ld"), -[CXCallUpdate ttyType](self, "ttyType"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x1000) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" mayRequireBreakBeforeMake=%d"), -[CXCallUpdate mayRequireBreakBeforeMake](self, "mayRequireBreakBeforeMake"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x2000) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" hasVideo=%d"), -[CXCallUpdate hasVideo](self, "hasVideo"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x4000) != 0)
  {
    -[CXCallUpdate audioCategory](self, "audioCategory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" audioCategory=%@"), v11);

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x8000) != 0)
  {
    -[CXCallUpdate audioMode](self, "audioMode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" audioMode=%@"), v12);

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x10000) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" audioInterruptionProvider=%ld"), -[CXCallUpdate audioInterruptionProvider](self, "audioInterruptionProvider"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x20000) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" audioInterruptionOperationMode=%ld"), -[CXCallUpdate audioInterruptionOperationMode](self, "audioInterruptionOperationMode"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x40000) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" verificationStatus=%ld"), -[CXCallUpdate verificationStatus](self, "verificationStatus"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x80000) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" priorty=%ld"), -[CXCallUpdate priority](self, "priority"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x100000) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" requiresInCallSounds=%d"), -[CXCallUpdate requiresInCallSounds](self, "requiresInCallSounds"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x200000) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" inCallSoundRegion=%ld"), -[CXCallUpdate inCallSoundRegion](self, "inCallSoundRegion"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x400000) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" supportsHolding=%d"), -[CXCallUpdate supportsHolding](self, "supportsHolding"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x800000) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" supportsGrouping=%d"), -[CXCallUpdate supportsGrouping](self, "supportsGrouping"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x1000000) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" supportsUngrouping=%d"), -[CXCallUpdate supportsUngrouping](self, "supportsUngrouping"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x2000000) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" supportsDTMF=%d"), -[CXCallUpdate supportsDTMF](self, "supportsDTMF"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x4000000) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" supportsDTMFUpdates=%d"), -[CXCallUpdate supportsDTMFUpdates](self, "supportsDTMFUpdates"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x8000000) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" supportsUnambiguousMultiPartyState=%d"), -[CXCallUpdate supportsUnambiguousMultiPartyState](self, "supportsUnambiguousMultiPartyState"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x10000000) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" supportsAddCall=%d"), -[CXCallUpdate supportsAddCall](self, "supportsAddCall"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x20000000) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" supportsSendingToVoicemail=%d"), -[CXCallUpdate supportsSendingToVoicemail](self, "supportsSendingToVoicemail"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x40000000) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" supportsRecording=%d"), -[CXCallUpdate supportsRecording](self, "supportsRecording"));
  -[CXCallUpdate hasSet](self, "hasSet");
  if ((v13 & 0x200) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" supportsScreening=%d"), -[CXCallUpdate supportsScreening](self, "supportsScreening"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x80000000) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" videoStreamToken=%ld"), -[CXCallUpdate videoStreamToken](self, "videoStreamToken"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x100000000) != 0)
  {
    -[CXCallUpdate callTokens](self, "callTokens");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" callTokens=%@"), v14);

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x200000000) != 0)
  {
    -[CXCallUpdate announceProviderIdentifier](self, "announceProviderIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" aPI=%@"), v15);

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x400000000) != 0)
  {
    -[CXCallUpdate crossDeviceIdentifier](self, "crossDeviceIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" crossDeviceIdentifier=%@"), v16);

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x800000000) != 0)
  {
    -[CXCallUpdate ISOCountryCode](self, "ISOCountryCode");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" ISOCountryCode=%@"), v17);

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x1000000000) != 0)
  {
    -[CXCallUpdate localSenderIdentityUUID](self, "localSenderIdentityUUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" localSenderIdentityUUID=%@"), v18);

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x2000000000) != 0)
  {
    -[CXCallUpdate localSenderIdentityAccountUUID](self, "localSenderIdentityAccountUUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" localSenderIdentityAccountUUID=%@"), v19);

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x4000000000) != 0)
  {
    -[CXCallUpdate localMemberHandleValue](self, "localMemberHandleValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" localMemberHandleValue=%@"), v20);

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x8000000000) != 0)
  {
    -[CXCallUpdate localSenderSubscriptionIdentifier](self, "localSenderSubscriptionIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" localSenderSubscriptionIdentifier=%@"), v21);

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x10000000000) != 0)
  {
    -[CXCallUpdate participantGroupUUID](self, "participantGroupUUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" participantGroupUUID=%@"), v22);

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x20000000000) != 0)
  {
    -[CXCallUpdate remoteParticipantHandles](self, "remoteParticipantHandles");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" remoteParticipantHandles=%@"), v23);

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x40000000000) != 0)
  {
    -[CXCallUpdate otherInvitedHandles](self, "otherInvitedHandles");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" otherInvitedHandles=%@"), v24);

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x80000000000) != 0)
  {
    -[CXCallUpdate activeRemoteParticipantHandles](self, "activeRemoteParticipantHandles");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" activeRemoteParticipantHandles=%@"), v25);

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x100000000000) != 0)
  {
    -[CXCallUpdate handoffContext](self, "handoffContext");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" handoffContext=%@"), v26);

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x200000000000) != 0)
  {
    -[CXCallUpdate screenShareAttributes](self, "screenShareAttributes");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" screenShareAttributes=%@"), v27);

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x400000000000) != 0)
  {
    -[CXCallUpdate context](self, "context");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" context=%@"), v28);

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x800000000000) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" prefersExclusiveAccessToCellularNetwork=%d"), -[CXCallUpdate prefersExclusiveAccessToCellularNetwork](self, "prefersExclusiveAccessToCellularNetwork"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x800) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" supportsTTYWithVoice=%d"), -[CXCallUpdate supportsTTYWithVoice](self, "supportsTTYWithVoice"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x1000000000000) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" remoteUplinkMuted=%d"), -[CXCallUpdate isRemoteUplinkMuted](self, "isRemoteUplinkMuted"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x2000000000000) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" shouldSuppressInCallUI=%d"), -[CXCallUpdate shouldSuppressInCallUI](self, "shouldSuppressInCallUI"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x4000000000000) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" requiresAuthentication=%d"), -[CXCallUpdate requiresAuthentication](self, "requiresAuthentication"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x8000000000000) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" mutuallyExclusiveCall=%d"), -[CXCallUpdate isMutuallyExclusiveCall](self, "isMutuallyExclusiveCall"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x10000000000000) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" junkConfidence=%ld"), -[CXCallUpdate junkConfidence](self, "junkConfidence"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x20000000000000) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" identifcationCategory=%ld"), -[CXCallUpdate identificationCategory](self, "identificationCategory"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x40000000000000) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" conversation=%d"), -[CXCallUpdate isConversation](self, "isConversation"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x80000000000000) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" mixesVoiceWithMedia=%d"), -[CXCallUpdate mixesVoiceWithMedia](self, "mixesVoiceWithMedia"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x100000000000000) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" prefersToPlayDuringWombat=%d"), -[CXCallUpdate prefersToPlayDuringWombat](self, "prefersToPlayDuringWombat"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x200000000000000) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" mediaPlaybackOnExternalDevice=%d"), -[CXCallUpdate mediaPlaybackOnExternalDevice](self, "mediaPlaybackOnExternalDevice"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x2000000000000000) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" ignoresBluetoothDeviceUID=%d"), -[CXCallUpdate ignoresBluetoothDeviceUID](self, "ignoresBluetoothDeviceUID"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x400000000000000) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" oneToOneModeEnabled=%d"), -[CXCallUpdate isOneToOneModeEnabled](self, "isOneToOneModeEnabled"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x800000000000000) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" sharingScreen=%d"), -[CXCallUpdate isSharingScreen](self, "isSharingScreen"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x1000000000000000) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" bluetoothAudioFormat=%ld"), -[CXCallUpdate bluetoothAudioFormat](self, "bluetoothAudioFormat"));
  -[CXCallUpdate hasSet](self, "hasSet");
  if ((v29 & 0x400) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" screenSharingIntention=%ld"), -[CXCallUpdate screenSharingIntention](self, "screenSharingIntention"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x4000000000000000) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" serviceStatus=%ld"), -[CXCallUpdate serviceStatus](self, "serviceStatus"));
  if (-[CXCallUpdate hasSet](self, "hasSet") < 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" transmissionMode=%ld"), -[CXCallUpdate transmissionMode](self, "transmissionMode"));
  -[CXCallUpdate hasSet](self, "hasSet");
  if ((v30 & 1) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" accessoryButtonEventsEnabled=%d"), -[CXCallUpdate accessoryButtonEventsEnabled](self, "accessoryButtonEventsEnabled"));
  -[CXCallUpdate hasSet](self, "hasSet");
  if ((v31 & 2) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" sendingVideo=%d"), -[CXCallUpdate isSendingVideo](self, "isSendingVideo"));
  -[CXCallUpdate hasSet](self, "hasSet");
  if ((v32 & 4) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" hasBeenRedirected=%d"), -[CXCallUpdate hasBeenRedirected](self, "hasBeenRedirected"));
  -[CXCallUpdate hasSet](self, "hasSet");
  if ((v33 & 8) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" isKnownCaller=%d"), -[CXCallUpdate isKnownCaller](self, "isKnownCaller"));
  -[CXCallUpdate hasSet](self, "hasSet");
  if ((v34 & 0x10) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" filteredOutReason=%d"), -[CXCallUpdate filteredOutReason](self, "filteredOutReason"));
  -[CXCallUpdate hasSet](self, "hasSet");
  if ((v35 & 0x40) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" isReRing=%d"), -[CXCallUpdate isReRing](self, "isReRing"));
  -[CXCallUpdate hasSet](self, "hasSet");
  if (v36 < 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" suppressRingtone=%d"), -[CXCallUpdate suppressRingtone](self, "suppressRingtone"));
  -[CXCallUpdate hasSet](self, "hasSet");
  if ((v37 & 0x100) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" callSubType=%ld"), -[CXCallUpdate callSubType](self, "callSubType"));
  -[CXCallUpdate hasSet](self, "hasSet");
  if ((v38 & 0x800) != 0)
    objc_msgSend(v3, "appendFormat:", CFSTR(" screenSharingType=%ld"), -[CXCallUpdate screenSharingType](self, "screenSharingType"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v39 = v3;

  return (NSString *)v39;
}

- (CXSandboxExtendedURL)localizedCallerImageURL
{
  os_unfair_lock_s *p_accessorLock;
  CXSandboxExtendedURL *v4;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  v4 = self->_localizedCallerImageURL;
  os_unfair_lock_unlock(p_accessorLock);
  return v4;
}

- (void)setLocalizedCallerImageURL:(id)a3
{
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  CXSandboxExtendedURL *v10;

  v10 = (CXSandboxExtendedURL *)a3;
  if (v10)
  {
    -[CXSandboxExtendedURL URL](v10, "URL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isFileURL");

    if ((v6 & 1) == 0)
    {
      v7 = (void *)MEMORY[0x1E0C99DA0];
      v8 = *MEMORY[0x1E0C99778];
      NSStringFromSelector(sel_localizedCallerImageURL);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "raise:format:", v8, CFSTR("%s: parameter '%@' must be a file URL"), "-[CXCallUpdate setLocalizedCallerImageURL:]", v9);

    }
  }
  os_unfair_lock_lock(&self->_accessorLock);
  if (self->_localizedCallerImageURL != v10)
  {
    *(_QWORD *)&self->_hasSet |= 0x10uLL;
    objc_storeStrong((id *)&self->_localizedCallerImageURL, a3);
  }
  os_unfair_lock_unlock(&self->_accessorLock);

}

- (NSMutableDictionary)silencingUserInfo
{
  NSMutableDictionary *silencingUserInfo;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  silencingUserInfo = self->_silencingUserInfo;
  if (!silencingUserInfo)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = self->_silencingUserInfo;
    self->_silencingUserInfo = v4;

    silencingUserInfo = self->_silencingUserInfo;
  }
  return silencingUserInfo;
}

- (CXAccount)account
{
  os_unfair_lock_s *p_accessorLock;
  CXAccount *v4;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  v4 = self->_account;
  os_unfair_lock_unlock(p_accessorLock);
  return v4;
}

- (void)setAccount:(id)a3
{
  os_unfair_lock_s *p_accessorLock;
  id v5;
  CXAccount *v6;
  CXAccount *account;

  p_accessorLock = &self->_accessorLock;
  v5 = a3;
  os_unfair_lock_lock(p_accessorLock);
  *(_QWORD *)&self->_hasSet |= 1uLL;
  v6 = (CXAccount *)objc_msgSend(v5, "copy");

  account = self->_account;
  self->_account = v6;

  os_unfair_lock_unlock(p_accessorLock);
}

- (CXParticipant)activeRemoteParticipant
{
  os_unfair_lock_s *p_accessorLock;
  CXParticipant *v4;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  v4 = self->_activeRemoteParticipant;
  os_unfair_lock_unlock(p_accessorLock);
  return v4;
}

- (void)setActiveRemoteParticipant:(id)a3
{
  CXParticipant *v4;
  CXParticipant *activeRemoteParticipant;

  v4 = (CXParticipant *)a3;
  os_unfair_lock_lock(&self->_accessorLock);
  *(_QWORD *)&self->_hasSet |= 2uLL;
  activeRemoteParticipant = self->_activeRemoteParticipant;
  self->_activeRemoteParticipant = v4;

  os_unfair_lock_unlock(&self->_accessorLock);
}

- (CXHandle)remoteHandle
{
  os_unfair_lock_s *p_accessorLock;
  CXHandle *v4;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  v4 = self->_remoteHandle;
  os_unfair_lock_unlock(p_accessorLock);
  return v4;
}

- (void)setRemoteHandle:(CXHandle *)remoteHandle
{
  CXHandle *v4;
  CXHandle *v5;

  v4 = remoteHandle;
  os_unfair_lock_lock(&self->_accessorLock);
  *(_QWORD *)&self->_hasSet |= 4uLL;
  v5 = self->_remoteHandle;
  self->_remoteHandle = v4;

  os_unfair_lock_unlock(&self->_accessorLock);
}

- (NSString)localizedCallerName
{
  os_unfair_lock_s *p_accessorLock;
  NSString *v4;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  v4 = self->_localizedCallerName;
  os_unfair_lock_unlock(p_accessorLock);
  return v4;
}

- (void)setLocalizedCallerName:(NSString *)localizedCallerName
{
  os_unfair_lock_s *p_accessorLock;
  NSString *v5;
  NSString *v6;
  NSString *v7;

  p_accessorLock = &self->_accessorLock;
  v5 = localizedCallerName;
  os_unfair_lock_lock(p_accessorLock);
  *(_QWORD *)&self->_hasSet |= 8uLL;
  v6 = (NSString *)-[NSString copy](v5, "copy");

  v7 = self->_localizedCallerName;
  self->_localizedCallerName = v6;

  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)emergency
{
  CXCallUpdate *v2;
  os_unfair_lock_s *p_accessorLock;

  v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_emergency;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setEmergency:(BOOL)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x20uLL;
  self->_emergency = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)failureExpected
{
  CXCallUpdate *v2;
  os_unfair_lock_s *p_accessorLock;

  v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_failureExpected;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setFailureExpected:(BOOL)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x40uLL;
  self->_failureExpected = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)supportsEmergencyFallback
{
  CXCallUpdate *v2;
  os_unfair_lock_s *p_accessorLock;

  v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_supportsEmergencyFallback;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setSupportsEmergencyFallback:(BOOL)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x80uLL;
  self->_supportsEmergencyFallback = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)usingBaseband
{
  CXCallUpdate *v2;
  os_unfair_lock_s *p_accessorLock;

  v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_usingBaseband;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setUsingBaseband:(BOOL)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x100uLL;
  self->_usingBaseband = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)blocked
{
  CXCallUpdate *v2;
  os_unfair_lock_s *p_accessorLock;

  v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_blocked;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setBlocked:(BOOL)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x200uLL;
  self->_blocked = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (int64_t)ttyType
{
  os_unfair_lock_s *p_accessorLock;
  int64_t ttyType;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  ttyType = self->_ttyType;
  os_unfair_lock_unlock(p_accessorLock);
  return ttyType;
}

- (void)setTTYType:(int64_t)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x400uLL;
  self->_ttyType = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (int64_t)bluetoothAudioFormat
{
  os_unfair_lock_s *p_accessorLock;
  int64_t bluetoothAudioFormat;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  bluetoothAudioFormat = self->_bluetoothAudioFormat;
  os_unfair_lock_unlock(p_accessorLock);
  return bluetoothAudioFormat;
}

- (void)setBluetoothAudioFormat:(int64_t)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x1000000000000000uLL;
  self->_bluetoothAudioFormat = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)mayRequireBreakBeforeMake
{
  CXCallUpdate *v2;
  os_unfair_lock_s *p_accessorLock;

  v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_mayRequireBreakBeforeMake;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setMayRequireBreakBeforeMake:(BOOL)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x1000uLL;
  self->_mayRequireBreakBeforeMake = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)hasVideo
{
  CXCallUpdate *v2;
  os_unfair_lock_s *p_accessorLock;

  v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_hasVideo;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setHasVideo:(BOOL)hasVideo
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x2000uLL;
  self->_hasVideo = hasVideo;
  os_unfair_lock_unlock(p_accessorLock);
}

- (NSString)audioCategory
{
  os_unfair_lock_s *p_accessorLock;
  NSString *v4;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  v4 = self->_audioCategory;
  os_unfair_lock_unlock(p_accessorLock);
  return v4;
}

- (void)setAudioCategory:(id)a3
{
  os_unfair_lock_s *p_accessorLock;
  id v5;
  NSString *v6;
  NSString *audioCategory;

  p_accessorLock = &self->_accessorLock;
  v5 = a3;
  os_unfair_lock_lock(p_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x4000uLL;
  v6 = (NSString *)objc_msgSend(v5, "copy");

  audioCategory = self->_audioCategory;
  self->_audioCategory = v6;

  os_unfair_lock_unlock(p_accessorLock);
}

- (NSString)audioMode
{
  os_unfair_lock_s *p_accessorLock;
  NSString *v4;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  v4 = self->_audioMode;
  os_unfair_lock_unlock(p_accessorLock);
  return v4;
}

- (void)setAudioMode:(id)a3
{
  os_unfair_lock_s *p_accessorLock;
  id v5;
  NSString *v6;
  NSString *audioMode;

  p_accessorLock = &self->_accessorLock;
  v5 = a3;
  os_unfair_lock_lock(p_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x8000uLL;
  v6 = (NSString *)objc_msgSend(v5, "copy");

  audioMode = self->_audioMode;
  self->_audioMode = v6;

  os_unfair_lock_unlock(p_accessorLock);
}

- (int64_t)audioInterruptionProvider
{
  os_unfair_lock_s *p_accessorLock;
  int64_t audioInterruptionProvider;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  audioInterruptionProvider = self->_audioInterruptionProvider;
  os_unfair_lock_unlock(p_accessorLock);
  return audioInterruptionProvider;
}

- (void)setAudioInterruptionProvider:(int64_t)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x10000uLL;
  self->_audioInterruptionProvider = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (int64_t)audioInterruptionOperationMode
{
  os_unfair_lock_s *p_accessorLock;
  int64_t audioInterruptionOperationMode;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  audioInterruptionOperationMode = self->_audioInterruptionOperationMode;
  os_unfair_lock_unlock(p_accessorLock);
  return audioInterruptionOperationMode;
}

- (void)setAudioInterruptionOperationMode:(int64_t)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x20000uLL;
  self->_audioInterruptionOperationMode = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (int64_t)verificationStatus
{
  os_unfair_lock_s *p_accessorLock;
  int64_t verificationStatus;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  verificationStatus = self->_verificationStatus;
  os_unfair_lock_unlock(p_accessorLock);
  return verificationStatus;
}

- (void)setVerificationStatus:(int64_t)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x40000uLL;
  self->_verificationStatus = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (int64_t)priority
{
  os_unfair_lock_s *p_accessorLock;
  int64_t priority;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  priority = self->_priority;
  os_unfair_lock_unlock(p_accessorLock);
  return priority;
}

- (void)setPriority:(int64_t)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x80000uLL;
  self->_priority = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)requiresInCallSounds
{
  CXCallUpdate *v2;
  os_unfair_lock_s *p_accessorLock;

  v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_requiresInCallSounds;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setRequiresInCallSounds:(BOOL)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x100000uLL;
  self->_requiresInCallSounds = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (int64_t)inCallSoundRegion
{
  os_unfair_lock_s *p_accessorLock;
  int64_t inCallSoundRegion;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  inCallSoundRegion = self->_inCallSoundRegion;
  os_unfair_lock_unlock(p_accessorLock);
  return inCallSoundRegion;
}

- (void)setInCallSoundRegion:(int64_t)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x200000uLL;
  self->_inCallSoundRegion = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)supportsHolding
{
  CXCallUpdate *v2;
  os_unfair_lock_s *p_accessorLock;

  v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_supportsHolding;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setSupportsHolding:(BOOL)supportsHolding
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x400000uLL;
  self->_supportsHolding = supportsHolding;
  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)supportsGrouping
{
  CXCallUpdate *v2;
  os_unfair_lock_s *p_accessorLock;

  v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_supportsGrouping;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setSupportsGrouping:(BOOL)supportsGrouping
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x800000uLL;
  self->_supportsGrouping = supportsGrouping;
  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)supportsUngrouping
{
  CXCallUpdate *v2;
  os_unfair_lock_s *p_accessorLock;

  v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_supportsUngrouping;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setSupportsUngrouping:(BOOL)supportsUngrouping
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x1000000uLL;
  self->_supportsUngrouping = supportsUngrouping;
  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)supportsDTMF
{
  CXCallUpdate *v2;
  os_unfair_lock_s *p_accessorLock;

  v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_supportsDTMF;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setSupportsDTMF:(BOOL)supportsDTMF
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x2000000uLL;
  self->_supportsDTMF = supportsDTMF;
  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)supportsDTMFUpdates
{
  CXCallUpdate *v2;
  os_unfair_lock_s *p_accessorLock;

  v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_supportsDTMFUpdates;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setSupportsDTMFUpdates:(BOOL)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x4000000uLL;
  self->_supportsDTMFUpdates = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)supportsUnambiguousMultiPartyState
{
  CXCallUpdate *v2;
  os_unfair_lock_s *p_accessorLock;

  v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_supportsUnambiguousMultiPartyState;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setSupportsUnambiguousMultiPartyState:(BOOL)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x8000000uLL;
  self->_supportsUnambiguousMultiPartyState = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)supportsAddCall
{
  CXCallUpdate *v2;
  os_unfair_lock_s *p_accessorLock;

  v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_supportsAddCall;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setSupportsAddCall:(BOOL)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x10000000uLL;
  self->_supportsAddCall = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)supportsSendingToVoicemail
{
  CXCallUpdate *v2;
  os_unfair_lock_s *p_accessorLock;

  v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_supportsSendingToVoicemail;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setSupportsSendingToVoicemail:(BOOL)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x20000000uLL;
  self->_supportsSendingToVoicemail = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)supportsRecording
{
  CXCallUpdate *v2;
  os_unfair_lock_s *p_accessorLock;

  v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_supportsRecording;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setSupportsRecording:(BOOL)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x40000000uLL;
  self->_supportsRecording = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)supportsScreening
{
  CXCallUpdate *v2;
  os_unfair_lock_s *p_accessorLock;

  v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_supportsScreening;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setSupportsScreening:(BOOL)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *((_WORD *)&self->_hasSet + 4) |= 0x200u;
  self->_supportsScreening = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (int64_t)videoStreamToken
{
  os_unfair_lock_s *p_accessorLock;
  int64_t videoStreamToken;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  videoStreamToken = self->_videoStreamToken;
  os_unfair_lock_unlock(p_accessorLock);
  return videoStreamToken;
}

- (void)setVideoStreamToken:(int64_t)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x80000000uLL;
  self->_videoStreamToken = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (CXCallTokens)callTokens
{
  os_unfair_lock_s *p_accessorLock;
  CXCallTokens *v4;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  v4 = self->_callTokens;
  os_unfair_lock_unlock(p_accessorLock);
  return v4;
}

- (void)setCallTokens:(id)a3
{
  CXCallTokens *v4;
  CXCallTokens *callTokens;

  v4 = (CXCallTokens *)a3;
  os_unfair_lock_lock(&self->_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x100000000uLL;
  callTokens = self->_callTokens;
  self->_callTokens = v4;

  os_unfair_lock_unlock(&self->_accessorLock);
}

- (NSString)announceProviderIdentifier
{
  os_unfair_lock_s *p_accessorLock;
  NSString *v4;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  v4 = self->_announceProviderIdentifier;
  os_unfair_lock_unlock(p_accessorLock);
  return v4;
}

- (void)setAnnounceProviderIdentifier:(id)a3
{
  os_unfair_lock_s *p_accessorLock;
  id v5;
  NSString *v6;
  NSString *announceProviderIdentifier;

  p_accessorLock = &self->_accessorLock;
  v5 = a3;
  os_unfair_lock_lock(p_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x200000000uLL;
  v6 = (NSString *)objc_msgSend(v5, "copy");

  announceProviderIdentifier = self->_announceProviderIdentifier;
  self->_announceProviderIdentifier = v6;

  os_unfair_lock_unlock(p_accessorLock);
}

- (NSString)crossDeviceIdentifier
{
  os_unfair_lock_s *p_accessorLock;
  NSString *v4;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  v4 = self->_crossDeviceIdentifier;
  os_unfair_lock_unlock(p_accessorLock);
  return v4;
}

- (void)setCrossDeviceIdentifier:(id)a3
{
  os_unfair_lock_s *p_accessorLock;
  id v5;
  NSString *v6;
  NSString *crossDeviceIdentifier;

  p_accessorLock = &self->_accessorLock;
  v5 = a3;
  os_unfair_lock_lock(p_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x400000000uLL;
  v6 = (NSString *)objc_msgSend(v5, "copy");

  crossDeviceIdentifier = self->_crossDeviceIdentifier;
  self->_crossDeviceIdentifier = v6;

  os_unfair_lock_unlock(p_accessorLock);
}

- (NSString)ISOCountryCode
{
  os_unfair_lock_s *p_accessorLock;
  NSString *v4;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  v4 = self->_ISOCountryCode;
  os_unfair_lock_unlock(p_accessorLock);
  return v4;
}

- (void)setISOCountryCode:(id)a3
{
  os_unfair_lock_s *p_accessorLock;
  id v5;
  NSString *v6;
  NSString *ISOCountryCode;

  p_accessorLock = &self->_accessorLock;
  v5 = a3;
  os_unfair_lock_lock(p_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x800000000uLL;
  v6 = (NSString *)objc_msgSend(v5, "copy");

  ISOCountryCode = self->_ISOCountryCode;
  self->_ISOCountryCode = v6;

  os_unfair_lock_unlock(p_accessorLock);
}

- (NSUUID)localSenderIdentityUUID
{
  os_unfair_lock_s *p_accessorLock;
  NSUUID *v4;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  v4 = self->_localSenderIdentityUUID;
  os_unfair_lock_unlock(p_accessorLock);
  return v4;
}

- (void)setLocalSenderIdentityUUID:(id)a3
{
  os_unfair_lock_s *p_accessorLock;
  id v5;
  NSUUID *v6;
  NSUUID *localSenderIdentityUUID;

  p_accessorLock = &self->_accessorLock;
  v5 = a3;
  os_unfair_lock_lock(p_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x1000000000uLL;
  v6 = (NSUUID *)objc_msgSend(v5, "copy");

  localSenderIdentityUUID = self->_localSenderIdentityUUID;
  self->_localSenderIdentityUUID = v6;

  os_unfair_lock_unlock(p_accessorLock);
}

- (NSUUID)localSenderIdentityAccountUUID
{
  os_unfair_lock_s *p_accessorLock;
  NSUUID *v4;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  v4 = self->_localSenderIdentityAccountUUID;
  os_unfair_lock_unlock(p_accessorLock);
  return v4;
}

- (void)setLocalSenderIdentityAccountUUID:(id)a3
{
  os_unfair_lock_s *p_accessorLock;
  id v5;
  NSUUID *v6;
  NSUUID *localSenderIdentityAccountUUID;

  p_accessorLock = &self->_accessorLock;
  v5 = a3;
  os_unfair_lock_lock(p_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x2000000000uLL;
  v6 = (NSUUID *)objc_msgSend(v5, "copy");

  localSenderIdentityAccountUUID = self->_localSenderIdentityAccountUUID;
  self->_localSenderIdentityAccountUUID = v6;

  os_unfair_lock_unlock(p_accessorLock);
}

- (NSString)localMemberHandleValue
{
  os_unfair_lock_s *p_accessorLock;
  NSString *v4;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  v4 = self->_localMemberHandleValue;
  os_unfair_lock_unlock(p_accessorLock);
  return v4;
}

- (void)setLocalMemberHandleValue:(id)a3
{
  os_unfair_lock_s *p_accessorLock;
  id v5;
  NSString *v6;
  NSString *localMemberHandleValue;

  p_accessorLock = &self->_accessorLock;
  v5 = a3;
  os_unfair_lock_lock(p_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x4000000000uLL;
  v6 = (NSString *)objc_msgSend(v5, "copy");

  localMemberHandleValue = self->_localMemberHandleValue;
  self->_localMemberHandleValue = v6;

  os_unfair_lock_unlock(p_accessorLock);
}

- (NSString)localSenderSubscriptionIdentifier
{
  os_unfair_lock_s *p_accessorLock;
  NSString *v4;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  v4 = self->_localSenderSubscriptionIdentifier;
  os_unfair_lock_unlock(p_accessorLock);
  return v4;
}

- (void)setLocalSenderSubscriptionIdentifier:(id)a3
{
  os_unfair_lock_s *p_accessorLock;
  id v5;
  NSString *v6;
  NSString *localSenderSubscriptionIdentifier;

  p_accessorLock = &self->_accessorLock;
  v5 = a3;
  os_unfair_lock_lock(p_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x8000000000uLL;
  v6 = (NSString *)objc_msgSend(v5, "copy");

  localSenderSubscriptionIdentifier = self->_localSenderSubscriptionIdentifier;
  self->_localSenderSubscriptionIdentifier = v6;

  os_unfair_lock_unlock(p_accessorLock);
}

- (NSUUID)participantGroupUUID
{
  os_unfair_lock_s *p_accessorLock;
  NSUUID *v4;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  v4 = self->_participantGroupUUID;
  os_unfair_lock_unlock(p_accessorLock);
  return v4;
}

- (void)setParticipantGroupUUID:(id)a3
{
  os_unfair_lock_s *p_accessorLock;
  id v5;
  NSUUID *v6;
  NSUUID *participantGroupUUID;

  p_accessorLock = &self->_accessorLock;
  v5 = a3;
  os_unfair_lock_lock(p_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x10000000000uLL;
  v6 = (NSUUID *)objc_msgSend(v5, "copy");

  participantGroupUUID = self->_participantGroupUUID;
  self->_participantGroupUUID = v6;

  os_unfair_lock_unlock(p_accessorLock);
}

- (NSSet)remoteParticipantHandles
{
  os_unfair_lock_s *p_accessorLock;
  NSSet *v4;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  v4 = self->_remoteParticipantHandles;
  os_unfair_lock_unlock(p_accessorLock);
  return v4;
}

- (void)setRemoteParticipantHandles:(id)a3
{
  os_unfair_lock_s *p_accessorLock;
  id v5;
  NSSet *v6;
  NSSet *remoteParticipantHandles;

  p_accessorLock = &self->_accessorLock;
  v5 = a3;
  os_unfair_lock_lock(p_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x20000000000uLL;
  v6 = (NSSet *)objc_msgSend(v5, "copy");

  remoteParticipantHandles = self->_remoteParticipantHandles;
  self->_remoteParticipantHandles = v6;

  os_unfair_lock_unlock(p_accessorLock);
}

- (NSSet)otherInvitedHandles
{
  os_unfair_lock_s *p_accessorLock;
  NSSet *v4;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  v4 = self->_otherInvitedHandles;
  os_unfair_lock_unlock(p_accessorLock);
  return v4;
}

- (void)setOtherInvitedHandles:(id)a3
{
  os_unfair_lock_s *p_accessorLock;
  id v5;
  NSSet *v6;
  NSSet *otherInvitedHandles;

  p_accessorLock = &self->_accessorLock;
  v5 = a3;
  os_unfair_lock_lock(p_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x40000000000uLL;
  v6 = (NSSet *)objc_msgSend(v5, "copy");

  otherInvitedHandles = self->_otherInvitedHandles;
  self->_otherInvitedHandles = v6;

  os_unfair_lock_unlock(p_accessorLock);
}

- (NSSet)activeRemoteParticipantHandles
{
  os_unfair_lock_s *p_accessorLock;
  NSSet *v4;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  v4 = self->_activeRemoteParticipantHandles;
  os_unfair_lock_unlock(p_accessorLock);
  return v4;
}

- (void)setActiveRemoteParticipantHandles:(id)a3
{
  os_unfair_lock_s *p_accessorLock;
  id v5;
  NSSet *v6;
  NSSet *activeRemoteParticipantHandles;

  p_accessorLock = &self->_accessorLock;
  v5 = a3;
  os_unfair_lock_lock(p_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x80000000000uLL;
  v6 = (NSSet *)objc_msgSend(v5, "copy");

  activeRemoteParticipantHandles = self->_activeRemoteParticipantHandles;
  self->_activeRemoteParticipantHandles = v6;

  os_unfair_lock_unlock(p_accessorLock);
}

- (CXHandoffContext)handoffContext
{
  os_unfair_lock_s *p_accessorLock;
  CXHandoffContext *v4;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  v4 = self->_handoffContext;
  os_unfair_lock_unlock(p_accessorLock);
  return v4;
}

- (void)setHandoffContext:(id)a3
{
  CXHandoffContext *v4;
  CXHandoffContext *handoffContext;

  v4 = (CXHandoffContext *)a3;
  os_unfair_lock_lock(&self->_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x100000000000uLL;
  handoffContext = self->_handoffContext;
  self->_handoffContext = v4;

  os_unfair_lock_unlock(&self->_accessorLock);
}

- (CXScreenShareAttributes)screenShareAttributes
{
  os_unfair_lock_s *p_accessorLock;
  CXScreenShareAttributes *v4;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  v4 = self->_screenShareAttributes;
  os_unfair_lock_unlock(p_accessorLock);
  return v4;
}

- (void)setScreenShareAttributes:(id)a3
{
  CXScreenShareAttributes *v4;
  CXScreenShareAttributes *screenShareAttributes;

  v4 = (CXScreenShareAttributes *)a3;
  os_unfair_lock_lock(&self->_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x200000000000uLL;
  screenShareAttributes = self->_screenShareAttributes;
  self->_screenShareAttributes = v4;

  os_unfair_lock_unlock(&self->_accessorLock);
}

- (int64_t)screenSharingIntention
{
  os_unfair_lock_s *p_accessorLock;
  int64_t screenSharingIntention;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  screenSharingIntention = self->_screenSharingIntention;
  os_unfair_lock_unlock(p_accessorLock);
  return screenSharingIntention;
}

- (void)setScreenSharingIntention:(int64_t)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *((_WORD *)&self->_hasSet + 4) |= 0x400u;
  self->_screenSharingIntention = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (NSDictionary)context
{
  os_unfair_lock_s *p_accessorLock;
  NSDictionary *v4;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  v4 = self->_context;
  os_unfair_lock_unlock(p_accessorLock);
  return v4;
}

- (void)setContext:(id)a3
{
  os_unfair_lock_s *p_accessorLock;
  id v5;
  NSDictionary *v6;
  NSDictionary *context;

  p_accessorLock = &self->_accessorLock;
  v5 = a3;
  os_unfair_lock_lock(p_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x400000000000uLL;
  v6 = (NSDictionary *)objc_msgSend(v5, "copy");

  context = self->_context;
  self->_context = v6;

  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)prefersExclusiveAccessToCellularNetwork
{
  CXCallUpdate *v2;
  os_unfair_lock_s *p_accessorLock;

  v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_prefersExclusiveAccessToCellularNetwork;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setPrefersExclusiveAccessToCellularNetwork:(BOOL)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x800000000000uLL;
  self->_prefersExclusiveAccessToCellularNetwork = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)supportsTTYWithVoice
{
  CXCallUpdate *v2;
  os_unfair_lock_s *p_accessorLock;

  v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_supportsTTYWithVoice;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setSupportsTTYWithVoice:(BOOL)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x800uLL;
  self->_supportsTTYWithVoice = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)remoteUplinkMuted
{
  CXCallUpdate *v2;
  os_unfair_lock_s *p_accessorLock;

  v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_remoteUplinkMuted;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setRemoteUplinkMuted:(BOOL)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x1000000000000uLL;
  self->_remoteUplinkMuted = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)shouldSuppressInCallUI
{
  CXCallUpdate *v2;
  os_unfair_lock_s *p_accessorLock;

  v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_shouldSuppressInCallUI;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setShouldSuppressInCallUI:(BOOL)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x2000000000000uLL;
  self->_shouldSuppressInCallUI = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)requiresAuthentication
{
  CXCallUpdate *v2;
  os_unfair_lock_s *p_accessorLock;

  v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_requiresAuthentication;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setRequiresAuthentication:(BOOL)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x4000000000000uLL;
  self->_requiresAuthentication = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)mutuallyExclusiveCall
{
  CXCallUpdate *v2;
  os_unfair_lock_s *p_accessorLock;

  v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_mutuallyExclusiveCall;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setMutuallyExclusiveCall:(BOOL)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x8000000000000uLL;
  self->_mutuallyExclusiveCall = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (int64_t)junkConfidence
{
  os_unfair_lock_s *p_accessorLock;
  int64_t junkConfidence;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  junkConfidence = self->_junkConfidence;
  os_unfair_lock_unlock(p_accessorLock);
  return junkConfidence;
}

- (void)setJunkConfidence:(int64_t)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x10000000000000uLL;
  self->_junkConfidence = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (int64_t)callSubType
{
  os_unfair_lock_s *p_accessorLock;
  int64_t callSubType;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  callSubType = self->_callSubType;
  os_unfair_lock_unlock(p_accessorLock);
  return callSubType;
}

- (void)setCallSubType:(int64_t)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *((_WORD *)&self->_hasSet + 4) |= 0x100u;
  self->_callSubType = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (int64_t)identificationCategory
{
  os_unfair_lock_s *p_accessorLock;
  int64_t identificationCategory;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  identificationCategory = self->_identificationCategory;
  os_unfair_lock_unlock(p_accessorLock);
  return identificationCategory;
}

- (void)setIdentificationCategory:(int64_t)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x20000000000000uLL;
  self->_identificationCategory = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)conversation
{
  CXCallUpdate *v2;
  os_unfair_lock_s *p_accessorLock;

  v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_conversation;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setConversation:(BOOL)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x40000000000000uLL;
  self->_conversation = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)mixesVoiceWithMedia
{
  CXCallUpdate *v2;
  os_unfair_lock_s *p_accessorLock;

  v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_mixesVoiceWithMedia;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setMixesVoiceWithMedia:(BOOL)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x80000000000000uLL;
  self->_mixesVoiceWithMedia = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)prefersToPlayDuringWombat
{
  CXCallUpdate *v2;
  os_unfair_lock_s *p_accessorLock;

  v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_prefersToPlayDuringWombat;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setPrefersToPlayDuringWombat:(BOOL)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x100000000000000uLL;
  self->_prefersToPlayDuringWombat = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)mediaPlaybackOnExternalDevice
{
  CXCallUpdate *v2;
  os_unfair_lock_s *p_accessorLock;

  v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_mediaPlaybackOnExternalDevice;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setMediaPlaybackOnExternalDevice:(BOOL)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x200000000000000uLL;
  self->_mediaPlaybackOnExternalDevice = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)oneToOneModeEnabled
{
  CXCallUpdate *v2;
  os_unfair_lock_s *p_accessorLock;

  v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_oneToOneModeEnabled;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setOneToOneModeEnabled:(BOOL)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x400000000000000uLL;
  self->_oneToOneModeEnabled = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)sharingScreen
{
  CXCallUpdate *v2;
  os_unfair_lock_s *p_accessorLock;

  v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_sharingScreen;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setSharingScreen:(BOOL)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x800000000000000uLL;
  self->_sharingScreen = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)ignoresBluetoothDeviceUID
{
  CXCallUpdate *v2;
  os_unfair_lock_s *p_accessorLock;

  v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_ignoresBluetoothDeviceUID;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setIgnoresBluetoothDeviceUID:(BOOL)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x2000000000000000uLL;
  self->_ignoresBluetoothDeviceUID = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (int64_t)serviceStatus
{
  os_unfair_lock_s *p_accessorLock;
  int64_t serviceStatus;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  serviceStatus = self->_serviceStatus;
  os_unfair_lock_unlock(p_accessorLock);
  return serviceStatus;
}

- (void)setServiceStatus:(int64_t)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x4000000000000000uLL;
  self->_serviceStatus = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (int64_t)transmissionMode
{
  os_unfair_lock_s *p_accessorLock;
  int64_t transmissionMode;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  transmissionMode = self->_transmissionMode;
  os_unfair_lock_unlock(p_accessorLock);
  return transmissionMode;
}

- (void)setTransmissionMode:(int64_t)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *(_QWORD *)&self->_hasSet |= 0x8000000000000000;
  self->_transmissionMode = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)accessoryButtonEventsEnabled
{
  CXCallUpdate *v2;
  os_unfair_lock_s *p_accessorLock;

  v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_accessoryButtonEventsEnabled;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setAccessoryButtonEventsEnabled:(BOOL)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *((_WORD *)&self->_hasSet + 4) |= 1u;
  self->_accessoryButtonEventsEnabled = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)sendingVideo
{
  CXCallUpdate *v2;
  os_unfair_lock_s *p_accessorLock;

  v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_sendingVideo;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setSendingVideo:(BOOL)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *((_WORD *)&self->_hasSet + 4) |= 2u;
  self->_sendingVideo = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)isReRing
{
  CXCallUpdate *v2;
  os_unfair_lock_s *p_accessorLock;

  v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_isReRing;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setIsReRing:(BOOL)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *((_WORD *)&self->_hasSet + 4) |= 0x40u;
  self->_isReRing = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)suppressRingtone
{
  CXCallUpdate *v2;
  os_unfair_lock_s *p_accessorLock;

  v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_suppressRingtone;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setSuppressRingtone:(BOOL)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *((_WORD *)&self->_hasSet + 4) |= 0x80u;
  self->_suppressRingtone = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)hasBeenRedirected
{
  CXCallUpdate *v2;
  os_unfair_lock_s *p_accessorLock;

  v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_hasBeenRedirected;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setHasBeenRedirected:(BOOL)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *((_WORD *)&self->_hasSet + 4) |= 4u;
  self->_hasBeenRedirected = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (BOOL)isKnownCaller
{
  CXCallUpdate *v2;
  os_unfair_lock_s *p_accessorLock;

  v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_isKnownCaller;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setIsKnownCaller:(BOOL)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *((_WORD *)&self->_hasSet + 4) |= 8u;
  self->_isKnownCaller = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (int)filteredOutReason
{
  CXCallUpdate *v2;
  os_unfair_lock_s *p_accessorLock;

  v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LODWORD(v2) = v2->_filteredOutReason;
  os_unfair_lock_unlock(p_accessorLock);
  return (int)v2;
}

- (void)setFilteredOutReason:(int)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *((_WORD *)&self->_hasSet + 4) |= 0x10u;
  self->_filteredOutReason = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (int64_t)screenSharingType
{
  os_unfair_lock_s *p_accessorLock;
  int64_t screenSharingType;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  screenSharingType = self->_screenSharingType;
  os_unfair_lock_unlock(p_accessorLock);
  return screenSharingType;
}

- (void)setScreenSharingType:(int64_t)a3
{
  os_unfair_lock_s *p_accessorLock;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  *((_WORD *)&self->_hasSet + 4) |= 0x800u;
  self->_screenSharingType = a3;
  os_unfair_lock_unlock(p_accessorLock);
}

- (CXCallUpdate)updateWithUpdate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int16 v11;
  __int16 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int16 v28;
  char v29;
  char v30;
  char v31;
  char v32;
  char v33;
  char v34;
  char v35;
  char v36;
  void *v37;
  __int16 v38;
  CXCallUpdate *result;
  id v40;

  v40 = a3;
  if ((objc_msgSend(v40, "hasSet") & 1) != 0)
  {
    objc_msgSend(v40, "account");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CXCallUpdate setAccount:](self, "setAccount:", v4);

  }
  if ((objc_msgSend(v40, "hasSet") & 2) != 0)
  {
    objc_msgSend(v40, "activeRemoteParticipant");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CXCallUpdate setActiveRemoteParticipant:](self, "setActiveRemoteParticipant:", v5);

  }
  if ((objc_msgSend(v40, "hasSet") & 4) != 0)
  {
    objc_msgSend(v40, "remoteHandle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CXCallUpdate setRemoteHandle:](self, "setRemoteHandle:", v6);

  }
  if ((objc_msgSend(v40, "hasSet") & 8) != 0)
  {
    objc_msgSend(v40, "localizedCallerName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CXCallUpdate setLocalizedCallerName:](self, "setLocalizedCallerName:", v7);

  }
  if ((objc_msgSend(v40, "hasSet") & 0x10) != 0)
  {
    objc_msgSend(v40, "localizedCallerImageURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CXCallUpdate setLocalizedCallerImageURL:](self, "setLocalizedCallerImageURL:", v8);

  }
  if ((objc_msgSend(v40, "hasSet") & 0x20) != 0)
    -[CXCallUpdate setEmergency:](self, "setEmergency:", objc_msgSend(v40, "isEmergency"));
  if ((objc_msgSend(v40, "hasSet") & 0x40) != 0)
    -[CXCallUpdate setFailureExpected:](self, "setFailureExpected:", objc_msgSend(v40, "isFailureExpected"));
  if ((objc_msgSend(v40, "hasSet") & 0x80) != 0)
    -[CXCallUpdate setSupportsEmergencyFallback:](self, "setSupportsEmergencyFallback:", objc_msgSend(v40, "supportsEmergencyFallback"));
  if ((objc_msgSend(v40, "hasSet") & 0x100) != 0)
    -[CXCallUpdate setUsingBaseband:](self, "setUsingBaseband:", objc_msgSend(v40, "isUsingBaseband"));
  if ((objc_msgSend(v40, "hasSet") & 0x200) != 0)
    -[CXCallUpdate setBlocked:](self, "setBlocked:", objc_msgSend(v40, "isBlocked"));
  if ((objc_msgSend(v40, "hasSet") & 0x400) != 0)
    -[CXCallUpdate setTTYType:](self, "setTTYType:", objc_msgSend(v40, "ttyType"));
  if ((objc_msgSend(v40, "hasSet") & 0x1000000000000000) != 0)
    -[CXCallUpdate setBluetoothAudioFormat:](self, "setBluetoothAudioFormat:", objc_msgSend(v40, "bluetoothAudioFormat"));
  if ((objc_msgSend(v40, "hasSet") & 0x1000) != 0)
    -[CXCallUpdate setMayRequireBreakBeforeMake:](self, "setMayRequireBreakBeforeMake:", objc_msgSend(v40, "mayRequireBreakBeforeMake"));
  if ((objc_msgSend(v40, "hasSet") & 0x2000) != 0)
    -[CXCallUpdate setHasVideo:](self, "setHasVideo:", objc_msgSend(v40, "hasVideo"));
  if ((objc_msgSend(v40, "hasSet") & 0x4000) != 0)
  {
    objc_msgSend(v40, "audioCategory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CXCallUpdate setAudioCategory:](self, "setAudioCategory:", v9);

  }
  if ((objc_msgSend(v40, "hasSet") & 0x8000) != 0)
  {
    objc_msgSend(v40, "audioMode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CXCallUpdate setAudioMode:](self, "setAudioMode:", v10);

  }
  if ((objc_msgSend(v40, "hasSet") & 0x10000) != 0)
    -[CXCallUpdate setAudioInterruptionProvider:](self, "setAudioInterruptionProvider:", objc_msgSend(v40, "audioInterruptionProvider"));
  if ((objc_msgSend(v40, "hasSet") & 0x20000) != 0)
    -[CXCallUpdate setAudioInterruptionOperationMode:](self, "setAudioInterruptionOperationMode:", objc_msgSend(v40, "audioInterruptionOperationMode"));
  if ((objc_msgSend(v40, "hasSet") & 0x40000) != 0)
    -[CXCallUpdate setVerificationStatus:](self, "setVerificationStatus:", objc_msgSend(v40, "verificationStatus"));
  if ((objc_msgSend(v40, "hasSet") & 0x80000) != 0)
    -[CXCallUpdate setPriority:](self, "setPriority:", objc_msgSend(v40, "priority"));
  if ((objc_msgSend(v40, "hasSet") & 0x100000) != 0)
    -[CXCallUpdate setRequiresInCallSounds:](self, "setRequiresInCallSounds:", objc_msgSend(v40, "requiresInCallSounds"));
  if ((objc_msgSend(v40, "hasSet") & 0x200000) != 0)
    -[CXCallUpdate setInCallSoundRegion:](self, "setInCallSoundRegion:", objc_msgSend(v40, "inCallSoundRegion"));
  if ((objc_msgSend(v40, "hasSet") & 0x400000) != 0)
    -[CXCallUpdate setSupportsHolding:](self, "setSupportsHolding:", objc_msgSend(v40, "supportsHolding"));
  if ((objc_msgSend(v40, "hasSet") & 0x800000) != 0)
    -[CXCallUpdate setSupportsGrouping:](self, "setSupportsGrouping:", objc_msgSend(v40, "supportsGrouping"));
  if ((objc_msgSend(v40, "hasSet") & 0x1000000) != 0)
    -[CXCallUpdate setSupportsUngrouping:](self, "setSupportsUngrouping:", objc_msgSend(v40, "supportsUngrouping"));
  if ((objc_msgSend(v40, "hasSet") & 0x2000000) != 0)
    -[CXCallUpdate setSupportsDTMF:](self, "setSupportsDTMF:", objc_msgSend(v40, "supportsDTMF"));
  if ((objc_msgSend(v40, "hasSet") & 0x4000000) != 0)
    -[CXCallUpdate setSupportsDTMFUpdates:](self, "setSupportsDTMFUpdates:", objc_msgSend(v40, "supportsDTMFUpdates"));
  if ((objc_msgSend(v40, "hasSet") & 0x8000000) != 0)
    -[CXCallUpdate setSupportsUnambiguousMultiPartyState:](self, "setSupportsUnambiguousMultiPartyState:", objc_msgSend(v40, "supportsUnambiguousMultiPartyState"));
  if ((objc_msgSend(v40, "hasSet") & 0x10000000) != 0)
    -[CXCallUpdate setSupportsAddCall:](self, "setSupportsAddCall:", objc_msgSend(v40, "supportsAddCall"));
  if ((objc_msgSend(v40, "hasSet") & 0x20000000) != 0)
    -[CXCallUpdate setSupportsSendingToVoicemail:](self, "setSupportsSendingToVoicemail:", objc_msgSend(v40, "supportsSendingToVoicemail"));
  objc_msgSend(v40, "hasSet");
  if ((v11 & 0x400) != 0)
    -[CXCallUpdate setScreenSharingIntention:](self, "setScreenSharingIntention:", objc_msgSend(v40, "screenSharingIntention"));
  if ((objc_msgSend(v40, "hasSet") & 0x40000000) != 0)
    -[CXCallUpdate setSupportsRecording:](self, "setSupportsRecording:", objc_msgSend(v40, "supportsRecording"));
  objc_msgSend(v40, "hasSet");
  if ((v12 & 0x200) != 0)
    -[CXCallUpdate setSupportsScreening:](self, "setSupportsScreening:", objc_msgSend(v40, "supportsScreening"));
  if ((objc_msgSend(v40, "hasSet") & 0x80000000) != 0)
    -[CXCallUpdate setVideoStreamToken:](self, "setVideoStreamToken:", objc_msgSend(v40, "videoStreamToken"));
  if ((objc_msgSend(v40, "hasSet") & 0x100000000) != 0)
  {
    objc_msgSend(v40, "callTokens");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CXCallUpdate setCallTokens:](self, "setCallTokens:", v13);

  }
  if ((objc_msgSend(v40, "hasSet") & 0x200000000) != 0)
  {
    objc_msgSend(v40, "announceProviderIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CXCallUpdate setAnnounceProviderIdentifier:](self, "setAnnounceProviderIdentifier:", v14);

  }
  if ((objc_msgSend(v40, "hasSet") & 0x400000000) != 0)
  {
    objc_msgSend(v40, "crossDeviceIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CXCallUpdate setCrossDeviceIdentifier:](self, "setCrossDeviceIdentifier:", v15);

  }
  if ((objc_msgSend(v40, "hasSet") & 0x800000000) != 0)
  {
    objc_msgSend(v40, "ISOCountryCode");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CXCallUpdate setISOCountryCode:](self, "setISOCountryCode:", v16);

  }
  if ((objc_msgSend(v40, "hasSet") & 0x1000000000) != 0)
  {
    objc_msgSend(v40, "localSenderIdentityUUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CXCallUpdate setLocalSenderIdentityUUID:](self, "setLocalSenderIdentityUUID:", v17);

  }
  if ((objc_msgSend(v40, "hasSet") & 0x2000000000) != 0)
  {
    objc_msgSend(v40, "localSenderIdentityAccountUUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CXCallUpdate setLocalSenderIdentityAccountUUID:](self, "setLocalSenderIdentityAccountUUID:", v18);

  }
  if ((objc_msgSend(v40, "hasSet") & 0x4000000000) != 0)
  {
    objc_msgSend(v40, "localMemberHandleValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CXCallUpdate setLocalMemberHandleValue:](self, "setLocalMemberHandleValue:", v19);

  }
  if ((objc_msgSend(v40, "hasSet") & 0x8000000000) != 0)
  {
    objc_msgSend(v40, "localSenderSubscriptionIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CXCallUpdate setLocalSenderSubscriptionIdentifier:](self, "setLocalSenderSubscriptionIdentifier:", v20);

  }
  if ((objc_msgSend(v40, "hasSet") & 0x10000000000) != 0)
  {
    objc_msgSend(v40, "participantGroupUUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CXCallUpdate setParticipantGroupUUID:](self, "setParticipantGroupUUID:", v21);

  }
  if ((objc_msgSend(v40, "hasSet") & 0x20000000000) != 0)
  {
    objc_msgSend(v40, "remoteParticipantHandles");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CXCallUpdate setRemoteParticipantHandles:](self, "setRemoteParticipantHandles:", v22);

  }
  if ((objc_msgSend(v40, "hasSet") & 0x40000000000) != 0)
  {
    objc_msgSend(v40, "otherInvitedHandles");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CXCallUpdate setOtherInvitedHandles:](self, "setOtherInvitedHandles:", v23);

  }
  if ((objc_msgSend(v40, "hasSet") & 0x80000000000) != 0)
  {
    objc_msgSend(v40, "activeRemoteParticipantHandles");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CXCallUpdate setActiveRemoteParticipantHandles:](self, "setActiveRemoteParticipantHandles:", v24);

  }
  if ((objc_msgSend(v40, "hasSet") & 0x100000000000) != 0)
  {
    objc_msgSend(v40, "handoffContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CXCallUpdate setHandoffContext:](self, "setHandoffContext:", v25);

  }
  if ((objc_msgSend(v40, "hasSet") & 0x200000000000) != 0)
  {
    objc_msgSend(v40, "screenShareAttributes");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CXCallUpdate setScreenShareAttributes:](self, "setScreenShareAttributes:", v26);

  }
  if ((objc_msgSend(v40, "hasSet") & 0x400000000000) != 0)
  {
    objc_msgSend(v40, "context");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CXCallUpdate setContext:](self, "setContext:", v27);

  }
  if ((objc_msgSend(v40, "hasSet") & 0x800000000000) != 0)
    -[CXCallUpdate setPrefersExclusiveAccessToCellularNetwork:](self, "setPrefersExclusiveAccessToCellularNetwork:", objc_msgSend(v40, "prefersExclusiveAccessToCellularNetwork"));
  if ((objc_msgSend(v40, "hasSet") & 0x800) != 0)
    -[CXCallUpdate setSupportsTTYWithVoice:](self, "setSupportsTTYWithVoice:", objc_msgSend(v40, "supportsTTYWithVoice"));
  if ((objc_msgSend(v40, "hasSet") & 0x1000000000000) != 0)
    -[CXCallUpdate setRemoteUplinkMuted:](self, "setRemoteUplinkMuted:", objc_msgSend(v40, "isRemoteUplinkMuted"));
  if ((objc_msgSend(v40, "hasSet") & 0x2000000000000) != 0)
    -[CXCallUpdate setShouldSuppressInCallUI:](self, "setShouldSuppressInCallUI:", objc_msgSend(v40, "shouldSuppressInCallUI"));
  if ((objc_msgSend(v40, "hasSet") & 0x4000000000000) != 0)
    -[CXCallUpdate setRequiresAuthentication:](self, "setRequiresAuthentication:", objc_msgSend(v40, "requiresAuthentication"));
  if ((objc_msgSend(v40, "hasSet") & 0x8000000000000) != 0)
    -[CXCallUpdate setMutuallyExclusiveCall:](self, "setMutuallyExclusiveCall:", objc_msgSend(v40, "isMutuallyExclusiveCall"));
  if ((objc_msgSend(v40, "hasSet") & 0x10000000000000) != 0)
    -[CXCallUpdate setJunkConfidence:](self, "setJunkConfidence:", objc_msgSend(v40, "junkConfidence"));
  objc_msgSend(v40, "hasSet");
  if ((v28 & 0x100) != 0)
    -[CXCallUpdate setCallSubType:](self, "setCallSubType:", objc_msgSend(v40, "callSubType"));
  if ((objc_msgSend(v40, "hasSet") & 0x20000000000000) != 0)
    -[CXCallUpdate setIdentificationCategory:](self, "setIdentificationCategory:", objc_msgSend(v40, "identificationCategory"));
  if ((objc_msgSend(v40, "hasSet") & 0x40000000000000) != 0)
    -[CXCallUpdate setConversation:](self, "setConversation:", objc_msgSend(v40, "isConversation"));
  if ((objc_msgSend(v40, "hasSet") & 0x80000000000000) != 0)
    -[CXCallUpdate setMixesVoiceWithMedia:](self, "setMixesVoiceWithMedia:", objc_msgSend(v40, "mixesVoiceWithMedia"));
  if ((objc_msgSend(v40, "hasSet") & 0x100000000000000) != 0)
    -[CXCallUpdate setPrefersToPlayDuringWombat:](self, "setPrefersToPlayDuringWombat:", objc_msgSend(v40, "prefersToPlayDuringWombat"));
  if ((objc_msgSend(v40, "hasSet") & 0x200000000000000) != 0)
    -[CXCallUpdate setMediaPlaybackOnExternalDevice:](self, "setMediaPlaybackOnExternalDevice:", objc_msgSend(v40, "mediaPlaybackOnExternalDevice"));
  if ((objc_msgSend(v40, "hasSet") & 0x2000000000000000) != 0)
    -[CXCallUpdate setIgnoresBluetoothDeviceUID:](self, "setIgnoresBluetoothDeviceUID:", objc_msgSend(v40, "ignoresBluetoothDeviceUID"));
  if ((objc_msgSend(v40, "hasSet") & 0x800000000000000) != 0)
    -[CXCallUpdate setSharingScreen:](self, "setSharingScreen:", objc_msgSend(v40, "isSharingScreen"));
  if ((objc_msgSend(v40, "hasSet") & 0x400000000000000) != 0)
    -[CXCallUpdate setOneToOneModeEnabled:](self, "setOneToOneModeEnabled:", objc_msgSend(v40, "isOneToOneModeEnabled"));
  if ((objc_msgSend(v40, "hasSet") & 0x4000000000000000) != 0)
    -[CXCallUpdate setServiceStatus:](self, "setServiceStatus:", objc_msgSend(v40, "serviceStatus"));
  if (objc_msgSend(v40, "hasSet") < 0)
    -[CXCallUpdate setTransmissionMode:](self, "setTransmissionMode:", objc_msgSend(v40, "transmissionMode"));
  objc_msgSend(v40, "hasSet");
  if ((v29 & 1) != 0)
    -[CXCallUpdate setAccessoryButtonEventsEnabled:](self, "setAccessoryButtonEventsEnabled:", objc_msgSend(v40, "accessoryButtonEventsEnabled"));
  objc_msgSend(v40, "hasSet");
  if ((v30 & 2) != 0)
    -[CXCallUpdate setSendingVideo:](self, "setSendingVideo:", objc_msgSend(v40, "isSendingVideo"));
  objc_msgSend(v40, "hasSet");
  if ((v31 & 0x40) != 0)
    -[CXCallUpdate setIsReRing:](self, "setIsReRing:", objc_msgSend(v40, "isReRing"));
  objc_msgSend(v40, "hasSet");
  if (v32 < 0)
    -[CXCallUpdate setSuppressRingtone:](self, "setSuppressRingtone:", objc_msgSend(v40, "suppressRingtone"));
  objc_msgSend(v40, "hasSet");
  if ((v33 & 4) != 0)
    -[CXCallUpdate setHasBeenRedirected:](self, "setHasBeenRedirected:", objc_msgSend(v40, "hasBeenRedirected"));
  objc_msgSend(v40, "hasSet");
  if ((v34 & 8) != 0)
    -[CXCallUpdate setIsKnownCaller:](self, "setIsKnownCaller:", objc_msgSend(v40, "isKnownCaller"));
  objc_msgSend(v40, "hasSet");
  if ((v35 & 0x10) != 0)
    -[CXCallUpdate setFilteredOutReason:](self, "setFilteredOutReason:", objc_msgSend(v40, "filteredOutReason"));
  objc_msgSend(v40, "hasSet");
  if ((v36 & 0x20) != 0)
  {
    objc_msgSend(v40, "silencingUserInfo");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[CXCallUpdate setSilencingUserInfo:](self, "setSilencingUserInfo:", v37);

  }
  objc_msgSend(v40, "hasSet");
  if ((v38 & 0x800) != 0)
    -[CXCallUpdate setScreenSharingType:](self, "setScreenSharingType:", objc_msgSend(v40, "screenSharingType"));

  return result;
}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;

  v14 = a3;
  -[CXCallUpdate UUID](self, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a4);
  objc_msgSend(v14, "setUUID:", v7);

  if ((-[CXCallUpdate hasSet](self, "hasSet") & 4) != 0)
  {
    v14[46] |= 4uLL;
    -[CXCallUpdate remoteHandle](self, "remoteHandle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copyWithZone:", a4);
    objc_msgSend(v14, "setRemoteHandle:", v9);

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x20000000000) != 0)
  {
    v14[46] |= 0x20000000000uLL;
    -[CXCallUpdate remoteParticipantHandles](self, "remoteParticipantHandles");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copyWithZone:", a4);
    objc_msgSend(v14, "setRemoteParticipantHandles:", v11);

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 8) != 0)
  {
    v14[46] |= 8uLL;
    -[CXCallUpdate localizedCallerName](self, "localizedCallerName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copyWithZone:", a4);
    objc_msgSend(v14, "setLocalizedCallerName:", v13);

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x400000) != 0)
  {
    v14[46] |= 0x400000uLL;
    objc_msgSend(v14, "setSupportsHolding:", -[CXCallUpdate supportsHolding](self, "supportsHolding"));
  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x800000) != 0)
  {
    v14[46] |= 0x800000uLL;
    objc_msgSend(v14, "setSupportsGrouping:", -[CXCallUpdate supportsGrouping](self, "supportsGrouping"));
  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x1000000) != 0)
  {
    v14[46] |= 0x1000000uLL;
    objc_msgSend(v14, "setSupportsUngrouping:", -[CXCallUpdate supportsUngrouping](self, "supportsUngrouping"));
  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x2000000) != 0)
  {
    v14[46] |= 0x2000000uLL;
    objc_msgSend(v14, "setSupportsDTMF:", -[CXCallUpdate supportsDTMF](self, "supportsDTMF"));
  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x4000000) != 0)
  {
    v14[46] |= 0x4000000uLL;
    objc_msgSend(v14, "setSupportsDTMFUpdates:", -[CXCallUpdate supportsDTMFUpdates](self, "supportsDTMFUpdates"));
  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x2000) != 0)
  {
    v14[46] |= 0x2000uLL;
    objc_msgSend(v14, "setHasVideo:", -[CXCallUpdate hasVideo](self, "hasVideo"));
  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x4000000000000) != 0)
  {
    v14[46] |= 0x4000000000000uLL;
    objc_msgSend(v14, "setRequiresAuthentication:", -[CXCallUpdate requiresAuthentication](self, "requiresAuthentication"));
  }

}

- (id)sanitizedCopy
{
  return -[CXCallUpdate sanitizedCopyWithZone:](self, "sanitizedCopyWithZone:", 0);
}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  void *v5;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CXCallUpdate updateSanitizedCopy:withZone:](self, "updateSanitizedCopy:withZone:", v5, a3);
  return v5;
}

- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int16 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  __int16 v42;
  char v43;
  char v44;
  char v45;
  char v46;
  char v47;
  char v48;
  char v49;
  char v50;
  void *v51;
  __int16 v52;
  __int16 v53;
  _QWORD *v54;

  v54 = a3;
  -[CXCallUpdate updateSanitizedCopy:withZone:](self, "updateSanitizedCopy:withZone:");
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 1) != 0)
  {
    v54[46] |= 1uLL;
    -[CXCallUpdate account](self, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setAccount:", v6);

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 2) != 0)
  {
    v54[46] |= 2uLL;
    -[CXCallUpdate activeRemoteParticipant](self, "activeRemoteParticipant");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setActiveRemoteParticipant:", v7);

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x20) != 0)
  {
    v54[46] |= 0x20uLL;
    objc_msgSend(v54, "setEmergency:", -[CXCallUpdate isEmergency](self, "isEmergency"));
  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x40) != 0)
  {
    v54[46] |= 0x40uLL;
    objc_msgSend(v54, "setFailureExpected:", -[CXCallUpdate isFailureExpected](self, "isFailureExpected"));
  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x80) != 0)
  {
    v54[46] |= 0x80uLL;
    objc_msgSend(v54, "setSupportsEmergencyFallback:", -[CXCallUpdate supportsEmergencyFallback](self, "supportsEmergencyFallback"));
  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x100) != 0)
  {
    v54[46] |= 0x100uLL;
    objc_msgSend(v54, "setUsingBaseband:", -[CXCallUpdate isUsingBaseband](self, "isUsingBaseband"));
  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x200) != 0)
  {
    v54[46] |= 0x200uLL;
    objc_msgSend(v54, "setBlocked:", -[CXCallUpdate isBlocked](self, "isBlocked"));
  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x400) != 0)
  {
    v54[46] |= 0x400uLL;
    objc_msgSend(v54, "setTTYType:", -[CXCallUpdate ttyType](self, "ttyType"));
  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x1000000000000000) != 0)
  {
    v54[46] |= 0x1000000000000000uLL;
    objc_msgSend(v54, "setBluetoothAudioFormat:", -[CXCallUpdate bluetoothAudioFormat](self, "bluetoothAudioFormat"));
  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x1000) != 0)
  {
    v54[46] |= 0x1000uLL;
    objc_msgSend(v54, "setMayRequireBreakBeforeMake:", -[CXCallUpdate mayRequireBreakBeforeMake](self, "mayRequireBreakBeforeMake"));
  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x4000) != 0)
  {
    v54[46] |= 0x4000uLL;
    -[CXCallUpdate audioCategory](self, "audioCategory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copyWithZone:", a4);
    objc_msgSend(v54, "setAudioCategory:", v9);

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x8000) != 0)
  {
    v54[46] |= 0x8000uLL;
    -[CXCallUpdate audioMode](self, "audioMode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copyWithZone:", a4);
    objc_msgSend(v54, "setAudioMode:", v11);

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x10000) != 0)
  {
    v54[46] |= 0x10000uLL;
    objc_msgSend(v54, "setAudioInterruptionProvider:", -[CXCallUpdate audioInterruptionProvider](self, "audioInterruptionProvider"));
  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x20000) != 0)
  {
    v54[46] |= 0x20000uLL;
    objc_msgSend(v54, "setAudioInterruptionOperationMode:", -[CXCallUpdate audioInterruptionOperationMode](self, "audioInterruptionOperationMode"));
  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x40000) != 0)
  {
    v54[46] |= 0x40000uLL;
    objc_msgSend(v54, "setVerificationStatus:", -[CXCallUpdate verificationStatus](self, "verificationStatus"));
  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x80000) != 0)
  {
    v54[46] |= 0x80000uLL;
    objc_msgSend(v54, "setPriority:", -[CXCallUpdate priority](self, "priority"));
  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x100000) != 0)
  {
    v54[46] |= 0x100000uLL;
    objc_msgSend(v54, "setRequiresInCallSounds:", -[CXCallUpdate requiresInCallSounds](self, "requiresInCallSounds"));
  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x200000) != 0)
  {
    v54[46] |= 0x200000uLL;
    objc_msgSend(v54, "setInCallSoundRegion:", -[CXCallUpdate inCallSoundRegion](self, "inCallSoundRegion"));
  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x8000000) != 0)
  {
    v54[46] |= 0x8000000uLL;
    objc_msgSend(v54, "setSupportsUnambiguousMultiPartyState:", -[CXCallUpdate supportsUnambiguousMultiPartyState](self, "supportsUnambiguousMultiPartyState"));
  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x10000000) != 0)
  {
    v54[46] |= 0x10000000uLL;
    objc_msgSend(v54, "setSupportsAddCall:", -[CXCallUpdate supportsAddCall](self, "supportsAddCall"));
  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x20000000) != 0)
  {
    v54[46] |= 0x20000000uLL;
    objc_msgSend(v54, "setSupportsSendingToVoicemail:", -[CXCallUpdate supportsSendingToVoicemail](self, "supportsSendingToVoicemail"));
  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x40000000) != 0)
  {
    v54[46] |= 0x40000000uLL;
    objc_msgSend(v54, "setSupportsRecording:", -[CXCallUpdate supportsRecording](self, "supportsRecording"));
  }
  -[CXCallUpdate hasSet](self, "hasSet");
  if ((v12 & 0x200) != 0)
  {
    *((_WORD *)v54 + 188) |= 0x200u;
    objc_msgSend(v54, "setSupportsScreening:", -[CXCallUpdate supportsScreening](self, "supportsScreening"));
  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x80000000) != 0)
  {
    v54[46] |= 0x80000000uLL;
    objc_msgSend(v54, "setVideoStreamToken:", -[CXCallUpdate videoStreamToken](self, "videoStreamToken"));
  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x100000000) != 0)
  {
    v54[46] |= 0x100000000uLL;
    -[CXCallUpdate callTokens](self, "callTokens");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setCallTokens:", v13);

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x200000000) != 0)
  {
    v54[46] |= 0x200000000uLL;
    -[CXCallUpdate announceProviderIdentifier](self, "announceProviderIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copyWithZone:", a4);
    objc_msgSend(v54, "setAnnounceProviderIdentifier:", v15);

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x400000000) != 0)
  {
    v54[46] |= 0x400000000uLL;
    -[CXCallUpdate crossDeviceIdentifier](self, "crossDeviceIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copyWithZone:", a4);
    objc_msgSend(v54, "setCrossDeviceIdentifier:", v17);

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x800000000) != 0)
  {
    v54[46] |= 0x800000000uLL;
    -[CXCallUpdate ISOCountryCode](self, "ISOCountryCode");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "copyWithZone:", a4);
    objc_msgSend(v54, "setISOCountryCode:", v19);

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x10) != 0)
  {
    v54[46] |= 0x10uLL;
    -[CXCallUpdate localizedCallerImageURL](self, "localizedCallerImageURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "copyWithZone:", a4);
    objc_msgSend(v54, "setLocalizedCallerImageURL:", v21);

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x1000000000) != 0)
  {
    v54[46] |= 0x1000000000uLL;
    -[CXCallUpdate localSenderIdentityUUID](self, "localSenderIdentityUUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "copyWithZone:", a4);
    objc_msgSend(v54, "setLocalSenderIdentityUUID:", v23);

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x2000000000) != 0)
  {
    v54[46] |= 0x2000000000uLL;
    -[CXCallUpdate localSenderIdentityAccountUUID](self, "localSenderIdentityAccountUUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "copyWithZone:", a4);
    objc_msgSend(v54, "setLocalSenderIdentityAccountUUID:", v25);

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x4000000000) != 0)
  {
    v54[46] |= 0x4000000000uLL;
    -[CXCallUpdate localMemberHandleValue](self, "localMemberHandleValue");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v26, "copyWithZone:", a4);
    objc_msgSend(v54, "setLocalMemberHandleValue:", v27);

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x8000000000) != 0)
  {
    v54[46] |= 0x8000000000uLL;
    -[CXCallUpdate localSenderSubscriptionIdentifier](self, "localSenderSubscriptionIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v28, "copyWithZone:", a4);
    objc_msgSend(v54, "setLocalSenderSubscriptionIdentifier:", v29);

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x10000000000) != 0)
  {
    v54[46] |= 0x10000000000uLL;
    -[CXCallUpdate participantGroupUUID](self, "participantGroupUUID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v30, "copyWithZone:", a4);
    objc_msgSend(v54, "setParticipantGroupUUID:", v31);

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x20000000000) != 0)
  {
    v54[46] |= 0x20000000000uLL;
    -[CXCallUpdate remoteParticipantHandles](self, "remoteParticipantHandles");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v32, "copyWithZone:", a4);
    objc_msgSend(v54, "setRemoteParticipantHandles:", v33);

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x40000000000) != 0)
  {
    v54[46] |= 0x40000000000uLL;
    -[CXCallUpdate otherInvitedHandles](self, "otherInvitedHandles");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v34, "copyWithZone:", a4);
    objc_msgSend(v54, "setOtherInvitedHandles:", v35);

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x80000000000) != 0)
  {
    v54[46] |= 0x80000000000uLL;
    -[CXCallUpdate activeRemoteParticipantHandles](self, "activeRemoteParticipantHandles");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v36, "copyWithZone:", a4);
    objc_msgSend(v54, "setActiveRemoteParticipantHandles:", v37);

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x100000000000) != 0)
  {
    v54[46] |= 0x100000000000uLL;
    -[CXCallUpdate handoffContext](self, "handoffContext");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setHandoffContext:", v38);

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x200000000000) != 0)
  {
    v54[46] |= 0x200000000000uLL;
    -[CXCallUpdate screenShareAttributes](self, "screenShareAttributes");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setScreenShareAttributes:", v39);

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x400000000000) != 0)
  {
    v54[46] |= 0x400000000000uLL;
    -[CXCallUpdate context](self, "context");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (void *)objc_msgSend(v40, "copyWithZone:", a4);
    objc_msgSend(v54, "setContext:", v41);

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x800000000000) != 0)
  {
    v54[46] |= 0x800000000000uLL;
    objc_msgSend(v54, "setPrefersExclusiveAccessToCellularNetwork:", -[CXCallUpdate prefersExclusiveAccessToCellularNetwork](self, "prefersExclusiveAccessToCellularNetwork"));
  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x800) != 0)
  {
    v54[46] |= 0x800uLL;
    objc_msgSend(v54, "setSupportsTTYWithVoice:", -[CXCallUpdate supportsTTYWithVoice](self, "supportsTTYWithVoice"));
  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x1000000000000) != 0)
  {
    v54[46] |= 0x1000000000000uLL;
    objc_msgSend(v54, "setRemoteUplinkMuted:", -[CXCallUpdate isRemoteUplinkMuted](self, "isRemoteUplinkMuted"));
  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x2000000000000) != 0)
  {
    v54[46] |= 0x2000000000000uLL;
    objc_msgSend(v54, "setShouldSuppressInCallUI:", -[CXCallUpdate shouldSuppressInCallUI](self, "shouldSuppressInCallUI"));
  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x4000000000000) != 0)
  {
    v54[46] |= 0x4000000000000uLL;
    objc_msgSend(v54, "setRequiresAuthentication:", -[CXCallUpdate requiresAuthentication](self, "requiresAuthentication"));
  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x8000000000000) != 0)
  {
    v54[46] |= 0x8000000000000uLL;
    objc_msgSend(v54, "setMutuallyExclusiveCall:", -[CXCallUpdate isMutuallyExclusiveCall](self, "isMutuallyExclusiveCall"));
  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x10000000000000) != 0)
  {
    v54[46] |= 0x10000000000000uLL;
    objc_msgSend(v54, "setJunkConfidence:", -[CXCallUpdate junkConfidence](self, "junkConfidence"));
  }
  -[CXCallUpdate hasSet](self, "hasSet");
  if ((v42 & 0x100) != 0)
  {
    *((_WORD *)v54 + 188) |= 0x100u;
    objc_msgSend(v54, "setCallSubType:", -[CXCallUpdate callSubType](self, "callSubType"));
  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x20000000000000) != 0)
  {
    v54[46] |= 0x20000000000000uLL;
    objc_msgSend(v54, "setIdentificationCategory:", -[CXCallUpdate identificationCategory](self, "identificationCategory"));
  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x40000000000000) != 0)
  {
    v54[46] |= 0x40000000000000uLL;
    objc_msgSend(v54, "setConversation:", -[CXCallUpdate isConversation](self, "isConversation"));
  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x80000000000000) != 0)
  {
    v54[46] |= 0x80000000000000uLL;
    objc_msgSend(v54, "setMixesVoiceWithMedia:", -[CXCallUpdate mixesVoiceWithMedia](self, "mixesVoiceWithMedia"));
  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x100000000000000) != 0)
  {
    v54[46] |= 0x100000000000000uLL;
    objc_msgSend(v54, "setPrefersToPlayDuringWombat:", -[CXCallUpdate prefersToPlayDuringWombat](self, "prefersToPlayDuringWombat"));
  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x200000000000000) != 0)
  {
    v54[46] |= 0x200000000000000uLL;
    objc_msgSend(v54, "setMediaPlaybackOnExternalDevice:", -[CXCallUpdate mediaPlaybackOnExternalDevice](self, "mediaPlaybackOnExternalDevice"));
  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x2000000000000000) != 0)
  {
    v54[46] |= 0x2000000000000000uLL;
    objc_msgSend(v54, "setIgnoresBluetoothDeviceUID:", -[CXCallUpdate ignoresBluetoothDeviceUID](self, "ignoresBluetoothDeviceUID"));
  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x800000000000000) != 0)
  {
    v54[46] |= 0x800000000000000uLL;
    objc_msgSend(v54, "setSharingScreen:", -[CXCallUpdate isSharingScreen](self, "isSharingScreen"));
  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x400000000000000) != 0)
  {
    v54[46] |= 0x400000000000000uLL;
    objc_msgSend(v54, "setOneToOneModeEnabled:", -[CXCallUpdate isOneToOneModeEnabled](self, "isOneToOneModeEnabled"));
  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x4000000000000000) != 0)
  {
    v54[46] |= 0x4000000000000000uLL;
    objc_msgSend(v54, "setServiceStatus:", -[CXCallUpdate serviceStatus](self, "serviceStatus"));
  }
  if (-[CXCallUpdate hasSet](self, "hasSet") < 0)
  {
    v54[46] |= 0x8000000000000000;
    objc_msgSend(v54, "setTransmissionMode:", -[CXCallUpdate transmissionMode](self, "transmissionMode"));
  }
  -[CXCallUpdate hasSet](self, "hasSet");
  if ((v43 & 1) != 0)
  {
    *((_WORD *)v54 + 188) |= 1u;
    objc_msgSend(v54, "setAccessoryButtonEventsEnabled:", -[CXCallUpdate accessoryButtonEventsEnabled](self, "accessoryButtonEventsEnabled"));
  }
  -[CXCallUpdate hasSet](self, "hasSet");
  if ((v44 & 2) != 0)
  {
    *((_WORD *)v54 + 188) |= 2u;
    objc_msgSend(v54, "setSendingVideo:", -[CXCallUpdate isSendingVideo](self, "isSendingVideo"));
  }
  -[CXCallUpdate hasSet](self, "hasSet");
  if ((v45 & 0x40) != 0)
  {
    *((_WORD *)v54 + 188) |= 0x40u;
    objc_msgSend(v54, "setIsReRing:", -[CXCallUpdate isReRing](self, "isReRing"));
  }
  -[CXCallUpdate hasSet](self, "hasSet");
  if (v46 < 0)
  {
    *((_WORD *)v54 + 188) |= 0x80u;
    objc_msgSend(v54, "setSuppressRingtone:", -[CXCallUpdate suppressRingtone](self, "suppressRingtone"));
  }
  -[CXCallUpdate hasSet](self, "hasSet");
  if ((v47 & 4) != 0)
  {
    *((_WORD *)v54 + 188) |= 4u;
    objc_msgSend(v54, "setHasBeenRedirected:", -[CXCallUpdate hasBeenRedirected](self, "hasBeenRedirected"));
  }
  -[CXCallUpdate hasSet](self, "hasSet");
  if ((v48 & 8) != 0)
  {
    *((_WORD *)v54 + 188) |= 8u;
    objc_msgSend(v54, "setIsKnownCaller:", -[CXCallUpdate isKnownCaller](self, "isKnownCaller"));
  }
  -[CXCallUpdate hasSet](self, "hasSet");
  if ((v49 & 0x10) != 0)
  {
    *((_WORD *)v54 + 188) |= 0x10u;
    objc_msgSend(v54, "setFilteredOutReason:", -[CXCallUpdate filteredOutReason](self, "filteredOutReason"));
  }
  -[CXCallUpdate hasSet](self, "hasSet");
  if ((v50 & 0x20) != 0)
  {
    *((_WORD *)v54 + 188) |= 0x20u;
    -[CXCallUpdate silencingUserInfo](self, "silencingUserInfo");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setSilencingUserInfo:", v51);

  }
  -[CXCallUpdate hasSet](self, "hasSet");
  if ((v52 & 0x400) != 0)
  {
    *((_WORD *)v54 + 188) |= 0x400u;
    objc_msgSend(v54, "setScreenSharingIntention:", -[CXCallUpdate screenSharingIntention](self, "screenSharingIntention"));
  }
  -[CXCallUpdate hasSet](self, "hasSet");
  if ((v53 & 0x800) != 0)
  {
    *((_WORD *)v54 + 188) |= 0x800u;
    objc_msgSend(v54, "setScreenSharingType:", -[CXCallUpdate screenSharingType](self, "screenSharingType"));
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CXCallUpdate updateCopy:withZone:](self, "updateCopy:withZone:", v5, a3);
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXCallUpdate)initWithCoder:(id)a3
{
  id v4;
  CXCallUpdate *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSUUID *UUID;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  uint64_t v16;
  CXAccount *account;
  int v18;
  void *v19;
  uint64_t v20;
  CXParticipant *activeRemoteParticipant;
  int v22;
  void *v23;
  uint64_t v24;
  CXHandle *remoteHandle;
  int v26;
  void *v27;
  uint64_t v28;
  NSString *localizedCallerName;
  int v30;
  void *v31;
  uint64_t v32;
  CXSandboxExtendedURL *localizedCallerImageURL;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  void *v44;
  uint64_t v45;
  NSString *audioCategory;
  int v47;
  void *v48;
  uint64_t v49;
  NSString *audioMode;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;
  void *v69;
  uint64_t v70;
  CXCallTokens *callTokens;
  int v72;
  void *v73;
  uint64_t v74;
  NSString *announceProviderIdentifier;
  int v76;
  void *v77;
  uint64_t v78;
  NSString *crossDeviceIdentifier;
  int v80;
  void *v81;
  uint64_t v82;
  NSString *ISOCountryCode;
  int v84;
  void *v85;
  uint64_t v86;
  NSUUID *localSenderIdentityUUID;
  int v88;
  void *v89;
  uint64_t v90;
  NSUUID *localSenderIdentityAccountUUID;
  int v92;
  void *v93;
  uint64_t v94;
  NSString *localMemberHandleValue;
  int v96;
  void *v97;
  uint64_t v98;
  NSString *localSenderSubscriptionIdentifier;
  int v100;
  void *v101;
  uint64_t v102;
  NSUUID *participantGroupUUID;
  int v104;
  void *v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  NSSet *remoteParticipantHandles;
  int v110;
  void *v111;
  uint64_t v112;
  void *v113;
  uint64_t v114;
  NSSet *otherInvitedHandles;
  int v116;
  void *v117;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  NSSet *activeRemoteParticipantHandles;
  int v122;
  void *v123;
  uint64_t v124;
  CXHandoffContext *handoffContext;
  int v126;
  void *v127;
  uint64_t v128;
  CXScreenShareAttributes *screenShareAttributes;
  int v130;
  void *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  uint64_t v137;
  NSDictionary *context;
  int v139;
  int v140;
  int v141;
  int v142;
  int v143;
  int v144;
  int v145;
  int v146;
  int v147;
  int v148;
  int v149;
  int v150;
  int v151;
  int v152;
  int v153;
  int v154;
  int v155;
  int v156;
  int v157;
  int v158;
  int v159;
  int v160;
  int v161;
  int v162;
  int v163;
  void *v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  uint64_t v168;
  NSMutableDictionary *silencingUserInfo;
  int v170;
  int v171;
  CXCallUpdate *v172;
  uint64_t v174;
  _QWORD v175[2];
  int v176;
  uint64_t v177;
  int v178;
  uint64_t v179;
  int v180;
  uint64_t v181;
  int v182;
  uint64_t v183;
  int v184;
  uint64_t v185;
  int v186;
  uint64_t v187;
  int v188;
  uint64_t v189;
  int v190;
  uint64_t v191;
  int v192;
  uint64_t v193;
  int v194;
  uint64_t v195;
  int v196;
  uint64_t v197;
  int v198;
  uint64_t v199;
  int v200;
  uint64_t v201;
  int v202;
  uint64_t v203;
  int v204;
  uint64_t v205;
  int v206;
  uint64_t v207;
  int v208;
  uint64_t v209;
  int v210;
  uint64_t v211;
  int v212;
  uint64_t v213;
  int v214;
  uint64_t v215;
  int v216;
  uint64_t v217;
  int v218;
  uint64_t v219;
  int v220;
  uint64_t v221;
  int v222;
  uint64_t v223;
  int v224;
  uint64_t v225;
  int v226;
  uint64_t v227;
  int v228;
  uint64_t v229;
  int v230;
  uint64_t v231;
  int v232;
  uint64_t v233;
  int v234;
  uint64_t v235;
  int v236;
  uint64_t v237;
  int v238;
  uint64_t v239;
  int v240;
  uint64_t v241;
  int v242;
  uint64_t v243;
  int v244;
  uint64_t v245;
  int v246;
  uint64_t v247;
  int v248;
  uint64_t v249;
  int v250;
  uint64_t v251;
  int v252;
  uint64_t v253;
  int v254;
  uint64_t v255;
  int v256;
  uint64_t v257;
  int v258;
  uint64_t v259;
  int v260;
  uint64_t v261;
  int v262;
  uint64_t v263;
  int v264;
  uint64_t v265;
  int v266;
  uint64_t v267;
  int v268;
  uint64_t v269;
  int v270;
  uint64_t v271;
  int v272;
  uint64_t v273;
  int v274;
  uint64_t v275;
  int v276;
  uint64_t v277;
  int v278;
  uint64_t v279;
  int v280;
  uint64_t v281;
  int v282;
  uint64_t v283;
  int v284;
  uint64_t v285;
  int v286;
  uint64_t v287;
  int v288;
  uint64_t v289;
  int v290;
  uint64_t v291;
  int v292;
  uint64_t v293;
  int v294;
  uint64_t v295;
  int v296;
  uint64_t v297;
  int v298;
  uint64_t v299;
  int v300;
  uint64_t v301;
  int v302;
  uint64_t v303;
  int v304;
  uint64_t v305;
  int v306;
  uint64_t v307;
  int v308;
  uint64_t v309;
  int v310;
  uint64_t v311;
  int v312;
  uint64_t v313;
  int v314;
  uint64_t v315;
  int v316;
  uint64_t v317;
  int v318;
  uint64_t v319;
  int v320;
  uint64_t v321;
  int v322;
  uint64_t v323;
  int v324;
  uint64_t v325;

  v325 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[CXCallUpdate init](self, "init");

  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_UUID);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v8;

    v175[0] = 0;
    v10 = objc_retainAutorelease(v4);
    NSStringFromSelector(sel_hasSet);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "decodeBytesForKey:returnedLength:", v11, v175);

    if (v175[0] != 12)
    {
      v172 = 0;
      goto LABEL_155;
    }
    v13 = *(_QWORD *)v12;
    *((_DWORD *)&v5->_hasSet + 2) = *(_DWORD *)(v12 + 8);
    *(_QWORD *)&v5->_hasSet = v13;
    v323 = -[CXCallUpdate hasSet](v5, "hasSet");
    v324 = v14;
    if ((v323 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "decodeObjectOfClasses:forKey:", v15, CFSTR("account"));
      v16 = objc_claimAutoreleasedReturnValue();
      account = v5->_account;
      v5->_account = (CXAccount *)v16;

    }
    v321 = -[CXCallUpdate hasSet](v5, "hasSet");
    v322 = v18;
    if ((v321 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "decodeObjectOfClasses:forKey:", v19, CFSTR("activeRemoteParticipant"));
      v20 = objc_claimAutoreleasedReturnValue();
      activeRemoteParticipant = v5->_activeRemoteParticipant;
      v5->_activeRemoteParticipant = (CXParticipant *)v20;

    }
    v319 = -[CXCallUpdate hasSet](v5, "hasSet");
    v320 = v22;
    if ((v319 & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "decodeObjectOfClasses:forKey:", v23, CFSTR("remoteHandle"));
      v24 = objc_claimAutoreleasedReturnValue();
      remoteHandle = v5->_remoteHandle;
      v5->_remoteHandle = (CXHandle *)v24;

    }
    v317 = -[CXCallUpdate hasSet](v5, "hasSet");
    v318 = v26;
    if ((v317 & 8) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "decodeObjectOfClasses:forKey:", v27, CFSTR("localizedCallerName"));
      v28 = objc_claimAutoreleasedReturnValue();
      localizedCallerName = v5->_localizedCallerName;
      v5->_localizedCallerName = (NSString *)v28;

    }
    v315 = -[CXCallUpdate hasSet](v5, "hasSet");
    v316 = v30;
    if ((v315 & 0x10) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "decodeObjectOfClasses:forKey:", v31, CFSTR("localizedCallerImageURL"));
      v32 = objc_claimAutoreleasedReturnValue();
      localizedCallerImageURL = v5->_localizedCallerImageURL;
      v5->_localizedCallerImageURL = (CXSandboxExtendedURL *)v32;

    }
    v313 = -[CXCallUpdate hasSet](v5, "hasSet");
    v314 = v34;
    if ((v313 & 0x20) != 0)
      v5->_emergency = objc_msgSend(v10, "decodeBoolForKey:", CFSTR("emergency"));
    v311 = -[CXCallUpdate hasSet](v5, "hasSet");
    v312 = v35;
    if ((v311 & 0x40) != 0)
      v5->_failureExpected = objc_msgSend(v10, "decodeBoolForKey:", CFSTR("failureExpected"));
    v309 = -[CXCallUpdate hasSet](v5, "hasSet");
    v310 = v36;
    if ((v309 & 0x80) != 0)
      v5->_supportsEmergencyFallback = objc_msgSend(v10, "decodeBoolForKey:", CFSTR("supportsEmergencyFallback"));
    v307 = -[CXCallUpdate hasSet](v5, "hasSet");
    v308 = v37;
    if ((v307 & 0x100) != 0)
      v5->_usingBaseband = objc_msgSend(v10, "decodeBoolForKey:", CFSTR("usingBaseband"));
    v305 = -[CXCallUpdate hasSet](v5, "hasSet");
    v306 = v38;
    if ((v305 & 0x200) != 0)
      v5->_blocked = objc_msgSend(v10, "decodeBoolForKey:", CFSTR("blocked"));
    v303 = -[CXCallUpdate hasSet](v5, "hasSet");
    v304 = v39;
    if ((v303 & 0x400) != 0)
      v5->_ttyType = objc_msgSend(v10, "decodeIntegerForKey:", CFSTR("ttyType"));
    v301 = -[CXCallUpdate hasSet](v5, "hasSet");
    v302 = v40;
    if ((v301 & 0x1000000000000000) != 0)
      v5->_bluetoothAudioFormat = objc_msgSend(v10, "decodeIntegerForKey:", CFSTR("bluetoothAudioFormat"));
    v299 = -[CXCallUpdate hasSet](v5, "hasSet");
    v300 = v41;
    if ((v299 & 0x1000) != 0)
      v5->_mayRequireBreakBeforeMake = objc_msgSend(v10, "decodeBoolForKey:", CFSTR("mayRequireBreakBeforeMake"));
    v297 = -[CXCallUpdate hasSet](v5, "hasSet");
    v298 = v42;
    if ((v297 & 0x2000) != 0)
      v5->_hasVideo = objc_msgSend(v10, "decodeBoolForKey:", CFSTR("hasVideo"));
    v295 = -[CXCallUpdate hasSet](v5, "hasSet");
    v296 = v43;
    if ((v295 & 0x4000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "decodeObjectOfClasses:forKey:", v44, CFSTR("audioCategory"));
      v45 = objc_claimAutoreleasedReturnValue();
      audioCategory = v5->_audioCategory;
      v5->_audioCategory = (NSString *)v45;

    }
    v293 = -[CXCallUpdate hasSet](v5, "hasSet");
    v294 = v47;
    if ((v293 & 0x8000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "decodeObjectOfClasses:forKey:", v48, CFSTR("audioMode"));
      v49 = objc_claimAutoreleasedReturnValue();
      audioMode = v5->_audioMode;
      v5->_audioMode = (NSString *)v49;

    }
    v291 = -[CXCallUpdate hasSet](v5, "hasSet");
    v292 = v51;
    if ((v291 & 0x10000) != 0)
      v5->_audioInterruptionProvider = objc_msgSend(v10, "decodeIntegerForKey:", CFSTR("audioInterruptionProvider"));
    v289 = -[CXCallUpdate hasSet](v5, "hasSet");
    v290 = v52;
    if ((v289 & 0x20000) != 0)
      v5->_audioInterruptionOperationMode = objc_msgSend(v10, "decodeIntegerForKey:", CFSTR("audioInterruptionOperationMode"));
    v287 = -[CXCallUpdate hasSet](v5, "hasSet");
    v288 = v53;
    if ((v287 & 0x40000) != 0)
      v5->_verificationStatus = objc_msgSend(v10, "decodeIntegerForKey:", CFSTR("verificationStatus"));
    v285 = -[CXCallUpdate hasSet](v5, "hasSet");
    v286 = v54;
    if ((v285 & 0x80000) != 0)
      v5->_priority = objc_msgSend(v10, "decodeIntegerForKey:", CFSTR("priority"));
    v283 = -[CXCallUpdate hasSet](v5, "hasSet");
    v284 = v55;
    if ((v283 & 0x100000) != 0)
      v5->_requiresInCallSounds = objc_msgSend(v10, "decodeBoolForKey:", CFSTR("requiresInCallSounds"));
    v281 = -[CXCallUpdate hasSet](v5, "hasSet");
    v282 = v56;
    if ((v281 & 0x200000) != 0)
      v5->_inCallSoundRegion = objc_msgSend(v10, "decodeIntegerForKey:", CFSTR("inCallSoundRegion"));
    v279 = -[CXCallUpdate hasSet](v5, "hasSet");
    v280 = v57;
    if ((v279 & 0x400000) != 0)
      v5->_supportsHolding = objc_msgSend(v10, "decodeBoolForKey:", CFSTR("supportsHolding"));
    v277 = -[CXCallUpdate hasSet](v5, "hasSet");
    v278 = v58;
    if ((v277 & 0x800000) != 0)
      v5->_supportsGrouping = objc_msgSend(v10, "decodeBoolForKey:", CFSTR("supportsGrouping"));
    v275 = -[CXCallUpdate hasSet](v5, "hasSet");
    v276 = v59;
    if ((v275 & 0x1000000) != 0)
      v5->_supportsUngrouping = objc_msgSend(v10, "decodeBoolForKey:", CFSTR("supportsUngrouping"));
    v273 = -[CXCallUpdate hasSet](v5, "hasSet");
    v274 = v60;
    if ((v273 & 0x2000000) != 0)
      v5->_supportsDTMF = objc_msgSend(v10, "decodeBoolForKey:", CFSTR("supportsDTMF"));
    v271 = -[CXCallUpdate hasSet](v5, "hasSet");
    v272 = v61;
    if ((v271 & 0x4000000) != 0)
      v5->_supportsDTMFUpdates = objc_msgSend(v10, "decodeBoolForKey:", CFSTR("supportsDTMFUpdates"));
    v269 = -[CXCallUpdate hasSet](v5, "hasSet");
    v270 = v62;
    if ((v269 & 0x8000000) != 0)
      v5->_supportsUnambiguousMultiPartyState = objc_msgSend(v10, "decodeBoolForKey:", CFSTR("supportsUnambiguousMultiPartyState"));
    v267 = -[CXCallUpdate hasSet](v5, "hasSet");
    v268 = v63;
    if ((v267 & 0x10000000) != 0)
      v5->_supportsAddCall = objc_msgSend(v10, "decodeBoolForKey:", CFSTR("supportsAddCall"));
    v265 = -[CXCallUpdate hasSet](v5, "hasSet");
    v266 = v64;
    if ((v265 & 0x20000000) != 0)
      v5->_supportsSendingToVoicemail = objc_msgSend(v10, "decodeBoolForKey:", CFSTR("supportsSendingToVoicemail"));
    v263 = -[CXCallUpdate hasSet](v5, "hasSet");
    v264 = v65;
    if ((v263 & 0x40000000) != 0)
      v5->_supportsRecording = objc_msgSend(v10, "decodeBoolForKey:", CFSTR("supportsRecording"));
    v261 = -[CXCallUpdate hasSet](v5, "hasSet");
    v262 = v66;
    if ((v66 & 0x200) != 0)
      v5->_supportsScreening = objc_msgSend(v10, "decodeBoolForKey:", CFSTR("supportsScreening"));
    v259 = -[CXCallUpdate hasSet](v5, "hasSet");
    v260 = v67;
    if ((v259 & 0x80000000) != 0)
      v5->_videoStreamToken = objc_msgSend(v10, "decodeIntegerForKey:", CFSTR("videoStreamToken"));
    v257 = -[CXCallUpdate hasSet](v5, "hasSet");
    v258 = v68;
    if ((v257 & 0x100000000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "decodeObjectOfClasses:forKey:", v69, CFSTR("callTokens"));
      v70 = objc_claimAutoreleasedReturnValue();
      callTokens = v5->_callTokens;
      v5->_callTokens = (CXCallTokens *)v70;

    }
    v255 = -[CXCallUpdate hasSet](v5, "hasSet");
    v256 = v72;
    if ((v255 & 0x200000000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "decodeObjectOfClasses:forKey:", v73, CFSTR("announceProviderIdentifier"));
      v74 = objc_claimAutoreleasedReturnValue();
      announceProviderIdentifier = v5->_announceProviderIdentifier;
      v5->_announceProviderIdentifier = (NSString *)v74;

    }
    v253 = -[CXCallUpdate hasSet](v5, "hasSet");
    v254 = v76;
    if ((v253 & 0x400000000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "decodeObjectOfClasses:forKey:", v77, CFSTR("crossDeviceIdentifier"));
      v78 = objc_claimAutoreleasedReturnValue();
      crossDeviceIdentifier = v5->_crossDeviceIdentifier;
      v5->_crossDeviceIdentifier = (NSString *)v78;

    }
    v251 = -[CXCallUpdate hasSet](v5, "hasSet");
    v252 = v80;
    if ((v251 & 0x800000000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "decodeObjectOfClasses:forKey:", v81, CFSTR("ISOCountryCode"));
      v82 = objc_claimAutoreleasedReturnValue();
      ISOCountryCode = v5->_ISOCountryCode;
      v5->_ISOCountryCode = (NSString *)v82;

    }
    v249 = -[CXCallUpdate hasSet](v5, "hasSet");
    v250 = v84;
    if ((v249 & 0x1000000000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "decodeObjectOfClasses:forKey:", v85, CFSTR("localSenderIdentityUUID"));
      v86 = objc_claimAutoreleasedReturnValue();
      localSenderIdentityUUID = v5->_localSenderIdentityUUID;
      v5->_localSenderIdentityUUID = (NSUUID *)v86;

    }
    v247 = -[CXCallUpdate hasSet](v5, "hasSet");
    v248 = v88;
    if ((v247 & 0x2000000000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "decodeObjectOfClasses:forKey:", v89, CFSTR("localSenderIdentityAccountUUID"));
      v90 = objc_claimAutoreleasedReturnValue();
      localSenderIdentityAccountUUID = v5->_localSenderIdentityAccountUUID;
      v5->_localSenderIdentityAccountUUID = (NSUUID *)v90;

    }
    v245 = -[CXCallUpdate hasSet](v5, "hasSet");
    v246 = v92;
    if ((v245 & 0x4000000000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "decodeObjectOfClasses:forKey:", v93, CFSTR("localMemberHandleValue"));
      v94 = objc_claimAutoreleasedReturnValue();
      localMemberHandleValue = v5->_localMemberHandleValue;
      v5->_localMemberHandleValue = (NSString *)v94;

    }
    v243 = -[CXCallUpdate hasSet](v5, "hasSet");
    v244 = v96;
    if ((v243 & 0x8000000000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "decodeObjectOfClasses:forKey:", v97, CFSTR("localSenderSubscriptionIdentifier"));
      v98 = objc_claimAutoreleasedReturnValue();
      localSenderSubscriptionIdentifier = v5->_localSenderSubscriptionIdentifier;
      v5->_localSenderSubscriptionIdentifier = (NSString *)v98;

    }
    v241 = -[CXCallUpdate hasSet](v5, "hasSet");
    v242 = v100;
    if ((v241 & 0x10000000000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "decodeObjectOfClasses:forKey:", v101, CFSTR("participantGroupUUID"));
      v102 = objc_claimAutoreleasedReturnValue();
      participantGroupUUID = v5->_participantGroupUUID;
      v5->_participantGroupUUID = (NSUUID *)v102;

    }
    v239 = -[CXCallUpdate hasSet](v5, "hasSet");
    v240 = v104;
    if ((v239 & 0x20000000000) != 0)
    {
      v105 = (void *)MEMORY[0x1E0C99E60];
      v106 = objc_opt_class();
      objc_msgSend(v105, "setWithObjects:", v106, objc_opt_class(), 0);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "decodeObjectOfClasses:forKey:", v107, CFSTR("remoteParticipantHandles"));
      v108 = objc_claimAutoreleasedReturnValue();
      remoteParticipantHandles = v5->_remoteParticipantHandles;
      v5->_remoteParticipantHandles = (NSSet *)v108;

    }
    v237 = -[CXCallUpdate hasSet](v5, "hasSet");
    v238 = v110;
    if ((v237 & 0x40000000000) != 0)
    {
      v111 = (void *)MEMORY[0x1E0C99E60];
      v112 = objc_opt_class();
      objc_msgSend(v111, "setWithObjects:", v112, objc_opt_class(), 0);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "decodeObjectOfClasses:forKey:", v113, CFSTR("otherInvitedHandles"));
      v114 = objc_claimAutoreleasedReturnValue();
      otherInvitedHandles = v5->_otherInvitedHandles;
      v5->_otherInvitedHandles = (NSSet *)v114;

    }
    v235 = -[CXCallUpdate hasSet](v5, "hasSet");
    v236 = v116;
    if ((v235 & 0x80000000000) != 0)
    {
      v117 = (void *)MEMORY[0x1E0C99E60];
      v118 = objc_opt_class();
      objc_msgSend(v117, "setWithObjects:", v118, objc_opt_class(), 0);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "decodeObjectOfClasses:forKey:", v119, CFSTR("activeRemoteParticipantHandles"));
      v120 = objc_claimAutoreleasedReturnValue();
      activeRemoteParticipantHandles = v5->_activeRemoteParticipantHandles;
      v5->_activeRemoteParticipantHandles = (NSSet *)v120;

    }
    v233 = -[CXCallUpdate hasSet](v5, "hasSet");
    v234 = v122;
    if ((v233 & 0x100000000000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "decodeObjectOfClasses:forKey:", v123, CFSTR("handoffContext"));
      v124 = objc_claimAutoreleasedReturnValue();
      handoffContext = v5->_handoffContext;
      v5->_handoffContext = (CXHandoffContext *)v124;

    }
    v231 = -[CXCallUpdate hasSet](v5, "hasSet");
    v232 = v126;
    if ((v231 & 0x200000000000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "decodeObjectOfClasses:forKey:", v127, CFSTR("screenShareAttributes"));
      v128 = objc_claimAutoreleasedReturnValue();
      screenShareAttributes = v5->_screenShareAttributes;
      v5->_screenShareAttributes = (CXScreenShareAttributes *)v128;

    }
    v229 = -[CXCallUpdate hasSet](v5, "hasSet");
    v230 = v130;
    if ((v229 & 0x400000000000) != 0)
    {
      v131 = (void *)MEMORY[0x1E0C99E60];
      v132 = objc_opt_class();
      v133 = objc_opt_class();
      v134 = objc_opt_class();
      v135 = objc_opt_class();
      v174 = objc_opt_class();
      objc_msgSend(v131, "setWithObjects:", v132, v133, v134, v135, v174, objc_opt_class(), 0);
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "decodeObjectOfClasses:forKey:", v136, CFSTR("context"));
      v137 = objc_claimAutoreleasedReturnValue();
      context = v5->_context;
      v5->_context = (NSDictionary *)v137;

    }
    v227 = -[CXCallUpdate hasSet](v5, "hasSet");
    v228 = v139;
    if ((v227 & 0x800000000000) != 0)
      v5->_prefersExclusiveAccessToCellularNetwork = objc_msgSend(v10, "decodeBoolForKey:", CFSTR("prefersExclusiveAccessToCellularNetwork"));
    v225 = -[CXCallUpdate hasSet](v5, "hasSet");
    v226 = v140;
    if ((v225 & 0x800) != 0)
      v5->_supportsTTYWithVoice = objc_msgSend(v10, "decodeBoolForKey:", CFSTR("supportsTTYWithVoice"));
    v223 = -[CXCallUpdate hasSet](v5, "hasSet");
    v224 = v141;
    if ((v223 & 0x1000000000000) != 0)
      v5->_remoteUplinkMuted = objc_msgSend(v10, "decodeBoolForKey:", CFSTR("remoteUplinkMuted"));
    v221 = -[CXCallUpdate hasSet](v5, "hasSet");
    v222 = v142;
    if ((v221 & 0x2000000000000) != 0)
      v5->_shouldSuppressInCallUI = objc_msgSend(v10, "decodeBoolForKey:", CFSTR("shouldSuppressInCallUI"));
    v219 = -[CXCallUpdate hasSet](v5, "hasSet");
    v220 = v143;
    if ((v219 & 0x4000000000000) != 0)
      v5->_requiresAuthentication = objc_msgSend(v10, "decodeBoolForKey:", CFSTR("requiresAuthentication"));
    v217 = -[CXCallUpdate hasSet](v5, "hasSet");
    v218 = v144;
    if ((v217 & 0x8000000000000) != 0)
      v5->_mutuallyExclusiveCall = objc_msgSend(v10, "decodeBoolForKey:", CFSTR("mutuallyExclusiveCall"));
    v215 = -[CXCallUpdate hasSet](v5, "hasSet");
    v216 = v145;
    if ((v215 & 0x10000000000000) != 0)
      v5->_junkConfidence = objc_msgSend(v10, "decodeIntegerForKey:", CFSTR("junkConfidence"));
    v213 = -[CXCallUpdate hasSet](v5, "hasSet");
    v214 = v146;
    if ((v146 & 0x100) != 0)
      v5->_callSubType = objc_msgSend(v10, "decodeIntegerForKey:", CFSTR("callSubType"));
    v211 = -[CXCallUpdate hasSet](v5, "hasSet");
    v212 = v147;
    if ((v211 & 0x20000000000000) != 0)
      v5->_identificationCategory = objc_msgSend(v10, "decodeIntegerForKey:", CFSTR("identificationCategory"));
    v209 = -[CXCallUpdate hasSet](v5, "hasSet");
    v210 = v148;
    if ((v209 & 0x40000000000000) != 0)
      v5->_conversation = objc_msgSend(v10, "decodeBoolForKey:", CFSTR("conversation"));
    v207 = -[CXCallUpdate hasSet](v5, "hasSet");
    v208 = v149;
    if ((v207 & 0x80000000000000) != 0)
      v5->_mixesVoiceWithMedia = objc_msgSend(v10, "decodeBoolForKey:", CFSTR("mixesVoiceWithMedia"));
    v205 = -[CXCallUpdate hasSet](v5, "hasSet");
    v206 = v150;
    if ((v205 & 0x100000000000000) != 0)
      v5->_prefersToPlayDuringWombat = objc_msgSend(v10, "decodeBoolForKey:", CFSTR("prefersToPlayDuringWombat"));
    v203 = -[CXCallUpdate hasSet](v5, "hasSet");
    v204 = v151;
    if ((v203 & 0x200000000000000) != 0)
      v5->_mediaPlaybackOnExternalDevice = objc_msgSend(v10, "decodeBoolForKey:", CFSTR("mediaPlaybackOnExternalDevice"));
    v201 = -[CXCallUpdate hasSet](v5, "hasSet");
    v202 = v152;
    if ((v201 & 0x2000000000000000) != 0)
      v5->_ignoresBluetoothDeviceUID = objc_msgSend(v10, "decodeBoolForKey:", CFSTR("ignoresBluetoothDeviceUID"));
    v199 = -[CXCallUpdate hasSet](v5, "hasSet");
    v200 = v153;
    if ((v199 & 0x800000000000000) != 0)
      v5->_sharingScreen = objc_msgSend(v10, "decodeBoolForKey:", CFSTR("sharingScreen"));
    v197 = -[CXCallUpdate hasSet](v5, "hasSet");
    v198 = v154;
    if ((v197 & 0x4000000000000000) != 0)
      v5->_serviceStatus = objc_msgSend(v10, "decodeIntegerForKey:", CFSTR("serviceStatus"));
    v195 = -[CXCallUpdate hasSet](v5, "hasSet");
    v196 = v155;
    if (v195 < 0)
      v5->_transmissionMode = objc_msgSend(v10, "decodeIntegerForKey:", CFSTR("transmissionMode"));
    v193 = -[CXCallUpdate hasSet](v5, "hasSet");
    v194 = v156;
    if ((v156 & 1) != 0)
      v5->_accessoryButtonEventsEnabled = objc_msgSend(v10, "decodeBoolForKey:", CFSTR("accessoryButtonEventsEnabled"));
    v191 = -[CXCallUpdate hasSet](v5, "hasSet");
    v192 = v157;
    if ((v157 & 2) != 0)
      v5->_sendingVideo = objc_msgSend(v10, "decodeBoolForKey:", CFSTR("sendingVideo"));
    v189 = -[CXCallUpdate hasSet](v5, "hasSet");
    v190 = v158;
    if ((v158 & 0x40) != 0)
      v5->_isReRing = objc_msgSend(v10, "decodeBoolForKey:", CFSTR("isReRing"));
    v187 = -[CXCallUpdate hasSet](v5, "hasSet");
    v188 = v159;
    if ((v159 & 0x80) != 0)
      v5->_suppressRingtone = objc_msgSend(v10, "decodeBoolForKey:", CFSTR("suppressRingtone"));
    v185 = -[CXCallUpdate hasSet](v5, "hasSet");
    v186 = v160;
    if ((v160 & 4) != 0)
      v5->_hasBeenRedirected = objc_msgSend(v10, "decodeBoolForKey:", CFSTR("hasBeenRedirected"));
    v183 = -[CXCallUpdate hasSet](v5, "hasSet");
    v184 = v161;
    if ((v161 & 8) != 0)
      v5->_isKnownCaller = objc_msgSend(v10, "decodeBoolForKey:", CFSTR("isKnownCaller"));
    v181 = -[CXCallUpdate hasSet](v5, "hasSet");
    v182 = v162;
    if ((v162 & 0x10) != 0)
      v5->_filteredOutReason = objc_msgSend(v10, "decodeIntegerForKey:", CFSTR("filteredOutReason"));
    v179 = -[CXCallUpdate hasSet](v5, "hasSet");
    v180 = v163;
    if ((v163 & 0x20) != 0)
    {
      v164 = (void *)MEMORY[0x1E0C99E60];
      v165 = objc_opt_class();
      v166 = objc_opt_class();
      objc_msgSend(v164, "setWithObjects:", v165, v166, objc_opt_class(), 0);
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "decodeObjectOfClasses:forKey:", v167, CFSTR("silencingUserInfo"));
      v168 = objc_claimAutoreleasedReturnValue();
      silencingUserInfo = v5->_silencingUserInfo;
      v5->_silencingUserInfo = (NSMutableDictionary *)v168;

    }
    v177 = -[CXCallUpdate hasSet](v5, "hasSet");
    v178 = v170;
    if ((v170 & 0x400) != 0)
      v5->_screenSharingIntention = objc_msgSend(v10, "decodeIntegerForKey:", CFSTR("screenSharingIntention"));
    v175[1] = -[CXCallUpdate hasSet](v5, "hasSet");
    v176 = v171;
    if ((v171 & 0x800) != 0)
      v5->_screenSharingType = objc_msgSend(v10, "decodeIntegerForKey:", CFSTR("screenSharingType"));
  }
  v172 = v5;
LABEL_155:

  return v172;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int16 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __int16 v30;
  char v31;
  char v32;
  char v33;
  char v34;
  char v35;
  char v36;
  char v37;
  __int16 v38;
  char v39;
  void *v40;
  __int16 v41;
  id v42;

  v42 = a3;
  -[CXCallUpdate UUID](self, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_UUID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "encodeObject:forKey:", v4, v5);

  NSStringFromSelector(sel_hasSet);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "encodeBytes:length:forKey:", &self->_hasSet, 12, v6);

  if ((-[CXCallUpdate hasSet](self, "hasSet") & 1) != 0)
  {
    -[CXCallUpdate account](self, "account");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "encodeObject:forKey:", v7, CFSTR("account"));

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 2) != 0)
  {
    -[CXCallUpdate activeRemoteParticipant](self, "activeRemoteParticipant");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "encodeObject:forKey:", v8, CFSTR("activeRemoteParticipant"));

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 4) != 0)
  {
    -[CXCallUpdate remoteHandle](self, "remoteHandle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "encodeObject:forKey:", v9, CFSTR("remoteHandle"));

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 8) != 0)
  {
    -[CXCallUpdate localizedCallerName](self, "localizedCallerName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "encodeObject:forKey:", v10, CFSTR("localizedCallerName"));

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x10) != 0)
  {
    -[CXCallUpdate localizedCallerImageURL](self, "localizedCallerImageURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "encodeObject:forKey:", v11, CFSTR("localizedCallerImageURL"));

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x20) != 0)
    objc_msgSend(v42, "encodeBool:forKey:", -[CXCallUpdate isEmergency](self, "isEmergency"), CFSTR("emergency"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x40) != 0)
    objc_msgSend(v42, "encodeBool:forKey:", -[CXCallUpdate isFailureExpected](self, "isFailureExpected"), CFSTR("failureExpected"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x80) != 0)
    objc_msgSend(v42, "encodeBool:forKey:", -[CXCallUpdate supportsEmergencyFallback](self, "supportsEmergencyFallback"), CFSTR("supportsEmergencyFallback"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x100) != 0)
    objc_msgSend(v42, "encodeBool:forKey:", -[CXCallUpdate isUsingBaseband](self, "isUsingBaseband"), CFSTR("usingBaseband"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x200) != 0)
    objc_msgSend(v42, "encodeBool:forKey:", -[CXCallUpdate isBlocked](self, "isBlocked"), CFSTR("blocked"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x400) != 0)
    objc_msgSend(v42, "encodeInteger:forKey:", -[CXCallUpdate ttyType](self, "ttyType"), CFSTR("ttyType"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x1000000000000000) != 0)
    objc_msgSend(v42, "encodeInteger:forKey:", -[CXCallUpdate bluetoothAudioFormat](self, "bluetoothAudioFormat"), CFSTR("bluetoothAudioFormat"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x1000) != 0)
    objc_msgSend(v42, "encodeBool:forKey:", -[CXCallUpdate mayRequireBreakBeforeMake](self, "mayRequireBreakBeforeMake"), CFSTR("mayRequireBreakBeforeMake"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x2000) != 0)
    objc_msgSend(v42, "encodeBool:forKey:", -[CXCallUpdate hasVideo](self, "hasVideo"), CFSTR("hasVideo"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x4000) != 0)
  {
    -[CXCallUpdate audioCategory](self, "audioCategory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "encodeObject:forKey:", v12, CFSTR("audioCategory"));

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x8000) != 0)
  {
    -[CXCallUpdate audioMode](self, "audioMode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "encodeObject:forKey:", v13, CFSTR("audioMode"));

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x10000) != 0)
    objc_msgSend(v42, "encodeInteger:forKey:", -[CXCallUpdate audioInterruptionProvider](self, "audioInterruptionProvider"), CFSTR("audioInterruptionProvider"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x20000) != 0)
    objc_msgSend(v42, "encodeInteger:forKey:", -[CXCallUpdate audioInterruptionOperationMode](self, "audioInterruptionOperationMode"), CFSTR("audioInterruptionOperationMode"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x40000) != 0)
    objc_msgSend(v42, "encodeInteger:forKey:", -[CXCallUpdate verificationStatus](self, "verificationStatus"), CFSTR("verificationStatus"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x80000) != 0)
    objc_msgSend(v42, "encodeInteger:forKey:", -[CXCallUpdate priority](self, "priority"), CFSTR("priority"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x100000) != 0)
    objc_msgSend(v42, "encodeBool:forKey:", -[CXCallUpdate requiresInCallSounds](self, "requiresInCallSounds"), CFSTR("requiresInCallSounds"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x200000) != 0)
    objc_msgSend(v42, "encodeInteger:forKey:", -[CXCallUpdate inCallSoundRegion](self, "inCallSoundRegion"), CFSTR("inCallSoundRegion"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x400000) != 0)
    objc_msgSend(v42, "encodeBool:forKey:", -[CXCallUpdate supportsHolding](self, "supportsHolding"), CFSTR("supportsHolding"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x800000) != 0)
    objc_msgSend(v42, "encodeBool:forKey:", -[CXCallUpdate supportsGrouping](self, "supportsGrouping"), CFSTR("supportsGrouping"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x1000000) != 0)
    objc_msgSend(v42, "encodeBool:forKey:", -[CXCallUpdate supportsUngrouping](self, "supportsUngrouping"), CFSTR("supportsUngrouping"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x2000000) != 0)
    objc_msgSend(v42, "encodeBool:forKey:", -[CXCallUpdate supportsDTMF](self, "supportsDTMF"), CFSTR("supportsDTMF"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x4000000) != 0)
    objc_msgSend(v42, "encodeBool:forKey:", -[CXCallUpdate supportsDTMFUpdates](self, "supportsDTMFUpdates"), CFSTR("supportsDTMFUpdates"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x8000000) != 0)
    objc_msgSend(v42, "encodeBool:forKey:", -[CXCallUpdate supportsUnambiguousMultiPartyState](self, "supportsUnambiguousMultiPartyState"), CFSTR("supportsUnambiguousMultiPartyState"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x10000000) != 0)
    objc_msgSend(v42, "encodeBool:forKey:", -[CXCallUpdate supportsAddCall](self, "supportsAddCall"), CFSTR("supportsAddCall"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x20000000) != 0)
    objc_msgSend(v42, "encodeBool:forKey:", -[CXCallUpdate supportsSendingToVoicemail](self, "supportsSendingToVoicemail"), CFSTR("supportsSendingToVoicemail"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x40000000) != 0)
    objc_msgSend(v42, "encodeBool:forKey:", -[CXCallUpdate supportsRecording](self, "supportsRecording"), CFSTR("supportsRecording"));
  -[CXCallUpdate hasSet](self, "hasSet");
  if ((v14 & 0x200) != 0)
    objc_msgSend(v42, "encodeBool:forKey:", -[CXCallUpdate supportsScreening](self, "supportsScreening"), CFSTR("supportsScreening"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x80000000) != 0)
    objc_msgSend(v42, "encodeInteger:forKey:", -[CXCallUpdate videoStreamToken](self, "videoStreamToken"), CFSTR("videoStreamToken"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x100000000) != 0)
  {
    -[CXCallUpdate callTokens](self, "callTokens");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "encodeObject:forKey:", v15, CFSTR("callTokens"));

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x200000000) != 0)
  {
    -[CXCallUpdate announceProviderIdentifier](self, "announceProviderIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "encodeObject:forKey:", v16, CFSTR("announceProviderIdentifier"));

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x400000000) != 0)
  {
    -[CXCallUpdate crossDeviceIdentifier](self, "crossDeviceIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "encodeObject:forKey:", v17, CFSTR("crossDeviceIdentifier"));

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x800000000) != 0)
  {
    -[CXCallUpdate ISOCountryCode](self, "ISOCountryCode");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "encodeObject:forKey:", v18, CFSTR("ISOCountryCode"));

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x1000000000) != 0)
  {
    -[CXCallUpdate localSenderIdentityUUID](self, "localSenderIdentityUUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "encodeObject:forKey:", v19, CFSTR("localSenderIdentityUUID"));

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x2000000000) != 0)
  {
    -[CXCallUpdate localSenderIdentityAccountUUID](self, "localSenderIdentityAccountUUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "encodeObject:forKey:", v20, CFSTR("localSenderIdentityAccountUUID"));

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x4000000000) != 0)
  {
    -[CXCallUpdate localMemberHandleValue](self, "localMemberHandleValue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "encodeObject:forKey:", v21, CFSTR("localMemberHandleValue"));

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x8000000000) != 0)
  {
    -[CXCallUpdate localSenderSubscriptionIdentifier](self, "localSenderSubscriptionIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "encodeObject:forKey:", v22, CFSTR("localSenderSubscriptionIdentifier"));

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x10000000000) != 0)
  {
    -[CXCallUpdate participantGroupUUID](self, "participantGroupUUID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "encodeObject:forKey:", v23, CFSTR("participantGroupUUID"));

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x20000000000) != 0)
  {
    -[CXCallUpdate remoteParticipantHandles](self, "remoteParticipantHandles");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "encodeObject:forKey:", v24, CFSTR("remoteParticipantHandles"));

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x40000000000) != 0)
  {
    -[CXCallUpdate otherInvitedHandles](self, "otherInvitedHandles");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "encodeObject:forKey:", v25, CFSTR("otherInvitedHandles"));

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x80000000000) != 0)
  {
    -[CXCallUpdate activeRemoteParticipantHandles](self, "activeRemoteParticipantHandles");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "encodeObject:forKey:", v26, CFSTR("activeRemoteParticipantHandles"));

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x100000000000) != 0)
  {
    -[CXCallUpdate handoffContext](self, "handoffContext");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "encodeObject:forKey:", v27, CFSTR("handoffContext"));

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x200000000000) != 0)
  {
    -[CXCallUpdate screenShareAttributes](self, "screenShareAttributes");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "encodeObject:forKey:", v28, CFSTR("screenShareAttributes"));

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x400000000000) != 0)
  {
    -[CXCallUpdate context](self, "context");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "encodeObject:forKey:", v29, CFSTR("context"));

  }
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x800000000000) != 0)
    objc_msgSend(v42, "encodeBool:forKey:", -[CXCallUpdate prefersExclusiveAccessToCellularNetwork](self, "prefersExclusiveAccessToCellularNetwork"), CFSTR("prefersExclusiveAccessToCellularNetwork"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x800) != 0)
    objc_msgSend(v42, "encodeBool:forKey:", -[CXCallUpdate supportsTTYWithVoice](self, "supportsTTYWithVoice"), CFSTR("supportsTTYWithVoice"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x1000000000000) != 0)
    objc_msgSend(v42, "encodeBool:forKey:", -[CXCallUpdate isRemoteUplinkMuted](self, "isRemoteUplinkMuted"), CFSTR("remoteUplinkMuted"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x2000000000000) != 0)
    objc_msgSend(v42, "encodeBool:forKey:", -[CXCallUpdate shouldSuppressInCallUI](self, "shouldSuppressInCallUI"), CFSTR("shouldSuppressInCallUI"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x4000000000000) != 0)
    objc_msgSend(v42, "encodeBool:forKey:", -[CXCallUpdate requiresAuthentication](self, "requiresAuthentication"), CFSTR("requiresAuthentication"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x8000000000000) != 0)
    objc_msgSend(v42, "encodeBool:forKey:", -[CXCallUpdate isMutuallyExclusiveCall](self, "isMutuallyExclusiveCall"), CFSTR("mutuallyExclusiveCall"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x10000000000000) != 0)
    objc_msgSend(v42, "encodeInteger:forKey:", -[CXCallUpdate junkConfidence](self, "junkConfidence"), CFSTR("junkConfidence"));
  -[CXCallUpdate hasSet](self, "hasSet");
  if ((v30 & 0x100) != 0)
    objc_msgSend(v42, "encodeInteger:forKey:", -[CXCallUpdate callSubType](self, "callSubType"), CFSTR("callSubType"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x20000000000000) != 0)
    objc_msgSend(v42, "encodeInteger:forKey:", -[CXCallUpdate identificationCategory](self, "identificationCategory"), CFSTR("identificationCategory"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x40000000000000) != 0)
    objc_msgSend(v42, "encodeBool:forKey:", -[CXCallUpdate isConversation](self, "isConversation"), CFSTR("conversation"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x80000000000000) != 0)
    objc_msgSend(v42, "encodeBool:forKey:", -[CXCallUpdate mixesVoiceWithMedia](self, "mixesVoiceWithMedia"), CFSTR("mixesVoiceWithMedia"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x100000000000000) != 0)
    objc_msgSend(v42, "encodeBool:forKey:", -[CXCallUpdate prefersToPlayDuringWombat](self, "prefersToPlayDuringWombat"), CFSTR("prefersToPlayDuringWombat"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x200000000000000) != 0)
    objc_msgSend(v42, "encodeBool:forKey:", -[CXCallUpdate mediaPlaybackOnExternalDevice](self, "mediaPlaybackOnExternalDevice"), CFSTR("mediaPlaybackOnExternalDevice"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x2000000000000000) != 0)
    objc_msgSend(v42, "encodeBool:forKey:", -[CXCallUpdate ignoresBluetoothDeviceUID](self, "ignoresBluetoothDeviceUID"), CFSTR("ignoresBluetoothDeviceUID"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x800000000000000) != 0)
    objc_msgSend(v42, "encodeBool:forKey:", -[CXCallUpdate isSharingScreen](self, "isSharingScreen"), CFSTR("sharingScreen"));
  if ((-[CXCallUpdate hasSet](self, "hasSet") & 0x4000000000000000) != 0)
    objc_msgSend(v42, "encodeInteger:forKey:", -[CXCallUpdate serviceStatus](self, "serviceStatus"), CFSTR("serviceStatus"));
  if (-[CXCallUpdate hasSet](self, "hasSet") < 0)
    objc_msgSend(v42, "encodeInteger:forKey:", -[CXCallUpdate transmissionMode](self, "transmissionMode"), CFSTR("transmissionMode"));
  -[CXCallUpdate hasSet](self, "hasSet");
  if ((v31 & 1) != 0)
    objc_msgSend(v42, "encodeBool:forKey:", -[CXCallUpdate accessoryButtonEventsEnabled](self, "accessoryButtonEventsEnabled"), CFSTR("accessoryButtonEventsEnabled"));
  -[CXCallUpdate hasSet](self, "hasSet");
  if ((v32 & 2) != 0)
    objc_msgSend(v42, "encodeBool:forKey:", -[CXCallUpdate isSendingVideo](self, "isSendingVideo"), CFSTR("sendingVideo"));
  -[CXCallUpdate hasSet](self, "hasSet");
  if ((v33 & 0x40) != 0)
    objc_msgSend(v42, "encodeBool:forKey:", -[CXCallUpdate isReRing](self, "isReRing"), CFSTR("isReRing"));
  -[CXCallUpdate hasSet](self, "hasSet");
  if (v34 < 0)
    objc_msgSend(v42, "encodeBool:forKey:", -[CXCallUpdate suppressRingtone](self, "suppressRingtone"), CFSTR("suppressRingtone"));
  -[CXCallUpdate hasSet](self, "hasSet");
  if ((v35 & 4) != 0)
    objc_msgSend(v42, "encodeBool:forKey:", -[CXCallUpdate hasBeenRedirected](self, "hasBeenRedirected"), CFSTR("hasBeenRedirected"));
  -[CXCallUpdate hasSet](self, "hasSet");
  if ((v36 & 8) != 0)
    objc_msgSend(v42, "encodeBool:forKey:", -[CXCallUpdate isKnownCaller](self, "isKnownCaller"), CFSTR("isKnownCaller"));
  -[CXCallUpdate hasSet](self, "hasSet");
  if ((v37 & 0x10) != 0)
    objc_msgSend(v42, "encodeInteger:forKey:", -[CXCallUpdate filteredOutReason](self, "filteredOutReason"), CFSTR("filteredOutReason"));
  -[CXCallUpdate hasSet](self, "hasSet");
  if ((v38 & 0x400) != 0)
    objc_msgSend(v42, "encodeInteger:forKey:", -[CXCallUpdate screenSharingIntention](self, "screenSharingIntention"), CFSTR("screenSharingIntention"));
  -[CXCallUpdate hasSet](self, "hasSet");
  if ((v39 & 0x20) != 0)
  {
    -[CXCallUpdate silencingUserInfo](self, "silencingUserInfo");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "encodeObject:forKey:", v40, CFSTR("silencingUserInfo"));

  }
  -[CXCallUpdate hasSet](self, "hasSet");
  if ((v41 & 0x800) != 0)
    objc_msgSend(v42, "encodeInteger:forKey:", -[CXCallUpdate screenSharingType](self, "screenSharingType"), CFSTR("screenSharingType"));

}

- (void)setSilencingUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_silencingUserInfo, a3);
}

- (BOOL)isEmergency
{
  return self->_emergency;
}

- (BOOL)isFailureExpected
{
  return self->_failureExpected;
}

- (BOOL)isUsingBaseband
{
  return self->_usingBaseband;
}

- (BOOL)isBlocked
{
  return self->_blocked;
}

- (BOOL)isRemoteUplinkMuted
{
  return self->_remoteUplinkMuted;
}

- (BOOL)isMutuallyExclusiveCall
{
  return self->_mutuallyExclusiveCall;
}

- (BOOL)isConversation
{
  return self->_conversation;
}

- (BOOL)isOneToOneModeEnabled
{
  return self->_oneToOneModeEnabled;
}

- (BOOL)isSharingScreen
{
  return self->_sharingScreen;
}

- (BOOL)isSendingVideo
{
  return self->_sendingVideo;
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (CXCallUpdateHasSet)hasSet
{
  int v2;
  uint64_t hasSet;
  CXCallUpdateHasSet result;

  v2 = *((_DWORD *)&self->_hasSet + 2);
  hasSet = (uint64_t)self->_hasSet;
  return result;
}

- (void)setHasSet:(CXCallUpdateHasSet)a3
{
  self->_hasSet = a3;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
  objc_storeStrong((id *)&self->_UUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_screenShareAttributes, 0);
  objc_storeStrong((id *)&self->_handoffContext, 0);
  objc_storeStrong((id *)&self->_activeRemoteParticipantHandles, 0);
  objc_storeStrong((id *)&self->_otherInvitedHandles, 0);
  objc_storeStrong((id *)&self->_remoteParticipantHandles, 0);
  objc_storeStrong((id *)&self->_participantGroupUUID, 0);
  objc_storeStrong((id *)&self->_localSenderSubscriptionIdentifier, 0);
  objc_storeStrong((id *)&self->_localMemberHandleValue, 0);
  objc_storeStrong((id *)&self->_localSenderIdentityAccountUUID, 0);
  objc_storeStrong((id *)&self->_localSenderIdentityUUID, 0);
  objc_storeStrong((id *)&self->_ISOCountryCode, 0);
  objc_storeStrong((id *)&self->_crossDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_announceProviderIdentifier, 0);
  objc_storeStrong((id *)&self->_callTokens, 0);
  objc_storeStrong((id *)&self->_audioMode, 0);
  objc_storeStrong((id *)&self->_audioCategory, 0);
  objc_storeStrong((id *)&self->_localizedCallerName, 0);
  objc_storeStrong((id *)&self->_remoteHandle, 0);
  objc_storeStrong((id *)&self->_activeRemoteParticipant, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_silencingUserInfo, 0);
  objc_storeStrong((id *)&self->_localizedCallerImageURL, 0);
}

@end
