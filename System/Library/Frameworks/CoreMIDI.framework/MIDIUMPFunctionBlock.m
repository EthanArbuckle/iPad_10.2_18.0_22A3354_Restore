@implementation MIDIUMPFunctionBlock

+ (id)description
{
  return CFSTR("MIDI UMP Function Block");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  v5 = -[NSString isEqualToString:](self->_name, "isEqualToString:", v4[1])
    && self->_functionBlockID == *((unsigned __int8 *)v4 + 16)
    && self->_direction == *((_DWORD *)v4 + 5)
    && self->_firstGroup == *((unsigned __int8 *)v4 + 24)
    && self->_totalGroupsSpanned == *((unsigned __int8 *)v4 + 25)
    && self->_maxSysEx8Streams == *((unsigned __int8 *)v4 + 26)
    && self->_MIDI1Info == *((_DWORD *)v4 + 7)
    && self->_UIHint == *((_DWORD *)v4 + 8)
    && self->_isEnabled == *((unsigned __int8 *)v4 + 48);

  return v5;
}

- (MIDIUMPFunctionBlock)initWithDescription:(id)a3
{
  -[MIDIUMPFunctionBlock deserialize:](self, "deserialize:", a3);
  self->_isMine = 0;
  return self;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  id obj;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v6);
  obj = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "direction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "first_group");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "groups_spanned");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "max_sysex8_stream");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "midi1_info");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "ui_hint");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "enabled");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "object");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  self->_functionBlockID = objc_msgSend(v23, "unsignedIntegerValue");
  objc_storeStrong((id *)&self->_name, obj);
  self->_direction = objc_msgSend(v24, "unsignedIntegerValue");
  self->_firstGroup = objc_msgSend(v9, "unsignedIntegerValue");
  self->_totalGroupsSpanned = objc_msgSend(v11, "unsignedIntegerValue");
  self->_maxSysEx8Streams = objc_msgSend(v13, "unsignedIntValue");
  self->_MIDI1Info = objc_msgSend(v15, "unsignedIntegerValue");
  self->_UIHint = objc_msgSend(v17, "unsignedIntegerValue");
  self->_isEnabled = objc_msgSend(v19, "BOOLValue");
  self->_objectRef = objc_msgSend(v21, "unsignedIntValue");

  return 1;
}

- (id)serializeDescription
{
  MIDIUMPEndpoint **p_UMPEndpoint;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
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
  _QWORD v30[11];
  _QWORD v31[13];

  v31[11] = *MEMORY[0x1E0C80C00];
  p_UMPEndpoint = &self->_UMPEndpoint;
  WeakRetained = objc_loadWeakRetained((id *)&self->_UMPEndpoint);

  if (!WeakRetained)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "object");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v29;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_objectRef);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v28;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "type");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v27;
  v31[1] = &unk_1E98BEEA0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v26;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_functionBlockID);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v25;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "name");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v24;
  v31[3] = self->_name;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "first_group");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30[4] = v23;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_firstGroup);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v31[4] = v22;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "groups_spanned");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v30[5] = v21;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_totalGroupsSpanned);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v31[5] = v20;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "max_sysex8_stream");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30[6] = v19;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_maxSysEx8Streams);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v31[6] = v18;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "midi1_info");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30[7] = v17;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_MIDI1Info);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31[7] = v5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "ui_hint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30[8] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_UIHint);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31[8] = v7;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "enabled");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30[9] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isEnabled);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31[9] = v9;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "owner");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[10] = v10;
  v11 = (void *)MEMORY[0x1E0CB37E8];
  v12 = objc_loadWeakRetained((id *)p_UMPEndpoint);
  objc_msgSend(v11, "numberWithUnsignedInt:", objc_msgSend(v12, "objectRef"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31[10] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  return v15;
}

- (void)setFunctionBlockID:(unsigned __int8)a3
{
  self->_functionBlockID = a3;
}

- (void)setEndpoint:(id)a3
{
  objc_storeWeak((id *)&self->_UMPEndpoint, a3);
}

- (MIDICIDevice)midiCIDevice
{
  MIDIUMPEndpoint **p_UMPEndpoint;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  int v11;
  id v12;
  int v13;
  id v14;
  id v15;
  char v16;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  p_UMPEndpoint = &self->_UMPEndpoint;
  WeakRetained = objc_loadWeakRetained((id *)&self->_UMPEndpoint);

  if (!WeakRetained)
    return (MIDICIDevice *)0;
  +[MIDICIDeviceManager sharedInstance](MIDICIDeviceManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "devices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "MIDISource");
        v12 = objc_loadWeakRetained((id *)p_UMPEndpoint);
        if (v11 != objc_msgSend(v12, "MIDISource"))
          goto LABEL_12;
        v13 = objc_msgSend(v10, "MIDIDestination");
        v14 = objc_loadWeakRetained((id *)p_UMPEndpoint);
        if (v13 != objc_msgSend(v14, "MIDIDestination"))
        {

LABEL_12:
          continue;
        }
        v15 = objc_loadWeakRetained((id *)p_UMPEndpoint);
        v16 = objc_msgSend(v15, "containsFunctionBlock:", self);

        if ((v16 & 1) != 0)
        {
          v18 = v10;
          goto LABEL_17;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }
  v18 = 0;
LABEL_17:

  return (MIDICIDevice *)v18;
}

- (NSString)name
{
  return self->_name;
}

- (unsigned)functionBlockID
{
  return self->_functionBlockID;
}

- (int)direction
{
  return self->_direction;
}

- (unsigned)firstGroup
{
  return self->_firstGroup;
}

- (unsigned)totalGroupsSpanned
{
  return self->_totalGroupsSpanned;
}

- (unsigned)maxSysEx8Streams
{
  return self->_maxSysEx8Streams;
}

- (int)MIDI1Info
{
  return self->_MIDI1Info;
}

- (int)UIHint
{
  return self->_UIHint;
}

- (MIDIUMPEndpoint)UMPEndpoint
{
  return (MIDIUMPEndpoint *)objc_loadWeakRetained((id *)&self->_UMPEndpoint);
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
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
  objc_destroyWeak((id *)&self->_UMPEndpoint);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
