@implementation MIDI2DeviceInfo

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  int v8;
  int v9;
  BOOL v10;

  v4 = (unsigned __int8 *)a3;
  v5 = v4;
  if (__PAIR64__(self->_manufacturerID.sysExIDByte[1], self->_manufacturerID.sysExIDByte[0]) == __PAIR64__(v4[13], v4[12])&& self->_manufacturerID.sysExIDByte[2] == v4[14]&& self->_family == *((unsigned __int16 *)v4 + 4)&& self->_modelNumber == *((unsigned __int16 *)v4 + 5)&& self->_revisionLevel.revisionLevel[0] == v4[15])
  {
    v6 = 0;
    v7 = 3;
    while (v6 != 3)
    {
      v8 = self->_revisionLevel.revisionLevel[v6 + 1];
      v9 = v4[v6++ + 16];
      if (v8 != v9)
      {
        v7 = v6 - 1;
        break;
      }
    }
    v10 = v7 > 2;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (MIDI2DeviceInfo)initWithManufacturerID:(id)a3 family:(unsigned __int16)a4 modelNumber:(unsigned __int16)a5 revisionLevel:(id)a6
{
  int v6;
  MIDI2DeviceInfo *v7;
  char *v11;
  objc_super v13;

  v6 = *(_DWORD *)a3.var0;
  v7 = 0;
  if (!((*(_DWORD *)a3.var0 | (*(_DWORD *)a3.var0 >> 8)) & 0x80 | a3.var0[2] & 0x80)
    && !((a5 | a4) >> 14))
  {
    v13.receiver = self;
    v13.super_class = (Class)MIDI2DeviceInfo;
    v11 = -[MIDI2DeviceInfo init](&v13, sel_init);
    if (v11)
    {
      *((_WORD *)v11 + 6) = v6;
      v11[14] = BYTE2(v6);
      *((_WORD *)v11 + 4) = a4;
      *((_WORD *)v11 + 5) = a5;
      *($A0BF7C2F34202597F9F30F6CD4123348 *)(v11 + 15) = a6;
    }
    self = v11;
    v7 = self;
  }

  return v7;
}

- ($7EB1B296D1955B59A85A052388D5D5F9)manufacturerID
{
  return ($7EB1B296D1955B59A85A052388D5D5F9)(*(unsigned __int16 *)self->_manufacturerID.sysExIDByte | (self->_manufacturerID.sysExIDByte[2] << 16));
}

- (unsigned)family
{
  return self->_family;
}

- (unsigned)modelNumber
{
  return self->_modelNumber;
}

- ($A0BF7C2F34202597F9F30F6CD4123348)revisionLevel
{
  return ($A0BF7C2F34202597F9F30F6CD4123348)self->_revisionLevel;
}

+ (id)description
{
  return CFSTR("MIDI 2.0 DeviceID Info");
}

- (id)serializeDescription
{
  void *v3;
  void *v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  $23B872F0BB0420159AF182FD9B9AE659 *p_revisionLevel;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 3; ++i)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_manufacturerID.sysExIDByte[i]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "manufacturer_id");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, v7);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", self->_family);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "family");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, v9);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", self->_modelNumber);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "model_number");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, v11);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  p_revisionLevel = &self->_revisionLevel;
  do
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", p_revisionLevel->revisionLevel[v13]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v15);

    ++v13;
  }
  while (v13 != 4);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "revision_level");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v12, v16);

  return v3;
}

+ (MIDI2DeviceInfo)infoWithInfo:(id)a3
{
  unsigned __int16 *v3;
  MIDI2DeviceInfo *v4;

  v3 = (unsigned __int16 *)a3;
  v4 = -[MIDI2DeviceInfo initWithManufacturerID:family:modelNumber:revisionLevel:]([MIDI2DeviceInfo alloc], "initWithManufacturerID:family:modelNumber:revisionLevel:", v3[6] | ((unint64_t)*((unsigned __int8 *)v3 + 14) << 16), v3[4], v3[5], *(unsigned int *)((char *)v3 + 15));

  return v4;
}

+ (MIDI2DeviceInfo)infoWithDescription:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int16 v10;
  void *v11;
  void *v12;
  unsigned __int16 v13;
  void *v14;
  void *v15;
  uint64_t j;
  void *v17;
  MIDI2DeviceInfo *v18;
  MIDI2DeviceInfo *v19;
  unsigned int v21;
  unsigned __int16 v22;
  unsigned __int8 v23;

  v3 = a3;
  v23 = 0;
  v22 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "manufacturer_id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  for (i = 0; i != 3; ++i)
  {
    objc_msgSend(v5, "objectAtIndex:", i);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *((_BYTE *)&v22 + i) = objc_msgSend(v7, "unsignedIntValue");

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "family");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntValue");

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "model_number");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedIntValue");

  v21 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "revision_level");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  for (j = 0; j != 4; ++j)
  {
    objc_msgSend(v15, "objectAtIndex:", j);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *((_BYTE *)&v21 + j) = objc_msgSend(v17, "unsignedIntValue");

  }
  v18 = [MIDI2DeviceInfo alloc];
  v19 = -[MIDI2DeviceInfo initWithManufacturerID:family:modelNumber:revisionLevel:](v18, "initWithManufacturerID:family:modelNumber:revisionLevel:", v22 | ((unint64_t)v23 << 16), v10, v13, v21);

  return v19;
}

@end
