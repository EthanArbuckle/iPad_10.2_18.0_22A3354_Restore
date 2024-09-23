@implementation INObjectResolutionResult

- (id)_intentSlotValueForObject:(id)a3 slotDescription:(id)a4
{
  id v5;
  id v6;
  _INPBIntentSlotValue *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void (**v14)(_QWORD, _QWORD);
  void *v15;
  char isKindOfClass;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[4];
  id v28;
  _INPBIntentSlotValue *v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(_INPBIntentSlotValue);
  if (objc_msgSend(v6, "valueType") == 225)
  {
    -[_INPBIntentSlotValue setType:](v7, "setType:", 1000);
    objc_msgSend(v6, "codableAttribute");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v10 = v9;

    objc_msgSend(v10, "valueTransformer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __70__INObjectResolutionResult__intentSlotValueForObject_slotDescription___block_invoke;
    v27[3] = &unk_1E228FC20;
    v12 = v11;
    v28 = v12;
    v29 = v7;
    v13 = v10;
    v30 = v13;
    v14 = (void (**)(_QWORD, _QWORD))MEMORY[0x18D7812C4](v27);
    if (objc_msgSend(v6, "valueStyle") == 3
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && (objc_msgSend(v5, "firstObject"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          isKindOfClass = objc_opt_isKindOfClass(),
          v15,
          (isKindOfClass & 1) != 0))
    {
      v17 = v5;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v24 != v20)
              objc_enumerationMutation(v17);
            v14[2](v14, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        }
        while (v19);
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        ((void (**)(_QWORD, id))v14)[2](v14, v5);
    }

  }
  return v7;
}

- (id)_vocabularyValueForObject:(id)a3 slotDescription:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  uint64_t v13;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "systemLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "groupingSeparator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "valueType") == 225)
  {
    if (objc_msgSend(v6, "valueStyle") == 3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v5, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v5, "valueForKey:", CFSTR("displayString"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "if_escapedComponentsJoinedByString:forLocale:", v9, v8);
          v13 = objc_claimAutoreleasedReturnValue();

          v7 = v12;
LABEL_8:

          v7 = (void *)v13;
          goto LABEL_9;
        }
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "displayString");
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
LABEL_9:

  return v7;
}

- (void)transformResolutionResultForIntent:(id)a3 intentSlotDescription:(id)a4 withOptionsProvider:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  objc_super v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "_codableDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
  }
  else
  {
    v15 = 0;
  }
  v16 = v15;

  -[INIntentResolutionResult resolvedValue](self, "resolvedValue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_referencedCodableDescriptionsByClassName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[INCodableDescription _codableDescriptionForTypedObject:inDictionary:](INCodableDescription, "_codableDescriptionForTypedObject:inDictionary:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v11, "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "attributeByName:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v22 = v21;
      else
        v22 = 0;
    }
    else
    {
      v22 = 0;
    }
    v23 = v22;

    objc_msgSend(v23, "setCodableDescription:", v19);
    objc_msgSend(v11, "codableAttribute");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v25 = v24;
      else
        v25 = 0;
    }
    else
    {
      v25 = 0;
    }
    v26 = v25;

    objc_msgSend(v26, "setCodableDescription:", v19);
  }
  v27.receiver = self;
  v27.super_class = (Class)INObjectResolutionResult;
  -[INIntentResolutionResult transformResolutionResultForIntent:intentSlotDescription:withOptionsProvider:completion:](&v27, sel_transformResolutionResultForIntent_intentSlotDescription_withOptionsProvider_completion_, v10, v11, v12, v13);

}

void __70__INObjectResolutionResult__intentSlotValueForObject_slotDescription___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  INArchivedObject *v6;
  void *v7;
  void *v8;
  INArchivedObject *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v3 = objc_msgSend((id)objc_opt_class(), "transformedValueClass");
  if (v3 == objc_opt_class())
  {
    INIntentSlotValueTransformToCustomObject(v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addPayloadCustomObject:", v5);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "valueTransformer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transformedValue:", v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = [INArchivedObject alloc];
    objc_msgSend(*(id *)(a1 + 48), "typeName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[INArchivedObject initWithTypeName:messageData:](v6, "initWithTypeName:messageData:", v7, v8);

    v10 = *(void **)(a1 + 40);
    INIntentSlotValueTransformToArchivedObject(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addPayloadArchivedObject:", v11);

  }
}

@end
