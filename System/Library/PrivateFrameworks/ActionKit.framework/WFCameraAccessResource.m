@implementation WFCameraAccessResource

- (id)associatedAppIdentifier
{
  return CFSTR("com.apple.camera");
}

- (unint64_t)status
{
  return 4;
}

- (id)localizedErrorReasonForStatus:(unint64_t)a3
{
  void *v3;
  objc_super v5;

  if (a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)WFCameraAccessResource;
    -[WFAccessResource localizedErrorReasonForStatus:](&v5, sel_localizedErrorReasonForStatus_);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WFLocalizedString(CFSTR("This device does not have a camera."));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)localizedImportErrorReasonForStatus:(unint64_t)a3
{
  void *v3;
  objc_super v5;

  if (a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)WFCameraAccessResource;
    -[WFAccessResource localizedImportErrorReasonForStatus:](&v5, sel_localizedImportErrorReasonForStatus_);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WFLocalizedString(CFSTR("This shortcut requires a camera, which this device does not have."));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)makeAvailableWithUserInterface:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v6 = a3;
  v7 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2050000000;
  v8 = (void *)getAVCaptureDeviceClass_softClass;
  v27 = getAVCaptureDeviceClass_softClass;
  v9 = MEMORY[0x24BDAC760];
  if (!getAVCaptureDeviceClass_softClass)
  {
    v19 = MEMORY[0x24BDAC760];
    v20 = 3221225472;
    v21 = (uint64_t)__getAVCaptureDeviceClass_block_invoke;
    v22 = &unk_24F8BB430;
    v23 = &v24;
    __getAVCaptureDeviceClass_block_invoke((uint64_t)&v19);
    v8 = (void *)v25[3];
  }
  v10 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v24, 8);
  v19 = 0;
  v20 = (uint64_t)&v19;
  v21 = 0x2020000000;
  v11 = (uint64_t *)getAVMediaTypeVideoSymbolLoc_ptr_23981;
  v22 = (void *)getAVMediaTypeVideoSymbolLoc_ptr_23981;
  if (!getAVMediaTypeVideoSymbolLoc_ptr_23981)
  {
    v12 = AVFoundationLibrary_23982();
    v11 = (uint64_t *)dlsym(v12, "AVMediaTypeVideo");
    *(_QWORD *)(v20 + 24) = v11;
    getAVMediaTypeVideoSymbolLoc_ptr_23981 = (uint64_t)v11;
  }
  _Block_object_dispose(&v19, 8);
  if (v11)
  {
    v13 = *v11;
    v17[0] = v9;
    v17[1] = 3221225472;
    v17[2] = __75__WFCameraAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke;
    v17[3] = &unk_24F8B6920;
    v17[4] = self;
    v18 = v7;
    v14 = v7;
    objc_msgSend(v10, "requestAccessForMediaType:completionHandler:", v13, v17);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AVMediaType getAVMediaTypeVideo(void)");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("WFCameraAccessResource.m"), 21, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void __75__WFCameraAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  _QWORD block[5];
  id v5;
  char v6;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__WFCameraAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke_2;
  block[3] = &unk_24F8B8F98;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = a2;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __75__WFCameraAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "refreshAvailabilityWithForcedNotification");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (BOOL)isSystemResource
{
  return 1;
}

@end
