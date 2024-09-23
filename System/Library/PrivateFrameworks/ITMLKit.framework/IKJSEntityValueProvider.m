@implementation IKJSEntityValueProvider

- (id)valueForEntityProperty:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__16;
  v16 = __Block_byref_object_dispose__16;
  v17 = 0;
  -[IKJSObject appContext](self, "appContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__IKJSEntityValueProvider_valueForEntityProperty___block_invoke;
  v9[3] = &unk_1E9F4CF20;
  v11 = &v12;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "evaluateDelegateBlockSync:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __50__IKJSEntityValueProvider_valueForEntityProperty___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_valueForEntityProperty:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)valuesForEntityProperties:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  IKJSEntityValueProvider *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__16;
  v16 = __Block_byref_object_dispose__16;
  v17 = 0;
  if (objc_msgSend(v4, "count"))
  {
    -[IKJSObject appContext](self, "appContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __53__IKJSEntityValueProvider_valuesForEntityProperties___block_invoke;
    v8[3] = &unk_1E9F4DFC0;
    v9 = v4;
    v10 = self;
    v11 = &v12;
    objc_msgSend(v5, "evaluateDelegateBlockSync:", v8);

  }
  if (v13[5])
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  _Block_object_dispose(&v12, 8);

  return v6;
}

void __53__IKJSEntityValueProvider_valuesForEntityProperties___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "_valueForEntityProperty:", v7, (_QWORD)v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          if (!v9)
          {
            v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
            v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
            v12 = *(void **)(v11 + 40);
            *(_QWORD *)(v11 + 40) = v10;

            v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          }
          objc_msgSend(v9, "setObject:forKey:", v8, v7);
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

}

- (id)_valueForEntityProperty:(id)a3
{
  id v4;
  int v5;
  IKEntityValueProviding *entityValueProvider;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("entityUniqueIdentifier"));
  entityValueProvider = self->_entityValueProvider;
  if (!v5)
  {
    -[IKEntityValueProviding valueForEntityProperty:](entityValueProvider, "valueForEntityProperty:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[IKEntityValueProviding stringValueWithNativeValue:forProperty:](self->_entityValueProvider, "stringValueWithNativeValue:forProperty:", v7, v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = v8;
LABEL_6:
        v10 = v9;

        v7 = v10;
LABEL_10:

        goto LABEL_11;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v7, "unsignedLongLongValue"));
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_11;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if ((objc_opt_respondsToSelector() & 1) == 0)
          goto LABEL_11;
        objc_msgSend(v7, "stringValue");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_10;
        v9 = v10;
        goto LABEL_6;
      }
      objc_msgSend(v7, "string");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v10 = v7;
    v7 = (void *)v11;
    goto LABEL_10;
  }
  -[IKEntityValueProviding entityUniqueIdentifier](entityValueProvider, "entityUniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v7;
}

- (IKEntityValueProviding)entityValueProvider
{
  return self->_entityValueProvider;
}

- (void)setEntityValueProvider:(id)a3
{
  objc_storeStrong((id *)&self->_entityValueProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityValueProvider, 0);
}

@end
