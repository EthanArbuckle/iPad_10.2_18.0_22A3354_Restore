@implementation MXCoreSessionBase

- (BOOL)hasPhoneCallBehavior
{
  return self->_hasPhoneCallBehavior;
}

- (NSString)clientName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSNumber)clientPID
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (BOOL)isPlaying
{
  return self->_isPlaying;
}

- (id)info
{
  NSNumber *v3;
  NSString *v4;
  NSString *v5;
  NSString *v6;
  NSString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  NSNumber *v12;
  void *v13;

  v13 = (void *)MEMORY[0x1E0CB3940];
  v12 = -[MXCoreSessionBase ID](self, "ID");
  v3 = -[MXCoreSessionBase clientPID](self, "clientPID");
  v4 = -[MXCoreSessionBase clientName](self, "clientName");
  v5 = -[MXCoreSessionBase displayID](self, "displayID");
  v6 = -[MXCoreSessionBase audioCategory](self, "audioCategory");
  v7 = -[MXCoreSessionBase audioMode](self, "audioMode");
  if (-[MXCoreSessionBase isActive](self, "isActive"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (-[MXCoreSessionBase isPlaying](self, "isPlaying"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  if (-[MXCoreSessionBase isRecording](self, "isRecording"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  return (id)objc_msgSend(v13, "stringWithFormat:", CFSTR("<ID: %@, PID = %@, Name = %@, BundleID = %@, Category = %@, Mode = %@, Active = %@, Playing = %@, Recording = %@>"), v12, v3, v4, v5, v6, v7, v8, v9, v10);
}

- (NSNumber)ID
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (BOOL)hasAudioCategory:(id)a3
{
  return -[NSString isEqualToString:](-[MXCoreSessionBase audioCategory](self, "audioCategory"), "isEqualToString:", a3);
}

- (NSString)audioCategory
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setHasInput:(BOOL)a3
{
  self->_hasInput = a3;
}

- (BOOL)isEligibleForBTSmartRoutingConsideration
{
  return self->_isEligibleForBTSmartRoutingConsideration;
}

- (void)setMixesWithEveryone:(BOOL)a3
{
  self->_mixesWithEveryone = a3;
}

- (void)setHasPhoneCallBehavior:(BOOL)a3
{
  self->_hasPhoneCallBehavior = a3;
}

- (BOOL)isTheAssistant
{
  return self->_isTheAssistant;
}

- (BOOL)enableBluetoothRecordingPreference
{
  return self->_enableBluetoothRecordingPreference;
}

- (BOOL)reporterStarted
{
  return self->_reporterStarted;
}

- (NSDictionary)audioBehaviour
{
  return (NSDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (NSArray)audioDestinationPriority
{
  return (NSArray *)objc_getProperty(self, a2, 128, 1);
}

- (unsigned)applicationState
{
  return self->_applicationState;
}

- (NSArray)reporterIDs
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setReporterIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void)setOriginalReporterIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSArray)originalReporterIDs
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (BOOL)isRecording
{
  return self->_isRecording;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  __int128 v3;

  v3 = *(_OWORD *)&self[5].var0[4];
  *(_OWORD *)retstr->var0 = *(_OWORD *)self[5].var0;
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (NSDictionary)additiveRoutingInfo
{
  NSDictionary *v3;
  int v4;
  uint64_t v5;
  __CFString **v6;
  uint64_t v7;
  __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (!-[MXCoreSessionBase audioSessionID](self, "audioSessionID"))
    return 0;
  v3 = (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  if (-[MXCoreSessionBase displayID](self, "displayID"))
    -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", -[MXCoreSessionBase displayID](self, "displayID"), 0x1E30A8288);
  -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MXCoreSessionBase audioSessionID](self, "audioSessionID")), 0x1E30A82A8);
  -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", -[MXSessionManager getUncustomizedCategory:](+[MXSessionManager sharedInstance](MXSessionManager, "sharedInstance"), "getUncustomizedCategory:", -[MXCoreSessionBase audioCategory](self, "audioCategory")), 0x1E30A7FA8);
  -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", -[MXCoreSessionBase audioMode](self, "audioMode"), 0x1E30A7F88);
  if (-[MXCoreSessionBase isTheAssistant](self, "isTheAssistant"))
    -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MXCoreSessionBase isTheAssistant](self, "isTheAssistant")), 0x1E30A1F28);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (-[MXCoreSessionBase activationContext](self, "activationContext"))
      -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", -[MXCoreSessionBase activationContext](self, "activationContext"), 0x1E30A82E8);
    -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MXCoreSessionBase clientPriority](self, "clientPriority")), 0x1E30A82C8);
    if (-[MXCoreSessionBase preferredRouteControlFeatures](self, "preferredRouteControlFeatures"))
    {
      v4 = objc_msgSend((id)objc_msgSend((id)-[MXCoreSessionBase preferredRouteControlFeatures](self, "preferredRouteControlFeatures"), "objectForKey:", CFSTR("RouteControlFeatures")), "unsignedIntValue");
      if (v4 == 1)
      {
        v5 = MEMORY[0x1E0C9AAB0];
        v6 = kVirtualAudioPlugInSessionDescriptionPreferIndependentRoute_CFString;
      }
      else
      {
        if (v4 != 2)
          goto LABEL_19;
        -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("prefer independent route"));
        v5 = MEMORY[0x1E0C9AAA0];
        v6 = kVirtualAudioPlugInSessionDescriptionSharingKey_CFString;
      }
      -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", v5, *v6);
    }
LABEL_19:
    if (-[MXCoreSessionBase prefersEchoCancelledInput](self, "prefersEchoCancelledInput"))
      -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", 0x1E30A8368, 0x1E30A7F88);
    v9 = MEMORY[0x1E0C9AAB0];
    if (-[MXCoreSessionBase allowsBluetoothRecordingCustomization](self, "allowsBluetoothRecordingCustomization"))
    {
      if (-[MXCoreSessionBase shouldEnableBluetoothRecording](self, "shouldEnableBluetoothRecording"))
        v10 = MEMORY[0x1E0C9AAA0];
      else
        v10 = v9;
      -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", v10, 0x1E30A8148);
    }
    if (-[MXCoreSessionBase allowsDefaultBuiltInRouteCustomization](self, "allowsDefaultBuiltInRouteCustomization"))
    {
      if (objc_msgSend((id)-[MXCoreSessionBase defaultBuiltInRouteToUse](self, "defaultBuiltInRouteToUse"), "isEqualToString:", CFSTR("Speaker")))v11 = v9;
      else
        v11 = MEMORY[0x1E0C9AAA0];
      -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", v11, 0x1E30A8128);
    }
    if (-[MXCoreSessionBase allowedPortTypes](self, "allowedPortTypes"))
    {
      v7 = -[MXCoreSessionBase allowedPortTypes](self, "allowedPortTypes");
      v8 = CFSTR("allowed port types");
      goto LABEL_33;
    }
    return v3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MXCoreSessionBase isolatedAudioUseCaseID](self, "isolatedAudioUseCaseID"));
    v8 = CFSTR("isolated use case ID");
LABEL_33:
    -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", v7, v8);
    return v3;
  }
  MXSimulateCrash((uint64_t)"This is an abstract method and should be overriden! Please file a radar against 'MediaExperie"
                           "nce Session | All'");
  return v3;
}

- (NSString)audioMode
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (void)setAudioDestinationPriority:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (void)setAudioBehaviour:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (void)setEnableBluetoothRecordingPreference:(BOOL)a3
{
  self->_enableBluetoothRecordingPreference = a3;
}

- (BOOL)isRoutedToOnDemandVAD
{
  int v3;

  v3 = -[__CFString containsString:](CMSUtility_GetCurrentInputVADUID(self), "containsString:", 0x1E30A4CA8);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    && !CMSMUtility_IsCategoryInputOnly(-[MXCoreSessionBase audioCategory](self, "audioCategory")))
  {
    return -[__CFString containsString:](CMSUtility_GetCurrentAudioDestination(self), "containsString:", 0x1E30A4CA8) | v3;
  }
  return v3;
}

- (void)setAudioCategory:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void)updateClientName:(id)a3
{
  MXCoreSessionBase *v3;
  id v4;
  uint64_t v5;
  id v7;

  v3 = self;
  if (a3)
  {
    v4 = a3;
    v5 = -[MXCoreSessionBase audioSessionID](self, "audioSessionID");
    if (objc_msgSend(v4, "rangeOfString:options:", CFSTR("sid:"), 1) == 0x7FFFFFFFFFFFFFFFLL && (_DWORD)v5 != 0)
    {
      v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("'sid:0x%x', %@"), v5, v4);
      -[MXCoreSessionBase setClientName:](v3, "setClientName:", v7);

      return;
    }
    self = v3;
    a3 = v4;
  }
  -[MXCoreSessionBase setClientName:](self, "setClientName:", a3);
}

- (void)setClientName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void)setDisplayID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void)setRoutingContextUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (void)setReporterStarted:(BOOL)a3
{
  self->_reporterStarted = a3;
}

- (void)setActiveOSTransaction:(id)a3
{
  self->_activeOSTransaction = (OS_os_transaction *)a3;
}

- (void)setClientPID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void)setInterruptionFadeDuration:(float)a3
{
  self->_interruptionFadeDuration = a3;
}

- (void)setApplicationState:(unsigned int)a3
{
  self->_applicationState = a3;
}

- (BOOL)hasAudioMode:(id)a3
{
  return -[NSString isEqualToString:](-[MXCoreSessionBase audioMode](self, "audioMode"), "isEqualToString:", a3);
}

- (void)setIsPlaying:(BOOL)a3
{
  self->_isPlaying = a3;
}

- (NSString)routingContextUUID
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (NSString)displayID
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)updateDefaultInterruptionFadeDuration:(id)a3
{
  float v5;
  double v6;

  if (-[MXCoreSessionBase isSidekick](self, "isSidekick"))
    v5 = 5.0;
  else
    v5 = 2.0;
  if (-[MXCoreSessionBase hasAudioMode:](self, "hasAudioMode:", CFSTR("Sleep")))
  {
    -[MXCoreSessionBase interruptionFadeDuration](self, "interruptionFadeDuration");
    if (*(float *)&v6 == 0.7)
      goto LABEL_9;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("Sleep")))
  {
    -[MXCoreSessionBase interruptionFadeDuration](self, "interruptionFadeDuration");
    if (*(float *)&v6 == v5)
    {
      v5 = *(float *)"333?";
LABEL_9:
      *(float *)&v6 = v5;
      -[MXCoreSessionBase setInterruptionFadeDuration:](self, "setInterruptionFadeDuration:", v6);
    }
  }
}

- (void)setAudioMode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)isSidekick
{
  return -[MXCoreSessionBase isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class());
}

- (void)setIsActive:(BOOL)a3
{
  uint64_t v5;

  if (a3)
    v5 = objc_msgSend(MEMORY[0x1E0C99D68], "date");
  else
    v5 = 0;
  -[MXCoreSessionBase setTimestampWhenMostRecentlyActivated:](self, "setTimestampWhenMostRecentlyActivated:", v5);
  self->_isActive = a3;
}

- (void)setTimestampWhenMostRecentlyActivated:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (BOOL)hasInput
{
  return self->_hasInput;
}

- (OS_os_transaction)activeOSTransaction
{
  return self->_activeOSTransaction;
}

- (MXCoreSessionBase)init
{
  char *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MXCoreSessionBase;
  v2 = -[MXCoreSessionBase init](&v4, sel_init);
  if (v2)
  {
    *((_QWORD *)v2 + 11) = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", FigAtomicIncrement64());
    v2[9] = 0;
    *(_WORD *)(v2 + 19) = 0;
    *((_QWORD *)v2 + 6) = CFSTR("SoloAmbientSound");
    *((_QWORD *)v2 + 7) = CFSTR("Default");
    *((_WORD *)v2 + 6) = 0;
    v2[8] = 0;
    *((_QWORD *)v2 + 17) = 0;
    *((_QWORD *)v2 + 12) = 0;
    *((_QWORD *)v2 + 13) = 0;
    v2[17] = 1;
  }
  return (MXCoreSessionBase *)v2;
}

- (void)setAuditToken:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_auditToken.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_auditToken.val[4] = v3;
}

- (void)setAudioSessionID:(unsigned int)a3
{
  self->_audioSessionID = a3;
}

- (BOOL)mixesWithEveryone
{
  return self->_mixesWithEveryone;
}

- (void)setIsRecording:(BOOL)a3
{
  self->_isRecording = a3;
}

- (void)dealloc
{
  void *v3;
  NSArray *originalReporterIDs;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  OS_os_transaction *activeOSTransaction;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x194035B20](self, a2);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  originalReporterIDs = self->_originalReporterIDs;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](originalReporterIDs, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(originalReporterIDs);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "longLongValue");
        off_1EE2B3D80(v9);
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](originalReporterIDs, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  self->_audioDestinationPriority = 0;
  self->_audioBehaviour = 0;

  self->_ID = 0;
  self->_clientPID = 0;

  self->_clientName = 0;
  self->_displayID = 0;

  self->_routingContextUUID = 0;
  self->_audioCategory = 0;

  self->_audioMode = 0;
  self->_reporterIDs = 0;

  self->_originalReporterIDs = 0;
  activeOSTransaction = self->_activeOSTransaction;
  if (activeOSTransaction)
  {

    self->_activeOSTransaction = 0;
  }

  self->_timestampWhenMostRecentlyActivated = 0;
  v11.receiver = self;
  v11.super_class = (Class)MXCoreSessionBase;
  -[MXCoreSessionBase dealloc](&v11, sel_dealloc);
  objc_autoreleasePoolPop(v3);
}

- (BOOL)wasRecentlyActivated
{
  NSDate *v2;
  double v3;

  v2 = -[MXCoreSessionBase timestampWhenMostRecentlyActivated](self, "timestampWhenMostRecentlyActivated");
  if (v2)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D68], "date"), "timeIntervalSinceDate:", v2);
    LOBYTE(v2) = v3 <= 2.0;
  }
  return (char)v2;
}

- (BOOL)updateAudioBehaviourFromVARouteConfig:(id)a3
{
  MXSimulateCrash((uint64_t)"This is an abstract method and should be overriden! Please file a radar against 'MediaExperie"
                           "nce Session | All'");
  return 0;
}

- (void)setID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (int)coreSessionType
{
  return self->_coreSessionType;
}

- (void)setCoreSessionType:(int)a3
{
  self->_coreSessionType = a3;
}

- (float)interruptionFadeDuration
{
  return self->_interruptionFadeDuration;
}

- (unsigned)interruptionStyle
{
  return self->_interruptionStyle;
}

- (void)setInterruptionStyle:(unsigned int)a3
{
  self->_interruptionStyle = a3;
}

- (BOOL)interruptionStyleSetByClient
{
  return self->_interruptionStyleSetByClient;
}

- (void)setInterruptionStyleSetByClient:(BOOL)a3
{
  self->_interruptionStyleSetByClient = a3;
}

- (BOOL)isNowPlayingApp
{
  return self->_isNowPlayingApp;
}

- (void)setIsNowPlayingApp:(BOOL)a3
{
  self->_isNowPlayingApp = a3;
}

- (void)setIsTheAssistant:(BOOL)a3
{
  self->_isTheAssistant = a3;
}

- (NSDate)timestampWhenMostRecentlyActivated
{
  return (NSDate *)objc_getProperty(self, a2, 136, 1);
}

- (BOOL)hasEntitlementToSetIsUsingBuiltInMicForRecording
{
  return self->_hasEntitlementToSetIsUsingBuiltInMicForRecording;
}

- (void)setHasEntitlementToSetIsUsingBuiltInMicForRecording:(BOOL)a3
{
  self->_hasEntitlementToSetIsUsingBuiltInMicForRecording = a3;
}

- (void)setIsEligibleForBTSmartRoutingConsideration:(BOOL)a3
{
  self->_isEligibleForBTSmartRoutingConsideration = a3;
}

- (BOOL)isEligibleForBTSmartRoutingConsiderationSetByClient
{
  return self->_isEligibleForBTSmartRoutingConsiderationSetByClient;
}

- (void)setIsEligibleForBTSmartRoutingConsiderationSetByClient:(BOOL)a3
{
  self->_isEligibleForBTSmartRoutingConsiderationSetByClient = a3;
}

- (BOOL)isUsingBuiltInMicForRecording
{
  return self->_isUsingBuiltInMicForRecording;
}

- (void)setIsUsingBuiltInMicForRecording:(BOOL)a3
{
  self->_isUsingBuiltInMicForRecording = a3;
}

- (BOOL)isUsingExclaveSensor
{
  return self->_isUsingExclaveSensor;
}

- (void)setIsUsingExclaveSensor:(BOOL)a3
{
  self->_isUsingExclaveSensor = a3;
}

- (unint64_t)mxSessionIDCounter
{
  return self->_mxSessionIDCounter;
}

- (void)setMxSessionIDCounter:(unint64_t)a3
{
  self->_mxSessionIDCounter = a3;
}

@end
