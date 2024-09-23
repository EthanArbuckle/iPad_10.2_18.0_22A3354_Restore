@implementation CNAutocompleteLocalContactResultTransformBuilder

+ (id)localContactBuilderWithResultFactory:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithResultFactory:", v4);

  objc_msgSend(v5, "setBuiltContactType:", 0);
  return v5;
}

+ (id)suggestedContactBuilderWithResultFactory:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithResultFactory:", v4);

  objc_msgSend(v5, "setBuiltContactType:", 1);
  return v5;
}

+ (id)serverContactBuilderWithResultFactory:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithResultFactory:", v4);

  objc_msgSend(v5, "setBuiltContactType:", 2);
  return v5;
}

- (CNAutocompleteLocalContactResultTransformBuilder)initWithResultFactory:(id)a3
{
  id v5;
  CNAutocompleteLocalContactResultTransformBuilder *v6;
  CNAutocompleteLocalContactResultTransformBuilder *v7;
  NSMutableArray *v8;
  NSMutableArray *transforms;
  CNAutocompleteLocalContactResultTransformBuilder *v10;

  v5 = a3;
  v6 = -[CNAutocompleteLocalContactResultTransformBuilder init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_factory, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    transforms = v7->_transforms;
    v7->_transforms = v8;

    v10 = v7;
  }

  return v7;
}

- (void)addTransformForProperty:(id)a3
{
  NSMutableArray *transforms;
  void *v5;
  id v6;

  -[CNAutocompleteLocalContactResultTransformBuilder makeTransformForProperty:](self, "makeTransformForProperty:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  transforms = self->_transforms;
  v5 = _Block_copy(v6);
  -[NSMutableArray _cn_addNonNilObject:](transforms, "_cn_addNonNilObject:", v5);

}

- (id)makeTransformForProperty:(id)a3
{
  id v4;
  unint64_t v5;
  CNAutocompleteResultFactory *v6;
  uint64_t v7;
  id v8;
  CNAutocompleteResultFactory *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD aBlock[4];
  id v16;
  id v17;
  CNAutocompleteResultFactory *v18;
  uint64_t v19;
  unint64_t v20;

  v4 = a3;
  v5 = -[CNAutocompleteLocalContactResultTransformBuilder builtContactType](self, "builtContactType");
  v6 = self->_factory;
  v7 = objc_opt_class();
  v8 = objc_alloc_init(MEMORY[0x1E0C97218]);
  objc_msgSend(v8, "setStyle:", 0);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__CNAutocompleteLocalContactResultTransformBuilder_makeTransformForProperty___block_invoke;
  aBlock[3] = &unk_1E70DF170;
  v16 = v4;
  v17 = v8;
  v19 = v7;
  v20 = v5;
  v18 = v6;
  v9 = v6;
  v10 = v8;
  v11 = v4;
  v12 = _Block_copy(aBlock);
  v13 = (void *)objc_msgSend(v12, "copy");

  return v13;
}

id __77__CNAutocompleteLocalContactResultTransformBuilder_makeTransformForProperty___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id obj;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "valueForKey:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "stringFromContact:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sNameComponentsFromContact_block_invoke((uint64_t)v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(a1 + 56), "resultValueForContactPropertyValue:propertyKey:contact:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v10), *(_QWORD *)(a1 + 32), v3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = *(_QWORD *)(a1 + 64);
        if (v12 == 1)
        {
          objc_msgSend(*(id *)(a1 + 48), "suggestedResultWithDisplayName:value:nameComponents:", v5, v11, v6);
          v13 = objc_claimAutoreleasedReturnValue();
LABEL_10:
          v14 = (void *)v13;
          if (!v13)
            goto LABEL_12;
LABEL_11:
          objc_msgSend(v22, "addObject:", v14);
          goto LABEL_12;
        }
        if (v12 == 2)
        {
          objc_msgSend(*(id *)(a1 + 48), "directoryServerResultWithDisplayName:value:nameComponents:", v5, v11, v6);
          v13 = objc_claimAutoreleasedReturnValue();
          goto LABEL_10;
        }
        objc_msgSend(v3, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = *(void **)(a1 + 48);
        if (objc_msgSend(v3, "hasBeenPersisted"))
          v17 = v15;
        else
          v17 = 0;
        objc_msgSend(v16, "localContactResultWithDisplayName:value:nameComponents:contactIdentifier:", v5, v11, v6, v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          goto LABEL_11;
LABEL_12:

        ++v10;
      }
      while (v8 != v10);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      v8 = v18;
    }
    while (v18);
  }

  v19 = (void *)objc_msgSend(v22, "copy");
  return v19;
}

+ (int64_t)addressTypeForProperty:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  int64_t v6;

  v3 = addressTypeForProperty__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&addressTypeForProperty__onceToken, &__block_literal_global_8);
  objc_msgSend((id)addressTypeForProperty__sTypesByKeyMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "_cnac_autocompleteAddressTypeValue");
  return v6;
}

void __75__CNAutocompleteLocalContactResultTransformBuilder_addressTypeForProperty___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v0, "setObject:forKey:", &unk_1E70EFE98, *MEMORY[0x1E0C966A8]);
  objc_msgSend(v0, "setObject:forKey:", &unk_1E70EFEB0, *MEMORY[0x1E0C967C0]);
  objc_msgSend(v0, "setObject:forKey:", &unk_1E70EFEC8, *MEMORY[0x1E0C96740]);
  v1 = (void *)addressTypeForProperty__sTypesByKeyMap;
  addressTypeForProperty__sTypesByKeyMap = (uint64_t)v0;

}

+ (id)resultValueForContactPropertyValue:(id)a3 propertyKey:(id)a4 contact:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  CNAutocompleteResultValue *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(a1, "addressTypeForProperty:", v9);
  v12 = objc_alloc_init(CNAutocompleteResultValue);
  objc_msgSend(v8, "label");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteResultValue setLabel:](v12, "setLabel:", v13);

  if (objc_msgSend(v10, "hasBeenPersisted"))
  {
    objc_msgSend(v8, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAutocompleteResultValue setIdentifier:](v12, "setIdentifier:", v14);

  }
  -[CNAutocompleteResultValue setAddressType:](v12, "setAddressType:", v11);
  switch(v11)
  {
    case 1:
      objc_opt_class();
      objc_msgSend(v8, "value");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v21 = v20;
      else
        v21 = 0;
      v17 = v21;

      if (v17)
        -[CNAutocompleteResultValue setAddress:](v12, "setAddress:", v17);
      break;
    case 2:
      objc_opt_class();
      objc_msgSend(v8, "value");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v23 = v22;
      else
        v23 = 0;
      v17 = v23;

      if (v17)
      {
        -[NSObject stringValue](v17, "stringValue");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNAutocompleteResultValue setAddress:](v12, "setAddress:", v19);
        goto LABEL_21;
      }
      break;
    case 3:
      objc_opt_class();
      objc_msgSend(v8, "value");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v16 = v15;
      else
        v16 = 0;
      v17 = v16;

      if (v17)
      {
        -[NSObject username](v17, "username");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNAutocompleteResultValue setAddress:](v12, "setAddress:", v18);

        -[NSObject service](v17, "service");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNAutocompleteResultValue setInstantMessageAddressService:](v12, "setInstantMessageAddressService:", v19);
LABEL_21:

      }
      break;
    default:
      CNALoggingContextDebug();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v25 = 138412546;
        v26 = v9;
        v27 = 2112;
        v28 = v10;
        _os_log_impl(&dword_1B9950000, v17, OS_LOG_TYPE_DEFAULT, "Unknown address type for property: %@ contact: %@", (uint8_t *)&v25, 0x16u);
      }
      break;
  }

  return v12;
}

- (id)build
{
  uint64_t v3;
  NSMutableArray *transforms;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = -[NSMutableArray count](self->_transforms, "count");
  transforms = self->_transforms;
  if (v3 == 1)
  {
    -[NSMutableArray lastObject](transforms, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

  }
  else
  {
    if ((unint64_t)-[NSMutableArray count](transforms, "count") < 2)
    {
      v7 = (uint64_t)_Block_copy((const void *)*MEMORY[0x1E0D137E0]);
    }
    else
    {
      -[CNAutocompleteLocalContactResultTransformBuilder buildAggregateTransform](self, "buildAggregateTransform");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (void *)v7;
  }
  return v6;
}

- (id)buildAggregateTransform
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  _QWORD aBlock[4];
  id v8;

  v2 = (void *)-[NSMutableArray copy](self->_transforms, "copy");
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__CNAutocompleteLocalContactResultTransformBuilder_buildAggregateTransform__block_invoke;
  aBlock[3] = &unk_1E70DF1C0;
  v8 = v2;
  v3 = v2;
  v4 = _Block_copy(aBlock);
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

id __75__CNAutocompleteLocalContactResultTransformBuilder_buildAggregateTransform__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__CNAutocompleteLocalContactResultTransformBuilder_buildAggregateTransform__block_invoke_2;
  v9[3] = &unk_1E70DF198;
  v10 = v3;
  v5 = v3;
  objc_msgSend(v4, "_cn_map:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_cn_flatten");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __75__CNAutocompleteLocalContactResultTransformBuilder_buildAggregateTransform__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32));
}

- (unint64_t)builtContactType
{
  return self->_builtContactType;
}

- (void)setBuiltContactType:(unint64_t)a3
{
  self->_builtContactType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factory, 0);
  objc_storeStrong((id *)&self->_transforms, 0);
}

@end
