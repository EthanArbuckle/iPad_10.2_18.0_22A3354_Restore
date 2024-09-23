@implementation QLRemotePreviewCollection

- (BOOL)isRemote
{
  return 1;
}

- (id)accessoryView
{
  void *v2;
  void *v3;

  -[QLRemotePreviewCollection accessoryViewController](self, "accessoryViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)configureAsAccessoryViewContainerForPreviewCollection:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[QLRemotePreviewCollection hostContext](self, "hostContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configureAsAccessoryViewContainerForPreviewCollection:", v4);

}

- (void)getPreviewCollectionUUIDWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[QLRemotePreviewCollection hostContext](self, "hostContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getPreviewCollectionUUIDWithCompletionHandler:", v4);

}

- (void)_presentViewControllerForError:(id)a3
{
  id v4;
  QLPreviewControllerStateProtocolHostOnly *stateManager;
  void *v6;
  NSObject **v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  QLRemotePreviewCollection *v22;
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  stateManager = self->_stateManager;
  if (stateManager)
  {
    -[QLPreviewControllerStateProtocolHostOnly currentItem](stateManager, "currentItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (NSObject **)MEMORY[0x24BE7BF48];
      v8 = *MEMORY[0x24BE7BF48];
      if (!*MEMORY[0x24BE7BF48])
      {
        QLSInitLogging();
        v8 = *v7;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v4;
        _os_log_impl(&dword_20D4F5000, v8, OS_LOG_TYPE_ERROR, "View service did terminate with error: %@ #Remote", buf, 0xCu);
      }
      -[QLRemotePreviewCollection setIsAvailable:](self, "setIsAvailable:", 0);
      -[QLRemotePreviewCollection _resetRemoteConfiguration](self, "_resetRemoteConfiguration");
      v9 = (void *)objc_opt_new();
      -[QLRemotePreviewCollection childViewControllers](self, "childViewControllers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "copy");
      objc_msgSend(v11, "enumerateObjectsUsingBlock:", &__block_literal_global_313);

      -[QLPreviewControllerStateProtocolHostOnly currentItem](self->_stateManager, "currentItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[QLPreviewControllerStateProtocolHostOnly currentItem](self->_stateManager, "currentItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "createPreviewContext");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = MEMORY[0x24BDAC760];
      v19 = 3221225472;
      v20 = __60__QLRemotePreviewCollection__presentViewControllerForError___block_invoke_2;
      v21 = &unk_24C725848;
      v22 = self;
      v15 = v9;
      v23 = v15;
      objc_msgSend(v15, "loadPreviewControllerIfNeededWithContents:context:completionHandler:", v12, v14, &v18);

      objc_msgSend(v4, "domain", v18, v19, v20, v21, v22);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.quicklook.previewcollection")))
      {
        v17 = objc_msgSend(v4, "code");

        if (v17 == 1)
          goto LABEL_12;
      }
      else
      {

      }
      -[QLPreviewControllerStateProtocolHostOnly remoteViewControllerWasInvalidated](self->_stateManager, "remoteViewControllerWasInvalidated");
LABEL_12:

    }
  }

}

void __60__QLRemotePreviewCollection__presentViewControllerForError___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v3 = a2;
  objc_msgSend(v3, "willMoveToParentViewController:", 0);
  objc_msgSend(v3, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  objc_msgSend(v3, "removeFromParentViewController");
}

void __60__QLRemotePreviewCollection__presentViewControllerForError___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
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
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "addChildViewController:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSubview:", v3);

  objc_msgSend(*(id *)(a1 + 40), "didMoveToParentViewController:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD1628];
  v17 = CFSTR("error");
  objc_msgSend(*(id *)(a1 + 40), "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[error]|"), 0, 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addConstraints:", v9);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDD1628];
  v15 = CFSTR("error");
  objc_msgSend(*(id *)(a1 + 40), "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[error]|"), 0, 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addConstraints:", v14);

}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject **v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject **v14;
  NSObject *v15;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[QLRemotePreviewCollection _resetRemoteConfiguration](self, "_resetRemoteConfiguration");
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BEBEC00]))
  {
    v6 = objc_msgSend(v4, "code");

    if (v6 == 1)
    {
      v7 = (NSObject **)MEMORY[0x24BE7BF48];
      v8 = *MEMORY[0x24BE7BF48];
      if (!*MEMORY[0x24BE7BF48])
      {
        QLSInitLogging();
        v8 = *v7;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = v8;
        -[QLRemotePreviewCollection request](self, "request");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138412546;
        v17 = v4;
        v18 = 2112;
        v19 = v10;
        _os_log_impl(&dword_20D4F5000, v9, OS_LOG_TYPE_INFO, "Preview collection view service did terminate normally (error: %@). Cancelling request: %@ #Remote", (uint8_t *)&v16, 0x16u);

      }
      -[QLRemotePreviewCollection request](self, "request");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        +[QLPreviewCollection quickLookExtension](QLPreviewCollection, "quickLookExtension");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[QLRemotePreviewCollection request](self, "request");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "cancelExtensionRequestWithIdentifier:", v13);

      }
      goto LABEL_15;
    }
  }
  else
  {

  }
  v14 = (NSObject **)MEMORY[0x24BE7BF48];
  v15 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v15 = *v14;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v16 = 138412290;
    v17 = v4;
    _os_log_impl(&dword_20D4F5000, v15, OS_LOG_TYPE_ERROR, "Preview collection viewServiceDidTerminateWithError: %@ #Remote", (uint8_t *)&v16, 0xCu);
  }
  -[QLRemotePreviewCollection _presentViewControllerForError:](self, "_presentViewControllerForError:", v4);
LABEL_15:

}

- (void)preparePreviewCollectionForInvalidationWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD block[4];
  id v14;
  _QWORD v15[4];
  NSObject *v16;
  _QWORD v17[4];
  NSObject *v18;

  v4 = a3;
  -[QLRemotePreviewCollection setIsAvailable:](self, "setIsAvailable:", 0);
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  -[QLRemotePreviewCollection hostContext](self, "hostContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __90__QLRemotePreviewCollection_preparePreviewCollectionForInvalidationWithCompletionHandler___block_invoke;
  v17[3] = &unk_24C724B00;
  v8 = v5;
  v18 = v8;
  objc_msgSend(v6, "preparePreviewCollectionForInvalidationWithCompletionHandler:", v17);

  dispatch_group_enter(v8);
  -[QLRemotePreviewCollection accessoryViewController](self, "accessoryViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hostContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __90__QLRemotePreviewCollection_preparePreviewCollectionForInvalidationWithCompletionHandler___block_invoke_2;
  v15[3] = &unk_24C724B00;
  v16 = v8;
  v11 = v8;
  objc_msgSend(v10, "preparePreviewCollectionForInvalidationWithCompletionHandler:", v15);

  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __90__QLRemotePreviewCollection_preparePreviewCollectionForInvalidationWithCompletionHandler___block_invoke_3;
  block[3] = &unk_24C725870;
  v14 = v4;
  v12 = v4;
  dispatch_group_notify(v11, MEMORY[0x24BDAC9B8], block);

}

void __90__QLRemotePreviewCollection_preparePreviewCollectionForInvalidationWithCompletionHandler___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __90__QLRemotePreviewCollection_preparePreviewCollectionForInvalidationWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __90__QLRemotePreviewCollection_preparePreviewCollectionForInvalidationWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)invalidateServiceWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[QLRemotePreviewCollection hostContext](self, "hostContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__QLRemotePreviewCollection_invalidateServiceWithCompletionHandler___block_invoke;
  v7[3] = &unk_24C725740;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "invalidateServiceWithCompletionHandler:", v7);

}

void __68__QLRemotePreviewCollection_invalidateServiceWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "accessoryViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hostContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateServiceWithCompletionHandler:", *(_QWORD *)(a1 + 40));

}

- (void)_resetRemoteConfiguration
{
  id v2;

  objc_msgSend(MEMORY[0x24BE7BFB0], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRemoteObserver:", 0);

}

- (void)previewItemDisplayState:(id)a3 wasAppliedToItemAtIndex:(unint64_t)a4
{
  -[QLPreviewCollectionHostContext setPreviewItemDisplayState:onItemAtIndex:](self->_hostContext, "setPreviewItemDisplayState:onItemAtIndex:", a3, a4);
}

- (void)setHostApplicationBundleIdentifier:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[QLPreviewCollectionHostContext setHostApplicationBundleIdentifier:](self->_hostContext, "setHostApplicationBundleIdentifier:", v4);

}

- (void)configureWithNumberOfItems:(int64_t)a3 currentPreviewItemIndex:(unint64_t)a4 itemProvider:(id)a5 stateManager:(id)a6
{
  -[QLRemotePreviewCollection configureWithNumberOfItems:currentPreviewItemIndex:itemProvider:stateManager:fullScreen:](self, "configureWithNumberOfItems:currentPreviewItemIndex:itemProvider:stateManager:fullScreen:", a3, a4, a5, a6, 0);
}

- (void)configureWithNumberOfItems:(int64_t)a3 currentPreviewItemIndex:(unint64_t)a4 itemProvider:(id)a5 stateManager:(id)a6 fullScreen:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  QLPreviewCollectionHostContext *hostContext;
  void *v14;
  id v15;

  v7 = a7;
  v15 = a5;
  v12 = a6;
  objc_storeStrong((id *)&self->_stateManager, a6);
  hostContext = self->_hostContext;
  if (hostContext)
  {
    -[QLPreviewCollectionHostContext configureWithNumberOfItems:currentPreviewItemIndex:itemProvider:stateManager:fullScreen:](hostContext, "configureWithNumberOfItems:currentPreviewItemIndex:itemProvider:stateManager:fullScreen:", a3, a4, v15, v12, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.quicklook.previewcollection"), 1, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLRemotePreviewCollection _presentViewControllerForError:](self, "_presentViewControllerForError:", v14);

  }
}

- (void)setCurrentPreviewItemIndex:(int64_t)a3 animated:(BOOL)a4
{
  -[QLPreviewCollectionHostContext setCurrentPreviewItemIndex:animated:](self->_hostContext, "setCurrentPreviewItemIndex:animated:", a3, a4);
}

- (void)hostSceneWillDeactivate
{
  -[QLPreviewCollectionHostContext hostSceneWillDeactivate](self->_hostContext, "hostSceneWillDeactivate");
}

- (void)hostApplicationDidEnterBackground:(BOOL)a3
{
  -[QLPreviewCollectionHostContext hostApplicationDidEnterBackground:](self->_hostContext, "hostApplicationDidEnterBackground:", a3);
}

- (void)hostApplicationDidBecomeActive
{
  -[QLPreviewCollectionHostContext hostApplicationDidBecomeActive](self->_hostContext, "hostApplicationDidBecomeActive");
}

- (void)toolbarButtonsForTraitCollection:(id)a3 withCompletionHandler:(id)a4
{
  -[QLPreviewCollectionHostContext toolbarButtonsForTraitCollection:withCompletionHandler:](self->_hostContext, "toolbarButtonsForTraitCollection:withCompletionHandler:", a3, a4);
}

- (void)toolbarButtonPressedWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(_QWORD);
  NSObject **v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void (**)(_QWORD))a4;
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
    v13 = 138412546;
    v14 = v12;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_20D4F5000, v11, OS_LOG_TYPE_INFO, "Calling %@ on the service (%@) #Remote", (uint8_t *)&v13, 0x16u);

  }
  if (self->_isAvailable)
  {
    -[QLPreviewCollectionHostContext toolbarButtonPressedWithIdentifier:completionHandler:](self->_hostContext, "toolbarButtonPressedWithIdentifier:completionHandler:", v7, v8);
  }
  else if (v8)
  {
    v8[2](v8);
  }

}

- (void)saveCurrentPreviewEditsSynchronously:(BOOL)a3 withCompletionHandler:(id)a4
{
  -[QLPreviewCollectionHostContext saveCurrentPreviewEditsSynchronously:withCompletionHandler:](self->_hostContext, "saveCurrentPreviewEditsSynchronously:withCompletionHandler:", a3, a4);
}

- (void)prepareForActionSheetPresentationWithCompletionHandler:(id)a3
{
  -[QLPreviewCollectionHostContext prepareForActionSheetPresentationWithCompletionHandler:](self->_hostContext, "prepareForActionSheetPresentationWithCompletionHandler:", a3);
}

- (void)actionSheetDidDismiss
{
  -[QLPreviewCollectionHostContext actionSheetDidDismiss](self->_hostContext, "actionSheetDidDismiss");
}

- (void)documentMenuActionWillBegin
{
  -[QLPreviewCollectionHostContext documentMenuActionWillBegin](self->_hostContext, "documentMenuActionWillBegin");
}

- (void)shouldDisplayLockActivityWithCompletionHandler:(id)a3
{
  -[QLPreviewCollectionHostContext shouldDisplayLockActivityWithCompletionHandler:](self->_hostContext, "shouldDisplayLockActivityWithCompletionHandler:", a3);
}

- (void)requestLockForCurrentItem
{
  -[QLPreviewCollectionHostContext requestLockForCurrentItem](self->_hostContext, "requestLockForCurrentItem");
}

- (void)saveIntoPhotoLibraryMediaWithURLWrapper:(id)a3 previewItemType:(unint64_t)a4 completionHandler:(id)a5
{
  -[QLPreviewCollectionHostContext saveIntoPhotoLibraryMediaWithURLWrapper:previewItemType:completionHandler:](self->_hostContext, "saveIntoPhotoLibraryMediaWithURLWrapper:previewItemType:completionHandler:", a3, a4, a5);
}

- (void)keyCommandsWithCompletionHandler:(id)a3
{
  -[QLPreviewCollectionHostContext keyCommandsWithCompletionHandler:](self->_hostContext, "keyCommandsWithCompletionHandler:", a3);
}

- (void)keyCommandWasPerformed:(id)a3
{
  -[QLPreviewCollectionHostContext keyCommandWasPerformed:](self->_hostContext, "keyCommandWasPerformed:", a3);
}

- (void)startTransitionWithSourceViewProvider:(id)a3 transitionController:(id)a4 presenting:(BOOL)a5 useInteractiveTransition:(BOOL)a6 completionHandler:(id)a7
{
  -[QLPreviewCollectionHostContext startTransitionWithSourceViewProvider:transitionController:presenting:useInteractiveTransition:completionHandler:](self->_hostContext, "startTransitionWithSourceViewProvider:transitionController:presenting:useInteractiveTransition:completionHandler:", a3, a4, a5, a6, a7);
}

- (void)tearDownTransition:(BOOL)a3
{
  -[QLPreviewCollectionHostContext tearDownTransition:](self->_hostContext, "tearDownTransition:", a3);
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  -[QLPreviewCollectionHostContext setAppearance:animated:](self->_hostContext, "setAppearance:animated:", a3, a4);
}

- (void)notifyFirstTimeAppearanceWithActions:(unint64_t)a3
{
  -[QLPreviewCollectionHostContext notifyFirstTimeAppearanceWithActions:](self->_hostContext, "notifyFirstTimeAppearanceWithActions:", a3);
}

- (void)notifyStateRestorationUserInfo:(id)a3
{
  -[QLPreviewCollectionHostContext notifyStateRestorationUserInfo:](self->_hostContext, "notifyStateRestorationUserInfo:", a3);
}

- (void)setAllowInteractiveTransitions:(BOOL)a3
{
  -[QLPreviewCollectionHostContext setAllowInteractiveTransitions:](self->_hostContext, "setAllowInteractiveTransitions:", a3);
}

- (void)setLoadingString:(id)a3
{
  -[QLPreviewCollectionHostContext setLoadingString:](self->_hostContext, "setLoadingString:", a3);
}

- (void)overrideParentApplicationDisplayIdentifierWithIdentifier:(id)a3
{
  -[QLPreviewCollectionHostContext overrideParentApplicationDisplayIdentifierWithIdentifier:](self->_hostContext, "overrideParentApplicationDisplayIdentifierWithIdentifier:", a3);
}

- (void)hostViewControllerBackgroundColorChanged:(id)a3
{
  -[QLPreviewCollectionHostContext hostViewControllerBackgroundColorChanged:](self->_hostContext, "hostViewControllerBackgroundColorChanged:", a3);
}

- (void)hostViewControlerTransitionToState:(unint64_t)a3 animated:(BOOL)a4
{
  -[QLPreviewCollectionHostContext hostViewControlerTransitionToState:animated:](self->_hostContext, "hostViewControlerTransitionToState:animated:", a3, a4);
}

- (void)setIsContentManaged:(BOOL)a3
{
  -[QLPreviewCollectionHostContext setIsContentManaged:](self->_hostContext, "setIsContentManaged:", a3);
}

- (void)setPreviewItemDisplayState:(id)a3 onItemAtIndex:(unint64_t)a4
{
  -[QLPreviewCollectionHostContext setPreviewItemDisplayState:onItemAtIndex:](self->_hostContext, "setPreviewItemDisplayState:onItemAtIndex:", a3, a4);
}

- (void)setScreenEdgePanWidth:(double)a3
{
  self->_edgeNavigationGestureWidth = a3;
  -[QLRemotePreviewCollection _updateTouchGrabbingView](self, "_updateTouchGrabbingView");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[QLPreviewCollectionHostContext setScreenEdgePanWidth:](self->_hostContext, "setScreenEdgePanWidth:", a3);
}

- (void)_updateTouchGrabbingView
{
  void *v3;
  double v4;
  double v5;
  double edgeNavigationGestureWidth;
  QLRemotePreviewCollection *v7;
  UIView *touchGrabbingView;
  UIView *v9;

  if (self->_edgeNavigationGestureWidth >= 0.0
    && -[QLRemotePreviewCollection _isNavigationControllerGrabbingViewForInteractivePopNeeded](self, "_isNavigationControllerGrabbingViewForInteractivePopNeeded"))
  {
    -[QLRemotePreviewCollection navigationScreenEdgePanGestureRecognizer](self, "navigationScreenEdgePanGestureRecognizer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_edgeRegionSize");
    v5 = v4;

    edgeNavigationGestureWidth = self->_edgeNavigationGestureWidth;
    if (edgeNavigationGestureWidth <= 0.0)
    {
      v7 = self;
      edgeNavigationGestureWidth = v5;
    }
    else
    {
      if (edgeNavigationGestureWidth >= v5)
        edgeNavigationGestureWidth = v5;
      v7 = self;
    }
    -[QLRemotePreviewCollection _addGrabbingViewIfNecessaryWithWidth:](v7, "_addGrabbingViewIfNecessaryWithWidth:", edgeNavigationGestureWidth);
  }
  else
  {
    touchGrabbingView = self->_touchGrabbingView;
    if (touchGrabbingView)
    {
      -[UIView removeFromSuperview](touchGrabbingView, "removeFromSuperview");
      v9 = self->_touchGrabbingView;
      self->_touchGrabbingView = 0;

    }
  }
}

- (BOOL)_isNavigationControllerGrabbingViewForInteractivePopNeeded
{
  void *v3;
  void *v4;
  void *v5;
  QLRemotePreviewCollection *v6;
  void *v7;
  BOOL i;
  void *v9;
  BOOL v10;

  -[QLRemotePreviewCollection navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = self;
  v7 = v6;
  for (i = v6 == 0; v7 && v7 != v5; i = v7 == 0)
  {
    v9 = v7;
    objc_msgSend(v7, "parentViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v3)
    v10 = i;
  else
    v10 = 0;

  return v10;
}

- (BOOL)_addGrabbingViewIfNecessaryWithWidth:(double)a3
{
  void *v5;
  double v6;
  double v7;
  UIView *touchGrabbingView;
  UIView *v9;
  UIView *v10;
  void *v11;
  BOOL v12;
  void *v13;
  CGRect v15;
  CGRect v16;

  -[QLRemotePreviewCollection view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;

  touchGrabbingView = self->_touchGrabbingView;
  if (touchGrabbingView)
  {
    -[UIView frame](touchGrabbingView, "frame");
    v16.origin.x = 0.0;
    v16.origin.y = 0.0;
    v16.size.width = a3;
    v16.size.height = v7;
    if (!CGRectEqualToRect(v15, v16))
      -[UIView setFrame:](self->_touchGrabbingView, "setFrame:", 0.0, 0.0, a3, v7);
    return 0;
  }
  if (a3 <= 0.0)
    return 0;
  v9 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", 0.0, 0.0, a3, v7);
  v10 = self->_touchGrabbingView;
  self->_touchGrabbingView = v9;

  -[UIView layer](self->_touchGrabbingView, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 1;
  objc_msgSend(v11, "setHitTestsAsOpaque:", 1);

  -[UIView setUserInteractionEnabled:](self->_touchGrabbingView, "setUserInteractionEnabled:", 0);
  -[UIView setAutoresizingMask:](self->_touchGrabbingView, "setAutoresizingMask:", 20);
  -[QLRemotePreviewCollection view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", self->_touchGrabbingView);

  return v12;
}

- (id)navigationScreenEdgePanGestureRecognizer
{
  void *v2;
  void *v3;
  void *v4;

  -[QLRemotePreviewCollection navigationController](self, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_builtinInteractionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "screenEdgePanGestureRecognizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)request
{
  return objc_getProperty(self, a2, 1504, 1);
}

- (void)setRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1504);
}

- (QLRemotePreviewCollection)accessoryViewController
{
  return (QLRemotePreviewCollection *)objc_getProperty(self, a2, 1512, 1);
}

- (void)setAccessoryViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1512);
}

- (QLPreviewCollectionHostContext)hostContext
{
  return (QLPreviewCollectionHostContext *)objc_getProperty(self, a2, 1520, 1);
}

- (void)setHostContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1520);
}

- (BOOL)isAvailable
{
  return self->_isAvailable;
}

- (void)setIsAvailable:(BOOL)a3
{
  self->_isAvailable = a3;
}

- (BOOL)allowInteractiveTransitions
{
  return self->_allowInteractiveTransitions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostContext, 0);
  objc_storeStrong((id *)&self->_accessoryViewController, 0);
  objc_storeStrong(&self->_request, 0);
  objc_storeStrong((id *)&self->_touchGrabbingView, 0);
  objc_storeStrong((id *)&self->_stateManager, 0);
}

@end
