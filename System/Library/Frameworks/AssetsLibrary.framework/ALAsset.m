@implementation ALAsset

- (ALAsset)initWithManagedAsset:(id)a3 library:(id)a4
{
  ALAsset *v6;
  ALAssetPrivate *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ALAsset;
  v6 = -[ALAsset init](&v9, sel_init);
  if (v6)
  {
    v7 = -[ALAssetPrivate initWithManagedAsset:library:]([ALAssetPrivate alloc], "initWithManagedAsset:library:", a3, a4);
    -[ALAsset setInternal:](v6, "setInternal:", v7);

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[ALAsset setInternal:](self, "setInternal:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ALAsset;
  -[ALAsset dealloc](&v3, sel_dealloc);
}

- (id)_typeAsString
{
  ALAssetPrivate *v2;
  const __CFString *v3;
  const __CFString *v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  __int16 v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 3;
  v2 = -[ALAsset internal](self, "internal");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __24__ALAsset__typeAsString__block_invoke;
  v6[3] = &unk_24C5ED238;
  v6[4] = &v7;
  -[ALAssetPrivate _performBlockAndWait:](v2, "_performBlockAndWait:", v6);
  v3 = CFSTR("Unknown");
  if (*((_WORD *)v8 + 12) == 1)
    v3 = CFSTR("Video");
  if (*((_WORD *)v8 + 12))
    v4 = v3;
  else
    v4 = CFSTR("Photo");
  _Block_object_dispose(&v7, 8);
  return (id)v4;
}

- (id)_uuid
{
  ALAssetPrivate *v2;
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
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  v2 = -[ALAsset internal](self, "internal");
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __16__ALAsset__uuid__block_invoke;
  v5[3] = &unk_24C5ED238;
  v5[4] = &v6;
  -[ALAssetPrivate _performBlockAndWait:](v2, "_performBlockAndWait:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ALAsset - Type:%@, URLs:%@"), -[ALAsset _typeAsString](self, "_typeAsString"), -[ALAsset valueForProperty:](self, "valueForProperty:", CFSTR("ALAssetPropertyAssetURL")));
}

- (BOOL)isValid
{
  return -[ALAssetPrivate isValid](-[ALAsset internal](self, "internal"), "isValid");
}

- (id)valueForProperty:(NSString *)property
{
  ALAssetPrivate *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  if (-[ALAsset isValid](self, "isValid"))
  {
    v5 = -[ALAsset internal](self, "internal");
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __28__ALAsset_valueForProperty___block_invoke;
    v8[3] = &unk_24C5ECAE0;
    v8[4] = property;
    v8[5] = &v9;
    -[ALAssetPrivate _performBlockAndWait:](v5, "_performBlockAndWait:", v8);
  }
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (ALAssetRepresentation)defaultRepresentation
{
  ALAssetPrivate *v3;
  ALAssetRepresentation *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  if (-[ALAsset isValid](self, "isValid"))
  {
    v3 = -[ALAsset internal](self, "internal");
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __32__ALAsset_defaultRepresentation__block_invoke;
    v6[3] = &unk_24C5ECAE0;
    v6[4] = v3;
    v6[5] = &v7;
    -[ALAssetPrivate _performBlockAndWait:](v3, "_performBlockAndWait:", v6);
  }
  v4 = (ALAssetRepresentation *)(id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (ALAssetRepresentation)representationForUTI:(NSString *)representationUTI
{
  ALAssetPrivate *v5;
  ALAssetRepresentation *v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  if (-[ALAsset isValid](self, "isValid"))
  {
    v5 = -[ALAsset internal](self, "internal");
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __32__ALAsset_representationForUTI___block_invoke;
    v8[3] = &unk_24C5ECB08;
    v8[5] = v5;
    v8[6] = &v9;
    v8[4] = representationUTI;
    -[ALAssetPrivate _performBlockAndWait:](v5, "_performBlockAndWait:", v8);
  }
  v6 = (ALAssetRepresentation *)(id)v10[5];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (CGImageRef)thumbnail
{
  ALAssetPrivate *v2;
  void *v3;
  CGImage *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  v2 = -[ALAsset internal](self, "internal");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __20__ALAsset_thumbnail__block_invoke;
  v7[3] = &unk_24C5ED238;
  v7[4] = &v8;
  -[ALAssetPrivate _performBlockAndWait:](v2, "_performBlockAndWait:", v7);
  v3 = (void *)v9[5];
  if (v3)
  {
    v4 = (CGImage *)objc_msgSend(v3, "CGImage");
    v5 = (id)v9[5];
  }
  else
  {
    v4 = 0;
  }
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (CGImageRef)aspectRatioThumbnail
{
  ALAssetPrivate *v2;
  void *v3;
  CGImage *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  v2 = -[ALAsset internal](self, "internal");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __31__ALAsset_aspectRatioThumbnail__block_invoke;
  v7[3] = &unk_24C5ED238;
  v7[4] = &v8;
  -[ALAssetPrivate _performBlockAndWait:](v2, "_performBlockAndWait:", v7);
  v3 = (void *)v9[5];
  if (v3)
  {
    v4 = (CGImage *)objc_msgSend(v3, "CGImage");
    v5 = (id)v9[5];
  }
  else
  {
    v4 = 0;
  }
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (void)writeModifiedImageDataToSavedPhotosAlbum:(NSData *)imageData metadata:(NSDictionary *)metadata completionBlock:(ALAssetsLibraryWriteImageCompletionBlock)completionBlock
{
  id v9;
  id v10;
  id v11;

  v9 = -[ALAsset _uuid](self, "_uuid");
  if (v9)
  {
    v10 = v9;
    v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v11, "setObject:forKey:", v10, *MEMORY[0x24BE72380]);
    -[ALAssetsLibrary _writeImageToSavedPhotosAlbum:orientation:imageData:metadata:internalProperties:completionBlock:](-[ALAssetPrivate library](-[ALAsset internal](self, "internal"), "library"), "_writeImageToSavedPhotosAlbum:orientation:imageData:metadata:internalProperties:completionBlock:", 0, 0, imageData, metadata, v11, completionBlock);

  }
}

- (void)writeModifiedVideoAtPathToSavedPhotosAlbum:(NSURL *)videoPathURL completionBlock:(ALAssetsLibraryWriteVideoCompletionBlock)completionBlock
{
  id v7;
  id v8;
  id v9;

  v7 = -[ALAsset _uuid](self, "_uuid");
  if (v7)
  {
    v8 = v7;
    v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v9, "setObject:forKey:", v8, *MEMORY[0x24BE72380]);
    -[ALAssetsLibrary _writeVideoAtPathToSavedPhotosAlbum:internalProperties:completionBlock:](-[ALAssetPrivate library](-[ALAsset internal](self, "internal"), "library"), "_writeVideoAtPathToSavedPhotosAlbum:internalProperties:completionBlock:", videoPathURL, v9, completionBlock);

  }
}

- (ALAsset)originalAsset
{
  ALAssetPrivate *v2;
  ALAsset *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  v2 = -[ALAsset internal](self, "internal");
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __24__ALAsset_originalAsset__block_invoke;
  v5[3] = &unk_24C5ECAE0;
  v5[4] = v2;
  v5[5] = &v6;
  -[ALAssetPrivate _performBlockAndWait:](v2, "_performBlockAndWait:", v5);
  v3 = (ALAsset *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isEditable
{
  void *v3;
  void *v4;
  ALAssetPrivate *v5;
  char v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v3 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "bundleIdentifier");
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    v5 = -[ALAsset internal](self, "internal");
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __21__ALAsset_isEditable__block_invoke;
    v8[3] = &unk_24C5ECAE0;
    v8[4] = v4;
    v8[5] = &v9;
    -[ALAssetPrivate _performBlockAndWait:](v5, "_performBlockAndWait:", v8);
  }
  v6 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (BOOL)isDeletable
{
  return -[ALAssetPrivate isDeletable](-[ALAsset internal](self, "internal"), "isDeletable");
}

- (id)_newContentEditingOutputWithType:(int64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  Class (*v14)(uint64_t);
  void *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  uint64_t v22;

  v4 = objc_msgSend(CFSTR("assets-library-unsupported-edit"), "dataUsingEncoding:", 4);
  v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "bundleIdentifier");
  v17 = 0;
  v18 = &v17;
  v19 = 0x3052000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v6 = (objc_class *)getPHAdjustmentDataClass_softClass;
  v22 = getPHAdjustmentDataClass_softClass;
  if (!getPHAdjustmentDataClass_softClass)
  {
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __getPHAdjustmentDataClass_block_invoke;
    v15 = &unk_24C5ECBF0;
    v16 = &v17;
    __getPHAdjustmentDataClass_block_invoke((uint64_t)&v12);
    v6 = (objc_class *)v18[5];
  }
  _Block_object_dispose(&v17, 8);
  v7 = (void *)objc_msgSend([v6 alloc], "initWithFormatIdentifier:formatVersion:data:", v5, CFSTR("0"), v4);
  v17 = 0;
  v18 = &v17;
  v19 = 0x3052000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v8 = (objc_class *)getPHContentEditingOutputClass_softClass;
  v22 = getPHContentEditingOutputClass_softClass;
  if (!getPHContentEditingOutputClass_softClass)
  {
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __getPHContentEditingOutputClass_block_invoke;
    v15 = &unk_24C5ECBF0;
    v16 = &v17;
    __getPHContentEditingOutputClass_block_invoke((uint64_t)&v12);
    v8 = (objc_class *)v18[5];
  }
  _Block_object_dispose(&v17, 8);
  v9 = [v8 alloc];
  v10 = (void *)objc_msgSend(v9, "initWithAdjustmentBaseVersion:mediaType:appropriateForURL:", 0, a3, objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "bundleURL"));
  objc_msgSend(v10, "setAdjustmentData:", v7);

  return v10;
}

- (void)setImageData:(NSData *)imageData metadata:(NSDictionary *)metadata completionBlock:(ALAssetsLibraryWriteImageCompletionBlock)completionBlock
{
  void *v8;
  _QWORD v9[8];
  _QWORD v10[3];
  char v11;

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = 0;
  v8 = (void *)objc_msgSend(MEMORY[0x24BE72250], "sharedInstance", imageData, metadata);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __49__ALAsset_setImageData_metadata_completionBlock___block_invoke;
  v9[3] = &unk_24C5ECB80;
  v9[4] = self;
  v9[5] = imageData;
  v9[6] = completionBlock;
  v9[7] = v10;
  objc_msgSend(v8, "checkPhotosAccessAllowedWithScope:handler:", 4, v9);
  _Block_object_dispose(v10, 8);
}

- (void)setVideoAtPath:(NSURL *)videoPathURL completionBlock:(ALAssetsLibraryWriteVideoCompletionBlock)completionBlock
{
  void *v7;
  _QWORD v8[8];
  _QWORD v9[3];
  char v10;

  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v10 = 0;
  v7 = (void *)objc_msgSend(MEMORY[0x24BE72250], "sharedInstance");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __42__ALAsset_setVideoAtPath_completionBlock___block_invoke;
  v8[3] = &unk_24C5ECB80;
  v8[4] = self;
  v8[5] = videoPathURL;
  v8[6] = completionBlock;
  v8[7] = v9;
  objc_msgSend(v7, "checkPhotosAccessAllowedWithScope:handler:", 4, v8);
  _Block_object_dispose(v9, 8);
}

- (void)requestDefaultRepresentation
{
  if (-[ALAsset isValid](self, "isValid"))
    -[ALAssetPrivate _performBlockAndWait:](-[ALAsset internal](self, "internal"), "_performBlockAndWait:", &__block_literal_global);
}

- (ALAssetPrivate)internal
{
  return (ALAssetPrivate *)self->_internal;
}

- (void)setInternal:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

uint64_t __39__ALAsset_requestDefaultRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t result;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];

  result = objc_msgSend(a3, "isDeleted");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(a3, "isCloudSharedAsset");
    if ((_DWORD)result)
    {
      result = objc_msgSend(a3, "cloudPlaceholderKind");
      if ((int)result <= 3)
      {
        v6 = (void *)objc_msgSend((id)objc_msgSend(a2, "assetsdClient"), "resourceClient");
        v7 = objc_msgSend(a3, "objectID");
        v8[0] = MEMORY[0x24BDAC760];
        v8[1] = 3221225472;
        v8[2] = __39__ALAsset_requestDefaultRepresentation__block_invoke_2;
        v8[3] = &unk_24C5ECBC8;
        v8[4] = a3;
        return objc_msgSend(v6, "downloadCloudSharedAsset:withCloudPlaceholderKind:shouldPrioritize:shouldExtendTimer:completionHandler:", v7, 4, 0, 0, v8);
      }
    }
  }
  return result;
}

void __39__ALAsset_requestDefaultRepresentation__block_invoke_2(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  NSObject *Log;
  NSObject *v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  Log = PLBackendGetLog();
  v9 = Log;
  if (a2)
  {
    if (!os_log_type_enabled(Log, OS_LOG_TYPE_DEFAULT))
      return;
    v10 = *(_QWORD *)(a1 + 32);
    v15 = 138412546;
    v16 = v10;
    v17 = 2112;
    v18 = a3;
    v11 = "Downloaded derivative for cloud shared asset %@ to %@";
    v12 = v9;
    v13 = OS_LOG_TYPE_DEFAULT;
  }
  else
  {
    if (!os_log_type_enabled(Log, OS_LOG_TYPE_ERROR))
      return;
    v14 = *(_QWORD *)(a1 + 32);
    v15 = 138412546;
    v16 = v14;
    v17 = 2112;
    v18 = a4;
    v11 = "Failed downloading derivative for cloud shared asset %@ : %@";
    v12 = v9;
    v13 = OS_LOG_TYPE_ERROR;
  }
  _os_log_impl(&dword_20D005000, v12, v13, v11, (uint8_t *)&v15, 0x16u);
}

uint64_t __42__ALAsset_setVideoAtPath_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  void *v4;
  _QWORD v5[6];
  _QWORD v6[5];
  __int128 v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  result = PLPhotosAccessAllowed();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)
    && (result = objc_msgSend(*(id *)(a1 + 32), "isEditable"), (_DWORD)result))
  {
    result = objc_msgSend(*(id *)(a1 + 32), "_uuid");
    if (result)
    {
      v8[0] = objc_msgSend((id)getPHAssetClass(), "localIdentifierWithUUID:", result);
      result = objc_msgSend((id)objc_msgSend((id)getPHAssetClass(), "fetchAssetsWithLocalIdentifiers:options:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1), 0), "lastObject");
      if (result)
      {
        v3 = result;
        v4 = (void *)objc_msgSend((id)getPHPhotoLibraryClass(), "sharedPhotoLibrary");
        v6[0] = MEMORY[0x24BDAC760];
        v6[1] = 3221225472;
        v6[2] = __42__ALAsset_setVideoAtPath_completionBlock___block_invoke_2;
        v6[3] = &unk_24C5ECB30;
        v6[4] = v3;
        v7 = *(_OWORD *)(a1 + 32);
        v5[0] = MEMORY[0x24BDAC760];
        v5[1] = 3221225472;
        v5[2] = __42__ALAsset_setVideoAtPath_completionBlock___block_invoke_3;
        v5[3] = &unk_24C5ECB58;
        v5[5] = *(_QWORD *)(a1 + 48);
        v5[4] = v7;
        return objc_msgSend(v4, "performChanges:completionHandler:", v6, v5);
      }
      else if (*(_QWORD *)(a1 + 48))
      {
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "internal"), "library"), "publicErrorForPrivateDomain:withPrivateCode:", CFSTR("ALAssetsLibraryErrorDomain"), -3310);
        return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      }
    }
  }
  else if (*(_QWORD *)(a1 + 48))
  {
    return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0, objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "internal"), "library"), "publicErrorForPrivateDomain:withPrivateCode:", CFSTR("ALAssetsLibraryErrorDomain"), -3300));
  }
  return result;
}

void __42__ALAsset_setVideoAtPath_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)objc_msgSend((id)getPHAssetChangeRequestClass(), "changeRequestForAsset:", *(_QWORD *)(a1 + 32));
  v3 = (id)objc_msgSend(*(id *)(a1 + 40), "_newContentEditingOutputWithType:", 2);
  objc_msgSend(v3, "setRenderedContentURL:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v2, "setContentEditingOutput:", v3);

}

uint64_t __42__ALAsset_setVideoAtPath_completionBlock___block_invoke_3(uint64_t result, int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;

  v3 = *(_QWORD *)(result + 40);
  if (v3)
  {
    v4 = result;
    if (a2)
    {
      v6 = objc_msgSend(*(id *)(result + 32), "valueForProperty:", CFSTR("ALAssetPropertyAssetURL"));
      v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
      v8 = v3;
      v9 = a3;
    }
    else
    {
      v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(result + 32), "internal"), "library"), "publicErrorForPrivateDomain:withPrivateCode:", CFSTR("ALAssetsLibraryErrorDomain"), -3311);
      v8 = *(_QWORD *)(v4 + 40);
      v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
      v6 = 0;
    }
    return v7(v8, v6, v9);
  }
  return result;
}

uint64_t __49__ALAsset_setImageData_metadata_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  void *v4;
  _QWORD v5[6];
  _QWORD v6[5];
  __int128 v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  result = PLPhotosAccessAllowed();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)
    && (result = objc_msgSend(*(id *)(a1 + 32), "isEditable"), (_DWORD)result))
  {
    result = objc_msgSend(*(id *)(a1 + 32), "_uuid");
    if (result)
    {
      v8[0] = objc_msgSend((id)getPHAssetClass(), "localIdentifierWithUUID:", result);
      result = objc_msgSend((id)objc_msgSend((id)getPHAssetClass(), "fetchAssetsWithLocalIdentifiers:options:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1), 0), "lastObject");
      if (result)
      {
        v3 = result;
        v4 = (void *)objc_msgSend((id)getPHPhotoLibraryClass(), "sharedPhotoLibrary");
        v6[0] = MEMORY[0x24BDAC760];
        v6[1] = 3221225472;
        v6[2] = __49__ALAsset_setImageData_metadata_completionBlock___block_invoke_2;
        v6[3] = &unk_24C5ECB30;
        v6[4] = v3;
        v7 = *(_OWORD *)(a1 + 32);
        v5[0] = MEMORY[0x24BDAC760];
        v5[1] = 3221225472;
        v5[2] = __49__ALAsset_setImageData_metadata_completionBlock___block_invoke_3;
        v5[3] = &unk_24C5ECB58;
        v5[5] = *(_QWORD *)(a1 + 48);
        v5[4] = v7;
        return objc_msgSend(v4, "performChanges:completionHandler:", v6, v5);
      }
      else if (*(_QWORD *)(a1 + 48))
      {
        objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "internal"), "library"), "publicErrorForPrivateDomain:withPrivateCode:", CFSTR("ALAssetsLibraryErrorDomain"), -3310);
        return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      }
    }
  }
  else if (*(_QWORD *)(a1 + 48))
  {
    return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0, objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "internal"), "library"), "publicErrorForPrivateDomain:withPrivateCode:", CFSTR("ALAssetsLibraryErrorDomain"), -3300));
  }
  return result;
}

void __49__ALAsset_setImageData_metadata_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)objc_msgSend((id)getPHAssetChangeRequestClass(), "changeRequestForAsset:", *(_QWORD *)(a1 + 32));
  v3 = (id)objc_msgSend(*(id *)(a1 + 40), "_newContentEditingOutputWithType:", 1);
  objc_msgSend(v3, "setRenderedJPEGData:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v2, "setContentEditingOutput:", v3);

}

uint64_t __49__ALAsset_setImageData_metadata_completionBlock___block_invoke_3(uint64_t result, int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;

  v3 = *(_QWORD *)(result + 40);
  if (v3)
  {
    v4 = result;
    if (a2)
    {
      v6 = objc_msgSend(*(id *)(result + 32), "valueForProperty:", CFSTR("ALAssetPropertyAssetURL"));
      v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
      v8 = v3;
      v9 = a3;
    }
    else
    {
      v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(result + 32), "internal"), "library"), "publicErrorForPrivateDomain:withPrivateCode:", CFSTR("ALAssetsLibraryErrorDomain"), -3311);
      v8 = *(_QWORD *)(v4 + 40);
      v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
      v6 = 0;
    }
    return v7(v8, v6, v9);
  }
  return result;
}

uint64_t __21__ALAsset_isEditable__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;
  uint64_t v6;

  result = objc_msgSend(a3, "isDeleted");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(a3, "importedByBundleIdentifier");
    if (result)
    {
      v6 = result;
      result = objc_msgSend((id)result, "length");
      if (result)
      {
        result = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v6);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
      }
    }
  }
  return result;
}

ALAsset *__24__ALAsset_originalAsset__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  ALAsset *result;

  result = (ALAsset *)objc_msgSend(a3, "isDeleted");
  if ((result & 1) == 0)
  {
    result = (ALAsset *)objc_msgSend(a3, "originalAsset");
    if (result)
    {
      result = -[ALAsset initWithManagedAsset:library:]([ALAsset alloc], "initWithManagedAsset:library:", result, objc_msgSend(*(id *)(a1 + 32), "library"));
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
    }
  }
  return result;
}

uint64_t __31__ALAsset_aspectRatioThumbnail__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "isDeleted");
  if ((result & 1) == 0)
  {
    if (!objc_msgSend(a3, "isCloudSharedAsset")
      || (result = objc_msgSend(a3, "cloudPlaceholderKind"), (int)result >= 3))
    {
      PLPushPhotoLibraryClient();
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = (id)objc_msgSend(a3, "imageWithFormat:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BE72240], "defaultFormatChooser"), "masterThumbnailFormat"), "formatID"));
      return PLPopPhotoLibraryClient();
    }
  }
  return result;
}

uint64_t __20__ALAsset_thumbnail__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "isDeleted");
  if ((result & 1) == 0)
  {
    if (!objc_msgSend(a3, "isCloudSharedAsset")
      || (result = objc_msgSend(a3, "cloudPlaceholderKind"), (int)result >= 3))
    {
      PLPushPhotoLibraryClient();
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = (id)objc_msgSend(a3, "imageWithFormat:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BE72240], "defaultFormatChooser"), "indexSheetUnbakedFormat"), "formatID"));
      return PLPopPhotoLibraryClient();
    }
  }
  return result;
}

uint64_t __32__ALAsset_representationForUTI___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  result = objc_msgSend(a3, "isDeleted");
  if ((result & 1) == 0)
  {
    if (!objc_msgSend(a3, "isCloudSharedAsset")
      || (result = objc_msgSend(a3, "cloudPlaceholderKind"), (int)result >= 4))
    {
      if (objc_msgSend((id)objc_msgSend(a3, "uniformTypeIdentifier"), "isEqualToString:", *(_QWORD *)(a1 + 32)))
      {
        v6 = (void *)objc_msgSend(a3, "fileExtension");
        v7 = 0;
      }
      else
      {
        v15 = 0u;
        v16 = 0u;
        v13 = 0u;
        v14 = 0u;
        v8 = (void *)objc_msgSend(a3, "sortedSidecarFiles", 0);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v14;
          while (2)
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v14 != v11)
                objc_enumerationMutation(v8);
              v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
              if (objc_msgSend((id)objc_msgSend(v7, "uniformTypeIdentifier"), "isEqualToString:", *(_QWORD *)(a1 + 32)))
              {
                v6 = (void *)objc_msgSend((id)objc_msgSend(v7, "originalFilename"), "pathExtension");
                goto LABEL_17;
              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
            v7 = 0;
            v6 = 0;
            if (v10)
              continue;
            break;
          }
        }
        else
        {
          v7 = 0;
          v6 = 0;
        }
      }
LABEL_17:
      result = objc_msgSend(v6, "length");
      if (result)
      {
        result = -[ALAssetRepresentation initWithManagedAsset:sidecar:extension:library:]([ALAssetRepresentation alloc], "initWithManagedAsset:sidecar:extension:library:", a3, v7, v6, objc_msgSend(*(id *)(a1 + 40), "library"));
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
      }
    }
  }
  return result;
}

ALAssetRepresentation *__32__ALAsset_defaultRepresentation__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  ALAssetRepresentation *result;

  result = (ALAssetRepresentation *)objc_msgSend(a3, "isDeleted");
  if ((result & 1) == 0)
  {
    if (!objc_msgSend(a3, "isCloudSharedAsset")
      || (result = (ALAssetRepresentation *)objc_msgSend(a3, "cloudPlaceholderKind"), (int)result >= 4))
    {
      result = -[ALAssetRepresentation initWithManagedAsset:sidecar:extension:library:]([ALAssetRepresentation alloc], "initWithManagedAsset:sidecar:extension:library:", a3, 0, objc_msgSend(a3, "fileExtension"), objc_msgSend(*(id *)(a1 + 32), "library"));
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
    }
  }
  return result;
}

id __28__ALAsset_valueForProperty___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  int v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a3, "isDeleted"))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = 0;
    return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("ALAssetPropertyType")))
  {
    v5 = objc_msgSend(a3, "kind");
    if (v5 == 1)
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v7 = CFSTR("ALAssetTypeVideo");
    }
    else
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      if (v5)
        v7 = CFSTR("ALAssetTypeUnknown");
      else
        v7 = CFSTR("ALAssetTypePhoto");
    }
    goto LABEL_39;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("ALAssetPropertyLocation")))
  {
    v8 = objc_msgSend(a3, "location");
LABEL_37:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v8;
    return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("ALAssetPropertyDuration")))
  {
    if (objc_msgSend(a3, "kind") == 1)
    {
      v9 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(a3, "duration");
      v8 = objc_msgSend(v9, "numberWithDouble:");
      goto LABEL_37;
    }
LABEL_38:
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = CFSTR("ALErrorInvalidProperty");
LABEL_39:
    *(_QWORD *)(v6 + 40) = v7;
    return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("ALAssetPropertyOrientation")))
  {
    objc_msgSend(a3, "orientation");
    v8 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", PLImageOrientationFromExifOrientation());
    goto LABEL_37;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("ALAssetPropertyDate")))
  {
    v8 = objc_msgSend(a3, "dateCreated");
    goto LABEL_37;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("ALAssetPropertyRepresentations")))
  {
    v8 = objc_msgSend(a3, "allUniformTypeIdentifiers");
    goto LABEL_37;
  }
  if (!objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("ALAssetPropertyURLs")))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("ALAssetPropertyAssetURL")))
    {
      v8 = objc_msgSend(a3, "assetURL");
      goto LABEL_37;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("ALAssetPropertyEditorBundleID")))
    {
      v8 = objc_msgSend(a3, "editorBundleID");
      goto LABEL_37;
    }
    goto LABEL_38;
  }
  v10 = (void *)objc_msgSend(a3, "sortedSidecarFiles");
  v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v12 = objc_msgSend(a3, "uniformTypeIdentifier");
  if (v12)
    objc_msgSend(v11, "setObject:forKey:", objc_msgSend(a3, "assetURL"), v12);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v10);
        v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v18 = objc_msgSend(v17, "uniformTypeIdentifier");
        if (v18)
          objc_msgSend(v11, "setObject:forKey:", objc_msgSend(a3, "assetURLForSidecarFile:", v17), v18);
      }
      v14 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v14);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v11);

  return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
}

uint64_t __16__ALAsset__uuid__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(a3, "uuid"), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

uint64_t __24__ALAsset__typeAsString__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "isDeleted");
  if ((result & 1) == 0)
  {
    result = objc_msgSend(a3, "kind");
    *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  }
  return result;
}

+ (CGSize)largePreviewImageSizeForSize:(CGSize)a3
{
  void *v3;

  v3 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BE72240], "defaultFormatChooser"), "fullScreenFormatForCurrentDevice");
  objc_msgSend(v3, "fullSizeMinShortSide");
  objc_msgSend(v3, "fullSizeDesiredLongSide");
  objc_msgSend(v3, "fullSizeMaxLongSide");
  JUMPOUT(0x212B9B278);
}

@end
