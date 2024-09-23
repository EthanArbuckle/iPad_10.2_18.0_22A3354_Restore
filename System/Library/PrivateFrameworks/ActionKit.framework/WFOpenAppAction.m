@implementation WFOpenAppAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  _QWORD v41[5];
  id v42;
  id v43;
  _QWORD aBlock[5];
  id v45;
  id v46;
  _QWORD v47[5];
  _BYTE buf[24];
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v40 = a3;
  -[WFOpenAppAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFSelectedApp"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
LABEL_2:
    -[WFOpenAppAction userInterface](self, "userInterface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isRunningWithSiriUI"))
    {
      v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEC15C0]), "initWithBundleIdentifier:", v5);
      v47[0] = MEMORY[0x24BDAC760];
      v47[1] = 3221225472;
      v47[2] = __46__WFOpenAppAction_runAsynchronouslyWithInput___block_invoke;
      v47[3] = &unk_24F8B4E88;
      v47[4] = self;
      if ((objc_msgSend(v6, "performSiriRequest:completionHandler:", v7, v47) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "wfUnsupportedUserInterfaceError");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFOpenAppAction finishRunningWithError:](self, "finishRunningWithError:", v8);

      }
LABEL_27:

      goto LABEL_28;
    }
    v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "idiom") == 1)
    {
      -[WFOpenAppAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFOpenInSlideOver"), objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "BOOLValue");

      if (v11)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v12 = (id *)getSBSOpenApplicationLayoutRoleSideNarrowOverlaySymbolLoc_ptr;
        v49 = getSBSOpenApplicationLayoutRoleSideNarrowOverlaySymbolLoc_ptr;
        if (!getSBSOpenApplicationLayoutRoleSideNarrowOverlaySymbolLoc_ptr)
        {
          v13 = SpringBoardServicesLibrary_23689();
          v12 = (id *)dlsym(v13, "SBSOpenApplicationLayoutRoleSideNarrowOverlay");
          *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v12;
          getSBSOpenApplicationLayoutRoleSideNarrowOverlaySymbolLoc_ptr = (uint64_t)v12;
        }
        _Block_object_dispose(buf, 8);
        if (!v12)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getSBSOpenApplicationLayoutRoleSideNarrowOverlay(void)");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", v39, CFSTR("WFOpenAppAction.m"), 31, CFSTR("%s"), dlerror());

          goto LABEL_38;
        }
LABEL_18:
        v18 = *v12;
        getSBSOpenApplicationOptionKeyLayoutRole_23694();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v18, v19);

        -[WFOpenAppAction userInterface](self, "userInterface");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v19) = objc_msgSend(v20, "progressIsPersistentInSystemAperture");

        if (!(_DWORD)v19)
        {
LABEL_23:
          objc_msgSend(v7, "setObject:forKey:", &unk_24F93A568, *MEMORY[0x24BE382D8]);
          if (objc_msgSend(MEMORY[0x24BEC3AF0], "deviceSupportsSystemAssistantExperience"))
            v23 = _os_feature_enabled_impl();
          else
            v23 = 0;
          v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE19398]), "initWithBundleIdentifier:options:URL:userActivity:retainsSiri:", v5, v7, 0, 0, v23);
          objc_msgSend(v24, "setRequiresUserFacingApp:", 1);
          v25 = MEMORY[0x24BDAC760];
          aBlock[0] = MEMORY[0x24BDAC760];
          aBlock[1] = 3221225472;
          aBlock[2] = __46__WFOpenAppAction_runAsynchronouslyWithInput___block_invoke_133;
          aBlock[3] = &unk_24F8B4EB0;
          aBlock[4] = self;
          v26 = v24;
          v45 = v26;
          v46 = v5;
          v27 = _Block_copy(aBlock);
          -[WFOpenAppAction runningDelegate](self, "runningDelegate");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "action:didDecideRunningProgressIsAllowed:", self, 0);

          -[WFOpenAppAction userInterface](self, "userInterface");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "applicationWillLaunchInForeground");

          v41[0] = v25;
          v41[1] = 3221225472;
          v41[2] = __46__WFOpenAppAction_runAsynchronouslyWithInput___block_invoke_4;
          v41[3] = &unk_24F8B6D50;
          v41[4] = self;
          v42 = v26;
          v43 = v27;
          v30 = v27;
          v31 = v26;
          objc_msgSend(v31, "performWithCompletionHandler:", v41);

          goto LABEL_27;
        }
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v21 = (_QWORD *)getSBSOpenApplicationLaunchOriginActionButtonSymbolLoc_ptr;
        v49 = getSBSOpenApplicationLaunchOriginActionButtonSymbolLoc_ptr;
        if (!getSBSOpenApplicationLaunchOriginActionButtonSymbolLoc_ptr)
        {
          v22 = SpringBoardServicesLibrary_23689();
          v21 = dlsym(v22, "SBSOpenApplicationLaunchOriginActionButton");
          *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v21;
          getSBSOpenApplicationLaunchOriginActionButtonSymbolLoc_ptr = (uint64_t)v21;
        }
        _Block_object_dispose(buf, 8);
        if (v21)
        {
          objc_msgSend(v7, "setObject:forKey:", *v21, *MEMORY[0x24BE382E0]);
          goto LABEL_23;
        }
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getSBSOpenApplicationLaunchOriginActionButton(void)");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "handleFailureInFunction:file:lineNumber:description:", v37, CFSTR("WFOpenAppAction.m"), 29, CFSTR("%s"), dlerror());

LABEL_38:
        __break(1u);
      }
    }
    else
    {

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v12 = (id *)getSBSOpenApplicationLayoutRolePrimarySymbolLoc_ptr_23695;
    v49 = getSBSOpenApplicationLayoutRolePrimarySymbolLoc_ptr_23695;
    if (!getSBSOpenApplicationLayoutRolePrimarySymbolLoc_ptr_23695)
    {
      v17 = SpringBoardServicesLibrary_23689();
      v12 = (id *)dlsym(v17, "SBSOpenApplicationLayoutRolePrimary");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v12;
      getSBSOpenApplicationLayoutRolePrimarySymbolLoc_ptr_23695 = (uint64_t)v12;
    }
    _Block_object_dispose(buf, 8);
    if (!v12)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getSBSOpenApplicationLayoutRolePrimary(void)");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, CFSTR("WFOpenAppAction.m"), 32, CFSTR("%s"), dlerror());

      goto LABEL_38;
    }
    goto LABEL_18;
  }
  -[WFOpenAppAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFAppName"), objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(MEMORY[0x24BE19380], "findAppWithBundleIdentifier:name:", 0, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "bundleIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_2;
    }
    getWFActionsLogObject();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[WFOpenAppAction runAsynchronouslyWithInput:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v14;
      _os_log_impl(&dword_22D353000, v33, OS_LOG_TYPE_ERROR, "%s Open App failed, no selected app descriptor and no app matching name: %@", buf, 0x16u);
    }

    -[WFOpenAppAction finishRunningWithNoAppError](self, "finishRunningWithNoAppError");
  }
  else
  {
    getWFActionsLogObject();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[WFOpenAppAction runAsynchronouslyWithInput:]";
      _os_log_impl(&dword_22D353000, v32, OS_LOG_TYPE_ERROR, "%s Open App failed, no selected app or app name", buf, 0xCu);
    }

    -[WFOpenAppAction finishRunningWithNoAppError](self, "finishRunningWithNoAppError");
  }
LABEL_28:

}

- (void)finishRunningWithNoAppError
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BEC4270];
  v8 = *MEMORY[0x24BDD0FC8];
  WFLocalizedString(CFSTR("Open App failed because it couldn’t find an app to open."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, 5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFOpenAppAction finishRunningWithError:](self, "finishRunningWithError:", v7);
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  BOOL v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("WFSelectedApp")))
  {
    v8 = v6;
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v10 = v9;

    objc_msgSend(v10, "value");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFOpenAppAction setSupplementalParameterValue:forKey:](self, "setSupplementalParameterValue:forKey:", v12, CFSTR("WFAppIdentifier"));

  }
  v15.receiver = self;
  v15.super_class = (Class)WFOpenAppAction;
  v13 = -[WFOpenAppAction setParameterState:forKey:](&v15, sel_setParameterState_forKey_, v6, v7);

  return v13;
}

- (NSString)associatedAppBundleIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[WFOpenAppAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFSelectedApp"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9BD0]), "initWithBundleIdentifier:", v4);
  objc_msgSend(MEMORY[0x24BDD9BF0], "sharedResolver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resolvedAppMatchingDescriptor:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)generateStandaloneShortcutRepresentation:(id)a3
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = (objc_class *)MEMORY[0x24BEC40B0];
  v6 = a3;
  v7 = [v5 alloc];
  -[WFOpenAppAction associatedAppBundleIdentifier](self, "associatedAppBundleIdentifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "initWithBundleIdentifier:", v9);
  (*((void (**)(id, void *))a3 + 2))(v6, v8);

}

void __46__WFOpenAppAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "finishRunningWithError:", v5);

    v6 = v3;
  }
  else
  {

    getWFWorkflowExecutionLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v10 = 136315394;
      v11 = "-[WFOpenAppAction runAsynchronouslyWithInput:]_block_invoke";
      v12 = 2112;
      v13 = (id)objc_opt_class();
      v8 = v13;
      _os_log_impl(&dword_22D353000, v7, OS_LOG_TYPE_FAULT, "%s Received unexpected interaction response of type %@", (uint8_t *)&v10, 0x16u);

    }
    v9 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "wfUnsupportedUserInterfaceError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "finishRunningWithError:", v6);
  }

}

void __46__WFOpenAppAction_runAsynchronouslyWithInput___block_invoke_133(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = (void *)objc_opt_new();
    WFLocalizedString(CFSTR("Open App failed because the app could not be opened."));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BDD0FC8]);

    if (v5)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BDD1398]);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("WFOpenAppActionErrorDomain"), 0, v6);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v8;
  }
  if (v5 && (WFOpenAppActionIsPDUError(v5) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v5);
  }
  else
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __46__WFOpenAppAction_runAsynchronouslyWithInput___block_invoke_2;
    v10[3] = &unk_24F8B83C0;
    v9 = *(void **)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v9, "observeForAppLaunchWithTimeout:completionHandler:", v10, 3.0);

  }
}

void __46__WFOpenAppAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a3;
  if ((a2 & 1) != 0 || !VCIsDeviceLocked())
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __46__WFOpenAppAction_runAsynchronouslyWithInput___block_invoke_5;
    v7[3] = &unk_24F8B8FC0;
    v6 = *(void **)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v6, "requestUnlock:", v7);

  }
}

uint64_t __46__WFOpenAppAction_runAsynchronouslyWithInput___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

void __46__WFOpenAppAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  dispatch_time_t v5;
  void *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v4 = a3;
  v5 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__WFOpenAppAction_runAsynchronouslyWithInput___block_invoke_3;
  block[3] = &unk_24F8BB0A0;
  v6 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v10 = v4;
  v7 = v4;
  dispatch_after(v5, MEMORY[0x24BDAC9B8], block);

}

void __46__WFOpenAppAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFAppName"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE19380]), "initWithBundleIdentifier:localizedName:", *(_QWORD *)(a1 + 40), v2);
  objc_msgSend(MEMORY[0x24BE19450], "itemWithObject:named:", v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BE19438];
  v8[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "collectionWithItems:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setOutput:", v7);

  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", *(_QWORD *)(a1 + 48));
}

@end
