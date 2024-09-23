@implementation WFSplitScreenAppAction

- (OS_dispatch_queue)queue
{
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *v5;

  queue = self->_queue;
  if (!queue)
  {
    v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.shortcuts.WFSplitScreenAppAction", 0);
    v5 = self->_queue;
    self->_queue = v4;

    queue = self->_queue;
  }
  return queue;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  void *v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  _QWORD v42[5];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  _QWORD v53[4];
  id v54[6];

  v54[4] = *(id *)MEMORY[0x24BDAC8D0];
  v40 = a3;
  -[WFSplitScreenAppAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFPrimaryAppIdentifier"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[WFSplitScreenAppAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFSecondaryAppIdentifier"), objc_opt_class());
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "bundleIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSplitScreenAppAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFAppRatio"), objc_opt_class());
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v38, "isEqualToString:", CFSTR("½ + ½")))
    {
      v43 = 0;
      v44 = &v43;
      v45 = 0x2020000000;
      v6 = (id *)getSBSOpenApplicationLayoutRoleSideLargeSymbolLoc_ptr;
      v46 = getSBSOpenApplicationLayoutRoleSideLargeSymbolLoc_ptr;
      if (!getSBSOpenApplicationLayoutRoleSideLargeSymbolLoc_ptr)
      {
        v7 = SpringBoardServicesLibrary();
        v6 = (id *)dlsym(v7, "SBSOpenApplicationLayoutRoleSideLarge");
        v44[3] = (uint64_t)v6;
        getSBSOpenApplicationLayoutRoleSideLargeSymbolLoc_ptr = (uint64_t)v6;
      }
      _Block_object_dispose(&v43, 8);
      if (!v6)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getSBSOpenApplicationLayoutRoleSideLarge(void)");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("WFSplitScreenAppAction.m"), 29, CFSTR("%s"), dlerror());

        goto LABEL_24;
      }
    }
    else
    {
      v43 = 0;
      v44 = &v43;
      v45 = 0x2020000000;
      v6 = (id *)getSBSOpenApplicationLayoutRoleSideNarrowSymbolLoc_ptr;
      v46 = getSBSOpenApplicationLayoutRoleSideNarrowSymbolLoc_ptr;
      if (!getSBSOpenApplicationLayoutRoleSideNarrowSymbolLoc_ptr)
      {
        v10 = SpringBoardServicesLibrary();
        v6 = (id *)dlsym(v10, "SBSOpenApplicationLayoutRoleSideNarrow");
        v44[3] = (uint64_t)v6;
        getSBSOpenApplicationLayoutRoleSideNarrowSymbolLoc_ptr = (uint64_t)v6;
      }
      _Block_object_dispose(&v43, 8);
      if (!v6)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getSBSOpenApplicationLayoutRoleSideNarrow(void)");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, CFSTR("WFSplitScreenAppAction.m"), 30, CFSTR("%s"), dlerror());

        goto LABEL_24;
      }
    }
    v37 = *v6;
    v11 = (void *)MEMORY[0x24BDBCED8];
    getSBSOpenApplicationOptionKeyLayoutRole();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v12;
    v43 = 0;
    v44 = &v43;
    v45 = 0x2020000000;
    v13 = (id *)getSBSOpenApplicationLayoutRolePrimarySymbolLoc_ptr;
    v46 = getSBSOpenApplicationLayoutRolePrimarySymbolLoc_ptr;
    if (!getSBSOpenApplicationLayoutRolePrimarySymbolLoc_ptr)
    {
      v14 = SpringBoardServicesLibrary();
      v13 = (id *)dlsym(v14, "SBSOpenApplicationLayoutRolePrimary");
      v44[3] = (uint64_t)v13;
      getSBSOpenApplicationLayoutRolePrimarySymbolLoc_ptr = (uint64_t)v13;
    }
    _Block_object_dispose(&v43, 8);
    if (v13)
    {
      v15 = *MEMORY[0x24BE38310];
      v54[0] = *v13;
      v54[1] = (id)MEMORY[0x24BDBD1C8];
      v16 = *MEMORY[0x24BE38320];
      v53[1] = v15;
      v53[2] = v16;
      v53[3] = *MEMORY[0x24BE382D8];
      v54[2] = (id)MEMORY[0x24BDBD1C8];
      v54[3] = &unk_24F939A40;
      v17 = (void *)MEMORY[0x24BDBCE70];
      v18 = v54[0];
      objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v54, v53, 4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "dictionaryWithDictionary:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v41)
      {
LABEL_19:
        objc_msgSend(MEMORY[0x24BE38490], "serviceWithDefaultShellEndpoint");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE38478], "optionsWithDictionary:", v20);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v42[0] = MEMORY[0x24BDAC760];
        v42[1] = 3221225472;
        v42[2] = __53__WFSplitScreenAppAction_runAsynchronouslyWithInput___block_invoke;
        v42[3] = &unk_24F8B0BF8;
        v42[4] = self;
        objc_msgSend(v29, "openApplication:withOptions:completion:", v5, v30, v42);

        goto LABEL_20;
      }
      v43 = 0;
      v44 = &v43;
      v45 = 0x2020000000;
      v21 = (id *)getSBSOpenApplicationOptionKeyAdditionalApplicationsSymbolLoc_ptr;
      v46 = getSBSOpenApplicationOptionKeyAdditionalApplicationsSymbolLoc_ptr;
      if (!getSBSOpenApplicationOptionKeyAdditionalApplicationsSymbolLoc_ptr)
      {
        v22 = SpringBoardServicesLibrary();
        v21 = (id *)dlsym(v22, "SBSOpenApplicationOptionKeyAdditionalApplications");
        v44[3] = (uint64_t)v21;
        getSBSOpenApplicationOptionKeyAdditionalApplicationsSymbolLoc_ptr = (uint64_t)v21;
      }
      _Block_object_dispose(&v43, 8);
      if (v21)
      {
        v51 = *v21;
        v23 = v51;
        v24 = (void *)objc_msgSend(v41, "copy");
        v49 = v24;
        getSBSOpenApplicationOptionKeyLayoutRole();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v25;
        v48 = v37;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v26;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = v27;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v20, "addEntriesFromDictionary:", v28);
        goto LABEL_19;
      }
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getSBSOpenApplicationOptionKeyAdditionalApplications(void)");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, CFSTR("WFSplitScreenAppAction.m"), 26, CFSTR("%s"), dlerror());

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getSBSOpenApplicationLayoutRolePrimary(void)");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, CFSTR("WFSplitScreenAppAction.m"), 28, CFSTR("%s"), dlerror());

    }
LABEL_24:
    __break(1u);
  }
  -[WFSplitScreenAppAction finishRunningWithError:](self, "finishRunningWithError:", 0);
LABEL_20:

}

- (id)disabledOnPlatforms
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFSplitScreenAppAction;
  -[WFSplitScreenAppAction disabledOnPlatforms](&v5, sel_disabledOnPlatforms);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObject:", *MEMORY[0x24BEC43E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSMutableDictionary)leftWindowsToWindowID
{
  return self->_leftWindowsToWindowID;
}

- (void)setLeftWindowsToWindowID:(id)a3
{
  objc_storeStrong((id *)&self->_leftWindowsToWindowID, a3);
}

- (NSMutableDictionary)rightWindowsToWindowID
{
  return self->_rightWindowsToWindowID;
}

- (void)setRightWindowsToWindowID:(id)a3
{
  objc_storeStrong((id *)&self->_rightWindowsToWindowID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightWindowsToWindowID, 0);
  objc_storeStrong((id *)&self->_leftWindowsToWindowID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __53__WFSplitScreenAppAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    getWFActionsLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[WFSplitScreenAppAction runAsynchronouslyWithInput:]_block_invoke";
      v17 = 2112;
      v18 = v4;
      _os_log_impl(&dword_22D353000, v5, OS_LOG_TYPE_ERROR, "%s Could not split screen apps with error: %@", buf, 0x16u);
    }

    v6 = *(void **)(a1 + 32);
    v7 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v4, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "code");
    v13 = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("Failed to open the specified apps in split screen mode."));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, v9, v11, v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finishRunningWithError:", v12);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
  }

}

@end
