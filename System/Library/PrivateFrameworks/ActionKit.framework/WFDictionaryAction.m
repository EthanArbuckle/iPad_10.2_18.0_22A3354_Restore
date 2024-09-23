@implementation WFDictionaryAction

- (void)runWithInput:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;

  -[WFDictionaryAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFItems"), objc_opt_class());
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[WFDictionaryAction output](self, "output");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
}

- (id)minimumSupportedClientVersion
{
  void *v3;
  void *v4;
  objc_super v6;
  objc_super v7;

  if (-[WFDictionaryAction hasReplacedArrayOrDictionaryWithVariable](self, "hasReplacedArrayOrDictionaryWithVariable"))
  {
    v7.receiver = self;
    v7.super_class = (Class)WFDictionaryAction;
    -[WFDictionaryAction minimumSupportedClientVersion](&v7, sel_minimumSupportedClientVersion);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    WFMaximumBundleVersion();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)WFDictionaryAction;
    -[WFDictionaryAction minimumSupportedClientVersion](&v6, sel_minimumSupportedClientVersion);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (BOOL)hasReplacedArrayOrDictionaryWithVariable
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  void *v19;
  void *v21;
  uint64_t v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  -[WFDictionaryAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFItems"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "keyValuePairs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v25;
    v7 = 0x24BEC3000uLL;
    while (1)
    {
      v8 = 0;
      v22 = v4;
      do
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(v2);
        if (v5)
        {
          v5 = 1;
          goto LABEL_13;
        }
        v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v8);
        objc_msgSend(v9, "value");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "state");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {

LABEL_11:
          objc_msgSend(v9, "value");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "state");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = -[WFDictionaryAction hasReplacedArrayOrDictionaryWithVariableInState:](self, "hasReplacedArrayOrDictionaryWithVariableInState:", v19);

          goto LABEL_13;
        }
        objc_msgSend(v9, "value");
        v12 = v6;
        v13 = v2;
        v14 = v7;
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "state");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        v7 = v14;
        v2 = v13;
        v6 = v12;
        v4 = v22;

        if ((isKindOfClass & 1) != 0)
          goto LABEL_11;
        v5 = 0;
LABEL_13:
        ++v8;
      }
      while (v4 != v8);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (!v4)
        goto LABEL_17;
    }
  }
  v5 = 0;
LABEL_17:

  return v5;
}

- (BOOL)hasReplacedArrayOrDictionaryWithVariableInState:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    while (1)
    {
      objc_msgSend(v3, "lastObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "removeLastObject");
      objc_msgSend(v4, "variable");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v4, "values");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "if_compactMap:", &__block_literal_global_29434);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v7);

      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v4, "keyValuePairs");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "if_compactMap:", &__block_literal_global_118_29436);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

      }
      if (!objc_msgSend(v3, "count"))
        goto LABEL_8;
    }

    v10 = 1;
  }
  else
  {
LABEL_8:
    v10 = 0;
  }

  return v10;
}

id __70__WFDictionaryAction_hasReplacedArrayOrDictionaryWithVariableInState___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a2, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

id __70__WFDictionaryAction_hasReplacedArrayOrDictionaryWithVariableInState___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  objc_msgSend(a2, "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

@end
