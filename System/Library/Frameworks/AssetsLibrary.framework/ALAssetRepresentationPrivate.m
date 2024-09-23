@implementation ALAssetRepresentationPrivate

- (ALAssetRepresentationPrivate)initWithManagedAsset:(id)a3 sidecar:(id)a4 extension:(id)a5 library:(id)a6
{
  ALAssetRepresentationPrivate *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ALAssetRepresentationPrivate;
  v10 = -[ALAssetRepresentationPrivate init](&v12, sel_init);
  if (v10)
  {
    v10->_photo = (PLManagedAsset *)a3;
    v10->_sidecar = (PLSidecar *)a4;
    v10->_extension = (NSString *)objc_msgSend(a5, "copy");
    -[ALAssetRepresentationPrivate setLibrary:](v10, "setLibrary:", a6);
    -[ALAssetRepresentationPrivate setIsValid:](v10, "setIsValid:", 1);
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[ALAssetRepresentationPrivate setLibrary:](self, "setLibrary:", 0);

  self->_photoLibrary = 0;
  self->_extension = 0;

  self->_sidecar = 0;
  self->_photo = 0;
  v3.receiver = self;
  v3.super_class = (Class)ALAssetRepresentationPrivate;
  -[ALAssetRepresentationPrivate dealloc](&v3, sel_dealloc);
}

- (void)setLibrary:(id)a3
{
  objc_storeWeak((id *)&self->_library, a3);
}

- (ALAssetsLibrary)library
{
  return (ALAssetsLibrary *)objc_loadWeak((id *)&self->_library);
}

- (void)libraryDidChange
{
  -[ALAssetRepresentationPrivate setIsValid:](self, "setIsValid:", 0);
}

- (BOOL)_isImage
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __40__ALAssetRepresentationPrivate__isImage__block_invoke;
  v4[3] = &unk_24C5ED210;
  v4[4] = self;
  v4[5] = &v5;
  -[ALAssetRepresentationPrivate _performBlockAndWait:](self, "_performBlockAndWait:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)_isVideo
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __40__ALAssetRepresentationPrivate__isVideo__block_invoke;
  v4[3] = &unk_24C5ED210;
  v4[4] = self;
  v4[5] = &v5;
  -[ALAssetRepresentationPrivate _performBlockAndWait:](self, "_performBlockAndWait:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)_performBlockAndWait:(id)a3
{
  ALAssetsLibrary *v5;
  NSObject *v6;
  PLPhotoLibrary *photoLibrary;
  _QWORD *v8;
  _QWORD block[5];
  _QWORD v10[6];
  _QWORD v11[6];
  _QWORD v12[6];

  v5 = -[ALAssetRepresentationPrivate library](self, "library");
  if (v5)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __53__ALAssetRepresentationPrivate__performBlockAndWait___block_invoke;
    v12[3] = &unk_24C5ED288;
    v12[4] = self;
    v12[5] = a3;
    -[ALAssetsLibrary _performBlockAndWait:](v5, "_performBlockAndWait:", v12);
  }
  else if (_CFExecutableLinkedOnOrAfter())
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __53__ALAssetRepresentationPrivate__performBlockAndWait___block_invoke_4;
    block[3] = &unk_24C5ED2D8;
    block[4] = self;
    if (_performBlockAndWait__onceToken != -1)
      dispatch_once(&_performBlockAndWait__onceToken, block);
  }
  else
  {
    objc_sync_enter(self);
    v6 = dispatch_group_create();
    if (-[ALAssetRepresentationPrivate _photoLibrary](self, "_photoLibrary"))
    {
      photoLibrary = self->_photoLibrary;
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __53__ALAssetRepresentationPrivate__performBlockAndWait___block_invoke_3;
      v10[3] = &unk_24C5ED2B0;
      v10[4] = self;
      v10[5] = a3;
      v8 = v10;
    }
    else
    {
      photoLibrary = (PLPhotoLibrary *)+[ALAssetsLibrary _library](ALAssetsLibrary, "_library");
      self->_photoLibrary = photoLibrary;
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __53__ALAssetRepresentationPrivate__performBlockAndWait___block_invoke_2;
      v11[3] = &unk_24C5ED2B0;
      v11[4] = self;
      v11[5] = a3;
      v8 = v11;
    }
    -[PLPhotoLibrary withDispatchGroup:performBlock:](photoLibrary, "withDispatchGroup:performBlock:", v6, v8);
    dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v6);
    objc_sync_exit(self);
  }
}

- (PLManagedAsset)photo
{
  return self->_photo;
}

- (void)setPhoto:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (PLSidecar)sidecar
{
  return self->_sidecar;
}

- (void)setSidecar:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSString)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (PLPhotoLibrary)_photoLibrary
{
  return self->_photoLibrary;
}

- (void)set_photoLibrary:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_library);
}

uint64_t __53__ALAssetRepresentationPrivate__performBlockAndWait___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
}

uint64_t __53__ALAssetRepresentationPrivate__performBlockAndWait___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectWithObjectID:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectID"));
  v3 = (void *)objc_msgSend(v2, "sidecarWithResourceObjectID:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectID"));
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  if (v5 != v2)
  {

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = v2;
    v4 = *(_QWORD *)(a1 + 32);
  }
  v6 = *(void **)(v4 + 32);
  if (v6 != v3)
  {

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = v3;
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __53__ALAssetRepresentationPrivate__performBlockAndWait___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
}

void __53__ALAssetRepresentationPrivate__performBlockAndWait___block_invoke_4(uint64_t a1)
{
  uint64_t v2;

  v2 = objc_opt_class();
  NSLog(CFSTR("invalid attempt to access <%@: %p> past the lifetime of its owning ALAssetsLibrary"), v2, *(_QWORD *)(a1 + 32));
}

uint64_t __40__ALAssetRepresentationPrivate__isVideo__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "isVideo");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __40__ALAssetRepresentationPrivate__isImage__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "isPhoto");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (void)_setupFileDescriptorQueue
{
  void *v2;

  v2 = (void *)objc_opt_class();
  objc_sync_enter(v2);
  if (!__persistentURLQueue)
    __persistentURLQueue = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 10);
  if (!__fileDescriptorDictionary)
    __fileDescriptorDictionary = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 10);
  objc_sync_exit(v2);
}

+ (int)_fileDescriptorForPersistentURL:(id)a3
{
  void *v4;
  unint64_t v5;
  int v6;

  +[ALAssetRepresentationPrivate _setupFileDescriptorQueue](ALAssetRepresentationPrivate, "_setupFileDescriptorQueue");
  v4 = (void *)objc_opt_class();
  objc_sync_enter(v4);
  v5 = objc_msgSend((id)__persistentURLQueue, "indexOfObject:", a3);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL || v5 >= objc_msgSend((id)__persistentURLQueue, "count"))
  {
    v6 = -1;
  }
  else
  {
    v6 = objc_msgSend((id)objc_msgSend((id)__fileDescriptorDictionary, "objectForKey:", a3), "intValue");
    if ((unint64_t)objc_msgSend((id)__persistentURLQueue, "count") >= 2
      && v5 != objc_msgSend((id)__persistentURLQueue, "count") - 1)
    {
      objc_msgSend((id)__persistentURLQueue, "exchangeObjectAtIndex:withObjectAtIndex:", v5);
    }
  }
  objc_sync_exit(v4);
  return v6;
}

+ (int)_updateFileDescriptor:(int)a3 forPersistentURL:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = *(_QWORD *)&a3;
  +[ALAssetRepresentationPrivate _setupFileDescriptorQueue](ALAssetRepresentationPrivate, "_setupFileDescriptorQueue");
  v6 = (void *)objc_opt_class();
  objc_sync_enter(v6);
  v7 = (void *)objc_msgSend((id)__fileDescriptorDictionary, "objectForKey:", a4);
  v8 = v7;
  if (v7)
  {
    if (objc_msgSend(v7, "intValue") != (_DWORD)v5)
    {
      close(v5);
      LODWORD(v5) = objc_msgSend(v8, "intValue");
    }
    v9 = objc_msgSend((id)__persistentURLQueue, "indexOfObject:", a4);
    v10 = objc_msgSend((id)__persistentURLQueue, "count");
    if (v9 != 0x7FFFFFFFFFFFFFFFLL && v9 != v10 - 1)
      objc_msgSend((id)__persistentURLQueue, "exchangeObjectAtIndex:withObjectAtIndex:", v9);
  }
  else
  {
    if ((unint64_t)objc_msgSend((id)__persistentURLQueue, "count") >= 0xA)
    {
      v11 = objc_msgSend((id)__persistentURLQueue, "objectAtIndex:", 0);
      close(objc_msgSend((id)objc_msgSend((id)__fileDescriptorDictionary, "objectForKey:", v11), "intValue"));
      objc_msgSend((id)__fileDescriptorDictionary, "removeObjectForKey:", v11);
      objc_msgSend((id)__persistentURLQueue, "removeObject:", v11);
    }
    objc_msgSend((id)__persistentURLQueue, "addObject:", a4);
    objc_msgSend((id)__fileDescriptorDictionary, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5), a4);
  }
  objc_sync_exit(v6);
  return v5;
}

+ (void)_clearFileDescriptorQueue
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_class();
  objc_sync_enter(v2);
  if (__persistentURLQueue && objc_msgSend((id)__persistentURLQueue, "count"))
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = (void *)__persistentURLQueue;
    v4 = objc_msgSend((id)__persistentURLQueue, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v9;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v3);
          v7 = *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i);
          close(objc_msgSend((id)objc_msgSend((id)__fileDescriptorDictionary, "objectForKey:", v7), "intValue"));
          objc_msgSend((id)__fileDescriptorDictionary, "removeObjectForKey:", v7);
        }
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }
    objc_msgSend((id)__persistentURLQueue, "removeAllObjects");
  }
  objc_sync_exit(v2);
}

@end
