@implementation ALAssetsGroupPrivate

- (ALAssetsGroupPrivate)initWithAlbum:(id)a3 library:(id)a4
{
  ALAssetsGroupPrivate *v6;
  _QWORD v8[5];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ALAssetsGroupPrivate;
  v6 = -[ALAssetsGroupPrivate init](&v9, sel_init);
  if (v6)
  {
    if (PLIsCloudPhotoLibraryEnabledForCurrentUser())
      v6->_applyHyperionFilter = 1;
    -[ALAssetsGroupPrivate setAlbum:](v6, "setAlbum:", a3);
    v6->_propertyValues = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v6->_loadedAssets = 0;
    v6->_isValid = 1;
    -[ALAssetsGroupPrivate setLibrary:](v6, "setLibrary:", a4);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __46__ALAssetsGroupPrivate_initWithAlbum_library___block_invoke;
    v8[3] = &unk_24C5ED260;
    v8[4] = v6;
    -[ALAssetsGroupPrivate _performBlockAndWait:](v6, "_performBlockAndWait:", v8);
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[ALAssetsGroupPrivate setLibrary:](self, "setLibrary:", 0);
  self->_photoLibrary = 0;

  v3.receiver = self;
  v3.super_class = (Class)ALAssetsGroupPrivate;
  -[ALAssetsGroupPrivate dealloc](&v3, sel_dealloc);
}

- (void)setAssetsFilter:(id)a3
{
  ALAssetsFilter *assetsFilter;

  assetsFilter = self->_assetsFilter;
  if (assetsFilter != a3)
  {

    self->_assetsFilter = (ALAssetsFilter *)a3;
    -[ALAssetsGroupPrivate updateAlbumFiltering](self, "updateAlbumFiltering");
  }
}

- (int)albumFilter
{
  ALAssetsFilter *assetsFilter;
  int v4;
  _BOOL4 v5;
  int v6;
  int v7;
  int v8;
  int v9;

  assetsFilter = self->_assetsFilter;
  v4 = 9728;
  if (assetsFilter)
    v4 = -[ALAssetsFilter _filter](assetsFilter, "_filter") | 0x2600;
  v5 = -[ALAssetsGroupPrivate isCloudSharedGroup](self, "isCloudSharedGroup");
  v6 = v4 | 0x80;
  if (!v5)
    v6 = v4;
  if (self->_applyHyperionFilter)
    v7 = v6 | 0x100;
  else
    v7 = v6;
  v8 = PLIsCloudPhotoLibraryEnabledForCurrentUser();
  v9 = v7 | 0x800;
  if (!v8)
    v9 = v7;
  return v9 | 0x1000;
}

- (void)resetAssets
{
  NSMutableDictionary *propertyValues;

  propertyValues = self->_propertyValues;
  objc_sync_enter(propertyValues);
  -[NSMutableDictionary removeAllObjects](self->_propertyValues, "removeAllObjects");
  objc_sync_exit(propertyValues);
}

- (void)updateAlbumFiltering
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __44__ALAssetsGroupPrivate_updateAlbumFiltering__block_invoke;
  v2[3] = &unk_24C5ED260;
  v2[4] = self;
  -[ALAssetsGroupPrivate _performBlockAndWait:](self, "_performBlockAndWait:", v2);
}

- (void)populateAssets
{
  if (!self->_loadedAssets)
  {
    self->_loadedAssets = 1;
    -[ALAssetsGroupPrivate updateAlbumFiltering](self, "updateAlbumFiltering");
  }
}

- (id)valueForProperty:(id)a3
{
  NSMutableDictionary *propertyValues;
  id v6;

  propertyValues = self->_propertyValues;
  objc_sync_enter(propertyValues);
  v6 = (id)-[NSMutableDictionary objectForKey:](self->_propertyValues, "objectForKey:", a3);
  objc_sync_exit(propertyValues);
  return v6;
}

- (void)setValue:(id)a3 forProperty:(id)a4
{
  NSMutableDictionary *propertyValues;

  propertyValues = self->_propertyValues;
  objc_sync_enter(propertyValues);
  -[NSMutableDictionary setObject:forKey:](self->_propertyValues, "setObject:forKey:", a3, a4);
  objc_sync_exit(propertyValues);
}

- (void)setLibrary:(id)a3
{
  objc_storeWeak((id *)&self->_library, a3);
}

- (ALAssetsLibrary)library
{
  return (ALAssetsLibrary *)objc_loadWeak((id *)&self->_library);
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

  v5 = -[ALAssetsGroupPrivate library](self, "library");
  if (v5)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __45__ALAssetsGroupPrivate__performBlockAndWait___block_invoke;
    v12[3] = &unk_24C5ED288;
    v12[4] = self;
    v12[5] = a3;
    -[ALAssetsLibrary _performBlockAndWait:](v5, "_performBlockAndWait:", v12);
  }
  else if (_CFExecutableLinkedOnOrAfter())
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __45__ALAssetsGroupPrivate__performBlockAndWait___block_invoke_4;
    block[3] = &unk_24C5ED2D8;
    block[4] = self;
    if (_performBlockAndWait__onceToken_367 != -1)
      dispatch_once(&_performBlockAndWait__onceToken_367, block);
  }
  else
  {
    objc_sync_enter(self);
    v6 = dispatch_group_create();
    if (-[ALAssetsGroupPrivate _photoLibrary](self, "_photoLibrary"))
    {
      photoLibrary = self->_photoLibrary;
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __45__ALAssetsGroupPrivate__performBlockAndWait___block_invoke_3;
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
      v11[2] = __45__ALAssetsGroupPrivate__performBlockAndWait___block_invoke_2;
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

- (PLAlbumProtocol)album
{
  return self->_album;
}

- (void)setAlbum:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (ALAssetsFilter)assetsFilter
{
  return self->_assetsFilter;
}

- (unint64_t)groupType
{
  return self->_groupType;
}

- (void)setGroupType:(unint64_t)a3
{
  self->_groupType = a3;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (NSMutableDictionary)propertyValues
{
  return self->_propertyValues;
}

- (void)setPropertyValues:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (PLPhotoLibrary)_photoLibrary
{
  return self->_photoLibrary;
}

- (void)set_photoLibrary:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (BOOL)isCloudSharedGroup
{
  return self->_isCloudSharedGroup;
}

- (void)setIsCloudSharedGroup:(BOOL)a3
{
  self->_isCloudSharedGroup = a3;
}

- (BOOL)applyHyperionFilter
{
  return self->_applyHyperionFilter;
}

- (void)setApplyHyperionFilter:(BOOL)a3
{
  self->_applyHyperionFilter = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_library);
}

uint64_t __45__ALAssetsGroupPrivate__performBlockAndWait___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
}

uint64_t __45__ALAssetsGroupPrivate__performBlockAndWait___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = (void *)objc_msgSend(MEMORY[0x24BE71FB8], "unfilteredAlbum:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
    v3 = objc_msgSend(MEMORY[0x24BE71FB8], "filteredAlbum:filter:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectWithObjectID:", objc_msgSend(v2, "objectID")), objc_msgSend(*(id *)(a1 + 32), "albumFilter"));
LABEL_5:
    v4 = (void *)v3;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectWithObjectID:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectID"));
    goto LABEL_5;
  }
  NSLog(CFSTR("don't know how to synthesize a workaround album after ALAssetsLibrary was released for ALAssetsGroup %p"), *(_QWORD *)(a1 + 32));
  v4 = 0;
LABEL_7:
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (v5 != v4)
  {

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = v4;
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __45__ALAssetsGroupPrivate__performBlockAndWait___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
}

void __45__ALAssetsGroupPrivate__performBlockAndWait___block_invoke_4(uint64_t a1)
{
  uint64_t v2;

  v2 = objc_opt_class();
  NSLog(CFSTR("invalid attempt to access <%@: %p> past the lifetime of its owning ALAssetsLibrary"), v2, *(_QWORD *)(a1 + 32));
}

uint64_t __44__ALAssetsGroupPrivate_updateAlbumFiltering__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  uint64_t v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "setAlbum:", objc_msgSend(MEMORY[0x24BE71FB8], "filteredAlbum:filter:", a3, objc_msgSend(*(id *)(a1 + 32), "albumFilter")));
  v5 = (void *)MEMORY[0x24BE71FB8];
  v6 = objc_msgSend(*(id *)(a1 + 32), "albumFilter");
  return objc_msgSend(a3, "setALAssetsGroupFilterPredicate:", objc_msgSend(v5, "predicateForAlbumFilter:parameters:photoLibrary:", v6, 0, objc_msgSend(MEMORY[0x24BE72040], "systemPhotoLibrary")));
}

uint64_t __46__ALAssetsGroupPrivate_initWithAlbum_library___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t result;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = a2;
  result = objc_msgSend(a3, "isCloudSharedAlbum");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 25) = result;
  return result;
}

@end
