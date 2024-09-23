@implementation MIDIUMPCIProfile

- (BOOL)hasOwner
{
  id WeakRetained;
  BOOL v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_ciDevice);
  v3 = WeakRetained != 0;

  return v3;
}

- (BOOL)registerToDevice:(id)a3
{
  id v4;
  MIDICIDevice **p_ciDevice;
  id WeakRetained;

  v4 = a3;
  p_ciDevice = &self->_ciDevice;
  WeakRetained = objc_loadWeakRetained((id *)p_ciDevice);

  if (!WeakRetained)
    objc_storeWeak((id *)p_ciDevice, v4);

  return WeakRetained == 0;
}

- (id)serializeDescription
{
  MIDICIDevice **p_ciDevice;
  id WeakRetained;
  NSData *v5;
  void *v6;
  NSData *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
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
  _QWORD v35[11];
  _QWORD v36[13];

  v36[11] = *MEMORY[0x1E0C80C00];
  p_ciDevice = &self->_ciDevice;
  WeakRetained = objc_loadWeakRetained((id *)&self->_ciDevice);

  if (!WeakRetained)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "object");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v32;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[MIDIUMPCIProfile objectRef](self, "objectRef"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v31;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "type");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v28;
  v36[1] = &unk_1E98BEE88;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "name");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v29;
  v36[2] = self->_name;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "type");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v30;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_profileType);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v36[3] = v33;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35[4] = v34;
  v5 = self->_profileID;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_retainAutorelease(v5);
  v8 = -[NSData bytes](v7, "bytes");
  for (i = 0; i != 5; ++i)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v8 + i));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v10);

  }
  v36[4] = v6;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "midi_channel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v35[5] = v27;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_firstChannel);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v36[5] = v26;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "group_offset");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v35[6] = v25;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_groupOffset);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v36[6] = v24;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "enabled");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v35[7] = v23;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isEnabled);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v36[7] = v22;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "enabled_channel_count");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v35[8] = v21;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", self->_enabledChannelCount);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v36[8] = v20;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "total_channel_count");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v35[9] = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", self->_totalChannelCount);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v36[9] = v12;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "owner");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v35[10] = v13;
  v14 = (void *)MEMORY[0x1E0CB37E8];
  v15 = objc_loadWeakRetained((id *)p_ciDevice);
  objc_msgSend(v14, "numberWithUnsignedInt:", objc_msgSend(v15, "objectRef"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v36[10] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  return v18;
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
  void *v22;
  void *v23;
  void *v24;
  NSData *v25;
  NSData *profileID;
  NSString *v27;
  NSString *name;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  char v34;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v5);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "midi_channel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v6);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "profile_type");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v7);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "group_offset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "enabled");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "enabled_channel_count");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "total_channel_count");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "object");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = 0;
    v33 = 0;
    if (objc_msgSend(v17, "count") == 5)
    {
      objc_msgSend(v17, "objectAtIndex:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v33) = objc_msgSend(v20, "unsignedIntValue");

      objc_msgSend(v17, "objectAtIndex:", 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      BYTE1(v33) = objc_msgSend(v21, "unsignedIntValue");

      objc_msgSend(v17, "objectAtIndex:", 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      BYTE2(v33) = objc_msgSend(v22, "unsignedIntValue");

      objc_msgSend(v17, "objectAtIndex:", 3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      HIBYTE(v33) = objc_msgSend(v23, "unsignedIntValue");

      objc_msgSend(v17, "objectAtIndex:", 4);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v24, "unsignedIntValue");

    }
    v25 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v33, 5);
    profileID = self->_profileID;
    self->_profileID = v25;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v32);
    v27 = (NSString *)objc_claimAutoreleasedReturnValue();
    name = self->_name;
    self->_name = v27;

    self->_profileType = objc_msgSend(v30, "unsignedIntValue");
    self->_groupOffset = objc_msgSend(v9, "unsignedIntValue");
    self->_firstChannel = objc_msgSend(v31, "unsignedIntValue");
    self->_enabledChannelCount = objc_msgSend(v13, "unsignedIntValue");
    self->_totalChannelCount = objc_msgSend(v15, "unsignedIntValue");
    self->_isEnabled = objc_msgSend(v11, "BOOLValue");
    self->_objectRef = objc_msgSend(v19, "unsignedIntValue");

  }
  return v4 != 0;
}

- (MIDIUMPCIProfile)initWithProfileID:(id)a3 name:(id)a4 type:(unsigned __int8)a5 firstGroup:(unsigned __int8)a6 firstChannel:(unsigned __int8)a7 enabledChannelCount:(unsigned __int16)a8 totalChannelCount:(unsigned __int16)a9
{
  id v14;
  MIDIUMPCIProfile *v15;
  uint64_t v16;
  NSData *profileID;
  uint64_t v18;
  NSString *name;
  objc_super v21;
  $5812A533162E050B866F6153AD2572B5 v22;

  v22 = a3;
  v14 = a4;
  v21.receiver = self;
  v21.super_class = (Class)MIDIUMPCIProfile;
  v15 = -[MIDIUMPCIProfile init](&v21, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v22, 5);
    profileID = v15->_profileID;
    v15->_profileID = (NSData *)v16;

    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v14);
      v18 = objc_claimAutoreleasedReturnValue();
      name = v15->_name;
      v15->_name = (NSString *)v18;
    }
    else
    {
      name = v15->_name;
      v15->_name = 0;
    }

    v15->_profileType = a5;
    v15->_groupOffset = a6;
    v15->_firstChannel = a7;
    v15->_enabledChannelCount = a8;
    v15->_totalChannelCount = a9;
    v15->_isEnabled = 0;
  }

  return v15;
}

- (MIDIUMPCIProfile)initWithDescription:(id)a3
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
  unsigned __int8 v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  unint64_t v24;
  unsigned __int8 v25;
  unsigned __int8 v26;
  unsigned __int8 v27;
  unsigned __int16 v28;
  MIDIUMPCIProfile *v29;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "midi_channel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v6);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "profile_type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v7);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "group_offset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v8);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "enabled");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v9);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "enabled_channel_count");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v10);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "total_channel_count");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v11);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "object");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "count") == 5)
  {
    objc_msgSend(v13, "objectAtIndex:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "unsignedIntValue");

    objc_msgSend(v13, "objectAtIndex:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v16) = objc_msgSend(v18, "unsignedIntValue");

    objc_msgSend(v13, "objectAtIndex:", 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "unsignedIntValue");

    objc_msgSend(v13, "objectAtIndex:", 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v19) = objc_msgSend(v21, "unsignedIntValue");

    objc_msgSend(v13, "objectAtIndex:", 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "unsignedIntValue");

    v24 = ((_DWORD)v19 << 24) | ((unint64_t)v23 << 32) | (v20 << 16) | (unint64_t)(v16 << 8) | v17;
  }
  else
  {
    v24 = 0;
  }
  v25 = objc_msgSend(v36, "unsignedIntValue");
  v26 = objc_msgSend(v35, "unsignedIntValue");
  v27 = objc_msgSend(v37, "unsignedIntValue");
  v28 = objc_msgSend(v34, "unsignedIntValue");
  LOWORD(v31) = objc_msgSend(v33, "unsignedIntValue");
  v29 = -[MIDIUMPCIProfile initWithProfileID:name:type:firstGroup:firstChannel:enabledChannelCount:totalChannelCount:](self, "initWithProfileID:name:type:firstGroup:firstChannel:enabledChannelCount:totalChannelCount:", v24, v38, v25, v26, v27, v28, v31);
  if (v29)
  {
    -[MIDIUMPCIProfile setObjectRef:](v29, "setObjectRef:", objc_msgSend(v15, "unsignedIntValue"));
    v29->_isMine = 0;
    v29->_isEnabled = objc_msgSend(v32, "BOOLValue");
  }

  return v29;
}

- ($5812A533162E050B866F6153AD2572B5)profileID
{
  unsigned __int8 *v3;
  unsigned int v4;
  uint8x8_t v5;
  uint32x4_t v6;
  int8x16_t v7;
  int8x16_t v8;
  int8x16_t v9;
  uint64_t v10;
  uint64_t v11;
  int8x16_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64x2_t v15;
  uint64x2_t v16;
  int8x16_t v17;
  unint64_t v18;
  $5812A533162E050B866F6153AD2572B5 result;

  if (-[NSData length](self->_profileID, "length") == 5)
  {
    v3 = -[NSData bytes](self->_profileID, "bytes");
    v4 = *v3;
    v5.i32[0] = *(_DWORD *)(v3 + 1);
    v6 = vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(v5));
    v7.i64[0] = v6.u32[2];
    v7.i64[1] = v6.u32[3];
    v8.i64[0] = 255;
    v8.i64[1] = 255;
    v9 = vandq_s8(v7, v8);
    v10 = v9.i64[1];
    v11 = v9.i64[0];
    v7.i64[0] = v6.u32[0];
    v7.i64[1] = v6.u32[1];
    v12 = vandq_s8(v7, v8);
    v13 = v12.i64[1];
    v14 = v12.i64[0];
  }
  else
  {
    v4 = 0;
    v14 = 0;
    v13 = 0;
    v11 = 0;
    v10 = 0;
  }
  v15.i64[0] = v14;
  v15.i64[1] = v13;
  v16.i64[0] = v11;
  v16.i64[1] = v10;
  v17 = vorrq_s8((int8x16_t)vshlq_u64(v15, (uint64x2_t)xmmword_1D4F189F0), (int8x16_t)vshlq_u64(v16, (uint64x2_t)xmmword_1D4F18A00));
  v18 = *(unint64_t *)&vorr_s8(*(int8x8_t *)v17.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v17, v17, 8uLL)) | v4;
  *(_DWORD *)&result.var0.var0 = v18;
  result.var0.var4 = BYTE4(v18);
  return result;
}

- (BOOL)setProfileState:(BOOL)a3 enabledChannelCount:(unsigned __int16)a4 error:(id *)a5
{
  uint64_t v6;
  _BOOL8 v7;
  MIDICIDevice **p_ciDevice;
  id WeakRetained;
  id v11;
  char v12;

  v6 = a4;
  v7 = a3;
  p_ciDevice = &self->_ciDevice;
  WeakRetained = objc_loadWeakRetained((id *)&self->_ciDevice);

  if (!WeakRetained)
    return 0;
  v11 = objc_loadWeakRetained((id *)p_ciDevice);
  v12 = objc_msgSend(v11, "setProfile:newState:enabledChannelCount:error:", self, v7, v6, a5);

  return v12;
}

- (NSString)name
{
  return self->_name;
}

- (unsigned)profileType
{
  return self->_profileType;
}

- (unsigned)groupOffset
{
  return self->_groupOffset;
}

- (unsigned)firstChannel
{
  return self->_firstChannel;
}

- (unsigned)enabledChannelCount
{
  return self->_enabledChannelCount;
}

- (unsigned)totalChannelCount
{
  return self->_totalChannelCount;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (MIDICIDevice)ciDevice
{
  return (MIDICIDevice *)objc_loadWeakRetained((id *)&self->_ciDevice);
}

- (void)setCiDevice:(id)a3
{
  objc_storeWeak((id *)&self->_ciDevice, a3);
}

- (unsigned)objectRef
{
  return self->_objectRef;
}

- (void)setObjectRef:(unsigned int)a3
{
  self->_objectRef = a3;
}

- (BOOL)isMine
{
  return self->_isMine;
}

- (void)setIsMine:(BOOL)a3
{
  self->_isMine = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_ciDevice);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_profileID, 0);
}

+ (id)description
{
  return CFSTR("MIDIUMPCI Profile");
}

@end
