@implementation ICMarkupPresenter

+ (void)markupAttachment:(id)a3 fromView:(id)a4 presentingViewController:(id)a5 inkStyle:(unint64_t)a6 frameBlock:(id)a7 startPresentBlock:(id)a8 completionBlock:(id)a9 dismissCompletionBlock:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  int v22;
  void *v23;
  ICMarkupPresenter *v24;
  void *v25;
  id v26;

  v26 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  objc_msgSend(v26, "attachmentModel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isReadyToPresent");

  if (v22)
  {
    v23 = (void *)currentMarkupPresenter;
    if (!currentMarkupPresenter)
    {
      v24 = objc_alloc_init(ICMarkupPresenter);
      v25 = (void *)currentMarkupPresenter;
      currentMarkupPresenter = (uint64_t)v24;

      v23 = (void *)currentMarkupPresenter;
    }
    objc_msgSend(v23, "setAttachment:", v26);
    objc_msgSend((id)currentMarkupPresenter, "setPresentingViewController:", v16);
    objc_msgSend((id)currentMarkupPresenter, "setInkStyle:", a6);
    objc_msgSend((id)currentMarkupPresenter, "setFrameBlock:", v17);
    objc_msgSend((id)currentMarkupPresenter, "setStartPresentBlock:", v18);
    objc_msgSend((id)currentMarkupPresenter, "setCompletionBlock:", v19);
    objc_msgSend((id)currentMarkupPresenter, "setDismissCompletionBlock:", v20);
    objc_msgSend((id)currentMarkupPresenter, "presentMarkupFromView:", v15);
  }

}

- (void)presentMarkupFromView:(id)a3
{
  void *v4;
  int v5;
  id v6;

  v6 = a3;
  -[ICMarkupPresenter attachment](self, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldEmbedMarkupDataInMedia");

  if (v5)
    -[ICMarkupPresenter presentMarkupUsingExtensionFromView:](self, "presentMarkupUsingExtensionFromView:", v6);
  else
    -[ICMarkupPresenter presentMarkupViewControllerFromView:](self, "presentMarkupViewControllerFromView:", v6);

}

- (void)markupCancelAction:(id)a3
{
  -[ICMarkupPresenter setMarkupWasDismissedByUserInteraction:](self, "setMarkupWasDismissedByUserInteraction:", 1);
  -[ICMarkupPresenter dismissMarkupViewController](self, "dismissMarkupViewController");
}

- (void)markupDoneAction:(id)a3
{
  -[ICMarkupPresenter setMarkupWasDismissedByUserInteraction:](self, "setMarkupWasDismissedByUserInteraction:", 1);
  -[ICMarkupPresenter saveChangesAndDismiss](self, "saveChangesAndDismiss");
}

- (void)markupViewWillDissappear
{
  if (!-[ICMarkupPresenter markupWasDismissedByUserInteraction](self, "markupWasDismissedByUserInteraction"))
    -[ICMarkupPresenter saveChangesAndDismiss](self, "saveChangesAndDismiss");
}

- (void)saveChangesAndDismiss
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  _QWORD v12[5];
  id v13;

  -[ICMarkupPresenter markupViewController](self, "markupViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createArchivedModelData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ICMarkupPresenter markupViewController](self, "markupViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataRepresentationEmbeddingSourceImageAndEditModel:error:", 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0D63BA0];
    -[ICMarkupPresenter attachment](self, "attachment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __42__ICMarkupPresenter_saveChangesAndDismiss__block_invoke;
    v12[3] = &unk_1EA7DD498;
    v12[4] = self;
    v13 = v6;
    v9 = v6;
    objc_msgSend(v7, "applyMarkupModelData:attachment:completionBlock:", v4, v8, v12);

  }
  else
  {
    -[ICMarkupPresenter completionBlock](self, "completionBlock");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[ICMarkupPresenter completionBlock](self, "completionBlock");
      v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v11[2](v11, 0);

    }
    -[ICMarkupPresenter dismissMarkupViewController](self, "dismissMarkupViewController");
  }

}

uint64_t __42__ICMarkupPresenter_saveChangesAndDismiss__block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "completionBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "completionBlock");
    v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(_QWORD *)(a1 + 40));

  }
  return objc_msgSend(*(id *)(a1 + 32), "dismissMarkupViewController");
}

- (void)dismissMarkupViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  -[ICMarkupPresenter dismissCompletionBlock](self, "dismissCompletionBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMarkupPresenter setDismissCompletionBlock:](self, "setDismissCompletionBlock:", 0);
  -[ICMarkupPresenter setMarkupViewController:](self, "setMarkupViewController:", 0);
  v4 = (void *)currentMarkupPresenter;
  currentMarkupPresenter = 0;

  -[ICMarkupPresenter presentingViewController](self, "presentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__ICMarkupPresenter_dismissMarkupViewController__block_invoke;
  v8[3] = &unk_1EA7DDE08;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v8);

}

uint64_t __48__ICMarkupPresenter_dismissMarkupViewController__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)presentMarkupViewControllerFromView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ICMarkupNavigationController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD);
  void *v17;
  _QWORD v18[4];
  id v19;
  id location;
  _QWORD v21[5];
  ICMarkupNavigationController *v22;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D63BA0], "createMarkupViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInkStyle:", -[ICMarkupPresenter inkStyle](self, "inkStyle"));
  -[ICMarkupPresenter attachment](self, "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "markupModelData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D63BA0], "dataToEditForAttachment:includeMarkupModelData:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "image");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setData:withArchivedModelData:placeholderImage:", v8, v7, v9);

  v10 = -[ICMarkupNavigationController initWithRootViewController:]([ICMarkupNavigationController alloc], "initWithRootViewController:", v5);
  -[ICMarkupPresenter setMarkupWasDismissedByUserInteraction:](self, "setMarkupWasDismissedByUserInteraction:", 0);
  -[ICMarkupNavigationController setMarkupDelegate:](v10, "setMarkupDelegate:", self);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_markupDoneAction_);
  objc_msgSend(v5, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLeftBarButtonItem:", v11);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_markupCancelAction_);
  objc_msgSend(v5, "navigationItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setRightBarButtonItem:", v13);

  -[ICMarkupPresenter setMarkupViewController:](self, "setMarkupViewController:", v5);
  -[ICMarkupNavigationController setModalTransitionStyle:](v10, "setModalTransitionStyle:", 2);
  -[ICMarkupNavigationController setModalPresentationStyle:](v10, "setModalPresentationStyle:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "ICExtractedDocumentViewControllerBackgroundColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v15);

  -[ICMarkupPresenter startPresentBlock](self, "startPresentBlock");
  v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[ICMarkupPresenter setStartPresentBlock:](self, "setStartPresentBlock:", 0);
  if (v16)
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __57__ICMarkupPresenter_presentMarkupViewControllerFromView___block_invoke;
    v21[3] = &unk_1EA7DD498;
    v21[4] = self;
    v22 = v10;
    ((void (**)(_QWORD, _QWORD *))v16)[2](v16, v21);

  }
  else
  {
    objc_initWeak(&location, self);
    -[ICMarkupPresenter presentingViewController](self, "presentingViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __57__ICMarkupPresenter_presentMarkupViewControllerFromView___block_invoke_2;
    v18[3] = &unk_1EA7DD6B8;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v17, "presentViewController:animated:completion:", v10, 1, v18);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

}

void __57__ICMarkupPresenter_presentMarkupViewControllerFromView___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);

}

void __57__ICMarkupPresenter_presentMarkupViewControllerFromView___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  _QWORD block[4];
  id v6;
  uint8_t buf[4];
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "markupViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109120;
    v8 = objc_msgSend(v4, "isFirstResponder");
    _os_log_impl(&dword_1DD7B0000, v2, OS_LOG_TYPE_DEFAULT, "MarkupViewController finished presenting, isFirstResponder: %d", buf, 8u);

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__ICMarkupPresenter_presentMarkupViewControllerFromView___block_invoke_16;
  block[3] = &unk_1EA7DD6B8;
  objc_copyWeak(&v6, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v6);
}

void __57__ICMarkupPresenter_presentMarkupViewControllerFromView___block_invoke_16(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  char v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint8_t v8[16];

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "markupViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFirstResponder");

  if ((v4 & 1) == 0)
  {
    v5 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1DD7B0000, v5, OS_LOG_TYPE_DEFAULT, "Make MarkupViewController become first responder", v8, 2u);
    }

    v6 = objc_loadWeakRetained(v1);
    objc_msgSend(v6, "markupViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "becomeFirstResponder");

  }
}

- (void)presentMarkupUsingExtensionFromView:(id)a3
{
  BOOL v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD);
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  id *v25;
  void *v26;
  void *v27;
  CFDictionaryRef v28;
  id *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id *v34;
  void *v35;
  id v36;
  id *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  BOOL v44;
  void *v45;
  void *v46;
  id *v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  CFDictionaryRef DictionaryRepresentation;
  id v56;
  id v58;
  void *v59;
  _QWORD v60[5];
  id v61;
  SEL v62;
  _QWORD v63[5];
  _QWORD v64[5];
  _QWORD v65[6];
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  char v69;
  _QWORD v70[6];
  _QWORD v71[6];
  _QWORD v72[6];
  id v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  id v79;
  _QWORD v80[5];
  _QWORD v81[7];
  CGRect v82;
  CGRect v83;

  v81[5] = *MEMORY[0x1E0C80C00];
  v58 = a3;
  v73 = 0;
  objc_msgSend(MEMORY[0x1E0CB35D8], "extensionWithIdentifier:error:", CFSTR("com.apple.MarkupUI.MarkupPrivateExtension"), &v73);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v73;
  if (v54)
    v4 = 1;
  else
    v4 = v59 == 0;
  if (!v4)
    goto LABEL_9;
  v5 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[ICMarkupPresenter presentMarkupUsingExtensionFromView:].cold.1((uint64_t)v54, v5, v6, v7, v8, v9, v10, v11);

  if (v59)
  {
LABEL_9:
    v72[0] = MEMORY[0x1E0C809B0];
    v72[1] = 3221225472;
    v72[2] = __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke;
    v72[3] = &unk_1EA7E0EB8;
    v72[4] = self;
    v72[5] = a2;
    objc_msgSend(v59, "setRequestCompletionBlock:", v72);
    v71[0] = MEMORY[0x1E0C809B0];
    v71[1] = 3221225472;
    v71[2] = __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_2;
    v71[3] = &unk_1EA7E0EE0;
    v71[4] = self;
    v71[5] = a2;
    objc_msgSend(v59, "setRequestCancellationBlock:", v71);
    v70[0] = MEMORY[0x1E0C809B0];
    v70[1] = 3221225472;
    v70[2] = __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_2_22;
    v70[3] = &unk_1EA7E0F08;
    v70[4] = self;
    v70[5] = a2;
    objc_msgSend(v59, "setRequestInterruptionBlock:", v70);
    v56 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
    v66 = 0;
    v67 = &v66;
    v68 = 0x2020000000;
    v69 = 0;
    -[ICMarkupPresenter attachment](self, "attachment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "managedObjectContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_2_26;
    v65[3] = &unk_1EA7DE5C8;
    v65[4] = self;
    v65[5] = &v66;
    objc_msgSend(v13, "performBlockAndWait:", v65);

    v14 = (void *)*MEMORY[0x1E0CEC4A0];
    if (*((_BYTE *)v67 + 24))
    {
      objc_msgSend(v14, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v64[0] = MEMORY[0x1E0C809B0];
      v64[1] = 3221225472;
      v64[2] = __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_3;
      v64[3] = &unk_1EA7E0F30;
      v64[4] = self;
      objc_msgSend(v56, "registerItemForTypeIdentifier:loadHandler:", v15, v64);
    }
    else
    {
      objc_msgSend(v14, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v63[0] = MEMORY[0x1E0C809B0];
      v63[1] = 3221225472;
      v63[2] = __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_2_29;
      v63[3] = &unk_1EA7E0F30;
      v63[4] = self;
      objc_msgSend(v56, "registerItemForTypeIdentifier:loadHandler:", v15, v63);
    }

    -[ICMarkupPresenter frameBlock](self, "frameBlock");
    v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v16)[2](v16, v58);
    objc_msgSend(v58, "convertRect:toView:", 0);
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;

    v74 = 0;
    v75 = &v74;
    v76 = 0x2020000000;
    v25 = (id *)getMUAnimationSourceRectSymbolLoc_ptr;
    v77 = getMUAnimationSourceRectSymbolLoc_ptr;
    if (!getMUAnimationSourceRectSymbolLoc_ptr)
    {
      v26 = (void *)MarkupUILibrary();
      v25 = (id *)dlsym(v26, "MUAnimationSourceRect");
      v75[3] = (uint64_t)v25;
      getMUAnimationSourceRectSymbolLoc_ptr = (uint64_t)v25;
    }
    _Block_object_dispose(&v74, 8);
    if (v25)
    {
      v53 = *v25;
      v80[0] = v53;
      v82.origin.x = v18;
      v82.origin.y = v20;
      v82.size.width = v22;
      v82.size.height = v24;
      DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v82);
      v81[0] = DictionaryRepresentation;
      getMUAnimationMaskRect();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v80[1] = v27;
      v83.origin.x = v18;
      v83.origin.y = v20;
      v83.size.width = v22;
      v83.size.height = v24;
      v28 = CGRectCreateDictionaryRepresentation(v83);
      v81[1] = v28;
      v74 = 0;
      v75 = &v74;
      v76 = 0x2020000000;
      v29 = (id *)getMUAnimationIconImageSymbolLoc_ptr;
      v77 = getMUAnimationIconImageSymbolLoc_ptr;
      if (!getMUAnimationIconImageSymbolLoc_ptr)
      {
        v30 = (void *)MarkupUILibrary();
        v29 = (id *)dlsym(v30, "MUAnimationIconImage");
        v75[3] = (uint64_t)v29;
        getMUAnimationIconImageSymbolLoc_ptr = (uint64_t)v29;
      }
      _Block_object_dispose(&v74, 8);
      if (v29)
      {
        v31 = *v29;
        v80[2] = v31;
        -[ICMarkupPresenter attachment](self, "attachment");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "image");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v81[2] = v33;
        v74 = 0;
        v75 = &v74;
        v76 = 0x2020000000;
        v34 = (id *)getMUDisplayAsFullScreenSymbolLoc_ptr;
        v77 = getMUDisplayAsFullScreenSymbolLoc_ptr;
        if (!getMUDisplayAsFullScreenSymbolLoc_ptr)
        {
          v35 = (void *)MarkupUILibrary();
          v34 = (id *)dlsym(v35, "MUDisplayAsFullScreen");
          v75[3] = (uint64_t)v34;
          getMUDisplayAsFullScreenSymbolLoc_ptr = (uint64_t)v34;
        }
        _Block_object_dispose(&v74, 8);
        if (v34)
        {
          v36 = *v34;
          v80[3] = v36;
          v81[3] = MEMORY[0x1E0C9AAB0];
          v74 = 0;
          v75 = &v74;
          v76 = 0x2020000000;
          v37 = (id *)getMUEncryptPrivateMetadataSymbolLoc_ptr;
          v77 = getMUEncryptPrivateMetadataSymbolLoc_ptr;
          if (!getMUEncryptPrivateMetadataSymbolLoc_ptr)
          {
            v38 = (void *)MarkupUILibrary();
            v37 = (id *)dlsym(v38, "MUEncryptPrivateMetadata");
            v75[3] = (uint64_t)v37;
            getMUEncryptPrivateMetadataSymbolLoc_ptr = (uint64_t)v37;
          }
          _Block_object_dispose(&v74, 8);
          if (v37)
          {
            v39 = *v37;
            v80[4] = v39;
            v81[4] = MEMORY[0x1E0C9AAA0];
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v81, v80, 5);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = (void *)objc_msgSend(v40, "mutableCopy");

            -[ICMarkupPresenter attachment](self, "attachment");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "previewItemTitle");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = objc_msgSend(v43, "length") == 0;

            if (v44)
            {
LABEL_29:
              v50 = objc_alloc_init(MEMORY[0x1E0CB35E8]);
              objc_msgSend(v50, "setUserInfo:", v41);
              v79 = v56;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v79, 1);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v50, "setAttachments:", v51);

              v78 = v50;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v78, 1);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v60[0] = MEMORY[0x1E0C809B0];
              v60[1] = 3221225472;
              v60[2] = __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_3_33;
              v60[3] = &unk_1EA7E0FA8;
              v60[4] = self;
              v62 = a2;
              v61 = v58;
              objc_msgSend(v59, "instantiateViewControllerWithInputItems:connectionHandler:", v52, v60);

              _Block_object_dispose(&v66, 8);
              goto LABEL_30;
            }
            -[ICMarkupPresenter attachment](self, "attachment");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "previewItemTitle");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v74 = 0;
            v75 = &v74;
            v76 = 0x2020000000;
            v47 = (id *)getMUFileDisplayNameSymbolLoc_ptr;
            v77 = getMUFileDisplayNameSymbolLoc_ptr;
            if (!getMUFileDisplayNameSymbolLoc_ptr)
            {
              v48 = (void *)MarkupUILibrary();
              v47 = (id *)dlsym(v48, "MUFileDisplayName");
              v75[3] = (uint64_t)v47;
              getMUFileDisplayNameSymbolLoc_ptr = (uint64_t)v47;
            }
            _Block_object_dispose(&v74, 8);
            if (v47)
            {
              v49 = *v47;
              objc_msgSend(v41, "setObject:forKeyedSubscript:", v46, v49);

              goto LABEL_29;
            }
          }
        }
      }
    }
    dlerror();
    abort_report_np();
    __break(1u);
  }
LABEL_30:

}

void __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[5];
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_1DD7B0000, v7, OS_LOG_TYPE_DEFAULT, "%@ %@ B", buf, 0x16u);

  }
  v11 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1DD7B0000, v11, OS_LOG_TYPE_DEFAULT, "RequestCompletionBlock id: %@ items: %@", buf, 0x16u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_18;
  block[3] = &unk_1EA7DD2D8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_18(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissViewControllerAnimated:completion:", 0, 0);

}

void __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[5];
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_1DD7B0000, v7, OS_LOG_TYPE_DEFAULT, "%@ %@ C", buf, 0x16u);

  }
  v11 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_1DD7B0000, v11, OS_LOG_TYPE_DEFAULT, "RequestCancellationBlock id: %@ error: %@", buf, 0x16u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_20;
  block[3] = &unk_1EA7DD2D8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_20(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 0, 0);

  return objc_msgSend(*(id *)(a1 + 32), "setMarkupRemoteViewController:", 0);
}

void __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_2_22(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD block[5];
  uint8_t buf[4];
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1DD7B0000, v4, OS_LOG_TYPE_DEFAULT, "%@ %@ D", buf, 0x16u);

  }
  v8 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v3;
    _os_log_impl(&dword_1DD7B0000, v8, OS_LOG_TYPE_DEFAULT, "RequestInterruptionBlock id: %@", buf, 0xCu);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_23;
  block[3] = &unk_1EA7DD2D8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_23(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 0, 0);

  return objc_msgSend(*(id *)(a1 + 32), "setMarkupRemoteViewController:", 0);
}

void __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_2_26(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "media");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isPasswordProtected");

}

void __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void (**v6)(id, uint64_t, _QWORD);
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v6 = a2;
  v7 = a4;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__23;
  v15 = __Block_byref_object_dispose__23;
  v16 = 0;
  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_27;
  v10[3] = &unk_1EA7DE5C8;
  v10[4] = *(_QWORD *)(a1 + 32);
  v10[5] = &v11;
  objc_msgSend(v9, "performBlockAndWait:", v10);

  v6[2](v6, v12[5], 0);
  _Block_object_dispose(&v11, 8);

}

void __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_27(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "media");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "decryptedData");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_2_29(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void (**v4)(id, id, _QWORD);
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x1E0D63BA0];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataToEditForAttachment:includeMarkupModelData:", v5, 1);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4[2](v4, v6, 0);
}

void __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_3_33(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint64_t v19;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_3_33_cold_1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);

  }
  else
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_34;
    v16[3] = &unk_1EA7DF6F8;
    v15 = *(_QWORD *)(a1 + 48);
    v16[4] = *(_QWORD *)(a1 + 32);
    v19 = v15;
    v17 = v6;
    v18 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], v16);

  }
}

void __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_34(uint64_t a1)
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.notes", "UI");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v21 = v4;
    v22 = 2112;
    v23 = v5;
    _os_log_impl(&dword_1DD7B0000, v2, OS_LOG_TYPE_DEFAULT, "%@ %@ E", buf, 0x16u);

  }
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  v6 = *(id *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "setMarkupRemoteViewController:", v6);
  objc_msgSend(*(id *)(a1 + 32), "markupRemoteViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOpaque:", 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "markupRemoteViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v9);

  objc_msgSend(*(id *)(a1 + 32), "markupRemoteViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setModalPresentationStyle:", 5);

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_35;
  v16[3] = &unk_1EA7E0F80;
  objc_copyWeak(&v19, (id *)buf);
  v17 = *(id *)(a1 + 48);
  v13 = v6;
  v18 = v13;
  objc_msgSend(*(id *)(a1 + 32), "markupRemoteViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFinishedWithResultsCompletionBlock:", v16);

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 0, 0);

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

void __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_35(id *a1, void *a2)
{
  id v3;
  os_log_t WeakRetained;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  if (objc_msgSend(v3, "ic_isReachable"))
  {
    WeakRetained = (os_log_t)objc_loadWeakRetained(a1 + 6);
    -[NSObject handleReturnedURL:](WeakRetained, "handleReturnedURL:", v3);
  }
  else
  {
    WeakRetained = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
      __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_35_cold_1((uint64_t)a1, (uint64_t)v3, WeakRetained);

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_36;
  block[3] = &unk_1EA7E0F58;
  v6 = a1[4];
  objc_copyWeak(&v8, a1 + 6);
  v7 = a1[5];
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v8);
}

void __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_36(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  id WeakRetained;
  void (**v5)(_QWORD, _QWORD);
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  id *v14;
  void *v15;
  id v16;
  CFDictionaryRef DictionaryRepresentation;
  void *v18;
  CFDictionaryRef v19;
  void *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  id v25[2];
  _QWORD v26[3];
  CGRect v27;
  CGRect v28;

  v26[2] = *MEMORY[0x1E0C80C00];
  v3 = (_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "frameBlock");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v5[2](v5, *v3);
  objc_msgSend(v2, "convertRect:toView:", 0);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v14 = (id *)getMUAnimationTargetRectSymbolLoc_ptr;
  v24 = getMUAnimationTargetRectSymbolLoc_ptr;
  if (!getMUAnimationTargetRectSymbolLoc_ptr)
  {
    v15 = (void *)MarkupUILibrary();
    v14 = (id *)dlsym(v15, "MUAnimationTargetRect");
    v22[3] = (uint64_t)v14;
    getMUAnimationTargetRectSymbolLoc_ptr = (uint64_t)v14;
  }
  _Block_object_dispose(&v21, 8);
  if (!v14)
  {
    __59__ICNoteEditorViewController_noteDecryptedStatusDidChange___block_invoke_cold_1();
    __break(1u);
  }
  v25[0] = *v14;
  v16 = v25[0];
  v27.origin.x = v7;
  v27.origin.y = v9;
  v27.size.width = v11;
  v27.size.height = v13;
  DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v27);
  v26[0] = DictionaryRepresentation;
  getMUAnimationMaskRect();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v18;
  v28.origin.x = v7;
  v28.origin.y = v9;
  v28.size.width = v11;
  v28.size.height = v13;
  v19 = CGRectCreateDictionaryRepresentation(v28);
  v26[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "beginDismissWithInfo:", v20);
}

- (void)handleReturnedURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = __Block_byref_object_copy__23;
  v8[4] = __Block_byref_object_dispose__23;
  -[ICMarkupPresenter markupRemoteViewController](self, "markupRemoteViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D63BA0];
  -[ICMarkupPresenter attachment](self, "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__ICMarkupPresenter_handleReturnedURL___block_invoke;
  v7[3] = &unk_1EA7DECF8;
  v7[4] = v8;
  objc_msgSend(v5, "applyReturnedMarkupURL:attachment:completionBlock:", v4, v6, v7);

  _Block_object_dispose(v8, 8);
}

void __39__ICMarkupPresenter_handleReturnedURL___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD);
  uint64_t v4;
  void *v5;

  objc_msgSend((id)currentMarkupPresenter, "completionBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend((id)currentMarkupPresenter, "completionBlock");
    v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, 0);

  }
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_24);
}

void __39__ICMarkupPresenter_handleReturnedURL___block_invoke_2()
{
  void *v0;

  v0 = (void *)currentMarkupPresenter;
  currentMarkupPresenter = 0;

}

- (ICAttachment)attachment
{
  return (ICAttachment *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAttachment:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (MURemoteViewController)markupRemoteViewController
{
  return self->_markupRemoteViewController;
}

- (void)setMarkupRemoteViewController:(id)a3
{
  objc_storeStrong((id *)&self->_markupRemoteViewController, a3);
}

- (MarkupViewController)markupViewController
{
  return self->_markupViewController;
}

- (void)setMarkupViewController:(id)a3
{
  objc_storeStrong((id *)&self->_markupViewController, a3);
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (unint64_t)inkStyle
{
  return self->_inkStyle;
}

- (void)setInkStyle:(unint64_t)a3
{
  self->_inkStyle = a3;
}

- (id)frameBlock
{
  return self->_frameBlock;
}

- (void)setFrameBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)startPresentBlock
{
  return self->_startPresentBlock;
}

- (void)setStartPresentBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)dismissCompletionBlock
{
  return self->_dismissCompletionBlock;
}

- (void)setDismissCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)markupWasDismissedByUserInteraction
{
  return self->_markupWasDismissedByUserInteraction;
}

- (void)setMarkupWasDismissedByUserInteraction:(BOOL)a3
{
  self->_markupWasDismissedByUserInteraction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissCompletionBlock, 0);
  objc_storeStrong(&self->_startPresentBlock, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_frameBlock, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_markupViewController, 0);
  objc_storeStrong((id *)&self->_markupRemoteViewController, 0);
  objc_storeStrong((id *)&self->_attachment, 0);
}

- (void)presentMarkupUsingExtensionFromView:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DD7B0000, a2, a3, "Could not get Markup extension: %@", a5, a6, a7, a8, 2u);
}

void __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_3_33_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1DD7B0000, a2, a3, "Error instantiateViewControllerWithInputItems: %@", a5, a6, a7, a8, 2u);
}

void __57__ICMarkupPresenter_presentMarkupUsingExtensionFromView___block_invoke_35_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id WeakRetained;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "attachment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v6;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl(&dword_1DD7B0000, a3, OS_LOG_TYPE_ERROR, "Markup result URL is not reachable {attachment: %@, url: %@}", (uint8_t *)&v7, 0x16u);

}

@end
