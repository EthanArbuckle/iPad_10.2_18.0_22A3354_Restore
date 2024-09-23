@implementation WFSendMessageAction

+ (id)userInterfaceProtocol
{
  return &unk_255DFD828;
}

+ (id)userInterfaceXPCInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___WFSendMessageAction;
  objc_msgSendSuper2(&v8, sel_userInterfaceXPCInterface);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_showWithRecipients_content_attachments_completionHandler_, 0, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_showWithRecipients_content_attachments_completionHandler_, 0, 1);

  return v2;
}

- (id)generatedResourceNodes
{
  void *v3;
  void *v4;
  WFMessagesAccessResource *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  WFMessagesAccessResource *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)WFSendMessageAction;
  -[WFSendMessageAction generatedResourceNodes](&v17, sel_generatedResourceNodes);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (-[WFSendMessageAction isMessagesAppSelected](self, "isMessagesAppSelected"))
  {
    v5 = [WFMessagesAccessResource alloc];
    v19 = *MEMORY[0x24BEC4630];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[WFAccessResource initWithDefinition:](v5, "initWithDefinition:", v8);

    v10 = objc_alloc(MEMORY[0x24BEC3F40]);
    v11 = (void *)objc_msgSend(v10, "initWithParameterKey:parameterValues:relation:", *MEMORY[0x24BEC4420], &unk_24F93C5D0, *MEMORY[0x24BEC45E8]);
    v12 = objc_alloc(MEMORY[0x24BEC3FF8]);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC3FF8]), "initWithResource:", v11);
    v18 = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v12, "initWithResource:subnodes:", v9, v14);
    objc_msgSend(v4, "addObject:", v15);

  }
  return v4;
}

- (BOOL)isMessagesAppSelected
{
  void *v2;
  void *v3;
  char v4;

  -[WFHandleSystemIntentAction intentDescriptor](self, "intentDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayableBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BEC16F0]);

  return v4;
}

- (BOOL)opensInApp
{
  void *v3;
  char v4;
  objc_super v6;

  if (-[WFSendMessageAction isMessagesAppSelected](self, "isMessagesAppSelected"))
  {
    -[WFSendMessageAction userInterface](self, "userInterface");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isRunningWithSiriUI");

    return (v4 & 1) == 0 && -[WFHandleIntentAction showsWhenRun](self, "showsWhenRun");
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)WFSendMessageAction;
    return -[WFHandleIntentAction opensInApp](&v6, sel_opensInApp);
  }
}

- (BOOL)skipsProcessingHiddenParameters
{
  return 0;
}

- (id)minimumSupportedClientVersion
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  objc_super v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[WFSendMessageAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFSendMessageActionRecipients"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parameterStates");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v7)
        objc_enumerationMutation(v4);
      objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v8), "contact");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

  v14.receiver = self;
  v14.super_class = (Class)WFSendMessageAction;
  -[WFSendMessageAction minimumSupportedClientVersion](&v14, sel_minimumSupportedClientVersion);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  WFMaximumBundleVersion();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)localizedKeyParameterDisplayName
{
  return WFLocalizedString(CFSTR("Contact"));
}

- (void)resolveSlot:(id)a3 withProcessedValue:(id)a4 parameter:(id)a5 input:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  objc_super v23;
  _QWORD v24[4];
  id v25;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(v12, "wf_slotName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("content"));

  if (v18)
  {
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __81__WFSendMessageAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke;
    v24[3] = &unk_24F8B79A0;
    v25 = v16;
    -[WFSendMessageAction getContentFromInput:completionHandler:](self, "getContentFromInput:completionHandler:", v15, v24);

  }
  else
  {
    objc_msgSend(v12, "wf_slotName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("outgoingMessageType"));

    if (v20)
    {
      (*((void (**)(id, void *, _QWORD))v16 + 2))(v16, &unk_24F93B3A8, 0);
    }
    else
    {
      objc_msgSend(v12, "wf_slotName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("attachments"));

      if (v22)
      {
        -[WFSendMessageAction getINMessageAttachmentsFromInput:completionHandler:](self, "getINMessageAttachmentsFromInput:completionHandler:", v15, v16);
      }
      else
      {
        v23.receiver = self;
        v23.super_class = (Class)WFSendMessageAction;
        -[WFHandleIntentAction resolveSlot:withProcessedValue:parameter:input:completion:](&v23, sel_resolveSlot_withProcessedValue_parameter_input_completion_, v12, v13, v14, v15, v16);
      }
    }
  }

}

- (void)getRecipients:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[WFSendMessageAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFSendMessageActionRecipients"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (-[WFSendMessageAction isMessagesAppSelected](self, "isMessagesAppSelected"))
    {
      v6 = 0;
    }
    else
    {
      -[WFSendMessageAction contentPermissionRequestor](self, "contentPermissionRequestor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __37__WFSendMessageAction_getRecipients___block_invoke;
    v7[3] = &unk_24F8B7A08;
    v8 = v4;
    objc_msgSend(v5, "getRecipientsWithPermissionRequestor:completionHandler:", v6, v7);

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, MEMORY[0x24BDBD1A8]);
  }

}

- (void)getINMessageAttachmentsFromInput:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __74__WFSendMessageAction_getINMessageAttachmentsFromInput_completionHandler___block_invoke;
  v8[3] = &unk_24F8B79A0;
  v9 = v6;
  v7 = v6;
  -[WFSendMessageAction getContentFromInput:completionHandler:](self, "getContentFromInput:completionHandler:", a3, v8);

}

- (void)getContentFromInput:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, id, id);
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  __CFString *v17;
  id v18;
  void (**v19)(id, id, id);
  id v20;

  v6 = a3;
  v7 = (void (**)(id, id, id))a4;
  -[WFSendMessageAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFSendMessagePrefix"), objc_opt_class());
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = &stru_24F8BBA48;
  if (v8)
    v10 = (__CFString *)v8;
  v11 = v10;

  -[WFSendMessageAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFSendMessageContent"), objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "length"))
  {
    -[__CFString stringByAppendingString:](v11, "stringByAppendingString:", v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v13, v6);
  }
  else
  {
    v20 = 0;
    objc_msgSend(v6, "collectionByFilteringItemsWithBlock:excludedItems:", &__block_literal_global_209, &v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v20;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __61__WFSendMessageAction_getContentFromInput_completionHandler___block_invoke_2;
    v16[3] = &unk_24F8BAD90;
    v17 = v11;
    v18 = v14;
    v19 = v7;
    v15 = v14;
    objc_msgSend(v13, "getStringRepresentations:", v16);

  }
}

- (BOOL)canSendAttachmentsWithIntentHandler:(id)a3 runningInSiri:(BOOL)a4 showWhenRun:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _BOOL4 v12;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = objc_msgSend(v8, "numberOfItems");
  if (!v9)
    goto LABEL_6;
  if (v9 != 1)
  {
    LOBYTE(v12) = 0;
    goto LABEL_8;
  }
  if (!v6
    || !v5
    || (objc_msgSend(v8, "items"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "firstObject"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = -[WFSendMessageAction isPhotoOrVideo:](self, "isPhotoOrVideo:", v11),
        v11,
        v10,
        v12))
  {
LABEL_6:
    LOBYTE(v12) = 1;
  }
LABEL_8:

  return v12;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  WFSendMessageAction *v10;
  id v11;
  BOOL v12;
  objc_super v13;

  v4 = a3;
  if (-[WFSendMessageAction isMessagesAppSelected](self, "isMessagesAppSelected"))
  {
    v5 = -[WFHandleIntentAction showsWhenRun](self, "showsWhenRun");
    -[WFSendMessageAction userInterface](self, "userInterface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __50__WFSendMessageAction_runAsynchronouslyWithInput___block_invoke;
    v8[3] = &unk_24F8B7AD8;
    v12 = v5;
    v9 = v6;
    v10 = self;
    v11 = v4;
    v7 = v6;
    -[WFSendMessageAction getContentFromInput:completionHandler:](self, "getContentFromInput:completionHandler:", v11, v8);

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)WFSendMessageAction;
    -[WFHandleIntentAction runAsynchronouslyWithInput:](&v13, sel_runAsynchronouslyWithInput_, v4);
  }

}

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __56__WFSendMessageAction_runWithRemoteUserInterface_input___block_invoke;
  v10[3] = &unk_24F8B8398;
  v10[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  -[WFSendMessageAction getRecipients:](self, "getRecipients:", v10);

}

- (id)recipientsParameter
{
  return (id)-[WFSendMessageAction parameterForKey:](self, "parameterForKey:", CFSTR("WFSendMessageActionRecipients"));
}

- (void)initializeParameters
{
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFSendMessageAction;
  -[WFHandleSystemIntentAction initializeParameters](&v5, sel_initializeParameters);
  v3 = -[WFSendMessageAction isMessagesAppSelected](self, "isMessagesAppSelected") ^ 1;
  -[WFSendMessageAction recipientsParameter](self, "recipientsParameter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsCustomHandles:", v3);

}

- (void)selectedAppDidChange
{
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFSendMessageAction;
  -[WFHandleSystemIntentAction selectedAppDidChange](&v5, sel_selectedAppDidChange);
  v3 = -[WFSendMessageAction isMessagesAppSelected](self, "isMessagesAppSelected") ^ 1;
  -[WFSendMessageAction recipientsParameter](self, "recipientsParameter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsCustomHandles:", v3);

}

- (id)actionForAppIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  objc_super v16;
  objc_super v17;
  id v18;
  _BYTE buf[24];
  void *v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v18 = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, &v18);
  v6 = v18;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD9BE0], "appInfoWithApplicationRecord:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "supportedIntentsByApp");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unionSet:", v9);

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "supportedIntentsGroupedByExtensionPoints");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __WFIntentsSupportedExcludingShareExtensions_block_invoke;
      v20 = &unk_24F8B7BA0;
      v21 = v8;
      objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", buf);

      v11 = v21;
    }
    else
    {
      objc_msgSend(v7, "supportedActionsByExtensions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "unionSet:", v11);
    }

    v14 = (void *)objc_msgSend(v8, "copy");
    if (objc_msgSend(v14, "containsObject:", CFSTR("INSendMessageIntent")))
    {
      v16.receiver = self;
      v16.super_class = (Class)WFSendMessageAction;
      -[WFHandleSystemIntentAction actionForAppIdentifier:](&v16, sel_actionForAppIdentifier_, v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    getWFActionsLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[WFSendMessageAction actionForAppIdentifier:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v4;
      *(_WORD *)&buf[22] = 2112;
      v20 = v6;
      _os_log_impl(&dword_22D353000, v12, OS_LOG_TYPE_FAULT, "%s Trying to determine if %@ supports INSendMessageIntent, but couldn't find application record: %@", buf, 0x20u);
    }

    v17.receiver = self;
    v17.super_class = (Class)WFSendMessageAction;
    -[WFHandleSystemIntentAction actionForAppIdentifier:](&v17, sel_actionForAppIdentifier_, v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)serializedParametersForDonatedIntent:(id)a3 allowDroppingUnconfigurableValues:(BOOL)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  BOOL v15;
  void *v16;
  char v17;
  void *v18;
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
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[4];
  id v47;
  id v48;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9DD0]), "initWithIntent:", v6);
    objc_msgSend(MEMORY[0x24BDD9BF0], "sharedResolver");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resolvedIntentMatchingDescriptor:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "displayableBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)*MEMORY[0x24BEC16F0];
    v12 = v10;
    v13 = v11;
    if (v12 != v13)
    {
      v14 = v13;
      if (v12)
        v15 = v13 == 0;
      else
        v15 = 1;
      if (v15)
      {

      }
      else
      {
        v17 = objc_msgSend(v12, "isEqualToString:", v13);

        if ((v17 & 1) != 0)
        {
LABEL_12:
          objc_msgSend(v6, "speakableGroupName");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            v16 = 0;
LABEL_23:

            goto LABEL_24;
          }
LABEL_15:
          v45 = v7;
          objc_msgSend(v6, "_codableDescription");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "attributeByName:", CFSTR("recipients"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFSendMessageAction parameterForKey:](self, "parameterForKey:", CFSTR("WFSendMessageActionRecipients"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "recipients");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v21;
          objc_msgSend(v21, "definition");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = v20;
          objc_msgSend(v20, "wf_parameterStateForIntentValue:parameterDefinition:", v22, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "serializedRepresentation");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v44 = v19;
          objc_msgSend(v19, "attributeByName:", CFSTR("content"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFSendMessageAction parameterForKey:](self, "parameterForKey:", CFSTR("WFSendMessageContent"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "content");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "definition");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v26;
          objc_msgSend(v26, "wf_parameterStateForIntentValue:parameterDefinition:", v28, v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "serializedRepresentation");
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          v32 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          v16 = v32;
          if (v25)
            objc_msgSend(v32, "setObject:forKeyedSubscript:", v25, CFSTR("WFSendMessageActionRecipients"));
          if (v31)
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v31, CFSTR("WFSendMessageContent"));
          objc_msgSend(v9, "bundleIdentifier");
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          if (v33)
          {
            objc_msgSend(v9, "serializedRepresentation");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v34, *MEMORY[0x24BEC4410]);

          }
          else
          {
            -[WFHandleSystemIntentAction supportedIdentifiers](self, "supportedIdentifiers");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "allObjects");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v46[0] = MEMORY[0x24BDAC760];
            v46[1] = 3221225472;
            v46[2] = __94__WFSendMessageAction_serializedParametersForDonatedIntent_allowDroppingUnconfigurableValues___block_invoke;
            v46[3] = &unk_24F8B7B78;
            v47 = v6;
            v48 = v9;
            objc_msgSend(v36, "if_compactMap:", v46);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v37, "firstObject");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "serializedRepresentation");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v39, *MEMORY[0x24BEC4410]);

          }
          v7 = v45;
          goto LABEL_23;
        }
      }

      goto LABEL_15;
    }

    goto LABEL_12;
  }
  v16 = 0;
LABEL_24:

  return v16;
}

- (id)contentDestinationWithError:(id *)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = -[WFHandleIntentAction showsWhenRun](self, "showsWhenRun", a3) ^ 1;
  v5 = (void *)MEMORY[0x24BE19390];
  -[WFHandleSystemIntentAction intentDescriptor](self, "intentDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationWithAppDescriptor:promptingBehaviour:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[WFSendMessageAction isMessagesAppSelected](self, "isMessagesAppSelected");
  if (!v8)
  {
    if (!v11)
    {
      -[WFHandleSystemIntentAction localizedAppName](self, "localizedAppName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        v18 = (void *)MEMORY[0x24BDD17C8];
        WFLocalizedString(CFSTR("Allow “%1$@” to send a %2$@ message?"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFHandleSystemIntentAction localizedAppName](self, "localizedAppName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "localizedStringWithFormat:", v14, v10, v15, v23);
        goto LABEL_9;
      }
    }
    v20 = (void *)MEMORY[0x24BDD17C8];
    WFLocalizedString(CFSTR("Allow “%1$@” to send a message?"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringWithFormat:", v14, v10, v22);
LABEL_11:
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (v11
    || (-[WFHandleSystemIntentAction localizedAppName](self, "localizedAppName"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        !v12))
  {
    v16 = (void *)MEMORY[0x24BDD17C8];
    WFLocalizedString(CFSTR("Allow “%1$@” to send %2$@ in a message?"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringWithFormat:", v14, v10, v8);
    goto LABEL_11;
  }
  v13 = (void *)MEMORY[0x24BDD17C8];
  WFLocalizedString(CFSTR("Allow “%1$@” to send %2$@ in a %3$@ message?"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHandleSystemIntentAction localizedAppName](self, "localizedAppName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringWithFormat:", v14, v10, v8, v15);
LABEL_9:
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v19;
}

- (BOOL)shouldForceHandleInSiri:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  BOOL v12;

  v4 = a3;
  objc_msgSend(v4, "recipients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v4, "speakableGroupName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend(v4, "conversationIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v8 != 0;

    }
  }

  objc_msgSend(v4, "content");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v4, "attachments");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "count") == 0;

  }
  v12 = -[WFHandleIntentAction showsWhenRun](self, "showsWhenRun") || v10 || !v6;

  return v12;
}

- (BOOL)isPhotoOrVideo:(id)a3
{
  void *v3;
  char v4;
  void *v5;

  objc_msgSend(a3, "preferredFileType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "conformsToUTType:", *MEMORY[0x24BDF8410]) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE19360], "ownedTypes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "conformsToTypes:", v5);

  }
  return v4;
}

- (BOOL)requiresPrivateOutputLogging
{
  return 1;
}

id __94__WFSendMessageAction_serializedParametersForDonatedIntent_allowDroppingUnconfigurableValues___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = (objc_class *)MEMORY[0x24BDD9DD0];
  v4 = a2;
  v5 = [v3 alloc];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithIntentClassName:launchableAppBundleId:", v7, v4);

  objc_msgSend(MEMORY[0x24BDD9BF0], "sharedResolver");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resolvedIntentMatchingDescriptor:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "displayableBundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "displayableBundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v11, "isEqualToString:", v12);

  if ((_DWORD)v7)
    v13 = v10;
  else
    v13 = 0;

  return v13;
}

void __56__WFSendMessageAction_runWithRemoteUserInterface_input___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__WFSendMessageAction_runWithRemoteUserInterface_input___block_invoke_2;
  v7[3] = &unk_24F8B7B50;
  v8 = *(id *)(a1 + 48);
  v9 = v3;
  v10 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  objc_msgSend(v4, "getContentFromInput:completionHandler:", v5, v7);

}

void __56__WFSendMessageAction_runWithRemoteUserInterface_input___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(_QWORD *, void *);
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x24BE193F8];
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __56__WFSendMessageAction_runWithRemoteUserInterface_input___block_invoke_3;
  v20 = &unk_24F8B7B28;
  v21 = *(id *)(a1 + 32);
  v22 = *(id *)(a1 + 40);
  v8 = v5;
  v9 = *(_QWORD *)(a1 + 48);
  v23 = v8;
  v24 = v9;
  objc_msgSend(v7, "requestForCoercingToFileType:completionHandler:", 0, &v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  WFLivePhotoFileType();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", v11, v17, v18, v19, v20, v21, v22);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x24BE193F0];
    v25 = *MEMORY[0x24BE19738];
    v26 = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "optionsWithDictionary:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setOptions:", v16);

  }
  objc_msgSend(v6, "performCoercion:", v10, v17, v18, v19, v20);

}

void __56__WFSendMessageAction_runWithRemoteUserInterface_input___block_invoke_3(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[5];

  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1618], "wf_securelyArchivedDataWithRootObject:deletionResponsibility:", v3, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = (void *)a1[4];
  v6 = a1[5];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__WFSendMessageAction_runWithRemoteUserInterface_input___block_invoke_4;
  v8[3] = &unk_24F8B7B00;
  v7 = a1[6];
  v8[4] = a1[7];
  objc_msgSend(v5, "showWithRecipients:content:attachments:completionHandler:", v6, v7, v4, v8);

}

uint64_t __56__WFSendMessageAction_runWithRemoteUserInterface_input___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
}

void __50__WFSendMessageAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  uint64_t v6;
  int v7;
  char v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  id v13;
  objc_super v14;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = objc_msgSend(v4, "isRunningWithSiriUI");
  LODWORD(v4) = *(unsigned __int8 *)(a1 + 56);
  v7 = objc_msgSend(*(id *)(a1 + 40), "canSendAttachmentsWithIntentHandler:runningInSiri:showWhenRun:", v5, v6, *(unsigned __int8 *)(a1 + 56));

  v8 = v6 ^ 1;
  if (!(_DWORD)v4)
    v8 = 0;
  v9 = *(void **)(a1 + 40);
  if ((v8 & 1) != 0 || !v7)
  {
    if ((_DWORD)v6)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "wfUnsupportedUserInterfaceError");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "finishRunningWithError:", v11);

    }
    else
    {
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __50__WFSendMessageAction_runAsynchronouslyWithInput___block_invoke_2;
      v12[3] = &unk_24F8B83C0;
      v12[4] = v9;
      v13 = *(id *)(a1 + 48);
      objc_msgSend(v9, "requestUnlock:", v12);

    }
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 48);
    v14.receiver = *(id *)(a1 + 40);
    v14.super_class = (Class)WFSendMessageAction;
    objc_msgSendSuper2(&v14, sel_runAsynchronouslyWithInput_, v10);
  }
}

void __50__WFSendMessageAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, char a2)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  v2 = *(void **)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __50__WFSendMessageAction_runAsynchronouslyWithInput___block_invoke_3;
    v4[3] = &unk_24F8B7AB0;
    v4[4] = v2;
    v5 = *(id *)(a1 + 40);
    objc_msgSend(v2, "requestInterfacePresentationWithCompletionHandler:", v4);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "deviceLockedError");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "finishRunningWithError:", v3);

  }
}

uint64_t __50__WFSendMessageAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v3, "runWithRemoteUserInterface:input:", a2, *(_QWORD *)(a1 + 40));
  else
    return objc_msgSend(v3, "finishRunningWithError:");
}

void __61__WFSendMessageAction_getContentFromInput_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "componentsJoinedByString:", CFSTR("\n"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __61__WFSendMessageAction_getContentFromInput_completionHandler___block_invoke(uint64_t a1, void *a2)
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

void __74__WFSendMessageAction_getINMessageAttachmentsFromInput_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __74__WFSendMessageAction_getINMessageAttachmentsFromInput_completionHandler___block_invoke_2;
  v4[3] = &unk_24F8B9110;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(a3, "getFileRepresentations:forType:", v4, 0);

}

void __74__WFSendMessageAction_getINMessageAttachmentsFromInput_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "if_map:", &__block_literal_global_201);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

id __74__WFSendMessageAction_getINMessageAttachmentsFromInput_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD9D30];
  v3 = a2;
  objc_msgSend(v3, "wfName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wf_fileWithFileRepresentation:displayName:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDDA0A0], "attachmentWithFile:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __37__WFSendMessageAction_getRecipients___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "if_compactMap:", &__block_literal_global_37530);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

WFSendRecipient *__37__WFSendMessageAction_getRecipients___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  WFSendRecipient *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  WFSendRecipient *v28;
  void *v30;
  void *v31;
  WFSendRecipient *v32;
  void *v33;
  WFSendRecipient *v34;
  id v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = [WFSendRecipient alloc];
  objc_msgSend(v2, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v2;
  v6 = objc_alloc(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v5, "personHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, 0);

  objc_msgSend(v5, "aliases");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v5, "aliases");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v10);

  }
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("value != nil"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v8;
  objc_msgSend(v8, "filteredArrayUsingPredicate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v39;
    v17 = *MEMORY[0x24BDD99F8];
    v18 = *MEMORY[0x24BDD99C8];
    v35 = v5;
    v36 = v4;
    v34 = v3;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v39 != v16)
          objc_enumerationMutation(v13);
        v20 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v20, "label");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "isEqualToString:", v17))
        {

LABEL_15:
          objc_msgSend(v20, "value");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v13;
          v5 = v35;
          v4 = v36;
          v3 = v34;
          goto LABEL_16;
        }
        objc_msgSend(v20, "label");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isEqualToString:", v18);

        if ((v23 & 1) != 0)
          goto LABEL_15;
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      v5 = v35;
      v4 = v36;
      v3 = v34;
      if (v15)
        continue;
      break;
    }
  }

  objc_msgSend(v13, "objectMatchingKey:intValue:", CFSTR("type"), 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = v24;
    objc_msgSend(v24, "value");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
    v27 = v37;
  }
  else
  {
    objc_msgSend(v13, "objectMatchingKey:intValue:", CFSTR("type"), 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v30)
    {
      objc_msgSend(v30, "value");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v13, "firstObject");
      v32 = v3;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "value");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v3 = v32;
    }
    v27 = v37;

    v25 = 0;
  }

  v28 = -[WFSendRecipient initWithName:address:](v3, "initWithName:address:", v4, v26);
  return v28;
}

uint64_t __81__WFSendMessageAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
