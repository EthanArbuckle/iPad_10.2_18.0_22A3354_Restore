@implementation WFTakeScreenshotAction

- (id)disabledOnPlatforms
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFTakeScreenshotAction;
  -[WFTakeScreenshotAction disabledOnPlatforms](&v5, sel_disabledOnPlatforms);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObject:", *MEMORY[0x24BEC43E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[5];
  _QWORD v38[5];
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE19570], "defaultProfile", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isScreenShotAllowed");

  if ((v5 & 1) != 0)
  {
    -[WFTakeScreenshotAction variableSource](self, "variableSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "workflowStartDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFTakeScreenshotAction variableSource](self, "variableSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentForPrivateVariableKey:", CFSTR("WFTakeScreenshotActionConfirmed"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v10 = v9;
      else
        v10 = 0;
    }
    else
    {
      v10 = 0;
    }
    v15 = v10;

    v16 = objc_msgSend(v15, "BOOLValue");
    if (v7 && (v16 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "dateByAddingUnit:value:toDate:options:", 64, 10, v7, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "compare:", v18);

      if (v20 == 1)
      {
        -[WFTakeScreenshotAction workflow](self, "workflow");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "hiddenFromLibraryAndSync"))
        {

        }
        else
        {
          -[WFTakeScreenshotAction workflow](self, "workflow");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "name");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            v24 = (void *)MEMORY[0x24BDD17C8];
            WFLocalizedString(CFSTR("The shortcut “%@” wants to take a screenshot. Do you want to allow it?"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "localizedStringWithFormat:", v25, v23);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
            objc_msgSend(MEMORY[0x24BE19370], "alertWithPreferredStyle:", 0);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFTakeScreenshotAction localizedName](self, "localizedName");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "setTitle:", v28);

            objc_msgSend(v27, "setMessage:", v26);
            v29 = (void *)MEMORY[0x24BE19378];
            WFLocalizedString(CFSTR("Don’t Allow"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = MEMORY[0x24BDAC760];
            v38[0] = MEMORY[0x24BDAC760];
            v38[1] = 3221225472;
            v38[2] = __53__WFTakeScreenshotAction_runAsynchronouslyWithInput___block_invoke;
            v38[3] = &unk_24F8BB638;
            v38[4] = self;
            objc_msgSend(v29, "buttonWithTitle:style:handler:", v30, 1, v38);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "addButton:", v32);

            v33 = (void *)MEMORY[0x24BE19378];
            WFLocalizedString(CFSTR("OK"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v37[0] = v31;
            v37[1] = 3221225472;
            v37[2] = __53__WFTakeScreenshotAction_runAsynchronouslyWithInput___block_invoke_2;
            v37[3] = &unk_24F8BB638;
            v37[4] = self;
            objc_msgSend(v33, "buttonWithTitle:style:preferred:handler:", v34, 0, 1, v37);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "addButton:", v35);

            -[WFTakeScreenshotAction userInterface](self, "userInterface");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "presentAlert:", v27);

            goto LABEL_19;
          }
        }
        WFLocalizedString(CFSTR("This shortcut wants to take a screenshot. Do you want to allow it?"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }

    }
    -[WFTakeScreenshotAction takeScreenshot](self, "takeScreenshot");
  }
  else
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    v12 = *MEMORY[0x24BEC4270];
    v39 = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("Your administrator doesn't allow taking screenshots."));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 8, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFTakeScreenshotAction finishRunningWithError:](self, "finishRunningWithError:", v14);

  }
LABEL_19:

}

- (void)cancel
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WFTakeScreenshotAction;
  -[WFTakeScreenshotAction cancel](&v2, sel_cancel);
}

- (id)parameterSummary
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x24BEC3A50]);
  WFLocalizedStringResourceWithKey(CFSTR("Take screenshot"), CFSTR("Take screenshot"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithString:", v3);

  return v4;
}

- (id)contentDestinationWithError:(id *)a3
{
  return 0;
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a5;
  WFLocalizedString(CFSTR("Allow “%1$@” to take a screenshot?"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)takeScreenshot
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t (*v18)();
  _QWORD v19[5];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(MEMORY[0x24BDE5660], "displays");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    v7 = *MEMORY[0x24BE19838];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isCloning") & 1) == 0)
        {
          v20 = 0;
          -[WFTakeScreenshotAction screenshotDisplay:error:](self, "screenshotDisplay:error:", v9, &v20);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v20;
          v12 = v11;
          if (v10)
            v13 = 1;
          else
            v13 = v11 == 0;
          if (!v13)
          {
            -[WFTakeScreenshotAction finishRunningWithError:](self, "finishRunningWithError:", v11);

            return;
          }
          if (v10)
          {
            objc_msgSend(MEMORY[0x24BE19520], "log:", v7);
            v14 = (void *)MEMORY[0x24BE19538];
            objc_msgSend(MEMORY[0x24BE19470], "screenshotLocation");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "itemWithObject:origin:disclosureLevel:", v10, v15, 1);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v16, "setIsScreenshot:", 1);
            -[WFTakeScreenshotAction output](self, "output");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "addItem:", v16);

          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v5);
  }

  v18 = softLinkSBSSpringBoardServerPort();
  softLinkSBFlashColor((uint64_t)v18, 1.0, 1.0, 1.0);
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __40__WFTakeScreenshotAction_takeScreenshot__block_invoke;
  v19[3] = &unk_24F8BB638;
  v19[4] = self;
  -[WFTakeScreenshotAction notifyVisibleScenesOfScreenshot:](self, "notifyVisibleScenesOfScreenshot:", v19);
}

- (id)screenshotDisplay:(id)a3 error:(id *)a4
{
  id v4;
  CGSize v5;
  double width;
  double height;
  double v8;
  uint64_t v9;
  uint64_t v10;
  size_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  size_t v17;
  void *v18;
  IOSurfaceRef v19;
  __IOSurface *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *BaseAddress;
  CGDataProviderRef v29;
  CGDataProvider *v30;
  uint64_t v31;
  uint64_t v32;
  CGColorSpace *DeviceRGB;
  void (**v34)(_QWORD);
  CGImageRef v35;
  CGImage *v36;
  void (**v37)(_QWORD);
  void *v38;
  char v39;
  CGFloat v40;
  void *v41;
  char v42;
  void *v43;
  char v44;
  CGSize v45;
  double v46;
  double v47;
  id v48;
  id v49;
  id v50;
  id v51;
  CGContext *v52;
  const __CFDictionary *properties;
  id v55;
  CGAffineTransform v56;
  _QWORD v57[5];
  _QWORD v58[5];
  _QWORD aBlock[5];
  __int128 v60;
  CGSize v61;
  _QWORD v62[7];
  _QWORD v63[7];
  uint8_t buf[4];
  const char *v65;
  _QWORD v66[7];
  _QWORD v67[10];
  CGRect v68;
  CGRect v69;
  CGRect v70;

  v67[7] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
  v60 = *MEMORY[0x24BDBF090];
  v61 = v5;
  v55 = v4;
  objc_msgSend(v4, "displayId");
  if (CARenderServerGetDisplayLogicalBounds())
  {
    height = v61.height;
    width = v61.width;
  }
  else
  {
    objc_msgSend(v55, "bounds");
    height = v8;
    *(_QWORD *)&v60 = v9;
    *((_QWORD *)&v60 + 1) = v10;
    v61.width = width;
    v61.height = v8;
  }
  v11 = (unint64_t)width;
  v12 = *MEMORY[0x24BDB03B8];
  v66[0] = *MEMORY[0x24BDD8FD0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", (unint64_t)width);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = v13;
  v66[1] = *MEMORY[0x24BDD8EB0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", (unint64_t)height);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v67[1] = v14;
  v15 = *MEMORY[0x24BDD8E30];
  v66[2] = *MEMORY[0x24BDD8EF8];
  v66[3] = v15;
  v67[2] = &unk_24F939AD0;
  v67[3] = &unk_24F939AE8;
  v66[4] = *MEMORY[0x24BDD8E38];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", (4 * v11 + 63) & 0xFFFFFFFFFFFFFFC0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (v12 + ((4 * v11 + 63) & 0xFFFFFFFFFFFFFFC0) * (unint64_t)height) & ~v12;
  v67[4] = v16;
  v66[5] = *MEMORY[0x24BDD8E18];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v67[5] = v18;
  v66[6] = *MEMORY[0x24BDD8E40];
  v67[6] = &unk_24F939B00;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v67, v66, 7);
  properties = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v19 = IOSurfaceCreate(properties);
  v20 = v19;
  if (v19)
  {
    v21 = *MEMORY[0x24BDE5DC0];
    v22 = *MEMORY[0x24BDE5D90];
    v62[0] = *MEMORY[0x24BDE5DB8];
    v62[1] = v22;
    v63[0] = v21;
    v63[1] = v19;
    v62[2] = *MEMORY[0x24BDE5D98];
    objc_msgSend(v55, "name");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v63[2] = v23;
    v62[3] = *MEMORY[0x24BDE5DD0];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (int)*(double *)&v60);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v63[3] = v24;
    v62[4] = *MEMORY[0x24BDE5DD8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (int)*((double *)&v60 + 1));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v63[4] = v25;
    v26 = *MEMORY[0x24BDE5DA8];
    v62[5] = *MEMORY[0x24BDE5DA0];
    v62[6] = v26;
    v63[5] = MEMORY[0x24BDBD1C8];
    v63[6] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v63, v62, 7);
    v27 = objc_claimAutoreleasedReturnValue();

    CARenderServerSnapshot();
    IOSurfaceLock(v20, 1u, 0);
    BaseAddress = IOSurfaceGetBaseAddress(v20);
    v29 = CGDataProviderCreateWithData(v20, BaseAddress, v17, (CGDataProviderReleaseDataCallback)release_surface_data);
    v30 = v29;
    if (!v29)
    {
      getWFActionsLogObject();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v65 = "-[WFTakeScreenshotAction screenshotDisplay:error:]";
        _os_log_impl(&dword_22D353000, (os_log_t)v32, OS_LOG_TYPE_ERROR, "%s Failed to create new data provider.", buf, 0xCu);
      }
      v36 = 0;
      goto LABEL_22;
    }
    v31 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __50__WFTakeScreenshotAction_screenshotDisplay_error___block_invoke;
    aBlock[3] = &__block_descriptor_40_e5_v8__0l;
    aBlock[4] = v29;
    v32 = (uint64_t)_Block_copy(aBlock);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v58[0] = v31;
    v58[1] = 3221225472;
    v58[2] = __50__WFTakeScreenshotAction_screenshotDisplay_error___block_invoke_2;
    v58[3] = &__block_descriptor_40_e5_v8__0l;
    v58[4] = DeviceRGB;
    v34 = (void (**)(_QWORD))_Block_copy(v58);
    v35 = CGImageCreate(v11, (unint64_t)height, 8uLL, 0x20uLL, (4 * v11 + 63) & 0xFFFFFFFFFFFFFFC0, DeviceRGB, 0x2002u, v30, 0, 1, kCGRenderingIntentDefault);
    v36 = v35;
    if (!v35)
    {
LABEL_21:
      v34[2](v34);

      (*(void (**)(uint64_t))(v32 + 16))(v32);
LABEL_22:

      goto LABEL_23;
    }
    v57[0] = v31;
    v57[1] = 3221225472;
    v57[2] = __50__WFTakeScreenshotAction_screenshotDisplay_error___block_invoke_3;
    v57[3] = &__block_descriptor_40_e5_v8__0l;
    v57[4] = v35;
    v37 = (void (**)(_QWORD))_Block_copy(v57);
    objc_msgSend(v55, "currentOrientation");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "isEqualToString:", *MEMORY[0x24BDE5920]);

    if ((v39 & 1) != 0)
    {
      v40 = 1.57079633;
    }
    else
    {
      objc_msgSend(v55, "currentOrientation");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "isEqualToString:", *MEMORY[0x24BDE5918]);

      if ((v42 & 1) != 0)
      {
        v40 = -1.57079633;
      }
      else
      {
        objc_msgSend(v55, "currentOrientation");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v43, "isEqualToString:", *MEMORY[0x24BDE5910]);

        if ((v44 & 1) == 0)
        {
          v36 = (CGImage *)objc_msgSend(objc_alloc(MEMORY[0x24BEC14E0]), "initWithCGImage:scale:orientation:", v36, 1, 1.0);
          goto LABEL_20;
        }
        v40 = 3.14159265;
      }
    }
    v45 = v61;
    CGAffineTransformMakeRotation(&v56, v40);
    v68.origin.x = 0.0;
    v68.origin.y = 0.0;
    v68.size = v45;
    v69 = CGRectApplyAffineTransform(v68, &v56);
    v46 = v69.size.width;
    v47 = v69.size.height;
    objc_msgSend(MEMORY[0x24BEC1378], "HDRCapableContextWithSize:scale:", v69.size.width, v69.size.height, 1.0);
    v48 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextTranslateCTM((CGContextRef)objc_msgSend(v48, "CGContext"), v46 * 0.5, v47 * 0.5);
    v49 = objc_retainAutorelease(v48);
    CGContextRotateCTM((CGContextRef)objc_msgSend(v49, "CGContext"), v40);
    v50 = objc_retainAutorelease(v49);
    CGContextScaleCTM((CGContextRef)objc_msgSend(v50, "CGContext"), 1.0, -1.0);
    v51 = objc_retainAutorelease(v50);
    v52 = (CGContext *)objc_msgSend(v51, "CGContext");
    v70.size = v61;
    v70.origin.x = ceil(v61.width * -0.5);
    v70.origin.y = ceil(v61.height * -0.5);
    CGContextDrawImage(v52, v70, v36);
    objc_msgSend(v51, "image");
    v36 = (CGImage *)objc_claimAutoreleasedReturnValue();

LABEL_20:
    v37[2](v37);

    goto LABEL_21;
  }
  getWFActionsLogObject();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v65 = "-[WFTakeScreenshotAction screenshotDisplay:error:]";
    _os_log_impl(&dword_22D353000, v27, OS_LOG_TYPE_ERROR, "%s Failed to create IOSurface.", buf, 0xCu);
  }
  v36 = 0;
LABEL_23:

  return v36;
}

- (void)notifyVisibleScenesOfScreenshot:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  WFTakeScreenshotAction *v12;
  id v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE38490], "serviceWithDefaultShellEndpoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE38448], "configurationForDefaultMainDisplayMonitor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __58__WFTakeScreenshotAction_notifyVisibleScenesOfScreenshot___block_invoke;
  v10[3] = &unk_24F8B2020;
  v11 = v5;
  v12 = self;
  v13 = v4;
  v7 = v4;
  v8 = v5;
  objc_msgSend(v6, "setTransitionHandler:", v10);
  objc_msgSend(MEMORY[0x24BE38438], "monitorWithConfiguration:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTakeScreenshotAction setDisplayLayoutMonitor:](self, "setDisplayLayoutMonitor:", v9);

}

- (FBSDisplayLayoutMonitor)displayLayoutMonitor
{
  return self->_displayLayoutMonitor;
}

- (void)setDisplayLayoutMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_displayLayoutMonitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLayoutMonitor, 0);
}

void __58__WFTakeScreenshotAction_notifyVisibleScenesOfScreenshot___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  void *v25;
  _QWORD v26[2];
  _QWORD v27[2];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = v4;
  if (a3)
  {
    v19 = v4;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(a3, "elements");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v22;
      v10 = *MEMORY[0x24BE382A0];
      v11 = *MEMORY[0x24BE382B8];
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v6);
          v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (objc_msgSend(v13, "isUIApplicationElement"))
          {
            objc_msgSend(v13, "bundleIdentifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            getUIDidTakeScreenshotActionClass();
            v15 = (void *)objc_opt_new();
            v25 = v15;
            v26[0] = v10;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v26[1] = v11;
            v27[0] = v16;
            v27[1] = MEMORY[0x24BDBD1C8];
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BE38478], "optionsWithDictionary:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "openApplication:withOptions:completion:", v14, v18, 0);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
      }
      while (v8);
    }

    v5 = v19;
    objc_msgSend(v19, "invalidate");
    objc_msgSend(*(id *)(a1 + 40), "setDisplayLayoutMonitor:", 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __50__WFTakeScreenshotAction_screenshotDisplay_error___block_invoke(uint64_t a1)
{
  CGDataProviderRelease(*(CGDataProviderRef *)(a1 + 32));
}

void __50__WFTakeScreenshotAction_screenshotDisplay_error___block_invoke_2(uint64_t a1)
{
  CGColorSpaceRelease(*(CGColorSpaceRef *)(a1 + 32));
}

void __50__WFTakeScreenshotAction_screenshotDisplay_error___block_invoke_3(uint64_t a1)
{
  CGImageRelease(*(CGImageRef *)(a1 + 32));
}

uint64_t __40__WFTakeScreenshotAction_takeScreenshot__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
}

void __53__WFTakeScreenshotAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishRunningWithError:", v2);

}

uint64_t __53__WFTakeScreenshotAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "variableSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContent:forPrivateVariableKey:", MEMORY[0x24BDBD1C8], CFSTR("WFTakeScreenshotActionConfirmed"));

  return objc_msgSend(*(id *)(a1 + 32), "takeScreenshot");
}

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

@end
