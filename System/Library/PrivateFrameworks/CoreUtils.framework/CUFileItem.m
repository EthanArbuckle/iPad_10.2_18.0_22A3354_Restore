@implementation CUFileItem

- (CUFileItem)initWithDictionary:(id)a3 error:(id *)a4
{
  const __CFDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CUFileItem *v12;
  unsigned int Int64Ranged;
  CFTypeID TypeID;
  void *v15;
  unint64_t Int64;
  int v17;
  CUFileItem *v18;
  uint64_t v20;
  int v21;

  v6 = (const __CFDictionary *)a3;
  v12 = -[CUFileItem init](self, "init");
  if (v12)
  {
    v21 = 0;
    Int64Ranged = CFDictionaryGetInt64Ranged(v6, &unk_1E25FD1B8, 0, 0xFFFFFFFFLL, &v21);
    if (!v21)
      v12->_flags = Int64Ranged;
    TypeID = CFStringGetTypeID();
    CFDictionaryGetTypedValue(v6, &unk_1E25FD1D0, TypeID, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      objc_storeStrong((id *)&v12->_name, v15);

    Int64 = CFDictionaryGetInt64(v6, &unk_1E25FD1E8, &v21);
    if (!v21)
      v12->_size = Int64;
    v17 = CFDictionaryGetInt64Ranged(v6, &unk_1E25FD200, 0xFFFFFFFF80000000, 0x7FFFFFFFLL, &v21);
    if (!v21)
      v12->_type = v17;
    v18 = v12;
  }
  else if (a4)
  {
    NSErrorF_safe((void *)*MEMORY[0x1E0CB2F90], 4294960596, (uint64_t)"Init failed", v7, v8, v9, v10, v11, v20);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (void)encodeWithDictionary:(id)a3
{
  void *v4;
  NSString *name;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (self->_flags)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v4, &unk_1E25FD1B8);

  }
  name = self->_name;
  if (name)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", name, &unk_1E25FD1D0);
  if (self->_size)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, &unk_1E25FD1E8);

  }
  if (self->_type)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, &unk_1E25FD200);

  }
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  return NSPrintF((uint64_t)"CUFileItem: Name '%@'", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)self->_name);
}

- (unsigned)flags
{
  return self->_flags;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)size
{
  return self->_size;
}

- (void)setSize:(int64_t)a3
{
  self->_size = a3;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
