@implementation SFCard(AssistantCardService)

+ (id)acs_uniquelyIdentifiedCard
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "UUIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setCardId:", v2);

  return v0;
}

- (void)acs_setInteraction:()AssistantCardService
{
  void *v4;
  void *v5;
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
  void *v21;
  id v22;

  v22 = a3;
  objc_msgSend(v22, "intent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v22, "intent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "backingStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_alloc_init(MEMORY[0x24BE84F08]);
    objc_msgSend(v8, "setProtobufMessageData:", v7);
    objc_msgSend(v5, "_intentInstanceDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "type");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setProtobufMessageName:", v10);

    objc_msgSend(v8, "protobufMessageData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setIntentMessageData:", v11);

    objc_msgSend(v8, "protobufMessageName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setIntentMessageName:", v12);

  }
  objc_msgSend(v22, "intentResponse");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v22, "intentResponse");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "backingStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "data");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_alloc_init(MEMORY[0x24BE84F08]);
    objc_msgSend(v17, "setProtobufMessageData:", v16);
    objc_opt_class();
    INIntentSchemaGetIntentResponseDescriptionWithFacadeClass();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "type");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setProtobufMessageName:", v19);

    objc_msgSend(v17, "protobufMessageData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setIntentResponseMessageData:", v20);

    objc_msgSend(v17, "protobufMessageName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setIntentResponseMessageName:", v21);

  }
}

- (id)acs_interaction
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "intentMessageName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "intentMessageData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentCreate();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "intentResponseMessageName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "intentResponseMessageData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  INIntentResponseCreate();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9DF0]), "initWithIntent:response:", v4, v7);
  return v8;
}

@end
