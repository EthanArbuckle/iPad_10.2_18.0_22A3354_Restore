@implementation WFNotificationAction

- (void)getNotificationAttachmentsWithInput:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[4];

  v25[3] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = a3;
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  v25[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BE193F8];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __78__WFNotificationAction_getNotificationAttachmentsWithInput_completionHandler___block_invoke;
  v20[3] = &unk_24F8B7658;
  v21 = v5;
  v9 = v5;
  objc_msgSend(v8, "requestForCoercingToContentClasses:completionHandler:", v7, v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDBCF00];
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  objc_msgSend(v11, "orderedSetWithObjects:", v12, v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x24BE193F0];
  v16 = *MEMORY[0x24BE19718];
  v22 = v14;
  v23 = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "optionsWithDictionary:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setOptions:", v19);

  objc_msgSend(v6, "performCoercion:", v10);
}

- (void)runWithUserNotificationCenterInput:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v5 = a3;
  if (!objc_opt_class())
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFNotificationAction.m"), 87, CFSTR("UNUserNotificationCenter is not available"));

    if (v5)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFNotificationAction.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("input"));

    goto LABEL_3;
  }
  if (!v5)
    goto LABEL_5;
LABEL_3:
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__WFNotificationAction_runWithUserNotificationCenterInput___block_invoke;
  v8[3] = &unk_24F8B3528;
  v8[4] = self;
  -[WFNotificationAction getNotificationAttachmentsWithInput:completionHandler:](self, "getNotificationAttachmentsWithInput:completionHandler:", v5, v8);

}

- (id)actionAlert
{
  void *v3;
  void *v4;
  WFNotificationActionAlert *v5;

  -[WFNotificationAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFNotificationActionTitle"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFNotificationAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFNotificationActionBody"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WFNotificationActionAlert initWithTitle:body:]([WFNotificationActionAlert alloc], "initWithTitle:body:", v3, v4);

  return v5;
}

- (id)contentDestinationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x24BE19470], "notificationLocation", a3);
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
    WFLocalizedString(CFSTR("Allow “%1$@” to display %2$@ in a notification?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to display notifications?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __59__WFNotificationAction_runWithUserNotificationCenterInput___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
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
  _QWORD v32[5];

  v3 = a2;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setAttachments:", v3);

  objc_msgSend(*(id *)(a1 + 32), "actionAlert");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldIgnoreDoNotDisturb:", 1);
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSubtitle:", v6);

  objc_msgSend(v5, "body");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBody:", v7);

  objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFNotificationActionSound"), objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "BOOLValue") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDF8870], "defaultSound");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSound:", v9);

  }
  else
  {
    objc_msgSend(v4, "setSound:", 0);
  }

  objc_msgSend(*(id *)(a1 + 32), "workflow");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE19628], "proposedTemporaryFileURLForFilename:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reference");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "screenScale");
    objc_msgSend(v14, "attributionIconWithSize:scale:rounded:", 0, 38.0, 38.0, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "PNGRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "writeToURL:atomically:", v13, 0);

    objc_msgSend(v10, "reference");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "attributionTitle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:", v20);

    v21 = (void *)MEMORY[0x24BDF8850];
    objc_msgSend(v13, "path");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "iconAtPath:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIcon:", v23);

    v24 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v10, "workflowID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", CFSTR("workflow-identifier:%@"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setThreadIdentifier:", v26);

  }
  v27 = (void *)MEMORY[0x24BDF8858];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "UUIDString");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "requestWithIdentifier:content:trigger:", v29, v4, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF88B8], "workflowNotificationCenter");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __59__WFNotificationAction_runWithUserNotificationCenterInput___block_invoke_2;
  v32[3] = &unk_24F8BB370;
  v32[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v31, "addNotificationRequest:withCompletionHandler:", v30, v32);

}

uint64_t __59__WFNotificationAction_runWithUserNotificationCenterInput___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a2);
}

void __78__WFNotificationAction_getNotificationAttachmentsWithInput_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v3 = a2;
  if (objc_msgSend(v3, "numberOfItems"))
  {
    objc_msgSend(v3, "items");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __78__WFNotificationAction_getNotificationAttachmentsWithInput_completionHandler___block_invoke_3;
    v5[3] = &unk_24F8B9110;
    v6 = *(id *)(a1 + 32);
    objc_msgSend(v4, "if_flatMapAsynchronously:completionHandler:", &__block_literal_global_15725, v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __78__WFNotificationAction_getNotificationAttachmentsWithInput_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  if (a2)
    v3 = a2;
  else
    v3 = (void *)MEMORY[0x24BDBD1A8];
  v5 = a2;
  objc_msgSend(v3, "if_compactMap:", &__block_literal_global_122);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __78__WFNotificationAction_getNotificationAttachmentsWithInput_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a4;
  objc_msgSend(v5, "preferredFileType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "conformsToUTType:", *MEMORY[0x24BDF8410]))
  {
    v8 = *MEMORY[0x24BDF83D8];
    v13[0] = *MEMORY[0x24BDF8438];
    v13[1] = v8;
    v13[2] = *MEMORY[0x24BDF84F8];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "conformsToUTTypes:", v9) & 1) == 0)
    {
      v10 = (void *)MEMORY[0x24BEC14A0];
      objc_msgSend(v9, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "typeWithUTType:", v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v12;
    }

  }
  objc_msgSend(v5, "getFileRepresentations:forType:", v6, v7);

}

id __78__WFNotificationAction_getNotificationAttachmentsWithInput_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v13;

  v2 = a2;
  v3 = (void *)MEMORY[0x24BE19628];
  objc_msgSend(v2, "filename");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "proposedTemporaryFileURLForFilename:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "writeToFileURL:overwriting:error:", v5, 0, 0);
  v6 = (void *)MEMORY[0x24BDF8830];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v6, "attachmentWithIdentifier:URL:options:error:", v8, v5, 0, &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v13;

  if (!v9)
  {
    NSLog(CFSTR("[WFNotificationAction] Error creating attachment from %@: %@"), v2, v10);
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeItemAtURL:error:", v5, 0);

  }
  return v9;
}

@end
