@implementation _UIDocumentPickerViewServiceViewController

+ (id)_exportedInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255516558);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel__setAuxiliaryOptions_, 0, 0);

  return v2;
}

+ (id)_remoteViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25551C060);
}

- (void)dealloc
{
  objc_super v3;

  -[NSURL stopAccessingSecurityScopedResource](self->_uploadURL, "stopAccessingSecurityScopedResource");
  v3.receiver = self;
  v3.super_class = (Class)_UIDocumentPickerViewServiceViewController;
  -[_UIDocumentPickerViewServiceViewController dealloc](&v3, sel_dealloc);
}

- (void)_setUploadURL:(id)a3
{
  id v5;
  NSObject *v6;
  NSURL **p_uploadURL;
  void *v8;
  void *v9;
  int v10;
  id v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  _QWORD *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  int v25;
  NSObject *v26;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  int v31;
  _BOOL4 v32;
  uint64_t v33;
  id v34;
  id v35;
  uint8_t buf[4];
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  cdui_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v37 = v5;
    _os_log_impl(&dword_21F506000, v6, OS_LOG_TYPE_INFO, "[INFO] received upload URL %@", buf, 0xCu);
  }

  p_uploadURL = &self->_uploadURL;
  if ((-[NSURL isEqual:](self->_uploadURL, "isEqual:", v5) & 1) == 0)
  {
    -[NSURL stopAccessingSecurityScopedResource](*p_uploadURL, "stopAccessingSecurityScopedResource");
    objc_storeStrong((id *)&self->_uploadURL, a3);
    -[NSURL startAccessingSecurityScopedResource](*p_uploadURL, "startAccessingSecurityScopedResource");
    -[_UIDocumentPickerViewServiceViewController uploadURL](self, "uploadURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0;
      v10 = objc_msgSend(v5, "getPromisedItemResourceValue:forKey:error:", &v35, *MEMORY[0x24BDBCCF0], 0);
      v11 = v35;
      if (v10)
      {
        objc_msgSend(v9, "addObject:", *MEMORY[0x24BDC17B8]);
        objc_msgSend(v9, "addObject:", v11);
        v34 = 0;
        v12 = objc_msgSend(v5, "getPromisedItemResourceValue:forKey:error:", &v34, *MEMORY[0x24BDBCC80], 0);
        v13 = v34;
        v14 = v13;
        if (v12)
        {
          v15 = -[NSObject BOOLValue](v13, "BOOLValue");
          v16 = (_QWORD *)MEMORY[0x24BDC1828];
          if (!v15)
            v16 = (_QWORD *)MEMORY[0x24BDC1748];
          objc_msgSend(v9, "addObject:", *v16);
        }
      }
      else
      {
        cdui_default_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          -[_UIDocumentPickerViewServiceViewController _setUploadURL:].cold.6((uint64_t)&self->_uploadURL, v17, v18, v19, v20, v21, v22, v23);

        -[NSURL path](*p_uploadURL, "path");
        v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v33 = objc_msgSend(v24, "fileSystemRepresentation");
        v25 = sandbox_check();

        if (v25)
        {
          cdui_default_log();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
            -[_UIDocumentPickerViewServiceViewController _setUploadURL:].cold.5();

          MEMORY[0x2207C9AD0](*p_uploadURL);
          v14 = objc_claimAutoreleasedReturnValue();
          cdui_default_log();
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = os_log_type_enabled(v27, OS_LOG_TYPE_FAULT);
          if (v14)
          {
            if (v28)
              -[_UIDocumentPickerViewServiceViewController _setUploadURL:].cold.4();
          }
          else if (v28)
          {
            -[_UIDocumentPickerViewServiceViewController _setUploadURL:].cold.3();
          }

        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager", v33);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSURL path](*p_uploadURL, "path");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v29, "fileExistsAtPath:", v30);

          cdui_default_log();
          v14 = objc_claimAutoreleasedReturnValue();
          v32 = os_log_type_enabled(v14, OS_LOG_TYPE_FAULT);
          if (v31)
          {
            if (v32)
              -[_UIDocumentPickerViewServiceViewController _setUploadURL:].cold.1();
          }
          else if (v32)
          {
            -[_UIDocumentPickerViewServiceViewController _setUploadURL:].cold.2();
          }
        }
      }

      -[_UIDocumentPickerViewServiceViewController _setPickableTypes:](self, "_setPickableTypes:", v9);
    }
  }

}

- (void)_createBookmarkAndDismissWithCloudURL:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIDocumentPickerViewServiceViewController _hostApplicationBundleIdentifier](self, "_hostApplicationBundleIdentifier");
  v5 = v4;
  FPExtendBookmarkForDocumentURL();

}

- (void)_dismissWithFileProviderURL:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _UIDocumentPickerViewServiceViewController *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[_UIDocumentPickerViewServiceViewController _hostApplicationBundleIdentifier](self, "_hostApplicationBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  cdui_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v20 = v7;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_21F506000, v9, OS_LOG_TYPE_INFO, "[INFO] 3rd party document picker %@ selected URL %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDC8270], "sharedConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __91___UIDocumentPickerViewServiceViewController__dismissWithFileProviderURL_bundleIdentifier___block_invoke;
  v14[3] = &unk_24E43B5A8;
  v15 = v6;
  v16 = self;
  v17 = v7;
  v18 = v8;
  v11 = v8;
  v12 = v7;
  v13 = v6;
  objc_msgSend(v10, "extendSandboxAndCreatePlaceholderForFileURL:fromProviderID:toConsumerID:completionHandler:", v13, v12, v11, v14);

}

- (void)_dismissWithImportURL:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_UIDocumentPickerViewServiceViewController hostingViewController](self, "hostingViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF70A8], "wrapperWithURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_didSelectURLWrapper:", v5);
}

- (void)dismissWithURL:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (!-[_UIDocumentPickerViewServiceViewController hasBeenDismissed](self, "hasBeenDismissed"))
  {
    -[_UIDocumentPickerViewServiceViewController setHasBeenDismissed:](self, "setHasBeenDismissed:", 1);
    if (!v9)
    {
      -[_UIDocumentPickerViewServiceViewController hostingViewController](self, "hostingViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_dismissViewController");
      goto LABEL_7;
    }
    if (!-[_UIDocumentPickerViewServiceViewController pickerMode](self, "pickerMode")
      || -[_UIDocumentPickerViewServiceViewController pickerMode](self, "pickerMode") == 2)
    {
      -[_UIDocumentPickerViewServiceViewController setNavigationItemSpinner:](self, "setNavigationItemSpinner:", 1);
      -[_UIDocumentPickerViewServiceViewController hostingViewController](self, "hostingViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF70A8], "wrapperWithURL:", v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_didSelectURLWrapper:", v8);

LABEL_7:
      goto LABEL_8;
    }
    if (v6 && !objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE17550]))
      -[_UIDocumentPickerViewServiceViewController _dismissWithFileProviderURL:bundleIdentifier:](self, "_dismissWithFileProviderURL:bundleIdentifier:", v9, v6);
    else
      -[_UIDocumentPickerViewServiceViewController _createBookmarkAndDismissWithCloudURL:](self, "_createBookmarkAndDismissWithCloudURL:", v9);
  }
LABEL_8:

}

- (void)_waitForDownloadOfURL:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  char v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  _QWORD v52[4];
  id v53;
  id v54;
  id v55;
  id v56;
  _QWORD *v57;
  uint64_t v58;
  _QWORD block[4];
  id v60;
  id v61;
  id v62;
  id v63;
  _QWORD v64[6];
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  _QWORD v71[5];
  id v72;
  id v73;
  id v74;
  id v75[2];

  v5 = a3;
  v6 = a4;
  v75[0] = 0;
  v7 = objc_msgSend(v5, "getPromisedItemResourceValue:forKey:error:", v75, *MEMORY[0x24BDBCCC0], 0);
  v8 = v75[0];
  if ((v7 & 1) == 0)
  {
    objc_msgSend(v5, "lastPathComponent");
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v9;
  }
  v74 = 0;
  v10 = *MEMORY[0x24BDBCC48];
  v73 = 0;
  v11 = objc_msgSend(v5, "getPromisedItemResourceValue:forKey:error:", &v74, v10, &v73);
  v12 = v74;
  v44 = v73;
  v45 = v12;
  if (v11)
  {
    v13 = objc_msgSend(v12, "unsignedIntegerValue");
  }
  else
  {
    cdui_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[_UIDocumentPickerViewServiceViewController _waitForDownloadOfURL:completion:].cold.1();

    v13 = 0;
  }
  v15 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Downloading \"%@\"), CFSTR("Downloading a Copy of “%@”"), CFSTR("Localizable"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v8;
  objc_msgSend(v15, "localizedStringWithFormat:", v17, v8);
  v18 = objc_claimAutoreleasedReturnValue();

  v43 = (void *)v18;
  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v18, 0, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = 0;
  v71[1] = v71;
  v71[2] = 0x3032000000;
  v71[3] = __Block_byref_object_copy__3;
  v71[4] = __Block_byref_object_dispose__3;
  v72 = 0;
  v65 = 0;
  v66 = &v65;
  v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__3;
  v69 = __Block_byref_object_dispose__3;
  v70 = 0;
  v20 = (void *)objc_opt_new();
  v21 = MEMORY[0x24BDAC760];
  v64[0] = MEMORY[0x24BDAC760];
  v64[1] = 3221225472;
  v64[2] = __79___UIDocumentPickerViewServiceViewController__waitForDownloadOfURL_completion___block_invoke;
  v64[3] = &unk_24E43B5D0;
  v64[4] = v71;
  v64[5] = &v65;
  v22 = (void *)MEMORY[0x2207C9E60](v64);
  dispatch_get_global_queue(0, 0);
  v23 = objc_claimAutoreleasedReturnValue();
  block[0] = v21;
  block[1] = 3221225472;
  block[2] = __79___UIDocumentPickerViewServiceViewController__waitForDownloadOfURL_completion___block_invoke_2;
  block[3] = &unk_24E43B670;
  v24 = v5;
  v60 = v24;
  v25 = v22;
  v62 = v25;
  v26 = v19;
  v61 = v26;
  v27 = v6;
  v63 = v27;
  dispatch_async(v23, block);

  objc_msgSend(MEMORY[0x24BDD1490], "stringFromByteCount:countStyle:", v13, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)MEMORY[0x24BDD1768];
  v52[0] = v21;
  v52[1] = 3221225472;
  v52[2] = __79___UIDocumentPickerViewServiceViewController__waitForDownloadOfURL_completion___block_invoke_6;
  v52[3] = &unk_24E43B6C0;
  v57 = v71;
  v58 = v13;
  v30 = v28;
  v53 = v30;
  v31 = v26;
  v54 = v31;
  v32 = v20;
  v55 = v32;
  v33 = v25;
  v56 = v33;
  objc_msgSend(v29, "_addSubscriberForFileURL:withPublishingHandler:", v24, v52);
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = (void *)v66[5];
  v66[5] = v34;

  objc_msgSend(v32, "addObject:", v66[5]);
  v36 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("Cancel"), CFSTR("Cancel"), CFSTR("Localizable"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v21;
  v48[1] = 3221225472;
  v48[2] = __79___UIDocumentPickerViewServiceViewController__waitForDownloadOfURL_completion___block_invoke_10;
  v48[3] = &unk_24E43B6E8;
  v39 = v33;
  v50 = v39;
  v40 = v32;
  v49 = v40;
  v41 = v27;
  v51 = v41;
  objc_msgSend(v36, "actionWithTitle:style:handler:", v38, 1, v48);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addAction:", v42);

  -[_UIDocumentPickerViewServiceViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v31, 1, &__block_literal_global_113);
  _Block_object_dispose(&v65, 8);

  _Block_object_dispose(v71, 8);
}

- (void)_documentPickerDidDismiss
{
  void *v2;

  -[_UIViewServiceViewController containedNavController](self, "containedNavController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setViewControllers:", MEMORY[0x24BDBD1A8]);

  +[_UIDocumentPickerContainerItem clearLRUThumbnailCache](_UIDocumentPickerContainerItem, "clearLRUThumbnailCache");
}

- (void)_setTintColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIDocumentPickerViewServiceViewController view](self, "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v4);

}

- (void)_updateDefaultPicker
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[_UIDocumentPickerViewServiceViewController pickerMode](self, "pickerMode");
  -[_UIDocumentPickerViewServiceViewController pickableTypes](self, "pickableTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIDocumentPickerDescriptor defaultPickerIdentifierForMode:documentTypes:](_UIDocumentPickerDescriptor, "defaultPickerIdentifierForMode:documentTypes:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerViewServiceViewController setCurrentPickerIdentifier:](self, "setCurrentPickerIdentifier:", v5);

  -[_UIDocumentPickerViewServiceViewController currentPickerIdentifier](self, "currentPickerIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    -[_UIDocumentPickerViewServiceViewController setCurrentPickerIdentifier:](self, "setCurrentPickerIdentifier:", CFSTR("_UIDocumentPickerUnavailableIdentifier"));
}

- (void)_setUploadURLWrapper:(id)a3
{
  id v4;

  objc_msgSend(a3, "url");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerViewServiceViewController _setUploadURL:](self, "_setUploadURL:", v4);

}

- (void)_setIsContentManaged:(BOOL)a3
{
  +[_UIDocumentPickerDescriptor setIsContentManaged:](_UIDocumentPickerDescriptor, "setIsContentManaged:", a3);
}

- (void)_prepareForDisplayWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  id v7;

  v4 = (void (**)(_QWORD))a3;
  -[_UIDocumentPickerViewServiceViewController _showTopLevelViewController](self, "_showTopLevelViewController");
  -[_UIViewServiceViewController containedNavController](self, "containedNavController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "preferredContentSize");
  -[_UIDocumentPickerViewServiceViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  objc_msgSend(v7, "preferredContentSize");
  v4[2](v4);

  if (self->_currentPickerIdentifier)
    -[_UIDocumentPickerViewServiceViewController _warnSharingPreMove](self, "_warnSharingPreMove");

}

- (void)_cloudEnabledStatusDidChange:(id)a3
{
  id v4;

  -[_UIDocumentPickerViewServiceViewController _updateDefaultPicker](self, "_updateDefaultPicker", a3);
  -[_UIDocumentPickerViewServiceViewController currentPickerIdentifier](self, "currentPickerIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerViewServiceViewController _showPicker:](self, "_showPicker:", v4);

}

- (void)_willAppearInRemoteViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerViewServiceViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[_UIDocumentPickerViewServiceViewController _hostApplicationBundleIdentifier](self, "_hostApplicationBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIDocumentPickerDescriptor setHostBundleID:](_UIDocumentPickerDescriptor, "setHostBundleID:", v5);

  -[_UIDocumentPickerViewServiceViewController _hostAuditToken](self, "_hostAuditToken");
  +[_UIDocumentPickerDescriptor setHostAuditToken:](_UIDocumentPickerDescriptor, "setHostAuditToken:", &v7);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__cloudEnabledStatusDidChange_, CFSTR("_UIDocumentPickerDescriptorCloudEnabledStatusDidChange"), 0);

}

- (void)_showTopLevelViewController
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _UIDocumentPickerOverviewViewController *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  _UIDocumentPickerOverviewViewController *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  -[_UIDocumentPickerViewServiceViewController currentPickerIdentifier](self, "currentPickerIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIViewServiceViewController containedNavController](self, "containedNavController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "setNavigationBarHidden:", 0);

    v6 = objc_alloc_init(MEMORY[0x24BDF6F98]);
    -[_UIViewServiceViewController containedNavController](self, "containedNavController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setViewControllers:animated:", v8, 0);

    objc_msgSend(v6, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerViewServiceViewController setupNavigationItemForPicker:isRoot:](self, "setupNavigationItemForPicker:isRoot:", v9, 1);

    -[_UIDocumentPickerViewServiceViewController currentPickerIdentifier](self, "currentPickerIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerViewServiceViewController _showPicker:](self, "_showPicker:", v10);

  }
  else
  {
    objc_msgSend(v4, "setNavigationBarHidden:", 1);

    v11 = [_UIDocumentPickerOverviewViewController alloc];
    -[_UIDocumentPickerViewServiceViewController pickableTypes](self, "pickableTypes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[_UIDocumentPickerViewServiceViewController pickerMode](self, "pickerMode");
    -[_UIDocumentPickerViewServiceViewController auxiliaryOptions](self, "auxiliaryOptions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[_UIDocumentPickerOverviewViewController initWithFileTypes:mode:auxiliaryOptions:includeManagementItem:](v11, "initWithFileTypes:mode:auxiliaryOptions:includeManagementItem:", v12, v13, v14, 1);

    -[_UIDocumentPickerOverviewViewController setDelegate:](v16, "setDelegate:", self);
    -[_UIDocumentPickerViewServiceViewController setDisplayedAsMenu:](self, "setDisplayedAsMenu:", 1);
    -[_UIViewServiceViewController containedNavController](self, "containedNavController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pushViewController:animated:", v16, 0);

  }
}

- (void)setupNavigationItemForPicker:(id)a3 isRoot:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v4 = a4;
  v18 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__doneButton_);
  objc_msgSend(v18, "setRightBarButtonItem:", v6);
  v7 = -[_UIDocumentPickerViewServiceViewController pickerMode](self, "pickerMode");
  -[_UIDocumentPickerViewServiceViewController pickableTypes](self, "pickableTypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIDocumentPickerDescriptor allPickersForMode:documentTypes:](_UIDocumentPickerDescriptor, "allPickersForMode:documentTypes:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[_UIDocumentPickerDescriptor filteredPickersForPickers:filter:](_UIDocumentPickerDescriptor, "filteredPickersForPickers:filter:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  +[_UIDocumentPickerDescriptor filteredPickersForPickers:filter:](_UIDocumentPickerDescriptor, "filteredPickersForPickers:filter:", v9, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v4 && (v11 > 1 || v13 >= 1))
  {
    v14 = objc_alloc(MEMORY[0x24BDF6860]);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Locations"), CFSTR("Locations"), CFSTR("Localizable"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v14, "initWithTitle:style:target:action:", v16, 0, self, sel__showLocationPopup_);

    objc_msgSend(v18, "setLeftBarButtonItem:", v17);
  }

}

- (void)_showPicker:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  _UIDocumentTargetSelectionController *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _UIDocumentListController *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _UIDocumentPickerRootContainerModel *v28;
  void *v29;
  _UIDocumentPickerRootContainerModel *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  _UIDocumentListController *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  _UIDocumentListController *v44;
  _UIDocumentListController *v45;
  uint64_t v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_UIDocumentPickerViewServiceViewController currentPicker](self, "currentPicker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerViewServiceViewController setCurrentPicker:](self, "setCurrentPicker:", 0);
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDF8110]))
  {
    -[_UIViewServiceViewController containedNavController](self, "containedNavController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNavigationBarHidden:", 0);

    if (-[_UIDocumentPickerViewServiceViewController pickerMode](self, "pickerMode") == 2
      || -[_UIDocumentPickerViewServiceViewController pickerMode](self, "pickerMode") == 3)
    {
      v7 = -[_UIDocumentPickerViewServiceViewController pickerMode](self, "pickerMode") == 2;
      v8 = [_UIDocumentTargetSelectionController alloc];
      -[_UIDocumentPickerViewServiceViewController uploadURL](self, "uploadURL");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if (v7)
      {
        v47[0] = v9;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[_UIDocumentTargetSelectionController initForCopyWithItems:](v8, "initForCopyWithItems:", v11);
      }
      else
      {
        v46 = v9;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v46, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[_UIDocumentTargetSelectionController initForCrossContainerMoveWithItemsToMove:](v8, "initForCrossContainerMoveWithItemsToMove:", v11);
      }
      v14 = (_UIDocumentListController *)v12;

      -[_UIDocumentListController setDelegate:](v14, "setDelegate:", self);
    }
    else
    {
      v28 = [_UIDocumentPickerRootContainerModel alloc];
      -[_UIDocumentPickerViewServiceViewController pickableTypes](self, "pickableTypes");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[_UIDocumentPickerRootContainerModel initWithPickableTypes:mode:](v28, "initWithPickableTypes:mode:", v29, -[_UIDocumentPickerViewServiceViewController pickerMode](self, "pickerMode"));

      v14 = -[_UIDocumentListController initWithModel:]([_UIDocumentListController alloc], "initWithModel:", v30);
      -[_UIDocumentListController setDelegate:](v14, "setDelegate:", self);
      -[_UIDocumentListController setAvailableActions:](v14, "setAvailableActions:", 0);

    }
    -[_UIViewServiceViewController containedNavController](self, "containedNavController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v45, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setViewControllers:animated:", v32, 0);

    -[_UIDocumentListController navigationItem](v14, "navigationItem");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerViewServiceViewController setupNavigationItemForPicker:isRoot:](self, "setupNavigationItemForPicker:isRoot:", v33, 1);

    -[_UIDocumentPickerViewServiceViewController setCurrentPickerIdentifier:](self, "setCurrentPickerIdentifier:", v4);
    -[_UIDocumentPickerViewServiceViewController setCurrentPicker:](self, "setCurrentPicker:", v14);
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("_UIDocumentPickerUnavailableIdentifier")))
  {
    -[_UIViewServiceViewController containedNavController](self, "containedNavController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setNavigationBarHidden:", 0);

    v14 = objc_alloc_init(_UIDocumentPickerUnavailableViewController);
    -[_UIDocumentListController navigationItem](v14, "navigationItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerViewServiceViewController setupNavigationItemForPicker:isRoot:](self, "setupNavigationItemForPicker:isRoot:", v15, 1);

    -[_UIViewServiceViewController containedNavController](self, "containedNavController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v44, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setViewControllers:animated:", v17, 0);

    -[_UIDocumentPickerViewServiceViewController setCurrentPickerIdentifier:](self, "setCurrentPickerIdentifier:", v4);
  }
  else
  {
    +[_UIDocumentPickerDescriptor descriptorWithIdentifier:](_UIDocumentPickerDescriptor, "descriptorWithIdentifier:", v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    v38 = &v37;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__3;
    v41 = __Block_byref_object_dispose__3;
    v42 = 0;
    v19 = (void *)MEMORY[0x24BDF7140];
    objc_msgSend(v18, "extension");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __58___UIDocumentPickerViewServiceViewController__showPicker___block_invoke;
    v34[3] = &unk_24E43B730;
    v34[4] = self;
    v14 = v18;
    v35 = v14;
    v36 = &v37;
    objc_msgSend(v19, "instantiateWithExtension:completion:", v20, v34);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v38[5];
    v38[5] = v21;

    objc_msgSend((id)v38[5], "delayDisplayOfRemoteController");
    objc_msgSend((id)v38[5], "navigationItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerViewServiceViewController setupNavigationItemForPicker:isRoot:](self, "setupNavigationItemForPicker:isRoot:", v23, 1);

    -[_UIDocumentListController localizedName](v14, "localizedName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v38[5], "setTitle:", v24);

    -[_UIViewServiceViewController containedNavController](self, "containedNavController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setNavigationBarHidden:", 0);

    -[_UIViewServiceViewController containedNavController](self, "containedNavController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v38[5];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v43, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setViewControllers:animated:", v27, 0);

    _Block_object_dispose(&v37, 8);
  }

  -[_UIDocumentPickerViewServiceViewController _invalidatePicker:](self, "_invalidatePicker:", v5);
}

- (void)_didInstantiateThirdPartyPickerWithDescription:(id)a3 placeholder:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[5];

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "remoteViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nonUIIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPublicController:", self);
  objc_msgSend(v8, "setIdentifier:", v9);
  objc_msgSend(v8, "setEdgesForExtendedLayout:", 0);
  -[_UIDocumentPickerViewServiceViewController setCurrentPicker:](self, "setCurrentPicker:", v8);
  v10 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __105___UIDocumentPickerViewServiceViewController__didInstantiateThirdPartyPickerWithDescription_placeholder___block_invoke;
  v26[3] = &unk_24E43B758;
  v26[4] = self;
  objc_msgSend(v8, "serviceViewControllerProxyWithErrorHandler:", v26);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_UIDocumentPickerViewServiceViewController pickerMode](self, "pickerMode") == 2
    || -[_UIDocumentPickerViewServiceViewController pickerMode](self, "pickerMode") == 3)
  {
    v12 = (void *)MEMORY[0x24BDF70A8];
    -[_UIDocumentPickerViewServiceViewController uploadURL](self, "uploadURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "wrapperWithURL:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_setUploadURLWrapper:", v14);

  }
  -[_UIDocumentPickerViewServiceViewController pickableTypes](self, "pickableTypes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setPickableTypes:", v15);

  objc_msgSend(v11, "_setPickerMode:", -[_UIDocumentPickerViewServiceViewController pickerMode](self, "pickerMode"));
  objc_msgSend(MEMORY[0x24BDC8270], "sharedConnection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v10;
  v21[1] = 3221225472;
  v21[2] = __105___UIDocumentPickerViewServiceViewController__didInstantiateThirdPartyPickerWithDescription_placeholder___block_invoke_2;
  v21[3] = &unk_24E43B7A8;
  v21[4] = self;
  v22 = v6;
  v23 = v9;
  v24 = v11;
  v25 = v7;
  v17 = v7;
  v18 = v11;
  v19 = v9;
  v20 = v6;
  objc_msgSend(v16, "providersCompletionHandler:", v21);

}

- (void)_presentError:(id)a3 forThirdPartyPickerWithDescription:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  _UIDocumentPickerViewServiceViewController *v14;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __95___UIDocumentPickerViewServiceViewController__presentError_forThirdPartyPickerWithDescription___block_invoke;
  block[3] = &unk_24E43AD30;
  v12 = v7;
  v8 = v6;
  v13 = v8;
  v14 = self;
  v9 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  cdui_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    -[_UIDocumentPickerViewServiceViewController _presentError:forThirdPartyPickerWithDescription:].cold.1();

}

- (void)_displayLocationsMenuFromRect:(CGRect)a3
{
  -[_UIDocumentPickerViewServiceViewController _showLocationPopupFromBarButtonItem:rect:](self, "_showLocationPopupFromBarButtonItem:rect:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_showLocationPopup:(id)a3
{
  -[_UIDocumentPickerViewServiceViewController _showLocationPopupFromBarButtonItem:rect:](self, "_showLocationPopupFromBarButtonItem:rect:", a3, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

- (void)_showLocationPopupFromBarButtonItem:(id)a3 rect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  _UIDocumentPickerOverviewViewController *v9;
  void *v10;
  _UIDocumentPickerOverviewViewController *v11;
  void *v12;
  uint64_t v13;
  _UIPreferredContentSizeRelayingNavigationController *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v19 = a3;
  v9 = [_UIDocumentPickerOverviewViewController alloc];
  -[_UIDocumentPickerViewServiceViewController pickableTypes](self, "pickableTypes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[_UIDocumentPickerOverviewViewController initWithFileTypes:mode:auxiliaryOptions:includeManagementItem:](v9, "initWithFileTypes:mode:auxiliaryOptions:includeManagementItem:", v10, -[_UIDocumentPickerViewServiceViewController pickerMode](self, "pickerMode"), 0, 1);

  -[_UIDocumentPickerViewServiceViewController traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "userInterfaceIdiom");

  if (v13 == 1)
  {
    objc_msgSend(MEMORY[0x24BDF6CA8], "_setAlwaysAllowPopoverPresentations:", 1);
    v14 = v11;
    -[_UIPreferredContentSizeRelayingNavigationController setModalPresentationStyle:](v14, "setModalPresentationStyle:", 7);
  }
  else
  {
    v14 = -[_UIPreferredContentSizeRelayingNavigationController initWithRootViewController:]([_UIPreferredContentSizeRelayingNavigationController alloc], "initWithRootViewController:", v11);
    -[_UIPreferredContentSizeRelayingNavigationController setModalPresentationStyle:](v14, "setModalPresentationStyle:", 100);
    -[_UIPreferredContentSizeRelayingNavigationController setNavigationBarHidden:](v14, "setNavigationBarHidden:", 1);
  }
  -[_UIPreferredContentSizeRelayingNavigationController setModalTransitionStyle:](v14, "setModalTransitionStyle:", 12);
  -[_UIPreferredContentSizeRelayingNavigationController popoverPresentationController](v14, "popoverPresentationController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Cancel"), CFSTR("Cancel"), CFSTR("Localizable"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDismissActionTitle:", v17);

  }
  objc_msgSend(v15, "setBarButtonItem:", v19);
  objc_msgSend(v15, "setSourceRect:", x, y, width, height);
  -[_UIDocumentPickerViewServiceViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSourceView:", v18);

  objc_msgSend(v15, "setPermittedArrowDirections:", 15);
  -[_UIDocumentPickerOverviewViewController setDelegate:](v11, "setDelegate:", self);
  -[_UIDocumentPickerViewServiceViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);

}

- (void)overviewController:(id)a3 selectedDocumentPickerWithIdentifier:(id)a4
{
  id v6;
  id v7;
  int v8;
  _BOOL4 v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _UIDocumentPickerManagementViewController *v13;
  void *v14;
  _UIDocumentPickerManagementViewController *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("__UIDocumentPickerManageIdentifier"));
  v9 = -[_UIDocumentPickerViewServiceViewController displayedAsMenu](self, "displayedAsMenu");
  if (v8)
  {
    if (v9
      || (-[_UIDocumentPickerViewServiceViewController traitCollection](self, "traitCollection"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "userInterfaceIdiom"),
          v10,
          v11 != 1))
    {
      v13 = [_UIDocumentPickerManagementViewController alloc];
      -[_UIDocumentPickerViewServiceViewController pickableTypes](self, "pickableTypes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[_UIDocumentPickerManagementViewController initWithFileTypes:mode:](v13, "initWithFileTypes:mode:", v14, -[_UIDocumentPickerViewServiceViewController pickerMode](self, "pickerMode"));

      -[_UIDocumentPickerManagementViewController navigationItem](v15, "navigationItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setHidesBackButton:", 1);

      objc_msgSend(v6, "navigationController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setNavigationBarHidden:animated:", 0, 1);

      objc_msgSend(v6, "navigationController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "pushViewController:animated:", v15, 1);

    }
    else
    {
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __102___UIDocumentPickerViewServiceViewController_overviewController_selectedDocumentPickerWithIdentifier___block_invoke;
      v21[3] = &unk_24E43A808;
      v21[4] = self;
      -[_UIDocumentPickerViewServiceViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v21);
    }
  }
  else if (v9)
  {
    -[_UIDocumentPickerViewServiceViewController setCurrentPickerIdentifier:](self, "setCurrentPickerIdentifier:", v7);
    -[_UIDocumentPickerViewServiceViewController hostingViewController](self, "hostingViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_didSelectPicker");

    -[_UIDocumentPickerViewServiceViewController setDisplayedAsMenu:](self, "setDisplayedAsMenu:", 0);
  }
  else
  {
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __102___UIDocumentPickerViewServiceViewController_overviewController_selectedDocumentPickerWithIdentifier___block_invoke_2;
    v19[3] = &unk_24E43A858;
    v19[4] = self;
    v20 = v7;
    -[_UIDocumentPickerViewServiceViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v19);

  }
}

- (void)overviewController:(id)a3 selectedAuxiliaryOptionWithIdentifier:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("__UIDocumentPickerManageIdentifier")) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", CFSTR("_UIDocumentPickerUnavailableIdentifier")))
  {
    -[_UIDocumentPickerViewServiceViewController overviewController:selectedDocumentPickerWithIdentifier:](self, "overviewController:selectedDocumentPickerWithIdentifier:", v8, v6);
  }
  else
  {
    -[_UIDocumentPickerViewServiceViewController hostingViewController](self, "hostingViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_dismissWithOption:", v6);

  }
}

- (CGSize)_updatedContentSizeForPreferredContentSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  objc_super v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[_UIDocumentPickerViewServiceViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if (v7 == 1)
  {
    -[_UIDocumentPickerViewServiceViewController preferredContentSize](self, "preferredContentSize");
    if (v9 <= height)
      v9 = height;
    if (v8 <= width)
      v8 = width;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)_UIDocumentPickerViewServiceViewController;
    -[_UIViewServiceViewController _updatedContentSizeForPreferredContentSize:](&v10, sel__updatedContentSizeForPreferredContentSize_, width, height);
  }
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)_dismissViewController
{
  -[_UIDocumentPickerViewServiceViewController dismissWithURL:forBundleIdentifier:](self, "dismissWithURL:forBundleIdentifier:", 0, 0);
}

- (void)_doneButton:(id)a3
{
  void *v4;

  +[_UIDocumentPickerContainerItem clearLRUThumbnailCache](_UIDocumentPickerContainerItem, "clearLRUThumbnailCache", a3);
  -[_UIDocumentPickerViewServiceViewController currentPicker](self, "currentPicker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIDocumentPickerViewServiceViewController _invalidatePicker:](self, "_invalidatePicker:", v4);

  -[_UIDocumentPickerViewServiceViewController setCurrentPicker:](self, "setCurrentPicker:", 0);
  -[_UIDocumentPickerViewServiceViewController dismissWithURL:forBundleIdentifier:](self, "dismissWithURL:forBundleIdentifier:", 0, 0);
}

- (void)_invalidatePicker:(id)a3
{
  id v3;

  v3 = a3;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_255507A98))
    objc_msgSend(v3, "invalidate");

}

- (void)_didSelectURL:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    -[_UIDocumentPickerViewServiceViewController currentPicker](self, "currentPicker");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDocumentPickerViewServiceViewController dismissWithURL:forBundleIdentifier:](self, "dismissWithURL:forBundleIdentifier:", v6, v5);

  }
  else
  {
    -[_UIDocumentPickerViewServiceViewController dismissWithURL:forBundleIdentifier:](self, "dismissWithURL:forBundleIdentifier:", 0, 0);
  }

}

- (void)setNavigationItemSpinner:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a3;
  -[_UIViewServiceViewController containedNavController](self, "containedNavController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationItem");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v14, "leftBarButtonItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (!self->_showingSpinner)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 100);
      objc_msgSend(v10, "startAnimating");
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithCustomView:", v10);
      objc_msgSend(v9, "addObject:", v11);
      objc_msgSend(v9, "addObject:", v12);
      self->_showingSpinner = 1;

    }
  }
  else if (self->_showingSpinner)
  {
    objc_msgSend(v9, "removeLastObject");
    objc_msgSend(v9, "removeLastObject");
    self->_showingSpinner = 0;
  }
  objc_msgSend(v14, "setLeftBarButtonItems:", v9);
  -[_UIDocumentPickerViewServiceViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setUserInteractionEnabled:", !v3);

}

+ (id)_urlByResolvingExternalDocumentReferenceForURL:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v10;
  id v11;

  v4 = a3;
  if (!objc_msgSend(v4, "br_isExternalDocumentReference"))
    goto LABEL_4;
  v11 = 0;
  objc_msgSend(v4, "br_URLByResolvingExternalDocumentReferenceWithError:", &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  if (v5)
  {
    objc_msgSend(a1, "_logicalURLForPhysicalURL:", v5);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v7;
LABEL_4:
    v4 = v4;
    v8 = v4;
    goto LABEL_5;
  }
  cdui_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    +[_UIDocumentPickerViewServiceViewController _urlByResolvingExternalDocumentReferenceForURL:].cold.1();

  v8 = 0;
LABEL_5:

  return v8;
}

+ (id)_logicalURLForPhysicalURL:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;

  v3 = a3;
  if (v3 && _CFURLIsItemPromiseAtURL())
  {
    v4 = (id)_CFURLCopyLogicalURLOfPromiseAtURL();
    if (!v4)
    {
      cdui_default_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        +[_UIDocumentPickerViewServiceViewController _logicalURLForPhysicalURL:].cold.1();

    }
  }
  else
  {
    v4 = v3;
  }

  return v4;
}

- (void)documentListController:(id)a3 didSelectItemAtURL:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  objc_msgSend((id)objc_opt_class(), "_urlByResolvingExternalDocumentReferenceForURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __88___UIDocumentPickerViewServiceViewController_documentListController_didSelectItemAtURL___block_invoke;
  v8[3] = &unk_24E43A858;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  _UIDocumentListControllerPresentOSAlert(v7, self, v8, 0);

}

- (void)documentListController:(id)a3 didSelectContainerWithViewController:(id)a4
{
  id v6;
  id v7;
  char isKindOfClass;
  void *v9;
  _QWORD v10[4];
  id v11;
  _UIDocumentPickerViewServiceViewController *v12;

  v6 = a4;
  v7 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __106___UIDocumentPickerViewServiceViewController_documentListController_didSelectContainerWithViewController___block_invoke;
    v10[3] = &unk_24E43A858;
    v11 = v6;
    v12 = self;
    -[_UIDocumentPickerViewServiceViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v10);

  }
  else
  {
    -[_UIViewServiceViewController containedNavController](self, "containedNavController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pushViewController:animated:", v6, 1);

  }
}

- (void)documentTargetSelectionController:(id)a3 didSelectItemAtURL:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __99___UIDocumentPickerViewServiceViewController_documentTargetSelectionController_didSelectItemAtURL___block_invoke;
  v7[3] = &unk_24E43A858;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[_UIDocumentPickerViewServiceViewController _warnSharingForTarget:completion:](self, "_warnSharingForTarget:completion:", v6, v7);

}

- (void)pickLocationForUpload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[_UIDocumentPickerViewServiceViewController uploadURL](self, "uploadURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[_UIDocumentPickerViewServiceViewController _tryExportingFile:toLocation:](self, "_tryExportingFile:toLocation:", v5, v7);
}

- (id)_mangledFilenameForURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v25;
  void *v27;
  void *v28;

  v3 = a3;
  objc_msgSend(v3, "URLByDeletingLastPathComponent");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v3;
  objc_msgSend(v3, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByDeletingPathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "rangeOfCharacterFromSet:options:", v8, 4);
  v11 = v10;

  if (v9 + v11 != objc_msgSend(v7, "length"))
  {
    objc_msgSend(v7, "stringByAppendingString:", CFSTR(" 2"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v12, "rangeOfCharacterFromSet:options:", v13, 4);
    v11 = v14;

    v7 = v12;
  }
  objc_msgSend(v7, "substringWithRange:", v9, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "integerValue");

  objc_msgSend(v7, "substringToIndex:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = v16 + 999;
  while (1)
  {
    objc_msgSend(v17, "stringByAppendingFormat:", CFSTR("%li"), v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringByAppendingPathExtension:", v5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "URLByAppendingPathComponent:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "path");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v4, "fileExistsAtPath:", v22);

    if (!v23)
      break;

    if (v16++ >= v18)
    {
      v25 = v27;
      objc_msgSend(v27, "lastPathComponent");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
  v25 = v27;
LABEL_8:

  return v20;
}

- (void)_showExistsAlertForFile:(id)a3 withSourceURL:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  _QWORD v35[5];
  _QWORD v36[4];
  id v37;
  id v38;
  _UIDocumentPickerViewServiceViewController *v39;
  id v40;
  id v41;
  id location;
  _QWORD v43[5];
  id v44;

  v6 = a3;
  v34 = a4;
  objc_msgSend(v6, "lastPathComponent");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("This location already contains a file named %@"), CFSTR("This location already contains a file named %@"), CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)v7;
  objc_msgSend(v9, "stringWithFormat:", v11, v7);
  v12 = objc_claimAutoreleasedReturnValue();

  v13 = -[_UIDocumentPickerViewServiceViewController pickerMode](self, "pickerMode");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13 == 2)
    v16 = CFSTR("Would you like to rename the file you are about to export?");
  else
    v16 = CFSTR("Would you like to rename the file you are about to move?");
  objc_msgSend(v14, "localizedStringForKey:value:table:", v16, v16, CFSTR("Localizable"));
  v17 = objc_claimAutoreleasedReturnValue();

  v31 = (void *)v17;
  v32 = (void *)v12;
  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v12, v17, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = MEMORY[0x24BDAC760];
  v43[1] = 3221225472;
  v43[2] = __84___UIDocumentPickerViewServiceViewController__showExistsAlertForFile_withSourceURL___block_invoke;
  v43[3] = &unk_24E43B840;
  v43[4] = self;
  v19 = v6;
  v44 = v19;
  objc_msgSend(v18, "addTextFieldWithConfigurationHandler:", v43);
  objc_initWeak(&location, v18);
  v20 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Rename"), CFSTR("Rename"), CFSTR("Localizable"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __84___UIDocumentPickerViewServiceViewController__showExistsAlertForFile_withSourceURL___block_invoke_2;
  v36[3] = &unk_24E43B868;
  objc_copyWeak(&v41, &location);
  v23 = v8;
  v37 = v23;
  v24 = v19;
  v38 = v24;
  v39 = self;
  v25 = v34;
  v40 = v25;
  objc_msgSend(v20, "actionWithTitle:style:handler:", v22, 0, v36);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addAction:", v26);

  v27 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("Cancel"), CFSTR("Cancel"), CFSTR("Localizable"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __84___UIDocumentPickerViewServiceViewController__showExistsAlertForFile_withSourceURL___block_invoke_3;
  v35[3] = &unk_24E43B378;
  v35[4] = self;
  objc_msgSend(v27, "actionWithTitle:style:handler:", v29, 1, v35);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addAction:", v30);

  -[_UIDocumentPickerViewServiceViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v18, 1, &__block_literal_global_188);
  objc_destroyWeak(&v41);
  objc_destroyWeak(&location);

}

- (void)_tryExportingFile:(id)a3 toLocation:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  unint64_t v12;
  void *v13;
  _QWORD *v14;
  id *v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  _QWORD v29[6];
  uint64_t v30;
  _QWORD v31[6];
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v6 = a3;
  v7 = a4;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__3;
  v37 = __Block_byref_object_dispose__3;
  v38 = 0;
  v8 = objc_alloc_init(MEMORY[0x24BDD1570]);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "fileExistsAtPath:", v10);

  if (v11)
  {
    -[_UIDocumentPickerViewServiceViewController _showExistsAlertForFile:withSourceURL:](self, "_showExistsAlertForFile:withSourceURL:", v7, v6);
    v12 = 0;
  }
  else
  {
    -[_UIDocumentPickerViewServiceViewController hostingViewController](self, "hostingViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_stitchFileCreationAtURL:", v7);

    if (-[_UIDocumentPickerViewServiceViewController pickerMode](self, "pickerMode") == 3)
    {
      v32 = 0;
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __75___UIDocumentPickerViewServiceViewController__tryExportingFile_toLocation___block_invoke;
      v31[3] = &unk_24E43B8D0;
      v14 = v31;
      v31[4] = v9;
      v31[5] = &v33;
      v15 = (id *)&v32;
      objc_msgSend(v8, "coordinateWritingItemAtURL:options:writingItemAtURL:options:error:byAccessor:", v6, 2, v7, 0, &v32, v31);
    }
    else
    {
      v30 = 0;
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __75___UIDocumentPickerViewServiceViewController__tryExportingFile_toLocation___block_invoke_2;
      v29[3] = &unk_24E43B8D0;
      v14 = v29;
      v29[4] = v9;
      v29[5] = &v33;
      v15 = (id *)&v30;
      objc_msgSend(v8, "coordinateReadingItemAtURL:options:writingItemAtURL:options:error:byAccessor:", v6, 0, v7, 0, &v30, v29);
    }
    v12 = (unint64_t)*v15;

    v16 = v34[5];
    if (v12 | v16)
    {
      objc_msgSend((id)v16, "domain");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "isEqualToString:", *MEMORY[0x24BDD0B88]))
      {
        v18 = objc_msgSend((id)v34[5], "code");

        if (v18 == 516)
        {
          -[_UIDocumentPickerViewServiceViewController _showExistsAlertForFile:withSourceURL:](self, "_showExistsAlertForFile:withSourceURL:", v7, v6);
          goto LABEL_13;
        }
      }
      else
      {

      }
      v19 = (void *)MEMORY[0x24BDF67F0];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Copying file failed"), CFSTR("Copying file failed"), CFSTR("Localizable"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v12, "localizedDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "alertControllerWithTitle:message:preferredStyle:", v21, v22, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = (void *)MEMORY[0x24BDF67E8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("Dismiss"), CFSTR("Dismiss"), CFSTR("Localizable"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __75___UIDocumentPickerViewServiceViewController__tryExportingFile_toLocation___block_invoke_3;
      v28[3] = &unk_24E43B378;
      v28[4] = self;
      objc_msgSend(v24, "actionWithTitle:style:handler:", v26, 0, v28);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addAction:", v27);

      -[_UIDocumentPickerViewServiceViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v23, 1, &__block_literal_global_193);
      goto LABEL_13;
    }
    -[_UIDocumentPickerViewServiceViewController dismissWithURL:forBundleIdentifier:](self, "dismissWithURL:forBundleIdentifier:", v7, 0);
    v12 = 0;
  }
LABEL_13:

  _Block_object_dispose(&v33, 8);
}

- (BOOL)_shouldWarnForSharing
{
  void *v3;
  int v4;
  id v5;
  void *v6;
  id v8;

  if (-[_UIDocumentPickerViewServiceViewController pickerMode](self, "pickerMode") == 3)
  {
    -[_UIDocumentPickerViewServiceViewController uploadURL](self, "uploadURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    v4 = objc_msgSend(v3, "getPromisedItemResourceValue:forKey:error:", &v8, *MEMORY[0x24BDBCD40], 0);
    v5 = v8;
    v6 = v5;
    if (v4)
      LOBYTE(v4) = objc_msgSend(v5, "BOOLValue");

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)_warnSharingPreMove
{
  NSObject *v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[16];

  if (-[_UIDocumentPickerViewServiceViewController _shouldWarnForSharing](self, "_shouldWarnForSharing"))
  {
    cdui_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F506000, v3, OS_LOG_TYPE_INFO, "[INFO] we're in move mode and the file is shared", buf, 2u);
    }

    -[_UIDocumentPickerViewServiceViewController uploadURL](self, "uploadURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v5 = objc_msgSend(v4, "getPromisedItemResourceValue:forKey:error:", &v17, *MEMORY[0x24BDBCDA0], 0);
    v6 = v17;

    if (!v5)
      goto LABEL_11;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Cancel"), CFSTR("Cancel"), CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDBCDB0]))
    {
      cdui_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21F506000, v9, OS_LOG_TYPE_INFO, "[INFO] presenting can't-move alert for participant", buf, 2u);
      }

      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("You cannot move this document"), CFSTR("You cannot move this document"), CFSTR("Localizable"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("This document has been shared to you. You cannot move it to a different location."), CFSTR("This document has been shared to you. You cannot move it to a different location."), CFSTR("Localizable"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v11, v13, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __65___UIDocumentPickerViewServiceViewController__warnSharingPreMove__block_invoke;
      v16[3] = &unk_24E43B378;
      v16[4] = self;
      objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v8, 1, v16);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addAction:", v15);

      if (!v14)
        goto LABEL_11;
      -[_UIDocumentPickerViewServiceViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v14, 1, 0);
      v8 = v14;
    }

LABEL_11:
  }
}

- (void)_warnSharingForTarget:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  void *v9;
  __int16 v10;
  id v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  _QWORD v32[4];
  void (**v33)(_QWORD);
  id v34;
  id v35;
  uint8_t buf[4];
  NSObject *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (-[_UIDocumentPickerViewServiceViewController _shouldWarnForSharing](self, "_shouldWarnForSharing"))
  {
    cdui_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F506000, v8, OS_LOG_TYPE_INFO, "[INFO] We're in move mode and the file is shared", buf, 2u);
    }

    -[_UIDocumentPickerViewServiceViewController uploadURL](self, "uploadURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    v10 = objc_msgSend(v9, "br_capabilityToMoveToURL:error:", v6, &v35);
    v11 = v35;

    if ((v10 & 0x204) != 0)
    {
      -[_UIDocumentPickerViewServiceViewController uploadURL](self, "uploadURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 0;
      v13 = objc_msgSend(v12, "getPromisedItemResourceValue:forKey:error:", &v34, *MEMORY[0x24BDBCDA0], 0);
      v14 = v34;

      if (v13)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Cancel"), CFSTR("Cancel"), CFSTR("Localizable"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (-[NSObject isEqualToString:](v14, "isEqualToString:", *MEMORY[0x24BDBCDA8]))
        {
          v30 = v16;
          cdui_default_log();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21F506000, v17, OS_LOG_TYPE_INFO, "[INFO] presenting share-will-break alert for owner", buf, 2u);
          }

          objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Moving this document will unshare it"), CFSTR("Moving this document will unshare it"), CFSTR("Localizable"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("This document is shared. Moving it to a different location will stop sharing the document. You can share again from the new location."), CFSTR("This document is shared. Moving it to a different location will stop sharing the document. You can share again from the new location."), CFSTR("Localizable"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Move and stop sharing"), CFSTR("Move and stop sharing"), CFSTR("Localizable"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v29, v28, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)MEMORY[0x24BDF67E8];
          v24 = MEMORY[0x24BDAC760];
          v32[0] = MEMORY[0x24BDAC760];
          v32[1] = 3221225472;
          v32[2] = __79___UIDocumentPickerViewServiceViewController__warnSharingForTarget_completion___block_invoke;
          v32[3] = &unk_24E43A9D8;
          v33 = v7;
          objc_msgSend(v23, "actionWithTitle:style:handler:", v21, 2, v32);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addAction:", v25);

          v31[0] = v24;
          v31[1] = 3221225472;
          v31[2] = __79___UIDocumentPickerViewServiceViewController__warnSharingForTarget_completion___block_invoke_204;
          v31[3] = &unk_24E43B378;
          v31[4] = self;
          objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v30, 1, v31);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addAction:", v26);

          if (v22)
          {
            -[_UIDocumentPickerViewServiceViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v22, 1, 0);

LABEL_21:
            goto LABEL_22;
          }
LABEL_20:
          v7[2](v7);
          goto LABEL_21;
        }
        if ((-[NSObject isEqualToString:](v14, "isEqualToString:", *MEMORY[0x24BDBCDB0]) & 1) == 0)
        {
          cdui_default_log();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v37 = v14;
            _os_log_impl(&dword_21F506000, v27, OS_LOG_TYPE_DEFAULT, "[WARNING] Moving a file, but we're neither participant nor owner? (role is %@)", buf, 0xCu);
          }

        }
      }
    }
    else
    {
      cdui_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21F506000, v14, OS_LOG_TYPE_INFO, "[INFO] ...but we can move the file around between these locations", buf, 2u);
      }
    }

    goto LABEL_20;
  }
  v7[2](v7);
LABEL_22:

}

- (NSArray)pickableTypes
{
  return self->_pickableTypes;
}

- (void)_setPickableTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 992);
}

- (unint64_t)pickerMode
{
  return self->_pickerMode;
}

- (void)_setPickerMode:(unint64_t)a3
{
  self->_pickerMode = a3;
}

- (NSURL)uploadURL
{
  return self->_uploadURL;
}

- (int)sortOrder
{
  return self->_sortOrder;
}

- (void)setSortOrder:(int)a3
{
  self->_sortOrder = a3;
}

- (NSArray)auxiliaryOptions
{
  return self->_auxiliaryOptions;
}

- (void)_setAuxiliaryOptions:(id)a3
{
  objc_storeStrong((id *)&self->_auxiliaryOptions, a3);
}

- (NSString)currentPickerIdentifier
{
  return self->_currentPickerIdentifier;
}

- (void)setCurrentPickerIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_currentPickerIdentifier, a3);
}

- (BOOL)displayedAsMenu
{
  return self->_displayedAsMenu;
}

- (void)setDisplayedAsMenu:(BOOL)a3
{
  self->_displayedAsMenu = a3;
}

- (BOOL)hasBeenDismissed
{
  return self->_hasBeenDismissed;
}

- (void)setHasBeenDismissed:(BOOL)a3
{
  self->_hasBeenDismissed = a3;
}

- (BOOL)showingSpinner
{
  return self->_showingSpinner;
}

- (void)setShowingSpinner:(BOOL)a3
{
  self->_showingSpinner = a3;
}

- (UIViewController)currentPicker
{
  return self->_currentPicker;
}

- (void)setCurrentPicker:(id)a3
{
  objc_storeStrong((id *)&self->_currentPicker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentPicker, 0);
  objc_storeStrong((id *)&self->_currentPickerIdentifier, 0);
  objc_storeStrong((id *)&self->_auxiliaryOptions, 0);
  objc_storeStrong((id *)&self->_uploadURL, 0);
  objc_storeStrong((id *)&self->_pickableTypes, 0);
}

- (void)_setUploadURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_21F506000, v0, v1, "[ERROR] ...but we have sandbox access and the file exists", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_setUploadURL:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_21F506000, v0, v1, "[ERROR] ...we have sandbox access but the file doesn't exist", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_setUploadURL:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_21F506000, v0, v1, "[ERROR] ...nor a sec scope", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_setUploadURL:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2_0(&dword_21F506000, v0, v1, "[ERROR] ...even though the url has a sec scope (%@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_setUploadURL:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_21F506000, v0, v1, "[ERROR] ...and we don't have sandbox access", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_setUploadURL:(uint64_t)a3 .cold.6(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_21F506000, a2, a3, "[ERROR] Couldn't get document type for URL %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)_waitForDownloadOfURL:completion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_1(&dword_21F506000, v0, v1, "[ERROR] Couldn't get file size for %@: %@");
  OUTLINED_FUNCTION_4();
}

- (void)_presentError:forThirdPartyPickerWithDescription:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_2_0(&dword_21F506000, v0, v1, "[ERROR] 3rd party doc picker failed to launch with error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)_urlByResolvingExternalDocumentReferenceForURL:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_1(&dword_21F506000, v0, v1, "[ERROR] error resolving external document reference for url %@: %@");
  OUTLINED_FUNCTION_4();
}

+ (void)_logicalURLForPhysicalURL:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_1(&dword_21F506000, v0, v1, "[ERROR] error copying logical url of promise at url %@: %@");
  OUTLINED_FUNCTION_4();
}

@end
