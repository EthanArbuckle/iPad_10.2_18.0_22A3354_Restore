@implementation AEMutableAssetPackage

- (AEMutableAssetPackage)initWithAssetIdentifier:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AEMutableAssetPackage;
  return -[AEAssetPackage initWithAssetIdentifier:durableURLs:sidecar:](&v4, sel_initWithAssetIdentifier_durableURLs_sidecar_, a3, 0, 0);
}

- (void)storeURL:(id)a3 forType:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[AEAssetPackage _packageContentQueue](self, "_packageContentQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__AEMutableAssetPackage_storeURL_forType___block_invoke;
  block[3] = &unk_24E23BBF8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_barrier_sync(v8, block);

}

- (void)removeURLForType:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[AEAssetPackage _packageContentQueue](self, "_packageContentQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__AEMutableAssetPackage_removeURLForType___block_invoke;
  block[3] = &unk_24E23BC48;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_sync(v5, block);

}

- (void)replaceURLForType:(id)a3 withURL:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[AEAssetPackage _packageContentQueue](self, "_packageContentQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__AEMutableAssetPackage_replaceURLForType_withURL___block_invoke;
  block[3] = &unk_24E23BBF8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_barrier_sync(v8, block);

}

- (void)setSidecarObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  _QWORD block[5];
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    PLAssetExplorerGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v15 = v6;
      v16 = 2114;
      v17 = 0;
      v10 = "Attempting to store a sidecar object %{public}@ for an invalid key %{public}@";
LABEL_8:
      _os_log_impl(&dword_21E23A000, v9, OS_LOG_TYPE_ERROR, v10, buf, 0x16u);
    }
LABEL_9:

    goto LABEL_10;
  }
  if (!v6)
  {
    PLAssetExplorerGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v15 = 0;
      v16 = 2114;
      v17 = v7;
      v10 = "Attempting to store an invalid sidecar object %{public}@ for key %{public}@";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  -[AEAssetPackage _packageContentQueue](self, "_packageContentQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__AEMutableAssetPackage_setSidecarObject_forKey___block_invoke;
  block[3] = &unk_24E23BBF8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  dispatch_barrier_sync(v8, block);

LABEL_10:
}

- (void)addSidecarEntriesFromDictionary:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[AEAssetPackage _packageContentQueue](self, "_packageContentQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__AEMutableAssetPackage_addSidecarEntriesFromDictionary___block_invoke;
  block[3] = &unk_24E23BC48;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_sync(v5, block);

}

- (void)removeSidecarObjectForKey:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    -[AEAssetPackage _packageContentQueue](self, "_packageContentQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __51__AEMutableAssetPackage_removeSidecarObjectForKey___block_invoke;
    v7[3] = &unk_24E23BC48;
    v7[4] = self;
    v8 = v4;
    dispatch_barrier_sync(v5, v7);

  }
  else
  {
    PLAssetExplorerGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v10 = 0;
      _os_log_impl(&dword_21E23A000, v6, OS_LOG_TYPE_ERROR, "Attempting to remove a sidecar object for an invalid key %{public}@", buf, 0xCu);
    }

  }
}

void __51__AEMutableAssetPackage_removeSidecarObjectForKey___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_contentQueueSidecar");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

void __57__AEMutableAssetPackage_addSidecarEntriesFromDictionary___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_contentQueueSidecar");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 40));

}

void __49__AEMutableAssetPackage_setSidecarObject_forKey___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_contentQueueSidecar");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __51__AEMutableAssetPackage_replaceURLForType_withURL___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_contentQueue_finalURLs");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __42__AEMutableAssetPackage_removeURLForType___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_contentQueue_finalURLs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "_contentQueue_suppressedTypes");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 40));

}

void __42__AEMutableAssetPackage_storeURL_forType___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_contentQueue_finalURLs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "_contentQueue_suppressedTypes");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 48));

}

- (void)suppressURLForType:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[AEAssetPackage _packageContentQueue](self, "_packageContentQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__AEMutableAssetPackage_AEURLSuppression__suppressURLForType___block_invoke;
  block[3] = &unk_24E23BC48;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_sync(v5, block);

}

- (void)expressURLForType:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[AEAssetPackage _packageContentQueue](self, "_packageContentQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__AEMutableAssetPackage_AEURLSuppression__expressURLForType___block_invoke;
  block[3] = &unk_24E23BC48;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_sync(v5, block);

}

void __61__AEMutableAssetPackage_AEURLSuppression__expressURLForType___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_contentQueue_suppressedTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_contentQueue_suppressedTypes");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 40));

  }
}

void __62__AEMutableAssetPackage_AEURLSuppression__suppressURLForType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_contentQueue_finalURLs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "_contentQueue_suppressedTypes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 40));

  }
}

- (id)_copyMetadataFromDisplayAsset:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFAllocator **v16;
  const __CFAllocator *v17;
  CFDictionaryRef v18;
  const __CFAllocator *v19;
  CFDictionaryRef v20;
  CMTime v22;
  CMTime time;
  CMTime v24;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v3, "mediaType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v5, CFSTR("AEAssetPackageDisplayMediaType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v3, "pixelWidth"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v6, CFSTR("AEAssetPackageDisplayPixelWidth"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v3, "pixelHeight"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v7, CFSTR("AEAssetPackageDisplayPixelHeight"));

  v8 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "duration");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v9, CFSTR("AEAssetPackageDisplayDuration"));

  objc_msgSend(v3, "creationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v10, CFSTR("AEAssetPackageDisplayCreationDate"));

  objc_msgSend(v3, "modificationDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v11, CFSTR("AEAssetPackageDisplayModificationDate"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v3, "isPhotoIrisPlaceholder"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v12, CFSTR("AEAssetPackageDisplayIsLivePhotoPlaceholder"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v3, "hasPhotoColorAdjustments"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v13, CFSTR("AEAssetPackageDisplayHasPhotoColorAdjustments"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v3, "playbackStyle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v14, CFSTR("AEAssetPackageDisplayPlaybackStyle"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", objc_msgSend(v3, "playbackVariation"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v15, CFSTR("AEAssetPackageDisplayPlaybackVariation"));

  memset(&v24, 0, sizeof(v24));
  if (v3)
  {
    objc_msgSend(v3, "photoIrisStillDisplayTime");
    v16 = (const __CFAllocator **)MEMORY[0x24BDBD240];
    if ((v24.flags & 1) != 0)
    {
      v17 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      time = v24;
      v18 = CMTimeCopyAsDictionary(&time, v17);
      objc_msgSend(v4, "setValue:forKey:", v18, CFSTR("AEAssetPackageDisplayLivePhotoStillDisplayTime"));

    }
    memset(&time, 0, sizeof(time));
    objc_msgSend(v3, "photoIrisVideoDuration");
    if ((time.flags & 1) != 0)
    {
      v19 = *v16;
      v22 = time;
      v20 = CMTimeCopyAsDictionary(&v22, v19);
      objc_msgSend(v4, "setValue:forKey:", v20, CFSTR("AEAssetPackageDisplayLivePhotoVideoDuration"));

    }
  }

  return v4;
}

- (void)storeMetadataFromReviewAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  id v10;

  v10 = a3;
  v4 = -[AEMutableAssetPackage _copyMetadataFromDisplayAsset:](self, "_copyMetadataFromDisplayAsset:", v10);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v10, "mediaSubtypes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v5, CFSTR("AEAssetPackageDisplayMediaSubtypes"));

  objc_msgSend(v10, "providedImageMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v6, CFSTR("AEAssetPackageDisplayImageMetadata"));

  objc_msgSend(v10, "assetAdjustments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "propertyListDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if ((objc_msgSend(v10, "mediaSubtypes") & 0x20000) != 0)
      v9 = CFSTR("com.apple.video.slomo");
    else
      v9 = CFSTR("com.apple.assetexplorer.editedadjustments");
    objc_msgSend(v4, "setValue:forKey:", v8, v9);
  }
  -[AEMutableAssetPackage addSidecarEntriesFromDictionary:](self, "addSidecarEntriesFromDictionary:", v4);

}

- (void)storeMetadataFromPHAsset:(id)a3 imageURL:(id)a4 adjustmentURL:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  const __CFData *v15;
  CGImageSource *v16;
  CGImageSource *v17;
  CFDictionaryRef v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;

  v27 = a3;
  v8 = a4;
  v9 = a5;
  v10 = -[AEMutableAssetPackage _copyMetadataFromDisplayAsset:](self, "_copyMetadataFromDisplayAsset:", v27);
  objc_msgSend(v27, "isMediaSubtype:", 1024);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v27, "mediaSubtypes"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v11, CFSTR("AEAssetPackageDisplayMediaSubtypes"));

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "fileExistsAtPath:", v13);

    if (v14)
    {
      v15 = (const __CFData *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfURL:options:error:", v8, 1, 0);
      if (-[__CFData length](v15, "length"))
      {
        v16 = CGImageSourceCreateWithData(v15, 0);
        if (v16)
        {
          v17 = v16;
          v18 = CGImageSourceCopyProperties(v16, 0);
          objc_msgSend(v10, "setValue:forKey:", v18, CFSTR("AEAssetPackageDisplayImageMetadata"));
          CFRelease(v17);

        }
      }

    }
  }
  v19 = objc_msgSend(v27, "isHighFramerateVideo");
  if (v9 && v19)
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE72470]), "initWithURL:", v9);
    if (objc_msgSend(v20, "isRecognizedFormat"))
    {
      objc_msgSend(v20, "propertyListDictionary");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setValue:forKey:", v21, CFSTR("com.apple.video.slomo"));

    }
  }
  if (objc_msgSend(v27, "playbackStyle") == 5 && objc_msgSend(v27, "mediaType") == 1)
  {
    objc_msgSend(v10, "setValue:forKey:", &unk_24E244150, CFSTR("AEAssetPackageDisplayMediaType"));
    objc_msgSend(v10, "objectForKey:", CFSTR("AEAssetPackageDisplayMediaSubtypes"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v10, "objectForKey:", CFSTR("AEAssetPackageDisplayMediaSubtypes"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "unsignedIntegerValue");

      v25 = (void *)MEMORY[0x24BDD16E0];
    }
    else
    {
      v25 = (void *)MEMORY[0x24BDD16E0];
      v24 = objc_msgSend(v27, "mediaSubtypes");
    }
    objc_msgSend(v25, "numberWithUnsignedInteger:", v24 & 0xFFFFFFFFFFFFFFF7);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValue:forKey:", v26, CFSTR("AEAssetPackageDisplayMediaSubtypes"));

  }
  -[AEMutableAssetPackage addSidecarEntriesFromDictionary:](self, "addSidecarEntriesFromDictionary:", v10);

}

- (void)beginSupressingLivePhoto
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)*MEMORY[0x24BDF84B8];
  objc_msgSend((id)*MEMORY[0x24BDF84B8], "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AEAssetPackage currentURLForType:](self, "currentURLForType:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AEMutableAssetPackage suppressURLForType:](self, "suppressURLForType:", v5);

  }
}

- (void)endSuppressingLivePhoto
{
  id v3;

  objc_msgSend((id)*MEMORY[0x24BDF84B8], "identifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AEMutableAssetPackage expressURLForType:](self, "expressURLForType:", v3);

}

- (void)setMediaOrigin:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AEMutableAssetPackage setSidecarObject:forKey:](self, "setSidecarObject:forKey:", v4, CFSTR("AEAssetPackageMediaOrigin"));

}

@end
