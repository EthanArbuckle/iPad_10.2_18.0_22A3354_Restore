@implementation CAMDocumentScanFlowController

- (CAMDocumentScanFlowController)init
{
  id v3;
  CAMDocumentScanFlowController *v4;
  CAMDocumentScanFlowController *v5;
  objc_super v7;

  v3 = objc_alloc_init(MEMORY[0x1E0D1D860]);
  v7.receiver = self;
  v7.super_class = (Class)CAMDocumentScanFlowController;
  v4 = -[CAMDocumentScanFlowController initWithRootViewController:](&v7, sel_initWithRootViewController_, v3);
  if (v4)
  {
    objc_msgSend(v3, "setDelegate:", v4);
    -[CAMDocumentScanFlowController setModalPresentationStyle:](v4, "setModalPresentationStyle:", 5);
    -[CAMDocumentScanFlowController setModalTransitionStyle:](v4, "setModalTransitionStyle:", 2);
    -[CAMDocumentScanFlowController setNavigationBarHidden:](v4, "setNavigationBarHidden:", 1);
    v5 = v4;
  }

  return v4;
}

+ (BOOL)isSupported
{
  return objc_msgSend(MEMORY[0x1E0D1D860], "isSupported");
}

- (void)documentCameraViewController:(id)a3 didFinishWithScan:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80__CAMDocumentScanFlowController_documentCameraViewController_didFinishWithScan___block_invoke;
  v8[3] = &unk_1EA32BB98;
  objc_copyWeak(&v9, &location);
  -[CAMDocumentScanFlowController _asyncConvertToPDFAndWrite:completionHandler:](self, "_asyncConvertToPDFAndWrite:completionHandler:", v7, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __80__CAMDocumentScanFlowController_documentCameraViewController_didFinishWithScan___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handlePDFResults:", v3);

}

- (void)_handlePDFResults:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  _QWORD v28[5];
  id v29;
  _QWORD v30[2];
  _QWORD v31[3];

  v31[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[CAMDocumentScanFlowController set_url:](self, "set_url:");
    v4 = objc_alloc_init(MEMORY[0x1E0CD3250]);
    objc_msgSend(v4, "setModalPresentationStyle:", 0);
    objc_msgSend(v4, "setModalTransitionStyle:", 2);
    objc_msgSend(v4, "setDataSource:", self);
    objc_msgSend(v4, "setDelegate:", self);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("trash"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("square.and.arrow.down"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0DC3428];
    CAMLocalizedFrameworkString(CFSTR("DOCUMENT_SCANNING_SAVE_TO_FILES"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __51__CAMDocumentScanFlowController__handlePDFResults___block_invoke;
    v28[3] = &unk_1EA32BBC0;
    v28[4] = self;
    objc_msgSend(v5, "actionWithTitle:image:identifier:handler:", v6, v26, CFSTR("save"), v28);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x1E0DC3428];
    CAMLocalizedFrameworkString(CFSTR("DOCUMENT_SCANNING_DELETE"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v7;
    v27[1] = 3221225472;
    v27[2] = __51__CAMDocumentScanFlowController__handlePDFResults___block_invoke_2;
    v27[3] = &unk_1EA32BBC0;
    v27[4] = self;
    objc_msgSend(v9, "actionWithTitle:image:identifier:handler:", v10, v25, CFSTR("delete"), v27);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setAttributes:", 2);
    v12 = (void *)MEMORY[0x1E0DC39D0];
    v31[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "menuWithTitle:image:identifier:options:children:", &stru_1EA3325A0, 0, CFSTR("destructive.options"), 1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0DC39D0];
    v30[0] = v8;
    v30[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "menuWithChildren:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "navigationItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setHidesBackButton:", 1);

    v19 = objc_alloc(MEMORY[0x1E0DC34F0]);
    CAMLocalizedFrameworkString(CFSTR("DOCUMENT_SCANNING_DONE"), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithTitle:menu:", v20, v17);
    objc_msgSend(v4, "navigationItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setLeftBarButtonItem:", v21);

    v29 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMDocumentScanFlowController setViewControllers:animated:](self, "setViewControllers:animated:", v23, 1);

  }
  else
  {
    v24 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[CAMDocumentScanFlowController _handlePDFResults:].cold.1(v24);

    -[CAMDocumentScanFlowController documentFlowDelegate](self, "documentFlowDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "documentScanFlowControllerDidFail:withError:", self, 0);
  }

}

void __51__CAMDocumentScanFlowController__handlePDFResults___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0DC3730]);
  objc_msgSend(*(id *)(a1 + 32), "_url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initForExportingURLs:asCopy:", v4, 1);

  objc_msgSend(v5, "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v5, 1, 0);

}

void __51__CAMDocumentScanFlowController__handlePDFResults___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "documentFlowDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "documentScanFlowControllerDidFinish:", *(_QWORD *)(a1 + 32));

}

- (void)documentCameraViewControllerDidCancel:(id)a3
{
  id v4;

  -[CAMDocumentScanFlowController documentFlowDelegate](self, "documentFlowDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "documentScanFlowControllerDidCancel:", self);

}

- (void)documentCameraViewController:(id)a3 didFailWithError:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CAMDocumentScanFlowController documentFlowDelegate](self, "documentFlowDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "documentScanFlowControllerDidFail:withError:", self, v5);

}

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  void *v3;
  int64_t v4;

  -[CAMDocumentScanFlowController _url](self, "_url", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (int64_t)previewController:(id)a3 editingModeForPreviewItem:(id)a4
{
  return 0;
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  id v5;

  -[CAMDocumentScanFlowController documentFlowDelegate](self, "documentFlowDelegate", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "documentScanFlowControllerDidFinish:", self);

}

- (id)_pdfConversionQueue
{
  if (_pdfConversionQueue_onceToken != -1)
    dispatch_once(&_pdfConversionQueue_onceToken, &__block_literal_global_19);
  return (id)_pdfConversionQueue__conversionQueue;
}

void __52__CAMDocumentScanFlowController__pdfConversionQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INITIATED, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("com.apple.camera.pdf-conversion-queue", attr);
  v2 = (void *)_pdfConversionQueue__conversionQueue;
  _pdfConversionQueue__conversionQueue = (uint64_t)v1;

}

- (void)_asyncConvertToPDFAndWrite:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nameForDocumentWithDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAMDocumentScanFlowController _pdfConversionQueue](self, "_pdfConversionQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__CAMDocumentScanFlowController__asyncConvertToPDFAndWrite_completionHandler___block_invoke;
  block[3] = &unk_1EA32BC30;
  v16 = v6;
  v17 = v10;
  v18 = v7;
  v12 = v7;
  v13 = v10;
  v14 = v6;
  dispatch_async(v11, block);

}

void __78__CAMDocumentScanFlowController__asyncConvertToPDFAndWrite_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __78__CAMDocumentScanFlowController__asyncConvertToPDFAndWrite_completionHandler___block_invoke_2;
  v3[3] = &unk_1EA32BC08;
  v4 = *(id *)(a1 + 48);
  +[CAMPDFConverter convertToPDFAndWrite:documentName:completionHandler:](CAMPDFConverter, "convertToPDFAndWrite:documentName:completionHandler:", v1, v2, v3);

}

void __78__CAMDocumentScanFlowController__asyncConvertToPDFAndWrite_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78__CAMDocumentScanFlowController__asyncConvertToPDFAndWrite_completionHandler___block_invoke_3;
  v6[3] = &unk_1EA329298;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __78__CAMDocumentScanFlowController__asyncConvertToPDFAndWrite_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (id)nameForDocumentWithDate:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (objc_class *)MEMORY[0x1E0CB3578];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setDateStyle:", 1);
  objc_msgSend(v5, "setTimeStyle:", 0);
  objc_msgSend(v5, "stringFromDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3578], "localizedStringFromDate:dateStyle:timeStyle:", v4, 0, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  CAMLocalizedFrameworkString(CFSTR("DOCUMENT_SCANNING_FILENAME"), CFSTR("Document Scanning component of the file name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CAMLocalizedFrameworkString(CFSTR("DOCUMENT_SCANNING_FILENAME_FORMAT_STRING"), CFSTR("General format string for the file name. English format is DOCUMENT_SCANNING_FILENAME DATE at TIME"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%@%@%@"), 0, v8, v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("-"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), CFSTR("."));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (CAMDocumentScanFlowControllerDelegate)documentFlowDelegate
{
  return (CAMDocumentScanFlowControllerDelegate *)objc_loadWeakRetained((id *)&self->_documentFlowDelegate);
}

- (void)setDocumentFlowDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_documentFlowDelegate, a3);
}

- (NSURL)_url
{
  return self->__url;
}

- (void)set_url:(id)a3
{
  objc_storeStrong((id *)&self->__url, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__url, 0);
  objc_destroyWeak((id *)&self->_documentFlowDelegate);
}

- (void)_handlePDFResults:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DB760000, log, OS_LOG_TYPE_ERROR, "Document scanner: error converting scanned images to PDF", v1, 2u);
}

@end
