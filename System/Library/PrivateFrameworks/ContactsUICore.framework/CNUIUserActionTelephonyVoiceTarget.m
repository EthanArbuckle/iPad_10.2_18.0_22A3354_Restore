@implementation CNUIUserActionTelephonyVoiceTarget

void __96___CNUIUserActionTelephonyVoiceTarget_ttyActionsForPhoneNumbers_contact_discoveringEnvironment___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)MEMORY[0x1E0D13AE8];
  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v7 = a1[7];
  v8 = a2;
  objc_msgSend(v4, "ttyActionsFutureForPhoneNumbers:contact:discoveringEnvironment:", v5, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "observableWithFuture:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "subscribe:", a1[8]);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addCancelable:", v11);
}

id __93___CNUIUserActionTelephonyVoiceTarget_actionsForPhoneNumbers_contact_discoveringEnvironment___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a2;
  if ((objc_msgSend(v3, "isSuggested") & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v3, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0C97280];
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *MEMORY[0x1E0C967C0];
    objc_msgSend(v3, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contactPropertyWithContactNoCopy:propertyKey:identifier:", v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "phoneCallActionWithDestinationID:contactProperty:discoveringEnvironment:", v6, v11, *(_QWORD *)(a1 + 48));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v12);

  }
  return v4;
}

id __96___CNUIUserActionTelephonyVoiceTarget_ttyActionsForPhoneNumbers_contact_discoveringEnvironment___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  id v14;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "highLatencySchedulerProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __96___CNUIUserActionTelephonyVoiceTarget_ttyActionsForPhoneNumbers_contact_discoveringEnvironment___block_invoke_2;
  v10[3] = &unk_1EA6044C0;
  v6 = *(void **)(a1 + 48);
  v10[4] = *(_QWORD *)(a1 + 40);
  v11 = v6;
  v12 = *(id *)(a1 + 56);
  v13 = *(id *)(a1 + 32);
  v14 = v3;
  v7 = v3;
  objc_msgSend(v5, "performCancelableBlock:qualityOfService:", v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __102___CNUIUserActionTelephonyVoiceTarget_ttyActionsFutureForPhoneNumbers_contact_discoveringEnvironment___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a2;
  if ((objc_msgSend(v3, "isSuggested") & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v3, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0C97280];
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *MEMORY[0x1E0C967C0];
    objc_msgSend(v3, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contactPropertyWithContactNoCopy:propertyKey:identifier:", v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "TTYCallActionWithDestinationID:contactProperty:discoveringEnvironment:", v6, v11, *(_QWORD *)(a1 + 48));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v12);

    if (*(_BYTE *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 40), "TTYRelayCallActionWithDestinationID:contactProperty:discoveringEnvironment:", v6, v11, *(_QWORD *)(a1 + 48));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v13);

    }
  }

  return v4;
}

@end
