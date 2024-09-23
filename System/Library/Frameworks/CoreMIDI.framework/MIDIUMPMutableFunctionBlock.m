@implementation MIDIUMPMutableFunctionBlock

+ (id)description
{
  return CFSTR("MIDI UMP Function Block");
}

- (MIDIUMPMutableFunctionBlock)initWithName:(id)a3 direction:(int)a4 firstGroup:(unsigned __int8)a5 totalGroupsSpanned:(unsigned __int8)a6 maxSysEx8Streams:(unsigned __int8)a7 MIDI1Info:(int)a8 UIHint:(int)a9 isEnabled:(BOOL)a10
{
  id v17;
  __CFBundle *MainBundle;
  const __CFArray *ValueForInfoDictionaryKey;
  const __CFArray *v20;
  MIDIUMPMutableFunctionBlock *v21;
  CFTypeID v23;
  CFRange v24;

  v17 = a3;
  if (CheckVirtualEndpointCreation(void)::virtualEndpointsAllowed < 0)
  {
    CheckVirtualEndpointCreation(void)::virtualEndpointsAllowed = 0;
    MainBundle = CFBundleGetMainBundle();
    if (MainBundle
      && (ValueForInfoDictionaryKey = (const __CFArray *)CFBundleGetValueForInfoDictionaryKey(MainBundle, CFSTR("UIBackgroundModes")), (v20 = ValueForInfoDictionaryKey) != 0)&& (v23 = CFGetTypeID(ValueForInfoDictionaryKey), v23 == CFArrayGetTypeID())&& (v24.length = CFArrayGetCount(v20), v24.location = 0, CFArrayContainsValue(v20, v24, CFSTR("audio"))))
    {
      CheckVirtualEndpointCreation(void)::virtualEndpointsAllowed = 1;
    }
    else if (!CheckVirtualEndpointCreation(void)::virtualEndpointsAllowed)
    {
LABEL_11:
      v21 = 0;
      goto LABEL_12;
    }
  }
  else if (!CheckVirtualEndpointCreation(void)::virtualEndpointsAllowed)
  {
    goto LABEL_11;
  }
  objc_storeStrong((id *)&self->super._name, a3);
  self->super._direction = a4;
  self->super._firstGroup = a5;
  self->super._totalGroupsSpanned = a6;
  self->super._maxSysEx8Streams = a7;
  self->super._MIDI1Info = a8;
  self->super._UIHint = a9;
  self->super._isEnabled = a10;
  v21 = self;
LABEL_12:

  return v21;
}

- (void)setFunctionBlockID:(unsigned __int8)a3
{
  self->super._functionBlockID = a3;
}

- (BOOL)registerWithServer
{
  void *v3;
  int v4;
  unsigned int v6;

  -[MIDIUMPFunctionBlock serializeDescription](self, "serializeDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v4 = UMPCIObjectCreate(1, v3, (int *)&v6);
  if (!v4)
    -[MIDIUMPFunctionBlock setObjectRef:](self, "setObjectRef:", v6);

  return v4 == 0;
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
  if (-[MIDIUMPFunctionBlock objectRef](self, "objectRef")
    || -[MIDIUMPMutableFunctionBlock registerWithServer](self, "registerWithServer"))
  {
    v7 = UMPCIObjectSetEnableState((MIDIServer *)-[MIDIUMPFunctionBlock objectRef](self, "objectRef"), v5);
    if (!v7)
    {
      self->super._isEnabled = v5;
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

  -[MIDIUMPFunctionBlock serializeDescription](self, "serializeDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = UMPCIObjectSetDescription((MIDIServer *)-[MIDIUMPFunctionBlock objectRef](self, "objectRef"), v9);
  v11 = v10;
  if (a4 && v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -10844, 0);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a4 = v12;

  }
  return v11 == 0;
}

- (BOOL)reconfigureWithFirstGroup:(unsigned __int8)a3 direction:(int)a4 MIDI1Info:(int)a5 UIHint:(int)a6 error:(id *)a7
{
  id v13;
  BOOL v14;
  void *v15;
  int v16;
  id v17;

  if (-[MIDIUMPFunctionBlock totalGroupsSpanned](self, "totalGroupsSpanned") + a3 < 0x11)
  {
    if (a4 == 3
      || (-[MIDIUMPFunctionBlock midiCIDevice](self, "midiCIDevice"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v15,
          !v15))
    {
      self->super._firstGroup = a3;
      self->super._direction = a4;
      self->super._MIDI1Info = a5;
      self->super._UIHint = a6;
      -[MIDIUMPFunctionBlock serializeDescription](self, "serializeDescription");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v16 = UMPCIObjectSetDescription((MIDIServer *)-[MIDIUMPFunctionBlock objectRef](self, "objectRef"), v13);
      v14 = v16 == 0;
      if (a7 && v16)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v16, 0);
        v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *a7 = v17;

        v14 = 0;
      }
      goto LABEL_11;
    }
    if (a7)
    {
LABEL_3:
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -10845, 0);
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v14 = 0;
      *a7 = v13;
LABEL_11:

      return v14;
    }
  }
  else if (a7)
  {
    goto LABEL_3;
  }
  return 0;
}

@end
