@implementation MPSGraphExecutableConstantData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MPSGraphExecutableConstantData)initWithCoder:(id)a3
{
  id v4;
  MPSGraphExecutableConstantData *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    __assert_rtn("-[MPSGraphExecutableConstantData initWithCoder:]", "MPSGraphConstantData.mm", 27, "[coder allowsKeyedCoding]");
  v13.receiver = self;
  v13.super_class = (Class)MPSGraphExecutableConstantData;
  v5 = -[MPSGraphExecutableConstantData init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mpsgraphPackageURL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPSGraphExecutableConstantData setMpsgraphPackageURL:](v5, "setMpsgraphPackageURL:", v6);

    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("ioSurfaces"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPSGraphExecutableConstantData setIoSurfaces:](v5, "setIoSurfaces:", v11);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "allowsKeyedCoding") & 1) == 0)
    __assert_rtn("-[MPSGraphExecutableConstantData encodeWithCoder:]", "MPSGraphConstantData.mm", 39, "[coder allowsKeyedCoding]");
  -[MPSGraphExecutableConstantData mpsgraphPackageURL](self, "mpsgraphPackageURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("mpsgraphPackageURL"));

  -[MPSGraphExecutableConstantData ioSurfaces](self, "ioSurfaces");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("ioSurfaces"));

}

- (void)loadResources:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  NSDictionary **p_ioSurfaces;
  void *v15;
  NSURL *mpsgraphPackageURL;
  void *v17;
  void *v18;
  id v19;
  id *p_obj;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v19, "resourceOffsets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        -[NSDictionary objectForKeyedSubscript:](self->_ioSurfaces, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10 == 0;

        if (v11)
        {
          objc_msgSend(v19, "resourceOffsets");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v9);

        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v6);
  }

  p_ioSurfaces = &self->_ioSurfaces;
  v15 = (void *)-[NSDictionary mutableCopy](self->_ioSurfaces, "mutableCopy");
  p_obj = &obj;
  obj = v15;
  mpsgraphPackageURL = self->_mpsgraphPackageURL;
  +[MPSGraphPackage getResourceFileName](MPSGraphPackage, "getResourceFileName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL URLByAppendingPathComponent:](mpsgraphPackageURL, "URLByAppendingPathComponent:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  +[MPSGraphPackage readResources:fromURL:usingAllocator:](MPSGraphPackage, "readResources:fromURL:usingAllocator:", v4, v18, llvm::function_ref<char * ()(llvm::StringRef,unsigned long long,unsigned long long)>::callback_fn<-[MPSGraphExecutableConstantData loadResources:]::$_0>, &p_obj);
  objc_storeStrong((id *)p_ioSurfaces, obj);

}

- (id)initForRequest:(id)a3
{
  id v4;
  MPSGraphExecutableConstantData *v5;
  uint64_t v6;
  NSURL *mpsgraphPackageURL;
  uint64_t v8;
  NSDictionary *ioSurfaces;
  MPSGraphExecutableConstantData *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MPSGraphExecutableConstantData;
  v5 = -[MPSGraphExecutableConstantData init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "mpsgraphPackageURL");
    v6 = objc_claimAutoreleasedReturnValue();
    mpsgraphPackageURL = v5->_mpsgraphPackageURL;
    v5->_mpsgraphPackageURL = (NSURL *)v6;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    ioSurfaces = v5->_ioSurfaces;
    v5->_ioSurfaces = (NSDictionary *)v8;

    -[MPSGraphExecutableConstantData loadResources:](v5, "loadResources:", v4);
    v10 = v5;
  }

  return v5;
}

- (void)loadIntoResourceManager:(void *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  int8x16_t *v11;
  const unsigned __int8 *v12;
  uint64_t v13;
  __int128 *v14;
  char v15;
  __int128 *v16;
  char v17;
  _BYTE *v18;
  NSDictionary *obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[24];
  unint64_t v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  unint64_t v31;
  unint64_t v32;
  char v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (!a3)
    __assert_rtn("-[MPSGraphExecutableConstantData loadIntoResourceManager:]", "MPSGraphConstantData.mm", 89, "resourceManager");
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = self->_ioSurfaces;
  v3 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v23 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        -[NSDictionary objectForKeyedSubscript:](self->_ioSurfaces, "objectForKeyedSubscript:", v6);
        v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v8 = objc_msgSend(v7, "baseAddress");
        v9 = objc_msgSend(v7, "allocationSize");
        v10 = (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
        v11 = (int8x16_t *)v10;
        if (v10)
          v12 = (const unsigned __int8 *)strlen(v10);
        else
          v12 = 0;
        v13 = objc_msgSend(v7, "bytesPerElement");
        v27 = (unint64_t)llvm::detail::UniqueFunctionBase<void,void *,unsigned long,unsigned long>::CallbacksHolder<-[MPSGraphExecutableConstantData loadIntoResourceManager:]::$_1,-[MPSGraphExecutableConstantData loadIntoResourceManager:]::$_1,void>::Callbacks
            + 2;
        *(_QWORD *)&v28 = v8;
        *((_QWORD *)&v28 + 1) = v9;
        v29 = v13;
        v32 = (unint64_t)llvm::detail::UniqueFunctionBase<void,void *,unsigned long,unsigned long>::CallbacksHolder<-[MPSGraphExecutableConstantData loadIntoResourceManager:]::$_1,-[MPSGraphExecutableConstantData loadIntoResourceManager:]::$_1,void>::Callbacks
            + 2;
        if ((unint64_t)llvm::detail::UniqueFunctionBase<void,void *,unsigned long,unsigned long>::CallbacksHolder<-[MPSGraphExecutableConstantData loadIntoResourceManager:]::$_1,-[MPSGraphExecutableConstantData loadIntoResourceManager:]::$_1,void>::Callbacks
           + 2 >= 8)
        {
          v30 = *(_OWORD *)v26;
          v31 = *(_QWORD *)&v26[16];
          memset(v26, 173, sizeof(v26));
          v27 = 0;
        }
        v33 = 0;
        mlir::mps::MPSResourceBlobManagerInterface::defineEntryValue((uint64_t)a3, v11, v12, &v28);
        if (v32 >= 8)
        {
          v14 = (v32 & 2) != 0 ? &v30 : (__int128 *)v30;
          (*(void (**)(__int128 *))(v32 & 0xFFFFFFFFFFFFFFF8))(v14);
          v15 = v32;
          if (v32 >= 8)
          {
            if ((v32 & 4) != 0)
            {
              if ((v32 & 2) != 0)
                v16 = &v30;
              else
                v16 = (__int128 *)v30;
              (*(void (**)(__int128 *))((v32 & 0xFFFFFFFFFFFFFFF8) + 16))(v16);
            }
            if ((v15 & 2) == 0)
              llvm::deallocate_buffer((llvm *)v30, *((void **)&v30 + 1));
          }
        }
        v17 = v27;
        if (v27 >= 8)
        {
          if ((v27 & 4) != 0)
          {
            if ((v27 & 2) != 0)
              v18 = v26;
            else
              v18 = *(_BYTE **)v26;
            (*(void (**)(_BYTE *))((v27 & 0xFFFFFFFFFFFFFFF8) + 16))(v18);
          }
          if ((v17 & 2) == 0)
            llvm::deallocate_buffer(*(llvm **)v26, *(void **)&v26[8]);
        }

      }
      v3 = -[NSDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    }
    while (v3);
  }

}

- (void)extendWithRequest:(id)a3
{
  NSURL *v4;
  NSURL *mpsgraphPackageURL;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "mpsgraphPackageURL");

  objc_msgSend(v6, "mpsgraphPackageURL");
  v4 = (NSURL *)objc_claimAutoreleasedReturnValue();
  mpsgraphPackageURL = self->_mpsgraphPackageURL;

  if (v4 != mpsgraphPackageURL && MTLReportFailureTypeEnabled())
    MTLReportFailure();
  -[MPSGraphExecutableConstantData loadResources:](self, "loadResources:", v6);

}

- (NSURL)mpsgraphPackageURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMpsgraphPackageURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSDictionary)ioSurfaces
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIoSurfaces:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ioSurfaces, 0);
  objc_storeStrong((id *)&self->_mpsgraphPackageURL, 0);
}

- (uint64_t)loadResources:
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *p_p;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *__p;
  size_t v24;
  int64_t v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v26[0] = *MEMORY[0x1E0CBBD68];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v9;
  v26[1] = *MEMORY[0x1E0CBBD70];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBBEA0]), "initWithProperties:", v11);
  v13 = **a1;
  v14 = (void *)MEMORY[0x1E0CB3940];
  if (!a2)
  {
    __p = 0;
    v24 = 0;
    p_p = &__p;
    v25 = 0;
    goto LABEL_14;
  }
  if (a3 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (a3 >= 0x17)
  {
    v17 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17)
      v17 = a3 | 7;
    v18 = v17 + 1;
    v15 = operator new(v17 + 1);
    v24 = a3;
    v25 = v18 | 0x8000000000000000;
    __p = v15;
    goto LABEL_10;
  }
  HIBYTE(v25) = a3;
  v15 = &__p;
  if (a3)
LABEL_10:
    memmove(v15, a2, a3);
  *((_BYTE *)v15 + a3) = 0;
  if (v25 >= 0)
    p_p = &__p;
  else
    p_p = __p;
LABEL_14:
  objc_msgSend(v14, "stringWithUTF8String:", p_p, __p, v24, v25);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v19);

  if (SHIBYTE(v25) < 0)
    operator delete(__p);
  v20 = objc_retainAutorelease(v12);
  v21 = objc_msgSend(v20, "baseAddress");

  return v21;
}

@end
