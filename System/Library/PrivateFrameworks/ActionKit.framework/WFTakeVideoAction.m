@implementation WFTakeVideoAction

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a3;
  v7 = a4;
  -[WFTakeVideoAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFCameraCaptureQuality"), objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTakeVideoAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFCameraCaptureDevice"), objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTakeVideoAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFRecordingStart"), objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("Immediately"));

  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v12 = (void *)getUIImagePickerControllerClass_softClass;
  v20 = getUIImagePickerControllerClass_softClass;
  if (!getUIImagePickerControllerClass_softClass)
  {
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __getUIImagePickerControllerClass_block_invoke;
    v16[3] = &unk_24F8BB430;
    v16[4] = &v17;
    __getUIImagePickerControllerClass_block_invoke((uint64_t)v16);
    v12 = (void *)v18[3];
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v17, 8);
  if ((objc_msgSend(v13, "isSourceTypeAvailable:", 1) & 1) != 0)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __54__WFTakeVideoAction_runWithRemoteUserInterface_input___block_invoke;
    v15[3] = &unk_24F8B96D8;
    v15[4] = self;
    objc_msgSend(v6, "showWithQuality:device:startImmediately:completionHandler:", v8, v9, v11, v15);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 3328, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTakeVideoAction finishRunningWithError:](self, "finishRunningWithError:", v14);

  }
}

- (id)disabledOnPlatforms
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFTakeVideoAction;
  -[WFTakeVideoAction disabledOnPlatforms](&v5, sel_disabledOnPlatforms);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObject:", *MEMORY[0x24BEC43E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __54__WFTakeVideoAction_runWithRemoteUserInterface_input___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  if (a2)
  {
    v5 = *(void **)(a1 + 32);
    v6 = a2;
    objc_msgSend(v5, "output");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addFile:", v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v8);

}

+ (id)userInterfaceProtocol
{
  return &unk_255DFC4A0;
}

@end
