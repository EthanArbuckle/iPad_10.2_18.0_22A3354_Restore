@implementation CRJSContext

- (CRJSContext)initWithVirtualMachine:(id)a3
{
  id v4;
  CRJSContext *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  id (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  id location;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CRJSContext;
  v5 = -[CRJSContext initWithVirtualMachine:](&v26, sel_initWithVirtualMachine_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRJSContext setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v6, v8);

    v9 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pathForResource:ofType:", CFSTR("Base"), CFSTR("js"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithContentsOfFile:encoding:error:", v11, 4, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (id)-[CRJSContext evaluateScript:](v5, "evaluateScript:", v12);
    objc_initWeak(&location, v5);
    v20 = MEMORY[0x24BDAC760];
    v21 = 3221225472;
    v22 = __38__CRJSContext_initWithVirtualMachine___block_invoke;
    v23 = &unk_24DDD9378;
    objc_copyWeak(&v24, &location);
    v14 = (void *)MEMORY[0x220754DFC](&v20);
    -[CRJSContext objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("System"), v20, v21, v22, v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, CFSTR("Data"));

    v16 = (id)-[CRJSContext evaluateScript:](v5, "evaluateScript:", CFSTR("var console = {}"));
    -[CRJSContext objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("console"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", &__block_literal_global_2, CFSTR("log"));

    -[CRJSContext objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("console"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", &__block_literal_global_43, CFSTR("error"));

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);

  }
  return v5;
}

id __38__CRJSContext_initWithVirtualMachine___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = (void *)MEMORY[0x24BDBCE50];
  objc_msgSend(v3, "toString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dataWithContentsOfFile:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(MEMORY[0x24BDDA730], "valueWithObject:inContext:", v7, WeakRetained);
  else
    objc_msgSend(MEMORY[0x24BDDA730], "valueWithNullInContext:", WeakRetained);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __38__CRJSContext_initWithVirtualMachine___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("[JavaScript] %@"), a2);
}

void __38__CRJSContext_initWithVirtualMachine___block_invoke_3(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("[Error] %@"), a2);
}

+ (id)sharedContext
{
  if (sharedContext_onceToken != -1)
    dispatch_once(&sharedContext_onceToken, &__block_literal_global_49);
  return (id)sharedContext_sharedContext;
}

void __28__CRJSContext_sharedContext__block_invoke()
{
  CRJSContext *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [CRJSContext alloc];
  v3 = objc_alloc_init(MEMORY[0x24BDDA738]);
  v1 = -[CRJSContext initWithVirtualMachine:](v0, "initWithVirtualMachine:", v3);
  v2 = (void *)sharedContext_sharedContext;
  sharedContext_sharedContext = v1;

}

- (void)evaluateScript:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  id v19;
  id location;
  _QWORD v21[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __48__CRJSContext_evaluateScript_completionHandler___block_invoke;
    v21[3] = &unk_24DDD9420;
    v10 = v7;
    v22 = v10;
    -[CRJSContext setExceptionHandler:](self, "setExceptionHandler:", v21);
    objc_initWeak(&location, self);
    v14 = v9;
    v15 = 3221225472;
    v16 = __48__CRJSContext_evaluateScript_completionHandler___block_invoke_2;
    v17 = &unk_24DDD9448;
    objc_copyWeak(&v19, &location);
    v18 = v10;
    v11 = (void *)MEMORY[0x220754DFC](&v14);
    -[CRJSContext setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v11, CFSTR("createCard"));

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("createCard(function() { %@ }());"),
      v6,
      v14,
      v15,
      v16,
      v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)-[CRJSContext evaluateScript:](self, "evaluateScript:", v12);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);

  }
}

void __48__CRJSContext_evaluateScript_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDD1540];
  v8 = *MEMORY[0x24BDD0FC8];
  objc_msgSend(a3, "toString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("CRJSContextErrorDomain"), 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __48__CRJSContext_evaluateScript_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_createCard:completionHandler:", v4, *(_QWORD *)(a1 + 32));

}

- (void)_createCard:(id)a3 completionHandler:(id)a4
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
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "valueForProperty:", CFSTR("sash"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForProperty:", CFSTR("applicationBundleIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForProperty:", CFSTR("title"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForProperty:", CFSTR("cardSections"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "toArray");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "isUndefined") & 1) != 0)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(v9, "toString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((objc_msgSend(v10, "isUndefined") & 1) != 0)
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(v10, "toString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22 = v6;
  objc_msgSend(v6, "valueForProperty:", CFSTR("interaction"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "toDictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  -[CRJSContext _cardWithTitle:cardSections:interaction:error:](self, "_cardWithTitle:cardSections:interaction:error:", v14, v12, v16, &v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v23;
  if (v18)
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, id))v7 + 2))(v7, 0, 0, 0, v18);
  }
  else
  {
    objc_msgSend(v17, "data");
    v21 = v12;
    v19 = v9;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, void *, void *, _QWORD))v7 + 2))(v7, v13, v14, v20, 0);

    v9 = v19;
    v12 = v21;
  }

}

- (id)_cardWithTitle:(id)a3 cardSections:(id)a4 interaction:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v38;
  id v39;
  void *v40;
  void *v41;
  id obj;
  uint64_t v43;
  id *v45;
  void *v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  const __CFString *v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v47 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "count"))
  {
    v45 = a6;
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("intent"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v10;
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("intentResponse"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v39 = v9;
    obj = v9;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    if (v11)
    {
      v12 = v11;
      v43 = *(_QWORD *)v49;
LABEL_4:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v49 != v43)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v13);
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("_backingObject"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          break;
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("_type"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "integerValue");

        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("_value"));
        v18 = (NSString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("nextCard"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v20 = 0;
        }
        else
        {
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("cardSections"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v21 = 0;
        }
        else
        {
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("interaction"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v22 = objc_alloc_init(MEMORY[0x24BE850B0]);
        NSSelectorFromString(v18);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v15, "backingObject");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setValue:forKey:", v23, v18);

        }
        v24 = objc_alloc_init(MEMORY[0x24BE850A8]);
        objc_msgSend(v24, "setType:", v17);
        objc_msgSend(v24, "setValue:", v22);
        -[CRJSContext _cardWithTitle:cardSections:interaction:error:](self, "_cardWithTitle:cardSections:interaction:error:", v47, v20, v21, v45);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setNextCard:", v25);

        objc_msgSend(v46, "addObject:", v24);
        if (v12 == ++v13)
        {
          v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
          if (v12)
            goto LABEL_4;
          goto LABEL_18;
        }
      }
      if (v45)
      {
        v36 = (void *)MEMORY[0x24BDD1540];
        v52 = *MEMORY[0x24BDD0FC8];
        v53 = CFSTR("Unable to create card");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "errorWithDomain:code:userInfo:", CFSTR("CRJSContextErrorDomain"), 1, v34);
        v26 = 0;
        *v45 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      }
      v26 = 0;
      v10 = v38;
      v9 = v39;
    }
    else
    {
LABEL_18:

      v26 = objc_alloc_init(MEMORY[0x24BE850A0]);
      objc_msgSend(v26, "setTitle:", v47);
      objc_msgSend(v26, "setCardSections:", v46);
      v27 = v41;
      if (v41)
      {
        objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("_backingObject"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("_type"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "backingObject");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setIntentMessageName:", v29);
        objc_msgSend(v30, "data");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setIntentMessageData:", v31);

      }
      v32 = v40;
      if (!v40)
      {
        v10 = v38;
        v9 = v39;
        goto LABEL_28;
      }
      objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("_backingObject"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("_type"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      obj = v33;
      objc_msgSend(v33, "backingObject");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setIntentResponseMessageName:", v15);
      objc_msgSend(v34, "data");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setIntentResponseMessageData:", v35);

LABEL_24:
      v10 = v38;
      v9 = v39;

    }
    v32 = v40;
    v27 = v41;
LABEL_28:

    goto LABEL_29;
  }
  v26 = 0;
LABEL_29:

  return v26;
}

@end
