@implementation NUFontManager

- (NUFontManager)init
{
  NUFontManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *registrationQueue;
  NSCountedSet *v6;
  NSCountedSet *referenceCounts;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NUFontManager;
  v2 = -[NUFontManager init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)0xFFFFFFFE, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.news.font.registration", v3);
    registrationQueue = v2->_registrationQueue;
    v2->_registrationQueue = (OS_dispatch_queue *)v4;

    v6 = (NSCountedSet *)objc_alloc_init(MEMORY[0x24BDD14E0]);
    referenceCounts = v2->_referenceCounts;
    v2->_referenceCounts = v6;

  }
  return v2;
}

- (BOOL)registerFontWithURL:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  BOOL v10;
  _QWORD v12[5];
  id v13;
  __int128 *p_buf;
  id *v15;
  __int128 buf;
  uint64_t v17;
  char v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  NUSharedLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_216817000, v7, OS_LOG_TYPE_DEFAULT, "Registering font at URL %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v17 = 0x2020000000;
  v18 = 1;
  -[NUFontManager registrationQueue](self, "registrationQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __43__NUFontManager_registerFontWithURL_error___block_invoke;
  v12[3] = &unk_24D5A1D08;
  v12[4] = self;
  v13 = v6;
  p_buf = &buf;
  v15 = a4;
  v9 = v6;
  dispatch_sync(v8, v12);

  v10 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;
  _Block_object_dispose(&buf, 8);
  return v10;
}

void __43__NUFontManager_registerFontWithURL_error___block_invoke(uint64_t a1)
{
  CFIndex Code;
  CFIndex v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  CFErrorRef error;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  CFIndex v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (!objc_msgSend(*(id *)(a1 + 32), "referenceCountForFontWithURL:", *(_QWORD *)(a1 + 40)))
  {
    error = 0;
    if (!CTFontManagerRegisterFontsForURL(*(CFURLRef *)(a1 + 40), kCTFontManagerScopeProcess, &error))
    {
      Code = CFErrorGetCode(error);
      if (Code == 105 || (v3 = Code, Code == 305))
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      }
      else
      {
        if (*(_QWORD *)(a1 + 56))
        {
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC4D68], Code, 0);
          **(_QWORD **)(a1 + 56) = (id)objc_claimAutoreleasedReturnValue();
        }
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
        NUSharedLog();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          v5 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          v10 = v5;
          v11 = 2048;
          v12 = v3;
          _os_log_impl(&dword_216817000, v4, OS_LOG_TYPE_DEFAULT, "Font registration failed for font at URL %{public}@ with error code %lu", buf, 0x16u);
        }

      }
    }
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    NUSharedLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543362;
      v10 = v7;
      _os_log_impl(&dword_216817000, v6, OS_LOG_TYPE_DEFAULT, "Font registration succeeded for font at URL %{public}@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "increaseReferenceCountForFontWithURL:", *(_QWORD *)(a1 + 40));
  }
}

- (void)unregisterFontWithURL:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[NUFontManager registrationQueue](self, "registrationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__NUFontManager_unregisterFontWithURL___block_invoke;
  block[3] = &unk_24D5A1D30;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __39__NUFontManager_unregisterFontWithURL___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "decreaseReferenceCountForFontWithURL:", *(_QWORD *)(a1 + 40));
}

- (BOOL)unregisterFontAtURL:(id)a3 error:(id *)a4
{
  const __CFURL *v5;
  NSObject *v6;
  BOOL v7;
  CFIndex Code;
  CFIndex v9;
  NSObject *v10;
  CFErrorRef error;
  uint8_t buf[4];
  const __CFURL *v14;
  __int16 v15;
  CFIndex v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = (const __CFURL *)a3;
  NUSharedLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v14 = v5;
    _os_log_impl(&dword_216817000, v6, OS_LOG_TYPE_DEFAULT, "Unregister font at URL %{public}@", buf, 0xCu);
  }

  error = 0;
  v7 = 1;
  if (!CTFontManagerUnregisterFontsForURL(v5, kCTFontManagerScopeProcess, &error))
  {
    Code = CFErrorGetCode(error);
    v9 = Code;
    if (!a4 || Code == 201)
    {
      v7 = Code == 201;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDC4D68], Code, 0);
      v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    NUSharedLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v14 = v5;
      v15 = 2048;
      v16 = v9;
      _os_log_impl(&dword_216817000, v10, OS_LOG_TYPE_DEFAULT, "Unable to unregister font at URL %{public}@ with error %lu", buf, 0x16u);
    }

  }
  return v7;
}

- (void)increaseReferenceCountForFontWithURL:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  NUSharedLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v4;
    _os_log_impl(&dword_216817000, v5, OS_LOG_TYPE_DEFAULT, "Increase reference count for font at URL %{public}@", (uint8_t *)&v7, 0xCu);
  }

  -[NUFontManager referenceCounts](self, "referenceCounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v4);

}

- (void)decreaseReferenceCountForFontWithURL:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  NUSharedLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v9 = v4;
    _os_log_impl(&dword_216817000, v5, OS_LOG_TYPE_DEFAULT, "Decrease reference count for font at URL %{public}@", buf, 0xCu);
  }

  -[NUFontManager referenceCounts](self, "referenceCounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v4);

  if (-[NUFontManager shouldUnregisterFontWithURL:](self, "shouldUnregisterFontWithURL:", v4))
  {
    v7 = 0;
    -[NUFontManager unregisterFontAtURL:error:](self, "unregisterFontAtURL:error:", v4, &v7);
  }

}

- (unint64_t)referenceCountForFontWithURL:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[NUFontManager referenceCounts](self, "referenceCounts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countForObject:", v4);

  return v6;
}

- (BOOL)shouldUnregisterFontWithURL:(id)a3
{
  return -[NUFontManager referenceCountForFontWithURL:](self, "referenceCountForFontWithURL:", a3) == 0;
}

- (OS_dispatch_queue)registrationQueue
{
  return self->_registrationQueue;
}

- (NSCountedSet)referenceCounts
{
  return self->_referenceCounts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceCounts, 0);
  objc_storeStrong((id *)&self->_registrationQueue, 0);
}

@end
