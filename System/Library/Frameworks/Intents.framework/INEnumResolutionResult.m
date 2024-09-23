@implementation INEnumResolutionResult

+ (INEnumResolutionResult)successWithResolvedValue:(NSInteger)resolvedValue
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", resolvedValue);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "resolutionResultSuccessWithResolvedValue:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (INEnumResolutionResult *)v5;
}

+ (INEnumResolutionResult)confirmationRequiredWithValueToConfirm:(NSInteger)valueToConfirm
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", valueToConfirm);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "resolutionResultConfirmationRequiredWithItemToConfirm:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (INEnumResolutionResult *)v5;
}

- (id)_intentSlotValueForObject:(id)a3 slotDescription:(id)a4
{
  id v5;
  id v6;
  _INPBIntentSlotValue *v7;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(_INPBIntentSlotValue);
  if (objc_msgSend(v6, "valueType") == 65)
  {
    -[_INPBIntentSlotValue setType:](v7, "setType:", 1000);
    if (objc_msgSend(v6, "valueStyle") != 3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[_INPBIntentSlotValue addPayloadEnumeration:](v7, "addPayloadEnumeration:", objc_msgSend(v5, "integerValue"));
    }
  }

  return v7;
}

- (id)_vocabularyValueForObject:(id)a3 slotDescription:(id)a4
{
  return (id)objc_msgSend(a3, "description");
}

- (void)transformResolutionResultForIntent:(id)a3 intentSlotDescription:(id)a4 withOptionsProvider:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, INEnumResolutionResult *);
  int64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  INEnumResolutionResult *v38;
  void (**v39)(id, INEnumResolutionResult *);
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, INEnumResolutionResult *))a6;
  v12 = -[INIntentResolutionResult resolutionResultCode](self, "resolutionResultCode");
  objc_msgSend(v9, "_metadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "facadePropertyName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "forceNeedsValueForParameters");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = objc_msgSend(v15, "containsObject:", v14);

  if ((_DWORD)a4)
  {
    objc_msgSend(v9, "valueForKey:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v17 = v16;
      else
        v17 = 0;
    }
    else
    {
      v17 = 0;
    }
    v18 = v17;

    v19 = objc_msgSend(v18, "integerValue");
    if (!v19 && v12 != 2 && v12 != 3)
    {
      v12 = 4;
      -[INIntentResolutionResult setResolutionResultCode:](self, "setResolutionResultCode:", 4);
    }
    objc_msgSend(v13, "forceNeedsValueForParameters");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "if_arrayByRemovingObject:", v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setForceNeedsValueForParameters:", v21);

  }
  if (v12 == 4 || v12 == 1)
  {
    objc_msgSend(v10, "codableAttribute");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = self;
    v39 = v11;
    v34 = v14;
    v36 = v13;
    if (v22)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v23 = v22;
      else
        v23 = 0;
    }
    else
    {
      v23 = 0;
    }
    v24 = v23;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    objc_msgSend(v24, "codableEnum");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "values");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v41 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          if (objc_msgSend(v32, "index", v34, v36))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v32, "index"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "addObject:", v33);

          }
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v29);
    }

    if (v12 == 4)
      -[INIntentResolutionResult setResolutionResultCode:](v38, "setResolutionResultCode:", 2);
    -[INIntentResolutionResult setDisambiguationItems:](v38, "setDisambiguationItems:", v25, v34, v36);
    v11 = v39;
    v39[2](v39, v38);

    v14 = v35;
    v13 = v37;
  }
  else
  {
    v11[2](v11, self);
  }

}

@end
