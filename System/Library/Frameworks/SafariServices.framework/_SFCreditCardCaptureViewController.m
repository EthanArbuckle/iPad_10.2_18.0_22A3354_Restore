@implementation _SFCreditCardCaptureViewController

+ (BOOL)canCapture
{
  return objc_msgSend(getCRCameraReaderClass(), "supportedCameraCount") != 0;
}

- (_SFCreditCardCaptureViewController)init
{
  _SFCreditCardCaptureViewController *v2;
  CRCameraReader *v3;
  CRCameraReader *reader;
  void *v5;
  void *v6;
  CRCameraReader *v7;
  id *v8;
  void *v9;
  id v10;
  id *v11;
  void *v12;
  id v13;
  id *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _SFCreditCardCaptureViewController *v25;
  objc_super v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[2];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)_SFCreditCardCaptureViewController;
  v2 = -[_SFCreditCardCaptureViewController init](&v27, sel_init);
  if (v2)
  {
    v3 = (CRCameraReader *)objc_alloc_init((Class)getCRCameraReaderClass());
    reader = v2->_reader;
    v2->_reader = v3;

    -[CRCameraReader view](v2->_reader, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    objc_msgSend(v5, "setFrame:");

    -[CRCameraReader setDelegate:](v2->_reader, "setDelegate:", v2);
    v7 = v2->_reader;
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v8 = (id *)getCROutputTypeCreditCardCardholderNameSymbolLoc_ptr;
    v31 = getCROutputTypeCreditCardCardholderNameSymbolLoc_ptr;
    if (!getCROutputTypeCreditCardCardholderNameSymbolLoc_ptr)
    {
      v9 = (void *)CoreRecognitionLibrary();
      v8 = (id *)dlsym(v9, "CROutputTypeCreditCardCardholderName");
      v29[3] = (uint64_t)v8;
      getCROutputTypeCreditCardCardholderNameSymbolLoc_ptr = (uint64_t)v8;
    }
    _Block_object_dispose(&v28, 8);
    if (!v8)
      goto LABEL_13;
    v10 = *v8;
    v32[0] = v10;
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v11 = (id *)getCROutputTypeCreditCardExpirationDateSymbolLoc_ptr;
    v31 = getCROutputTypeCreditCardExpirationDateSymbolLoc_ptr;
    if (!getCROutputTypeCreditCardExpirationDateSymbolLoc_ptr)
    {
      v12 = (void *)CoreRecognitionLibrary();
      v11 = (id *)dlsym(v12, "CROutputTypeCreditCardExpirationDate");
      v29[3] = (uint64_t)v11;
      getCROutputTypeCreditCardExpirationDateSymbolLoc_ptr = (uint64_t)v11;
    }
    _Block_object_dispose(&v28, 8);
    if (!v11)
      goto LABEL_13;
    v13 = *v11;
    v32[1] = v13;
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v14 = (id *)getCROutputTypeCreditCardNumberSymbolLoc_ptr;
    v31 = getCROutputTypeCreditCardNumberSymbolLoc_ptr;
    if (!getCROutputTypeCreditCardNumberSymbolLoc_ptr)
    {
      v15 = (void *)CoreRecognitionLibrary();
      v14 = (id *)dlsym(v15, "CROutputTypeCreditCardNumber");
      v29[3] = (uint64_t)v14;
      getCROutputTypeCreditCardNumberSymbolLoc_ptr = (uint64_t)v14;
    }
    _Block_object_dispose(&v28, 8);
    if (!v14)
    {
LABEL_13:
      -[SFDefaultBrowserListView productDetailsUserDidInteractWithApp:interactionType:].cold.1();
      __break(1u);
    }
    v33 = *v14;
    v16 = (void *)MEMORY[0x1E0C99D20];
    v17 = v33;
    objc_msgSend(v16, "arrayWithObjects:count:", v32, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRCameraReader setOutputObjectTypes:](v7, "setOutputObjectTypes:", v18);

    -[_SFCreditCardCaptureViewController pushViewController:animated:](v2, "pushViewController:animated:", v2->_reader, 0);
    -[CRCameraReader navigationController](v2->_reader, "navigationController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "navigationBar");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "standardAppearance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setScrollEdgeAppearance:", v21);

    -[CRCameraReader navigationItem](v2->_reader, "navigationItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, v2, sel__cancel_);
    objc_msgSend(v22, "setLeftBarButtonItem:", v23);

    _WBSLocalizedString();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTitle:", v24);

    v25 = v2;
  }

  return v2;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SFCreditCardCaptureViewController;
  -[_SFCreditCardCaptureViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[CRCameraReader start](self->_reader, "start");
}

- (void)_cancel:(id)a3
{
  -[CRCameraReader cancel](self->_reader, "cancel", a3);
}

- (void)cameraReader:(id)a3 didFailWithError:(id)a4
{
  void *v5;
  char v6;
  _QWORD block[5];

  -[_SFCreditCardCaptureViewController delegate](self, "delegate", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68___SFCreditCardCaptureViewController_cameraReader_didFailWithError___block_invoke;
    block[3] = &unk_1E4ABFE00;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

- (void)cameraReaderDidEnd:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57___SFCreditCardCaptureViewController_cameraReaderDidEnd___block_invoke;
  block[3] = &unk_1E4ABFE00;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)cameraReaderDidCancel:(id)a3
{
  void *v4;
  char v5;
  _QWORD block[5];

  -[_SFCreditCardCaptureViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60___SFCreditCardCaptureViewController_cameraReaderDidCancel___block_invoke;
    block[3] = &unk_1E4ABFE00;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

- (void)cameraReader:(id)a3 didRecognizeObjects:(id)a4
{
  objc_class *v5;
  id v6;
  WBSCreditCardData *v7;
  WBSCreditCardData *receivedCardData;

  v5 = (objc_class *)MEMORY[0x1E0D8A898];
  v6 = a4;
  v7 = (WBSCreditCardData *)objc_msgSend([v5 alloc], "initWithCameraReaderOutput:", v6);

  receivedCardData = self->_receivedCardData;
  self->_receivedCardData = v7;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receivedCardData, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
