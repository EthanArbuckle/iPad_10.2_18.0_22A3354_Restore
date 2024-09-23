@implementation INPaymentStatusResolutionResult

+ (INPaymentStatusResolutionResult)successWithResolvedPaymentStatus:(INPaymentStatus)resolvedPaymentStatus
{
  void *v4;
  void *v5;

  if (resolvedPaymentStatus)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "resolutionResultSuccessWithResolvedValue:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    NSLog((NSString *)CFSTR("Success resolution with INPaymentStatusUnknown will be reformed to notRequired."), a2);
    objc_msgSend(a1, "notRequired");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (INPaymentStatusResolutionResult *)v5;
}

+ (INPaymentStatusResolutionResult)confirmationRequiredWithPaymentStatusToConfirm:(INPaymentStatus)paymentStatusToConfirm
{
  void *v4;
  void *v5;
  id v7;

  if (paymentStatusToConfirm == INPaymentStatusUnknown)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Confirmation of INPaymentStatusUnknown is not supported."), 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "resolutionResultConfirmationRequiredWithItemToConfirm:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (INPaymentStatusResolutionResult *)v5;
}

- (id)_intentSlotValueForObject:(id)a3 slotDescription:(id)a4
{
  id v5;
  id v6;
  _INPBIntentSlotValue *v7;
  unint64_t v8;
  uint64_t v9;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(_INPBIntentSlotValue);
  if (objc_msgSend(v6, "valueType") == 58)
  {
    -[_INPBIntentSlotValue setType:](v7, "setType:", 1000);
    if (objc_msgSend(v6, "valueStyle") != 3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = objc_msgSend(v5, "integerValue") - 1;
        if (v8 < 5)
          v9 = (v8 + 1);
        else
          v9 = 0x7FFFFFFFLL;
        -[_INPBIntentSlotValue addPayloadPaymentStatus:](v7, "addPayloadPaymentStatus:", v9);
      }
    }
  }

  return v7;
}

- (id)_vocabularyValueForObject:(id)a3 slotDescription:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  __CFString *v11;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "valueType");

  if (v8 == 58)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = objc_msgSend(v5, "integerValue");
      if ((unint64_t)(v9 - 1) > 4)
        v10 = CFSTR("unknown");
      else
        v10 = *(&off_1E228A690 + v9 - 1);
      v11 = v10;

      v7 = v11;
    }
  }

  return v7;
}

- (void)transformResolutionResultForIntent:(id)a3 intentSlotDescription:(id)a4 withOptionsProvider:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, INPaymentStatusResolutionResult *);
  int64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  INPaymentStatusResolutionResult *v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, INPaymentStatusResolutionResult *))a6;
  v12 = -[INIntentResolutionResult resolutionResultCode](self, "resolutionResultCode");
  objc_msgSend(v9, "_metadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "facadePropertyName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "forceNeedsValueForParameters");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "containsObject:", v14);

  if (v16)
  {
    objc_msgSend(v9, "valueForKey:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = v17;
      else
        v18 = 0;
    }
    else
    {
      v18 = 0;
    }
    v19 = v18;

    v20 = objc_msgSend(v19, "integerValue");
    if (!v20 && v12 != 2 && v12 != 3)
    {
      v12 = 4;
      -[INIntentResolutionResult setResolutionResultCode:](self, "setResolutionResultCode:", 4);
    }
    objc_msgSend(v13, "forceNeedsValueForParameters");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "if_arrayByRemovingObject:", v14);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setForceNeedsValueForParameters:", v22);

  }
  if ((v12 == 4 || v12 == 1) && objc_msgSend(v9, "_executionContext") != 1)
  {
    objc_msgSend(v9, "_codableDescription");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "facadePropertyName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "attributeByName:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v26 = v25;
      else
        v26 = 0;
    }
    else
    {
      v26 = 0;
    }
    v27 = v26;

    objc_msgSend(v27, "codableEnum");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      v40 = v27;
      v41 = v14;
      v42 = self;
      v43 = v10;
      v29 = objc_alloc(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v28, "values");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_msgSend(v29, "initWithCapacity:", objc_msgSend(v30, "count"));

      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v39 = v28;
      objc_msgSend(v28, "values");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v45;
        do
        {
          for (i = 0; i != v34; ++i)
          {
            if (*(_QWORD *)v45 != v35)
              objc_enumerationMutation(v32);
            v37 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
            if (objc_msgSend(v37, "index"))
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v37, "index"));
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "addObject:", v38);

            }
          }
          v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
        }
        while (v34);
      }

      if (v12 == 4)
        -[INIntentResolutionResult setResolutionResultCode:](v42, "setResolutionResultCode:", 2);
      -[INIntentResolutionResult setDisambiguationItems:](v42, "setDisambiguationItems:", v31);
      v11[2](v11, v42);

      v10 = v43;
      v27 = v40;
      v14 = v41;
      v28 = v39;
    }
    else
    {
      v11[2](v11, self);
    }

  }
  else
  {
    v11[2](v11, self);
  }

}

@end
