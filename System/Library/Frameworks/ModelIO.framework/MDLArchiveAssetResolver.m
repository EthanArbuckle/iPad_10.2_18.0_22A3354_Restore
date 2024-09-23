@implementation MDLArchiveAssetResolver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_rootUSDPath, 0);
  objc_storeStrong((id *)&self->_archiveDictionary, 0);
  objc_storeStrong((id *)&self->_archiveURL, 0);
}

- (MDLArchiveAssetResolver)initWithURL:(id)a3
{
  id v5;
  MDLArchiveAssetResolver *v6;
  MDLArchiveAssetResolver *v7;
  NSString *rootUSDPath;
  uint64_t v9;
  NSMutableDictionary *archiveDictionary;
  MDLArchiveAssetResolver *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MDLArchiveAssetResolver;
  v6 = -[MDLArchiveAssetResolver init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_archiveURL, a3);
    rootUSDPath = v7->_rootUSDPath;
    v7->_rootUSDPath = 0;

    v9 = objc_opt_new();
    archiveDictionary = v7->_archiveDictionary;
    v7->_archiveDictionary = (NSMutableDictionary *)v9;

    v11 = v7;
  }

  return v7;
}

- (id)resolveAssetNamed:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  char *v6;
  const char *v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  void *v13;
  char v14;
  void *v15[2];
  uint64_t v16;
  void *__p;
  char v18;
  __int128 v19;
  uint64_t v20;

  v3 = objc_retainAutorelease(a3);
  v6 = (char *)objc_msgSend_UTF8String(v3, v4, v5);
  sub_1DCB0345C(&v13, v6);
  pxrInternal__aapl__pxrReserved__::ArSplitPackageRelativePathOuter();
  v19 = *(_OWORD *)v15;
  v20 = v16;
  v15[1] = 0;
  v16 = 0;
  v15[0] = 0;
  if (v18 < 0)
  {
    operator delete(__p);
    if (SHIBYTE(v16) < 0)
      operator delete(v15[0]);
  }
  if (v14 < 0)
    operator delete(v13);
  v8 = (void *)MEMORY[0x1E0C99E98];
  if (v20 >= 0)
    objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v7, (uint64_t)&v19);
  else
    objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v7, v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileURLWithPath_(v8, v10, (uint64_t)v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (SHIBYTE(v20) < 0)
    operator delete((void *)v19);

  return v11;
}

- (id)resolveInsideArchiveWithAssetNamed:(id)a3
{
  objc_msgSend_objectForKey_(self->_archiveDictionary, a2, (uint64_t)a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSData)data
{
  return self->_data;
}

- (void)addResolvedAssetNamed:(id)a3 offset:(unint64_t)a4 fileSize:(unint64_t)a5
{
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v10;
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v11, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v12;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v13, (uint64_t)v18, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKey_(self->_archiveDictionary, v15, (uint64_t)v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = v16 == 0;

  if ((_DWORD)v10)
    objc_msgSend_setObject_forKeyedSubscript_(self->_archiveDictionary, v17, (uint64_t)v14, v8);

}

- (BOOL)canResolveAssetNamed:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend_objectForKey_(self->_archiveDictionary, a2, (uint64_t)a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)assetNamesInArchive
{
  NSMutableDictionary *archiveDictionary;
  const char *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_1DCB060D8;
  v12 = sub_1DCB060E8;
  v13 = 0;
  v13 = (id)objc_opt_new();
  archiveDictionary = self->_archiveDictionary;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1DCB060F0;
  v7[3] = &unk_1EA5770B8;
  v7[4] = &v8;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(archiveDictionary, v4, (uint64_t)v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)removeAssetNamed:(id)a3
{
  const char *v4;
  void *v5;
  const char *v6;
  id v7;

  v7 = a3;
  objc_msgSend_objectForKey_(self->_archiveDictionary, v4, (uint64_t)v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend_removeObjectForKey_(self->_archiveDictionary, v6, (uint64_t)v7);

}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

@end
