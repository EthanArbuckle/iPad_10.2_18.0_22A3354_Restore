@implementation ALAssetsLibrary

- (ALAssetsLibrary)init
{
  ALAssetsLibrary *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ALAssetsLibrary;
  v2 = -[ALAssetsLibrary init](&v4, sel_init);
  if (v2)
    v2->_internal = -[ALAssetsLibraryPrivate initWithAssetsLibrary:]([ALAssetsLibraryPrivate alloc], "initWithAssetsLibrary:", v2);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(self->_internal, "setAssetsLibrary:", 0);

  self->_internal = 0;
  v3.receiver = self;
  v3.super_class = (Class)ALAssetsLibrary;
  -[ALAssetsLibrary dealloc](&v3, sel_dealloc);
}

- (BOOL)isValid
{
  return -[ALAssetsLibraryPrivate isValid](-[ALAssetsLibrary internal](self, "internal"), "isValid");
}

- (void)registerAlbum:(id)a3 assetGroupPrivate:(id)a4
{
  -[ALAssetsLibraryPrivate registerAlbum:assetGroupPrivate:](-[ALAssetsLibrary internal](self, "internal"), "registerAlbum:assetGroupPrivate:", a3, a4);
}

- (void)_performBlockAndWait:(id)a3
{
  PLPhotoLibrary *v4;
  _QWORD v5[6];

  v4 = -[ALAssetsLibraryPrivate photoLibrary](-[ALAssetsLibrary internal](self, "internal"), "photoLibrary");
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__ALAssetsLibrary__performBlockAndWait___block_invoke;
  v5[3] = &unk_24C5ED2B0;
  v5[4] = v4;
  v5[5] = a3;
  -[PLPhotoLibrary performBlockAndWait:](v4, "performBlockAndWait:", v5);
}

- (void)_performBlock:(id)a3
{
  PLPhotoLibrary *v4;
  _QWORD v5[6];

  v4 = -[ALAssetsLibraryPrivate photoLibrary](-[ALAssetsLibrary internal](self, "internal"), "photoLibrary");
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __33__ALAssetsLibrary__performBlock___block_invoke;
  v5[3] = &unk_24C5ED2B0;
  v5[4] = v4;
  v5[5] = a3;
  -[PLPhotoLibrary performBlock:](v4, "performBlock:", v5);
}

- (id)publicErrorFromPrivateError:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BE71F68], "publicAssetsLibraryErrorFromPrivateError:", a3);
}

- (id)publicErrorForPrivateDomain:(id)a3 withPrivateCode:(int64_t)a4
{
  return (id)objc_msgSend(MEMORY[0x24BE71F68], "publicAssetsLibraryErrorFromPrivateDomain:withPrivateCode:", a3, a4);
}

- (void)_addGroupForAlbum:(id)a3 ofType:(unint64_t)a4 toArray:(id)a5
{
  ALAssetsGroup *v9;

  if (a3)
  {
    if ((objc_msgSend(a3, "isInTrash") & 1) == 0)
    {
      v9 = -[ALAssetsGroup initWithPhotoAlbum:library:type:]([ALAssetsGroup alloc], "initWithPhotoAlbum:library:type:", a3, self, a4);
      objc_msgSend(a5, "addObject:", v9);

    }
  }
}

- (void)checkPhotosAccessAllowedWithScope:(int64_t)a3 handler:(id)a4
{
  void *v6;
  _QWORD v7[6];

  v6 = (void *)objc_msgSend(MEMORY[0x24BE72250], "sharedInstance");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__ALAssetsLibrary_checkPhotosAccessAllowedWithScope_handler___block_invoke;
  v7[3] = &unk_24C5ECF20;
  v7[4] = a4;
  v7[5] = a3;
  objc_msgSend(v6, "checkPhotosAccessAllowedWithScope:handler:", 2, v7);
}

- (void)_setBundlePropertiesOnPropertiesDictionary:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "bundleIdentifier");
  if (v4)
  {
    v5 = v4;
    if (objc_msgSend(v4, "length"))
      objc_msgSend(a3, "setObject:forKey:", v5, *MEMORY[0x24BE72378]);
  }
  v6 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle"), "localizedInfoDictionary"), "objectForKey:", *MEMORY[0x24BDBD1D0]);
  if (v6)
  {
    v7 = v6;
    if (objc_msgSend(v6, "length"))
      objc_msgSend(a3, "setObject:forKey:", v7, *MEMORY[0x24BE72370]);
  }
}

- (void)enumerateGroupsWithTypes:(ALAssetsGroupType)types usingBlock:(ALAssetsLibraryGroupsEnumerationResultsBlock)enumerationBlock failureBlock:(ALAssetsLibraryAccessFailureBlock)failureBlock
{
  dispatch_queue_global_t global_queue;
  _QWORD v10[9];

  objc_sync_enter(self);
  -[ALAssetsLibraryPrivate setIsValid:](-[ALAssetsLibrary internal](self, "internal"), "setIsValid:", 1);
  if (pthread_main_np())
    global_queue = (dispatch_queue_global_t)MEMORY[0x24BDAC9B8];
  else
    global_queue = dispatch_get_global_queue(0, 0);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __68__ALAssetsLibrary_enumerateGroupsWithTypes_usingBlock_failureBlock___block_invoke;
  v10[3] = &unk_24C5ECFE8;
  v10[4] = global_queue;
  v10[5] = self;
  v10[6] = failureBlock;
  v10[7] = enumerationBlock;
  v10[8] = types;
  -[ALAssetsLibrary checkPhotosAccessAllowedWithScope:handler:](self, "checkPhotosAccessAllowedWithScope:handler:", 2, v10);
  objc_sync_exit(self);
}

- (void)_writeImageToSavedPhotosAlbum:(CGImage *)a3 orientation:(int64_t)a4 imageData:(id)a5 metadata:(id)a6 internalProperties:(id)a7 completionBlock:(id)a8
{
  dispatch_queue_global_t global_queue;
  _QWORD v16[12];

  if (pthread_main_np())
    global_queue = (dispatch_queue_global_t)MEMORY[0x24BDAC9B8];
  else
    global_queue = dispatch_get_global_queue(0, 0);
  CGImageRetain(a3);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __115__ALAssetsLibrary__writeImageToSavedPhotosAlbum_orientation_imageData_metadata_internalProperties_completionBlock___block_invoke;
  v16[3] = &unk_24C5ED088;
  v16[4] = global_queue;
  v16[5] = self;
  v16[6] = a7;
  v16[7] = a6;
  v16[10] = a3;
  v16[11] = a4;
  v16[8] = a5;
  v16[9] = a8;
  -[ALAssetsLibrary checkPhotosAccessAllowedWithScope:handler:](self, "checkPhotosAccessAllowedWithScope:handler:", 1, v16);
}

- (void)writeImageToSavedPhotosAlbum:(CGImageRef)imageRef orientation:(ALAssetOrientation)orientation completionBlock:(ALAssetsLibraryWriteImageCompletionBlock)completionBlock
{
  -[ALAssetsLibrary _writeImageToSavedPhotosAlbum:orientation:imageData:metadata:internalProperties:completionBlock:](self, "_writeImageToSavedPhotosAlbum:orientation:imageData:metadata:internalProperties:completionBlock:", imageRef, orientation, 0, 0, 0, completionBlock);
}

- (void)writeImageToSavedPhotosAlbum:(CGImageRef)imageRef metadata:(NSDictionary *)metadata completionBlock:(ALAssetsLibraryWriteImageCompletionBlock)completionBlock
{
  -[ALAssetsLibrary _writeImageToSavedPhotosAlbum:orientation:imageData:metadata:internalProperties:completionBlock:](self, "_writeImageToSavedPhotosAlbum:orientation:imageData:metadata:internalProperties:completionBlock:", imageRef, 0, 0, metadata, 0, completionBlock);
}

- (void)writeImageDataToSavedPhotosAlbum:(NSData *)imageData metadata:(NSDictionary *)metadata completionBlock:(ALAssetsLibraryWriteImageCompletionBlock)completionBlock
{
  -[ALAssetsLibrary _writeImageToSavedPhotosAlbum:orientation:imageData:metadata:internalProperties:completionBlock:](self, "_writeImageToSavedPhotosAlbum:orientation:imageData:metadata:internalProperties:completionBlock:", 0, 0, imageData, metadata, 0, completionBlock);
}

- (void)_writeVideoAtPathToSavedPhotosAlbum:(id)a3 internalProperties:(id)a4 completionBlock:(id)a5
{
  dispatch_queue_global_t global_queue;
  _QWORD v10[9];

  if (pthread_main_np())
    global_queue = (dispatch_queue_global_t)MEMORY[0x24BDAC9B8];
  else
    global_queue = dispatch_get_global_queue(0, 0);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __90__ALAssetsLibrary__writeVideoAtPathToSavedPhotosAlbum_internalProperties_completionBlock___block_invoke;
  v10[3] = &unk_24C5ED0D8;
  v10[7] = a3;
  v10[8] = a5;
  v10[4] = global_queue;
  v10[5] = self;
  v10[6] = a4;
  -[ALAssetsLibrary checkPhotosAccessAllowedWithScope:handler:](self, "checkPhotosAccessAllowedWithScope:handler:", 1, v10);
}

- (void)writeVideoAtPathToSavedPhotosAlbum:(NSURL *)videoPathURL completionBlock:(ALAssetsLibraryWriteVideoCompletionBlock)completionBlock
{
  -[ALAssetsLibrary _writeVideoAtPathToSavedPhotosAlbum:internalProperties:completionBlock:](self, "_writeVideoAtPathToSavedPhotosAlbum:internalProperties:completionBlock:", videoPathURL, 0, completionBlock);
}

- (BOOL)videoAtPathIsCompatibleWithSavedPhotosAlbum:(NSURL *)videoPathURL
{
  return objc_msgSend(MEMORY[0x24BE72040], "canSaveVideoToLibrary:", -[NSURL path](videoPathURL, "path"));
}

- (void)assetForURL:(NSURL *)assetURL resultBlock:(ALAssetsLibraryAssetForURLResultBlock)resultBlock failureBlock:(ALAssetsLibraryAccessFailureBlock)failureBlock
{
  dispatch_queue_global_t global_queue;
  _QWORD v10[9];

  objc_sync_enter(self);
  -[ALAssetsLibraryPrivate setIsValid:](-[ALAssetsLibrary internal](self, "internal"), "setIsValid:", 1);
  if (pthread_main_np())
    global_queue = (dispatch_queue_global_t)MEMORY[0x24BDAC9B8];
  else
    global_queue = dispatch_get_global_queue(0, 0);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __56__ALAssetsLibrary_assetForURL_resultBlock_failureBlock___block_invoke;
  v10[3] = &unk_24C5ED1C8;
  v10[4] = global_queue;
  v10[5] = self;
  v10[6] = assetURL;
  v10[7] = failureBlock;
  v10[8] = resultBlock;
  -[ALAssetsLibrary checkPhotosAccessAllowedWithScope:handler:](self, "checkPhotosAccessAllowedWithScope:handler:", 2, v10);
  objc_sync_exit(self);
}

- (id)_copyGroupForURL:(id)a3
{
  void *v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__132;
  v10 = __Block_byref_object_dispose__133;
  v11 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __36__ALAssetsLibrary__copyGroupForURL___block_invoke;
  v5[3] = &unk_24C5ED128;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = &v6;
  -[ALAssetsLibrary _performBlockAndWait:](self, "_performBlockAndWait:", v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)groupForURL:(NSURL *)groupURL resultBlock:(ALAssetsLibraryGroupResultBlock)resultBlock failureBlock:(ALAssetsLibraryAccessFailureBlock)failureBlock
{
  dispatch_queue_global_t global_queue;
  _QWORD v10[9];

  objc_sync_enter(self);
  -[ALAssetsLibraryPrivate setIsValid:](-[ALAssetsLibrary internal](self, "internal"), "setIsValid:", 1);
  if (pthread_main_np())
    global_queue = (dispatch_queue_global_t)MEMORY[0x24BDAC9B8];
  else
    global_queue = dispatch_get_global_queue(0, 0);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __56__ALAssetsLibrary_groupForURL_resultBlock_failureBlock___block_invoke;
  v10[3] = &unk_24C5ED1C8;
  v10[4] = global_queue;
  v10[5] = self;
  v10[6] = groupURL;
  v10[7] = failureBlock;
  v10[8] = resultBlock;
  -[ALAssetsLibrary checkPhotosAccessAllowedWithScope:handler:](self, "checkPhotosAccessAllowedWithScope:handler:", 2, v10);
  objc_sync_exit(self);
}

- (void)addAssetsGroupAlbumWithName:(NSString *)name resultBlock:(ALAssetsLibraryGroupResultBlock)resultBlock failureBlock:(ALAssetsLibraryAccessFailureBlock)failureBlock
{
  dispatch_queue_global_t global_queue;
  _QWORD v10[9];

  objc_sync_enter(self);
  -[ALAssetsLibraryPrivate setIsValid:](-[ALAssetsLibrary internal](self, "internal"), "setIsValid:", 1);
  if (pthread_main_np())
    global_queue = (dispatch_queue_global_t)MEMORY[0x24BDAC9B8];
  else
    global_queue = dispatch_get_global_queue(0, 0);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __72__ALAssetsLibrary_addAssetsGroupAlbumWithName_resultBlock_failureBlock___block_invoke;
  v10[3] = &unk_24C5ED1C8;
  v10[4] = global_queue;
  v10[5] = self;
  v10[7] = failureBlock;
  v10[8] = resultBlock;
  v10[6] = name;
  -[ALAssetsLibrary checkPhotosAccessAllowedWithScope:handler:](self, "checkPhotosAccessAllowedWithScope:handler:", 4, v10);
  objc_sync_exit(self);
}

- (ALAssetsLibraryPrivate)internal
{
  return (ALAssetsLibraryPrivate *)self->_internal;
}

- (void)setInternal:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

void __72__ALAssetsLibrary_addAssetsGroupAlbumWithName_resultBlock_failureBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  char v4;
  int8x16_t v5;
  __int128 v6;
  _QWORD block[4];
  int8x16_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v4 = PLPhotosAccessAllowed();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__ALAssetsLibrary_addAssetsGroupAlbumWithName_resultBlock_failureBlock___block_invoke_2;
  block[3] = &unk_24C5ED1A0;
  v12 = v4;
  v5 = *(int8x16_t *)(a1 + 32);
  v6 = *(_OWORD *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 64);
  v11 = a2;
  v8 = vextq_s8(v5, v5, 8uLL);
  v9 = v6;
  dispatch_async((dispatch_queue_t)v5.i64[0], block);
}

uint64_t __72__ALAssetsLibrary_addAssetsGroupAlbumWithName_resultBlock_failureBlock___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];

  v1 = result;
  if (*(_BYTE *)(result + 80))
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __72__ALAssetsLibrary_addAssetsGroupAlbumWithName_resultBlock_failureBlock___block_invoke_3;
    v5[3] = &unk_24C5ED178;
    return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(result + 32), "internal", MEMORY[0x24BDAC760], 3221225472, __72__ALAssetsLibrary_addAssetsGroupAlbumWithName_resultBlock_failureBlock___block_invoke_3, &unk_24C5ED178, vextq_s8(*(int8x16_t *)(result + 32), *(int8x16_t *)(result + 32), 8uLL), vextq_s8(*(int8x16_t *)(result + 56), *(int8x16_t *)(result + 56), 8uLL)), "photoLibrary"), "assetsdClient"), "resourceClient"), "addGroupWithName:completionHandler:", *(_QWORD *)(result + 48), v5);
  }
  else if (*(_QWORD *)(result + 56))
  {
    v2 = *(_QWORD *)(result + 72);
    v3 = *(void **)(result + 32);
    if (v2 == 3)
      v4 = -3300;
    else
      v4 = -3311;
    objc_msgSend(v3, "publicErrorForPrivateDomain:withPrivateCode:", CFSTR("ALAssetsLibraryErrorDomain"), v4);
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 56) + 16))();
  }
  return result;
}

void __72__ALAssetsLibrary_addAssetsGroupAlbumWithName_resultBlock_failureBlock___block_invoke_3(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  NSObject *v4;
  uint64_t v5;
  _QWORD v6[7];
  __int128 v7;
  char v8;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __72__ALAssetsLibrary_addAssetsGroupAlbumWithName_resultBlock_failureBlock___block_invoke_4;
  v6[3] = &unk_24C5ED150;
  v8 = a2;
  v4 = *(NSObject **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6[4] = a3;
  v6[5] = v5;
  v6[6] = a4;
  v7 = *(_OWORD *)(a1 + 48);
  dispatch_async(v4, v6);
}

void __72__ALAssetsLibrary_addAssetsGroupAlbumWithName_resultBlock_failureBlock___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void (*v3)(void);
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  if (*(_BYTE *)(a1 + 72))
  {
    v2 = *(_QWORD *)(a1 + 56);
    if (!v2)
      return;
    v3 = *(void (**)(void))(v2 + 16);
    goto LABEL_4;
  }
  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  if (v5)
  {
    v6 = (void *)objc_msgSend(v4, "_copyGroupForURL:");
    v7 = *(_QWORD *)(a1 + 56);
    if (v7)
    {
      v9 = v6;
      (*(void (**)(void))(v7 + 16))();
      v6 = v9;
    }

  }
  else
  {
    objc_msgSend(v4, "publicErrorFromPrivateError:", *(_QWORD *)(a1 + 48));
    v8 = *(_QWORD *)(a1 + 64);
    if (v8)
    {
      v3 = *(void (**)(void))(v8 + 16);
LABEL_4:
      v3();
    }
  }
}

void __56__ALAssetsLibrary_groupForURL_resultBlock_failureBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  char v4;
  NSObject *v5;
  __int128 v6;
  _QWORD v7[4];
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  char v11;

  v4 = PLPhotosAccessAllowed();
  v5 = *(NSObject **)(a1 + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__ALAssetsLibrary_groupForURL_resultBlock_failureBlock___block_invoke_2;
  v7[3] = &unk_24C5ED100;
  v11 = v4;
  v10 = a2;
  v6 = *(_OWORD *)(a1 + 56);
  v8 = *(_OWORD *)(a1 + 40);
  v9 = v6;
  dispatch_async(v5, v7);
}

void __56__ALAssetsLibrary_groupForURL_resultBlock_failureBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (*(_BYTE *)(a1 + 72))
  {
    v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_copyGroupForURL:", *(_QWORD *)(a1 + 40));
    v3 = *(_QWORD *)(a1 + 56);
    if (v3)
    {
      v7 = v2;
      (*(void (**)(void))(v3 + 16))();
      v2 = v7;
    }

  }
  else if (*(_QWORD *)(a1 + 48))
  {
    v4 = *(_QWORD *)(a1 + 64);
    v5 = *(void **)(a1 + 32);
    if (v4 == 3)
      v6 = -3310;
    else
      v6 = -3311;
    objc_msgSend(v5, "publicErrorForPrivateDomain:withPrivateCode:", CFSTR("ALAssetsLibraryErrorDomain"), v6);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

uint64_t __36__ALAssetsLibrary__copyGroupForURL___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  int v4;
  uint64_t v5;

  v2 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "internal"), "photoLibrary"), "albumFromGroupURL:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(v2, "kindValue");
  if ((_DWORD)result != 1500)
  {
    if (!v2)
      return result;
LABEL_6:
    v4 = objc_msgSend(v2, "kindValue");
    v5 = 2;
    if (v4 > 1504)
    {
      if (v4 <= 1551)
      {
        if (v4 != 1505)
        {
          if (v4 != 1551)
          {
LABEL_23:
            result = -[ALAssetsGroup initWithPhotoAlbum:library:type:]([ALAssetsGroup alloc], "initWithPhotoAlbum:library:type:", v2, *(_QWORD *)(a1 + 32), v5);
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
            return result;
          }
LABEL_15:
          v5 = 4;
          goto LABEL_23;
        }
LABEL_18:
        v5 = 32;
        goto LABEL_23;
      }
      if (v4 != 1613)
      {
        if (v4 == 1552)
          v5 = 1;
        goto LABEL_23;
      }
    }
    else
    {
      if (v4 <= 999)
      {
        if (v4 != 12)
        {
          if (v4 == 15)
            v5 = 8;
          goto LABEL_23;
        }
        goto LABEL_15;
      }
      if (v4 != 1000)
      {
        if (v4 != 1500)
          goto LABEL_23;
        goto LABEL_18;
      }
    }
    v5 = 16;
    goto LABEL_23;
  }
  result = PLIsCloudPhotoLibraryEnabledForCurrentUser();
  if (v2 && (result & 1) == 0)
    goto LABEL_6;
  return result;
}

void __56__ALAssetsLibrary_assetForURL_resultBlock_failureBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  char v4;
  NSObject *v5;
  __int128 v6;
  _QWORD v7[4];
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  char v11;

  v4 = PLPhotosAccessAllowed();
  v5 = *(NSObject **)(a1 + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__ALAssetsLibrary_assetForURL_resultBlock_failureBlock___block_invoke_2;
  v7[3] = &unk_24C5ED100;
  v11 = v4;
  v10 = a2;
  v6 = *(_OWORD *)(a1 + 56);
  v8 = *(_OWORD *)(a1 + 40);
  v9 = v6;
  dispatch_async(v5, v7);
}

void __56__ALAssetsLibrary_assetForURL_resultBlock_failureBlock___block_invoke_2(int8x16_t *a1)
{
  int8x16_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  int8x16_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;

  if (a1[4].i8[8])
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3052000000;
    v14 = __Block_byref_object_copy__132;
    v15 = __Block_byref_object_dispose__133;
    v16 = 0;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __56__ALAssetsLibrary_assetForURL_resultBlock_failureBlock___block_invoke_89;
    v8[3] = &unk_24C5ED128;
    v10 = &v11;
    v2 = vextq_s8(a1[2], a1[2], 8uLL);
    v3 = (void *)a1[2].i64[0];
    v9 = v2;
    objc_msgSend(v3, "_performBlockAndWait:", v8);
    v4 = a1[3].i64[1];
    if (v4)
      (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, v12[5]);

    _Block_object_dispose(&v11, 8);
  }
  else if (a1[3].i64[0])
  {
    v5 = a1[4].i64[0];
    v6 = (void *)a1[2].i64[0];
    if (v5 == 3)
      v7 = -3310;
    else
      v7 = -3311;
    objc_msgSend(v6, "publicErrorForPrivateDomain:withPrivateCode:", CFSTR("ALAssetsLibraryErrorDomain"), v7);
    (*(void (**)(void))(a1[3].i64[0] + 16))();
  }
}

uint64_t __56__ALAssetsLibrary_assetForURL_resultBlock_failureBlock___block_invoke_89(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t result;

  v3 = (void *)objc_msgSend(a2, "photoFromAssetURL:", a1[4]);
  result = PLIsCloudPhotoLibraryEnabledForCurrentUser();
  if (!(_DWORD)result || (result = objc_msgSend(v3, "isPhotoStreamPhoto"), (result & 1) == 0))
  {
    if (v3)
    {
      result = objc_msgSend(v3, "isDeleted");
      if ((result & 1) == 0)
      {
        result = objc_msgSend(v3, "isInTrash");
        if ((result & 1) == 0)
        {
          result = objc_msgSend(v3, "hasLegacyRequiredResourcesLocallyAvailable");
          if ((_DWORD)result)
          {
            result = -[ALAsset initWithManagedAsset:library:]([ALAsset alloc], "initWithManagedAsset:library:", v3, a1[5]);
            *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
          }
        }
      }
    }
  }
  return result;
}

void __90__ALAssetsLibrary__writeVideoAtPathToSavedPhotosAlbum_internalProperties_completionBlock___block_invoke(uint64_t a1)
{
  char v2;
  int8x16_t v3;
  __int128 v4;
  _QWORD v5[4];
  int8x16_t v6;
  __int128 v7;
  uint64_t v8;
  char v9;

  v2 = PLPhotosAccessAllowed();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __90__ALAssetsLibrary__writeVideoAtPathToSavedPhotosAlbum_internalProperties_completionBlock___block_invoke_2;
  v5[3] = &unk_24C5ED0B0;
  v9 = v2;
  v8 = *(_QWORD *)(a1 + 64);
  v3 = *(int8x16_t *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 48);
  v6 = vextq_s8(v3, v3, 8uLL);
  v7 = v4;
  dispatch_async((dispatch_queue_t)v3.i64[0], v5);
}

void __90__ALAssetsLibrary__writeVideoAtPathToSavedPhotosAlbum_internalProperties_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  __int128 v4;
  uint64_t v5;

  if (*(_BYTE *)(a1 + 72))
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __90__ALAssetsLibrary__writeVideoAtPathToSavedPhotosAlbum_internalProperties_completionBlock___block_invoke_3;
    v3[3] = &unk_24C5ED038;
    v5 = *(_QWORD *)(a1 + 64);
    v4 = *(_OWORD *)(a1 + 32);
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "_setBundlePropertiesOnPropertiesDictionary:", v2);
    objc_msgSend(v2, "setObject:forKey:", &unk_24C5EF4F0, *MEMORY[0x24BE721F0]);
    objc_msgSend(v2, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE72388]);
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BE71F68], "sharedAssetsSaver"), "saveVideoAtPath:properties:completionBlock:", objc_msgSend(*(id *)(a1 + 56), "path"), v2, v3);

  }
  else if (*(_QWORD *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "publicErrorForPrivateDomain:withPrivateCode:", CFSTR("ALAssetsLibraryErrorDomain"), -3311);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
}

void __90__ALAssetsLibrary__writeVideoAtPathToSavedPhotosAlbum_internalProperties_completionBlock___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD block[7];

  if (a3)
    v5 = objc_msgSend(*(id *)(a1 + 32), "publicErrorFromPrivateError:");
  else
    v5 = 0;
  +[ALAssetRepresentationPrivate _clearFileDescriptorQueue](ALAssetRepresentationPrivate, "_clearFileDescriptorQueue");
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
  {
    v7 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __90__ALAssetsLibrary__writeVideoAtPathToSavedPhotosAlbum_internalProperties_completionBlock___block_invoke_4;
    block[3] = &unk_24C5ED010;
    block[5] = v5;
    block[6] = v6;
    block[4] = a2;
    dispatch_async(v7, block);
  }
}

uint64_t __90__ALAssetsLibrary__writeVideoAtPathToSavedPhotosAlbum_internalProperties_completionBlock___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __115__ALAssetsLibrary__writeImageToSavedPhotosAlbum_orientation_imageData_metadata_internalProperties_completionBlock___block_invoke(uint64_t a1)
{
  char v2;
  int8x16_t v3;
  __int128 v4;
  uint64_t v5;
  _QWORD block[4];
  int8x16_t v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v2 = PLPhotosAccessAllowed();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __115__ALAssetsLibrary__writeImageToSavedPhotosAlbum_orientation_imageData_metadata_internalProperties_completionBlock___block_invoke_2;
  block[3] = &unk_24C5ED060;
  v12 = v2;
  v3 = *(int8x16_t *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 48);
  v7 = vextq_s8(v3, v3, 8uLL);
  v8 = v4;
  v5 = *(_QWORD *)(a1 + 88);
  v10 = *(_QWORD *)(a1 + 80);
  v11 = v5;
  v9 = *(_OWORD *)(a1 + 64);
  dispatch_async((dispatch_queue_t)v3.i64[0], block);
}

void __115__ALAssetsLibrary__writeImageToSavedPhotosAlbum_orientation_imageData_metadata_internalProperties_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  __int128 v6;
  uint64_t v7;

  if (*(_BYTE *)(a1 + 96))
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __115__ALAssetsLibrary__writeImageToSavedPhotosAlbum_orientation_imageData_metadata_internalProperties_completionBlock___block_invoke_3;
    v5[3] = &unk_24C5ED038;
    v7 = *(_QWORD *)(a1 + 72);
    v6 = *(_OWORD *)(a1 + 32);
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", *(_QWORD *)(a1 + 48));
    v3 = v2;
    v4 = *(_QWORD *)(a1 + 56);
    if (v4)
      objc_msgSend(v2, "setObject:forKey:", v4, *MEMORY[0x24BE72368]);
    objc_msgSend(*(id *)(a1 + 32), "_setBundlePropertiesOnPropertiesDictionary:", v3);
    objc_msgSend(v3, "setObject:forKey:", &unk_24C5EF4F0, *MEMORY[0x24BE721F0]);
    objc_msgSend(v3, "setObject:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE72388]);
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BE71F68], "sharedAssetsSaver"), "saveImageRef:orientation:imageData:properties:completionBlock:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 64), v3, v5);

  }
  else if (*(_QWORD *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 32), "publicErrorForPrivateDomain:withPrivateCode:", CFSTR("ALAssetsLibraryErrorDomain"), -3311);
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  CGImageRelease(*(CGImageRef *)(a1 + 80));
}

void __115__ALAssetsLibrary__writeImageToSavedPhotosAlbum_orientation_imageData_metadata_internalProperties_completionBlock___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD block[7];

  if (a3)
    v5 = objc_msgSend(*(id *)(a1 + 32), "publicErrorFromPrivateError:");
  else
    v5 = 0;
  +[ALAssetRepresentationPrivate _clearFileDescriptorQueue](ALAssetRepresentationPrivate, "_clearFileDescriptorQueue");
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
  {
    v7 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __115__ALAssetsLibrary__writeImageToSavedPhotosAlbum_orientation_imageData_metadata_internalProperties_completionBlock___block_invoke_4;
    block[3] = &unk_24C5ED010;
    block[5] = v5;
    block[6] = v6;
    block[4] = a2;
    dispatch_async(v7, block);
  }
}

uint64_t __115__ALAssetsLibrary__writeImageToSavedPhotosAlbum_orientation_imageData_metadata_internalProperties_completionBlock___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __68__ALAssetsLibrary_enumerateGroupsWithTypes_usingBlock_failureBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  char v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD v7[4];
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v4 = PLPhotosAccessAllowed();
  v5 = *(NSObject **)(a1 + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__ALAssetsLibrary_enumerateGroupsWithTypes_usingBlock_failureBlock___block_invoke_2;
  v7[3] = &unk_24C5ECFC0;
  v12 = v4;
  v8 = *(_OWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 64);
  v9 = *(_QWORD *)(a1 + 56);
  v10 = a2;
  v11 = v6;
  dispatch_async(v5, v7);
}

void __68__ALAssetsLibrary_enumerateGroupsWithTypes_usingBlock_failureBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int v9;
  char v10;
  int v11;
  char v12;
  char v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[6];
  char v23;
  char v24;
  _QWORD v25[6];
  _QWORD v26[6];
  _QWORD v27[6];
  _QWORD v28[6];
  _QWORD v29[6];
  _QWORD v30[6];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  if (*(_BYTE *)(a1 + 72))
  {
    v2 = *(_QWORD *)(a1 + 48);
    if (v2)
    {
      v3 = *(_QWORD *)(a1 + 64);
      v31 = 0;
      v32 = &v31;
      v33 = 0x2020000000;
      v34 = 0;
      v4 = MEMORY[0x24BDAC760];
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __68__ALAssetsLibrary_enumerateGroupsWithTypes_usingBlock_failureBlock___block_invoke_3;
      v30[3] = &unk_24C5ECF48;
      v30[4] = v2;
      v30[5] = &v31;
      if (_CFExecutableLinkedOnOrAfter())
        v5 = PLIsCloudPhotoLibraryEnabledForCurrentUser() ^ 1;
      else
        v5 = 0;
      v9 = objc_msgSend(MEMORY[0x24BE72040], "_assetsLibrary_isSharedPhotoStreamsSupportEnabled");
      v10 = v9;
      v11 = v5 | v9;
      v12 = 30;
      if (v5 | v9)
        v12 = 62;
      if ((_DWORD)v3 == -1)
        v13 = v12;
      else
        v13 = v3;
      v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      if ((v13 & 1) != 0)
      {
        v15 = *(void **)(a1 + 32);
        v29[0] = v4;
        v29[1] = 3221225472;
        v29[2] = __68__ALAssetsLibrary_enumerateGroupsWithTypes_usingBlock_failureBlock___block_invoke_4;
        v29[3] = &unk_24C5ECF70;
        v29[4] = v15;
        v29[5] = v14;
        objc_msgSend(v15, "_performBlockAndWait:", v29);
        objc_msgSend(v14, "enumerateObjectsUsingBlock:", v30);
        objc_msgSend(v14, "removeAllObjects");
      }
      v16 = *((unsigned __int8 *)v32 + 24);
      if (!*((_BYTE *)v32 + 24) && (v13 & 2) != 0)
      {
        v17 = *(void **)(a1 + 32);
        v28[0] = v4;
        v28[1] = 3221225472;
        v28[2] = __68__ALAssetsLibrary_enumerateGroupsWithTypes_usingBlock_failureBlock___block_invoke_5;
        v28[3] = &unk_24C5ECF70;
        v28[4] = v17;
        v28[5] = v14;
        objc_msgSend(v17, "_performBlockAndWait:", v28);
        objc_msgSend(v14, "enumerateObjectsUsingBlock:", v30);
        objc_msgSend(v14, "removeAllObjects");
        v16 = *((unsigned __int8 *)v32 + 24);
      }
      if (!v16 && (v13 & 4) != 0)
      {
        v18 = *(void **)(a1 + 32);
        v27[0] = v4;
        v27[1] = 3221225472;
        v27[2] = __68__ALAssetsLibrary_enumerateGroupsWithTypes_usingBlock_failureBlock___block_invoke_6;
        v27[3] = &unk_24C5ECF70;
        v27[4] = v18;
        v27[5] = v14;
        objc_msgSend(v18, "_performBlockAndWait:", v27);
        objc_msgSend(v14, "enumerateObjectsUsingBlock:", v30);
        objc_msgSend(v14, "removeAllObjects");
        v16 = *((unsigned __int8 *)v32 + 24);
      }
      if (!v16 && (v13 & 8) != 0)
      {
        v19 = *(void **)(a1 + 32);
        v26[0] = v4;
        v26[1] = 3221225472;
        v26[2] = __68__ALAssetsLibrary_enumerateGroupsWithTypes_usingBlock_failureBlock___block_invoke_7;
        v26[3] = &unk_24C5ECF70;
        v26[4] = v19;
        v26[5] = v14;
        objc_msgSend(v19, "_performBlockAndWait:", v26);
        objc_msgSend(v14, "enumerateObjectsUsingBlock:", v30);
        objc_msgSend(v14, "removeAllObjects");
        v16 = *((unsigned __int8 *)v32 + 24);
      }
      if (!v16 && (v13 & 0x10) != 0)
      {
        v20 = *(void **)(a1 + 32);
        v25[0] = v4;
        v25[1] = 3221225472;
        v25[2] = __68__ALAssetsLibrary_enumerateGroupsWithTypes_usingBlock_failureBlock___block_invoke_8;
        v25[3] = &unk_24C5ECF70;
        v25[4] = v20;
        v25[5] = v14;
        objc_msgSend(v20, "_performBlockAndWait:", v25);
        objc_msgSend(v14, "enumerateObjectsUsingBlock:", v30);
        objc_msgSend(v14, "removeAllObjects");
      }
      if (v11 && !*((_BYTE *)v32 + 24) && (v13 & 0x20) != 0)
      {
        v21 = *(void **)(a1 + 32);
        v22[0] = v4;
        v22[1] = 3221225472;
        v22[2] = __68__ALAssetsLibrary_enumerateGroupsWithTypes_usingBlock_failureBlock___block_invoke_9;
        v22[3] = &unk_24C5ECF98;
        v23 = v5;
        v22[4] = v21;
        v22[5] = v14;
        v24 = v10;
        objc_msgSend(v21, "_performBlockAndWait:", v22);
        objc_msgSend(v14, "enumerateObjectsUsingBlock:", v30);
        objc_msgSend(v14, "removeAllObjects");
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      _Block_object_dispose(&v31, 8);
    }
  }
  else if (*(_QWORD *)(a1 + 40))
  {
    v6 = *(_QWORD *)(a1 + 56);
    v7 = *(void **)(a1 + 32);
    if (v6 == 3)
      v8 = -3310;
    else
      v8 = -3311;
    objc_msgSend(v7, "publicErrorForPrivateDomain:withPrivateCode:", CFSTR("ALAssetsLibraryErrorDomain"), v8);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __68__ALAssetsLibrary_enumerateGroupsWithTypes_usingBlock_failureBlock___block_invoke_3(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v5;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    v5 = result;
    result = (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v5 + 40) + 8) + 24))
      *a4 = 1;
  }
  return result;
}

uint64_t __68__ALAssetsLibrary_enumerateGroupsWithTypes_usingBlock_failureBlock___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend((id)objc_opt_class(), "_albumsInLibrary:", a2);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v10;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if (objc_msgSend(v8, "isLibrary"))
          return objc_msgSend(*(id *)(a1 + 32), "_addGroupForAlbum:ofType:toArray:", v8, 1, *(_QWORD *)(a1 + 40));
        ++v7;
      }
      while (v5 != v7);
      result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v5 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

uint64_t __68__ALAssetsLibrary_enumerateGroupsWithTypes_usingBlock_failureBlock___block_invoke_5(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t result;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (_CFExecutableLinkedOnOrAfter())
    v4 = (void *)objc_msgSend(a2, "syncedAlbums");
  else
    v4 = (void *)objc_msgSend((id)objc_opt_class(), "_albumsInLibrary:", a2);
  v5 = v4;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(a1 + 32), "_addGroupForAlbum:ofType:toArray:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), 2, *(_QWORD *)(a1 + 40));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v7);
  }
  result = _CFExecutableLinkedOnOrAfter();
  if (!(_DWORD)result)
  {
    result = PLPhysicalDeviceIsIPad();
    if ((result & 1) == 0)
    {
      v11 = (void *)objc_msgSend((id)objc_opt_class(), "_albumsInLibrary:", a2);
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      result = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      if (result)
      {
        v12 = result;
        v13 = *(_QWORD *)v17;
        while (2)
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v17 != v13)
              objc_enumerationMutation(v11);
            v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v14);
            if (objc_msgSend(v15, "isLibrary"))
              return objc_msgSend(*(id *)(a1 + 32), "_addGroupForAlbum:ofType:toArray:", v15, 1, *(_QWORD *)(a1 + 40));
            ++v14;
          }
          while (v12 != v14);
          result = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          v12 = result;
          if (result)
            continue;
          break;
        }
      }
    }
  }
  return result;
}

uint64_t __68__ALAssetsLibrary_enumerateGroupsWithTypes_usingBlock_failureBlock___block_invoke_6(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = (void *)objc_msgSend((id)objc_opt_class(), "_albumsInLibrary:", a2);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(a1 + 32), "_addGroupForAlbum:ofType:toArray:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v8++), 4, *(_QWORD *)(a1 + 40));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v6);
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BE71FD8], "importListInPhotoLibrary:", a2, 0), "albums"), "array");
  result = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (result)
  {
    v11 = result;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(a1 + 32), "_addGroupForAlbum:ofType:toArray:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), 4, *(_QWORD *)(a1 + 40));
      }
      while (v11 != v13);
      result = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
      v11 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __68__ALAssetsLibrary_enumerateGroupsWithTypes_usingBlock_failureBlock___block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (void *)objc_msgSend(MEMORY[0x24BE71FC0], "albumsWithKind:inManagedObjectContext:", 15, objc_msgSend(a2, "managedObjectContext", 0));
  result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(a1 + 32), "_addGroupForAlbum:ofType:toArray:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), 8, *(_QWORD *)(a1 + 40));
      }
      while (v5 != v7);
      result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v5 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __68__ALAssetsLibrary_enumerateGroupsWithTypes_usingBlock_failureBlock___block_invoke_8(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addGroupForAlbum:ofType:toArray:", objc_msgSend(MEMORY[0x24BE71FC0], "userLibraryAlbumInLibrary:", a2), 16, *(_QWORD *)(a1 + 40));
}

uint64_t __68__ALAssetsLibrary_enumerateGroupsWithTypes_usingBlock_failureBlock___block_invoke_9(uint64_t result, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _BYTE v21[128];
  uint64_t v22;

  v3 = result;
  v22 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(result + 48))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v4 = (void *)objc_msgSend(a2, "photoStreamAlbums");
    result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (result)
    {
      v5 = result;
      v6 = *(_QWORD *)v17;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v17 != v6)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(v3 + 32), "_addGroupForAlbum:ofType:toArray:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v7++), 32, *(_QWORD *)(v3 + 40));
        }
        while (v5 != v7);
        result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        v5 = result;
      }
      while (result);
    }
  }
  if (*(_BYTE *)(v3 + 49))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v8 = (void *)objc_msgSend(MEMORY[0x24BE71F78], "allCloudSharedAlbumsInLibrary:", a2, 0);
    result = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    if (result)
    {
      v9 = result;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(v3 + 32), "_addGroupForAlbum:ofType:toArray:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), 32, *(_QWORD *)(v3 + 40));
        }
        while (v9 != v11);
        result = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
        v9 = result;
      }
      while (result);
    }
  }
  return result;
}

uint64_t __61__ALAssetsLibrary_checkPhotosAccessAllowedWithScope_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 4 && (*(_QWORD *)(a1 + 40) & 2) != 0)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BE72250], "sharedInstance"), "presentAsyncPromptForLimitedLibraryPickerIfNeeded");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __33__ALAssetsLibrary__performBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __40__ALAssetsLibrary__performBlockAndWait___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (id)_library
{
  id Weak;
  uint64_t v4;
  id v5;
  id v6;
  NSObject *Log;
  uint64_t v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_sync_enter(a1);
  Weak = objc_loadWeak(&_library__assetsLibraryPhotoLibrary);
  if (!Weak)
  {
    v9 = 0;
    v4 = objc_msgSend(MEMORY[0x24BE72248], "systemLibraryURL");
    v5 = objc_alloc_init(MEMORY[0x24BE72050]);
    objc_msgSend(v5, "setRequiredState:", 6);
    objc_msgSend(v5, "setAutomaticallyMergesContext:", 1);
    objc_msgSend(v5, "setAutomaticallyPinToFirstFetch:", 0);
    objc_msgSend(v5, "setLibraryInitiator:", 1);
    v6 = (id)objc_msgSend(MEMORY[0x24BE72040], "newPhotoLibraryWithName:loadedFromURL:options:error:", "+[ALAssetsLibrary _library]", v4, v5, &v9);
    if (!v6)
    {
      Log = PLMigrationGetLog();
      if (os_log_type_enabled(Log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v11 = "+[ALAssetsLibrary _library]";
        v12 = 2112;
        v13 = v4;
        v14 = 2112;
        v15 = v9;
        _os_log_impl(&dword_20D005000, Log, OS_LOG_TYPE_ERROR, "failed to load photo library %{public}s with url %@, %@", buf, 0x20u);
      }
    }

    objc_msgSend((id)objc_msgSend(v6, "managedObjectContext"), "setIsBackingALAssetsLibrary:", 1);
    Weak = objc_storeWeak(&_library__assetsLibraryPhotoLibrary, v6);
  }
  objc_sync_exit(a1);
  return Weak;
}

+ (id)_albumsInLibrary:(id)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BE71FD8], "albumListInPhotoLibrary:", a3), "albums"), "array");
}

+ (ALAuthorizationStatus)authorizationStatus
{
  unint64_t v2;

  v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BE72250], "sharedInstance"), "photosAccessAllowedWithScope:", 7);
  if (v2 > 4)
    return 0;
  else
    return qword_20D010490[v2];
}

+ (void)disableSharedPhotoStreamsSupport
{
  objc_msgSend(MEMORY[0x24BE72040], "_assetsLibrary_disableSharedPhotoStreamsSupport");
}

+ (BOOL)_linkedBefore7
{
  if (_linkedBefore7_onceToken != -1)
    dispatch_once(&_linkedBefore7_onceToken, &__block_literal_global_92);
  return _linkedBefore7_linkedBefore7;
}

uint64_t __33__ALAssetsLibrary__linkedBefore7__block_invoke()
{
  uint64_t result;

  result = dyld_get_program_sdk_version();
  _linkedBefore7_linkedBefore7 = result < 0x70000;
  return result;
}

+ (id)_filePathForVideoURL:(id)a3 outMetadata:(id *)a4
{
  return (id)objc_msgSend(MEMORY[0x24BE71F60], "filePathForVideoURL:library:outMetadata:", a3, objc_msgSend(MEMORY[0x24BE72040], "systemPhotoLibrary"), a4);
}

+ (int64_t)_estimatedOutputFileLengthForVideoURL:(id)a3 fallbackFilePath:(id)a4 exportPreset:(id)a5 exportProperties:(id)a6
{
  return objc_msgSend(MEMORY[0x24BE71F60], "estimatedOutputFileLengthForVideoURL:library:fallbackFilePath:exportPreset:exportProperties:", a3, objc_msgSend(MEMORY[0x24BE72040], "systemPhotoLibrary"), a4, a5, a6);
}

+ (int64_t)_estimatedOutputFileLengthForVideoFilePath:(id)a3 metadata:(id)a4 exportPreset:(id)a5 exportProperties:(id)a6
{
  return objc_msgSend(MEMORY[0x24BE71F60], "estimatedOutputFileLengthForVideoFilePath:metadata:exportPreset:exportProperties:", a3, a4, a5, a6);
}

+ (id)_exportSessionForVideoURL:(id)a3 fallbackFilePath:(id)a4 exportPreset:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x24BE71F60], "exportSessionForVideoURL:library:fallbackFilePath:exportPreset:", a3, objc_msgSend(MEMORY[0x24BE72040], "systemPhotoLibrary"), a4, a5);
}

+ (id)_exportSessionForVideoFilePath:(id)a3 metadata:(id)a4 exportPreset:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x24BE71F60], "exportSessionForVideoFilePath:metadata:exportPreset:", a3, a4, a5);
}

+ (id)_playerItemForVideoURL:(id)a3 fallbackFilePath:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BE71F60], "playerItemForVideoURL:fallbackFilePath:library:", a3, a4, objc_msgSend(MEMORY[0x24BE72040], "systemPhotoLibrary"));
}

+ (id)_playerItemForVideoFilePath:(id)a3 metadata:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BE71F60], "playerItemForVideoFilePath:metadata:", a3, a4);
}

+ (CGImage)_thumbnailForAssetURL:(id)a3
{
  return (CGImage *)objc_msgSend(MEMORY[0x24BE71F60], "thumbnailForAssetURL:library:", a3, objc_msgSend(MEMORY[0x24BE72040], "systemPhotoLibrary"));
}

+ (CGImage)_aspectRatioThumbnailForAssetURL:(id)a3
{
  return (CGImage *)objc_msgSend(MEMORY[0x24BE71F60], "aspectRatioThumbnailForAssetURL:library:", a3, objc_msgSend(MEMORY[0x24BE72040], "systemPhotoLibrary"));
}

@end
