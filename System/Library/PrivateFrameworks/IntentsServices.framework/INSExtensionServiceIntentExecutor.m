@implementation INSExtensionServiceIntentExecutor

- (INSExtensionServiceIntentExecutor)initWithVoiceShortcutClient:(id)a3 intent:(id)a4
{
  id v7;
  id v8;
  INSExtensionServiceIntentExecutor *v9;
  INSExtensionServiceIntentExecutor *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)INSExtensionServiceIntentExecutor;
  v9 = -[INSExtensionServiceIntentExecutor init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_voiceShortcutClient, a3);
    objc_storeStrong((id *)&v10->_intent, a4);
  }

  return v10;
}

- (INSExtensionServiceIntentExecutor)initWithIntent:(id)a3 extensionProxy:(id)a4 queue:(id)a5
{
  id v9;
  id v10;
  OS_dispatch_queue *v11;
  INSExtensionServiceIntentExecutor *v12;
  INSExtensionServiceIntentExecutor *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = (OS_dispatch_queue *)a5;
  v15.receiver = self;
  v15.super_class = (Class)INSExtensionServiceIntentExecutor;
  v12 = -[INSExtensionServiceIntentExecutor init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_intent, a3);
    objc_storeStrong((id *)&v13->_extensionProxy, a4);
    v13->_queue = v11;
  }

  return v13;
}

- (void)sendAceCommand:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
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
  _QWORD v31[4];
  id v32;

  v6 = a3;
  v7 = a4;
  -[INSExtensionServiceIntentExecutor voiceShortcutClient](self, "voiceShortcutClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD9BF0], "sharedResolver");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[INSExtensionServiceIntentExecutor intent](self, "intent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "launchId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "counterpartIdentifiersForLocalIdentifier:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "anyObject");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      v15 = (void *)v13;
    else
      v15 = v11;
    v16 = v15;

    -[INSExtensionServiceIntentExecutor intent](self, "intent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_setLaunchId:", v16);

    objc_msgSend(v6, "ins_jsonEncodedIntent");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[INSExtensionServiceIntentExecutor intent](self, "intent");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      INSJSONEncodedIntent(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "ins_setJSONEncodedIntent:", v20);

    }
    else
    {
      objc_msgSend(v6, "ins_protobufEncodedIntent");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
      {
LABEL_12:
        objc_msgSend(v6, "setRefId:", 0);
        -[INSExtensionServiceIntentExecutor voiceShortcutClient](self, "voiceShortcutClient");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "dictionary");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = MEMORY[0x24BDAC760];
        v31[1] = 3221225472;
        v31[2] = __70__INSExtensionServiceIntentExecutor_sendAceCommand_completionHandler___block_invoke;
        v31[3] = &unk_24C4B9530;
        v32 = v7;
        objc_msgSend(v29, "sendAceCommandDictionary:completion:", v30, v31);

        goto LABEL_13;
      }
      v19 = objc_alloc_init(MEMORY[0x24BE81380]);
      -[INSExtensionServiceIntentExecutor intent](self, "intent");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "backingStore");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "data");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setData:", v26);

      -[INSExtensionServiceIntentExecutor intent](self, "intent");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "typeName");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setTypeName:", v28);

      objc_msgSend(v6, "ins_setProtobufEncodedIntent:", v19);
    }

    goto LABEL_12;
  }
  -[INSExtensionServiceIntentExecutor extensionProxy](self, "extensionProxy");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[INSExtensionServiceIntentExecutor intent](self, "intent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[INSExtensionServiceIntentExecutor extensionProxy](self, "extensionProxy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[INSExtensionServiceIntentExecutor queue](self, "queue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ins_sendIntent:toExtensionProxy:onQueue:completionHandler:", v9, v11, v22, v7);

LABEL_13:
  }

}

- (INVCVoiceShortcutClient)voiceShortcutClient
{
  return self->_voiceShortcutClient;
}

- (void)setVoiceShortcutClient:(id)a3
{
  objc_storeStrong((id *)&self->_voiceShortcutClient, a3);
}

- (INIntent)intent
{
  return self->_intent;
}

- (void)setIntent:(id)a3
{
  objc_storeStrong((id *)&self->_intent, a3);
}

- (INCExtensionProxy)extensionProxy
{
  return self->_extensionProxy;
}

- (void)setExtensionProxy:(id)a3
{
  objc_storeStrong((id *)&self->_extensionProxy, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  self->_queue = (OS_dispatch_queue *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionProxy, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_voiceShortcutClient, 0);
}

void __70__INSExtensionServiceIntentExecutor_sendAceCommand_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  void *v5;
  id v6;
  void (*v7)(uint64_t, _QWORD);
  id v8;

  v3 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    v5 = (void *)MEMORY[0x24BE81080];
    v6 = a3;
    objc_msgSend(v5, "aceObjectWithDictionary:", a2);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v3 + 16))(v3);

  }
  else
  {
    v7 = *(void (**)(uint64_t, _QWORD))(v3 + 16);
    v8 = a3;
    v7(v3, 0);
  }

}

@end
