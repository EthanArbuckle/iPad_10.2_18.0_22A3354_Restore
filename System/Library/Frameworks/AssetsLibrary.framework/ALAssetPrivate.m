@implementation ALAssetPrivate

- (ALAssetPrivate)initWithManagedAsset:(id)a3 library:(id)a4
{
  ALAssetPrivate *v6;
  ALAssetPrivate *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ALAssetPrivate;
  v6 = -[ALAssetPrivate init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[ALAssetPrivate setPhoto:](v6, "setPhoto:", a3);
    -[ALAssetPrivate setLibrary:](v7, "setLibrary:", a4);
    -[ALAssetPrivate setIsValid:](v7, "setIsValid:", 1);
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  self->_photoLibrary = 0;
  -[ALAssetPrivate setLibrary:](self, "setLibrary:", 0);
  -[ALAssetPrivate setPhoto:](self, "setPhoto:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ALAssetPrivate;
  -[ALAssetPrivate dealloc](&v3, sel_dealloc);
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
  -[ALAssetPrivate setIsValid:](self, "setIsValid:", 0);
}

- (BOOL)isDeletable
{
  char v2;
  _QWORD v4[5];
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
  v4[2] = __29__ALAssetPrivate_isDeletable__block_invoke;
  v4[3] = &unk_24C5ED238;
  v4[4] = &v5;
  -[ALAssetPrivate _performBlockAndWait:](self, "_performBlockAndWait:", v4);
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

  v5 = -[ALAssetPrivate library](self, "library");
  if (v5)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __39__ALAssetPrivate__performBlockAndWait___block_invoke;
    v12[3] = &unk_24C5ED288;
    v12[4] = self;
    v12[5] = a3;
    -[ALAssetsLibrary _performBlockAndWait:](v5, "_performBlockAndWait:", v12);
  }
  else if (_CFExecutableLinkedOnOrAfter())
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39__ALAssetPrivate__performBlockAndWait___block_invoke_4;
    block[3] = &unk_24C5ED2D8;
    block[4] = self;
    if (_performBlockAndWait__onceToken_270 != -1)
      dispatch_once(&_performBlockAndWait__onceToken_270, block);
  }
  else
  {
    objc_sync_enter(self);
    v6 = dispatch_group_create();
    if (-[ALAssetPrivate _photoLibrary](self, "_photoLibrary"))
    {
      photoLibrary = self->_photoLibrary;
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __39__ALAssetPrivate__performBlockAndWait___block_invoke_3;
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
      v11[2] = __39__ALAssetPrivate__performBlockAndWait___block_invoke_2;
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
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_library);
}

uint64_t __39__ALAssetPrivate__performBlockAndWait___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
}

uint64_t __39__ALAssetPrivate__performBlockAndWait___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectWithObjectID:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectID"));
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (v3 != v2)
  {

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = v2;
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __39__ALAssetPrivate__performBlockAndWait___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
}

void __39__ALAssetPrivate__performBlockAndWait___block_invoke_4(uint64_t a1)
{
  uint64_t v2;

  v2 = objc_opt_class();
  NSLog(CFSTR("invalid attempt to access <%@: %p> past the lifetime of its owning ALAssetsLibrary"), v2, *(_QWORD *)(a1 + 32));
}

uint64_t __29__ALAssetPrivate_isDeletable__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "isDeletableFromAssetsLibrary");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
