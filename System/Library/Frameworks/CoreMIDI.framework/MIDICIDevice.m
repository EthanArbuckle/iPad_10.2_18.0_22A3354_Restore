@implementation MIDICIDevice

+ (id)description
{
  return CFSTR("MIDI-CI Device");
}

- (MIDICIDevice)initWithDescription:(id)a3
{
  id v4;
  MIDICIDevice *v5;
  MIDICIDevice *v6;

  v4 = a3;
  v5 = -[MIDICIDevice init](self, "init");
  v6 = v5;
  if (v5)
    -[MIDICIDevice deserialize:](v5, "deserialize:", v4);

  return v6;
}

- (BOOL)deserialize:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MIDIObjectRef v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  OSStatus IntegerProperty;
  NSArray *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  id v35;
  MIDIUMPCIProfile *v36;
  NSArray *profiles;
  unsigned int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id obj;
  void *v47;
  void *v48;
  BOOL v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  SInt32 outValue;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "destination");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntValue");

  outValue = 0;
  if (MIDIObjectGetIntegerProperty(v7, kMIDIPropertyProtocolID, &outValue))
  {
    v49 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "device_info");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[MIDI2DeviceInfo infoWithDescription:](MIDI2DeviceInfo, "infoWithDescription:", v9);
    obj = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "source");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "unsignedIntValue");

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "muid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v14, "unsignedIntValue");

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "device_type");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "unsignedIntValue");

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "destination");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "unsignedIntValue");

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "supports_protocol_negotiation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v21);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "supports_profile_capability");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v22);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "supports_property_exchange_capability");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v23);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "supports_process_inquiry_capability");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v24);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "max_sysex_size");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v25);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "max_property_requests");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v26);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "object");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v27);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "profiles");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v28);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    IntegerProperty = MIDIObjectGetIntegerProperty(v7, kMIDIPropertyProtocolID, &outValue);
    v49 = IntegerProperty == 0;
    if (!IntegerProperty)
    {
      objc_storeStrong((id *)&self->_deviceInfo, obj);
      self->_MUID = v39;
      self->_deviceType = v17;
      self->_MIDISource = v12;
      self->_MIDIDestination = v20;
      self->_supportsProtocolNegotiation = objc_msgSend(v43, "BOOLValue");
      self->_supportsProfileConfiguration = objc_msgSend(v41, "BOOLValue");
      self->_supportsPropertyExchange = objc_msgSend(v40, "BOOLValue");
      self->_supportsProcessInquiry = objc_msgSend(v42, "BOOLValue");
      self->_maxSysExSize = objc_msgSend(v44, "unsignedIntValue");
      self->_maxPropertyExchangeRequests = objc_msgSend(v45, "unsignedIntValue");
      self->_objectRef = objc_msgSend(v47, "unsignedIntValue");
      v30 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v31 = v48;
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      if (v32)
      {
        v33 = *(_QWORD *)v51;
        do
        {
          for (i = 0; i != v32; ++i)
          {
            if (*(_QWORD *)v51 != v33)
              objc_enumerationMutation(v31);
            v35 = *(id *)(*((_QWORD *)&v50 + 1) + 8 * i);
            v36 = -[MIDIUMPCIProfile initWithDescription:]([MIDIUMPCIProfile alloc], "initWithDescription:", v35);
            -[MIDIUMPCIProfile registerToDevice:](v36, "registerToDevice:", self);
            -[NSArray addObject:](v30, "addObject:", v36);

          }
          v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
        }
        while (v32);
      }

      profiles = self->_profiles;
      self->_profiles = v30;

    }
  }

  return v49;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  unsigned int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  BOOL v10;

  v4 = a3;
  v5 = -[MIDICIDevice MUID](self, "MUID");
  v10 = v5 == objc_msgSend(v4, "MUID")
     && (v6 = -[MIDICIDevice supportsProtocolNegotiation](self, "supportsProtocolNegotiation"),
         v6 == objc_msgSend(v4, "supportsProtocolNegotiation"))
     && (v7 = -[MIDICIDevice supportsProfileConfiguration](self, "supportsProfileConfiguration"),
         v7 == objc_msgSend(v4, "supportsProfileConfiguration"))
     && (v8 = -[MIDICIDevice supportsPropertyExchange](self, "supportsPropertyExchange"),
         v8 == objc_msgSend(v4, "supportsPropertyExchange"))
     && (v9 = -[MIDICIDevice supportsProcessInquiry](self, "supportsProcessInquiry"),
         v9 == objc_msgSend(v4, "supportsProcessInquiry"))
     && self->_maxSysExSize == v4[5]
     && self->_maxPropertyExchangeRequests == v4[6]
     && -[NSArray isEqualToArray:](self->_profiles, "isEqualToArray:", v4[7]);

  return v10;
}

- (id)serializeDescription
{
  void *v2;
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
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
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
  id v37;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _QWORD v45[10];
  _QWORD v46[12];

  v46[10] = *MEMORY[0x1E0C80C00];
  v39 = mach_absolute_time();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "type");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v36;
  v46[0] = &unk_1E98BEEB8;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "object");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v33;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_objectRef);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v27;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "source");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v35;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_MIDISource);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v46[2] = v32;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "destination");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v45[3] = v31;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_MIDIDestination);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v46[3] = v30;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "supports_protocol_negotiation");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v45[4] = v34;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsProtocolNegotiation);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v46[4] = v29;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "supports_profile_capability");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v45[5] = v28;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsProfileConfiguration);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v46[5] = v2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "supports_property_exchange_capability");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v45[6] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsPropertyExchange);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v46[6] = v4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "supports_process_inquiry_capability");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v45[7] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_supportsProcessInquiry);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v46[7] = v6;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "max_sysex_size");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v45[8] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_maxSysExSize);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v46[8] = v8;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "max_property_requests");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v45[9] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_maxPropertyExchangeRequests);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v46[9] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (id)objc_msgSend(v11, "mutableCopy");

  if (self->_profiles)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v13 = self->_profiles;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v41;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v41 != v15)
            objc_enumerationMutation(v13);
          v17 = *(id *)(*((_QWORD *)&v40 + 1) + 8 * v16);
          objc_msgSend(v17, "ciDevice");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18 == 0;

          if (v19)
            objc_msgSend(v17, "setCiDevice:", self);
          objc_msgSend(v17, "serializeDescription");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v39);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "timestamp");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setValue:forKey:", v21, v22);

          objc_msgSend(v12, "addObject:", v20);
          ++v16;
        }
        while (v14 != v16);
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v14);
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "profiles");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setValue:forKey:", v12, v23);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v39);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "timestamp");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setValue:forKey:", v24, v25);

  return v37;
}

- (BOOL)setProfile:(id)a3 newState:(BOOL)a4 enabledChannelCount:(unsigned __int16)a5 error:(id *)a6
{
  _BOOL4 v6;
  id v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  _BYTE v13[8];
  void *__p[3];
  int __src;
  char v16;
  char v17[3];

  v6 = a4;
  v8 = a3;
  v9 = objc_msgSend(v8, "profileID");
  __src = v9;
  v16 = BYTE4(v9);
  +[MIDICIDeviceManager sharedInstance](MIDICIDeviceManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "serverMUID");

  if (v6)
    midi::ci::message::make_with_payload_size((midi::ci::message *)v13, 5, 34, v11, self->_MUID, 127);
  else
    midi::ci::message::make_with_payload_size((midi::ci::message *)v13, 5, 35, v11, self->_MUID, 127);
  std::vector<unsigned char>::__insert_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>((uint64_t)__p, (char *)__p[1], (char *)&__src, v17, 5);
  sendUMPMessage(self->_MIDIDestination, (uint64_t)v13);
  if (__p[0])
    operator delete(__p[0]);

  return 1;
}

- (MIDI2DeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (unsigned)MUID
{
  return self->_MUID;
}

- (BOOL)supportsProtocolNegotiation
{
  return self->_supportsProtocolNegotiation;
}

- (BOOL)supportsProfileConfiguration
{
  return self->_supportsProfileConfiguration;
}

- (BOOL)supportsPropertyExchange
{
  return self->_supportsPropertyExchange;
}

- (BOOL)supportsProcessInquiry
{
  return self->_supportsProcessInquiry;
}

- (unint64_t)maxSysExSize
{
  return self->_maxSysExSize;
}

- (unint64_t)maxPropertyExchangeRequests
{
  return self->_maxPropertyExchangeRequests;
}

- (unsigned)deviceType
{
  return self->_deviceType;
}

- (NSArray)profiles
{
  return self->_profiles;
}

- (unsigned)objectRef
{
  return self->_objectRef;
}

- (void)setObjectRef:(unsigned int)a3
{
  self->_objectRef = a3;
}

- (unsigned)MIDISource
{
  return self->_MIDISource;
}

- (void)setMIDISource:(unsigned int)a3
{
  self->_MIDISource = a3;
}

- (unsigned)MIDIDestination
{
  return self->_MIDIDestination;
}

- (void)setMIDIDestination:(unsigned int)a3
{
  self->_MIDIDestination = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profiles, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
}

@end
