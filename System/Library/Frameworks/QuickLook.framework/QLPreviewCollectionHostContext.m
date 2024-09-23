@implementation QLPreviewCollectionHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  return +[QLPreviewCollectionServiceContext _extensionAuxiliaryVendorProtocol](QLPreviewCollectionServiceContext, "_extensionAuxiliaryVendorProtocol");
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return +[QLPreviewCollectionServiceContext _extensionAuxiliaryHostProtocol](QLPreviewCollectionServiceContext, "_extensionAuxiliaryHostProtocol");
}

- (id)_protocolService
{
  return -[QLPreviewCollectionHostContext _protocolServiceWithErrorHandler:](self, "_protocolServiceWithErrorHandler:", &__block_literal_global_3);
}

void __50__QLPreviewCollectionHostContext__protocolService__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject **v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = (NSObject **)MEMORY[0x24BE7BF48];
  v4 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v4 = *v3;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    objc_msgSend(v2, "localizedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_20D4F5000, v5, OS_LOG_TYPE_ERROR, "Error while calling the service - %@ #Remote", (uint8_t *)&v7, 0xCu);

  }
}

- (id)_protocolServiceWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[QLPreviewCollectionHostContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __67__QLPreviewCollectionHostContext__protocolServiceWithErrorHandler___block_invoke;
  v9[3] = &unk_24C7256F8;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __67__QLPreviewCollectionHostContext__protocolServiceWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject **v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (NSObject **)MEMORY[0x24BE7BF48];
  v5 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v5 = *v4;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_20D4F5000, v5, OS_LOG_TYPE_ERROR, "Error while waiting asynchronously for the service to call the completion handler of a method - %@ #Remote", (uint8_t *)&v7, 0xCu);
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

- (id)_synchronousProtocolServiceWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[QLPreviewCollectionHostContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __78__QLPreviewCollectionHostContext__synchronousProtocolServiceWithErrorHandler___block_invoke;
  v9[3] = &unk_24C7256F8;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __78__QLPreviewCollectionHostContext__synchronousProtocolServiceWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject **v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (NSObject **)MEMORY[0x24BE7BF48];
  v5 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v5 = *v4;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = v5;
    objc_msgSend(v3, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v7;
    _os_log_impl(&dword_20D4F5000, v6, OS_LOG_TYPE_ERROR, "Error while waiting synchronously for the service to call the completion handler of a method - %@ #Remote", (uint8_t *)&v9, 0xCu);

  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);

}

- (void)getNetworkObserverWithCompletionBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[QLPreviewCollectionHostContext _protocolService](self, "_protocolService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getNetworkObserverWithCompletionBlock:", v4);

}

- (void)setNotificationCenter:(id)a3
{
  void *v3;
  id v4;

  -[QLPreviewCollectionHostContext _protocolService](self, "_protocolService", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[QLNotificationCenter sharedInstance](QLNotificationCenter, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNotificationCenter:", v3);

}

- (void)setHostApplicationBundleIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[QLPreviewCollectionHostContext _protocolService](self, "_protocolService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHostApplicationBundleIdentifier:", v4);

}

- (void)configureWithNumberOfItems:(int64_t)a3 currentPreviewItemIndex:(unint64_t)a4 itemProvider:(id)a5 stateManager:(id)a6
{
  -[QLPreviewCollectionHostContext configureWithNumberOfItems:currentPreviewItemIndex:itemProvider:stateManager:fullScreen:](self, "configureWithNumberOfItems:currentPreviewItemIndex:itemProvider:stateManager:fullScreen:", a3, a4, a5, a6, 0);
}

- (void)configureWithNumberOfItems:(int64_t)a3 currentPreviewItemIndex:(unint64_t)a4 itemProvider:(id)a5 stateManager:(id)a6 fullScreen:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  RBSAssertion *v21;
  RBSAssertion *jetsamBandAssertion;
  RBSAssertion *v23;
  id v24;
  NSObject **v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  audit_token_t atoken;
  uint8_t buf[4];
  id v32;
  _QWORD v33[2];

  v7 = a7;
  v33[1] = *MEMORY[0x24BDAC8D0];
  v12 = a5;
  v13 = a6;
  if (!self->_jetsamBandAssertion)
  {
    objc_msgSend(MEMORY[0x24BE80B88], "attributeWithDomain:name:", CFSTR("com.apple.quicklook"), CFSTR("KeepAboveBackgroundBand"));
    v14 = objc_claimAutoreleasedReturnValue();
    -[QLPreviewCollectionHostContext _auxiliaryConnection](self, "_auxiliaryConnection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
      objc_msgSend(v15, "auditToken");
    else
      memset(&atoken, 0, sizeof(atoken));
    v17 = audit_token_to_pid(&atoken);

    objc_msgSend(MEMORY[0x24BE80D38], "targetWithPid:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_alloc(MEMORY[0x24BE80B10]);
    v28 = (void *)v14;
    v33[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 1);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (RBSAssertion *)objc_msgSend(v19, "initWithExplanation:target:attributes:", CFSTR("Quick Look remote view service jetsam band assertion"), v18, v20);
    jetsamBandAssertion = self->_jetsamBandAssertion;
    self->_jetsamBandAssertion = v21;

    v23 = self->_jetsamBandAssertion;
    v29 = 0;
    LOBYTE(v20) = -[RBSAssertion acquireWithError:](v23, "acquireWithError:", &v29);
    v24 = v29;
    if ((v20 & 1) == 0)
    {
      v25 = (NSObject **)MEMORY[0x24BE7BF48];
      v26 = *MEMORY[0x24BE7BF48];
      if (!*MEMORY[0x24BE7BF48])
      {
        QLSInitLogging();
        v26 = *v25;
      }
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v24;
        _os_log_impl(&dword_20D4F5000, v26, OS_LOG_TYPE_ERROR, "Failed to acquire jetsam band assertion: %@ #Remote", buf, 0xCu);
      }
    }

  }
  -[QLPreviewCollectionHostContext _protocolService](self, "_protocolService");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "configureWithNumberOfItems:currentPreviewItemIndex:itemProvider:stateManager:fullScreen:", a3, a4, v12, v13, v7);

}

- (void)setCurrentPreviewItemIndex:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[QLPreviewCollectionHostContext _protocolService](self, "_protocolService");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCurrentPreviewItemIndex:animated:", a3, v4);

}

- (void)configureAsAccessoryViewContainerForPreviewCollection:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[QLPreviewCollectionHostContext _protocolService](self, "_protocolService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configureAsAccessoryViewContainerForPreviewCollection:", v4);

}

- (void)preparePreviewCollectionForInvalidationWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[QLPreviewCollectionHostContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __95__QLPreviewCollectionHostContext_preparePreviewCollectionForInvalidationWithCompletionHandler___block_invoke;
  v8[3] = &unk_24C7256F8;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "preparePreviewCollectionForInvalidationWithCompletionHandler:", v6);
}

void __95__QLPreviewCollectionHostContext_preparePreviewCollectionForInvalidationWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject **v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (NSObject **)MEMORY[0x24BE7BF48];
  v5 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v5 = *v4;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = v5;
    objc_msgSend(v3, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v7;
    _os_log_impl(&dword_20D4F5000, v6, OS_LOG_TYPE_ERROR, "Error while waiting for the completion handler of preparePreviewCollectionForInvalidationWithCompletionHandler to be called - %@ #Remote", (uint8_t *)&v9, 0xCu);

  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(void))(v8 + 16))();

}

- (void)invalidateService
{
  -[QLPreviewCollectionHostContext invalidateServiceWithCompletionHandler:](self, "invalidateServiceWithCompletionHandler:", &__block_literal_global_20);
}

- (void)invalidateServiceWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD aBlock[5];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__QLPreviewCollectionHostContext_invalidateServiceWithCompletionHandler___block_invoke;
  aBlock[3] = &unk_24C725740;
  aBlock[4] = self;
  v12 = v4;
  v6 = v4;
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __73__QLPreviewCollectionHostContext_invalidateServiceWithCompletionHandler___block_invoke_21;
  v9[3] = &unk_24C7256F8;
  v10 = _Block_copy(aBlock);
  v7 = v10;
  -[QLPreviewCollectionHostContext _protocolServiceWithErrorHandler:](self, "_protocolServiceWithErrorHandler:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invalidateServiceWithCompletionHandler:", v7);

}

uint64_t __73__QLPreviewCollectionHostContext_invalidateServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  NSObject **v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t result;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (v2)
  {
    v10 = 0;
    v3 = objc_msgSend(v2, "invalidateSyncWithError:", &v10);
    v4 = v10;
    if ((v3 & 1) == 0)
    {
      v5 = (NSObject **)MEMORY[0x24BE7BF48];
      v6 = *MEMORY[0x24BE7BF48];
      if (!*MEMORY[0x24BE7BF48])
      {
        QLSInitLogging();
        v6 = *v5;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v4;
        _os_log_impl(&dword_20D4F5000, v6, OS_LOG_TYPE_DEFAULT, "Failed to invalidate jetsam band assertion: %@ #Remote", buf, 0xCu);
      }
    }
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 24);
    *(_QWORD *)(v7 + 24) = 0;

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __73__QLPreviewCollectionHostContext_invalidateServiceWithCompletionHandler___block_invoke_21(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getPreviewCollectionUUIDWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[QLPreviewCollectionHostContext _protocolService](self, "_protocolService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getPreviewCollectionUUIDWithCompletionHandler:", v4);

}

- (void)hostSceneWillDeactivate
{
  id v2;

  -[QLPreviewCollectionHostContext _protocolService](self, "_protocolService");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hostSceneWillDeactivate");

}

- (void)hostApplicationDidEnterBackground:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[QLPreviewCollectionHostContext _protocolService](self, "_protocolService");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hostApplicationDidEnterBackground:", v3);

}

- (void)hostApplicationDidBecomeActive
{
  id v2;

  -[QLPreviewCollectionHostContext _protocolService](self, "_protocolService");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hostApplicationDidBecomeActive");

}

- (void)toolbarButtonsForTraitCollection:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[QLPreviewCollectionHostContext _protocolService](self, "_protocolService");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "toolbarButtonsForTraitCollection:withCompletionHandler:", v7, v6);

}

- (void)toolbarButtonPressedWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  NSObject **v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = (NSObject **)MEMORY[0x24BE7BF48];
  v10 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v10 = *v9;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = v12;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_20D4F5000, v11, OS_LOG_TYPE_INFO, "Host context is calling %@ on the service (%@) #Remote", (uint8_t *)&v14, 0x16u);

  }
  -[QLPreviewCollectionHostContext _protocolService](self, "_protocolService");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "toolbarButtonPressedWithIdentifier:completionHandler:", v7, v8);

}

- (void)saveCurrentPreviewEditsSynchronously:(BOOL)a3 withCompletionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  v6 = a4;
  v7 = v6;
  if (v4)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __93__QLPreviewCollectionHostContext_saveCurrentPreviewEditsSynchronously_withCompletionHandler___block_invoke;
    v15[3] = &unk_24C7256F8;
    v8 = &v16;
    v16 = v6;
    v9 = v6;
    -[QLPreviewCollectionHostContext _synchronousProtocolServiceWithErrorHandler:](self, "_synchronousProtocolServiceWithErrorHandler:", v15);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __93__QLPreviewCollectionHostContext_saveCurrentPreviewEditsSynchronously_withCompletionHandler___block_invoke_2;
    v13[3] = &unk_24C7256F8;
    v8 = &v14;
    v14 = v6;
    v11 = v6;
    -[QLPreviewCollectionHostContext _protocolServiceWithErrorHandler:](self, "_protocolServiceWithErrorHandler:", v13);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v10;

  objc_msgSend(v12, "saveCurrentPreviewEditsSynchronously:withCompletionHandler:", v4, v7);
}

uint64_t __93__QLPreviewCollectionHostContext_saveCurrentPreviewEditsSynchronously_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 0x7FFFFFFFFFFFFFFFLL, 0);
  return result;
}

uint64_t __93__QLPreviewCollectionHostContext_saveCurrentPreviewEditsSynchronously_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 0x7FFFFFFFFFFFFFFFLL, 0);
  return result;
}

- (void)prepareForActionSheetPresentationWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[QLPreviewCollectionHostContext _protocolService](self, "_protocolService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prepareForActionSheetPresentationWithCompletionHandler:", v4);

}

- (void)actionSheetDidDismiss
{
  id v2;

  -[QLPreviewCollectionHostContext _protocolService](self, "_protocolService");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionSheetDidDismiss");

}

- (void)documentMenuActionWillBegin
{
  id v2;

  -[QLPreviewCollectionHostContext _protocolService](self, "_protocolService");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "documentMenuActionWillBegin");

}

- (void)shouldDisplayLockActivityWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __81__QLPreviewCollectionHostContext_shouldDisplayLockActivityWithCompletionHandler___block_invoke;
  v7[3] = &unk_24C7256F8;
  v8 = v4;
  v5 = v4;
  -[QLPreviewCollectionHostContext _protocolServiceWithErrorHandler:](self, "_protocolServiceWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "shouldDisplayLockActivityWithCompletionHandler:", v5);

}

uint64_t __81__QLPreviewCollectionHostContext_shouldDisplayLockActivityWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)requestLockForCurrentItem
{
  id v2;

  -[QLPreviewCollectionHostContext _protocolService](self, "_protocolService");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestLockForCurrentItem");

}

- (void)saveIntoPhotoLibraryMediaWithURLWrapper:(id)a3 previewItemType:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  -[QLPreviewCollectionHostContext _protocolService](self, "_protocolService");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "saveIntoPhotoLibraryMediaWithURLWrapper:previewItemType:completionHandler:", v9, a4, v8);

}

- (void)keyCommandsWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[QLPreviewCollectionHostContext _protocolService](self, "_protocolService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyCommandsWithCompletionHandler:", v4);

}

- (void)keyCommandWasPerformed:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[QLPreviewCollectionHostContext _protocolService](self, "_protocolService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyCommandWasPerformed:", v4);

}

- (void)startTransitionWithSourceViewProvider:(id)a3 transitionController:(id)a4 presenting:(BOOL)a5 useInteractiveTransition:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;

  v7 = a6;
  v8 = a5;
  v12 = a7;
  v13 = a4;
  v14 = a3;
  -[QLPreviewCollectionHostContext _protocolService](self, "_protocolService");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "startTransitionWithSourceViewProvider:transitionController:presenting:useInteractiveTransition:completionHandler:", v14, v13, v8, v7, v12);

}

- (void)tearDownTransition:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[QLPreviewCollectionHostContext _protocolService](self, "_protocolService");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tearDownTransition:", v3);

}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[QLPreviewCollectionHostContext _protocolService](self, "_protocolService");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAppearance:animated:", v6, v4);

}

- (void)notifyFirstTimeAppearanceWithActions:(unint64_t)a3
{
  id v4;

  -[QLPreviewCollectionHostContext _protocolService](self, "_protocolService");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notifyFirstTimeAppearanceWithActions:", a3);

}

- (void)notifyStateRestorationUserInfo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[QLPreviewCollectionHostContext _protocolService](self, "_protocolService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notifyStateRestorationUserInfo:", v4);

}

- (void)setAllowInteractiveTransitions:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[QLPreviewCollectionHostContext _protocolService](self, "_protocolService");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowInteractiveTransitions:", v3);

}

- (void)setLoadingString:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[QLPreviewCollectionHostContext _protocolService](self, "_protocolService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLoadingString:", v4);

}

- (void)overrideParentApplicationDisplayIdentifierWithIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[QLPreviewCollectionHostContext _protocolService](self, "_protocolService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "overrideParentApplicationDisplayIdentifierWithIdentifier:", v4);

}

- (void)hostViewControllerBackgroundColorChanged:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[QLPreviewCollectionHostContext _protocolService](self, "_protocolService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hostViewControllerBackgroundColorChanged:", v4);

}

- (void)hostViewControlerTransitionToState:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[QLPreviewCollectionHostContext _protocolService](self, "_protocolService");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hostViewControlerTransitionToState:animated:", a3, v4);

}

- (void)setIsContentManaged:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[QLPreviewCollectionHostContext _protocolService](self, "_protocolService");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsContentManaged:", v3);

}

- (void)setPreviewItemDisplayState:(id)a3 onItemAtIndex:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[QLPreviewCollectionHostContext _protocolService](self, "_protocolService");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPreviewItemDisplayState:onItemAtIndex:", v6, a4);

}

- (void)setScreenEdgePanWidth:(double)a3
{
  id v4;

  -[QLPreviewCollectionHostContext _protocolService](self, "_protocolService");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScreenEdgePanWidth:", a3);

}

- (void)previewItemDisplayState:(id)a3 wasAppliedToItemAtIndex:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[QLPreviewCollectionHostContext _protocolService](self, "_protocolService");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "previewItemDisplayState:wasAppliedToItemAtIndex:", v6, a4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jetsamBandAssertion, 0);
}

@end
