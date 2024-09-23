@implementation MIDIUMPMutableEndpoint

- (MIDIUMPMutableEndpoint)initWithName:(id)a3 deviceInfo:(id)a4 productInstanceID:(id)a5 MIDIProtocol:(int)a6 destinationCallback:(id)a7
{
  uint64_t v8;
  __CFString *v13;
  id v14;
  id v15;
  CFTypeID MainBundle;
  void *v17;
  const __CFArray *v18;
  CFTypeID v19;
  UMPCIClients *v20;
  MIDIUMPMutableEndpoint *v21;
  const __CFString *v23;
  MIDI2DeviceInfo *v24;
  MIDI2DeviceInfo *deviceInfo;
  NSString *v26;
  NSString *productInstanceID;
  unsigned __int8 v28;
  NSArray *functionBlocks;
  SInt32 value;
  SInt32 outValue;
  MIDIEndpointRef outSrc;
  CFRange v33;

  v8 = *(_QWORD *)&a6;
  v13 = (__CFString *)a3;
  v14 = a4;
  v15 = a5;
  MainBundle = (CFTypeID)a7;
  v17 = (void *)MainBundle;
  if (CheckVirtualEndpointCreation(void)::virtualEndpointsAllowed < 0)
  {
    CheckVirtualEndpointCreation(void)::virtualEndpointsAllowed = 0;
    MainBundle = (CFTypeID)CFBundleGetMainBundle();
    if (MainBundle
      && (MainBundle = (CFTypeID)CFBundleGetValueForInfoDictionaryKey((CFBundleRef)MainBundle, CFSTR("UIBackgroundModes")), (v18 = (const __CFArray *)MainBundle) != 0)&& (v19 = CFGetTypeID((CFTypeRef)MainBundle), MainBundle = CFArrayGetTypeID(), v19 == MainBundle)&& (v33.length = CFArrayGetCount(v18), v33.location = 0, MainBundle = CFArrayContainsValue(v18, v33, CFSTR("audio")), (_DWORD)MainBundle))
    {
      CheckVirtualEndpointCreation(void)::virtualEndpointsAllowed = 1;
    }
    else if (!CheckVirtualEndpointCreation(void)::virtualEndpointsAllowed)
    {
LABEL_12:
      v21 = 0;
      goto LABEL_13;
    }
  }
  else if (!CheckVirtualEndpointCreation(void)::virtualEndpointsAllowed)
  {
    goto LABEL_12;
  }
  outSrc = 0;
  UMPCIClients::instance((UMPCIClients *)MainBundle);
  v20 = (UMPCIClients *)MIDISourceCreateWithProtocol(UMPCIClients::instance(void)::all, v13, (MIDIProtocolID)v8, &outSrc);
  if ((_DWORD)v20)
    goto LABEL_12;
  self->super._MIDISource = outSrc;
  outSrc = 0;
  UMPCIClients::instance(v20);
  if (MIDIDestinationCreateInternal((MIDIServer *)UMPCIClients::instance(void)::all, v13, v8, (int *)&outSrc, 0, v17))goto LABEL_12;
  self->super._MIDIDestination = outSrc;
  value = 0;
  outValue = 0;
  if (!MIDIObjectGetIntegerProperty(self->super._MIDISource, kMIDIPropertyUniqueID, &outValue)
    && !MIDIObjectGetIntegerProperty(self->super._MIDIDestination, kMIDIPropertyUniqueID, &value))
  {
    v23 = (const __CFString *)kMIDIPropertyAssociatedEndpoint;
    MIDIObjectSetIntegerProperty(self->super._MIDISource, (CFStringRef)kMIDIPropertyAssociatedEndpoint, value);
    MIDIObjectSetIntegerProperty(self->super._MIDIDestination, v23, outValue);
  }
  MIDIObjectSetIntegerProperty(self->super._MIDISource, kMIDIPropertyUMPCanTransmitGroupless, 1);
  MIDIObjectSetIntegerProperty(self->super._MIDIDestination, kMIDIPropertyUMPCanTransmitGroupless, 1);
  MIDIObjectSetIntegerProperty(self->super._MIDISource, kMIDIPropertyUMPActiveGroupBitmap, 15);
  MIDIObjectSetIntegerProperty(self->super._MIDIDestination, kMIDIPropertyUMPActiveGroupBitmap, 15);
  objc_storeStrong((id *)&self->super._name, a3);
  +[MIDI2DeviceInfo infoWithInfo:](MIDI2DeviceInfo, "infoWithInfo:", v14);
  v24 = (MIDI2DeviceInfo *)objc_claimAutoreleasedReturnValue();
  deviceInfo = self->super._deviceInfo;
  self->super._deviceInfo = v24;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v15);
  v26 = (NSString *)objc_claimAutoreleasedReturnValue();
  productInstanceID = self->super._productInstanceID;
  self->super._productInstanceID = v26;

  self->super._MIDIProtocol = v8;
  if ((_DWORD)v8 == 2)
    v28 = 2;
  else
    v28 = 1;
  self->super._supportedMIDIProtocols = v28;
  functionBlocks = self->super._functionBlocks;
  self->super._functionBlocks = (NSArray *)MEMORY[0x1E0C9AA60];

  -[MIDIUMPEndpoint setReceiveBlock:](self, "setReceiveBlock:", v17);
  self->super._endpointType = 1;
  v21 = self;
LABEL_13:

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  unsigned int v5;
  int isKindOfClass;
  char v7;
  objc_super v9;

  v4 = (unsigned __int8 *)a3;
  v9.receiver = self;
  v9.super_class = (Class)MIDIUMPMutableEndpoint;
  v5 = -[MIDIUMPEndpoint isEqual:](&v9, sel_isEqual_, v4);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & v5) == 1)
    v7 = self->_isEnabled == v4[72];
  else
    v7 = v5 & ~(_BYTE)isKindOfClass;

  return v7;
}

- (id)serializeDescription
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MIDIUMPMutableEndpoint;
  -[MIDIUMPEndpoint serializeDescription](&v8, sel_serializeDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isEnabled);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "enabled");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v4, v5);

    v6 = v3;
  }

  return v3;
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
  MIDI2DeviceInfo *v16;
  MIDI2DeviceInfo *deviceInfo;
  NSArray *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  MIDIUMPFunctionBlock *v24;
  NSArray *functionBlocks;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id obj;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
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
  v36 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "product_instance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v8);
  v28 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "protocol");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v9);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "has_static_function_blocks");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v10);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "jrts_receive_capability");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v11);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "jrts_transmit_capability");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v12);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "source");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v13);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "destination");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v14);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "function_blocks");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v15);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)&self->super._name, obj);
  objc_storeStrong((id *)&self->super._deviceInfo, v36);
  objc_storeStrong((id *)&self->super._productInstanceID, v28);
  self->super._MIDIProtocol = objc_msgSend(v29, "intValue");
  +[MIDI2DeviceInfo infoWithInfo:](MIDI2DeviceInfo, "infoWithInfo:", v36);
  v16 = (MIDI2DeviceInfo *)objc_claimAutoreleasedReturnValue();
  deviceInfo = self->super._deviceInfo;
  self->super._deviceInfo = v16;

  self->super._hasStaticFunctionBlocks = objc_msgSend(v30, "BOOLValue");
  self->super._hasJRTSReceiveCapability = objc_msgSend(v32, "BOOLValue");
  self->super._hasJRTSTransmitCapability = objc_msgSend(v33, "BOOLValue");
  self->super._MIDISource = objc_msgSend(v34, "unsignedIntegerValue");
  self->super._MIDIDestination = objc_msgSend(v35, "unsignedIntegerValue");
  v18 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v19 = v27;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v38;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v38 != v21)
          objc_enumerationMutation(v19);
        v23 = *(id *)(*((_QWORD *)&v37 + 1) + 8 * v22);
        v24 = -[MIDIUMPFunctionBlock initWithDescription:]([MIDIUMPFunctionBlock alloc], "initWithDescription:", v23);
        -[NSArray addObject:](v18, "addObject:", v24);

        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v20);
  }

  functionBlocks = self->super._functionBlocks;
  self->super._functionBlocks = v18;

  return 1;
}

- (BOOL)setName:(id)a3 error:(id *)a4
{
  id v6;
  NSString *v7;
  NSString *name;
  void *v9;
  int v10;
  int v11;
  id v12;

  v6 = a3;
  v7 = (NSString *)objc_msgSend(v6, "copy");
  name = self->super._name;
  self->super._name = v7;

  -[MIDIUMPMutableEndpoint serializeDescription](self, "serializeDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = UMPCIObjectSetDescription((MIDIServer *)-[MIDIUMPEndpoint objectRef](self, "objectRef"), v9);
  v11 = v10;
  if (a4 && v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -10844, 0);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a4 = v12;

  }
  return v11 == 0;
}

- (BOOL)registerWithServer
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  id v21;
  int v22;
  const __CFDictionary *v23;
  void *v24;
  id obj;
  uint64_t v26;
  uint64_t v27;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  CFDictionaryRef outDict;
  unsigned int v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  -[MIDIUMPMutableEndpoint serializeDescription](self, "serializeDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "client_owned");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v4, v5);

  v39 = 0;
  if (UMPCIObjectCreate(2, v2, (int *)&v39)
    || (-[MIDIUMPEndpoint setObjectRef:](self, "setObjectRef:", v39),
        outDict = 0,
        MIDIObjectGetDictionaryProperty(-[MIDIUMPEndpoint objectRef](self, "objectRef"), CFSTR("object description"), &outDict)))
  {
    v6 = 0;
  }
  else
  {
    v23 = outDict;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "function_blocks");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFDictionary objectForKey:](v23, "objectForKey:", v8);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      obj = v24;
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
      if (v9)
      {
        v27 = *(_QWORD *)v35;
        while (2)
        {
          v26 = v9;
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v35 != v27)
              objc_enumerationMutation(obj);
            v29 = *(id *)(*((_QWORD *)&v34 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "object");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "objectForKey:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "objectForKey:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (v12)
              v15 = v14 == 0;
            else
              v15 = 1;
            if (v15)
            {

              v6 = 0;
              goto LABEL_29;
            }
            -[MIDIUMPEndpoint functionBlocks](self, "functionBlocks");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = 0u;
            v33 = 0u;
            v30 = 0u;
            v31 = 0u;
            v17 = v16;
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
            if (v18)
            {
              v19 = *(_QWORD *)v31;
              while (2)
              {
                for (j = 0; j != v18; ++j)
                {
                  if (*(_QWORD *)v31 != v19)
                    objc_enumerationMutation(v17);
                  v21 = *(id *)(*((_QWORD *)&v30 + 1) + 8 * j);
                  v22 = objc_msgSend(v21, "functionBlockID");
                  if (objc_msgSend(v14, "unsignedIntegerValue") == v22)
                  {
                    v2 = v3;
                    objc_msgSend(v21, "setObjectRef:", objc_msgSend(v12, "unsignedIntValue"));

                    goto LABEL_25;
                  }

                }
                v2 = v3;
                v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
                if (v18)
                  continue;
                break;
              }
            }
LABEL_25:

          }
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
          if (v9)
            continue;
          break;
        }
      }
      v6 = 1;
LABEL_29:

    }
    else
    {
      v6 = 1;
    }

  }
  return v6;
}

- (BOOL)enableFunctionBlock:(id)a3
{
  id v4;
  MIDIUMPMutableEndpoint *v5;
  BOOL v6;

  v4 = a3;
  objc_msgSend(v4, "UMPEndpoint");
  v5 = (MIDIUMPMutableEndpoint *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
  {
    v6 = 1;
    if (!-[MIDIUMPMutableEndpoint isEnabled](self, "isEnabled"))
    {
      self->_isEnabled = 1;
      v6 = UMPCIObjectSetEnableState((MIDIServer *)-[MIDIUMPEndpoint objectRef](self, "objectRef"), 1) == 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)disableFunctionBlock:(id)a3
{
  id v4;
  MIDIUMPMutableEndpoint *v5;
  BOOL v6;

  v4 = a3;
  objc_msgSend(v4, "UMPEndpoint");
  v5 = (MIDIUMPMutableEndpoint *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
  {
    v6 = 1;
    if (-[MIDIUMPMutableEndpoint isEnabled](self, "isEnabled"))
    {
      self->_isEnabled = 1;
      v6 = UMPCIObjectSetEnableState((MIDIServer *)objc_msgSend(v4, "objectRef"), 0) == 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)changeStreamProtocol:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  BOOL v9;

  v3 = *(_QWORD *)&a3;
  -[MIDIUMPMutableEndpoint serializeDescription](self, "serializeDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "protocol");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v6, v7);

  v8 = UMPCIObjectSetDescription((MIDIServer *)-[MIDIUMPEndpoint objectRef](self, "objectRef"), v5);
  if (!v8)
    self->super._MIDIProtocol = v3;
  v9 = v8 == 0;

  return v9;
}

- (BOOL)setEnabled:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v12;

  v5 = a3;
  if (-[MIDIUMPEndpoint objectRef](self, "objectRef")
    || -[MIDIUMPMutableEndpoint registerWithServer](self, "registerWithServer"))
  {
    v7 = UMPCIObjectSetEnableState((MIDIServer *)-[MIDIUMPEndpoint objectRef](self, "objectRef"), v5);
    if (!v7)
    {
      self->_isEnabled = v5;
      return 1;
    }
    if (a4)
    {
      v8 = *MEMORY[0x1E0CB2F90];
      v9 = v7;
      v10 = (void *)MEMORY[0x1E0CB35C8];
LABEL_9:
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", v8, v9, 0);
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a4 = v12;

    }
  }
  else if (a4)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0CB2F90];
    v9 = -10844;
    goto LABEL_9;
  }
  return 0;
}

- (BOOL)registerFunctionBlocks:(id)a3 markAsStatic:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t j;
  id v20;
  BOOL v21;
  BOOL v22;
  id v23;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v5 = a4;
  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  v9 = v7;
  if (v5)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v31;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v31 != v12)
            objc_enumerationMutation(v10);
          v14 = *(id *)(*((_QWORD *)&v30 + 1) + 8 * i);
          if ((objc_msgSend(v14, "isEnabled") & 1) == 0)
          {
            if (a5)
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -10844, 0);
              v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              *a5 = v23;

            }
            v22 = 0;
            goto LABEL_24;
          }

        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        if (v11)
          continue;
        break;
      }
    }

  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v15 = v8;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v27;
    v18 = 1;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v27 != v17)
          objc_enumerationMutation(v15);
        v20 = *(id *)(*((_QWORD *)&v26 + 1) + 8 * j);
        objc_msgSend(v20, "setFunctionBlockID:", (v18 + j));

        v8 = v9;
      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      v18 += j;
    }
    while (v16);
  }

  -[MIDIUMPEndpoint setFunctionBlocks:](self, "setFunctionBlocks:", v15);
  -[MIDIUMPMutableEndpoint setMutableFunctionBlocks:](self, "setMutableFunctionBlocks:", v15);
  self->super._hasStaticFunctionBlocks = v5;
  v21 = -[MIDIUMPMutableEndpoint setEnabled:error:](self, "setEnabled:error:", 1, a5);
  if (a5)
    v22 = 0;
  else
    v22 = v21;
LABEL_24:

  return v22;
}

- (NSArray)mutableFunctionBlocks
{
  return self->_mutableFunctionBlocks;
}

- (void)setMutableFunctionBlocks:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableFunctionBlocks, 0);
}

+ (id)description
{
  return CFSTR("MIDI UMP Mutable Endpoint");
}

@end
