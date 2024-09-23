@implementation WFScanMachineReadableCodeActionUIKitUserInterface

- (void)showWithCompletionHandler:(id)a3
{
  id v5;
  id *v6;
  void *v7;
  id *v8;
  void *v9;
  id *v10;
  void *v11;
  id *v12;
  void *v13;
  id *v14;
  void *v15;
  id v16;
  id *v17;
  void *v18;
  id v19;
  id *v20;
  void *v21;
  id v22;
  id *v23;
  void *v24;
  id v25;
  id *v26;
  void *v27;
  id v28;
  id *v29;
  void *v30;
  id v31;
  id *v32;
  void *v33;
  id v34;
  id *v35;
  void *v36;
  id v37;
  id *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  WFScanMachineReadableCodeActionUIKitUserInterface *v71;
  id v72;
  id v73;
  id v74;
  id v75;
  void *v76;
  _QWORD block[4];
  id v78;
  WFScanMachineReadableCodeActionUIKitUserInterface *v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t v83;
  _QWORD v84[12];
  id v85;
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFScanMachineReadableCodeActionUIKitUserInterface.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    v5 = 0;
  }
  v76 = v5;
  -[WFScanMachineReadableCodeActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:");
  v80 = 0;
  v81 = &v80;
  v82 = 0x2020000000;
  v6 = (id *)getAVMetadataObjectTypeUPCECodeSymbolLoc_ptr;
  v83 = getAVMetadataObjectTypeUPCECodeSymbolLoc_ptr;
  if (!getAVMetadataObjectTypeUPCECodeSymbolLoc_ptr)
  {
    v7 = AVFoundationLibrary();
    v6 = (id *)dlsym(v7, "AVMetadataObjectTypeUPCECode");
    v81[3] = (uint64_t)v6;
    getAVMetadataObjectTypeUPCECodeSymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v80, 8);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AVMetadataObjectType getAVMetadataObjectTypeUPCECode(void)");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInFunction:file:lineNumber:description:", v46, CFSTR("WFScanMachineReadableCodeActionUIKitUserInterface.m"), 19, CFSTR("%s"), dlerror());

    goto LABEL_56;
  }
  v75 = *v6;
  v84[0] = v75;
  v80 = 0;
  v81 = &v80;
  v82 = 0x2020000000;
  v8 = (id *)getAVMetadataObjectTypeCode39CodeSymbolLoc_ptr;
  v83 = getAVMetadataObjectTypeCode39CodeSymbolLoc_ptr;
  if (!getAVMetadataObjectTypeCode39CodeSymbolLoc_ptr)
  {
    v9 = AVFoundationLibrary();
    v8 = (id *)dlsym(v9, "AVMetadataObjectTypeCode39Code");
    v81[3] = (uint64_t)v8;
    getAVMetadataObjectTypeCode39CodeSymbolLoc_ptr = (uint64_t)v8;
  }
  _Block_object_dispose(&v80, 8);
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AVMetadataObjectType getAVMetadataObjectTypeCode39Code(void)");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInFunction:file:lineNumber:description:", v48, CFSTR("WFScanMachineReadableCodeActionUIKitUserInterface.m"), 20, CFSTR("%s"), dlerror());

    goto LABEL_56;
  }
  v74 = *v8;
  v84[1] = v74;
  v80 = 0;
  v81 = &v80;
  v82 = 0x2020000000;
  v10 = (id *)getAVMetadataObjectTypeCode39Mod43CodeSymbolLoc_ptr;
  v83 = getAVMetadataObjectTypeCode39Mod43CodeSymbolLoc_ptr;
  if (!getAVMetadataObjectTypeCode39Mod43CodeSymbolLoc_ptr)
  {
    v11 = AVFoundationLibrary();
    v10 = (id *)dlsym(v11, "AVMetadataObjectTypeCode39Mod43Code");
    v81[3] = (uint64_t)v10;
    getAVMetadataObjectTypeCode39Mod43CodeSymbolLoc_ptr = (uint64_t)v10;
  }
  _Block_object_dispose(&v80, 8);
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AVMetadataObjectType getAVMetadataObjectTypeCode39Mod43Code(void)");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "handleFailureInFunction:file:lineNumber:description:", v50, CFSTR("WFScanMachineReadableCodeActionUIKitUserInterface.m"), 21, CFSTR("%s"), dlerror());

    goto LABEL_56;
  }
  v73 = *v10;
  v84[2] = v73;
  v80 = 0;
  v81 = &v80;
  v82 = 0x2020000000;
  v12 = (id *)getAVMetadataObjectTypeEAN13CodeSymbolLoc_ptr;
  v83 = getAVMetadataObjectTypeEAN13CodeSymbolLoc_ptr;
  if (!getAVMetadataObjectTypeEAN13CodeSymbolLoc_ptr)
  {
    v13 = AVFoundationLibrary();
    v12 = (id *)dlsym(v13, "AVMetadataObjectTypeEAN13Code");
    v81[3] = (uint64_t)v12;
    getAVMetadataObjectTypeEAN13CodeSymbolLoc_ptr = (uint64_t)v12;
  }
  _Block_object_dispose(&v80, 8);
  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AVMetadataObjectType getAVMetadataObjectTypeEAN13Code(void)");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "handleFailureInFunction:file:lineNumber:description:", v52, CFSTR("WFScanMachineReadableCodeActionUIKitUserInterface.m"), 22, CFSTR("%s"), dlerror());

    goto LABEL_56;
  }
  v72 = *v12;
  v84[3] = v72;
  v80 = 0;
  v81 = &v80;
  v82 = 0x2020000000;
  v14 = (id *)getAVMetadataObjectTypeEAN8CodeSymbolLoc_ptr;
  v83 = getAVMetadataObjectTypeEAN8CodeSymbolLoc_ptr;
  if (!getAVMetadataObjectTypeEAN8CodeSymbolLoc_ptr)
  {
    v15 = AVFoundationLibrary();
    v14 = (id *)dlsym(v15, "AVMetadataObjectTypeEAN8Code");
    v81[3] = (uint64_t)v14;
    getAVMetadataObjectTypeEAN8CodeSymbolLoc_ptr = (uint64_t)v14;
  }
  _Block_object_dispose(&v80, 8);
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AVMetadataObjectType getAVMetadataObjectTypeEAN8Code(void)");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "handleFailureInFunction:file:lineNumber:description:", v54, CFSTR("WFScanMachineReadableCodeActionUIKitUserInterface.m"), 23, CFSTR("%s"), dlerror());

    goto LABEL_56;
  }
  v16 = *v14;
  v84[4] = v16;
  v80 = 0;
  v81 = &v80;
  v82 = 0x2020000000;
  v17 = (id *)getAVMetadataObjectTypeCode93CodeSymbolLoc_ptr;
  v83 = getAVMetadataObjectTypeCode93CodeSymbolLoc_ptr;
  if (!getAVMetadataObjectTypeCode93CodeSymbolLoc_ptr)
  {
    v18 = AVFoundationLibrary();
    v17 = (id *)dlsym(v18, "AVMetadataObjectTypeCode93Code");
    v81[3] = (uint64_t)v17;
    getAVMetadataObjectTypeCode93CodeSymbolLoc_ptr = (uint64_t)v17;
  }
  _Block_object_dispose(&v80, 8);
  if (!v17)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AVMetadataObjectType getAVMetadataObjectTypeCode93Code(void)");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "handleFailureInFunction:file:lineNumber:description:", v56, CFSTR("WFScanMachineReadableCodeActionUIKitUserInterface.m"), 24, CFSTR("%s"), dlerror());

    goto LABEL_56;
  }
  v19 = *v17;
  v84[5] = v19;
  v80 = 0;
  v81 = &v80;
  v82 = 0x2020000000;
  v20 = (id *)getAVMetadataObjectTypeCode128CodeSymbolLoc_ptr;
  v83 = getAVMetadataObjectTypeCode128CodeSymbolLoc_ptr;
  if (!getAVMetadataObjectTypeCode128CodeSymbolLoc_ptr)
  {
    v21 = AVFoundationLibrary();
    v20 = (id *)dlsym(v21, "AVMetadataObjectTypeCode128Code");
    v81[3] = (uint64_t)v20;
    getAVMetadataObjectTypeCode128CodeSymbolLoc_ptr = (uint64_t)v20;
  }
  _Block_object_dispose(&v80, 8);
  if (!v20)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AVMetadataObjectType getAVMetadataObjectTypeCode128Code(void)");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "handleFailureInFunction:file:lineNumber:description:", v58, CFSTR("WFScanMachineReadableCodeActionUIKitUserInterface.m"), 25, CFSTR("%s"), dlerror());

    goto LABEL_56;
  }
  v22 = *v20;
  v84[6] = v22;
  v80 = 0;
  v81 = &v80;
  v82 = 0x2020000000;
  v23 = (id *)getAVMetadataObjectTypePDF417CodeSymbolLoc_ptr;
  v83 = getAVMetadataObjectTypePDF417CodeSymbolLoc_ptr;
  if (!getAVMetadataObjectTypePDF417CodeSymbolLoc_ptr)
  {
    v24 = AVFoundationLibrary();
    v23 = (id *)dlsym(v24, "AVMetadataObjectTypePDF417Code");
    v81[3] = (uint64_t)v23;
    getAVMetadataObjectTypePDF417CodeSymbolLoc_ptr = (uint64_t)v23;
  }
  _Block_object_dispose(&v80, 8);
  if (!v23)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AVMetadataObjectType getAVMetadataObjectTypePDF417Code(void)");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "handleFailureInFunction:file:lineNumber:description:", v60, CFSTR("WFScanMachineReadableCodeActionUIKitUserInterface.m"), 26, CFSTR("%s"), dlerror());

    goto LABEL_56;
  }
  v25 = *v23;
  v84[7] = v25;
  v80 = 0;
  v81 = &v80;
  v82 = 0x2020000000;
  v26 = (id *)getAVMetadataObjectTypeQRCodeSymbolLoc_ptr;
  v83 = getAVMetadataObjectTypeQRCodeSymbolLoc_ptr;
  if (!getAVMetadataObjectTypeQRCodeSymbolLoc_ptr)
  {
    v27 = AVFoundationLibrary();
    v26 = (id *)dlsym(v27, "AVMetadataObjectTypeQRCode");
    v81[3] = (uint64_t)v26;
    getAVMetadataObjectTypeQRCodeSymbolLoc_ptr = (uint64_t)v26;
  }
  v71 = self;
  _Block_object_dispose(&v80, 8);
  if (!v26)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AVMetadataObjectType getAVMetadataObjectTypeQRCode(void)");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "handleFailureInFunction:file:lineNumber:description:", v62, CFSTR("WFScanMachineReadableCodeActionUIKitUserInterface.m"), 27, CFSTR("%s"), dlerror());

    goto LABEL_56;
  }
  v28 = *v26;
  v84[8] = v28;
  v80 = 0;
  v81 = &v80;
  v82 = 0x2020000000;
  v29 = (id *)getAVMetadataObjectTypeAztecCodeSymbolLoc_ptr;
  v83 = getAVMetadataObjectTypeAztecCodeSymbolLoc_ptr;
  if (!getAVMetadataObjectTypeAztecCodeSymbolLoc_ptr)
  {
    v30 = AVFoundationLibrary();
    v29 = (id *)dlsym(v30, "AVMetadataObjectTypeAztecCode");
    v81[3] = (uint64_t)v29;
    getAVMetadataObjectTypeAztecCodeSymbolLoc_ptr = (uint64_t)v29;
  }
  _Block_object_dispose(&v80, 8);
  if (!v29)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AVMetadataObjectType getAVMetadataObjectTypeAztecCode(void)");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "handleFailureInFunction:file:lineNumber:description:", v64, CFSTR("WFScanMachineReadableCodeActionUIKitUserInterface.m"), 28, CFSTR("%s"), dlerror());

    goto LABEL_56;
  }
  v31 = *v29;
  v84[9] = v31;
  v80 = 0;
  v81 = &v80;
  v82 = 0x2020000000;
  v32 = (id *)getAVMetadataObjectTypeInterleaved2of5CodeSymbolLoc_ptr;
  v83 = getAVMetadataObjectTypeInterleaved2of5CodeSymbolLoc_ptr;
  if (!getAVMetadataObjectTypeInterleaved2of5CodeSymbolLoc_ptr)
  {
    v33 = AVFoundationLibrary();
    v32 = (id *)dlsym(v33, "AVMetadataObjectTypeInterleaved2of5Code");
    v81[3] = (uint64_t)v32;
    getAVMetadataObjectTypeInterleaved2of5CodeSymbolLoc_ptr = (uint64_t)v32;
  }
  _Block_object_dispose(&v80, 8);
  if (!v32)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AVMetadataObjectType getAVMetadataObjectTypeInterleaved2of5Code(void)");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "handleFailureInFunction:file:lineNumber:description:", v66, CFSTR("WFScanMachineReadableCodeActionUIKitUserInterface.m"), 29, CFSTR("%s"), dlerror());

    goto LABEL_56;
  }
  v34 = *v32;
  v84[10] = v34;
  v80 = 0;
  v81 = &v80;
  v82 = 0x2020000000;
  v35 = (id *)getAVMetadataObjectTypeITF14CodeSymbolLoc_ptr;
  v83 = getAVMetadataObjectTypeITF14CodeSymbolLoc_ptr;
  if (!getAVMetadataObjectTypeITF14CodeSymbolLoc_ptr)
  {
    v36 = AVFoundationLibrary();
    v35 = (id *)dlsym(v36, "AVMetadataObjectTypeITF14Code");
    v81[3] = (uint64_t)v35;
    getAVMetadataObjectTypeITF14CodeSymbolLoc_ptr = (uint64_t)v35;
  }
  _Block_object_dispose(&v80, 8);
  if (!v35)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AVMetadataObjectType getAVMetadataObjectTypeITF14Code(void)");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "handleFailureInFunction:file:lineNumber:description:", v68, CFSTR("WFScanMachineReadableCodeActionUIKitUserInterface.m"), 30, CFSTR("%s"), dlerror());

    goto LABEL_56;
  }
  v37 = *v35;
  v84[11] = v37;
  v80 = 0;
  v81 = &v80;
  v82 = 0x2020000000;
  v38 = (id *)getAVMetadataObjectTypeDataMatrixCodeSymbolLoc_ptr;
  v83 = getAVMetadataObjectTypeDataMatrixCodeSymbolLoc_ptr;
  if (!getAVMetadataObjectTypeDataMatrixCodeSymbolLoc_ptr)
  {
    v39 = AVFoundationLibrary();
    v38 = (id *)dlsym(v39, "AVMetadataObjectTypeDataMatrixCode");
    v81[3] = (uint64_t)v38;
    getAVMetadataObjectTypeDataMatrixCodeSymbolLoc_ptr = (uint64_t)v38;
  }
  _Block_object_dispose(&v80, 8);
  if (!v38)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AVMetadataObjectType getAVMetadataObjectTypeDataMatrixCode(void)");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "handleFailureInFunction:file:lineNumber:description:", v70, CFSTR("WFScanMachineReadableCodeActionUIKitUserInterface.m"), 31, CFSTR("%s"), dlerror());

LABEL_56:
    __break(1u);
  }
  v85 = *v38;
  v40 = (void *)MEMORY[0x24BDBCE30];
  v41 = v85;
  objc_msgSend(v40, "arrayWithObjects:count:", v84, 13);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __79__WFScanMachineReadableCodeActionUIKitUserInterface_showWithCompletionHandler___block_invoke;
  block[3] = &unk_24E3439C0;
  v78 = v42;
  v79 = v71;
  v43 = v42;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  WFScanMachineReadableCodeActionUIKitUserInterface *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __93__WFScanMachineReadableCodeActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v5[3] = &unk_24E3439E8;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)WFScanMachineReadableCodeActionUIKitUserInterface;
  v5[0] = MEMORY[0x24BDAC760];
  v3 = v7;
  -[WFEmbeddableActionUserInterface cancelPresentationWithCompletionHandler:](&v4, sel_cancelPresentationWithCompletionHandler_, v5);

}

- (void)finishWithCode:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  -[WFScanMachineReadableCodeActionUIKitUserInterface completionHandler](self, "completionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WFScanMachineReadableCodeActionUIKitUserInterface completionHandler](self, "completionHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v8)[2](v8, v9, v6);

  }
  -[WFScanMachineReadableCodeActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", 0);

}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

uint64_t __93__WFScanMachineReadableCodeActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithCode:error:", 0, v3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __79__WFScanMachineReadableCodeActionUIKitUserInterface_showWithCompletionHandler___block_invoke(uint64_t a1)
{
  CDZQRScanningViewController *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];

  v2 = -[CDZQRScanningViewController initWithMetadataObjectTypes:]([CDZQRScanningViewController alloc], "initWithMetadataObjectTypes:", *(_QWORD *)(a1 + 32));
  WFLocalizedString(CFSTR("Scan Code"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDZQRScanningViewController setTitle:](v2, "setTitle:", v3);

  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __79__WFScanMachineReadableCodeActionUIKitUserInterface_showWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_24E342D50;
  v8[4] = *(_QWORD *)(a1 + 40);
  -[CDZQRScanningViewController setResultBlock:](v2, "setResultBlock:", v8);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __79__WFScanMachineReadableCodeActionUIKitUserInterface_showWithCompletionHandler___block_invoke_4;
  v7[3] = &unk_24E342D78;
  v7[4] = *(_QWORD *)(a1 + 40);
  -[CDZQRScanningViewController setErrorBlock:](v2, "setErrorBlock:", v7);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __79__WFScanMachineReadableCodeActionUIKitUserInterface_showWithCompletionHandler___block_invoke_6;
  v6[3] = &unk_24E343958;
  v6[4] = *(_QWORD *)(a1 + 40);
  -[CDZQRScanningViewController setCancelBlock:](v2, "setCancelBlock:", v6);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v2);
  objc_msgSend(v5, "setModalPresentationStyle:", 0);
  objc_msgSend(*(id *)(a1 + 40), "setNavigationController:", v5);
  objc_msgSend(*(id *)(a1 + 40), "presentContent:", v5);

}

void __79__WFScanMachineReadableCodeActionUIKitUserInterface_showWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __79__WFScanMachineReadableCodeActionUIKitUserInterface_showWithCompletionHandler___block_invoke_3;
  v7[3] = &unk_24E3439C0;
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v7);

}

void __79__WFScanMachineReadableCodeActionUIKitUserInterface_showWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __79__WFScanMachineReadableCodeActionUIKitUserInterface_showWithCompletionHandler___block_invoke_5;
  v6[3] = &unk_24E3439C0;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v6);

}

void __79__WFScanMachineReadableCodeActionUIKitUserInterface_showWithCompletionHandler___block_invoke_6(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __79__WFScanMachineReadableCodeActionUIKitUserInterface_showWithCompletionHandler___block_invoke_7;
  v3[3] = &unk_24E343958;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, v3);

}

void __79__WFScanMachineReadableCodeActionUIKitUserInterface_showWithCompletionHandler___block_invoke_7(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithCode:error:", 0, v2);

}

uint64_t __79__WFScanMachineReadableCodeActionUIKitUserInterface_showWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithCode:error:", 0, *(_QWORD *)(a1 + 40));
}

void __79__WFScanMachineReadableCodeActionUIKitUserInterface_showWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE00FD0]), "initWithMachineReadableCodeObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "finishWithCode:error:", v2, 0);

}

@end
