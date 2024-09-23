@implementation ALAssetsGroup

- (ALAssetsGroup)initWithPhotoAlbum:(id)a3 library:(id)a4 type:(unint64_t)a5
{
  ALAssetsGroup *v8;
  ALAssetsGroupPrivate *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ALAssetsGroup;
  v8 = -[ALAssetsGroup init](&v11, sel_init);
  if (v8)
  {
    v9 = -[ALAssetsGroupPrivate initWithAlbum:library:]([ALAssetsGroupPrivate alloc], "initWithAlbum:library:", a3, a4);
    -[ALAssetsGroupPrivate setGroupType:](v9, "setGroupType:", a5);
    -[ALAssetsGroup setInternal:](v8, "setInternal:", v9);

    objc_msgSend(a4, "registerAlbum:assetGroupPrivate:", a3, -[ALAssetsGroup internal](v8, "internal"));
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[ALAssetsGroup setInternal:](self, "setInternal:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ALAssetsGroup;
  -[ALAssetsGroup dealloc](&v3, sel_dealloc);
}

- (id)_typeAsString
{
  uint64_t v2;
  uint64_t v3;
  id result;

  v2 = -[ALAssetsGroupPrivate groupType](-[ALAssetsGroup internal](self, "internal"), "groupType");
  if (v2 > 15)
  {
    if (v2 > 63)
    {
      if (v2 == 64)
        return CFSTR("Collection");
      if (v2 == 128)
        return CFSTR("Moment");
    }
    else
    {
      if (v2 == 16)
        return CFSTR("Saved Photos");
      if (v2 == 32)
        return CFSTR("Photo Stream");
    }
    return 0;
  }
  else
  {
    v3 = v2 - 1;
    result = CFSTR("Library");
    switch(v3)
    {
      case 0:
        return result;
      case 1:
        result = CFSTR("Album");
        break;
      case 3:
        result = CFSTR("Event");
        break;
      case 7:
        result = CFSTR("Faces");
        break;
      default:
        return 0;
    }
  }
  return result;
}

- (id)_uuid
{
  ALAssetsGroupPrivate *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__82;
  v10 = __Block_byref_object_dispose__83;
  v11 = 0;
  v2 = -[ALAssetsGroup internal](self, "internal");
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __22__ALAssetsGroup__uuid__block_invoke;
  v5[3] = &unk_24C5ECD20;
  v5[4] = &v6;
  -[ALAssetsGroupPrivate _performBlockAndWait:](v2, "_performBlockAndWait:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ALAssetsGroup - Name:%@, Type:%@, Assets count:%ld"), -[ALAssetsGroup valueForProperty:](self, "valueForProperty:", CFSTR("ALAssetsGroupPropertyName")), -[ALAssetsGroup _typeAsString](self, "_typeAsString"), -[ALAssetsGroup numberOfAssets](self, "numberOfAssets"));
}

- (BOOL)isValid
{
  return -[ALAssetsGroupPrivate isValid](-[ALAssetsGroup internal](self, "internal"), "isValid");
}

- (id)valueForProperty:(NSString *)property
{
  id v5;
  uint64_t v6;
  uint64_t *v7;
  ALAssetsGroupPrivate *v8;
  ALAssetsGroupPrivate *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[7];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  uint64_t v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3052000000;
  v19 = __Block_byref_object_copy__82;
  v20 = __Block_byref_object_dispose__83;
  v21 = 0;
  if (-[ALAssetsGroup isValid](self, "isValid"))
  {
    v5 = -[ALAssetsGroupPrivate valueForProperty:](-[ALAssetsGroup internal](self, "internal"), "valueForProperty:", property);
    v17[5] = (uint64_t)v5;
    if (!v5)
    {
      if (-[NSString isEqualToString:](property, "isEqualToString:", CFSTR("ALAssetsGroupPropertyType")))
      {
        v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", -[ALAssetsGroupPrivate groupType](-[ALAssetsGroup internal](self, "internal"), "groupType"));
        v17[5] = v6;
      }
      else
      {
        v8 = -[ALAssetsGroup internal](self, "internal");
        v15[0] = MEMORY[0x24BDAC760];
        v15[1] = 3221225472;
        v15[2] = __34__ALAssetsGroup_valueForProperty___block_invoke;
        v15[3] = &unk_24C5ECD48;
        v15[5] = self;
        v15[6] = &v16;
        v15[4] = property;
        -[ALAssetsGroupPrivate _performBlockAndWait:](v8, "_performBlockAndWait:", v15);
      }
      v9 = -[ALAssetsGroup internal](self, "internal");
      v10 = v17[5];
      if (!v10)
        v10 = objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      -[ALAssetsGroupPrivate setValue:forProperty:](v9, "setValue:forProperty:", v10, property);
      v11 = (id)v17[5];
      v5 = (id)v17[5];
    }
    v12 = objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v7 = v17;
    if (v5 == (id)v12)
      v17[5] = 0;
  }
  else
  {
    v7 = v17;
  }
  v13 = (void *)v7[5];
  _Block_object_dispose(&v16, 8);
  return v13;
}

- (CGImageRef)posterImage
{
  int v3;
  ALAssetsGroupPrivate *v4;
  void *v5;
  CGImage *v6;
  id v7;
  _QWORD v9[5];
  BOOL v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;

  v3 = _CFExecutableLinkedOnOrAfter();
  if (!-[ALAssetsGroup isValid](self, "isValid"))
    return 0;
  v4 = -[ALAssetsGroup internal](self, "internal");
  -[ALAssetsGroupPrivate populateAssets](v4, "populateAssets");
  v11 = 0;
  v12 = &v11;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__82;
  v15 = __Block_byref_object_dispose__83;
  v16 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __28__ALAssetsGroup_posterImage__block_invoke;
  v9[3] = &unk_24C5ECD70;
  v10 = v3 == 0;
  v9[4] = &v11;
  -[ALAssetsGroupPrivate _performBlockAndWait:](v4, "_performBlockAndWait:", v9);
  v5 = (void *)v12[5];
  if (v5)
  {
    v6 = (CGImage *)objc_msgSend(v5, "CGImage");
    v7 = (id)v12[5];
  }
  else
  {
    v6 = 0;
  }
  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)setAssetsFilter:(ALAssetsFilter *)filter
{
  if (-[ALAssetsGroup isValid](self, "isValid"))
    -[ALAssetsGroupPrivate setAssetsFilter:](-[ALAssetsGroup internal](self, "internal"), "setAssetsFilter:", filter);
}

- (NSInteger)numberOfAssets
{
  ALAssetsGroupPrivate *v3;
  NSInteger v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  if (-[ALAssetsGroup isValid](self, "isValid"))
  {
    -[ALAssetsGroupPrivate populateAssets](-[ALAssetsGroup internal](self, "internal"), "populateAssets");
    v3 = -[ALAssetsGroup internal](self, "internal");
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __31__ALAssetsGroup_numberOfAssets__block_invoke;
    v6[3] = &unk_24C5ECD20;
    v6[4] = &v7;
    -[ALAssetsGroupPrivate _performBlockAndWait:](v3, "_performBlockAndWait:", v6);
  }
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)_enumerateAssetsAtIndexes:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  void (**v8)(_QWORD, _QWORD, _QWORD, _QWORD);
  ALAssetsGroupPrivate *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[7];
  _QWORD v17[2];
  _QWORD v18[8];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v8 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_msgSend(a5, "copy");
  objc_sync_enter(self);
  if (-[ALAssetsGroup isValid](self, "isValid") && v8)
  {
    -[ALAssetsGroupPrivate populateAssets](-[ALAssetsGroup internal](self, "internal"), "populateAssets");
    v9 = -[ALAssetsGroup internal](self, "internal");
    v35 = 0;
    v36 = &v35;
    v37 = 0x3052000000;
    v38 = __Block_byref_object_copy__82;
    v39 = __Block_byref_object_dispose__83;
    v40 = 0;
    v40 = a3;
    v31 = 0;
    v32 = &v31;
    v33 = 0x2020000000;
    v34 = 0x7FFFFFFFFFFFFFFFLL;
    v25 = 0;
    v26 = &v25;
    v27 = 0x3052000000;
    v28 = __Block_byref_object_copy__82;
    v29 = __Block_byref_object_dispose__83;
    v30 = 0;
    v19 = 0;
    v20 = &v19;
    v21 = 0x3052000000;
    v22 = __Block_byref_object_copy__82;
    v23 = __Block_byref_object_dispose__83;
    v24 = 0;
    v10 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __62__ALAssetsGroup__enumerateAssetsAtIndexes_options_usingBlock___block_invoke;
    v18[3] = &unk_24C5ECDC0;
    v18[4] = &v35;
    v18[5] = &v19;
    v18[6] = &v31;
    v18[7] = &v25;
    -[ALAssetsGroupPrivate _performBlockAndWait:](v9, "_performBlockAndWait:", v18);
    v11 = (id)v36[5];
    v12 = (id)v26[5];
    if (v20[5])
    {

      objc_exception_throw((id)v20[5]);
    }
    v13 = malloc_type_malloc(8 * v32[3], 0x100004000313F17uLL);
    v14 = objc_msgSend((id)v36[5], "lastIndex");
    v17[0] = 0;
    v17[1] = v14 + 1;
    objc_msgSend((id)v36[5], "getIndexes:maxCount:inIndexRange:", v13, v32[3], v17);
    v15 = (void *)v26[5];
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __62__ALAssetsGroup__enumerateAssetsAtIndexes_options_usingBlock___block_invoke_3;
    v16[3] = &unk_24C5ECDE8;
    v16[4] = v9;
    v16[5] = v8;
    v16[6] = v13;
    objc_msgSend(v15, "enumerateObjectsWithOptions:usingBlock:", a4, v16);
    free(v13);
    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(&v25, 8);
    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&v35, 8);
    LOBYTE(v35) = 0;
    ((void (**)(_QWORD, _QWORD, uint64_t, uint64_t *))v8)[2](v8, 0, 0x7FFFFFFFFFFFFFFFLL, &v35);
  }
  objc_sync_exit(self);

}

- (void)enumerateAssetsUsingBlock:(ALAssetsGroupEnumerationResultsBlock)enumerationBlock
{
  -[ALAssetsGroup _enumerateAssetsAtIndexes:options:usingBlock:](self, "_enumerateAssetsAtIndexes:options:usingBlock:", 0, 0, enumerationBlock);
}

- (void)enumerateAssetsWithOptions:(NSEnumerationOptions)options usingBlock:(ALAssetsGroupEnumerationResultsBlock)enumerationBlock
{
  -[ALAssetsGroup _enumerateAssetsAtIndexes:options:usingBlock:](self, "_enumerateAssetsAtIndexes:options:usingBlock:", 0, options, enumerationBlock);
}

- (BOOL)isEditable
{
  ALAssetsGroupPrivate *v3;
  char v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  if (-[ALAssetsGroup isValid](self, "isValid"))
  {
    v3 = -[ALAssetsGroup internal](self, "internal");
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __27__ALAssetsGroup_isEditable__block_invoke;
    v6[3] = &unk_24C5ECD20;
    v6[4] = &v7;
    -[ALAssetsGroupPrivate _performBlockAndWait:](v3, "_performBlockAndWait:", v6);
  }
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)addAsset:(ALAsset *)asset
{
  NSObject *v5;
  void *v6;
  BOOL v7;
  _QWORD v9[9];
  _QWORD v10[3];
  char v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  if (asset)
  {
    v5 = dispatch_semaphore_create(0);
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2020000000;
    v11 = 0;
    v6 = (void *)objc_msgSend(MEMORY[0x24BE72250], "sharedInstance");
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __26__ALAssetsGroup_addAsset___block_invoke;
    v9[3] = &unk_24C5ECE38;
    v9[4] = self;
    v9[5] = asset;
    v9[7] = v10;
    v9[8] = &v12;
    v9[6] = v5;
    objc_msgSend(v6, "checkPhotosAccessAllowedWithScope:handler:", 4, v9);
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v5);
    v7 = *((_BYTE *)v13 + 24) != 0;
    _Block_object_dispose(v10, 8);
  }
  else
  {
    v7 = 0;
  }
  _Block_object_dispose(&v12, 8);
  return v7;
}

- (ALAssetsGroupPrivate)internal
{
  return (ALAssetsGroupPrivate *)self->_internal;
}

- (void)setInternal:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

uint64_t __26__ALAssetsGroup_addAsset___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[6];

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = PLPhotosAccessAllowed();
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  if (!objc_msgSend(*(id *)(a1 + 32), "isEditable"))
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "defaultRepresentation"), "url");
  v3 = objc_msgSend(*(id *)(a1 + 32), "_uuid");
  if (!v2)
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  v4 = v3;
  if (!v3)
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  v5 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BE72238], "sharedSystemLibraryAssetsdClient"), "resourceClient");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __26__ALAssetsGroup_addAsset___block_invoke_2;
  v8[3] = &unk_24C5ECE10;
  v6 = *(_QWORD *)(a1 + 64);
  v8[4] = *(_QWORD *)(a1 + 48);
  v8[5] = v6;
  return objc_msgSend(v5, "addAssetWithURL:toAlbumWithUUID:completionHandler:", v2, v4, v8);
}

intptr_t __26__ALAssetsGroup_addAsset___block_invoke_2(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __27__ALAssetsGroup_isEditable__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  if ((objc_msgSend(a3, "isCloudSharedAlbum") & 1) != 0)
    result = 0;
  else
    result = objc_msgSend(a3, "canPerformEditOperation:", 4);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

id __62__ALAssetsGroup__enumerateAssetsAtIndexes_options_usingBlock___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  void *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  id result;
  void *v11;
  uint64_t v12;
  _QWORD v13[6];

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = *(void **)(*(_QWORD *)(a1[4] + 8) + 40);
    if (v5)
      v6 = objc_msgSend(v5, "count");
    else
      v6 = -1;
    if (v6 >= 0x7D0)
      v7 = 2000;
    else
      v7 = v6;
    objc_msgSend(a3, "setBatchSize:", v7);
  }
  v8 = objc_msgSend((id)objc_msgSend(a3, "assets"), "count");
  v9 = *(void **)(*(_QWORD *)(a1[4] + 8) + 40);
  if (!v9)
  {
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40) = objc_msgSend(objc_alloc(MEMORY[0x24BDD15E0]), "initWithIndexesInRange:", 0, v8);
    v9 = *(void **)(*(_QWORD *)(a1[4] + 8) + 40);
  }
  if (objc_msgSend(v9, "count") <= v8
    && (objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "lastIndex") == 0x7FFFFFFFFFFFFFFFLL
     || objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "lastIndex") <= v8))
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "count");
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24));
    v11 = *(void **)(*(_QWORD *)(a1[4] + 8) + 40);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __62__ALAssetsGroup__enumerateAssetsAtIndexes_options_usingBlock___block_invoke_2;
    v13[3] = &unk_24C5ECD98;
    v12 = a1[7];
    v13[4] = a3;
    v13[5] = v12;
    return (id)objc_msgSend(v11, "enumerateIndexesUsingBlock:", v13);
  }
  else
  {
    result = (id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], CFSTR("indexSet count or lastIndex must not exceed -numberOfAssets"), 0);
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = result;
  }
  return result;
}

void __62__ALAssetsGroup__enumerateAssetsAtIndexes_options_usingBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  ALAsset *v3;

  v3 = -[ALAsset initWithManagedAsset:library:]([ALAsset alloc], "initWithManagedAsset:library:", a2, objc_msgSend(*(id *)(a1 + 32), "library"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __62__ALAssetsGroup__enumerateAssetsAtIndexes_options_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "assets"), "objectAtIndex:", a2));
}

uint64_t __31__ALAssetsGroup_numberOfAssets__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(a3, "assets"), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

id __28__ALAssetsGroup_posterImage__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (*(_BYTE *)(a1 + 40))
    a3 = (void *)objc_msgSend(MEMORY[0x24BE71FB8], "unfilteredAlbum:");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = objc_msgSend(a3, "posterImage");
  return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
}

id __34__ALAssetsGroup_valueForProperty___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;

  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("ALAssetsGroupPropertyName")))
  {
    v5 = objc_msgSend(a3, "localizedTitle");
LABEL_14:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v5;
    return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("ALAssetsGroupPropertyPersistentID")))
  {
    v5 = objc_msgSend(a3, "uuid");
    goto LABEL_14;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("ALAssetsGroupPropertyURL")))
  {
    v5 = objc_msgSend(a3, "groupURL");
    goto LABEL_14;
  }
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "internal"), "groupType") == 128)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("ALAssetsGroupPropertyRepresentativeLocationNames")))
    {
      v5 = objc_msgSend(a3, "localizedLocationNames");
      goto LABEL_14;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("ALAssetsGroupPropertyRepresentativeStartDate")))
    {
      v5 = objc_msgSend(a3, "startDate");
      goto LABEL_14;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("ALAssetsGroupPropertyRepresentativeEndDate")))
    {
      v5 = objc_msgSend(a3, "endDate");
      goto LABEL_14;
    }
  }
  return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
}

uint64_t __22__ALAssetsGroup__uuid__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(a3, "uuid"), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

@end
