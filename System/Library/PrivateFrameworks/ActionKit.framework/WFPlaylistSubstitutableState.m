@implementation WFPlaylistSubstitutableState

- (WFPlaylistSubstitutableState)initWithPlaylist:(id)a3
{
  id v4;
  WFPlaylistDescriptor *v5;
  void *v6;
  WFPlaylistDescriptor *v7;
  WFPlaylistSubstitutableState *v8;
  objc_super v10;

  v4 = a3;
  v5 = [WFPlaylistDescriptor alloc];
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[WFPlaylistDescriptor initWithPlaylistName:persistentIdentifier:](v5, "initWithPlaylistName:persistentIdentifier:", v6, 0);
  v10.receiver = self;
  v10.super_class = (Class)WFPlaylistSubstitutableState;
  v8 = -[WFVariableSubstitutableParameterState initWithValue:](&v10, sel_initWithValue_, v7);

  return v8;
}

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v7;
  id v8;
  objc_super v9;
  _QWORD v10[4];
  WFPlaylistSubstitutableState *v11;
  id v12;
  id v13;

  v10[1] = 3221225472;
  v10[2] = __89__WFPlaylistSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
  v10[3] = &unk_24F8B0E40;
  v11 = self;
  v12 = a3;
  v13 = a5;
  v9.receiver = v11;
  v9.super_class = (Class)WFPlaylistSubstitutableState;
  v10[0] = MEMORY[0x24BDAC760];
  v7 = v13;
  v8 = v12;
  -[WFVariableSubstitutableParameterState processWithContext:userInputRequiredHandler:valueHandler:](&v9, sel_processWithContext_userInputRequiredHandler_valueHandler_, v8, a4, v10);

}

void __89__WFPlaylistSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;

  v5 = a2;
  v6 = a3;
  if (v5
    || (objc_msgSend(*(id *)(a1 + 32), "variable"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v7))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "variable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_class();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __89__WFPlaylistSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2;
    v11[3] = &unk_24F8BA828;
    v10 = *(_QWORD *)(a1 + 40);
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v8, "getObjectRepresentationForClass:context:completionHandler:", v9, v10, v11);

  }
}

void __89__WFPlaylistSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  uint64_t v8;
  id v9;
  WFPlaylistDescriptor *v10;
  void (*v11)(uint64_t, _QWORD, WFPlaylistDescriptor *);
  id v12;

  v7 = a2;
  v8 = *(_QWORD *)(a1 + 32);
  v12 = v7;
  if (v7)
  {
    v9 = a5;
    v10 = -[WFPlaylistDescriptor initWithPlaylistName:persistentIdentifier:]([WFPlaylistDescriptor alloc], "initWithPlaylistName:persistentIdentifier:", v12, 0);
    (*(void (**)(uint64_t, WFPlaylistDescriptor *, id))(v8 + 16))(v8, v10, v9);

  }
  else
  {
    v11 = *(void (**)(uint64_t, _QWORD, WFPlaylistDescriptor *))(v8 + 16);
    v10 = a5;
    v11(v8, 0, v10);
  }

}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  WFPlaylistDescriptor *v10;
  uint64_t v11;
  void *v12;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = objc_opt_class();
    WFEnforceClass(v5, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length"))
    {
      v10 = -[WFPlaylistDescriptor initWithPlaylistName:persistentIdentifier:]([WFPlaylistDescriptor alloc], "initWithPlaylistName:persistentIdentifier:", v12, 0);

      goto LABEL_8;
    }

LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("EntireMusicLibrary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  WFEnforceClass(v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  if (!v9)
    goto LABEL_7;
  v10 = -[WFPlaylistDescriptor initWithEntireMusicLibrary]([WFPlaylistDescriptor alloc], "initWithEntireMusicLibrary");
LABEL_8:

  return v10;
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFPlaylistSubstitutableState.m"), 153, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[value isKindOfClass:[WFPlaylistDescriptor class]]"));

  }
  if (objc_msgSend(v5, "entireMusicLibrary"))
  {
    v10 = CFSTR("EntireMusicLibrary");
    v11[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "playlistName");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

@end
