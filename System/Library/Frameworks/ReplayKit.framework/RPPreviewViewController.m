@implementation RPPreviewViewController

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RPPreviewViewController;
  -[RPPreviewViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  +[RPScreenRecorder sharedRecorder](RPScreenRecorder, "sharedRecorder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWindowRotationLocked:", 1);

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RPPreviewViewController setWasStatusBarHidden:](self, "setWasStatusBarHidden:", objc_msgSend(v5, "isStatusBarHidden"));

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStatusBarHidden:", 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RPPreviewViewController;
  -[RPPreviewViewController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v5 = -[RPPreviewViewController wasStatusBarHidden](self, "wasStatusBarHidden");
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStatusBarHidden:", v5);

  v7.receiver = self;
  v7.super_class = (Class)RPPreviewViewController;
  -[RPPreviewViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RPPreviewViewController;
  -[RPPreviewViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  +[RPScreenRecorder sharedRecorder](RPScreenRecorder, "sharedRecorder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWindowRotationLocked:", 0);

}

+ (void)loadPreviewViewControllerWithMovieURL:(id)a3 completion:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "loadPreviewViewControllerWithMovieURL:attachmentURL:overrideShareMessage:overrideTintColor:completion:", v6, 0, 0, 0, v5);

}

+ (void)loadPreviewViewControllerWithMovieURL:(id)a3 attachmentURL:(id)a4 overrideShareMessage:(id)a5 overrideTintColor:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, _QWORD);
  id v15;
  _QWORD *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void (**v22)(id, _QWORD);
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t *v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void (**v57)(id, _QWORD);
  id v58;
  id v59;
  void *v60;
  id v61;
  void *v62;
  _QWORD v63[4];
  id v64;
  void (**v65)(id, _QWORD);
  id v66;
  uint8_t buf[16];
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  _QWORD v73[3];

  v73[1] = *MEMORY[0x24BDAC8D0];
  v61 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void (**)(id, _QWORD))a7;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "RPVideoPreviewViewController:loadPreviewViewControllerWithCompletion", buf, 2u);
  }
  v66 = 0;
  objc_msgSend(MEMORY[0x24BDD1550], "extensionWithIdentifier:error:", CFSTR("com.apple.ReplayKit.RPVideoEditorExtension"), &v66);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v66;
  if (v15 || !v62)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[RPPreviewViewController loadPreviewViewControllerWithMovieURL:attachmentURL:overrideShareMessage:overrideTintColor:completion:].cold.1(v15);
    v14[2](v14, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (_QWORD *)MEMORY[0x24BDC1748];
    if (v11)
    {
      v17 = objc_alloc_init(MEMORY[0x24BDD1560]);
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", CFSTR("RPVideoEditorExtensionFileAttachmentKey"), 0);
      objc_msgSend(v17, "setAttributedTitle:", v18);

      v19 = objc_alloc(MEMORY[0x24BDD15F0]);
      objc_msgSend(v11, "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v19, "initWithItem:typeIdentifier:", v20, *v16);
      v73[0] = v21;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v73, 1);
      v22 = v14;
      v23 = v13;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setAttachments:", v24);

      v13 = v23;
      v14 = v22;

      objc_msgSend(v60, "addObject:", v17);
    }
    if (v12)
    {
      v25 = objc_alloc_init(MEMORY[0x24BDD1560]);
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", CFSTR("RPVideoEditorExtensionOverrideShareMessageKey"), 0);
      objc_msgSend(v25, "setAttributedTitle:", v26);

      v27 = objc_alloc(MEMORY[0x24BDD15F0]);
      v28 = (void *)objc_msgSend(v27, "initWithItem:typeIdentifier:", v12, *MEMORY[0x24BDC1748]);
      v72 = v28;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v72, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setAttachments:", v29);

      objc_msgSend(v60, "addObject:", v25);
    }
    v30 = (uint64_t *)MEMORY[0x24BDC1748];
    v59 = v11;
    v57 = v14;
    v58 = v13;
    if (v13)
    {
      v31 = objc_alloc_init(MEMORY[0x24BDD1560]);
      v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", CFSTR("RPVideoEditorExtensionOverrideTintColorKey"), 0);
      objc_msgSend(v31, "setAttributedTitle:", v32);

      v33 = objc_alloc(MEMORY[0x24BDD15F0]);
      v34 = *v30;
      v35 = (void *)objc_msgSend(v33, "initWithItem:typeIdentifier:", v13, *v30);
      v71 = v35;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v71, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setAttachments:", v36);

      objc_msgSend(v60, "addObject:", v31);
    }
    else
    {
      v34 = *MEMORY[0x24BDC1748];
    }
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "load");
    objc_msgSend(v55, "infoDictionary");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "objectForKey:", *MEMORY[0x24BDBD1D0]);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = objc_alloc_init(MEMORY[0x24BDD1560]);
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", CFSTR("RPVideoEditorExtensionAppNameKey"), 0);
    objc_msgSend(v38, "setAttributedTitle:", v39);

    v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD15F0]), "initWithItem:typeIdentifier:", v56, v34);
    v70 = v40;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v70, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setAttachments:", v41);

    objc_msgSend(v60, "addObject:", v38);
    v42 = objc_alloc_init(MEMORY[0x24BDD1560]);
    v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", CFSTR("RPVideoEditorExtensionMovieURLKey"), 0);
    objc_msgSend(v42, "setAttributedTitle:", v43);

    v44 = objc_alloc(MEMORY[0x24BDD15F0]);
    objc_msgSend(v61, "path");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)objc_msgSend(v44, "initWithItem:typeIdentifier:", v45, v34);
    v69 = v46;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v69, 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setAttachments:", v47);

    objc_msgSend(v60, "addObject:", v42);
    v48 = objc_alloc_init(MEMORY[0x24BDD1560]);
    v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", CFSTR("RPVideoEditorExtensionBundleIdentifierKey"), 0);
    objc_msgSend(v48, "setAttributedTitle:", v49);

    v50 = objc_alloc(MEMORY[0x24BDD15F0]);
    objc_msgSend(v55, "bundleIdentifier");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (void *)objc_msgSend(v50, "initWithItem:typeIdentifier:", v51, v34);
    v68 = v52;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v68, 1);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setAttachments:", v53);

    objc_msgSend(v60, "addObject:", v48);
    v54 = (void *)objc_opt_class();
    v63[0] = MEMORY[0x24BDAC760];
    v63[1] = 3221225472;
    v63[2] = __129__RPPreviewViewController_loadPreviewViewControllerWithMovieURL_attachmentURL_overrideShareMessage_overrideTintColor_completion___block_invoke;
    v63[3] = &unk_24D15E350;
    v64 = v61;
    v14 = v57;
    v65 = v57;
    objc_msgSend(v54, "viewControllerForExtension:inputItems:completionHandler:", v62, v60, v63);

    v11 = v59;
    v13 = v58;
    v15 = 0;
  }

}

void __129__RPPreviewViewController_loadPreviewViewControllerWithMovieURL_attachmentURL_overrideShareMessage_overrideTintColor_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __129__RPPreviewViewController_loadPreviewViewControllerWithMovieURL_attachmentURL_overrideShareMessage_overrideTintColor_completion___block_invoke_2;
  block[3] = &unk_24D15D558;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = *(id *)(a1 + 40);
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __129__RPPreviewViewController_loadPreviewViewControllerWithMovieURL_attachmentURL_overrideShareMessage_overrideTintColor_completion___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  RPPreviewViewController *v15;

  v15 = objc_alloc_init(RPPreviewViewController);
  -[RPPreviewViewController setMovieURL:](v15, "setMovieURL:", *(_QWORD *)(a1 + 32));
  v2 = *(id *)(a1 + 40);
  objc_msgSend(v2, "setPreviewViewController:", v15);
  -[RPPreviewViewController setHostViewController:](v15, "setHostViewController:", v2);
  -[RPPreviewViewController view](v15, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v2, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  -[RPPreviewViewController addChildViewController:](v15, "addChildViewController:", v2);
  -[RPPreviewViewController view](v15, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", v14);

  objc_msgSend(v2, "didMoveToParentViewController:", v15);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

+ (void)viewControllerForExtension:(id)a3 inputItems:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "RPPreviewViewController:viewControllerForExtension", buf, 2u);
  }
  if (v7)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __83__RPPreviewViewController_viewControllerForExtension_inputItems_completionHandler___block_invoke;
    v10[3] = &unk_24D15E2B8;
    v11 = v7;
    v12 = v9;
    objc_msgSend(v11, "instantiateViewControllerWithInputItems:connectionHandler:", v8, v10);

  }
}

void __83__RPPreviewViewController_viewControllerForExtension_inputItems_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;

  v7 = a3;
  v8 = a4;
  v9 = v7;
  objc_msgSend(*(id *)(a1 + 32), "_extensionContextForUUID:", a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHostViewController:", v9);
  objc_msgSend(v9, "setHostContext:", v10);
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __83__RPPreviewViewController_viewControllerForExtension_inputItems_completionHandler___block_invoke_cold_1(v8);
  }
  else
  {
    v11 = *(_QWORD *)(a1 + 40);
    if (v11)
      (*(void (**)(uint64_t, id))(v11 + 16))(v11, v9);
  }

}

- (void)videoEditor:(id)a3 didFinishWithActivityTypes:(id)a4
{
  id v5;
  id WeakRetained;
  char v7;
  uint64_t v8;
  id v9;
  char v10;
  _QWORD v11[5];
  _QWORD block[5];
  id v13;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_previewControllerDelegate);
  v7 = objc_opt_respondsToSelector();

  v8 = MEMORY[0x24BDAC760];
  if ((v7 & 1) != 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __66__RPPreviewViewController_videoEditor_didFinishWithActivityTypes___block_invoke;
    block[3] = &unk_24D15D5A8;
    block[4] = self;
    v13 = v5;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  v9 = objc_loadWeakRetained((id *)&self->_previewControllerDelegate);
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __66__RPPreviewViewController_videoEditor_didFinishWithActivityTypes___block_invoke_2;
    v11[3] = &unk_24D15D648;
    v11[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], v11);
  }

}

void __66__RPPreviewViewController_videoEditor_didFinishWithActivityTypes___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 976));
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "previewController:didFinishWithActivityTypes:", v2, v3);

}

void __66__RPPreviewViewController_videoEditor_didFinishWithActivityTypes___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 976));
  objc_msgSend(WeakRetained, "previewControllerDidFinish:", *(_QWORD *)(a1 + 32));

}

- (void)extensionDidFinishWithActivityTypes:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  char v9;
  _QWORD v10[5];
  _QWORD block[5];
  id v12;
  uint8_t buf[16];

  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "RPPreviewViewController:extensionDidFinish", buf, 2u);
  }
  -[RPPreviewViewController previewControllerDelegate](self, "previewControllerDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  v7 = MEMORY[0x24BDAC760];
  if ((v6 & 1) != 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__RPPreviewViewController_extensionDidFinishWithActivityTypes___block_invoke;
    block[3] = &unk_24D15D5A8;
    block[4] = self;
    v12 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  -[RPPreviewViewController previewControllerDelegate](self, "previewControllerDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __63__RPPreviewViewController_extensionDidFinishWithActivityTypes___block_invoke_2;
    v10[3] = &unk_24D15D648;
    v10[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], v10);
  }

}

void __63__RPPreviewViewController_extensionDidFinishWithActivityTypes___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "previewControllerDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previewController:didFinishWithActivityTypes:", v2, v3);

}

void __63__RPPreviewViewController_extensionDidFinishWithActivityTypes___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "previewControllerDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "previewControllerDidFinish:", *(_QWORD *)(a1 + 32));

}

- (id)previewControllerDelegate
{
  return objc_loadWeakRetained((id *)&self->_previewControllerDelegate);
}

- (void)setPreviewControllerDelegate:(id)previewControllerDelegate
{
  objc_storeWeak((id *)&self->_previewControllerDelegate, previewControllerDelegate);
}

- (BOOL)wasStatusBarHidden
{
  return self->_wasStatusBarHidden;
}

- (void)setWasStatusBarHidden:(BOOL)a3
{
  self->_wasStatusBarHidden = a3;
}

- (NSURL)movieURL
{
  return self->_movieURL;
}

- (void)setMovieURL:(id)a3
{
  objc_storeStrong((id *)&self->_movieURL, a3);
}

- (RPVideoEditorHostViewController)hostViewController
{
  return self->_hostViewController;
}

- (void)setHostViewController:(id)a3
{
  objc_storeStrong((id *)&self->_hostViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostViewController, 0);
  objc_storeStrong((id *)&self->_movieURL, 0);
  objc_destroyWeak((id *)&self->_previewControllerDelegate);
}

+ (void)loadPreviewViewControllerWithMovieURL:(void *)a1 attachmentURL:overrideShareMessage:overrideTintColor:completion:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(a1, "code");
  OUTLINED_FUNCTION_0(&dword_214135000, MEMORY[0x24BDACB70], v1, "error getting extension: %i", v2, v3, v4, v5, 0);
}

void __83__RPPreviewViewController_viewControllerForExtension_inputItems_completionHandler___block_invoke_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(a1, "code");
  OUTLINED_FUNCTION_0(&dword_214135000, MEMORY[0x24BDACB70], v1, "Error instantiating remote view controller for extension: %i", v2, v3, v4, v5, 0);
}

@end
