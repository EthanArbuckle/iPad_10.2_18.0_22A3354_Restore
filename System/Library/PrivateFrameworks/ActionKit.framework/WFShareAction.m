@implementation WFShareAction

- (WFShareAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5
{
  WFShareAction *v5;
  WFShareAction *v6;
  WFShareAction *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFShareAction;
  v5 = -[WFShareAction initWithIdentifier:definition:serializedParameters:](&v9, sel_initWithIdentifier_definition_serializedParameters_, a3, a4, a5);
  v6 = v5;
  if (v5)
    v7 = v5;

  return v6;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFShareAction supportedExtensionsChangedObserver](self, "supportedExtensionsChangedObserver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", v4);

  v5.receiver = self;
  v5.super_class = (Class)WFShareAction;
  -[WFShareAction dealloc](&v5, sel_dealloc);
}

- (void)initializeParameters
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WFShareAction;
  -[WFShareAction initializeParameters](&v11, sel_initializeParameters);
  -[WFShareAction parameterForKey:](self, "parameterForKey:", CFSTR("WFApp"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAppListProvider:", self);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "sharedEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __37__WFShareAction_initializeParameters__block_invoke;
  v9[3] = &unk_24F8B50D8;
  v10 = v3;
  v7 = v3;
  objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", CFSTR("WFExtensionEnumeratorSupportedExtensionsChanged"), v5, v6, v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFShareAction setSupportedExtensionsChangedObserver:](self, "setSupportedExtensionsChangedObserver:", v8);

}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;

  v4 = a3;
  if (objc_msgSend(v4, "numberOfItems"))
  {
    v18 = 0;
    objc_msgSend(v4, "attributionSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEligibleToShareWithResultManagedLevel:", &v18);

    if ((v6 & 1) != 0)
    {
      v7 = v18;
      -[WFShareAction selectedIdentifier](self, "selectedIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        -[WFShareAction overrideExtensionIdentifier](self, "overrideExtensionIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
        -[WFShareAction userInterface](self, "userInterface");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isRunningWithSiriUI");

        if (v14)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "wfUnsupportedUserInterfaceError");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFShareAction finishRunningWithError:](self, "finishRunningWithError:", v15);

        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1618], "wf_securelyArchivedDataWithRootObject:deletionResponsibility:", v4, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFShareAction showUIWithArchivedItems:isContentManaged:extensionBundleIdentifier:](self, "showUIWithArchivedItems:isContentManaged:extensionBundleIdentifier:", v16, v7 == 2, v11);

        }
        goto LABEL_13;
      }
      v17 = 0;
      -[WFShareAction anyExtensionBundleIdentifierForIdentifier:extensionPointIdentifier:isContentManaged:error:](self, "anyExtensionBundleIdentifierForIdentifier:extensionPointIdentifier:isContentManaged:error:", v8, CFSTR("com.apple.share-services"), v7 == 2, &v17);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v17;
      v11 = v10;
      if (v9)
      {

        v11 = (void *)v9;
        goto LABEL_10;
      }
    }
    else
    {
      v12 = (void *)MEMORY[0x24BDD1540];
      -[WFShareAction localizedName](self, "localizedName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sharingMixedMDMContentErrorWithActionName:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[WFShareAction finishRunningWithError:](self, "finishRunningWithError:", v11);
LABEL_13:

    goto LABEL_14;
  }
  -[WFShareAction finishRunningWithError:](self, "finishRunningWithError:", 0);
LABEL_14:

}

- (id)overrideExtensionIdentifier
{
  return 0;
}

- (void)showUIWithArchivedItems:(id)a3 isContentManaged:(BOOL)a4 extensionBundleIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  BOOL v15;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __84__WFShareAction_showUIWithArchivedItems_isContentManaged_extensionBundleIdentifier___block_invoke;
  v12[3] = &unk_24F8B9470;
  v12[4] = self;
  v13 = v8;
  v15 = a4;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[WFShareAction requestUnlock:](self, "requestUnlock:", v12);

}

- (NSString)associatedAppBundleIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[WFShareAction selectedIdentifier](self, "selectedIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9BD0]), "initWithBundleIdentifier:", v2);
  objc_msgSend(MEMORY[0x24BDD9BF0], "sharedResolver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolvedAppMatchingDescriptor:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
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
  -[WFShareAction associatedAppBundleIdentifier](self, "associatedAppBundleIdentifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "initWithBundleIdentifier:", v9);
  (*((void (**)(id, void *))a3 + 2))(v6, v8);

}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  -[WFShareAction input](self, "input");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  v6 = v4;
  WFGetContentLocationFromURLActionInput();

}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x24BDD17C8];
  v10 = a5;
  if (v7)
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to share %2$@ with ”%3$@”?"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringWithFormat:", v11, v10, v7);
  }
  else
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to share content with ”%2$@”?"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringWithFormat:", v11, v10, v8);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)anyExtensionBundleIdentifierForIdentifier:(id)a3 extensionPointIdentifier:(id)a4 isContentManaged:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id *v53;
  id v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[4];
  id v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  uint64_t v64;

  v7 = a5;
  v64 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = v12;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFShareAction.m"), 237, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    if (v13)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFShareAction.m"), 238, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("extensionPointIdentifier"));

LABEL_3:
  v59 = 0;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v11, 1, &v59);
  v15 = v59;
  v16 = v15;
  if (v14)
  {
    v53 = a6;
    v54 = v15;
    objc_msgSend(v14, "applicationExtensionRecords");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x24BDD1758];
    v19 = MEMORY[0x24BDAC760];
    v57[0] = MEMORY[0x24BDAC760];
    v57[1] = 3221225472;
    v57[2] = __107__WFShareAction_anyExtensionBundleIdentifierForIdentifier_extensionPointIdentifier_isContentManaged_error___block_invoke;
    v57[3] = &unk_24F8B5100;
    v58 = v13;
    objc_msgSend(v18, "predicateWithBlock:", v57);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "filteredSetUsingPredicate:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(MEMORY[0x24BE19570], "defaultProfile");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "allObjects");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "if_compactMap:", &__block_literal_global_24902);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "allowedOpenInAppBundleIDsAfterApplyingFilterToAppBundleIDs:originatingAppBundleID:originatingAccountIsManaged:", v25, *MEMORY[0x24BEC17D8], v7);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setWithArray:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v55[0] = v19;
    v55[1] = 3221225472;
    v55[2] = __107__WFShareAction_anyExtensionBundleIdentifierForIdentifier_extensionPointIdentifier_isContentManaged_error___block_invoke_3;
    v55[3] = &unk_24F8B5168;
    v28 = v27;
    v56 = v28;
    objc_msgSend(v21, "if_compactMap:", v55);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "anyObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v30)
    {
      objc_msgSend(v30, "bundleIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v53)
      {
        objc_msgSend(v14, "localizedName");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        WFLocalizedString(CFSTR("No Share Extension"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = (void *)MEMORY[0x24BDD17C8];
        WFLocalizedString(CFSTR("The app “%@” does not have a Share extension."));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "stringWithFormat:", v41, v52);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        v49 = (void *)MEMORY[0x24BDD1540];
        v48 = *MEMORY[0x24BEC4270];
        v42 = *MEMORY[0x24BDD0FC8];
        v60 = *MEMORY[0x24BDD0FD8];
        v61 = v42;
        v62 = v51;
        v63 = v50;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v62, &v60, 2);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "errorWithDomain:code:userInfo:", v48, 10, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        *v53 = v44;
      }
      v32 = 0;
    }
    v16 = v54;

  }
  else if (a6)
  {
    WFLocalizedString(CFSTR("App Not Installed"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    WFLocalizedString(CFSTR("The selected app is not installed on this device."));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)MEMORY[0x24BDD1540];
    v36 = *MEMORY[0x24BEC4270];
    v37 = *MEMORY[0x24BDD0FC8];
    v60 = *MEMORY[0x24BDD0FD8];
    v61 = v37;
    v62 = v33;
    v63 = v34;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v62, &v60, 2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "errorWithDomain:code:userInfo:", v36, 10, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = 0;
    *a6 = v39;
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (id)selectedIdentifier
{
  void *v2;
  void *v3;

  -[WFShareAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFApp"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)appEnumerator
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)objc_opt_class(), "sharedEnumerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportedApplicationRecords");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:selector:", CFSTR("localizedName"), 1, sel_localizedStandardCompare_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingDescriptors:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSObject)supportedExtensionsChangedObserver
{
  return self->_supportedExtensionsChangedObserver;
}

- (void)setSupportedExtensionsChangedObserver:(id)a3
{
  objc_storeStrong((id *)&self->_supportedExtensionsChangedObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedExtensionsChangedObserver, 0);
}

uint64_t __107__WFShareAction_anyExtensionBundleIdentifierForIdentifier_extensionPointIdentifier_isContentManaged_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "extensionPointRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

id __107__WFShareAction_anyExtensionBundleIdentifierForIdentifier_extensionPointIdentifier_isContentManaged_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a2;
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v5, "containsObject:", v6);

    if ((_DWORD)v5)
      v4 = v3;
    else
      v4 = 0;
  }

  return v4;
}

uint64_t __107__WFShareAction_anyExtensionBundleIdentifierForIdentifier_extensionPointIdentifier_isContentManaged_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bundleIdentifier");
}

void __60__WFShareAction_getContentDestinationWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v2 + 16))(*(_QWORD *)(a1 + 32), a2, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE19390], "shareExtensionLocation");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, 0);

  }
}

void __84__WFShareAction_showUIWithArchivedItems_isContentManaged_extensionBundleIdentifier___block_invoke(uint64_t a1, char a2)
{
  void *v2;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;
  char v11;

  v2 = *(void **)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __84__WFShareAction_showUIWithArchivedItems_isContentManaged_extensionBundleIdentifier___block_invoke_2;
    v7[3] = &unk_24F8BA5F8;
    v8 = *(id *)(a1 + 40);
    v11 = *(_BYTE *)(a1 + 56);
    v4 = *(id *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 32);
    v9 = v4;
    v10 = v5;
    objc_msgSend(v2, "requestInterfacePresentationWithCompletionHandler:", v7);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "deviceLockedError");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "finishRunningWithError:", v6);

  }
}

void __84__WFShareAction_showUIWithArchivedItems_isContentManaged_extensionBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v7;
  _QWORD v8[5];

  if (a2)
  {
    v2 = *(unsigned __int8 *)(a1 + 56);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __84__WFShareAction_showUIWithArchivedItems_isContentManaged_extensionBundleIdentifier___block_invoke_3;
    v8[3] = &unk_24F8BB6B0;
    v8[4] = *(_QWORD *)(a1 + 48);
    objc_msgSend(a2, "showWithArchivedItems:isContentManaged:extensionBundleIdentifier:extensionPointIdentifier:completionHandler:", v3, v2, v4, CFSTR("com.apple.share-services"), v8);
  }
  else
  {
    v5 = *(void **)(a1 + 48);
    objc_msgSend(v5, "input");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7.receiver = v5;
    v7.super_class = (Class)WFShareAction;
    objc_msgSendSuper2(&v7, sel_runAsynchronouslyWithInput_, v6);

  }
}

void __84__WFShareAction_showUIWithArchivedItems_isContentManaged_extensionBundleIdentifier___block_invoke_3(uint64_t a1, void *a2, void *a3)
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
        objc_msgSend(v12, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

uint64_t __37__WFShareAction_initializeParameters__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadPossibleStates");
}

+ (id)userInterfaceProtocol
{
  return &unk_255DFD010;
}

+ (id)userInterfaceXPCInterface
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___WFShareAction;
  objc_msgSendSuper2(&v8, sel_userInterfaceXPCInterface);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_showWithArchivedItems_isContentManaged_extensionBundleIdentifier_extensionPointIdentifier_completionHandler_, 0, 0);

  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_showWithArchivedItems_isContentManaged_extensionBundleIdentifier_extensionPointIdentifier_completionHandler_, 0, 1);

  return v2;
}

+ (id)sharedEnumerator
{
  if (sharedEnumerator_onceToken != -1)
    dispatch_once(&sharedEnumerator_onceToken, &__block_literal_global_216);
  return (id)sharedEnumerator_enumerator;
}

void __33__WFShareAction_sharedEnumerator__block_invoke()
{
  WFExtensionEnumerator *v0;
  void *v1;

  v0 = -[WFExtensionEnumerator initWithExtensionPointIdentifier:]([WFExtensionEnumerator alloc], "initWithExtensionPointIdentifier:", CFSTR("com.apple.share-services"));
  v1 = (void *)sharedEnumerator_enumerator;
  sharedEnumerator_enumerator = (uint64_t)v0;

}

@end
