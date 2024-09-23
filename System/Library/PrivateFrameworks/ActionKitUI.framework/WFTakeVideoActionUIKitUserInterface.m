@implementation WFTakeVideoActionUIKitUserInterface

- (void)showWithQuality:(id)a3 device:(id)a4 startImmediately:(BOOL)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD block[5];
  id v20;
  id v21;
  BOOL v22;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTakeVideoActionUIKitUserInterface.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));

    if (v13)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTakeVideoActionUIKitUserInterface.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTakeVideoActionUIKitUserInterface.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("quality"));

  if (!v12)
    goto LABEL_6;
LABEL_3:
  if (!v13)
    goto LABEL_7;
LABEL_4:
  -[WFTakeVideoActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", v13);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __97__WFTakeVideoActionUIKitUserInterface_showWithQuality_device_startImmediately_completionHandler___block_invoke;
  block[3] = &unk_24E343308;
  block[4] = self;
  v20 = v12;
  v21 = v11;
  v22 = a5;
  v14 = v11;
  v15 = v12;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  WFTakeVideoActionUIKitUserInterface *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __79__WFTakeVideoActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v5[3] = &unk_24E3439E8;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)WFTakeVideoActionUIKitUserInterface;
  v5[0] = MEMORY[0x24BDAC760];
  v3 = v7;
  -[WFEmbeddableActionUserInterface cancelPresentationWithCompletionHandler:](&v4, sel_cancelPresentationWithCompletionHandler_, v5);

}

- (void)finishWithOutput:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  -[WFTakeVideoActionUIKitUserInterface completionHandler](self, "completionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WFTakeVideoActionUIKitUserInterface completionHandler](self, "completionHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v8)[2](v8, v9, v6);

  }
  -[WFTakeVideoActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", 0);

}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;

  v6 = *MEMORY[0x24BEBE318];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BEBE310]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEC14A0], "typeWithString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fileExtension");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(v9, "wfFileType");
    v13 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v13;
  }
  v14 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v11, "fileExtension");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "wf_datedFilenameWithTypeString:fileExtension:", CFSTR("Movie"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE194F8], "fileWithURL:options:ofType:proposedFilename:", v9, 3, 0, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __91__WFTakeVideoActionUIKitUserInterface_imagePickerController_didFinishPickingMediaWithInfo___block_invoke;
  v19[3] = &unk_24E3439C0;
  v19[4] = self;
  v20 = v17;
  v18 = v17;
  objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, v19);

}

- (void)imagePickerControllerDidCancel:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __70__WFTakeVideoActionUIKitUserInterface_imagePickerControllerDidCancel___block_invoke;
  v3[3] = &unk_24E343958;
  v3[4] = self;
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, v3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
}

void __70__WFTakeVideoActionUIKitUserInterface_imagePickerControllerDidCancel___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithOutput:error:", 0, v2);

}

uint64_t __91__WFTakeVideoActionUIKitUserInterface_imagePickerController_didFinishPickingMediaWithInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithOutput:error:", *(_QWORD *)(a1 + 40), 0);
}

uint64_t __79__WFTakeVideoActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithOutput:error:", 0, v3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __97__WFTakeVideoActionUIKitUserInterface_showWithQuality_device_startImmediately_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void (**v6)(_QWORD);
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  id v11;
  char v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BEBD658]);
  objc_msgSend(v2, "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v2, "setSourceType:", 1);
  objc_msgSend(v2, "setCameraDevice:", objc_msgSend((id)objc_opt_class(), "cameraDeviceFromString:", *(_QWORD *)(a1 + 40)));
  objc_msgSend(v2, "setVideoQuality:", objc_msgSend((id)objc_opt_class(), "qualityFromString:", *(_QWORD *)(a1 + 48)));
  objc_msgSend((id)*MEMORY[0x24BDF84B8], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMediaTypes:", v4);

  objc_msgSend(v2, "setCameraCaptureMode:", 1);
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __97__WFTakeVideoActionUIKitUserInterface_showWithQuality_device_startImmediately_completionHandler___block_invoke_2;
  v10 = &unk_24E3437E0;
  v12 = *(_BYTE *)(a1 + 56);
  v5 = v2;
  v11 = v5;
  v6 = (void (**)(_QWORD))_Block_copy(&v7);
  if ((objc_msgSend(*(id *)(a1 + 32), "presentContent:completion:", v5, v6, v7, v8, v9, v10) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "presentContent:", v5);
    v6[2](v6);
  }

}

uint64_t __97__WFTakeVideoActionUIKitUserInterface_showWithQuality_device_startImmediately_completionHandler___block_invoke_2(uint64_t result)
{
  if (*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "startVideoCapture");
  return result;
}

+ (int64_t)qualityFromString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE01118]) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE01110]))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (int64_t)cameraDeviceFromString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if (!objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE01108])
    || (v4 = 0, (objc_msgSend(MEMORY[0x24BEBD658], "isCameraDeviceAvailable:", 0) & 1) == 0))
  {
    if (!objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE01100])
      || (v4 = 1, (objc_msgSend(MEMORY[0x24BEBD658], "isCameraDeviceAvailable:", 1) & 1) == 0))
    {
      v4 = 0;
    }
  }

  return v4;
}

@end
