@implementation WFSendEmailAction

- (id)requiredResourcesForIntentAvailableResource
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[2];
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BEC3F40]);
  v3 = *MEMORY[0x24BEC45E0];
  v8[0] = *MEMORY[0x24BEC45D8];
  v8[1] = v3;
  v9[0] = CFSTR("WFSendEmailActionShowComposeSheet");
  v9[1] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithDefinition:", v4);
  v10[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)populatesInputFromInputParameter
{
  return 1;
}

- (void)prepareEmailContentFromInput:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  WFSendEmailContent *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  id v19;
  WFSendEmailContent *v20;
  void *v21;
  _QWORD v22[5];
  WFSendEmailContent *v23;
  id v24;
  _QWORD v25[5];
  _QWORD v26[4];

  v26[3] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSendEmailAction.m"), 87, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  v26[0] = CFSTR("WFSendEmailActionToRecipients");
  v26[1] = CFSTR("WFSendEmailActionCcRecipients");
  v26[2] = CFSTR("WFSendEmailActionBccRecipients");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __68__WFSendEmailAction_prepareEmailContentFromInput_completionHandler___block_invoke;
  v25[3] = &unk_24F8B6680;
  v25[4] = self;
  objc_msgSend(v9, "if_map:", v25);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc_init(WFSendEmailContent);
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSendEmailContent setToRecipients:](v12, "setToRecipients:", v13);

  objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSendEmailContent setCcRecipients:](v12, "setCcRecipients:", v14);

  objc_msgSend(v11, "objectAtIndexedSubscript:", 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSendEmailContent setBccRecipients:](v12, "setBccRecipients:", v15);

  -[WFSendEmailAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFSendEmailActionSubject"), objc_opt_class());
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (const __CFString *)v16;
  else
    v18 = &stru_24F8BBA48;
  -[WFSendEmailContent setSubject:](v12, "setSubject:", v18);

  v22[0] = v10;
  v22[1] = 3221225472;
  v22[2] = __68__WFSendEmailAction_prepareEmailContentFromInput_completionHandler___block_invoke_3;
  v22[3] = &unk_24F8B66F8;
  v22[4] = self;
  v23 = v12;
  v24 = v8;
  v19 = v8;
  v20 = v12;
  -[WFSendEmailAction generateEmailFromInput:completionHandler:](self, "generateEmailFromInput:completionHandler:", v7, v22);

}

- (BOOL)checkManagementLevel:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  char v30;
  BOOL v31;
  char v32;
  void *v33;
  void *v34;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  _QWORD v41[5];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[7];

  v46[5] = *MEMORY[0x24BDAC8D0];
  v37 = a3;
  v40 = 0;
  -[WFSendEmailAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFSendEmailActionToRecipients"), objc_opt_class());
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSendEmailAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFSendEmailActionCcRecipients"), objc_opt_class());
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSendEmailAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFSendEmailActionBccRecipients"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSendEmailAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFEmailAccountActionSelectedAccount"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "attributionSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE19428], "attributionSetByMergingAttributionSets:", MEMORY[0x24BDBD1A8]);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  objc_msgSend(v38, "attributionSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE19428], "attributionSetByMergingAttributionSets:", MEMORY[0x24BDBD1A8]);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  objc_msgSend(v5, "attributionSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17 = v15;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE19428], "attributionSetByMergingAttributionSets:", MEMORY[0x24BDBD1A8]);
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;

  objc_msgSend(v6, "attributionSet");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    v21 = v19;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE19428], "attributionSetByMergingAttributionSets:", MEMORY[0x24BDBD1A8]);
    v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  v22 = v21;

  v23 = (void *)MEMORY[0x24BE19428];
  objc_msgSend(v37, "attributionSet");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v24;
  v46[1] = v10;
  v46[2] = v14;
  v46[3] = v18;
  v46[4] = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "attributionSetByMergingAttributionSets:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v26, "isEligibleToShareWithResultManagedLevel:", &v40) & 1) != 0)
  {
    -[WFSendEmailAction setContentManaged:](self, "setContentManaged:", v40 == 2);
    if (-[WFSendEmailAction isContentManaged](self, "isContentManaged"))
      v27 = 2;
    else
      v27 = 1;
    v42 = 0;
    v43 = &v42;
    v44 = 0x2050000000;
    v28 = (void *)getMFMailComposeViewControllerClass_softClass;
    v45 = getMFMailComposeViewControllerClass_softClass;
    if (!getMFMailComposeViewControllerClass_softClass)
    {
      v41[0] = MEMORY[0x24BDAC760];
      v41[1] = 3221225472;
      v41[2] = __getMFMailComposeViewControllerClass_block_invoke;
      v41[3] = &unk_24F8BB430;
      v41[4] = &v42;
      __getMFMailComposeViewControllerClass_block_invoke((uint64_t)v41);
      v28 = (void *)v43[3];
    }
    v29 = objc_retainAutorelease(v28);
    _Block_object_dispose(&v42, 8);
    v30 = objc_msgSend(v29, "canSendMailSourceAccountManagement:", v27);
    v31 = v30;
    if (a4)
      v32 = v30;
    else
      v32 = 1;
    if ((v32 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "wf_mailComposerUnavailableError");
      v31 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    if (a4)
    {
      v33 = (void *)MEMORY[0x24BDD1540];
      -[WFSendEmailAction localizedName](self, "localizedName");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "sharingMixedMDMContentErrorWithActionName:", v34);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v31 = 0;
  }

  return v31;
}

- (void)generateBodyFromCollection:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    if (objc_msgSend(v5, "numberOfItems") != 1)
      goto LABEL_5;
    objc_msgSend(v5, "items");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __66__WFSendEmailAction_generateBodyFromCollection_completionHandler___block_invoke;
      v14[3] = &unk_24F8BA110;
      v15 = v6;
      objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF83F8]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "getFileRepresentation:forType:", v14, v10);

      v11 = v15;
    }
    else
    {
LABEL_5:
      if (!objc_msgSend(v5, "numberOfItems"))
      {
        (*((void (**)(id, const __CFString *, _QWORD))v6 + 2))(v6, &stru_24F8BBA48, 0);
        goto LABEL_9;
      }
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __66__WFSendEmailAction_generateBodyFromCollection_completionHandler___block_invoke_2;
      v12[3] = &unk_24F8B9110;
      v13 = v6;
      objc_msgSend(v5, "getStringRepresentations:", v12);
      v11 = v13;
    }

  }
LABEL_9:

}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  int v6;
  BOOL v7;
  id v8;
  objc_super v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v4 = a3;
  -[WFSendEmailAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFSendEmailActionShowComposeSheet"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  v12 = 0;
  v7 = -[WFSendEmailAction checkManagementLevel:error:](self, "checkManagementLevel:error:", v4, &v12);
  v8 = v12;
  if (v7)
  {
    if (v6)
    {
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __48__WFSendEmailAction_runAsynchronouslyWithInput___block_invoke;
      v10[3] = &unk_24F8B6720;
      v10[4] = self;
      v11 = v4;
      -[WFSendEmailAction requestInterfacePresentationWithCompletionHandler:](self, "requestInterfacePresentationWithCompletionHandler:", v10);

    }
    else
    {
      v9.receiver = self;
      v9.super_class = (Class)WFSendEmailAction;
      -[WFHandleIntentAction runAsynchronouslyWithInput:](&v9, sel_runAsynchronouslyWithInput_, v4);
    }
  }
  else
  {
    -[WFHandleIntentAction finishRunningWithError:](self, "finishRunningWithError:", v8);
  }

}

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  WFSendEmailAction *v14;

  v6 = a3;
  v7 = a4;
  -[WFSendEmailAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFSendEmailActionFrom"), objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __54__WFSendEmailAction_runWithRemoteUserInterface_input___block_invoke;
  v11[3] = &unk_24F8B6748;
  v12 = v6;
  v13 = v8;
  v14 = self;
  v9 = v8;
  v10 = v6;
  -[WFSendEmailAction prepareEmailContentFromInput:completionHandler:](self, "prepareEmailContentFromInput:completionHandler:", v7, v11);

}

- (BOOL)parameterCombinationForIntentSupportsBackgroundExecution:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;
  objc_super v16;

  v4 = a3;
  -[WFSendEmailAction userInterface](self, "userInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[WFSendEmailAction userInterface](self, "userInterface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "requestedFromAnotherDevice");

  }
  else
  {
    v7 = 0;
  }

  -[WFSendEmailAction runningDelegate](self, "runningDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[WFSendEmailAction runningDelegate](self, "runningDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentRunningContextForAction:", self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "workflowIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      v13 = 1;
    else
      v13 = v7;
    if ((v13 & 1) != 0)
      goto LABEL_9;
LABEL_11:
    v16.receiver = self;
    v16.super_class = (Class)WFSendEmailAction;
    v14 = -[WFHandleIntentAction parameterCombinationForIntentSupportsBackgroundExecution:](&v16, sel_parameterCombinationForIntentSupportsBackgroundExecution_, v4);
    goto LABEL_12;
  }
  if ((v7 & 1) == 0)
    goto LABEL_11;
LABEL_9:
  v14 = 1;
LABEL_12:

  return v14;
}

- (id)showsWhenRunIfApplicable
{
  return (id)-[WFSendEmailAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFSendEmailActionShowComposeSheet"), objc_opt_class());
}

- (id)prioritizedParameterKeysForRemoteExecution
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("WFSendEmailActionShowComposeSheet");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)requiresRemoteExecution
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFSendEmailAction;
  return -[WFHandleIntentAction requiresRemoteExecution](&v3, sel_requiresRemoteExecution);
}

- (void)resolveSlot:(id)a3 withProcessedValue:(id)a4 parameter:(id)a5 input:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, void *, _QWORD);
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  int v28;
  id v29;
  void *v30;
  void *v31;
  objc_super v32;
  objc_super v33;
  _QWORD v34[5];
  void (**v35)(id, void *, _QWORD);
  _QWORD v36[5];
  void (**v37)(id, void *, _QWORD);

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, void *, _QWORD))a7;
  objc_msgSend(v12, "wf_slotName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v17, "isEqualToString:", CFSTR("to")) & 1) != 0)
    goto LABEL_4;
  objc_msgSend(v12, "wf_slotName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v18, "isEqualToString:", CFSTR("cc")))
  {
    objc_msgSend(v12, "wf_slotName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("bcc"));

    if ((v20 & 1) != 0)
      goto LABEL_5;
    objc_msgSend(v12, "wf_slotName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("body"));

    if (v22)
    {
      -[WFSendEmailAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFSendEmailActionBodyOverride"), objc_opt_class());
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        v16[2](v16, v23, 0);
      }
      else
      {
        -[WFSendEmailAction input](self, "input");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v36[0] = MEMORY[0x24BDAC760];
        v36[1] = 3221225472;
        v36[2] = __79__WFSendEmailAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke;
        v36[3] = &unk_24F8B6798;
        v36[4] = self;
        v37 = v16;
        -[WFSendEmailAction generateEmailFromInput:completionHandler:](self, "generateEmailFromInput:completionHandler:", v31, v36);

      }
      goto LABEL_20;
    }
    objc_msgSend(v12, "wf_slotName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("attachments"));

    if (v25)
    {
      -[WFSendEmailAction input](self, "input");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x24BDAC760];
      v34[1] = 3221225472;
      v34[2] = __79__WFSendEmailAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke_3;
      v34[3] = &unk_24F8B6798;
      v34[4] = self;
      v35 = v16;
      -[WFSendEmailAction generateEmailFromInput:completionHandler:](self, "generateEmailFromInput:completionHandler:", v26, v34);

      goto LABEL_6;
    }
    objc_msgSend(v12, "wf_slotName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("subject"));

    if (!v28)
    {
      -[WFHandleIntentAction resolveSlot:withProcessedValue:parameter:input:completion:](&v32, sel_resolveSlot_withProcessedValue_parameter_input_completion_, v12, v13, v14, v15, v16, self, WFSendEmailAction, v33.receiver, v33.super_class);
      goto LABEL_6;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = v13;
      v23 = v29;
      if (!v29)
      {
        v16[2](v16, &stru_24F8BBA48, 0);
        goto LABEL_20;
      }
      if (objc_msgSend(v29, "wf_stringContainsNewlineCharacters"))
      {
        objc_msgSend(v23, "wf_stringByReplacingNewlinesWithSpaces");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v16[2](v16, v30, 0);

LABEL_20:
        goto LABEL_6;
      }

    }
    -[WFHandleIntentAction resolveSlot:withProcessedValue:parameter:input:completion:](&v33, sel_resolveSlot_withProcessedValue_parameter_input_completion_, v12, v13, v14, v15, v16, v32.receiver, v32.super_class, self, WFSendEmailAction);
    goto LABEL_6;
  }

LABEL_4:
LABEL_5:
  -[WFSendEmailAction getRecipientsFromParameterValue:completion:](self, "getRecipientsFromParameterValue:completion:", v13, v16);
LABEL_6:

}

- (void)getRecipientsFromParameterValue:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v6 = v5;
  if (a3)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __64__WFSendEmailAction_getRecipientsFromParameterValue_completion___block_invoke;
    v7[3] = &unk_24F8B7A08;
    v8 = v5;
    objc_msgSend(a3, "getRecipientsWithPermissionRequestor:completionHandler:", 0, v7);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v5 + 2))(v5, MEMORY[0x24BDBD1A8], 0);
  }

}

- (void)generateFilesFromCollection:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "numberOfItems"))
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __60__WFSendEmailAction_generateFilesFromCollection_completion___block_invoke;
    v7[3] = &unk_24F8B9110;
    v8 = v6;
    objc_msgSend(v5, "getFileRepresentations:forType:", v7, 0);

  }
  else
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, MEMORY[0x24BDBD1A8]);
  }

}

- (void)generateEmailFromInput:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a3;
  v6 = a4;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))v6;
  if (v6)
  {
    if (v5)
    {
      v13 = 0;
      objc_msgSend(v5, "collectionByFilteringItemsWithBlock:excludedItems:", &__block_literal_global_443, &v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v13;
      if (!objc_msgSend(v9, "numberOfItems"))
      {
        objc_msgSend(v8, "collectionByFilteringToItemClass:excludedItems:", objc_opt_class(), 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "numberOfItems"))
        {
          objc_msgSend(v10, "items");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "firstObject");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "addItem:", v12);
          objc_msgSend(v8, "removeItem:", v12);

        }
      }
      ((void (**)(_QWORD, id, void *))v7)[2](v7, v9, v8);

    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
    }
  }

}

- (id)serializedParametersForDonatedIntent:(id)a3 allowDroppingUnconfigurableValues:(BOOL)a4
{
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFSendEmailAction;
  -[WFHandleCustomIntentAction serializedParametersForDonatedIntent:allowDroppingUnconfigurableValues:](&v7, sel_serializedParametersForDonatedIntent_allowDroppingUnconfigurableValues_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v5, "setObject:forKey:", MEMORY[0x24BDBD1C0], CFSTR("WFSendEmailActionShowComposeSheet"));

  return v5;
}

- (id)contentDestinationWithError:(id *)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  -[WFSendEmailAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFSendEmailActionShowComposeSheet"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  -[WFSendEmailAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFEmailAccountActionSelectedAccount"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = &v21;
  v23 = 0x2050000000;
  v8 = (void *)getMFMailAccountProxyGeneratorClass_softClass;
  v24 = getMFMailAccountProxyGeneratorClass_softClass;
  if (!getMFMailAccountProxyGeneratorClass_softClass)
  {
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __getMFMailAccountProxyGeneratorClass_block_invoke;
    v20[3] = &unk_24F8BB430;
    v20[4] = &v21;
    __getMFMailAccountProxyGeneratorClass_block_invoke((uint64_t)v20);
    v8 = (void *)v22[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v21, 8);
  v10 = (void *)objc_msgSend([v9 alloc], "initWithAllowsRestrictedAccounts:", 0);
  objc_msgSend(v10, "accountProxyContainingEmailAddress:includingInactive:", v7, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uniqueID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v5 ^ 1u;
  v14 = objc_alloc(MEMORY[0x24BDD9BD0]);
  v15 = (void *)objc_msgSend(v14, "initWithBundleIdentifier:", *MEMORY[0x24BEC16E0]);
  objc_msgSend(MEMORY[0x24BDD9BF0], "sharedResolver");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "resolvedAppMatchingDescriptor:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(MEMORY[0x24BE19368], "locationWithAccountIdentifier:appDescriptor:promptingBehaviour:", v12, v17, v13);
  else
    objc_msgSend(MEMORY[0x24BE19390], "locationWithAppDescriptor:promptingBehaviour:", v17, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = a5;
  if (v6)
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to send %2$@ in an email?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to send an email?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isContentManaged
{
  return self->_contentManaged;
}

- (void)setContentManaged:(BOOL)a3
{
  self->_contentManaged = a3;
}

uint64_t __62__WFSendEmailAction_generateEmailFromInput_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v3 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    v3 = 0;
  }

  return v3 & 1;
}

void __60__WFSendEmailAction_generateFilesFromCollection_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "if_compactMap:", &__block_literal_global_440);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

id __60__WFSendEmailAction_generateFilesFromCollection_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v2 = a2;
  if (objc_msgSend(v2, "representationType") == 1)
  {
    v3 = (void *)MEMORY[0x24BDD9D30];
    objc_msgSend(v2, "fileURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "filename");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "wfType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fileWithFileURL:filename:typeIdentifier:", v4, v5, v7);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v9 = (void *)v8;

    goto LABEL_7;
  }
  if (!objc_msgSend(v2, "representationType"))
  {
    v10 = (void *)MEMORY[0x24BDD9D30];
    objc_msgSend(v2, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "filename");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "wfType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fileWithData:filename:typeIdentifier:", v4, v5, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v9 = 0;
LABEL_7:

  return v9;
}

uint64_t __64__WFSendEmailAction_getRecipientsFromParameterValue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __79__WFSendEmailAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __79__WFSendEmailAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke_2;
  v4[3] = &unk_24F8B6770;
  v3 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "generateBodyFromCollection:completionHandler:", a2, v4);

}

void __79__WFSendEmailAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  _QWORD v5[4];
  id v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __79__WFSendEmailAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke_4;
  v5[3] = &unk_24F8BAD00;
  v4 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "generateFilesFromCollection:completion:", a3, v5);

}

uint64_t __79__WFSendEmailAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __79__WFSendEmailAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;

  v5 = a2;
  v6 = v5;
  if ((a3 & 1) == 0)
  {
    v9 = v5;
    objc_msgSend(v5, "gtm_stringByEscapingForHTML");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("<br/>"));
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v8;
  }
  v10 = v6;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __54__WFSendEmailAction_runWithRemoteUserInterface_input___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[5];

  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = (void *)a1[6];
  v6 = a2;
  v7 = objc_msgSend(v5, "isContentManaged");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __54__WFSendEmailAction_runWithRemoteUserInterface_input___block_invoke_2;
  v8[3] = &unk_24F8B7B00;
  v8[4] = a1[6];
  objc_msgSend(v3, "showWithEmailContent:preferredSendingEmailAddress:isManaged:completionHandler:", v6, v4, v7, v8);

}

uint64_t __54__WFSendEmailAction_runWithRemoteUserInterface_input___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
}

uint64_t __48__WFSendEmailAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;

  v4 = *(void **)(a1 + 32);
  if (a3)
    return objc_msgSend(v4, "finishRunningWithError:");
  else
    return objc_msgSend(v4, "runWithRemoteUserInterface:input:", a2, *(_QWORD *)(a1 + 40));
}

void __66__WFSendEmailAction_generateBodyFromCollection_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (objc_class *)MEMORY[0x24BDD17C8];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(v4, "mappedData");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v5, "initWithData:encoding:", v7, 4);
  (*(void (**)(uint64_t, void *, uint64_t))(v2 + 16))(v2, v6, 1);

}

void __66__WFSendEmailAction_generateBodyFromCollection_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "componentsJoinedByString:", CFSTR("\n"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

id __68__WFSendEmailAction_prepareEmailContentFromInput_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "parameterValueForKey:ofClass:", v3, objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "entries");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "if_compactMap:", &__block_literal_global_32927);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v6;
}

void __68__WFSendEmailAction_prepareEmailContentFromInput_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v5 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __68__WFSendEmailAction_prepareEmailContentFromInput_completionHandler___block_invoke_4;
  v8[3] = &unk_24F8B66D0;
  v9 = v5;
  v6 = *(void **)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  v7 = v5;
  objc_msgSend(v6, "generateBodyFromCollection:completionHandler:", a2, v8);

}

void __68__WFSendEmailAction_prepareEmailContentFromInput_completionHandler___block_invoke_4(uint64_t a1, void *a2, char a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  char v12;

  v5 = a2;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __68__WFSendEmailAction_prepareEmailContentFromInput_completionHandler___block_invoke_5;
  v8[3] = &unk_24F8B66A8;
  v6 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v10 = v5;
  v12 = a3;
  v11 = *(id *)(a1 + 48);
  v7 = v5;
  objc_msgSend(v6, "getFileRepresentations:forType:", v8, 0);

}

uint64_t __68__WFSendEmailAction_prepareEmailContentFromInput_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "setBody:", v3);
  objc_msgSend(*(id *)(a1 + 32), "setIsHTML:", *(unsigned __int8 *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "setAttachments:", v5);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

WFSendRecipient *__68__WFSendEmailAction_prepareEmailContentFromInput_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  WFSendRecipient *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  WFSendRecipient *v12;
  WFSendRecipient *v13;

  v2 = a2;
  v3 = objc_msgSend(v2, "type");
  if (v3 == 2)
  {
    v13 = [WFSendRecipient alloc];
    objc_msgSend(v2, "emailAddress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "address");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "emailAddress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "address");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[WFSendRecipient initWithName:address:](v13, "initWithName:address:", v6, v8);
  }
  else
  {
    if (v3)
    {
      v12 = 0;
      goto LABEL_7;
    }
    v4 = [WFSendRecipient alloc];
    objc_msgSend(v2, "contact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "formattedName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "contact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "emailAddresses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "address");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[WFSendRecipient initWithName:address:](v4, "initWithName:address:", v6, v11);

  }
LABEL_7:

  return v12;
}

+ (id)userInterfaceProtocol
{
  return &unk_255DFD2F8;
}

@end
