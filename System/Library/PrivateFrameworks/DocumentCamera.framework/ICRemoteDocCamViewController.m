@implementation ICRemoteDocCamViewController

- (ICRemoteDocCamViewController)initWithImageCache:(id)a3
{
  id v5;
  ICRemoteDocCamViewController *v6;
  ICRemoteDocCamViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICRemoteDocCamViewController;
  v6 = -[ICRemoteDocCamViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_imageCache, a3);

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  id *v5;
  void *v6;
  id v7;
  void *v8;
  _Unwind_Exception *v9;
  objc_super v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v10.receiver = self;
  v10.super_class = (Class)ICRemoteDocCamViewController;
  -[ICRemoteDocCamViewController viewDidLoad](&v10, sel_viewDidLoad);
  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v3 = (void *)getSidecarServiceClass_softClass;
  v19 = getSidecarServiceClass_softClass;
  if (!getSidecarServiceClass_softClass)
  {
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = (uint64_t)__getSidecarServiceClass_block_invoke;
    v14 = &unk_24C5B8008;
    v15 = &v16;
    __getSidecarServiceClass_block_invoke((uint64_t)&v11);
    v3 = (void *)v17[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v16, 8);
  v11 = 0;
  v12 = (uint64_t)&v11;
  v13 = 0x2020000000;
  v5 = (id *)getSidecarServiceNameScanDocumentSymbolLoc_ptr;
  v14 = (void *)getSidecarServiceNameScanDocumentSymbolLoc_ptr;
  if (!getSidecarServiceNameScanDocumentSymbolLoc_ptr)
  {
    v6 = (void *)SidecarCoreLibrary();
    v5 = (id *)dlsym(v6, "SidecarServiceNameScanDocument");
    *(_QWORD *)(v12 + 24) = v5;
    getSidecarServiceNameScanDocumentSymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v11, 8);
  if (!v5)
  {
    v9 = (_Unwind_Exception *)-[ICRemoteDocCamViewController viewDidLoad].cold.1();
    _Block_object_dispose(&v16, 8);
    _Unwind_Resume(v9);
  }
  v7 = *v5;
  objc_msgSend(v4, "serviceWithName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICRemoteDocCamViewController setSidecarService:](self, "setSidecarService:", v8);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  _QWORD v6[5];
  objc_super v7;

  v3 = a3;
  v5 = os_log_create("com.apple.documentcamera", ");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ICRemoteDocCamViewController viewDidAppear:].cold.1();

  v7.receiver = self;
  v7.super_class = (Class)ICRemoteDocCamViewController;
  -[ICRemoteDocCamViewController viewDidAppear:](&v7, sel_viewDidAppear_, v3);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __46__ICRemoteDocCamViewController_viewDidAppear___block_invoke;
  v6[3] = &unk_24C5B7AE0;
  v6[4] = self;
  dc_dispatchMainAfterDelay(v6, 0.3);
}

void __46__ICRemoteDocCamViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "sidecarService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "devices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  v5 = *(void **)(a1 + 32);
  if (!v4)
  {
    objc_msgSend(v5, "makeNoDevicesAlertController");
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v13 = (id)v12;
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:");
    goto LABEL_7;
  }
  objc_msgSend(v5, "sidecarService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "devices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  v9 = *(void **)(a1 + 32);
  if (v8 != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "makeDevicesAlertController");
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 32), "sidecarService");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "devices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "makeSidecarRequestToDevice:", v11);

LABEL_7:
}

- (id)makeNoDevicesAlertController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Can’t Scan Document"), CFSTR("Can’t Scan Document"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("There are no nearby devices signed into the same iCloud account."), CFSTR("There are no nearby devices signed into the same iCloud account."), CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v3, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("ipad.and.iphone"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v6);

  v7 = (void *)MEMORY[0x24BDF67E8];
  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Cancel"), CFSTR("Cancel"), CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __60__ICRemoteDocCamViewController_makeNoDevicesAlertController__block_invoke;
  v11[3] = &unk_24C5B7C68;
  v11[4] = self;
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 1, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v9);

  return v5;
}

void __60__ICRemoteDocCamViewController_makeNoDevicesAlertController__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteDocumentCameraControllerDidCancel:", *(_QWORD *)(a1 + 32));

}

- (id)makeDevicesAlertController
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  id obj;
  _QWORD v23[5];
  _QWORD v24[6];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Scan a Document"), CFSTR("Scan a Document"), CFSTR("Localizable"));
  v3 = objc_claimAutoreleasedReturnValue();
  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Select which device camera to use for scanning a document."), CFSTR("Select which device camera to use for scanning a document."), CFSTR("Localizable"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)v3;
  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("ipad.and.iphone"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v5);

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[ICRemoteDocCamViewController sidecarService](self, "sidecarService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "devices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v7;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v13 = (void *)MEMORY[0x24BDF67E8];
        objc_msgSend(v12, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = MEMORY[0x24BDAC760];
        v24[1] = 3221225472;
        v24[2] = __58__ICRemoteDocCamViewController_makeDevicesAlertController__block_invoke;
        v24[3] = &unk_24C5B7C18;
        v24[4] = self;
        v24[5] = v12;
        objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 0, v24);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addAction:", v15);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v9);
  }

  v16 = (void *)MEMORY[0x24BDF67E8];
  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Cancel"), CFSTR("Cancel"), CFSTR("Localizable"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __58__ICRemoteDocCamViewController_makeDevicesAlertController__block_invoke_2;
  v23[3] = &unk_24C5B7C68;
  v23[4] = self;
  objc_msgSend(v16, "actionWithTitle:style:handler:", v17, 1, v23);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAction:", v18);

  return v4;
}

uint64_t __58__ICRemoteDocCamViewController_makeDevicesAlertController__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "makeSidecarRequestToDevice:", *(_QWORD *)(a1 + 40));
}

uint64_t __58__ICRemoteDocCamViewController_makeDevicesAlertController__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelSidecarRequest");
}

- (id)progressAlertMessageForDevice:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;

  v3 = a3;
  objc_msgSend(v3, "deviceType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF8238], "importedTypeWithIdentifier:", CFSTR("com.apple.iphone"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "conformsToType:", v5);

  if (v6)
  {
    v7 = CFSTR("Using your iPhone’s camera to scan a document.");
  }
  else
  {
    objc_msgSend(v3, "deviceType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF8238], "importedTypeWithIdentifier:", CFSTR("com.apple.ipad"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "conformsToType:", v9);

    if (v10)
    {
      v7 = CFSTR("Using your iPad’s camera to scan a document.");
    }
    else
    {
      objc_msgSend(v3, "deviceType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF8238], "importedTypeWithIdentifier:", CFSTR("com.apple.ipod"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "conformsToType:", v12);

      if (v13)
        v7 = CFSTR("Using your iPod’s camera to scan a document.");
      else
        v7 = CFSTR("Using your device’s camera to scan a document.");
    }
  }
  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", v7, v7, CFSTR("Localizable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)makeProgressAlertControllerForDevice:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = a3;
  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Scanning Document with “%@”…"), CFSTR("Scanning Document with “%@”…"), CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICRemoteDocCamViewController progressAlertMessageForDevice:](self, "progressAlertMessageForDevice:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v8, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("ipad.and.iphone"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setImage:", v11);

  v12 = (void *)MEMORY[0x24BDF67E8];
  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Cancel"), CFSTR("Cancel"), CFSTR("Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __69__ICRemoteDocCamViewController_makeProgressAlertControllerForDevice___block_invoke;
  v16[3] = &unk_24C5B7C68;
  v16[4] = self;
  objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 1, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAction:", v14);

  return v10;
}

void __69__ICRemoteDocCamViewController_makeProgressAlertControllerForDevice___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteDocumentCameraControllerDidCancel:", *(_QWORD *)(a1 + 32));

}

- (id)makeAlertControllerForError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  ICRemoteDocCamViewController *v18;
  id v19;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDF67F0];
  objc_msgSend(v4, "localizedDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v6, 0, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("exclamationmark.triangle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v8);

  v9 = (void *)MEMORY[0x24BDF67E8];
  +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("OK"), CFSTR("OK"), CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __60__ICRemoteDocCamViewController_makeAlertControllerForError___block_invoke;
  v17 = &unk_24C5B7C18;
  v18 = self;
  v19 = v4;
  v11 = v4;
  objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 1, &v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v12, v14, v15, v16, v17, v18);

  return v7;
}

void __60__ICRemoteDocCamViewController_makeAlertControllerForError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteDocumentCameraController:didFailWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)makeSidecarRequestToDevice:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = os_log_create("com.apple.documentcamera", ");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ICRemoteDocCamViewController makeSidecarRequestToDevice:].cold.1();

  -[ICRemoteDocCamViewController makeProgressAlertControllerForDevice:](self, "makeProgressAlertControllerForDevice:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__ICRemoteDocCamViewController_makeSidecarRequestToDevice___block_invoke;
  v8[3] = &unk_24C5B7BF0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[ICRemoteDocCamViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, v8);

}

void __59__ICRemoteDocCamViewController_makeSidecarRequestToDevice___block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;

  v1 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "sidecarService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "makeRequestToDevice:", v1[1]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v1, "setSidecarRequest:", v3);

  objc_msgSend(*v1, "sidecarRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", *v1, CFSTR("finished"), 0, &ICRemoteViewControllerKVOContext);

  objc_msgSend(*v1, "sidecarRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "start");

  v6 = os_log_create("com.apple.documentcamera", ");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __59__ICRemoteDocCamViewController_makeSidecarRequestToDevice___block_invoke_cold_1(v1);

}

- (void)cancelSidecarRequest
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "sidecarRequest");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_20CE8E000, v2, v3, "Canceling sidecar request… {request: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

void __52__ICRemoteDocCamViewController_cancelSidecarRequest__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;

  objc_msgSend(*(id *)(a1 + 32), "sidecarRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

  objc_msgSend(*(id *)(a1 + 32), "setSidecarRequest:", 0);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteDocumentCameraControllerDidCancel:", *(_QWORD *)(a1 + 32));

  v4 = os_log_create("com.apple.documentcamera", ");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __52__ICRemoteDocCamViewController_cancelSidecarRequest__block_invoke_cold_1();

}

- (void)sidecarRequestDidFinish
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "sidecarRequest");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_20CE8E000, v3, v4, "Sidecar request finished {error: %@}", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

uint64_t __55__ICRemoteDocCamViewController_sidecarRequestDidFinish__block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];

  v1 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "sidecarRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __55__ICRemoteDocCamViewController_sidecarRequestDidFinish__block_invoke_cold_1(v1, v4);

    v5 = *v1;
    objc_msgSend(*v1, "sidecarRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "makeAlertControllerForError:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*v1, "presentViewController:animated:completion:", v8, 1, 0);
  }
  else
  {
    objc_msgSend(*v1, "sidecarRequest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "items");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v1, "imageCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __55__ICRemoteDocCamViewController_sidecarRequestDidFinish__block_invoke_51;
    v13[3] = &unk_24C5B85B0;
    v13[4] = *v1;
    +[ICDocCamDocumentInfoCollection infoCollectionFromSidecarItems:imageCache:completion:](ICDocCamDocumentInfoCollection, "infoCollectionFromSidecarItems:imageCache:completion:", v10, v11, v13);

  }
  return objc_msgSend(*v1, "setSidecarRequest:", 0);
}

void __55__ICRemoteDocCamViewController_sidecarRequestDidFinish__block_invoke_51(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;

  v3 = a2;
  v4 = os_log_create("com.apple.documentcamera", ");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __55__ICRemoteDocCamViewController_sidecarRequestDidFinish__block_invoke_51_cold_2();

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteDocumentCameraController:didFinishWithInfoCollection:", *(_QWORD *)(a1 + 32), v3);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __55__ICRemoteDocCamViewController_sidecarRequestDidFinish__block_invoke_51_cold_1();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.documentcamera"), 2, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "remoteDocumentCameraController:didFailWithError:", *(_QWORD *)(a1 + 32), v6);

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  int v13;
  objc_super v14;
  _QWORD block[5];

  v10 = a3;
  v11 = a4;
  if (a6 == &ICRemoteViewControllerKVOContext)
  {
    -[ICRemoteDocCamViewController sidecarRequest](self, "sidecarRequest");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v12 == v11)
    {
      v13 = objc_msgSend(v10, "isEqualToString:", CFSTR("finished"));

      if (v13)
      {
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __79__ICRemoteDocCamViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
        block[3] = &unk_24C5B7AE0;
        block[4] = self;
        dispatch_async(MEMORY[0x24BDAC9B8], block);
      }
    }
    else
    {

    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ICRemoteDocCamViewController;
    -[ICRemoteDocCamViewController observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, a5, a6);
  }

}

uint64_t __79__ICRemoteDocCamViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sidecarRequestDidFinish");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (ICDocCamImageCache)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_imageCache, a3);
}

- (ICRemoteDocCamViewControllerDelegate)delegate
{
  return (ICRemoteDocCamViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SidecarService)sidecarService
{
  return self->_sidecarService;
}

- (void)setSidecarService:(id)a3
{
  objc_storeStrong((id *)&self->_sidecarService, a3);
}

- (SidecarRequest)sidecarRequest
{
  return self->_sidecarRequest;
}

- (void)setSidecarRequest:(id)a3
{
  objc_storeStrong((id *)&self->_sidecarRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sidecarRequest, 0);
  objc_storeStrong((id *)&self->_sidecarService, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_imageCache, 0);
}

- (uint64_t)viewDidLoad
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return -[ICRemoteDocCamViewController viewDidAppear:].cold.1(v0);
}

- (void)viewDidAppear:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_2(&dword_20CE8E000, v0, v1, "Starting remote document scan…", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)makeSidecarRequestToDevice:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_20CE8E000, v0, OS_LOG_TYPE_DEBUG, "Making sidecar request… {device: %@}", v1, 0xCu);
}

void __59__ICRemoteDocCamViewController_makeSidecarRequestToDevice___block_invoke_cold_1(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a1, "sidecarRequest");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_20CE8E000, v2, v3, "Made sidecar request {request: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

void __52__ICRemoteDocCamViewController_cancelSidecarRequest__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_2(&dword_20CE8E000, v0, v1, "Canceled sidecar request", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __55__ICRemoteDocCamViewController_sidecarRequestDidFinish__block_invoke_cold_1(id *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "sidecarRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_20CE8E000, a2, OS_LOG_TYPE_ERROR, "Finishing remote document scan with error… {error: %@}", v5, 0xCu);

  OUTLINED_FUNCTION_2_0();
}

void __55__ICRemoteDocCamViewController_sidecarRequestDidFinish__block_invoke_51_cold_1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_20CE8E000, v0, OS_LOG_TYPE_ERROR, "Finishing remote document scan without collection…", v1, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __55__ICRemoteDocCamViewController_sidecarRequestDidFinish__block_invoke_51_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_2(&dword_20CE8E000, v0, v1, "Finishing remote document scan with collection…", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
