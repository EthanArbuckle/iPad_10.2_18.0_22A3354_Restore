@implementation LSPlugInQueryWithURL

- (id)_initWithURL:(id)a3
{
  id v5;
  id *v6;
  id *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LSPlugInQueryWithURL;
  v6 = -[LSPlugInQuery _init](&v9, sel__init);
  v7 = v6;
  if (v6)
    objc_storeStrong(v6 + 2, a3);

  return v7;
}

- (id)_bundleURL
{
  return self->_bundleURL;
}

- (void)_enumerateWithXPCConnection:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  int inited;
  id v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  id v13;
  id v14;
  uint64_t v15;
  void **v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  uint64_t v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = (void **)&v15;
  v17 = 0x3812000000;
  v18 = __Block_byref_object_copy__38;
  v19 = __Block_byref_object_dispose__38;
  v20 = 256;
  v21 = 0;
  v14 = 0;
  inited = _LSContextInitReturningError(&v21, &v14);
  v9 = v14;
  if (inited)
  {
    v10 = (__CFString *)CFURLCopyFileSystemPath((CFURLRef)self->_bundleURL, kCFURLPOSIXPathStyle);
    v11 = v10;
    if (v10)
    {
      v12 = v10;
      v13 = v7;
      _CSStoreEnumerateUnits();

    }
    _LSContextDestroy(v16 + 6);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v7 + 2))(v7, 0, v9);
  }

  _Block_object_dispose(&v15, 8);
}

void __58__LSPlugInQueryWithURL__enumerateWithXPCConnection_block___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v9;
  BOOL v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  char v15;

  if (*(_DWORD *)(a3 + 4))
  {
    v9 = _LSContainerGet();
    if (v9)
    {
      v15 = 0;
      v10 = !_LSContainerCheckState(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48), *(unsigned int *)(a3 + 4), v9, &v15, 0)&& v15 == 1;
      if (v10
        && _LSAliasMatchesPath_NoIO(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48), *(_DWORD *)a3, *(void **)(a1 + 32), 0))
      {
        +[LSPlugInKitProxy plugInKitProxyForPlugin:withContext:](LSPlugInKitProxy, "plugInKitProxyForPlugin:withContext:", a2, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          v13 = v11;
          v14 = 0;
        }
        else
        {
          _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -10814, (uint64_t)"-[LSPlugInQueryWithURL _enumerateWithXPCConnection:block:]_block_invoke", 67, 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        *a5 = 1;

      }
    }
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSURL *bundleURL;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LSPlugInQueryWithURL;
  if (-[LSPlugInQuery isEqual:](&v12, sel_isEqual_, v4) && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    bundleURL = self->_bundleURL;
    v6 = v4;
    -[NSURL path](bundleURL, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_bundleURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isEqualToString:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  objc_super v7;

  -[NSURL path](self->_bundleURL, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v7.receiver = self;
  v7.super_class = (Class)LSPlugInQueryWithURL;
  v5 = -[LSPlugInQuery hash](&v7, sel_hash) ^ v4;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_bundleURL, CFSTR("bundleURL"));
}

- (LSPlugInQueryWithURL)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  LSPlugInQueryWithURL *v6;

  v4 = a3;
  objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[LSPlugInQueryWithURL _initWithURL:](self, "_initWithURL:", v5);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleURL, 0);
}

@end
