@implementation MIDIUMPEndpoint

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  v5 = v4
    && -[NSString isEqualToString:](self->_name, "isEqualToString:", v4[4])
    && self->_MIDIProtocol == *((_DWORD *)v4 + 4)
    && self->_MIDIDestination == *((_DWORD *)v4 + 5)
    && self->_MIDISource == *((_DWORD *)v4 + 6)
    && -[MIDI2DeviceInfo isEqual:](self->_deviceInfo, "isEqual:", v4[5])
    && self->_hasStaticFunctionBlocks == *((unsigned __int8 *)v4 + 9)
    && self->_hasJRTSReceiveCapability == *((unsigned __int8 *)v4 + 10)
    && self->_hasJRTSTransmitCapability == *((unsigned __int8 *)v4 + 11)
    && -[NSArray isEqualToArray:](self->_functionBlocks, "isEqualToArray:", v4[7]);

  return v5;
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
  uint64_t i;
  id v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
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
  id v38;
  void *v39;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _QWORD v47[13];
  _QWORD v48[15];

  v48[13] = *MEMORY[0x1E0C80C00];
  v41 = mach_absolute_time();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "object");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v39;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_objectRef);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v37;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "type");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v36;
  v48[1] = &unk_1E98BEED0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "timestamp");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v47[2] = v35;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v41);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v48[2] = v34;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "name");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v47[3] = v33;
  v48[3] = self->_name;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "protocol");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v47[4] = v32;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_MIDIProtocol);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v48[4] = v31;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "source");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v47[5] = v30;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_MIDISource);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v48[5] = v25;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "destination");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v47[6] = v29;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_MIDIDestination);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v48[6] = v28;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "device_info");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v47[7] = v27;
  -[MIDI2DeviceInfo serializeDescription](self->_deviceInfo, "serializeDescription");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v48[7] = v26;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "product_instance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v47[8] = v2;
  v48[8] = self->_productInstanceID;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "has_static_function_blocks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v47[9] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasStaticFunctionBlocks);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v48[9] = v4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "jrts_receive_capability");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v47[10] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasJRTSReceiveCapability);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v48[10] = v6;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "jrts_transmit_capability");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v47[11] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasJRTSTransmitCapability);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v48[11] = v8;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "endpoint_type");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v47[12] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_endpointType);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v48[12] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (id)objc_msgSend(v11, "mutableCopy");

  if (self->_functionBlocks)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v13 = self->_functionBlocks;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v43 != v15)
            objc_enumerationMutation(v13);
          v17 = *(id *)(*((_QWORD *)&v42 + 1) + 8 * i);
          objc_msgSend(v17, "UMPEndpoint");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18 == 0;

          if (v19)
            objc_msgSend(v17, "setEndpoint:", self);
          objc_msgSend(v17, "serializeDescription");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v41);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "timestamp");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setValue:forKey:", v21, v22);

          objc_msgSend(v12, "addObject:", v20);
        }
        v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      }
      while (v14);
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "function_blocks");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setValue:forKey:", v12, v23);

  }
  return v38;
}

- (MIDIUMPEndpoint)initWithDescription:(id)a3
{
  id v4;
  MIDIUMPEndpoint *v5;
  MIDIUMPEndpoint *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MIDIUMPEndpoint;
  v5 = -[MIDIUMPEndpoint init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[MIDIUMPEndpoint deserialize:](v5, "deserialize:", v4);
  v6->_isMine = 0;

  return v6;
}

- (BOOL)deserialize:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  MIDI2DeviceInfo **p_deviceInfo;
  int v19;
  unsigned __int8 v20;
  uint64_t v21;
  MIDI2DeviceInfo *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  id v28;
  MIDIUMPFunctionBlock *v29;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  id obj;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  obj = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "device_info");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MIDI2DeviceInfo infoWithDescription:](MIDI2DeviceInfo, "infoWithDescription:", v7);
  v43 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "product_instance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v8);
  v37 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "protocol");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v9);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "has_static_function_blocks");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v10);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "jrts_receive_capability");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v11);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "jrts_transmit_capability");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v12);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "source");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v13);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "destination");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v14);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "endpoint_type");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v15);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "function_blocks");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v16);
  v31 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "object");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v17);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)&self->_name, obj);
  p_deviceInfo = &self->_deviceInfo;
  objc_storeStrong((id *)&self->_deviceInfo, v43);
  objc_storeStrong((id *)&self->_productInstanceID, v37);
  v19 = objc_msgSend(v36, "intValue");
  self->_MIDIProtocol = v19;
  if (v19 == 2)
    v20 = 2;
  else
    v20 = 1;
  self->_supportedMIDIProtocols = v20;
  +[MIDI2DeviceInfo infoWithInfo:](MIDI2DeviceInfo, "infoWithInfo:", v43, v31);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = *p_deviceInfo;
  *p_deviceInfo = (MIDI2DeviceInfo *)v21;

  self->_hasStaticFunctionBlocks = objc_msgSend(v34, "BOOLValue");
  self->_hasJRTSReceiveCapability = objc_msgSend(v35, "BOOLValue");
  self->_hasJRTSTransmitCapability = objc_msgSend(v38, "BOOLValue");
  self->_MIDISource = objc_msgSend(v40, "unsignedIntegerValue");
  self->_MIDIDestination = objc_msgSend(v41, "unsignedIntegerValue");
  self->_objectRef = objc_msgSend(v42, "unsignedIntValue");
  v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v24 = v32;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v45 != v26)
          objc_enumerationMutation(v24);
        v28 = *(id *)(*((_QWORD *)&v44 + 1) + 8 * i);
        v29 = -[MIDIUMPFunctionBlock initWithDescription:]([MIDIUMPFunctionBlock alloc], "initWithDescription:", v28);
        -[MIDIUMPFunctionBlock setEndpoint:](v29, "setEndpoint:", self);
        objc_msgSend(v23, "addObject:", v29);

      }
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v25);
  }

  objc_storeStrong((id *)&self->_functionBlocks, v23);
  self->_endpointType = objc_msgSend(v33, "unsignedIntegerValue");

  return 1;
}

- (BOOL)containsFunctionBlock:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_functionBlocks;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if (*(id *)(*((_QWORD *)&v10 + 1) + 8 * i) == v4)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (int)MIDIProtocol
{
  return self->_MIDIProtocol;
}

- (unsigned)supportedMIDIProtocols
{
  return self->_supportedMIDIProtocols;
}

- (unsigned)MIDIDestination
{
  return self->_MIDIDestination;
}

- (unsigned)MIDISource
{
  return self->_MIDISource;
}

- (MIDI2DeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (NSString)productInstanceID
{
  return self->_productInstanceID;
}

- (BOOL)hasStaticFunctionBlocks
{
  return self->_hasStaticFunctionBlocks;
}

- (BOOL)hasJRTSReceiveCapability
{
  return self->_hasJRTSReceiveCapability;
}

- (BOOL)hasJRTSTransmitCapability
{
  return self->_hasJRTSTransmitCapability;
}

- (unsigned)endpointType
{
  return self->_endpointType;
}

- (NSArray)functionBlocks
{
  return self->_functionBlocks;
}

- (void)setFunctionBlocks:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)receiveBlock
{
  return self->_receiveBlock;
}

- (void)setReceiveBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)isMine
{
  return self->_isMine;
}

- (void)setIsMine:(BOOL)a3
{
  self->_isMine = a3;
}

- (unsigned)objectRef
{
  return self->_objectRef;
}

- (void)setObjectRef:(unsigned int)a3
{
  self->_objectRef = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_receiveBlock, 0);
  objc_storeStrong((id *)&self->_functionBlocks, 0);
  objc_storeStrong((id *)&self->_productInstanceID, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)description
{
  return CFSTR("MIDI UMP Endpoint");
}

@end
