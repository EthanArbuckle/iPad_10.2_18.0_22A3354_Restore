@implementation CRKInstructorExtensionProxy

+ (id)sharedExtensionProxy
{
  if (sharedExtensionProxy_onceToken != -1)
    dispatch_once(&sharedExtensionProxy_onceToken, &__block_literal_global_59);
  return (id)sharedExtensionProxy_extension;
}

void __51__CRKInstructorExtensionProxy_sharedExtensionProxy__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedExtensionProxy_extension;
  sharedExtensionProxy_extension = v0;

}

- (void)dealloc
{
  objc_super v3;

  -[LSApplicationWorkspace removeObserver:](self->mWorkspace, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)CRKInstructorExtensionProxy;
  -[CRKInstructorExtensionProxy dealloc](&v3, sel_dealloc);
}

- (CRKInstructorExtensionProxy)init
{
  CRKInstructorExtensionProxy *v2;
  uint64_t v3;
  LSApplicationWorkspace *mWorkspace;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRKInstructorExtensionProxy;
  v2 = -[CRKInstructorExtensionProxy init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v3 = objc_claimAutoreleasedReturnValue();
    mWorkspace = v2->mWorkspace;
    v2->mWorkspace = (LSApplicationWorkspace *)v3;

    -[LSApplicationWorkspace addObserver:](v2->mWorkspace, "addObserver:", v2);
  }
  return v2;
}

- (void)resetExtension
{
  NSExtension *mInstructorExtension;
  NSUUID *mContextIdentifier;

  if (self->mContextIdentifier)
    -[NSExtension cancelExtensionRequestWithIdentifier:](self->mInstructorExtension, "cancelExtensionRequestWithIdentifier:");
  mInstructorExtension = self->mInstructorExtension;
  self->mInstructorExtension = 0;

  mContextIdentifier = self->mContextIdentifier;
  self->mContextIdentifier = 0;

}

- (void)fetchListenerEndpointWithCompletionBlock:(id)a3
{
  -[CRKInstructorExtensionProxy fetchListenerEndpointForExtensionBundleIdentifier:fromClassroomBundleWithURL:completionBlock:](self, "fetchListenerEndpointForExtensionBundleIdentifier:fromClassroomBundleWithURL:completionBlock:", 0, 0, a3);
}

- (void)fetchListenerEndpointForExtensionBundleIdentifier:(id)a3 fromClassroomBundleWithURL:(id)a4 completionBlock:(id)a5
{
  id v9;
  id v10;
  id v11;
  __CFString *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  NSExtension *v21;
  NSExtension *mInstructorExtension;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  __CFString *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) != 0)
  {
    if (!v11)
      goto LABEL_16;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKInstructorExtensionProxy.m"), 75, CFSTR("%@ must be called from the main thread"), v24);

    if (!v11)
      goto LABEL_16;
  }
  if (self->mInstructorExtension)
  {
    -[CRKInstructorExtensionProxy beginExtensionRequestWithCompletionBlock:](self, "beginExtensionRequestWithCompletionBlock:", v11);
  }
  else
  {
    if (v9)
    {
      v12 = (__CFString *)v9;
    }
    else
    {
      +[CRKClassroomInstallation preferredInstallation](CRKClassroomInstallation, "preferredInstallation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "instructordBundleIdentifier");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      v16 = CFSTR("com.apple.classroom.instructord");
      if (v14)
        v16 = (__CFString *)v14;
      v12 = v16;

    }
    _CRKLogGeneral_6();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v10, "path");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v12;
      v32 = 2112;
      v33 = v18;
      _os_log_impl(&dword_218C99000, v17, OS_LOG_TYPE_INFO, "Connecting to instructord with identifier %{public}@ in Classroom App with path %@", buf, 0x16u);

    }
    if (v10)
    {
      -[CRKInstructorExtensionProxy extensionAttributesForExtensionIdentifier:containingAppURL:](self, "extensionAttributesForExtensionIdentifier:containingAppURL:", v12, v10);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_initWeak((id *)buf, self);
      v20 = (void *)MEMORY[0x24BDD1550];
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __124__CRKInstructorExtensionProxy_fetchListenerEndpointForExtensionBundleIdentifier_fromClassroomBundleWithURL_completionBlock___block_invoke;
      v25[3] = &unk_24D9C9028;
      objc_copyWeak(&v28, (id *)buf);
      v26 = v9;
      v27 = v11;
      objc_msgSend(v20, "extensionsWithMatchingAttributes:completion:", v19, v25);

      objc_destroyWeak(&v28);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      v29 = 0;
      objc_msgSend(MEMORY[0x24BDD1550], "extensionWithIdentifier:error:", v12, &v29);
      v21 = (NSExtension *)objc_claimAutoreleasedReturnValue();
      v19 = v29;
      mInstructorExtension = self->mInstructorExtension;
      self->mInstructorExtension = v21;

      -[CRKInstructorExtensionProxy configureInstructorExtensionAfterFetchError:completionBlock:](self, "configureInstructorExtensionAfterFetchError:completionBlock:", v19, v11);
    }

  }
LABEL_16:

}

void __124__CRKInstructorExtensionProxy_fetchListenerEndpointForExtensionBundleIdentifier_fromClassroomBundleWithURL_completionBlock___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __124__CRKInstructorExtensionProxy_fetchListenerEndpointForExtensionBundleIdentifier_fromClassroomBundleWithURL_completionBlock___block_invoke_2;
  block[3] = &unk_24D9C9000;
  objc_copyWeak(&v14, a1 + 6);
  v10 = v5;
  v11 = v6;
  v12 = a1[4];
  v13 = a1[5];
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v14);
}

void __124__CRKInstructorExtensionProxy_fetchListenerEndpointForExtensionBundleIdentifier_fromClassroomBundleWithURL_completionBlock___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t v10[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v3 = WeakRetained;
  if (WeakRetained && !WeakRetained[2])
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "count");
    v5 = *(void **)(a1 + 32);
    if (v4 == 1)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v3[2];
      v3[2] = v6;

      objc_msgSend(v3, "configureInstructorExtensionAfterFetchError:completionBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
    }
    else
    {
      if (!v5 || *(_QWORD *)(a1 + 40))
      {
        _CRKLogGeneral_6();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          __124__CRKInstructorExtensionProxy_fetchListenerEndpointForExtensionBundleIdentifier_fromClassroomBundleWithURL_completionBlock___block_invoke_2_cold_1(a1, v8);

      }
      _CRKLogGeneral_6();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_218C99000, v9, OS_LOG_TYPE_INFO, "Failing back to fetching instructord by bundleID", v10, 2u);
      }

      objc_msgSend(v3, "fetchListenerEndpointForExtensionBundleIdentifier:fromClassroomBundleWithURL:completionBlock:", *(_QWORD *)(a1 + 48), 0, *(_QWORD *)(a1 + 56));
    }
  }

}

- (void)configureInstructorExtensionAfterFetchError:(id)a3 completionBlock:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, id);
  NSExtension *mInstructorExtension;
  uint64_t v10;
  NSExtension *v11;
  NSExtension *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id location;

  v7 = a3;
  v8 = (void (**)(id, _QWORD, id))a4;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKInstructorExtensionProxy.m"), 129, CFSTR("%@ must be called from the main thread"), v15);

  }
  if (self->mInstructorExtension)
  {
    objc_initWeak(&location, self);
    mInstructorExtension = self->mInstructorExtension;
    v10 = MEMORY[0x24BDAC760];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __91__CRKInstructorExtensionProxy_configureInstructorExtensionAfterFetchError_completionBlock___block_invoke;
    v20[3] = &unk_24D9C9050;
    objc_copyWeak(&v21, &location);
    -[NSExtension setRequestCompletionBlock:](mInstructorExtension, "setRequestCompletionBlock:", v20);
    v11 = self->mInstructorExtension;
    v18[0] = v10;
    v18[1] = 3221225472;
    v18[2] = __91__CRKInstructorExtensionProxy_configureInstructorExtensionAfterFetchError_completionBlock___block_invoke_2;
    v18[3] = &unk_24D9C9078;
    objc_copyWeak(&v19, &location);
    -[NSExtension setRequestCancellationBlock:](v11, "setRequestCancellationBlock:", v18);
    v12 = self->mInstructorExtension;
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __91__CRKInstructorExtensionProxy_configureInstructorExtensionAfterFetchError_completionBlock___block_invoke_3;
    v16[3] = &unk_24D9C90A0;
    objc_copyWeak(&v17, &location);
    -[NSExtension setRequestInterruptionBlock:](v12, "setRequestInterruptionBlock:", v16);
    -[CRKInstructorExtensionProxy beginExtensionRequestWithCompletionBlock:](self, "beginExtensionRequestWithCompletionBlock:", v8);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else if (v7)
  {
    v8[2](v8, 0, v7);
  }
  else
  {
    CRKErrorWithCodeAndUserInfo(101, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v13);

  }
}

void __91__CRKInstructorExtensionProxy_configureInstructorExtensionAfterFetchError_completionBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_resetExtension, 0, 0);

}

void __91__CRKInstructorExtensionProxy_configureInstructorExtensionAfterFetchError_completionBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_resetExtension, 0, 0);

}

void __91__CRKInstructorExtensionProxy_configureInstructorExtensionAfterFetchError_completionBlock___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_resetExtension, 0, 0);

}

- (void)beginExtensionRequestWithCompletionBlock:(id)a3
{
  id v5;
  NSExtension *mInstructorExtension;
  void *v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  if (!self->mInstructorExtension)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKInstructorExtensionProxy.m"), 152, CFSTR("Must retrieve the instructor extension before attempting to establish the endpoint"));

  }
  if (self->mContextIdentifier)
  {
    -[CRKInstructorExtensionProxy establishEndpointWithCompletionBlock:](self, "establishEndpointWithCompletionBlock:", v5);
  }
  else
  {
    mInstructorExtension = self->mInstructorExtension;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __72__CRKInstructorExtensionProxy_beginExtensionRequestWithCompletionBlock___block_invoke;
    v8[3] = &unk_24D9C90C8;
    v8[4] = self;
    v9 = v5;
    -[NSExtension beginExtensionRequestWithInputItems:completion:](mInstructorExtension, "beginExtensionRequestWithInputItems:completion:", 0, v8);

  }
}

void __72__CRKInstructorExtensionProxy_beginExtensionRequestWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__CRKInstructorExtensionProxy_beginExtensionRequestWithCompletionBlock___block_invoke_2;
  block[3] = &unk_24D9C7938;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __72__CRKInstructorExtensionProxy_beginExtensionRequestWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "establishEndpointWithCompletionBlock:", *(_QWORD *)(a1 + 48));
}

- (void)establishEndpointWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  -[NSExtension _extensionContextForUUID:](self->mInstructorExtension, "_extensionContextForUUID:", self->mContextIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_auxiliaryConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __68__CRKInstructorExtensionProxy_establishEndpointWithCompletionBlock___block_invoke;
  v13[3] = &unk_24D9C6EB0;
  v8 = v4;
  v14 = v8;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __68__CRKInstructorExtensionProxy_establishEndpointWithCompletionBlock___block_invoke_3;
  v11[3] = &unk_24D9C90F0;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "listenerEndpointWithCompletion:", v11);

}

void __68__CRKInstructorExtensionProxy_establishEndpointWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __68__CRKInstructorExtensionProxy_establishEndpointWithCompletionBlock___block_invoke_2;
  v6[3] = &unk_24D9C6E88;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __68__CRKInstructorExtensionProxy_establishEndpointWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __68__CRKInstructorExtensionProxy_establishEndpointWithCompletionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __68__CRKInstructorExtensionProxy_establishEndpointWithCompletionBlock___block_invoke_4;
  v6[3] = &unk_24D9C6E88;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __68__CRKInstructorExtensionProxy_establishEndpointWithCompletionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (id)extensionAttributesForExtensionIdentifier:(id)a3 containingAppURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BDD0C30]);

  objc_msgSend(v5, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BDD0C00]);
  v9 = (void *)objc_msgSend(v7, "copy");

  return v9;
}

- (BOOL)proxiesContainClassroomApp:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  char v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "bundleIdentifier", (_QWORD)v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CRKIsClassroomBundleIdentifier(v7);

        if ((v8 & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)applicationInstallsDidStart:(id)a3
{
  if (-[CRKInstructorExtensionProxy proxiesContainClassroomApp:](self, "proxiesContainClassroomApp:", a3))
    -[CRKInstructorExtensionProxy resetExtension](self, "resetExtension");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mContextIdentifier, 0);
  objc_storeStrong((id *)&self->mInstructorExtension, 0);
  objc_storeStrong((id *)&self->mWorkspace, 0);
}

void __124__CRKInstructorExtensionProxy_fetchListenerEndpointForExtensionBundleIdentifier_fromClassroomBundleWithURL_completionBlock___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_218C99000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch instructord by attributes: %{public}@", (uint8_t *)&v3, 0xCu);
}

@end
