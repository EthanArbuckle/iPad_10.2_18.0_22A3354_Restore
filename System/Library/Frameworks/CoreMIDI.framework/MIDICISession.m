@implementation MIDICISession

- (MIDICISession)init
{
  void *v3;
  void *v4;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MIDICISession init]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unsupported! Don't call %@."), v4);

  return 0;
}

- (MIDICISession)initWithDiscoveredNode:(MIDICIDiscoveredNode *)discoveredNode dataReadyHandler:(void *)handler disconnectHandler:(MIDICISessionDisconnectBlock)disconnectHandler
{
  MIDICIDiscoveredNode *v8;
  void *v9;
  MIDICISessionDisconnectBlock v10;
  void *v11;
  void *v12;
  int v13;
  MIDICISession *v14;
  void *v15;
  id sessionDisconnectCallback;
  void *v17;
  objc_super v19;

  v8 = discoveredNode;
  v9 = handler;
  v10 = disconnectHandler;
  if (v8
    && (-[MIDICIDiscoveredNode deviceInfo](v8, "deviceInfo"), (v11 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    && (-[MIDICIDiscoveredNode deviceInfo](v8, "deviceInfo"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "midiDestination"),
        v12,
        v11,
        v13))
  {
    v19.receiver = self;
    v19.super_class = (Class)MIDICISession;
    v14 = -[MIDICISession init](&v19, sel_init);
    if (v14)
    {
      v14->_destination = -[MIDICIDiscoveredNode destination](v8, "destination");
      v15 = _Block_copy(v10);
      sessionDisconnectCallback = v14->_sessionDisconnectCallback;
      v14->_sessionDisconnectCallback = v15;

      -[MIDICIDiscoveredNode maximumSysExSize](v8, "maximumSysExSize");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v14->_maxSysExSize = objc_msgSend(v17, "unsignedLongValue");

      v14->_client = 0;
    }
  }
  else
  {
    v14 = self;
  }

  return 0;
}

- (MIDICISession)initWithMIDIEntity:(unsigned int)a3 dataReadyHandler:(id)a4
{

  return 0;
}

- (MIDICISession)initWithMIDIDestination:(unsigned int)a3 dataReadyHandler:(id)a4 disconnectHandler:(id)a5 profileSpecificDataHandler:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  MIDICISession *v13;
  void *v14;
  id sessionDisconnectCallback;
  void *v16;
  id profileSpecificDataCallback;
  MIDICISession *v18;

  v8 = *(_QWORD *)&a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if ((_DWORD)v8)
  {
    v13 = -[MIDICISession initWithMIDIDestination:dataReadyHandler:](self, "initWithMIDIDestination:dataReadyHandler:", v8, v10);
    if (v13)
    {
      v14 = _Block_copy(v11);
      sessionDisconnectCallback = v13->_sessionDisconnectCallback;
      v13->_sessionDisconnectCallback = v14;

      v16 = _Block_copy(v12);
      profileSpecificDataCallback = v13->_profileSpecificDataCallback;
      v13->_profileSpecificDataCallback = v16;

    }
    self = v13;
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (MIDICISession)initWithMIDIDestination:(unsigned int)a3 dataReadyHandler:(id)a4
{

  return 0;
}

- (id)description
{
  const __CFString *v2;
  const __CFString *v3;

  v2 = CFSTR("supports Profiles & Properties");
  if (self->_supportsPropertyCapability)
  {
    v3 = CFSTR("supports Properties");
  }
  else
  {
    v2 = CFSTR("supports Profiles");
    v3 = CFSTR("MIDI-CI supported?");
  }
  if (!self->_supportsProfileCapability)
    v2 = v3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<MIDICISession(%p) (%@)>"), self, v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSNumber)maxSysExSize
{
  return (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", self->_maxSysExSize);
}

- (NSNumber)maxPropertyRequests
{
  return (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_maxRequests);
}

- (BOOL)isEqual:(id)a3
{
  return self->_ciSessionRef == *((_DWORD *)a3 + 18);
}

- (void)handleCINotification:(const MIDINotification *)a3 withHandler:(id)a4
{
  char v6;
  uint64_t messageID;
  UInt32 messageSize;
  const MIDINotification *v9;
  MIDICIDeviceInfo *v10;
  MIDICIDeviceInfo *deviceInfo;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  uint64_t messageID_low;
  MIDICIProfile *v18;
  void *v19;
  MIDICIProfile *v20;
  void *v21;
  void (**v22)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  MIDICIProfile *v28;
  void *v29;
  void *v30;
  void (**v31)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v32;
  uint64_t v33;
  void (**v34)(_QWORD, _QWORD, _QWORD, _QWORD);
  unsigned int v35;
  void (**v36)(void);
  _BYTE v37[24];

  v36 = (void (**)(void))a4;
  v6 = 0;
  messageID = a3->messageID;
  messageSize = a3->messageSize;
  while (2)
  {
    v9 = a3 + 1;
    switch((int)messageID)
    {
      case 20:
        NSLog(CFSTR("handleCINotification: kMIDIMsgProfileSupported"));
        self->_supportsProfileCapability = 1;
        -[MIDICISession addProfileState:length:channel:](self, "addProfileState:length:channel:", (char *)&a3[1].messageID + 1, messageSize - 1, LOBYTE(a3[1].messageID));
        goto LABEL_6;
      case 21:
      case 22:
        -[MIDICISession profileChangedCallback](self, "profileChangedCallback");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if ((_DWORD)messageID == 21)
          v15 = CFSTR("kMIDIMsgProfileEnabled");
        else
          v15 = CFSTR("kMIDIMsgProfileDisabled");
        v16 = _Block_copy(v13);
        NSLog(CFSTR("handleCINotification: %@ (profileChangedCallback:%p)"), v15, v16);

        messageID_low = LOBYTE(v9->messageID);
        v18 = [MIDICIProfile alloc];
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", (char *)&a3[1].messageID + 1, 5);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = -[MIDICIProfile initWithData:](v18, "initWithData:", v19);

        -[MIDICISession updateProfileStateForChannel:withProfile:enabled:](self, "updateProfileStateForChannel:withProfile:enabled:", messageID_low, v20, (_DWORD)messageID == 21);
        -[MIDICISession profileChangedCallback](self, "profileChangedCallback");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          NSLog(CFSTR("Notifying..."));
          -[MIDICISession profileChangedCallback](self, "profileChangedCallback");
          v22 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, MIDICISession *, uint64_t, MIDICIProfile *, BOOL))v22)[2](v22, self, messageID_low, v20, (_DWORD)messageID == 21);

          v23 = CFSTR("Done notifying.");
        }
        else
        {
          v23 = CFSTR("Not notifying.");
        }
        v24 = 0;
        NSLog(&v23->isa);
        v25 = 0;
        goto LABEL_26;
      case 23:
        -[MIDICISession profileSpecificDataBlock](self, "profileSpecificDataBlock");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = _Block_copy(v26);
        NSLog(CFSTR("handleCINotification: %@ (profileSpecificDataBlock:%p)"), CFSTR("kMIDIMsgProfileSpecificData"), v27);

        v35 = LOBYTE(v9->messageID);
        v28 = [MIDICIProfile alloc];
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", (char *)&a3[1].messageID + 1, 5);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = -[MIDICIProfile initWithData:](v28, "initWithData:", v29);

        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", (char *)&a3[1].messageSize + 2, messageSize - 5);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[MIDICISession profileSpecificDataBlock](self, "profileSpecificDataBlock");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          NSLog(CFSTR("Notifying profile specific data..."));
          -[MIDICISession profileSpecificDataBlock](self, "profileSpecificDataBlock");
          v31 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, MIDICISession *, _QWORD, MIDICIProfile *, void *))v31)[2](v31, self, v35, v20, v24);

          NSLog(CFSTR("Done notifying."));
        }
        else
        {
          NSLog(CFSTR("Not notifying since there is no profile-specific data handler available."));
        }
        v25 = 0;
        goto LABEL_26;
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 30:
        goto LABEL_15;
      case 31:
        self->_supportsPropertyCapability = 1;
        v12 = a3[1].messageID;
        a3 = (const MIDINotification *)((char *)a3 + messageSize + 8);
        self->_maxRequests = v12;
        goto LABEL_8;
      case 32:
        -[MIDICISession propertyChangedCallback](self, "propertyChangedCallback");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v32)
          goto LABEL_20;
        v33 = LOBYTE(v9->messageID);
        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", (char *)&a3[1].messageID + 1, messageSize - 1);
        -[MIDICISession propertyChangedCallback](self, "propertyChangedCallback");
        v34 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, MIDICISession *, uint64_t, void *))v34)[2](v34, self, v33, v25);

        v20 = 0;
        v24 = 0;
        -[MIDICISession setPropertyChangedCallback:](self, "setPropertyChangedCallback:", 0);
        goto LABEL_26;
      default:
        if ((_DWORD)messageID == 11)
        {
          NSLog(CFSTR("handleCINotification: kMIDIMsgPeerInfo"));
          *(MIDINotification *)&v37[16] = a3[3];
          *(_OWORD *)v37 = *(_OWORD *)&v9->messageID;
          self->_destination = a3[4].messageID;
          self->_deviceID = *(MIDICIDeviceIdentification *)&v37[4];
          v10 = -[MIDICIDeviceInfo initWithDestination:deviceID:]([MIDICIDeviceInfo alloc], "initWithDestination:deviceID:", 0, &self->_deviceID);
          deviceInfo = self->_deviceInfo;
          self->_deviceInfo = v10;

LABEL_6:
          a3 = (const MIDINotification *)((char *)a3 + messageSize + 8);
LABEL_8:
          messageID = a3->messageID;
          messageSize = a3->messageSize;
          v6 = 1;
          continue;
        }
        if ((_DWORD)messageID == 40)
        {
LABEL_20:
          v20 = 0;
          v25 = 0;
          v24 = 0;
          if ((v6 & 1) != 0)
            goto LABEL_27;
        }
        else
        {
LABEL_15:
          v20 = 0;
          v24 = 0;
          NSLog(CFSTR("Unexpected msg ID %d: msgSize = %lu"), messageID, messageSize);
          v25 = 0;
LABEL_26:
          if ((v6 & 1) != 0)
LABEL_27:
            v36[2]();
        }

        return;
    }
  }
}

- (MIDICIProfileState)profileStateForChannel:(MIDIChannelNumber)channel
{
  if (channel == 127)
    *(_QWORD *)&channel = 16;
  else
    *(_QWORD *)&channel = channel;
  return (MIDICIProfileState *)-[NSMutableArray objectAtIndex:](self->_profileStates, "objectAtIndex:", channel);
}

- (BOOL)enableProfile:(MIDICIProfile *)profile onChannel:(MIDIChannelNumber)channel error:(NSError *)outError
{
  return -[MIDICISession toggleProfile:onChannel:enabling:error:](self, "toggleProfile:onChannel:enabling:error:", profile, channel, 1, outError);
}

- (BOOL)disableProfile:(MIDICIProfile *)profile onChannel:(MIDIChannelNumber)channel error:(NSError *)outError
{
  return -[MIDICISession toggleProfile:onChannel:enabling:error:](self, "toggleProfile:onChannel:enabling:error:", profile, channel, 0, outError);
}

- (BOOL)toggleProfile:(id)a3 onChannel:(unsigned __int8)a4 enabling:(BOOL)a5 error:(id *)a6
{
  unsigned int v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v7 = a4;
  v8 = a3;
  v9 = v8;
  if (v8 && (v7 == 127 || v7 <= 0xF))
  {
    objc_msgSend(v8, "profileID");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v10, "bytes");

    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -10844, 0);
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a6 = v11;

    }
  }

  return 0;
}

- (BOOL)sendProfile:(MIDICIProfile *)profile onChannel:(MIDIChannelNumber)channel profileData:(NSData *)profileSpecificData
{
  unsigned int v5;
  MIDICIProfile *v6;
  MIDICIProfile *v7;
  id v8;

  v5 = channel;
  v6 = profile;
  v7 = v6;
  if (v6 && (v5 == 127 || v5 <= 0xF))
  {
    -[MIDICIProfile profileID](v6, "profileID");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v8, "bytes");

  }
  return 0;
}

- (void)addProfileState:(char *)a3 length:(unsigned int)a4 channel:(unsigned __int8)a5
{
  uint64_t v5;
  unsigned int v6;
  char *v7;
  unsigned int v8;
  uint64_t v9;
  id v10;
  unsigned int i;
  void *v12;
  MIDICIProfile *v13;
  unsigned int v14;
  char *v15;
  void *v16;
  MIDICIProfile *v17;
  MIDICIProfileState *v18;
  uint64_t v19;
  id v21;

  v5 = a5;
  v7 = a3 + 2;
  v6 = *(unsigned __int16 *)a3;
  v8 = *(unsigned __int16 *)&a3[5 * *(unsigned __int16 *)a3 + 2];
  if (a5 == 127)
    v9 = 16;
  else
    v9 = a5;
  v19 = v9;
  v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v6)
  {
    for (i = 0; i < v6; ++i)
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v7, 5);
      v13 = -[MIDICIProfile initWithData:]([MIDICIProfile alloc], "initWithData:", v12);
      objc_msgSend(v21, "addObject:", v13);
      v7 += 5;

    }
  }
  if (v8)
  {
    v14 = 0;
    v15 = v7 + 2;
    do
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v15, 5);
      v17 = -[MIDICIProfile initWithData:]([MIDICIProfile alloc], "initWithData:", v16);
      objc_msgSend(v10, "addObject:", v17);
      v15 += 5;

      ++v14;
    }
    while (v14 < v8);
  }
  v18 = -[MIDICIProfileState initWithChannel:enabledProfiles:disabledProfiles:]([MIDICIProfileState alloc], "initWithChannel:enabledProfiles:disabledProfiles:", v5, v21, v10);
  -[NSMutableArray replaceObjectAtIndex:withObject:](self->_profileStates, "replaceObjectAtIndex:withObject:", v19, v18);

}

- (BOOL)updateProfileStateForChannel:(unsigned __int8)a3 withProfile:(id)a4 enabled:(BOOL)a5
{
  _BOOL4 v5;
  unsigned int v6;
  id v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  id v23;
  BOOL v24;
  id v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v5 = a5;
  v6 = a3;
  v32 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = v8;
  v10 = "NO";
  if (v5)
    v10 = "YES";
  NSLog(CFSTR("updateProfileStateForChannel:0x%x withProfile:%@ enabled:%s"), v6, v8, v10);
  if (v6 == 127)
    v11 = 16;
  else
    v11 = v6;
  -[NSMutableArray objectAtIndex:](self->_profileStates, "objectAtIndex:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "disabledProfiles");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v15 = (void *)objc_msgSend(v14, "mutableCopy");

      objc_msgSend(v13, "enabledProfiles");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v16, "mutableCopy");
      v18 = v15;
    }
    else
    {
      v17 = (void *)objc_msgSend(v14, "mutableCopy");

      objc_msgSend(v13, "enabledProfiles");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v16, "mutableCopy");
      v18 = v17;
    }

    NSLog(CFSTR("removing from:%@"), v15);
    NSLog(CFSTR("adding to:%@"), v17);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v19 = v15;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v28 != v21)
            objc_enumerationMutation(v19);
          v23 = *(id *)(*((_QWORD *)&v27 + 1) + 8 * i);
          if (objc_msgSend(v23, "isEqual:", v9))
          {
            objc_msgSend(v19, "removeObject:", v23);
            objc_msgSend(v17, "addObject:", v23);

            NSLog(CFSTR("     updating..."));
            if (v5)
              v25 = v17;
            else
              v25 = v19;
            objc_msgSend(v13, "updateWithEnabledProfiles:disabledProfiles:", v25, v18);
            v24 = 1;
            goto LABEL_25;
          }

        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v20)
          continue;
        break;
      }
    }

  }
  else
  {
    v17 = 0;
    v19 = 0;
  }
  v24 = 0;
LABEL_25:

  return v24;
}

- (BOOL)supportsProfileCapability
{
  return self->_supportsProfileCapability;
}

- (BOOL)supportsPropertyCapability
{
  return self->_supportsPropertyCapability;
}

- (MIDICIDeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (MIDICIProfileChangedBlock)profileChangedCallback
{
  return self->_profileChangedCallback;
}

- (void)setProfileChangedCallback:(MIDICIProfileChangedBlock)profileChangedCallback
{
  objc_setProperty_nonatomic_copy(self, a2, profileChangedCallback, 32);
}

- (id)disconnectBlock
{
  return self->_sessionDisconnectCallback;
}

- (void)setDisconnectBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)profileSpecificDataBlock
{
  return self->_profileSpecificDataCallback;
}

- (void)setProfileSpecificDataBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (MIDICIDeviceIdentification)deviceID
{
  uint64_t v2;
  uint64_t v3;
  MIDICIDeviceIdentification result;

  v2 = *(_QWORD *)&self->_deviceID.revisionLevel[1];
  v3 = *(_QWORD *)self->_deviceID.manufacturer;
  *(_DWORD *)&result.revisionLevel[1] = v2;
  *(_DWORD *)&result.reserved[1] = HIDWORD(v2);
  *(_WORD *)result.manufacturer = v3;
  result.manufacturer[2] = BYTE2(v3);
  *(_WORD *)result.family = *(_WORD *)((char *)&v3 + 3);
  *(_WORD *)result.modelNumber = *(_WORD *)((char *)&v3 + 5);
  result.revisionLevel[0] = HIBYTE(v3);
  return result;
}

- (id)propertyResponseCallback
{
  return self->_propertyResponseCallback;
}

- (void)setPropertyResponseCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (id)propertyChangedCallback
{
  return self->_propertyChangedCallback;
}

- (void)setPropertyChangedCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (MIDIEntityRef)midiDestination
{
  return self->_destination;
}

- (MIDICIProfileSpecificDataBlock)profileSpecificDataHandler
{
  return self->_profileSpecificDataHandler;
}

- (void)setProfileSpecificDataHandler:(MIDICIProfileSpecificDataBlock)profileSpecificDataHandler
{
  objc_setProperty_nonatomic_copy(self, a2, profileSpecificDataHandler, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_profileSpecificDataHandler, 0);
  objc_storeStrong(&self->_propertyResponseCallback, 0);
  objc_storeStrong(&self->_propertyChangedCallback, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong(&self->_profileSpecificDataCallback, 0);
  objc_storeStrong(&self->_sessionDisconnectCallback, 0);
  objc_storeStrong(&self->_profileChangedCallback, 0);
  objc_storeStrong((id *)&self->_profileStates, 0);
  objc_storeStrong((id *)&self->_supportedProtocols, 0);
}

+ (id)description
{
  return CFSTR("MIDI-CI Session");
}

- (void)hasProperty:(id)a3 onChannel:(unsigned __int8)a4 responseHandler:(id)a5
{
  void *v6;
  id propertyResponseCallback;

  v6 = _Block_copy(a5);
  propertyResponseCallback = self->_propertyResponseCallback;
  self->_propertyResponseCallback = v6;

}

- (void)getProperty:(id)a3 onChannel:(unsigned __int8)a4 responseHandler:(id)a5
{
  void *v6;
  id propertyResponseCallback;

  v6 = _Block_copy(a5);
  propertyResponseCallback = self->_propertyResponseCallback;
  self->_propertyResponseCallback = v6;

}

- (void)setProperty:(id)a3 onChannel:(unsigned __int8)a4 responseHandler:(id)a5
{
  void *v6;
  id propertyResponseCallback;

  v6 = _Block_copy(a5);
  propertyResponseCallback = self->_propertyResponseCallback;
  self->_propertyResponseCallback = v6;

}

@end
