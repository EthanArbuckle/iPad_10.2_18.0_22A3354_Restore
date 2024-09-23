@implementation CAMProtectionController

- (CAMProtectionController)init
{
  CAMProtectionController *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *protectionQueue;
  NSObject *v6;
  CAMProtectionController *v7;
  CAMProtectionController *v8;
  _QWORD block[4];
  CAMProtectionController *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CAMProtectionController;
  v2 = -[CAMProtectionController init](&v12, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.camera.crash-protection", v3);
    protectionQueue = v2->__protectionQueue;
    v2->__protectionQueue = (OS_dispatch_queue *)v4;

    -[CAMProtectionController _protectionQueue](v2, "_protectionQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __31__CAMProtectionController_init__block_invoke;
    block[3] = &unk_1EA328868;
    v7 = v2;
    v11 = v7;
    dispatch_sync(v6, block);

    v8 = v7;
  }

  return v2;
}

- (OS_dispatch_queue)_protectionQueue
{
  return self->__protectionQueue;
}

void __31__CAMProtectionController_init__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v5;

  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 48);
  *(_QWORD *)(v12 + 48) = v11;

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8) = -1;
}

- (void)startProtectingPersistenceForRequest:(id)a3
{
  NSObject *v4;
  id v5;
  _QWORD block[5];
  id v7;

  v5 = a3;
  if (v5)
  {
    -[CAMProtectionController _protectionQueue](self, "_protectionQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__CAMProtectionController_startProtectingPersistenceForRequest___block_invoke;
    block[3] = &unk_1EA328A40;
    block[4] = self;
    v7 = v5;
    dispatch_sync(v4, block);

  }
}

void __64__CAMProtectionController_startProtectingPersistenceForRequest___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_persistenceProtectionTypeForRequest:", *(_QWORD *)(a1 + 40));
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "persistenceUUID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_protectionQueueStartProtectingPersistenceForType:logIdentifier:", v2, v4);

}

- (int64_t)_persistenceProtectionTypeForRequest:(id)a3
{
  return objc_msgSend(a3, "type") == 1;
}

- (void)_protectionQueueStartProtectingPersistenceForType:(int64_t)a3 logIdentifier:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMProtectionController _persistenceProtectionInflightRequestsByType](self, "_persistenceProtectionInflightRequestsByType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countForObject:", v6);
  objc_msgSend(v7, "addObject:", v6);
  if (!v8)
    -[CAMProtectionController _addPersistenceProtectionIndicatorForType:logIdentifier:](self, "_addPersistenceProtectionIndicatorForType:logIdentifier:", a3, v9);

}

- (NSCountedSet)_persistenceProtectionInflightRequestsByType
{
  return self->__persistenceProtectionInflightRequestsByType;
}

- (void)_addPersistenceProtectionIndicatorForType:(int64_t)a3 logIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  double Current;
  NSObject *v13;
  void *v14;
  id v15;
  double v16;
  NSObject *v17;
  uint64_t v18;
  double v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  double v26;
  __int16 v27;
  double v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMProtectionController _persistenceProtectionPathForType:](self, "_persistenceProtectionPathForType:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CAMProtectionController _persistenceProtectionFileDescriptorForType:](self, "_persistenceProtectionFileDescriptorForType:", a3) < 0)
  {
    v10 = objc_retainAutorelease(v8);
    v11 = open((const char *)objc_msgSend(v10, "fileSystemRepresentation"), 2721, 438);
    if ((v11 & 0x80000000) != 0)
    {
      Current = CFAbsoluteTimeGetCurrent();
      v13 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v24 = v6;
        v25 = 2048;
        v26 = *(double *)&a3;
        _os_log_impl(&dword_1DB760000, v13, OS_LOG_TYPE_DEFAULT, "ProtectionController %{public}@: Couldn't setup protection indicator for type %ld, triggering crash recovery!", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0D73168], "sharedSystemLibraryAssetsdClient");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "libraryClient");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "recoverFromCrashIfNeeded");

      sleep(1u);
      v15 = objc_retainAutorelease(v10);
      v11 = open((const char *)objc_msgSend(v15, "fileSystemRepresentation"), 2721, 438);
      if ((v11 & 0x80000000) != 0)
      {
        do
        {
          v16 = CFAbsoluteTimeGetCurrent();
          v17 = os_log_create("com.apple.camera", "Camera");
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            v24 = v6;
            v25 = 2048;
            v26 = *(double *)&a3;
            v27 = 2048;
            v28 = v16 - Current;
            _os_log_impl(&dword_1DB760000, v17, OS_LOG_TYPE_DEFAULT, "ProtectionController %{public}@: Couldn't setup protection indicator for type %ld, waiting for crash recovery (elapsed time %.1f seconds)!", buf, 0x20u);
          }

          sleep(1u);
          v18 = open((const char *)objc_msgSend(objc_retainAutorelease(v15), "fileSystemRepresentation"), 2721, 438);
        }
        while ((v18 & 0x80000000) != 0);
        v11 = v18;
      }
      v19 = CFAbsoluteTimeGetCurrent();
      v20 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v24 = v6;
        v25 = 2048;
        v26 = v19 - Current;
        _os_log_impl(&dword_1DB760000, v20, OS_LOG_TYPE_DEFAULT, "ProtectionController %{public}@: Completed crash recovery (took %.3f seconds)", buf, 0x16u);
      }

    }
    -[CAMProtectionController _allowSuspensionWhileFileLockedForPath:](self, "_allowSuspensionWhileFileLockedForPath:", v10);
    -[CAMProtectionController _persistenceProtectionFileDescriptorsByType](self, "_persistenceProtectionFileDescriptorsByType");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v9, "setObject:forKey:", v21, v7);

  }
  else
  {
    v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v24 = v6;
      v25 = 2048;
      v26 = *(double *)&a3;
      _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "ProtectionController %{public}@: Ignoring attempt to add persistence protection for type %ld, protection already exists.", buf, 0x16u);
    }
  }

}

- (id)_persistenceProtectionPathForType:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0D73138], "photoDataDirectory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("takingvideo");
  }
  else
  {
    if (a3)
    {
      v6 = 0;
      return v6;
    }
    objc_msgSend(MEMORY[0x1E0D73138], "photoDataDirectory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("takingphoto");
  }
  objc_msgSend(v3, "stringByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int)_persistenceProtectionFileDescriptorForType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;

  -[CAMProtectionController _persistenceProtectionFileDescriptorsByType](self, "_persistenceProtectionFileDescriptorsByType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "intValue");
  else
    v7 = -1;

  return v7;
}

- (NSMutableDictionary)_persistenceProtectionFileDescriptorsByType
{
  return self->__persistenceProtectionFileDescriptorsByType;
}

- (void)stopProtectingPersistenceForRequest:(id)a3
{
  NSObject *v4;
  id v5;
  _QWORD block[5];
  id v7;

  v5 = a3;
  if (v5)
  {
    -[CAMProtectionController _protectionQueue](self, "_protectionQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__CAMProtectionController_stopProtectingPersistenceForRequest___block_invoke;
    block[3] = &unk_1EA328A40;
    block[4] = self;
    v7 = v5;
    dispatch_sync(v4, block);

  }
}

void __63__CAMProtectionController_stopProtectingPersistenceForRequest___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_persistenceProtectionTypeForRequest:", *(_QWORD *)(a1 + 40));
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "persistenceUUID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_protectionQueueStopProtectingPersistenceForType:logIdentifier:", v2, v4);

}

- (void)_protectionQueueStopProtectingPersistenceForType:(int64_t)a3 logIdentifier:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMProtectionController _persistenceProtectionInflightRequestsByType](self, "_persistenceProtectionInflightRequestsByType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v6);
  if (!objc_msgSend(v7, "countForObject:", v6))
    -[CAMProtectionController _protectionQueueRemovePersistenceProtectionIndicatorForType:unlinkFile:logIdentifier:](self, "_protectionQueueRemovePersistenceProtectionIndicatorForType:unlinkFile:logIdentifier:", a3, 1, v8);

}

- (void)_protectionQueueRemovePersistenceProtectionIndicatorForType:(int64_t)a3 unlinkFile:(BOOL)a4 logIdentifier:(id)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  int v10;
  int v11;
  id v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  int64_t v17;
  uint64_t v18;

  v5 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CAMProtectionController _persistenceProtectionFileDescriptorForType:](self, "_persistenceProtectionFileDescriptorForType:", a3);
  if (v10 < 0)
  {
    v13 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138543618;
      v15 = v8;
      v16 = 2048;
      v17 = a3;
      _os_log_impl(&dword_1DB760000, v13, OS_LOG_TYPE_DEFAULT, "ProtectionController %{public}@: Ignoring attempt to remove persistence protection for type %ld, protection doesn't exist.", (uint8_t *)&v14, 0x16u);
    }
  }
  else
  {
    v11 = v10;
    if (v5)
    {
      -[CAMProtectionController _persistenceProtectionPathForType:](self, "_persistenceProtectionPathForType:", a3);
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      unlink((const char *)objc_msgSend(v12, "fileSystemRepresentation"));

    }
    flock(v11, 8);
    close(v11);
    -[CAMProtectionController _persistenceProtectionFileDescriptorsByType](self, "_persistenceProtectionFileDescriptorsByType");
    v13 = objc_claimAutoreleasedReturnValue();
    -[NSObject removeObjectForKey:](v13, "removeObjectForKey:", v9);
  }

}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  _QWORD block[5];

  -[CAMProtectionController _protectionQueue](self, "_protectionQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__CAMProtectionController_dealloc__block_invoke;
  block[3] = &unk_1EA328868;
  block[4] = self;
  dispatch_sync(v3, block);

  v4.receiver = self;
  v4.super_class = (Class)CAMProtectionController;
  -[CAMProtectionController dealloc](&v4, sel_dealloc);
}

uint64_t __34__CAMProtectionController_dealloc__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_protectionQueueAbortProtectionForProtectionTypes");
  objc_msgSend(*(id *)(a1 + 32), "_protectionQueueAbortProtectionForBurstProcessing");
  return objc_msgSend(*(id *)(a1 + 32), "_protectionQueueAbortProtectionForNebulaDaemonWritesForReason:", CFSTR("ProtectionController dealloc"));
}

- (void)_protectionQueueAbortProtectionForProtectionTypes
{
  void *v3;
  id v4;
  _QWORD v5[5];

  -[CAMProtectionController _persistenceProtectionFileDescriptorsByType](self, "_persistenceProtectionFileDescriptorsByType");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76__CAMProtectionController__protectionQueueAbortProtectionForProtectionTypes__block_invoke;
  v5[3] = &unk_1EA32BE58;
  v5[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);

}

void __76__CAMProtectionController__protectionQueueAbortProtectionForProtectionTypes__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(a2, "integerValue");
  objc_msgSend(*(id *)(a1 + 32), "_persistenceProtectionPathForType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134218242;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1DB760000, v5, OS_LOG_TYPE_DEFAULT, "ProtectionController: Aborting protection indicator for type %ld and leaving file on disk so crash recovery will be executed later: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_protectionQueueRemovePersistenceProtectionIndicatorForType:unlinkFile:logIdentifier:", v3, 0, CFSTR("(aborting)"));
}

- (void)_allowSuspensionWhileFileLockedForPath:(id)a3
{
  id v3;
  int v4;
  int v5;
  NSObject *v6;
  char value;

  value = -1;
  v3 = objc_retainAutorelease(a3);
  v4 = setxattr((const char *)objc_msgSend(v3, "UTF8String"), "com.apple.runningboard.can-suspend-locked", &value, 1uLL, 0, 0);
  if (v4 < 0)
  {
    v5 = v4;
    v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CAMProtectionController _allowSuspensionWhileFileLockedForPath:].cold.1(v3, v5, v6);

  }
}

- (id)_burstProcessingProtectionPathForIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0D73148];
    v4 = a3;
    objc_msgSend(v3, "incomingDirectoryPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathComponent:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "stringByAppendingPathExtension:", *MEMORY[0x1E0D74A58]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (int)_burstProcessingProtectionFileDescriptorForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;

  v4 = a3;
  -[CAMProtectionController _burstProcessingProtectionFileDescriptorsByIdentifier](self, "_burstProcessingProtectionFileDescriptorsByIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "intValue");
  else
    v7 = -1;

  return v7;
}

- (void)_addBurstProcessingProtectionIndicatorForIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    -[CAMProtectionController _burstProcessingProtectionPathForIdentifier:](self, "_burstProcessingProtectionPathForIdentifier:", v5);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = open((const char *)objc_msgSend(v6, "fileSystemRepresentation"), 2689, 438);
    if ((v7 & 0x80000000) != 0)
    {
      v9 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v12 = v5;
        _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "ProtectionController: Couldn't setup protection indicator for burst identifier %{public}@!", buf, 0xCu);
      }
    }
    else
    {
      v8 = v7;
      -[CAMProtectionController _burstProcessingProtectionFileDescriptorsByIdentifier](self, "_burstProcessingProtectionFileDescriptorsByIdentifier");
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setObject:forKey:](v9, "setObject:forKey:", v10, v5);

    }
  }

}

- (void)_protectionQueueRemoveBurstProcessingProtectionIndicatorForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  id v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    -[CAMProtectionController _burstProcessingProtectionPathForIdentifier:](self, "_burstProcessingProtectionPathForIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CAMProtectionController _burstProcessingProtectionFileDescriptorForIdentifier:](self, "_burstProcessingProtectionFileDescriptorForIdentifier:", v5);
    if (v7 < 0)
    {
      v9 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138543362;
        v12 = v5;
        _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "ProtectionController: Ignoring attempt to remove burst processing protection for identifier %{public}@, protection doesn't exist.", (uint8_t *)&v11, 0xCu);
      }
    }
    else
    {
      v8 = v7;
      flock(v7, 8);
      close(v8);
      -[CAMProtectionController _burstProcessingProtectionFileDescriptorsByIdentifier](self, "_burstProcessingProtectionFileDescriptorsByIdentifier");
      v9 = objc_claimAutoreleasedReturnValue();
      -[NSObject removeObjectForKey:](v9, "removeObjectForKey:", v5);
    }

    v10 = objc_retainAutorelease(v6);
    unlink((const char *)objc_msgSend(v10, "fileSystemRepresentation"));

  }
}

- (void)_protectionQueueAbortProtectionForBurstProcessing
{
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[CAMProtectionController _burstProcessingProtectionFileDescriptorsByIdentifier](self, "_burstProcessingProtectionFileDescriptorsByIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v8 = v4;
      _os_log_impl(&dword_1DB760000, v5, OS_LOG_TYPE_DEFAULT, "ProtectionController: Aborting protection of in-flight burst identifiers because the protection controller is going away: %{public}@", buf, 0xCu);
    }

    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __76__CAMProtectionController__protectionQueueAbortProtectionForBurstProcessing__block_invoke;
    v6[3] = &unk_1EA329AC8;
    v6[4] = self;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);
  }

}

uint64_t __76__CAMProtectionController__protectionQueueAbortProtectionForBurstProcessing__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_protectionQueueRemoveBurstProcessingProtectionIndicatorForIdentifier:", a2);
}

- (void)startProtectingBurstProcessingForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[CAMProtectionController _protectionQueue](self, "_protectionQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__CAMProtectionController_startProtectingBurstProcessingForIdentifier___block_invoke;
  block[3] = &unk_1EA328A40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __71__CAMProtectionController_startProtectingBurstProcessingForIdentifier___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_addBurstProcessingProtectionIndicatorForIdentifier:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_protectionQueueStartProtectingPersistenceForType:logIdentifier:", 0, *(_QWORD *)(a1 + 40));
}

- (void)stopProtectingBurstProcessingForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[CAMProtectionController _protectionQueue](self, "_protectionQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__CAMProtectionController_stopProtectingBurstProcessingForIdentifier___block_invoke;
  block[3] = &unk_1EA328A40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __70__CAMProtectionController_stopProtectingBurstProcessingForIdentifier___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_protectionQueueRemoveBurstProcessingProtectionIndicatorForIdentifier:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_protectionQueueStopProtectingPersistenceForType:logIdentifier:", 0, *(_QWORD *)(a1 + 40));
}

+ (id)pathForProtectNebulaDaemonWritesIndicator
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D73138], "photoDataDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("suspendnebulad"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)isCameraPerformingHighPriorityDiskActivity
{
  id v2;
  int v3;
  int v4;
  BOOL v5;

  +[CAMProtectionController pathForProtectNebulaDaemonWritesIndicator](CAMProtectionController, "pathForProtectNebulaDaemonWritesIndicator");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = open((const char *)objc_msgSend(v2, "fileSystemRepresentation"), 128, 438);
  if (v3 < 0)
  {
    v5 = 0;
  }
  else
  {
    v4 = v3;
    v5 = flock(v3, 6) != 0;
    flock(v4, 8);
    close(v4);
  }

  return v5;
}

- (void)startProtectingNebulaDaemonWritesForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    -[CAMProtectionController _protectionQueue](self, "_protectionQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __74__CAMProtectionController_startProtectingNebulaDaemonWritesForIdentifier___block_invoke;
    v7[3] = &unk_1EA328A40;
    v7[4] = self;
    v8 = v4;
    dispatch_sync(v5, v7);

  }
  else
  {
    v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB760000, v6, OS_LOG_TYPE_DEFAULT, "ProtectionController: cannot protect nebulad writes for nil identifier", buf, 2u);
    }

  }
}

uint64_t __74__CAMProtectionController_startProtectingNebulaDaemonWritesForIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_protectionQueueStartProtectingNebulaDaemonWritesForIdentifier:", *(_QWORD *)(a1 + 40));
}

- (void)stopProtectingNebulaDaemonWritesForIdentifier:(id)a3
{
  NSObject *v4;
  id v5;
  _QWORD block[5];
  id v7;

  v5 = a3;
  if (v5)
  {
    -[CAMProtectionController _protectionQueue](self, "_protectionQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__CAMProtectionController_stopProtectingNebulaDaemonWritesForIdentifier___block_invoke;
    block[3] = &unk_1EA328A40;
    block[4] = self;
    v7 = v5;
    dispatch_sync(v4, block);

  }
}

uint64_t __73__CAMProtectionController_stopProtectingNebulaDaemonWritesForIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_protectionQueueStopProtectingNebulaDaemonWritesForIdentifier:closeFile:", *(_QWORD *)(a1 + 40), 0);
}

- (void)abortOutstandingNebulaDaemonWriteProtectionsForReason:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[CAMProtectionController _protectionQueue](self, "_protectionQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__CAMProtectionController_abortOutstandingNebulaDaemonWriteProtectionsForReason___block_invoke;
  block[3] = &unk_1EA328A40;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __81__CAMProtectionController_abortOutstandingNebulaDaemonWriteProtectionsForReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_protectionQueueAbortProtectionForNebulaDaemonWritesForReason:", *(_QWORD *)(a1 + 40));
}

- (void)_protectionQueueStartProtectingNebulaDaemonWritesForIdentifier:(id)a3
{
  NSMutableSet *nebulaDaemonWriteProtectionInflightIdentifiers;
  id v5;
  uint64_t v6;
  void *v7;
  int nebulaDaemonWriteProtectionFileDescriptor;
  id v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  nebulaDaemonWriteProtectionInflightIdentifiers = self->__nebulaDaemonWriteProtectionInflightIdentifiers;
  v5 = a3;
  v6 = -[NSMutableSet count](nebulaDaemonWriteProtectionInflightIdentifiers, "count");
  -[NSMutableSet addObject:](self->__nebulaDaemonWriteProtectionInflightIdentifiers, "addObject:", v5);

  if (!v6)
  {
    objc_msgSend((id)objc_opt_class(), "pathForProtectNebulaDaemonWritesIndicator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    nebulaDaemonWriteProtectionFileDescriptor = self->__nebulaDaemonWriteProtectionFileDescriptor;
    if ((nebulaDaemonWriteProtectionFileDescriptor & 0x80000000) == 0)
      goto LABEL_18;
    v9 = objc_retainAutorelease(v7);
    v10 = open((const char *)objc_msgSend(v9, "fileSystemRepresentation"), 673, 438);
    self->__nebulaDaemonWriteProtectionFileDescriptor = v10;
    if (v10 < 0)
    {
      v11 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v15 = v9;
        _os_log_impl(&dword_1DB760000, v11, OS_LOG_TYPE_DEFAULT, "ProtectionController: Failed to open indicator at path %{public}@", buf, 0xCu);
      }

    }
    else
    {
      -[CAMProtectionController _allowSuspensionWhileFileLockedForPath:](self, "_allowSuspensionWhileFileLockedForPath:", v9);
    }
    nebulaDaemonWriteProtectionFileDescriptor = self->__nebulaDaemonWriteProtectionFileDescriptor;
    if ((nebulaDaemonWriteProtectionFileDescriptor & 0x80000000) == 0)
    {
LABEL_18:
      if (flock(nebulaDaemonWriteProtectionFileDescriptor, 2))
      {
        v12 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v15 = v7;
          _os_log_impl(&dword_1DB760000, v12, OS_LOG_TYPE_DEFAULT, "ProtectionController: Failed to set exclusive lock on indicator at path %{public}@", buf, 0xCu);
        }

      }
    }
    v13 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB760000, v13, OS_LOG_TYPE_DEFAULT, "ProtectionController: nebulad suspend", buf, 2u);
    }

    notify_post("com.apple.camera.nebulad.io.suspend");
  }
}

- (void)_protectionQueueStopProtectingNebulaDaemonWritesForIdentifier:(id)a3 closeFile:(BOOL)a4
{
  _BOOL4 v4;
  NSMutableSet *nebulaDaemonWriteProtectionInflightIdentifiers;
  id v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  int nebulaDaemonWriteProtectionFileDescriptor;
  NSObject *v12;
  uint8_t v13[16];

  v4 = a4;
  nebulaDaemonWriteProtectionInflightIdentifiers = self->__nebulaDaemonWriteProtectionInflightIdentifiers;
  v7 = a3;
  v8 = -[NSMutableSet count](nebulaDaemonWriteProtectionInflightIdentifiers, "count");
  -[NSMutableSet removeObject:](self->__nebulaDaemonWriteProtectionInflightIdentifiers, "removeObject:", v7);

  v9 = -[NSMutableSet count](self->__nebulaDaemonWriteProtectionInflightIdentifiers, "count");
  if (v8)
    v10 = v9 == 0;
  else
    v10 = 0;
  if (v10)
  {
    nebulaDaemonWriteProtectionFileDescriptor = self->__nebulaDaemonWriteProtectionFileDescriptor;
    if ((nebulaDaemonWriteProtectionFileDescriptor & 0x80000000) == 0)
    {
      flock(nebulaDaemonWriteProtectionFileDescriptor, 8);
      if (v4)
      {
        close(self->__nebulaDaemonWriteProtectionFileDescriptor);
        self->__nebulaDaemonWriteProtectionFileDescriptor = -1;
      }
    }
    v12 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1DB760000, v12, OS_LOG_TYPE_DEFAULT, "ProtectionController: nebulad resume", v13, 2u);
    }

    notify_post("com.apple.camera.nebulad.io.resume");
  }
}

- (void)_protectionQueueAbortProtectionForNebulaDaemonWritesForReason:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  id v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableSet allObjects](self->__nebulaDaemonWriteProtectionInflightIdentifiers, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v9 = v4;
      v10 = 2114;
      v11 = v5;
      _os_log_impl(&dword_1DB760000, v6, OS_LOG_TYPE_DEFAULT, "ProtectionController: Aborting protection of nebulad activity for reason \"%{public}@\". In-flight identifiers: %{public}@", buf, 0x16u);
    }

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __89__CAMProtectionController__protectionQueueAbortProtectionForNebulaDaemonWritesForReason___block_invoke;
    v7[3] = &unk_1EA329AC8;
    v7[4] = self;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);
  }

}

uint64_t __89__CAMProtectionController__protectionQueueAbortProtectionForNebulaDaemonWritesForReason___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_protectionQueueStopProtectingNebulaDaemonWritesForIdentifier:closeFile:", a2, 1);
}

- (NSMutableDictionary)_burstProcessingProtectionFileDescriptorsByIdentifier
{
  return self->__burstProcessingProtectionFileDescriptorsByIdentifier;
}

- (NSMutableSet)_nebulaDaemonWriteProtectionInflightIdentifiers
{
  return self->__nebulaDaemonWriteProtectionInflightIdentifiers;
}

- (int)_nebulaDaemonWriteProtectionFileDescriptor
{
  return self->__nebulaDaemonWriteProtectionFileDescriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__nebulaDaemonWriteProtectionInflightIdentifiers, 0);
  objc_storeStrong((id *)&self->__burstProcessingProtectionFileDescriptorsByIdentifier, 0);
  objc_storeStrong((id *)&self->__persistenceProtectionFileDescriptorsByType, 0);
  objc_storeStrong((id *)&self->__persistenceProtectionInflightRequestsByType, 0);
  objc_storeStrong((id *)&self->__protectionQueue, 0);
}

- (void)_allowSuspensionWhileFileLockedForPath:(NSObject *)a3 .cold.1(void *a1, int a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v5;
  v8 = 2080;
  v9 = strerror(a2);
  _os_log_error_impl(&dword_1DB760000, a3, OS_LOG_TYPE_ERROR, "Failed to set extended attributes on path: %{public}@ with error: %s", (uint8_t *)&v6, 0x16u);

}

@end
