@implementation LCSCaptureApplication

- (LCSCaptureApplication)initWithExtensionInfo:(id)a3
{
  id v5;
  LCSCaptureApplication *v6;
  LCSCaptureApplication *v7;
  uint64_t v8;
  NSString *bundleIdentifier;
  uint64_t Serial;
  OS_dispatch_queue *linkActionQueue;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)LCSCaptureApplication;
  v6 = -[LCSCaptureApplication init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_extension, a3);
    objc_msgSend(v5, "containerBundleIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v7->_bundleIdentifier;
    v7->_bundleIdentifier = (NSString *)v8;

    Serial = BSDispatchQueueCreateSerial();
    linkActionQueue = v7->_linkActionQueue;
    v7->_linkActionQueue = (OS_dispatch_queue *)Serial;

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[LCSCaptureApplication _endObservingMetadataChanges](self, "_endObservingMetadataChanges");
  v3.receiver = self;
  v3.super_class = (Class)LCSCaptureApplication;
  -[LCSCaptureApplication dealloc](&v3, sel_dealloc);
}

- (id)_bundleRecordForBundleIdentifier:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;

  v3 = a3;
  v8 = 0;
  objc_msgSend(MEMORY[0x24BDC1558], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v3, 0, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  if (!v4)
  {
    LCSLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[LCSCaptureApplication _bundleRecordForBundleIdentifier:].cold.1((uint64_t)v3, v5);

  }
  return v4;
}

- (id)_captureIntentContextDirectoryURLForBundleIdentifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  id v10;
  NSObject *v11;
  id v13;

  -[LCSCaptureApplication _bundleRecordForBundleIdentifier:](self, "_bundleRecordForBundleIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataContainerURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library/com.apple.SecureCapture"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v8 = objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, &v13);
  v9 = v13;

  if ((v8 & 1) != 0)
  {
    v10 = v5;
  }
  else
  {
    LCSLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[LCSCaptureApplication _captureIntentContextDirectoryURLForBundleIdentifier:].cold.1(v5, v9);

    v10 = 0;
  }

  return v10;
}

- (id)_captureIntentContextFileURLForBundleIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[LCSCaptureApplication _captureIntentContextDirectoryURLForBundleIdentifier:](self, "_captureIntentContextDirectoryURLForBundleIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("AppIntentContext.data"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSData)captureIntentContext
{
  NSObject *v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (!self->_bundleIdentifier)
  {
    LCSLogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      -[LCSCaptureApplication captureIntentContext].cold.1(v2, v7, v8, v9, v10, v11, v12, v13);
    goto LABEL_11;
  }
  -[LCSCaptureApplication _captureIntentContextFileURLForBundleIdentifier:](self, "_captureIntentContextFileURLForBundleIdentifier:");
  v2 = objc_claimAutoreleasedReturnValue();
  LCSLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (!v2)
  {
    if (v4)
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_240B1C000, v3, OS_LOG_TYPE_DEFAULT, "File URL can't be found for the capture intent context, this may be expected", (uint8_t *)&v15, 2u);
    }

LABEL_11:
    v6 = 0;
    goto LABEL_12;
  }
  if (v4)
  {
    -[NSObject absoluteString](v2, "absoluteString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v5;
    _os_log_impl(&dword_240B1C000, v3, OS_LOG_TYPE_DEFAULT, "Retrieving capture intent context from: %{public}@", (uint8_t *)&v15, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return (NSData *)v6;
}

- (void)setCaptureIntentContext:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  char v26;
  NSObject *v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_bundleIdentifier)
  {
    -[LCSCaptureApplication _captureIntentContextFileURLForBundleIdentifier:](self, "_captureIntentContextFileURLForBundleIdentifier:");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      LCSLogCommon();
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      if (v4)
      {
        if (v7)
        {
          -[NSObject absoluteString](v5, "absoluteString");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v30 = v8;
          _os_log_impl(&dword_240B1C000, v6, OS_LOG_TYPE_DEFAULT, "Writing capture intent context to: %{public}@", buf, 0xCu);

        }
        objc_msgSend(v4, "writeToURL:atomically:", v5, 1);
        goto LABEL_18;
      }
      if (v7)
      {
        -[NSObject absoluteString](v5, "absoluteString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v30 = v24;
        _os_log_impl(&dword_240B1C000, v6, OS_LOG_TYPE_DEFAULT, "Received nil context, removing capture intent context from: %{public}@", buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0;
      v26 = objc_msgSend(v25, "removeItemAtURL:error:", v5, &v28);
      v16 = v28;

      if ((v26 & 1) == 0)
      {
        LCSLogCommon();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          -[LCSCaptureApplication setCaptureIntentContext:].cold.3(v5, v16);

      }
    }
    else
    {
      LCSLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[LCSCaptureApplication setCaptureIntentContext:].cold.2(v16, v17, v18, v19, v20, v21, v22, v23);
    }

    goto LABEL_18;
  }
  LCSLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[LCSCaptureApplication setCaptureIntentContext:].cold.1(v5, v9, v10, v11, v12, v13, v14, v15);
LABEL_18:

}

- (id)acquireLaunchPrewarmAssertionForReason:(id)a3
{
  id v4;
  BSCompoundAssertion *launchPrewarmCompoundAssertion;
  void *v6;
  BSCompoundAssertion *v7;
  BSCompoundAssertion *v8;
  BSCompoundAssertion *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;

  v4 = a3;
  if (v4)
  {
    launchPrewarmCompoundAssertion = self->_launchPrewarmCompoundAssertion;
    if (!launchPrewarmCompoundAssertion)
    {
      objc_initWeak(&location, self);
      v6 = (void *)MEMORY[0x24BE0BDE0];
      v13 = MEMORY[0x24BDAC760];
      v14 = 3221225472;
      v15 = __64__LCSCaptureApplication_acquireLaunchPrewarmAssertionForReason___block_invoke;
      v16 = &unk_251104CA8;
      objc_copyWeak(&v17, &location);
      objc_msgSend(v6, "assertionWithIdentifier:stateDidChangeHandler:", CFSTR("launchPrewarm"), &v13);
      v7 = (BSCompoundAssertion *)objc_claimAutoreleasedReturnValue();
      v8 = self->_launchPrewarmCompoundAssertion;
      self->_launchPrewarmCompoundAssertion = v7;

      v9 = self->_launchPrewarmCompoundAssertion;
      LCSLogCommon();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[BSCompoundAssertion setLog:](v9, "setLog:", v10, v13, v14, v15, v16);

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
      launchPrewarmCompoundAssertion = self->_launchPrewarmCompoundAssertion;
    }
    -[BSCompoundAssertion acquireForReason:](launchPrewarmCompoundAssertion, "acquireForReason:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __64__LCSCaptureApplication_acquireLaunchPrewarmAssertionForReason___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_evaluateLaunchPrewarmAssertions");
    WeakRetained = v2;
  }

}

- (void)_evaluateLaunchPrewarmAssertions
{
  BOOL v3;

  if (-[BSCompoundAssertion isActive](self->_launchPrewarmCompoundAssertion, "isActive"))
  {
    if (self->_launchIsPrewarmed)
      return;
    -[LCSCaptureApplication _generateCachedLinkAction](self, "_generateCachedLinkAction");
    -[LCSCaptureApplication _beginObservingMetadataChanges](self, "_beginObservingMetadataChanges");
    v3 = 1;
  }
  else
  {
    if (!self->_launchIsPrewarmed)
      return;
    -[LCSCaptureApplication _endObservingMetadataChanges](self, "_endObservingMetadataChanges");
    -[LCSCaptureApplication _clearCachedLinkAction](self, "_clearCachedLinkAction");
    v3 = 0;
  }
  self->_launchIsPrewarmed = v3;
}

- (id)_resolvedLinkAction
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE60128]), "initWithOptions:", 0);
  v4 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(MEMORY[0x24BE5FDE0], "cameraCaptureProtocol");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionsConformingToSystemProtocols:logicalType:bundleIdentifier:error:", v6, 1, self->_bundleIdentifier, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", self->_bundleIdentifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    LCSLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "debugDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v12;
      _os_log_impl(&dword_240B1C000, v11, OS_LOG_TYPE_DEFAULT, "Action metadata found in the action map: %@. Creating a link launch action", (uint8_t *)&v17, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BE60060], "policyWithActionMetadata:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "actionWithParameters:", MEMORY[0x24BDBD1A8]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "actionWithOpenWhenRun:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)_generateCachedLinkAction
{
  NSObject *linkActionQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  linkActionQueue = self->_linkActionQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __50__LCSCaptureApplication__generateCachedLinkAction__block_invoke;
  v4[3] = &unk_251104988;
  objc_copyWeak(&v5, &location);
  dispatch_async(linkActionQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __50__LCSCaptureApplication__generateCachedLinkAction__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && !WeakRetained[3])
  {
    LCSLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = v2[8];
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_240B1C000, v3, OS_LOG_TYPE_DEFAULT, "Prewarming link action for %@", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(v2, "_resolvedLinkAction");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v2[3];
    v2[3] = v5;

  }
}

- (void)_clearCachedLinkAction
{
  NSObject *linkActionQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  linkActionQueue = self->_linkActionQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __47__LCSCaptureApplication__clearCachedLinkAction__block_invoke;
  v4[3] = &unk_251104988;
  objc_copyWeak(&v5, &location);
  dispatch_async(linkActionQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __47__LCSCaptureApplication__clearCachedLinkAction__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    LCSLogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = WeakRetained[8];
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_240B1C000, v2, OS_LOG_TYPE_DEFAULT, "Clearing cached link action for %@", (uint8_t *)&v5, 0xCu);
    }

    v4 = (void *)WeakRetained[3];
    WeakRetained[3] = 0;

  }
}

- (void)_beginObservingMetadataChanges
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *metadataChangedObserverToken;
  _QWORD v7[4];
  id v8;
  id location;

  if (!self->_metadataChangedObserverToken)
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *MEMORY[0x24BE5FED0];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __55__LCSCaptureApplication__beginObservingMetadataChanges__block_invoke;
    v7[3] = &unk_251104A28;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v4, 0, 0, v7);
    v5 = objc_claimAutoreleasedReturnValue();

    metadataChangedObserverToken = self->_metadataChangedObserverToken;
    self->_metadataChangedObserverToken = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __55__LCSCaptureApplication__beginObservingMetadataChanges__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  NSObject **WeakRetained;
  NSObject **v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  NSObject **v10;
  id v11;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained[2];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__LCSCaptureApplication__beginObservingMetadataChanges__block_invoke_2;
    block[3] = &unk_251104CD0;
    objc_copyWeak(&v11, v4);
    v9 = v3;
    v10 = v6;
    dispatch_async(v7, block);

    objc_destroyWeak(&v11);
  }

}

void __55__LCSCaptureApplication__beginObservingMetadataChanges__block_invoke_2(id *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v8 = WeakRetained;
    objc_msgSend(a1[4], "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE5FED8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4 || objc_msgSend(v4, "containsObject:", *((_QWORD *)a1[5] + 8)))
    {
      objc_msgSend(a1[5], "_resolvedLinkAction");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = a1[5];
      v7 = (void *)v6[3];
      v6[3] = v5;

    }
    WeakRetained = v8;
  }

}

- (void)_endObservingMetadataChanges
{
  void *v3;
  NSObject *metadataChangedObserverToken;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_metadataChangedObserverToken);

  metadataChangedObserverToken = self->_metadataChangedObserverToken;
  self->_metadataChangedObserverToken = 0;

}

- (NSSet)launchActions
{
  void *v3;
  NSObject *linkActionQueue;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__1;
  v23 = __Block_byref_object_dispose__1;
  v24 = 0;
  linkActionQueue = self->_linkActionQueue;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __38__LCSCaptureApplication_launchActions__block_invoke;
  v18[3] = &unk_251104A50;
  v18[4] = self;
  v18[5] = &v19;
  dispatch_sync(linkActionQueue, v18);
  if (v20[5]
    || (-[LCSCaptureApplication _resolvedLinkAction](self, "_resolvedLinkAction"),
        v5 = objc_claimAutoreleasedReturnValue(),
        v6 = (void *)v20[5],
        v20[5] = v5,
        v6,
        v20[5]))
  {
    v7 = objc_opt_new();
    -[NSObject setOneShotForSpringBoardOnly:](v7, "setOneShotForSpringBoardOnly:", 1);
    v8 = (void *)objc_opt_new();
    -[LCSCaptureApplication captureIntentContext](self, "captureIntentContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v8, "setEncodedCaptureAppContext:", v9);
    -[NSObject setSystemContext:](v7, "setSystemContext:", v8);
    v10 = objc_alloc(MEMORY[0x24BE60158]);
    v11 = (void *)objc_opt_new();
    v12 = (void *)objc_msgSend(v10, "initWithIdentifier:action:executorOptions:", v11, v20[5], v7);

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD720]), "initWithAction:responseHandler:", v12, &__block_literal_global_3);
    LCSLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v13, "debugDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v15;
      _os_log_impl(&dword_240B1C000, v14, OS_LOG_TYPE_DEFAULT, "Link action created: %@", buf, 0xCu);

    }
    objc_msgSend(v3, "addObject:", v13);

  }
  else
  {
    LCSLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[LCSCaptureApplication launchActions].cold.1((uint64_t)self, v7);
  }

  v16 = (void *)objc_msgSend(v3, "copy");
  _Block_object_dispose(&v19, 8);

  return (NSSet *)v16;
}

void __38__LCSCaptureApplication_launchActions__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

- (BOOL)isEqual:(id)a3
{
  LCSCaptureApplication *v4;
  void *v5;
  void *v6;
  int v7;
  char v8;

  v4 = (LCSCaptureApplication *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && -[NSString isEqual:](self->_bundleIdentifier, "isEqual:", v4->_bundleIdentifier)
      && -[LCSExtensionDescribing isEqual:](self->_extension, "isEqual:", v4->_extension)
      && (-[LCSCaptureApplication captureIntentContext](self, "captureIntentContext"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          -[LCSCaptureApplication captureIntentContext](v4, "captureIntentContext"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v5, "isEqual:", v6),
          v6,
          v5,
          v7))
    {
      v8 = -[NSSet isEqual:](self->_launchActions, "isEqual:", v4->_launchActions);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;

  v3 = -[NSString hash](self->_bundleIdentifier, "hash");
  v4 = -[LCSExtensionDescribing hash](self->_extension, "hash") ^ v3;
  -[LCSCaptureApplication captureIntentContext](self, "captureIntentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  v7 = v4 ^ v6 ^ -[NSSet hash](self->_launchActions, "hash");

  return v7;
}

- (LCSExtensionDescribing)extension
{
  return self->_extension;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_launchActions, 0);
  objc_storeStrong((id *)&self->_metadataChangedObserverToken, 0);
  objc_storeStrong((id *)&self->_cachedLinkAction, 0);
  objc_storeStrong((id *)&self->_linkActionQueue, 0);
  objc_storeStrong((id *)&self->_launchPrewarmCompoundAssertion, 0);
}

- (void)_bundleRecordForBundleIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "localizedDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_240B1C000, v2, v3, "Unable to resolve bundle record for %@: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_1();
}

- (void)_captureIntentContextDirectoryURLForBundleIdentifier:(void *)a1 .cold.1(void *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(a1, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "debugDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_240B1C000, v4, v5, "Can't create a directory URL: %{public}@ error: %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_1_1();
}

- (void)captureIntentContext
{
  OUTLINED_FUNCTION_0(&dword_240B1C000, a1, a3, "No bundle identifier found for the remote target to retrieve the capture intent", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)setCaptureIntentContext:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_240B1C000, a1, a3, "No bundle identifier found for the remote target to store the capture intent", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)setCaptureIntentContext:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_240B1C000, a1, a3, "File URL can't be found to set the capture intent context", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)setCaptureIntentContext:(void *)a1 .cold.3(void *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(a1, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "localizedDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_240B1C000, v4, v5, "Unable to remove capture intent context from %{public}@ : %{public}@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_1_1();
}

- (void)launchActions
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 64);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_240B1C000, a2, OS_LOG_TYPE_ERROR, "Unable to resolve link action for capture application: %@", (uint8_t *)&v3, 0xCu);
}

@end
