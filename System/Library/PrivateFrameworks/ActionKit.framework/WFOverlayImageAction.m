@implementation WFOverlayImageAction

+ (id)userInterfaceProtocol
{
  return &unk_255DFDA80;
}

+ (id)userInterfaceXPCInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___WFOverlayImageAction;
  objc_msgSendSuper2(&v10, sel_userInterfaceXPCInterface);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_showWithOverlayImage_images_completionHandler_, 1, 0);

  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_showWithOverlayImage_images_completionHandler_, 0, 1);

  return v2;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  char v6;
  objc_super v7;

  v4 = a3;
  -[WFOverlayImageAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFShouldShowImageEditor"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if ((v6 & 1) != 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)WFOverlayImageAction;
    -[WFOverlayImageAction runAsynchronouslyWithInput:](&v7, sel_runAsynchronouslyWithInput_, v4);
  }
  else
  {
    -[WFOverlayImageAction runWithNoUserInterface:](self, "runWithNoUserInterface:", v4);
  }

}

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __57__WFOverlayImageAction_runWithRemoteUserInterface_input___block_invoke;
  v8[3] = &unk_24F8B8060;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[WFOverlayImageAction getImageInputs:withInput:](self, "getImageInputs:withInput:", v8, a4);

}

- (void)runWithNoUserInterface:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __47__WFOverlayImageAction_runWithNoUserInterface___block_invoke;
  v3[3] = &unk_24F8B80B0;
  v3[4] = self;
  -[WFOverlayImageAction getImageInputs:withInput:](self, "getImageInputs:withInput:", v3, a3);
}

- (void)getImageInputs:(id)a3 withInput:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __49__WFOverlayImageAction_getImageInputs_withInput___block_invoke;
  v10[3] = &unk_24F8B9560;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v7, "generateCollectionByCoercingToItemClass:completionHandler:", v8, v10);

}

void __49__WFOverlayImageAction_getImageInputs_withInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  if (objc_msgSend(v6, "numberOfItems"))
  {
    objc_msgSend(*(id *)(a1 + 32), "parameterStateForKey:", CFSTR("WFImage"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFImage"), objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "numberOfItems"))
    {
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __49__WFOverlayImageAction_getImageInputs_withInput___block_invoke_2;
      v21[3] = &unk_24F8B80D8;
      v23 = *(id *)(a1 + 40);
      v22 = v6;
      objc_msgSend(v9, "getObjectRepresentation:forClass:", v21, objc_opt_class());

      v10 = v23;
    }
    else
    {
      objc_msgSend(v8, "variable");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v12 = (void *)MEMORY[0x24BDD17C8];
        WFLocalizedString(CFSTR("The variable “%@” did not include an image to overlay."));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "variable");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "nameIncludingPropertyName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "localizedStringWithFormat:", v13, v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        WFLocalizedString(CFSTR("Make sure to choose a variable in the Overlay Image action."));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v16 = (void *)MEMORY[0x24BDD1540];
      v17 = *MEMORY[0x24BDD1128];
      v24[0] = *MEMORY[0x24BDD0FD8];
      WFLocalizedString(CFSTR("No Overlay Image"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = *MEMORY[0x24BDD0FC8];
      v25[0] = v18;
      v25[1] = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 22, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __49__WFOverlayImageAction_getImageInputs_withInput___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 40);
  if (a2)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32), a2, 0);
  else
    return (*(uint64_t (**)(void))(v3 + 16))();
}

void __47__WFOverlayImageAction_runWithNoUserInterface___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[5];
  _QWORD v13[5];
  id v14;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v7, "numberOfItems");
  if (v8 && v10)
  {
    v11 = MEMORY[0x24BDAC760];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __47__WFOverlayImageAction_runWithNoUserInterface___block_invoke_2;
    v13[3] = &unk_24F8B8088;
    v13[4] = *(_QWORD *)(a1 + 32);
    v14 = v8;
    v12[0] = v11;
    v12[1] = 3221225472;
    v12[2] = __47__WFOverlayImageAction_runWithNoUserInterface___block_invoke_5;
    v12[3] = &unk_24F8BAFA8;
    v12[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v7, "transformItemsUsingBlock:completionHandler:", v13, v12);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v9);
  }

}

void __47__WFOverlayImageAction_runWithNoUserInterface___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v5 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __47__WFOverlayImageAction_runWithNoUserInterface___block_invoke_3;
  v8[3] = &unk_24F8BA0C0;
  v6 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v10 = v5;
  v7 = v5;
  objc_msgSend(a2, "getFileRepresentation:forType:", v8, 0);

}

void __47__WFOverlayImageAction_runWithNoUserInterface___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setOutput:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

void __47__WFOverlayImageAction_runWithNoUserInterface___block_invoke_3(id *a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  WFOverlayImageTransform *v36;
  id v37;
  _QWORD v38[4];
  id v39;

  v3 = a2;
  WFImageSizeFromFile();
  v5 = v4;
  v7 = v6;
  objc_msgSend(a1[4], "parameterValueForKey:ofClass:", CFSTR("WFImageWidth"), objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;
  objc_msgSend(a1[4], "parameterValueForKey:ofClass:", CFSTR("WFImageHeight"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  if (v10 == 0.0 && v13 == 0.0)
  {
    objc_msgSend(a1[5], "sizeInPixels");
    v10 = v14;
    v13 = v15;
  }
  else if (v13 == 0.0)
  {
    objc_msgSend(a1[5], "sizeInPixels");
    v17 = v10 * v16;
    objc_msgSend(a1[5], "sizeInPixels");
    v13 = v17 / v18;
  }
  else if (v10 == 0.0)
  {
    objc_msgSend(a1[5], "sizeInPixels");
    v20 = v13 * v19;
    objc_msgSend(a1[5], "sizeInPixels");
    v10 = v20 / v21;
  }
  objc_msgSend(a1[4], "parameterValueForKey:ofClass:", CFSTR("WFImagePosition"), objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "isEqualToString:", CFSTR("Center")))
  {
    v23 = (v5 - v10) * 0.5;
    v24 = (v7 - v13) * 0.5;
  }
  else
  {
    if ((objc_msgSend(v22, "isEqualToString:", CFSTR("Top Right")) & 1) != 0
      || objc_msgSend(v22, "isEqualToString:", CFSTR("Bottom Right")))
    {
      v23 = v5 - v10;
    }
    else
    {
      v23 = 0.0;
      if ((objc_msgSend(v22, "isEqualToString:", CFSTR("Top Left")) & 1) == 0)
        objc_msgSend(v22, "isEqualToString:", CFSTR("Bottom Left"));
    }
    v24 = 0.0;
  }
  v25 = 0.0;
  if ((objc_msgSend(v22, "isEqualToString:", CFSTR("Top Left")) & 1) == 0
    && (objc_msgSend(v22, "isEqualToString:", CFSTR("Top Right")) & 1) == 0)
  {
    if ((objc_msgSend(v22, "isEqualToString:", CFSTR("Bottom Left")) & 1) != 0
      || (v25 = v24, objc_msgSend(v22, "isEqualToString:", CFSTR("Bottom Right"))))
    {
      v25 = v7 - v13;
    }
  }
  if (objc_msgSend(v22, "isEqualToString:", CFSTR("Custom")))
  {
    objc_msgSend(a1[4], "parameterValueForKey:ofClass:", CFSTR("WFImageX"), objc_opt_class());
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "doubleValue");
    v23 = v27;

    objc_msgSend(a1[4], "parameterValueForKey:ofClass:", CFSTR("WFImageY"), objc_opt_class());
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "doubleValue");
    v25 = v29;

  }
  objc_msgSend(a1[4], "parameterValueForKey:ofClass:", CFSTR("WFOverlayImageOpacity"), objc_opt_class());
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "doubleValue");
  v32 = v31 / 100.0;

  objc_msgSend(a1[4], "parameterValueForKey:ofClass:", CFSTR("WFRotation"), objc_opt_class());
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "doubleValue");
  v35 = v34 * 3.14159265 / 180.0;

  v36 = -[WFOverlayImageTransform initWithCenter:bounds:rotation:scale:opacity:]([WFOverlayImageTransform alloc], "initWithCenter:bounds:rotation:scale:opacity:", v10 * 0.5 + v23, v13 * 0.5 + v25, 0.0, 0.0, v10, v13, v35, 1.0, *(_QWORD *)&v32);
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __47__WFOverlayImageAction_runWithNoUserInterface___block_invoke_4;
  v38[3] = &unk_24F8BA110;
  v37 = a1[5];
  v39 = a1[6];
  -[WFOverlayImageTransform applyToImageFile:withOverlayImage:completionHandler:](v36, "applyToImageFile:withOverlayImage:completionHandler:", v3, v37, v38);

}

uint64_t __47__WFOverlayImageAction_runWithNoUserInterface___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __57__WFOverlayImageAction_runWithRemoteUserInterface_input___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v7, "numberOfItems");
  if (v8 && v10)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __57__WFOverlayImageAction_runWithRemoteUserInterface_input___block_invoke_2;
    v13[3] = &unk_24F8BB348;
    v14 = *(id *)(a1 + 40);
    v11 = v8;
    v12 = *(_QWORD *)(a1 + 32);
    v15 = v11;
    v16 = v12;
    objc_msgSend(v7, "getFileRepresentations:forType:", v13, 0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v9);
  }

}

uint64_t __57__WFOverlayImageAction_runWithRemoteUserInterface_input___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[5];

  v3 = (void *)a1[4];
  v2 = a1[5];
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __57__WFOverlayImageAction_runWithRemoteUserInterface_input___block_invoke_3;
  v5[3] = &unk_24F8BB6B0;
  v5[4] = a1[6];
  return objc_msgSend(v3, "showWithOverlayImage:images:completionHandler:", v2, a2, v5);
}

void __57__WFOverlayImageAction_runWithRemoteUserInterface_input___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
        objc_msgSend(*(id *)(a1 + 32), "output");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addFile:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

@end
