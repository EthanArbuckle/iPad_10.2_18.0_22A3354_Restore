@implementation WFTakePhotoImmediateModeManager

- (WFTakePhotoImmediateModeManager)initWithCameraPosition:(int64_t)a3 delegate:(id)a4
{
  id v7;
  WFTakePhotoImmediateModeManager *v8;
  WFTakePhotoImmediateModeManager *v9;
  uint64_t v10;
  WFTakePhotoImmediateModeManager *v11;
  void *v13;
  objc_super v14;

  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFTakePhotoImmediateModeManager.m"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

  }
  v14.receiver = self;
  v14.super_class = (Class)WFTakePhotoImmediateModeManager;
  v8 = -[WFTakePhotoImmediateModeManager init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    v10 = 2 * (a3 == 1);
    if (!a3)
      v10 = 1;
    v8->_position = v10;
    objc_storeWeak((id *)&v8->_delegate, v7);
    v11 = v9;
  }

  return v9;
}

- (void)startSessionWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_cameraIsReady_, *MEMORY[0x24BDB1AC8], 0);

  -[WFTakePhotoImmediateModeManager configuredCaptureDeviceWithError:](self, "configuredCaptureDeviceWithError:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*a3)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2050000000;
    v7 = (void *)getAVCapturePhotoOutputClass_softClass;
    v16 = getAVCapturePhotoOutputClass_softClass;
    if (!getAVCapturePhotoOutputClass_softClass)
    {
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __getAVCapturePhotoOutputClass_block_invoke;
      v12[3] = &unk_24E343A50;
      v12[4] = &v13;
      __getAVCapturePhotoOutputClass_block_invoke((uint64_t)v12);
      v7 = (void *)v14[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v13, 8);
    v9 = (void *)objc_opt_new();
    -[WFTakePhotoImmediateModeManager setOutput:](self, "setOutput:", v9);
    -[WFTakePhotoImmediateModeManager captureSessionWithDevice:output:error:](self, "captureSessionWithDevice:output:error:", v6, v9, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTakePhotoImmediateModeManager setSession:](self, "setSession:", v10);

    -[WFTakePhotoImmediateModeManager session](self, "session");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "startRunning");

  }
}

- (void)takePhotoWithError:(id *)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  -[WFTakePhotoImmediateModeManager output](self, "output", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v5 = (void *)getAVCapturePhotoSettingsClass_softClass;
  v12 = getAVCapturePhotoSettingsClass_softClass;
  if (!getAVCapturePhotoSettingsClass_softClass)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __getAVCapturePhotoSettingsClass_block_invoke;
    v8[3] = &unk_24E343A50;
    v8[4] = &v9;
    __getAVCapturePhotoSettingsClass_block_invoke((uint64_t)v8);
    v5 = (void *)v10[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v9, 8);
  objc_msgSend(v6, "photoSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "capturePhotoWithSettings:delegate:", v7, self);

}

- (void)stop
{
  void *v3;

  -[WFTakePhotoImmediateModeManager session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopRunning");

  -[WFTakePhotoImmediateModeManager setSession:](self, "setSession:", 0);
  -[WFTakePhotoImmediateModeManager setOutput:](self, "setOutput:", 0);
}

- (id)configuredCaptureDeviceWithError:(id *)a3
{
  id *v5;
  void *v6;
  id v7;
  id *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id *v15;
  void *v16;
  id v17;
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
  void *v28;
  void *v29;
  id v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  id v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v38 = 0;
  v39 = (uint64_t)&v38;
  v40 = 0x2020000000;
  v5 = (id *)getAVCaptureDeviceTypeBuiltInDualCameraSymbolLoc_ptr;
  v41 = (void *)getAVCaptureDeviceTypeBuiltInDualCameraSymbolLoc_ptr;
  if (!getAVCaptureDeviceTypeBuiltInDualCameraSymbolLoc_ptr)
  {
    v6 = AVFoundationLibrary_2388();
    v5 = (id *)dlsym(v6, "AVCaptureDeviceTypeBuiltInDualCamera");
    *(_QWORD *)(v39 + 24) = v5;
    getAVCaptureDeviceTypeBuiltInDualCameraSymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v38, 8);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AVCaptureDeviceType getAVCaptureDeviceTypeBuiltInDualCamera(void)");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, CFSTR("WFTakePhotoImmediateModeManager.m"), 20, CFSTR("%s"), dlerror());

    goto LABEL_27;
  }
  v7 = *v5;
  v51 = v7;
  v38 = 0;
  v39 = (uint64_t)&v38;
  v40 = 0x2020000000;
  v8 = (id *)getAVCaptureDeviceTypeBuiltInWideAngleCameraSymbolLoc_ptr;
  v41 = (void *)getAVCaptureDeviceTypeBuiltInWideAngleCameraSymbolLoc_ptr;
  if (!getAVCaptureDeviceTypeBuiltInWideAngleCameraSymbolLoc_ptr)
  {
    v9 = AVFoundationLibrary_2388();
    v8 = (id *)dlsym(v9, "AVCaptureDeviceTypeBuiltInWideAngleCamera");
    *(_QWORD *)(v39 + 24) = v8;
    getAVCaptureDeviceTypeBuiltInWideAngleCameraSymbolLoc_ptr = (uint64_t)v8;
  }
  _Block_object_dispose(&v38, 8);
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AVCaptureDeviceType getAVCaptureDeviceTypeBuiltInWideAngleCamera(void)");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, CFSTR("WFTakePhotoImmediateModeManager.m"), 21, CFSTR("%s"), dlerror());

    goto LABEL_27;
  }
  v52 = *v8;
  v10 = (void *)MEMORY[0x24BDBCE30];
  v11 = v52;
  objc_msgSend(v10, "arrayWithObjects:count:", &v51, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = 0;
  v44 = &v43;
  v45 = 0x2050000000;
  v13 = (void *)getAVCaptureDeviceDiscoverySessionClass_softClass;
  v46 = getAVCaptureDeviceDiscoverySessionClass_softClass;
  if (!getAVCaptureDeviceDiscoverySessionClass_softClass)
  {
    v38 = MEMORY[0x24BDAC760];
    v39 = 3221225472;
    v40 = (uint64_t)__getAVCaptureDeviceDiscoverySessionClass_block_invoke;
    v41 = &unk_24E343A50;
    v42 = &v43;
    __getAVCaptureDeviceDiscoverySessionClass_block_invoke((uint64_t)&v38);
    v13 = (void *)v44[3];
  }
  v14 = objc_retainAutorelease(v13);
  _Block_object_dispose(&v43, 8);
  v38 = 0;
  v39 = (uint64_t)&v38;
  v40 = 0x2020000000;
  v15 = (id *)getAVMediaTypeVideoSymbolLoc_ptr;
  v41 = (void *)getAVMediaTypeVideoSymbolLoc_ptr;
  if (!getAVMediaTypeVideoSymbolLoc_ptr)
  {
    v16 = AVFoundationLibrary_2388();
    v15 = (id *)dlsym(v16, "AVMediaTypeVideo");
    *(_QWORD *)(v39 + 24) = v15;
    getAVMediaTypeVideoSymbolLoc_ptr = (uint64_t)v15;
  }
  _Block_object_dispose(&v38, 8);
  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AVMediaType getAVMediaTypeVideo(void)");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInFunction:file:lineNumber:description:", v37, CFSTR("WFTakePhotoImmediateModeManager.m"), 22, CFSTR("%s"), dlerror());

LABEL_27:
    __break(1u);
  }
  v17 = *v15;
  objc_msgSend(v14, "discoverySessionWithDeviceTypes:mediaType:position:", v12, v17, -[WFTakePhotoImmediateModeManager position](self, "position"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "devices");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    if (objc_msgSend(v20, "lockForConfiguration:", 0))
    {
      if ((objc_msgSend(v20, "isFocusModeSupported:", 2) & 1) != 0)
      {
        v21 = 2;
      }
      else
      {
        if (!objc_msgSend(v20, "isFocusModeSupported:", 1))
        {
LABEL_22:
          objc_msgSend(v20, "unlockForConfiguration");
          v30 = v20;
          goto LABEL_23;
        }
        v21 = 1;
      }
      objc_msgSend(v20, "setFocusMode:", v21);
      goto LABEL_22;
    }
    v26 = (void *)MEMORY[0x24BDD1540];
    getAVFoundationErrorDomain();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("The camera is already in use."));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v28;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", v27, -11817, v29);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = (void *)MEMORY[0x24BDD1540];
    getAVFoundationErrorDomain();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("No suitable camera was detected on this device."));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v24;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, -11814, v25);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  v30 = 0;
LABEL_23:

  return v30;
}

- (id)captureSessionWithDevice:(id)a3 output:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id result;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v8 = a3;
  v9 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2050000000;
  v10 = (void *)getAVCaptureSessionClass_softClass;
  v30 = getAVCaptureSessionClass_softClass;
  if (!getAVCaptureSessionClass_softClass)
  {
    v22 = MEMORY[0x24BDAC760];
    v23 = 3221225472;
    v24 = (uint64_t)__getAVCaptureSessionClass_block_invoke;
    v25 = &unk_24E343A50;
    v26 = &v27;
    __getAVCaptureSessionClass_block_invoke((uint64_t)&v22);
    v10 = (void *)v28[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v27, 8);
  v12 = (void *)objc_opt_new();
  v22 = 0;
  v23 = (uint64_t)&v22;
  v24 = 0x2020000000;
  v13 = (_QWORD *)getAVCaptureSessionPresetPhotoSymbolLoc_ptr;
  v25 = (void *)getAVCaptureSessionPresetPhotoSymbolLoc_ptr;
  if (!getAVCaptureSessionPresetPhotoSymbolLoc_ptr)
  {
    v14 = AVFoundationLibrary_2388();
    v13 = dlsym(v14, "AVCaptureSessionPresetPhoto");
    *(_QWORD *)(v23 + 24) = v13;
    getAVCaptureSessionPresetPhotoSymbolLoc_ptr = (uint64_t)v13;
  }
  _Block_object_dispose(&v22, 8);
  if (v13)
  {
    objc_msgSend(v12, "setSessionPreset:", *v13);
    v27 = 0;
    v28 = &v27;
    v29 = 0x2050000000;
    v15 = (void *)getAVCaptureDeviceInputClass_softClass;
    v30 = getAVCaptureDeviceInputClass_softClass;
    if (!getAVCaptureDeviceInputClass_softClass)
    {
      v22 = MEMORY[0x24BDAC760];
      v23 = 3221225472;
      v24 = (uint64_t)__getAVCaptureDeviceInputClass_block_invoke;
      v25 = &unk_24E343A50;
      v26 = &v27;
      __getAVCaptureDeviceInputClass_block_invoke((uint64_t)&v22);
      v15 = (void *)v28[3];
    }
    v16 = objc_retainAutorelease(v15);
    _Block_object_dispose(&v27, 8);
    objc_msgSend(v16, "deviceInputWithDevice:error:", v8, a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v12, "addInput:", v17);
      objc_msgSend(v12, "addOutput:", v9);
      -[WFTakePhotoImmediateModeManager setSession:](self, "setSession:", v12);
      v18 = v12;
    }
    else
    {
      v18 = 0;
    }

    return v18;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AVCaptureSessionPreset getAVCaptureSessionPresetPhoto(void)");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("WFTakePhotoImmediateModeManager.m"), 24, CFSTR("%s"), dlerror(), v22);

    __break(1u);
  }
  return result;
}

- (void)cameraIsReady:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[WFTakePhotoImmediateModeManager delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[WFTakePhotoImmediateModeManager delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "managerDidBecomeReady:", self);

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDB1AC8], 0);

  v4.receiver = self;
  v4.super_class = (Class)WFTakePhotoImmediateModeManager;
  -[WFTakePhotoImmediateModeManager dealloc](&v4, sel_dealloc);
}

- (void)captureOutput:(id)a3 didFinishProcessingPhoto:(id)a4 error:(id)a5
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a4;
  v7 = a5;
  -[WFTakePhotoImmediateModeManager delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[WFTakePhotoImmediateModeManager delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "manager:didFinishWithPhoto:error:", self, v11, v7);

  }
}

- (WFTakePhotoImmediateModeDelegate)delegate
{
  return (WFTakePhotoImmediateModeDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)position
{
  return self->_position;
}

- (void)setPosition:(int64_t)a3
{
  self->_position = a3;
}

- (AVCaptureSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (AVCapturePhotoOutput)output
{
  return self->_output;
}

- (void)setOutput:(id)a3
{
  objc_storeStrong((id *)&self->_output, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
