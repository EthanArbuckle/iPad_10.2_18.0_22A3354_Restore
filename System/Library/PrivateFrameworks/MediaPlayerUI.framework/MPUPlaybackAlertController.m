@implementation MPUPlaybackAlertController

+ (id)contentRestrictedPlaybackAlertControllerForContentType:(int64_t)a3 dismissalBlock:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id *v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;

  v5 = a4;
  objc_msgSend(MEMORY[0x24BDDCB98], "sharedRestrictionsMonitor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasRestrictionsPasscode");

  MPULocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  MPULocalizedString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:", v8, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BDF67E8];
  MPULocalizedString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v26[0] = v9;
    v26[1] = 3221225472;
    v26[2] = __100__MPUPlaybackAlertController_contentRestrictedPlaybackAlertControllerForContentType_dismissalBlock___block_invoke;
    v26[3] = &unk_24DD2F7B0;
    v14 = &v27;
    v27 = v5;
    v15 = v26;
  }
  else
  {
    v24[0] = v9;
    v24[1] = 3221225472;
    v24[2] = __100__MPUPlaybackAlertController_contentRestrictedPlaybackAlertControllerForContentType_dismissalBlock___block_invoke_2;
    v24[3] = &unk_24DD2F7B0;
    v14 = &v25;
    v25 = v5;
    v15 = v24;
  }
  objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 0, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v16);

  v17 = (void *)MEMORY[0x24BDF67E8];
  MPULocalizedString();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v9;
  v22[1] = 3221225472;
  v22[2] = __100__MPUPlaybackAlertController_contentRestrictedPlaybackAlertControllerForContentType_dismissalBlock___block_invoke_3;
  v22[3] = &unk_24DD2F7B0;
  v23 = v5;
  v19 = v5;
  objc_msgSend(v17, "actionWithTitle:style:handler:", v18, 0, v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v20);

  return v11;
}

uint64_t __100__MPUPlaybackAlertController_contentRestrictedPlaybackAlertControllerForContentType_dismissalBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;

  objc_msgSend(getLSApplicationWorkspaceClass(), "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=General&path=RESTRICTIONS"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openSensitiveURL:withOptions:", v3, 0);

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __100__MPUPlaybackAlertController_contentRestrictedPlaybackAlertControllerForContentType_dismissalBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v3 = a2;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v4 = (void *)getMCProfileConnectionClass_softClass;
  v18 = getMCProfileConnectionClass_softClass;
  if (!getMCProfileConnectionClass_softClass)
  {
    v10 = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = (uint64_t)__getMCProfileConnectionClass_block_invoke;
    v13 = &unk_24DD2F8A0;
    v14 = &v15;
    __getMCProfileConnectionClass_block_invoke((uint64_t)&v10);
    v4 = (void *)v16[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v15, 8);
  objc_msgSend(v5, "sharedConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = (uint64_t)&v10;
  v12 = 0x2020000000;
  v7 = (_QWORD *)getMCFeatureExplicitContentAllowedSymbolLoc_ptr;
  v13 = (void *)getMCFeatureExplicitContentAllowedSymbolLoc_ptr;
  if (!getMCFeatureExplicitContentAllowedSymbolLoc_ptr)
  {
    v8 = (void *)ManagedConfigurationLibrary();
    v7 = dlsym(v8, "MCFeatureExplicitContentAllowed");
    *(_QWORD *)(v11 + 24) = v7;
    getMCFeatureExplicitContentAllowedSymbolLoc_ptr = (uint64_t)v7;
  }
  _Block_object_dispose(&v10, 8);
  if (!v7)
    __100__MPUPlaybackAlertController_contentRestrictedPlaybackAlertControllerForContentType_dismissalBlock___block_invoke_2_cold_1();
  objc_msgSend(v6, "setBoolValue:forSetting:", 1, *v7);

  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(void))(v9 + 16))();

}

uint64_t __100__MPUPlaybackAlertController_contentRestrictedPlaybackAlertControllerForContentType_dismissalBlock___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (id)playbackAlertControllerForItem:(id)a3 contentType:(int64_t)a4 error:(id)a5 dismissalBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id *v16;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = objc_msgSend(a1, "playbackAlertTypeForError:", v11);
  v14 = v13;
  if (v13 == 1)
  {
LABEL_4:
    objc_msgSend(a1, "genericAlertControllerForItem:error:dismissalBlock:", v10, v11, v12);
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (v13 != 4)
  {
    if (v13 != 3)
    {
      v16 = 0;
      goto LABEL_9;
    }
    goto LABEL_4;
  }
  objc_msgSend(a1, "userRemovedAlertControllerForItem:dismissalBlock:", v10, v12);
  v15 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v16 = (id *)v15;
  if (v15)
  {
    *(_QWORD *)(v15 + 1304) = v14;
    objc_storeStrong((id *)(v15 + 1312), a3);
    objc_storeStrong(v16 + 165, a5);
  }
LABEL_9:

  return v16;
}

+ (int64_t)playbackAlertTypeForError:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  int64_t v15;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "code");
  v5 = v3;
  v6 = v5;
  if (!v5)
    goto LABEL_7;
  objc_msgSend(v5, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDB1C58]);

  if (!v8)
    goto LABEL_7;
  objc_msgSend(v6, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BDD1398]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "code");
  if (!v10)
    goto LABEL_7;
  v12 = v11;
  objc_msgSend(v10, "domain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BDD1100]);

  if (v14 && (unint64_t)(v12 + 42597) < 3)
  {

    v15 = 4;
  }
  else
  {
LABEL_7:
    v15 = v6 != 0;

  }
  return v15;
}

+ (id)genericAlertControllerForItem:(id)a3 error:(id)a4 dismissalBlock:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  BOOL v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  int v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  _BOOL4 v55;
  uint64_t v56;
  void *v57;
  int v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  id v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  _QWORD v85[4];
  id v86;
  _QWORD v87[4];
  id v88;
  _QWORD v89[4];
  id v90;
  id v91;
  id v92;
  id v93;
  uint64_t *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t v103;
  _QWORD v104[3];

  v104[1] = *MEMORY[0x24BDAC8D0];
  v80 = a3;
  v7 = a4;
  v81 = a5;
  v84 = v7;
  objc_msgSend(v7, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = *MEMORY[0x24BDB1C58];
  if (!objc_msgSend(v8, "isEqualToString:"))
  {

LABEL_5:
    v11 = v84;
    v12 = v11;
    if (!v11)
    {
      v18 = 0;
      v16 = 0;
      goto LABEL_22;
    }
    v13 = 0;
    v14 = *MEMORY[0x24BDDBA28];
    v15 = *MEMORY[0x24BDD1398];
    v16 = v11;
    while (!objc_msgSend(v13, "count"))
    {
      objc_msgSend(v16, "userInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKey:", v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v18, "count"))
      {

        if (v18)
          goto LABEL_16;
LABEL_22:
        v77 = 0;
        goto LABEL_23;
      }
      objc_msgSend(v17, "objectForKey:", v15);
      v19 = objc_claimAutoreleasedReturnValue();

      v16 = (id)v19;
      v13 = v18;
      if (!v19)
        goto LABEL_13;
    }
    v18 = v13;
LABEL_13:
    if (!v18)
      goto LABEL_22;
LABEL_16:
    v100 = 0;
    v101 = &v100;
    v102 = 0x2050000000;
    v20 = (void *)getISDialogClass_softClass;
    v103 = getISDialogClass_softClass;
    if (!getISDialogClass_softClass)
    {
      v95 = MEMORY[0x24BDAC760];
      v96 = 3221225472;
      v97 = (uint64_t)__getISDialogClass_block_invoke;
      v98 = &unk_24DD2F8A0;
      v99 = &v100;
      __getISDialogClass_block_invoke((uint64_t)&v95);
      v20 = (void *)v101[3];
    }
    v21 = objc_retainAutorelease(v20);
    _Block_object_dispose(&v100, 8);
    v22 = (void *)objc_msgSend([v21 alloc], "initWithDialogDictionary:", v18);
    v77 = v22;
    if (!v22)
      goto LABEL_22;
    if (objc_msgSend(v22, "isDisplayable") && !objc_msgSend(v77, "kind"))
    {
      objc_msgSend(v77, "title");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "message");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:", v23, v24, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v77, "buttons");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = 0;
      v96 = (uint64_t)&v95;
      v97 = 0x2020000000;
      LOBYTE(v98) = 0;
      v89[0] = MEMORY[0x24BDAC760];
      v89[1] = 3221225472;
      v89[2] = __81__MPUPlaybackAlertController_genericAlertControllerForItem_error_dismissalBlock___block_invoke;
      v89[3] = &unk_24DD2F800;
      v94 = &v95;
      v77 = v77;
      v90 = v77;
      v93 = v81;
      v27 = v25;
      v91 = v27;
      v28 = v26;
      v92 = v28;
      objc_msgSend(v28, "enumerateObjectsUsingBlock:", v89);
      v29 = v92;
      v10 = v27;

      _Block_object_dispose(&v95, 8);
LABEL_74:

      goto LABEL_75;
    }
LABEL_23:
    v30 = v16;
    v16 = v12;

    if (objc_msgSend(0, "length"))
    {
      v31 = 0;
      v32 = 0;
      v28 = 0;
LABEL_68:
      if (objc_msgSend(v32, "length") || objc_msgSend(v28, "length"))
      {
        objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:", v28, v32, 1);
        v10 = (id)objc_claimAutoreleasedReturnValue();
        v61 = (void *)MEMORY[0x24BDF67E8];
        MPULocalizedString();
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = MEMORY[0x24BDAC760];
        v87[0] = MEMORY[0x24BDAC760];
        v87[1] = 3221225472;
        v87[2] = __81__MPUPlaybackAlertController_genericAlertControllerForItem_error_dismissalBlock___block_invoke_3;
        v87[3] = &unk_24DD2F7B0;
        v88 = v81;
        objc_msgSend(v61, "actionWithTitle:style:handler:", v62, 1, v87);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addAction:", v64);

        objc_msgSend(v31, "userInfo");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "objectForKey:", *MEMORY[0x24BDDB978]);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v66, "length"))
        {
          objc_msgSend(v65, "objectForKey:", *MEMORY[0x24BDDB970]);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = (void *)MEMORY[0x24BDF67E8];
          v85[0] = v63;
          v85[1] = 3221225472;
          v85[2] = __81__MPUPlaybackAlertController_genericAlertControllerForItem_error_dismissalBlock___block_invoke_4;
          v85[3] = &unk_24DD2F828;
          v86 = v67;
          v69 = v67;
          objc_msgSend(v68, "actionWithTitle:style:handler:", v66, 0, v85);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addAction:", v70);

        }
      }
      else
      {
        v10 = 0;
      }

      goto LABEL_74;
    }
    v28 = 0;
    v32 = 0;
    v82 = *MEMORY[0x24BDD1308];
    v79 = *MEMORY[0x24BDDB988];
    v74 = *MEMORY[0x24BDD0FC8];
    v78 = *MEMORY[0x24BDDB980];
    v73 = *MEMORY[0x24BDD0FD8];
    v33 = *MEMORY[0x24BDD1398];
    v75 = *MEMORY[0x24BDD1100];
    while (1)
    {
      if (objc_msgSend(v32, "length") || !v16)
      {
        v31 = 0;
        goto LABEL_68;
      }
      objc_msgSend(v16, "userInfo");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "domain");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v35, "isEqualToString:", v82))
      {
        v36 = objc_msgSend(v16, "code") == -1;

        if (v36)
          goto LABEL_52;
      }
      else
      {

      }
      objc_msgSend(v34, "objectForKey:", v79);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v37, "length"))
      {
        objc_msgSend(v34, "objectForKey:", v74);
        v38 = objc_claimAutoreleasedReturnValue();

        v37 = (void *)v38;
      }
      objc_msgSend(v34, "objectForKey:", v78);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v39, "length"))
      {
        objc_msgSend(v34, "objectForKey:", v73);
        v40 = objc_claimAutoreleasedReturnValue();

        v39 = (void *)v40;
      }
      objc_msgSend(v16, "domain");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "isEqualToString:", v83);

      if (v42)
        break;
      v32 = v39;
      v28 = v37;
LABEL_50:
      if (objc_msgSend(v32, "length") || objc_msgSend(v28, "length"))
      {
        v16 = v16;

        v31 = v16;
        goto LABEL_68;
      }
LABEL_52:
      objc_msgSend(v34, "objectForKey:", v33);
      v56 = objc_claimAutoreleasedReturnValue();

      v16 = (id)v56;
      if (objc_msgSend(v28, "length"))
      {
        v31 = 0;
        v16 = (id)v56;
        goto LABEL_68;
      }
    }
    objc_msgSend(v34, "objectForKey:", v33);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "domain");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "isEqualToString:", v75);

    if (v45)
    {
      v46 = objc_msgSend(v43, "code");
      if ((unint64_t)(v46 + 42590) <= 6)
      {
        if (objc_msgSend(v80, "usesSubscriptionLease"))
        {
          if (v46 == -42584)
          {
            MPULocalizedString();
            v28 = (id)objc_claimAutoreleasedReturnValue();

            v47 = (void *)MEMORY[0x24BDD17C8];
            MPULocalizedString();
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "mainTitle");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "localizedStringWithFormat:", v48, v49);
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v80, "mediaItem");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v72)
            {
LABEL_61:

              goto LABEL_49;
            }
            objc_msgSend(v80, "mediaItem");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "mediaLibrary");
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            v104[0] = v72;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v104, 1);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "removeItems:", v51);

LABEL_43:
            goto LABEL_61;
          }
          v100 = 0;
          v101 = &v100;
          v102 = 0x2050000000;
          v52 = (void *)getICEnvironmentMonitorClass_softClass;
          v103 = getICEnvironmentMonitorClass_softClass;
          if (!getICEnvironmentMonitorClass_softClass)
          {
            v95 = MEMORY[0x24BDAC760];
            v96 = 3221225472;
            v97 = (uint64_t)__getICEnvironmentMonitorClass_block_invoke;
            v98 = &unk_24DD2F8A0;
            v99 = &v100;
            __getICEnvironmentMonitorClass_block_invoke((uint64_t)&v95);
            v52 = (void *)v101[3];
          }
          v53 = objc_retainAutorelease(v52);
          _Block_object_dispose(&v100, 8);
          objc_msgSend(v53, "sharedMonitor");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = objc_msgSend(v54, "networkType") == 0;

          if (v55)
          {
            if (objc_msgSend(v80, "isAssetLoaded"))
            {
              objc_msgSend(v80, "asset");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v72 = 0;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0
              || (objc_msgSend(v72, "URL"),
                  v57 = (void *)objc_claimAutoreleasedReturnValue(),
                  v58 = objc_msgSend(v57, "isFileURL"),
                  v57,
                  !v58))
            {
              v32 = v39;
              v28 = v37;
              goto LABEL_61;
            }
            MGGetBoolAnswer();
            MGGetBoolAnswer();
            objc_msgSend(v80, "type");
            MPULocalizedString();
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            if (v46 == -42587)
            {
              MPULocalizedString();
              v28 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(v80, "type");
              MPULocalizedString();
              v28 = (id)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x24BDDC710], "sharedController");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              v60 = objc_msgSend(v59, "isCloudLibraryEnabled");

              if (!v60)
                goto LABEL_61;
              MPULocalizedString();
              v37 = v32;
              v32 = (void *)objc_claimAutoreleasedReturnValue();
            }
            goto LABEL_43;
          }
        }
      }
    }
    v32 = v39;
    v28 = v37;
LABEL_49:

    goto LABEL_50;
  }
  v9 = objc_msgSend(v7, "code");

  if (v9 != -11819)
    goto LABEL_5;
  v10 = 0;
LABEL_75:

  return v10;
}

void __81__MPUPlaybackAlertController_genericAlertControllerForItem_error_dismissalBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = objc_msgSend(v5, "actionType");
  if (v6 || !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v7 = (void *)MEMORY[0x24BDF67E8];
    objc_msgSend(v5, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __81__MPUPlaybackAlertController_genericAlertControllerForItem_error_dismissalBlock___block_invoke_2;
    v11[3] = &unk_24DD2F7D8;
    v12 = v5;
    v13 = *(id *)(a1 + 32);
    v14 = *(id *)(a1 + 56);
    objc_msgSend(v7, "actionWithTitle:style:handler:", v8, v6 == 0, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "addAction:", v9);
    if ((objc_msgSend(*(id *)(a1 + 32), "noDefaultButton") & 1) == 0)
    {
      v10 = objc_msgSend(*(id *)(a1 + 32), "defaultButtonIndex");
      if ((~v10 & 0x7FFFFFFFFFFFFFFFLL) == 0)
        v10 = objc_msgSend(*(id *)(a1 + 48), "count") - 1;
      if (v10 == a3)
        objc_msgSend(*(id *)(a1 + 40), "setPreferredAction:", v9);
    }
    if (!v6)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;

  }
}

uint64_t __81__MPUPlaybackAlertController_genericAlertControllerForItem_error_dismissalBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "performDefaultActionForDialog:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "incrementDisplayCount");
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __81__MPUPlaybackAlertController_genericAlertControllerForItem_error_dismissalBlock___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __81__MPUPlaybackAlertController_genericAlertControllerForItem_error_dismissalBlock___block_invoke_4(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (v1)
    {
      v3 = v1;
      objc_msgSend(getLSApplicationWorkspaceClass(), "defaultWorkspace");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "openSensitiveURL:withOptions:", v3, 0);

      v1 = v3;
    }

  }
}

+ (id)userRemovedAlertControllerForItem:(id)a3 dismissalBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  __CFString *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  id *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  _QWORD v67[4];
  id v68;
  _QWORD v69[4];
  id v70;
  _QWORD v71[4];
  id v72;
  id v73;
  _QWORD v74[4];
  id v75;
  _QWORD v76[4];
  id v77;
  _QWORD v78[4];
  id v79;
  id v80;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "mediaItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mediaLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDC7F0], "deviceMediaLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 == v10)
  {
    if (v8)
    {
      v12 = objc_msgSend(v8, "mediaType");
    }
    else if (objc_msgSend(v6, "type") == 2)
    {
      v12 = -256;
    }
    else
    {
      v12 = 255;
    }
    objc_msgSend(v8, "valueForProperty:", *MEMORY[0x24BDDBCB0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "longLongValue");

    v66 = v7;
    v62 = v6;
    if ((v12 & 0x800) != 0)
    {
      v15 = CFSTR("MUSIC_VIDEO");
    }
    else if ((v12 & 0x402) != 0)
    {
      v15 = CFSTR("PODCAST");
    }
    else if ((v12 & 0x200) != 0)
    {
      v15 = CFSTR("EPISODE");
    }
    else if ((v12 & 0x100) != 0)
    {
      v15 = CFSTR("MOVIE");
    }
    else if ((v12 & 4) != 0)
    {
      v15 = CFSTR("AUDIOBOOK");
    }
    else if ((v12 & 1) != 0)
    {
      v15 = CFSTR("SONG");
    }
    else if ((v12 & 0xFF00) != 0)
    {
      v15 = CFSTR("VIDEO");
    }
    else
    {
      v15 = CFSTR("TRACK");
    }
    v16 = CFSTR("REBUY");
    if (!v14)
      v16 = CFSTR("NOT_AVAILABLE");
    v17 = (void *)MEMORY[0x24BDD17C8];
    v18 = v16;
    objc_msgSend(v17, "stringWithFormat:", CFSTR("USER_REMOVED_ALERT_%@_TITLE_%@"), v18, v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    MPULocalizedString();
    v20 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("USER_REMOVED_ALERT_%@_MESSAGE_%@"), v18, v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    MPULocalizedString();
    v22 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("USER_REMOVED_ALERT_DELETE_BUTTON_%@"), v15);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    MPULocalizedString();
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v64 = (void *)v20;
    objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:", v20, v22, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = MEMORY[0x24BDAC760];
    v78[0] = MEMORY[0x24BDAC760];
    v78[1] = 3221225472;
    v78[2] = __79__MPUPlaybackAlertController_userRemovedAlertControllerForItem_dismissalBlock___block_invoke;
    v78[3] = &unk_24DD2F850;
    v79 = v8;
    v27 = v66;
    v80 = v27;
    v28 = MEMORY[0x22074AE58](v78);
    v29 = (void *)MEMORY[0x24BDF67E8];
    v63 = (void *)v28;
    v65 = v8;
    if (v14)
    {
      v30 = (void *)v28;
      v61 = (void *)v22;
      MPULocalizedString();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v76[0] = v26;
      v76[1] = 3221225472;
      v76[2] = __79__MPUPlaybackAlertController_userRemovedAlertControllerForItem_dismissalBlock___block_invoke_2;
      v76[3] = &unk_24DD2F7B0;
      v60 = v27;
      v77 = v60;
      objc_msgSend(v29, "actionWithTitle:style:handler:", v31, 1, v76);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addAction:", v32);

      v33 = (void *)MEMORY[0x24BDF67E8];
      v74[0] = v26;
      v74[1] = 3221225472;
      v74[2] = __79__MPUPlaybackAlertController_userRemovedAlertControllerForItem_dismissalBlock___block_invoke_3;
      v74[3] = &unk_24DD2F7B0;
      v75 = v30;
      objc_msgSend(v33, "actionWithTitle:style:handler:", v24, 2, v74);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addAction:", v34);

      v6 = v62;
      objc_msgSend(v62, "storeItemID");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v35
        || (objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("itms://?action=lookup&ids=%@"), v35, 0),
            (v36 = objc_claimAutoreleasedReturnValue()) == 0)
        || (v37 = (void *)v36,
            objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v36),
            v38 = (void *)objc_claimAutoreleasedReturnValue(),
            v37,
            !v38))
      {
        if ((v12 & 4) != 0)
        {
          v39 = CFSTR("audiobooks");
        }
        else if ((v12 & 0x1008) != 0)
        {
          v39 = CFSTR("itunes-u");
        }
        else
        {
          if ((v12 & 0x100) != 0)
            v39 = CFSTR("movies");
          else
            v39 = CFSTR("music-videos");
          if ((v12 & 0x900) == 0)
          {
            if ((v12 & 0x402) != 0)
            {
              v39 = CFSTR("podcasts");
            }
            else if ((v12 & 0x200) != 0)
            {
              v39 = CFSTR("tv-shows");
            }
            else if ((v12 & 0xFF00) != 0)
            {
              v39 = CFSTR("movie");
            }
            else
            {
              v39 = CFSTR("music");
            }
          }
        }
        v50 = (void *)MEMORY[0x24BDBCF48];
        v51 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "bundleIdentifier");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "stringWithFormat:", CFSTR("itms://?action=%@&libraryid=%@"), v39, v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "URLWithString:", v54);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v55 = (void *)MEMORY[0x24BDF67E8];
      MPULocalizedString();
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v71[0] = MEMORY[0x24BDAC760];
      v71[1] = 3221225472;
      v71[2] = __79__MPUPlaybackAlertController_userRemovedAlertControllerForItem_dismissalBlock___block_invoke_4;
      v71[3] = &unk_24DD2F878;
      v72 = v38;
      v73 = v60;
      v57 = v38;
      objc_msgSend(v55, "actionWithTitle:style:handler:", v56, 0, v71);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v25;
      objc_msgSend(v25, "addAction:", v58);

      v45 = v63;
      v49 = v64;
      v44 = v61;
      v7 = v66;
      v47 = &v75;
      v41 = &v77;
    }
    else
    {
      MPULocalizedString();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v69[0] = v26;
      v69[1] = 3221225472;
      v69[2] = __79__MPUPlaybackAlertController_userRemovedAlertControllerForItem_dismissalBlock___block_invoke_5;
      v69[3] = &unk_24DD2F7B0;
      v41 = &v70;
      v70 = v27;
      objc_msgSend(v29, "actionWithTitle:style:handler:", v40, 1, v69);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addAction:", v42);

      v43 = (void *)MEMORY[0x24BDF67E8];
      v67[0] = v26;
      v67[1] = 3221225472;
      v67[2] = __79__MPUPlaybackAlertController_userRemovedAlertControllerForItem_dismissalBlock___block_invoke_6;
      v67[3] = &unk_24DD2F7B0;
      v44 = (void *)v22;
      v45 = v63;
      v7 = v66;
      v46 = v25;
      v47 = &v68;
      v68 = v63;
      objc_msgSend(v43, "actionWithTitle:style:handler:", v24, 2, v67);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v46;
      objc_msgSend(v46, "addAction:", v35);
      v49 = v64;
      v6 = v62;
    }

    v11 = v48;
    v8 = v65;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t __79__MPUPlaybackAlertController_userRemovedAlertControllerForItem_dismissalBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t result;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "mediaLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeItems:", v4);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __79__MPUPlaybackAlertController_userRemovedAlertControllerForItem_dismissalBlock___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __79__MPUPlaybackAlertController_userRemovedAlertControllerForItem_dismissalBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __79__MPUPlaybackAlertController_userRemovedAlertControllerForItem_dismissalBlock___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openURL:options:completionHandler:", *(_QWORD *)(a1 + 32), MEMORY[0x24BDBD1B8], 0);

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __79__MPUPlaybackAlertController_userRemovedAlertControllerForItem_dismissalBlock___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __79__MPUPlaybackAlertController_userRemovedAlertControllerForItem_dismissalBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (int64_t)playbackAlertType
{
  return self->_playbackAlertType;
}

- (MPAVItem)item
{
  return self->_item;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

void __100__MPUPlaybackAlertController_contentRestrictedPlaybackAlertControllerForContentType_dismissalBlock___block_invoke_2_cold_1()
{
  dlerror();
  abort_report_np();
  __getLSApplicationWorkspaceClass_block_invoke_cold_1();
}

@end
