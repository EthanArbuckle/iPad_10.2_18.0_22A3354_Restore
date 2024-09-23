@implementation WFAddNewContactAction

+ (void)contactFromParameters:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
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
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_class *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  _QWORD v48[5];
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD v54[3];

  v54[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v40 = a4;
  objc_msgSend(v5, "objectForKey:", CFSTR("WFContactFirstName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  objc_msgSend(v5, "objectForKey:", CFSTR("WFContactLastName"));
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
  v43 = v10;

  objc_msgSend(v5, "objectForKey:", CFSTR("WFContactCompany"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
  }
  else
  {
    v12 = 0;
  }
  v42 = v12;

  objc_msgSend(v5, "objectForKey:", CFSTR("WFContactNotes"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
  }
  else
  {
    v14 = 0;
  }
  v41 = v14;

  objc_msgSend(v5, "objectForKey:", CFSTR("WFContactPhoneNumbers"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
  }
  else
  {
    v16 = 0;
  }
  v17 = v16;

  v39 = v17;
  objc_msgSend(v17, "contentCollection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("WFContactEmails"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = v19;
    else
      v20 = 0;
  }
  else
  {
    v20 = 0;
  }
  v21 = v20;

  objc_msgSend(v21, "contentCollection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("WFContactPhoto"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v24 = v23;
    else
      v24 = 0;
  }
  else
  {
    v24 = 0;
  }
  v25 = v24;

  if (v8 && !objc_msgSend(v8, "wf_isEmpty")
    || v43 && !objc_msgSend(v43, "wf_isEmpty")
    || v42 && !objc_msgSend(v42, "wf_isEmpty"))
  {
    v29 = 0;
  }
  else
  {
    v26 = (void *)MEMORY[0x24BDD1540];
    v53 = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("No first name, last name, or company was provided. Please provide at least one for this contact."));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = v27;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v54, &v53, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC4270], 5, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v49 = 0;
  v50 = &v49;
  v51 = 0x2050000000;
  v30 = (void *)getCNMutableContactClass_softClass;
  v52 = getCNMutableContactClass_softClass;
  if (!getCNMutableContactClass_softClass)
  {
    v48[0] = MEMORY[0x24BDAC760];
    v48[1] = 3221225472;
    v48[2] = __getCNMutableContactClass_block_invoke;
    v48[3] = &unk_24F8BB430;
    v48[4] = &v49;
    __getCNMutableContactClass_block_invoke((uint64_t)v48);
    v30 = (void *)v50[3];
  }
  v31 = objc_retainAutorelease(v30);
  _Block_object_dispose(&v49, 8);
  v32 = objc_alloc_init(v31);
  objc_msgSend(v32, "setGivenName:", v8);
  objc_msgSend(v32, "setFamilyName:", v43);
  objc_msgSend(v32, "setOrganizationName:", v42);
  objc_msgSend(v32, "setNote:", v41);
  if (v18)
  {
    objc_msgSend(v18, "items");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "if_compactMap:", &__block_literal_global_6384);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setPhoneNumbers:", v34);

  }
  if (v22)
  {
    objc_msgSend(v22, "items");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "if_compactMap:", &__block_literal_global_140);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setEmailAddresses:", v36);

  }
  if (v25)
  {
    objc_msgSend(v25, "items");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "firstObject");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      v44[0] = MEMORY[0x24BDAC760];
      v44[1] = 3221225472;
      v44[2] = __65__WFAddNewContactAction_contactFromParameters_completionHandler___block_invoke_3;
      v44[3] = &unk_24F8B14E0;
      v47 = v40;
      v45 = v32;
      v46 = v29;
      objc_msgSend(v38, "getObjectRepresentation:forClass:", v44, objc_opt_class());

    }
    else
    {
      (*((void (**)(id, id, void *))v40 + 2))(v40, v32, v29);
    }

  }
  else
  {
    (*((void (**)(id, id, void *))v40 + 2))(v40, v32, v29);
  }

}

+ (id)userInterfaceProtocol
{
  return &unk_255DFC7C0;
}

+ (id)userInterfaceXPCInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___WFAddNewContactAction;
  objc_msgSendSuper2(&v10, sel_userInterfaceXPCInterface);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_showWithContactParameters_completionHandler_, 0, 0);

  return v2;
}

void __65__WFAddNewContactAction_contactFromParameters_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v10, "PNGRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setImageData:", v9);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

id __65__WFAddNewContactAction_contactFromParameters_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = objc_alloc((Class)getCNLabeledValueClass());
    objc_msgSend(v2, "emailAddress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "label");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "emailAddress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "address");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v3, "initWithLabel:value:", v5, v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id __65__WFAddNewContactAction_contactFromParameters_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = objc_alloc((Class)getCNLabeledValueClass());
    objc_msgSend(v2, "phoneNumber");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "label");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v15 = &v14;
    v16 = 0x2050000000;
    v6 = (void *)getCNPhoneNumberClass_softClass;
    v17 = getCNPhoneNumberClass_softClass;
    if (!getCNPhoneNumberClass_softClass)
    {
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __getCNPhoneNumberClass_block_invoke;
      v13[3] = &unk_24F8BB430;
      v13[4] = &v14;
      __getCNPhoneNumberClass_block_invoke((uint64_t)v13);
      v6 = (void *)v15[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v14, 8);
    objc_msgSend(v2, "phoneNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "phoneNumberWithStringValue:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v3, "initWithLabel:value:", v5, v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];

  -[WFAddNewContactAction resourceManager](self, "resourceManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resourceObjectsOfClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "status") != 4)
  {
    objc_msgSend(v6, "availabilityError");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  -[WFAddNewContactAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("ShowWhenRun"), objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  -[WFAddNewContactAction userInterface](self, "userInterface");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isRunningWithSiriUI");

  if (v10 && v8)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "wfUnsupportedUserInterfaceError");
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v12 = (void *)v11;
    -[WFAddNewContactAction finishRunningWithError:](self, "finishRunningWithError:", v11);

    goto LABEL_7;
  }
  if (v8)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __52__WFAddNewContactAction_runAsynchronouslyWithInput___block_invoke;
    v13[3] = &unk_24F8B1438;
    v13[4] = self;
    -[WFAddNewContactAction requestInterfacePresentationWithCompletionHandler:](self, "requestInterfacePresentationWithCompletionHandler:", v13);
  }
  else
  {
    -[WFAddNewContactAction runWithoutUI](self, "runWithoutUI");
  }
LABEL_7:

}

- (void)runWithoutUI
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  v3 = (void *)objc_opt_class();
  -[WFAddNewContactAction processedParameters](self, "processedParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __37__WFAddNewContactAction_runWithoutUI__block_invoke;
  v5[3] = &unk_24F8B1508;
  v5[4] = self;
  objc_msgSend(v3, "contactFromParameters:completionHandler:", v4, v5);

}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = a5;
  v8 = a3;
  WFLocalizedString(CFSTR("Allow “%1$@” to use %2$@ in a new contact?"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringWithFormat:", v9, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __37__WFAddNewContactAction_runWithoutUI__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  if (!v5 || a3)
  {
    objc_msgSend(v6, "finishRunningWithError:", a3);
  }
  else
  {
    objc_msgSend(v6, "contactStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v8 = objc_msgSend(v7, "addContact:error:", v5, &v15);
    v9 = v15;

    v10 = *(void **)(a1 + 32);
    if ((v8 & 1) != 0)
    {
      objc_msgSend(v10, "contactStore");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "contactWithIdentifier:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(*(id *)(a1 + 32), "output");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v13);

      }
      objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);

    }
    else
    {
      objc_msgSend(v10, "finishRunningWithError:", v9);
    }

  }
}

void __52__WFAddNewContactAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v6, "processedParameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __52__WFAddNewContactAction_runAsynchronouslyWithInput___block_invoke_2;
    v8[3] = &unk_24F8BB768;
    v8[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "showWithContactParameters:completionHandler:", v7, v8);

  }
  else
  {
    objc_msgSend(v6, "finishRunningWithError:", a3);
  }

}

void __52__WFAddNewContactAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v10 = v5;
  if (v5)
  {
    objc_msgSend(v6, "contactStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contactWithIdentifier:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "output");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v8);

    }
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);

  }
  else
  {
    objc_msgSend(v6, "finishRunningWithError:", a3);
  }

}

@end
