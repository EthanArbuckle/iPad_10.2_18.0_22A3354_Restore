@implementation WFTakePhotoAction

+ (id)userInterfaceProtocol
{
  return &unk_255DFC948;
}

+ (id)userInterfaceXPCInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___WFTakePhotoAction;
  objc_msgSendSuper2(&v7, sel_userInterfaceXPCInterface);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_showWithCameraPreview_photoCount_device_shortcutAttribution_completionHandler_, 0, 1);

  return v2;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[5];

  v4 = a3;
  -[WFTakePhotoAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFCameraCaptureShowPreview"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  -[WFTakePhotoAction variableSource](self, "variableSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "workflowStartDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFTakePhotoAction variableSource](self, "variableSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentForPrivateVariableKey:", CFSTR("WFTakePhotoActionConfirmed"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;

  v13 = objc_msgSend(v12, "BOOLValue");
  if (v8)
    v14 = v13;
  else
    v14 = 1;
  if (((v14 | v6) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dateByAddingUnit:value:toDate:options:", 64, 10, v8, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "compare:", v16);

    if (v18 == 1)
    {
      -[WFTakePhotoAction workflow](self, "workflow");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "hiddenFromLibraryAndSync"))
      {

      }
      else
      {
        -[WFTakePhotoAction workflow](self, "workflow");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          v22 = (void *)MEMORY[0x24BDD17C8];
          WFLocalizedString(CFSTR("The shortcut “%@” wants to take a photo. Do you want to allow it?"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "localizedStringWithFormat:", v23, v21);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
          objc_msgSend(MEMORY[0x24BE19370], "alertWithPreferredStyle:", 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFTakePhotoAction localizedName](self, "localizedName");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setTitle:", v26);

          objc_msgSend(v25, "setMessage:", v24);
          v27 = (void *)MEMORY[0x24BE19378];
          WFLocalizedString(CFSTR("Don’t Allow"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = MEMORY[0x24BDAC760];
          v38[0] = MEMORY[0x24BDAC760];
          v38[1] = 3221225472;
          v38[2] = __48__WFTakePhotoAction_runAsynchronouslyWithInput___block_invoke;
          v38[3] = &unk_24F8BB638;
          v38[4] = self;
          objc_msgSend(v27, "buttonWithTitle:style:handler:", v28, 1, v38);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addButton:", v30);

          v31 = (void *)MEMORY[0x24BE19378];
          WFLocalizedString(CFSTR("OK"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v36[0] = v29;
          v36[1] = 3221225472;
          v36[2] = __48__WFTakePhotoAction_runAsynchronouslyWithInput___block_invoke_2;
          v36[3] = &unk_24F8BA480;
          v36[4] = self;
          v37 = v4;
          objc_msgSend(v31, "buttonWithTitle:style:preferred:handler:", v32, 0, 1, v36);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addButton:", v33);

          -[WFTakePhotoAction userInterface](self, "userInterface");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "presentAlert:", v25);

          goto LABEL_19;
        }
      }
      WFLocalizedString(CFSTR("This shortcut wants to take a photo. Do you want to allow it?"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }

  }
  v35.receiver = self;
  v35.super_class = (Class)WFTakePhotoAction;
  -[WFTakePhotoAction runAsynchronouslyWithInput:](&v35, sel_runAsynchronouslyWithInput_, v4);
LABEL_19:

}

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];

  v5 = a3;
  -[WFTakePhotoAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFCameraCaptureShowPreview"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  -[WFTakePhotoAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFPhotoCount"), objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  -[WFTakePhotoAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFCameraCaptureDevice"), objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTakePhotoAction workflow](self, "workflow");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hiddenFromLibraryAndSync");

  if (v12)
  {
    objc_msgSend(MEMORY[0x24BEC3C28], "defaultDatabase");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTakePhotoAction workflow](self, "workflow");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "workflowID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "configuredTriggersForWorkflowID:error:", v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "trigger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedDescriptionWithConfigurationSummary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[WFTakePhotoAction workflow](self, "workflow");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __54__WFTakePhotoAction_runWithRemoteUserInterface_input___block_invoke;
  v20[3] = &unk_24F8B1A18;
  v20[4] = self;
  objc_msgSend(v5, "showWithCameraPreview:photoCount:device:shortcutAttribution:completionHandler:", v7, v9, v10, v19, v20);

}

- (id)disabledOnPlatforms
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFTakePhotoAction;
  -[WFTakePhotoAction disabledOnPlatforms](&v5, sel_disabledOnPlatforms);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObject:", *MEMORY[0x24BEC43E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)remainingPhotos
{
  return self->_remainingPhotos;
}

- (void)setRemainingPhotos:(unint64_t)a3
{
  self->_remainingPhotos = a3;
}

void __54__WFTakePhotoAction_runWithRemoteUserInterface_input___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDD1620];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __54__WFTakePhotoAction_runWithRemoteUserInterface_input___block_invoke_2;
  v11[3] = &unk_24F8B19F0;
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v6;
  v9 = v6;
  v10 = (id)objc_msgSend(v7, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:", v5, v8, v11);

}

uint64_t __54__WFTakePhotoAction_runWithRemoteUserInterface_input___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setOutput:", a2);
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", *(_QWORD *)(a1 + 40));
}

void __48__WFTakePhotoAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishRunningWithError:", v2);

}

id __48__WFTakePhotoAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  objc_super v5;

  objc_msgSend(*(id *)(a1 + 32), "variableSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContent:forPrivateVariableKey:", MEMORY[0x24BDBD1C8], CFSTR("WFTakePhotoActionConfirmed"));

  v3 = *(_QWORD *)(a1 + 40);
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)WFTakePhotoAction;
  return objc_msgSendSuper2(&v5, sel_runAsynchronouslyWithInput_, v3);
}

@end
