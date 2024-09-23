@implementation CSCoder

- (void)encodeObject:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "encodeWithCSCoder:", self);
  else
    _MDPlistContainerAddObject();

}

- (_MDPlistContainer)container
{
  return self->_container;
}

- (void)endArray
{
  _MDPlistContainerEndArray();
}

- (void)beginArray
{
  _MDPlistContainerBeginArray();
}

- (void)endType
{
  _MDPlistContainerEndArray();
}

- (void)endDictionary
{
  _MDPlistContainerEndDictionary();
}

- (void)encodeInt32:(int)a3
{
  _MDPlistContainerAddInt32Value();
}

- (void)beginType:(const char *)a3
{
  char __str[16];
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  _MDPlistContainerBeginArray();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  *(_OWORD *)__str = 0u;
  v5 = 0u;
  snprintf(__str, 0x100uLL, "%s%s", "__class:", a3);
  _MDPlistContainerAddCString();
}

- (void)beginDictionary
{
  _MDPlistContainerBeginDictionary();
}

- (_MDPlistContainer)plistContainer
{
  if (!self->_finalized && self->_container)
  {
    _MDPlistContainerEndContainer();
    self->_finalized = 1;
  }
  return self->_container;
}

- (CSCoder)init
{
  CSCoder *v2;
  uint64_t Mutable;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSCoder;
  v2 = -[CSCoder init](&v5, sel_init);
  if (v2)
  {
    Mutable = _MDPlistContainerCreateMutable();
    v2->_container = (_MDPlistContainer *)Mutable;
    if (Mutable)
    {
      _MDPlistContainerBeginContainer();
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (void)dealloc
{
  _MDPlistContainer *container;
  objc_super v4;

  container = self->_container;
  if (container)
  {
    if (!self->_finalized)
    {
      _MDPlistContainerEndContainer();
      container = self->_container;
    }
    CFRelease(container);
  }
  v4.receiver = self;
  v4.super_class = (Class)CSCoder;
  -[CSCoder dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

- (NSData)data
{
  void *v3;
  uint64_t Bytes;
  NSData *v5;
  NSData *data;

  if (!self->_data && -[CSCoder plistContainer](self, "plistContainer"))
  {
    v3 = (void *)MEMORY[0x1E0C99D50];
    Bytes = _MDPlistContainerGetBytes();
    objc_msgSend(v3, "dataWithBytesNoCopy:length:freeWhenDone:", Bytes, _MDPlistContainerGetLength(), 0);
    v5 = (NSData *)objc_claimAutoreleasedReturnValue();
    data = self->_data;
    self->_data = v5;

  }
  return self->_data;
}

- (void)encodeString:(const char *)a3 length:(int64_t)a4
{
  _MDPlistContainerAddCString();
}

- (void)encodeMDPlistObject:(id *)a3
{
  int PlistObjectType;
  void *v6;
  $781B0FC3B6CF89EDF0F49E4213B771BC v7;

  v7 = *a3;
  PlistObjectType = _MDPlistGetPlistObjectType();
  if (PlistObjectType == 246)
  {
    v7 = *a3;
    _MDPlistDataGetBytePtr();
    _MDPlistContainerAddDataValue();
  }
  else
  {
    v7 = *a3;
    if (PlistObjectType == 244)
    {
      _MDPlistStringGetValue();
      _MDPlistContainerAddCString();
    }
    else
    {
      CSDecodeObject((uint64_t)&v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSCoder encodeObject:](self, "encodeObject:", v6);

    }
  }
}

- (void)encodeBool:(BOOL)a3
{
  _MDPlistContainerAddBooleanValue();
}

- (void)encodeInt64:(int64_t)a3
{
  _MDPlistContainerAddInt64Value();
}

- (void)encodeDouble:(double)a3
{
  _MDPlistContainerAddDoubleValue();
}

- (void)encodeString:(const char *)a3
{
  _MDPlistContainerAddCString();
}

- (void)encodeData:(const void *)a3 length:(int64_t)a4
{
  _MDPlistContainerAddDataValue();
}

- (void)encodeObject:(id)a3 withKey:(id)a4
{
  id v6;

  if (a3)
  {
    v6 = a3;
    -[CSCoder encodeObject:](self, "encodeObject:", a4);
    -[CSCoder encodeObject:](self, "encodeObject:", v6);

  }
}

- (void)encodeObject:(id)a3 forKey:(const char *)a4 keyLength:(int64_t)a5
{
  id v6;

  v6 = a3;
  _MDPlistContainerAddCString();
  -[CSCoder encodeObject:](self, "encodeObject:", v6);

}

- (void)encodeString:(const char *)a3 stringLength:(int64_t)a4 forKey:(const char *)a5 keyLength:(int64_t)a6
{
  _MDPlistContainerAddCString();
  _MDPlistContainerAddCString();
}

- (void)encodeNSString:(id)a3
{
  if (a3)
    _MDPlistContainerAddObject();
  else
    _MDPlistContainerAddCString();
}

+ (id)encodeURLPreservingSecurityScope:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  const void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("path"));

  v7 = (const void *)MEMORY[0x18D781AC8](v4);
  if (v7)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("ss"));
    CFRelease(v7);
  }
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)finalized
{
  return self->_finalized;
}

@end
