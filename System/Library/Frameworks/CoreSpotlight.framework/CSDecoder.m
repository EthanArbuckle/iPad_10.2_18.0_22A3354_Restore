@implementation CSDecoder

- (void)dealloc
{
  __CFAllocator *contentDeallocator;
  objc_super v4;

  contentDeallocator = self->_contentDeallocator;
  if (contentDeallocator)
    CFRelease(contentDeallocator);
  v4.receiver = self;
  v4.super_class = (Class)CSDecoder;
  -[CSDecoder dealloc](&v4, sel_dealloc);
}

- ($781B0FC3B6CF89EDF0F49E4213B771BC)obj
{
  *($70FB98EE0919CC727AB8FBF44F6186F7 *)retstr = *($70FB98EE0919CC727AB8FBF44F6186F7 *)((char *)self + 32);
  return self;
}

- (CSDecoder)initWithData:(id)a3
{
  id v4;
  CSDecoder *v5;
  id v6;
  unsigned __int16 *v7;
  unint64_t v8;
  id v9;
  __int128 v11;
  $37FF168C8709F524D812460C59637AB1 v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CSDecoder;
  v5 = -[CSDecoder init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_retainAutorelease(v4);
    v7 = (unsigned __int16 *)objc_msgSend(v6, "bytes");
    v8 = objc_msgSend(v6, "length");
    if (v8 >= 0xA && *v7 == 47838 && *(_DWORD *)(v7 + 1) == 256 && v8 == *(_DWORD *)(v7 + 3))
    {
      v9 = objc_retainAutorelease(v6);
      objc_msgSend(v9, "bytes");
      objc_msgSend(v9, "length");
      _MDPlistGetRootPlistObjectFromBytes();
      *(_OWORD *)&v5->_obj.containerBytes = v11;
      v5->_obj.reference = v12;
      objc_storeStrong((id *)&v5->_data, v9);
    }
    else
    {

      v5 = 0;
    }
  }

  return v5;
}

- (id)decodeObject:(id *)a3
{
  $781B0FC3B6CF89EDF0F49E4213B771BC v4;

  v4 = *a3;
  _CSDecodeObject((__int128 *)&v4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_backingStore, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (id)decode
{
  __int128 v3;

  -[CSDecoder obj](self, "obj");
  _CSDecodeObject(&v3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setBackingStore:(id)a3
{
  objc_storeStrong(&self->_backingStore, a3);
}

- (CSDecoder)initWithData:(id)a3 obj:(id *)a4
{
  id v7;
  CSDecoder *v8;
  __int128 v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSDecoder;
  v8 = -[CSDecoder init](&v11, sel_init);
  if (v8)
  {
    if (objc_msgSend(v7, "length"))
    {
      objc_storeStrong((id *)&v8->_data, a3);
      v9 = *(_OWORD *)&a4->var0;
      v8->_obj.reference = ($37FF168C8709F524D812460C59637AB1)a4->var2;
      *(_OWORD *)&v8->_obj.containerBytes = v9;
    }
    else
    {

      v8 = 0;
    }
  }

  return v8;
}

- (id)decodeObjectNoCopy:(id *)a3
{
  $781B0FC3B6CF89EDF0F49E4213B771BC v4;

  v4 = *a3;
  _CSDecodeObject((__int128 *)&v4, self);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  $70FB98EE0919CC727AB8FBF44F6186F7 obj;

  v2 = (void *)MEMORY[0x1E0CB3940];
  obj = self->_obj;
  CSDecodeObject((uint64_t)&obj);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  $70FB98EE0919CC727AB8FBF44F6186F7 obj;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  obj = self->_obj;
  CSDecodeObject((uint64_t)&obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)decodeURLPreservingSecurityScope:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)MEMORY[0x1E0CB3710];
    v5 = (void *)MEMORY[0x1E0C99E60];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v19[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v4, "unarchivedObjectOfClasses:fromData:error:", v7, v3, &v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v16;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("path"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v8 && v10)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ss"));
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        MEMORY[0x18D781ABC](v12, v13);
      }
      else
      {
        logForCSLogCategoryDefault();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v18 = v11;
          _os_log_impl(&dword_18C42F000, v14, OS_LOG_TYPE_INFO, "no ss attached to URL for path %@", buf, 0xCu);
        }

      }
    }
    else
    {
      logForCSLogCategoryDefault();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        +[CSDecoder decodeURLPreservingSecurityScope:].cold.1((uint64_t)v9, v13);
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSData)data
{
  return self->_data;
}

- (id)backingStore
{
  return self->_backingStore;
}

- (__CFAllocator)contentDeallocator
{
  return self->_contentDeallocator;
}

+ (void)decodeURLPreservingSecurityScope:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18C42F000, a2, OS_LOG_TYPE_ERROR, "urlWrapper unarchive failed: %@", (uint8_t *)&v2, 0xCu);
}

@end
