@implementation MXCoreSessionSecure

- (MXCoreSessionSecure)initWithOptions:(id)a3
{
  MXCoreSessionSecure *v4;
  void *v5;
  __int128 v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned int v11;
  unsigned int v12;
  NSObject *v13;
  unsigned int v14;
  unsigned int v15;
  NSObject *v16;
  objc_super v18;
  unsigned int v19;
  __int128 v20;
  __int128 v21;
  id location[2];
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)MXCoreSessionSecure;
  v4 = -[MXCoreSessionBase init](&v18, sel_init);
  if (!v4)
    return v4;
  if (!a3)
  {
    v19 = 0;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v11 = v19;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT))
      v12 = v11;
    else
      v12 = v11 & 0xFFFFFFFE;
    if (!v12)
      goto LABEL_23;
LABEL_13:
    LODWORD(v20) = 136315138;
    *(_QWORD *)((char *)&v20 + 4) = "-[MXCoreSessionSecure initWithOptions:]";
    _os_log_send_and_compose_impl();
LABEL_23:
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    return 0;
  }
  if (!CMSMDeviceState_DeviceHasExclaveCapability())
  {
    v19 = 0;
    v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v14 = v19;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      v15 = v14;
    else
      v15 = v14 & 0xFFFFFFFE;
    if (!v15)
      goto LABEL_23;
    goto LABEL_13;
  }
  v5 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("AuditToken"));
  *(_QWORD *)&v6 = -1;
  *((_QWORD *)&v6 + 1) = -1;
  v20 = v6;
  v21 = v6;
  objc_msgSend(v5, "getBytes:length:", &v20, 32);
  v7 = (void *)xpc_copy_entitlement_for_token();
  if (!v7
    || (*(_OWORD *)location = v20,
        v23 = v21,
        -[MXCoreSessionBase setAuditToken:](v4, "setAuditToken:", location),
        xpc_release(v7),
        v8 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("IsolatedAudioUseCaseID")), "unsignedIntValue"),
        v9 = v8,
        !(_DWORD)v8))
  {
    v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    goto LABEL_23;
  }
  if ((_DWORD)v8 == 1936290409)
    -[MXCoreSessionBase setIsTheAssistant:](v4, "setIsTheAssistant:", 1);
  -[MXCoreSessionSecure setIsolatedAudioUseCaseID:](v4, "setIsolatedAudioUseCaseID:", v9);
  -[MXCoreSessionSecure updateEntitlements](v4, "updateEntitlements");
  v4->mMXSessionSecureList = (NSPointerArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3868]), "initWithOptions:", 5);
  v4->mMXSessionSecureListLock = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
  objc_initWeak(location, v4);
  -[MXSessionManagerSecure addMXCoreSessionSecure:](+[MXSessionManagerSecure sharedInstance](MXSessionManagerSecure, "sharedInstance"), "addMXCoreSessionSecure:", objc_loadWeak(location));
  objc_destroyWeak(location);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[MXSessionManagerSecure addMXCoreSessionSecure:](+[MXSessionManagerSecure sharedInstance](MXSessionManagerSecure, "sharedInstance"), "addMXCoreSessionSecure:", 0);

  self->mMXSessionSecureList = 0;
  self->mMXSessionSecureListLock = 0;
  v3.receiver = self;
  v3.super_class = (Class)MXCoreSessionSecure;
  -[MXCoreSessionBase dealloc](&v3, sel_dealloc);
}

- (unint64_t)addMXSessionSecure:(id)a3
{
  unint64_t v4;
  id location;

  objc_initWeak(&location, a3);
  -[NSLock lock](self->mMXSessionSecureListLock, "lock");
  -[NSPointerArray addPointer:](self->mMXSessionSecureList, "addPointer:", objc_loadWeak(&location));
  -[NSPointerArray compact](self->mMXSessionSecureList, "compact");
  v4 = -[NSPointerArray count](self->mMXSessionSecureList, "count");
  -[NSLock unlock](self->mMXSessionSecureListLock, "unlock");
  objc_destroyWeak(&location);
  return v4;
}

- (unint64_t)removeMXSessionSecure:(id)a3
{
  unint64_t i;
  unint64_t v5;
  id location;

  objc_initWeak(&location, a3);
  -[NSLock lock](self->mMXSessionSecureListLock, "lock");
  for (i = 0; i < -[NSPointerArray count](self->mMXSessionSecureList, "count"); ++i)
  {
    if (objc_msgSend(-[NSPointerArray pointerAtIndex:](self->mMXSessionSecureList, "pointerAtIndex:", i), "isEqual:", objc_loadWeak(&location)))
    {
      -[NSPointerArray removePointerAtIndex:](self->mMXSessionSecureList, "removePointerAtIndex:", i);
      -[NSPointerArray compact](self->mMXSessionSecureList, "compact");
      break;
    }
  }
  v5 = -[NSPointerArray count](self->mMXSessionSecureList, "count");
  -[NSLock unlock](self->mMXSessionSecureListLock, "unlock");
  objc_destroyWeak(&location);
  return v5;
}

- (id)copyMXSessionSecureList
{
  void *v3;
  NSArray *v4;

  v3 = (void *)MEMORY[0x194035B20](-[NSLock lock](self->mMXSessionSecureListLock, "lock"));
  v4 = -[NSPointerArray allObjects](self->mMXSessionSecureList, "allObjects");
  objc_autoreleasePoolPop(v3);
  -[NSLock unlock](self->mMXSessionSecureListLock, "unlock");
  return v4;
}

- (int)copyPropertyForKey:(id)a3 valueOut:(id *)a4
{
  NSArray *v7;
  NSDictionary *v8;
  NSArray *v9;
  int v10;
  id v12;
  uint64_t DeviceBufferNumPCMFrames;
  NSObject *v14;
  AudioObjectID CurrentInputVADID;
  id v16;
  uint64_t v17;
  double v18;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _OWORD v20[8];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) || !a4)
  {
    v10 = FigSignalErrorAt();
    if (!v10)
      return v10;
    goto LABEL_34;
  }
  if (!objc_msgSend(a3, "isEqualToString:", CFSTR("AudioBehaviour")))
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("CurrentInputSampleRate")))
    {
      v8 = -[MXSessionManager devicesSampleRates](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "devicesSampleRates");
      v7 = -[NSDictionary objectForKey:](v8, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", CMSUtility_GetCurrentInputVADID(self)));
      goto LABEL_14;
    }
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("AudioCategory")))
    {
      v7 = -[MXCoreSessionBase audioCategory](self, "audioCategory");
      goto LABEL_14;
    }
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("ReporterIDs")))
    {
      CMSUtility_CreateReporterIDIfNeeded(self);
      v7 = -[MXCoreSessionBase reporterIDs](self, "reporterIDs");
      goto LABEL_14;
    }
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("AudioMode")))
    {
      v7 = -[MXCoreSessionBase audioMode](self, "audioMode");
      goto LABEL_14;
    }
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("AuditToken")))
    {
      memset(v20, 0, 32);
      if (self)
        -[MXCoreSessionBase auditToken](self, "auditToken");
      v9 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v20, 32);
      goto LABEL_15;
    }
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("ClientName")))
    {
      v7 = -[MXCoreSessionBase clientName](self, "clientName");
      goto LABEL_14;
    }
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("ClientPID")))
    {
      v7 = -[MXCoreSessionBase clientPID](self, "clientPID");
      goto LABEL_14;
    }
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("ClientPriority")))
    {
      v9 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", 0);
      goto LABEL_15;
    }
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("AudioSessionID")))
    {
      v12 = objc_alloc(MEMORY[0x1E0CB37E8]);
      DeviceBufferNumPCMFrames = -[MXCoreSessionBase audioSessionID](self, "audioSessionID");
LABEL_29:
      v9 = (NSArray *)objc_msgSend(v12, "initWithUnsignedInt:", DeviceBufferNumPCMFrames);
      goto LABEL_15;
    }
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("CoreSessionID")))
    {
      v7 = -[MXCoreSessionBase ID](self, "ID");
      goto LABEL_14;
    }
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("IsActive")))
    {
      v9 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", -[MXCoreSessionBase isActive](self, "isActive"));
      goto LABEL_15;
    }
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("CurrentInputDeviceBufferSize")))
    {
      v12 = objc_alloc(MEMORY[0x1E0CB37E8]);
      CurrentInputVADID = CMSUtility_GetCurrentInputVADID(self);
      DeviceBufferNumPCMFrames = vaemGetDeviceBufferNumPCMFrames(CurrentInputVADID, 0x696E7074u);
      goto LABEL_29;
    }
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("CurrentInputLatency")))
    {
      v16 = objc_alloc(MEMORY[0x1E0CB37E8]);
      v17 = CMSUtility_GetCurrentInputVADID(self);
      *(float *)&v18 = vaemGetCurrentLatencyForVADIDAndScope(v17, 1);
      v9 = (NSArray *)objc_msgSend(v16, "initWithFloat:", v18);
      goto LABEL_15;
    }
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v10 = -12984;
LABEL_34:
    v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return v10;
  }
  v7 = -[MXCoreSessionBase audioBehaviour](self, "audioBehaviour");
LABEL_14:
  v9 = v7;
LABEL_15:
  v10 = 0;
  *a4 = v9;
  return v10;
}

- (int)setPropertyForKey:(id)a3 value:(id)a4
{
  __int128 v7;
  int v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSString *v11;
  NSString *v12;
  int v13;
  unsigned int v14;
  int v15;
  NSObject *v16;
  int v17;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  _OWORD v21[2];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a3)
    goto LABEL_52;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_52;
  if (!objc_msgSend(a3, "isEqualToString:", CFSTR("AuditToken")))
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("ClientName")))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[MXCoreSessionBase updateClientName:](self, "updateClientName:", a4);
        return 0;
      }
      goto LABEL_52;
    }
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("ClientPID")))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(a4, "unsignedIntValue"))
        goto LABEL_52;
      if (-[NSNumber isEqualToNumber:](-[MXCoreSessionBase clientPID](self, "clientPID"), "isEqualToNumber:", a4))
        return 0;
      -[MXCoreSessionBase setClientPID:](self, "setClientPID:", a4);
      CMSessionMgrCopyDisplayIdentifierToSession(self);
      goto LABEL_42;
    }
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("ReporterIDs")))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (!-[NSArray isEqualToArray:](-[MXCoreSessionBase reporterIDs](self, "reporterIDs"), "isEqualToArray:", a4))
        {
          -[MXCoreSessionBase setReporterIDs:](self, "setReporterIDs:", a4);
          if (dword_1EE2B3F38)
          {
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          CMSMNotificationUtility_PostReporterIDsDidChange(self);
        }
        return 0;
      }
      goto LABEL_52;
    }
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("AudioCategory")))
    {
      v11 = -[MXCoreSessionBase audioCategory](self, "audioCategory");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_52;
      -[MXCoreSessionBase setAudioCategory:](self, "setAudioCategory:", a4);
      if (-[NSString isEqualToString:](v11, "isEqualToString:", a4))
        return 0;
LABEL_42:
      if (!-[MXCoreSessionBase isActive](self, "isActive"))
        return 0;
      v17 = -[MXAdditiveRoutingManager sendActiveSessionsInfoToVA](+[MXAdditiveRoutingManager sharedInstance](MXAdditiveRoutingManager, "sharedInstance"), "sendActiveSessionsInfoToVA");
      goto LABEL_44;
    }
    if (!objc_msgSend(a3, "isEqualToString:", CFSTR("AudioMode")))
    {
      if (objc_msgSend(a3, "isEqualToString:", CFSTR("AudioSessionID")))
      {
        v14 = -[MXCoreSessionBase audioSessionID](self, "audioSessionID");
        if (a4)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_52;
          v15 = objc_msgSend(a4, "unsignedIntValue");
        }
        else
        {
          v15 = 0;
        }
        if (v14 == v15)
          return 0;
        -[MXCoreSessionBase setAudioSessionID:](self, "setAudioSessionID:");
        goto LABEL_42;
      }
      v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      v8 = -12984;
LABEL_51:
      v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      return v8;
    }
    v12 = -[MXCoreSessionBase audioMode](self, "audioMode");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || objc_msgSend(a4, "isEqualToString:", CFSTR("Enrollment"))
      && !-[MXCoreSessionSecure hasEntitlementToSetEnrollmentMode](self, "hasEntitlementToSetEnrollmentMode"))
    {
      goto LABEL_52;
    }
    -[MXCoreSessionBase setAudioMode:](self, "setAudioMode:", a4);
    if (-[NSString isEqualToString:](v12, "isEqualToString:", a4) || !-[MXCoreSessionBase isActive](self, "isActive"))
      return 0;
    if (-[NSString isEqualToString:](v12, "isEqualToString:", CFSTR("Enrollment")))
    {
      v13 = -[MXSessionManager updateSecureSpeakerMuteState:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "updateSecureSpeakerMuteState:", 0);
    }
    else
    {
      if (!objc_msgSend(a4, "isEqualToString:", CFSTR("Enrollment")))
        goto LABEL_49;
      v13 = -[MXCoreSessionSecure _beginInterruptionWithSecTask:andFlags:](self, "_beginInterruptionWithSecTask:andFlags:", 0, 2);
    }
    v8 = v13;
    if (v13)
    {
LABEL_50:
      -[MXCoreSessionBase setAudioMode:](self, "setAudioMode:", v12);
      goto LABEL_51;
    }
LABEL_49:
    v8 = -[MXAdditiveRoutingManager sendActiveSessionsInfoToVA](+[MXAdditiveRoutingManager sharedInstance](MXAdditiveRoutingManager, "sharedInstance"), "sendActiveSessionsInfoToVA");
    if (!v8)
      return v8;
    goto LABEL_50;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_52:
    v17 = FigSignalErrorAt();
LABEL_44:
    v8 = v17;
    if (!v17)
      return v8;
    goto LABEL_51;
  }
  *(_QWORD *)&v7 = -1;
  *((_QWORD *)&v7 + 1) = -1;
  v19 = v7;
  v20 = v7;
  objc_msgSend(a4, "getBytes:length:", &v19, 32);
  v21[0] = v19;
  v21[1] = v20;
  -[MXCoreSessionBase setAuditToken:](self, "setAuditToken:", v21);
  -[MXCoreSessionSecure updateEntitlements](self, "updateEntitlements");
  return 0;
}

- (int)_beginInterruptionWithSecTask:(__SecTask *)a3 andFlags:(unint64_t)a4
{
  return -[MXSessionManagerSecure _beginInterruption:withSecTask:andFlags:](+[MXSessionManagerSecure sharedInstance](MXSessionManagerSecure, "sharedInstance"), "_beginInterruption:withSecTask:andFlags:", self, a3, a4);
}

- (int)_endInterruptionWithSecTask:(__SecTask *)a3 andStatus:(id)a4
{
  return -[MXSessionManagerSecure _endInterruption:withSecTask:andStatus:](+[MXSessionManagerSecure sharedInstance](MXSessionManagerSecure, "sharedInstance"), "_endInterruption:withSecTask:andStatus:", self, a3, a4);
}

- (void)updateEntitlements
{
  uint64_t v3;
  void *v4;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (self)
    -[MXCoreSessionBase auditToken](self, "auditToken");
  -[MXCoreSessionSecure setHasEntitlementToSetEnrollmentMode:](self, "setHasEntitlementToSetEnrollmentMode:", 0);
  if (-[MXCoreSessionSecure isolatedAudioUseCaseID](self, "isolatedAudioUseCaseID") == 1936614497)
  {
    v3 = xpc_copy_entitlement_for_token();
    if (v3)
    {
      v4 = (void *)v3;
      -[MXCoreSessionSecure setHasEntitlementToSetEnrollmentMode:](self, "setHasEntitlementToSetEnrollmentMode:", 1);
      xpc_release(v4);
    }
    else
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
}

- (id)getIsolatedAudioUseCaseIDAsString
{
  int v3;

  v3 = -[MXCoreSessionSecure isolatedAudioUseCaseID](self, "isolatedAudioUseCaseID");
  if (v3 <= 1936290408)
  {
    if (!v3)
      return CFSTR("Unknown");
    if (v3 == 1836346212)
      return CFSTR("MutedTalkerDetection");
  }
  else
  {
    switch(v3)
    {
      case 1986225004:
        return CFSTR("VoiceControl");
      case 1936614497:
        return CFSTR("SoundAnalysis");
      case 1936290409:
        return CFSTR("Siri");
    }
  }
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown [%c%c%c%c]"), -[MXCoreSessionSecure isolatedAudioUseCaseID](self, "isolatedAudioUseCaseID") >> 24, (-[MXCoreSessionSecure isolatedAudioUseCaseID](self, "isolatedAudioUseCaseID") >> 16), ((unsigned __int16)-[MXCoreSessionSecure isolatedAudioUseCaseID](self, "isolatedAudioUseCaseID") >> 8), -[MXCoreSessionSecure isolatedAudioUseCaseID](self, "isolatedAudioUseCaseID"));
}

- (BOOL)updateAudioBehaviourFromVARouteConfig:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v14;
  BOOL v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "objectForKey:", 0x1E30A87E8);
  v6 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", 0x1E30A8828), "count");
  v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", 0x1E30A8848), "count");
  if (v5)
  {
    v8 = v7;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v5, 0);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", -[MXCoreSessionBase audioBehaviour](self, "audioBehaviour"));
    v11 = v10;
    if (v6)
      objc_msgSend(v10, "setObject:forKey:", v9, CFSTR("AudioBehaviour_Source"));
    if (v8)
    {
      -[MXCoreSessionBase setAudioDestinationPriority:](self, "setAudioDestinationPriority:", v9);
      objc_msgSend(v11, "setObject:forKey:", v9, CFSTR("AudioBehaviour_Destination"));
    }
    v12 = -[NSDictionary isEqualToDictionary:](-[MXCoreSessionBase audioBehaviour](self, "audioBehaviour"), "isEqualToDictionary:", v11);
    if (!v12)
    {
      if (dword_1EE2B3F38)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      -[MXCoreSessionBase setAudioBehaviour:](self, "setAudioBehaviour:", v11, v17, v18);
      CMSMNotificationUtility_PostSessionAudioBehaviourDidChange(self);
      CMSMVAUtility_UpdateSessionInfoAndReporterIDsOnVA(self, 0);
    }
    v15 = !v12;

  }
  else
  {
    v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return 0;
  }
  return v15;
}

- (void)logDebugInfo
{
  id v2;
  void *v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  NSObject *v14;
  unsigned int v15;
  unsigned int v16;
  NSObject *v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  os_log_type_t type;
  unsigned int v27;
  _BYTE v28[128];
  int v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = -[MXCoreSessionSecure copyMXSessionSecureList](self, "copyMXSessionSecureList");
  v3 = CMSMUtility_CopyPrioritizedListBasedOnPlayingAndActiveState(v2);
  if (dword_1EE2B3F38)
  {
    v27 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (dword_1EE2B3F38)
    {
      v27 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      if (dword_1EE2B3F38)
      {
        v27 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        if (dword_1EE2B3F38)
        {
          v27 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          if (dword_1EE2B3F38)
          {
            v27 = 0;
            type = OS_LOG_TYPE_DEFAULT;
            v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            if (dword_1EE2B3F38)
            {
              v27 = 0;
              type = OS_LOG_TYPE_DEFAULT;
              v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
          }
        }
      }
    }
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v28, 16, v20, v21);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "logDebugInfo");
      }
      v11 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v11);
  }
  if (dword_1EE2B3F38)
  {
    v27 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v15 = v27;
    if (os_log_type_enabled(v14, type))
      v16 = v15;
    else
      v16 = v15 & 0xFFFFFFFE;
    if (v16)
    {
      v29 = 136315138;
      v30 = "-[MXCoreSessionSecure logDebugInfo]";
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (dword_1EE2B3F38)
    {
      v27 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      v17 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v18 = v27;
      if (os_log_type_enabled(v17, type))
        v19 = v18;
      else
        v19 = v18 & 0xFFFFFFFE;
      if (v19)
      {
        v29 = 136315138;
        v30 = "-[MXCoreSessionSecure logDebugInfo]";
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }

}

- (unsigned)isolatedAudioUseCaseID
{
  return self->_isolatedAudioUseCaseID;
}

- (void)setIsolatedAudioUseCaseID:(unsigned int)a3
{
  self->_isolatedAudioUseCaseID = a3;
}

- (BOOL)hasEntitlementToSetEnrollmentMode
{
  return self->_hasEntitlementToSetEnrollmentMode;
}

- (void)setHasEntitlementToSetEnrollmentMode:(BOOL)a3
{
  self->_hasEntitlementToSetEnrollmentMode = a3;
}

@end
