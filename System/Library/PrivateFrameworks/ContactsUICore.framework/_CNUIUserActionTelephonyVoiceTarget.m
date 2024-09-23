@implementation _CNUIUserActionTelephonyVoiceTarget

- (id)ttyActionsFutureForPhoneNumbers:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  id (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  _CNUIUserActionTelephonyVoiceTarget *v24;
  id v25;
  char v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "ttyUtilities");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "contactIsTTYContact:", v9);

  if ((v12 & 1) != 0)
  {
    objc_msgSend(v10, "ttyUtilities");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "relayIsSupported");

    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __102___CNUIUserActionTelephonyVoiceTarget_ttyActionsFutureForPhoneNumbers_contact_discoveringEnvironment___block_invoke;
    v22 = &unk_1EA604510;
    v23 = v9;
    v24 = self;
    v25 = v10;
    v26 = v14;
    objc_msgSend(v8, "_cn_flatMap:", &v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_cn_flatten", v19, v20, v21, v22);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D13A68], "futureWithResult:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D13A68], "futureWithResult:", MEMORY[0x1E0C9AA60]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (id)phoneCallActionWithDestinationID:(id)a3 contactProperty:(id)a4 discoveringEnvironment:(id)a5
{
  id v7;
  id v8;
  CNHandle *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v7 = a4;
  v8 = a3;
  v9 = -[CNHandle initWithStringValue:type:]([CNHandle alloc], "initWithStringValue:type:", v8, 2);

  v10 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v7, "contact");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_cnui_telephonyURLFutureWithHandle:contact:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = *MEMORY[0x1E0C965F8];
  -[CNUIUserActionTarget bundleIdentifier](self, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUIUserActionItem itemWithType:contactProperty:bundleIdentifier:url:group:options:](CNUIUserActionItem, "itemWithType:contactProperty:bundleIdentifier:url:group:options:", v13, v7, v14, v12, 3, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)actionsForContact:(id)a3 discoveringEnvironment:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)_CNUIUserActionTelephonyVoiceTarget;
  v6 = a4;
  v7 = a3;
  -[CNUIUserActionTarget actionsForContact:discoveringEnvironment:](&v18, sel_actionsForContact_discoveringEnvironment_, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "phoneNumbers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CNUIUserActionTelephonyVoiceTarget ttyActionsForPhoneNumbers:contact:discoveringEnvironment:](self, "ttyActionsForPhoneNumbers:contact:discoveringEnvironment:", v9, v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "startWith:", &unk_1EA61C6A0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0D13AE8];
  v19[0] = v8;
  v19[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "schedulerProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "combineLatest:schedulerProvider:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "map:", *MEMORY[0x1E0D13700]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)ttyActionsForPhoneNumbers:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  _CNUIUserActionTelephonyVoiceTarget *v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0D13AE8];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __96___CNUIUserActionTelephonyVoiceTarget_ttyActionsForPhoneNumbers_contact_discoveringEnvironment___block_invoke;
  v17[3] = &unk_1EA6044E8;
  v18 = v10;
  v19 = self;
  v20 = v8;
  v21 = v9;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  objc_msgSend(v11, "observableWithBlock:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)actionsForPhoneNumbers:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  _CNUIUserActionTelephonyVoiceTarget *v16;
  id v17;

  v8 = a4;
  v9 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __93___CNUIUserActionTelephonyVoiceTarget_actionsForPhoneNumbers_contact_discoveringEnvironment___block_invoke;
  v14[3] = &unk_1EA604498;
  v15 = v8;
  v16 = self;
  v17 = v9;
  v10 = v9;
  v11 = v8;
  objc_msgSend(a3, "_cn_flatMap:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (_CNUIUserActionTelephonyVoiceTarget)init
{
  uint64_t v2;
  objc_super v4;

  v2 = *MEMORY[0x1E0C965E8];
  v4.receiver = self;
  v4.super_class = (Class)_CNUIUserActionTelephonyVoiceTarget;
  return -[CNUIUserActionTarget initWithName:bundleIdentifier:teamIdentifier:](&v4, sel_initWithName_bundleIdentifier_teamIdentifier_, CFSTR("Phone"), v2, 0);
}

- (id)TTYCallActionWithDestinationID:(id)a3 contactProperty:(id)a4 discoveringEnvironment:(id)a5
{
  id v7;
  id v8;
  CNHandle *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v7 = a4;
  v8 = a3;
  v9 = -[CNHandle initWithStringValue:type:]([CNHandle alloc], "initWithStringValue:type:", v8, 2);

  v10 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v7, "contact");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_cnui_ttyURLFutureWithHandle:contact:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = *MEMORY[0x1E0C96638];
  -[CNUIUserActionTarget bundleIdentifier](self, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUIUserActionItem itemWithType:contactProperty:bundleIdentifier:url:group:options:](CNUIUserActionItem, "itemWithType:contactProperty:bundleIdentifier:url:group:options:", v13, v7, v14, v12, 4, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)TTYRelayCallActionWithDestinationID:(id)a3 contactProperty:(id)a4 discoveringEnvironment:(id)a5
{
  id v7;
  id v8;
  CNHandle *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v7 = a4;
  v8 = a3;
  v9 = -[CNHandle initWithStringValue:type:]([CNHandle alloc], "initWithStringValue:type:", v8, 2);

  v10 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v7, "contact");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_cnui_ttyRelayURLFutureWithHandle:contact:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = *MEMORY[0x1E0C96648];
  -[CNUIUserActionTarget bundleIdentifier](self, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUIUserActionItem itemWithType:contactProperty:bundleIdentifier:url:group:options:](CNUIUserActionItem, "itemWithType:contactProperty:bundleIdentifier:url:group:options:", v13, v7, v14, v12, 4, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
