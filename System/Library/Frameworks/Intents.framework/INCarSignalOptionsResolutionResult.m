@implementation INCarSignalOptionsResolutionResult

+ (INCarSignalOptionsResolutionResult)successWithResolvedCarSignalOptions:(INCarSignalOptions)resolvedCarSignalOptions
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", resolvedCarSignalOptions);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "resolutionResultSuccessWithResolvedValue:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (INCarSignalOptionsResolutionResult *)v5;
}

+ (INCarSignalOptionsResolutionResult)confirmationRequiredWithCarSignalOptionsToConfirm:(INCarSignalOptions)carSignalOptionsToConfirm
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", carSignalOptionsToConfirm);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "resolutionResultConfirmationRequiredWithItemToConfirm:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (INCarSignalOptionsResolutionResult *)v5;
}

- (id)_intentSlotValueForObject:(id)a3 slotDescription:(id)a4
{
  id v5;
  id v6;
  _INPBIntentSlotValue *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[4];
  _INPBIntentSlotValue *v12;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(_INPBIntentSlotValue);
  v8 = objc_msgSend(v6, "valueType");

  if (v8 == 143)
  {
    -[_INPBIntentSlotValue setType:](v7, "setType:", 1000);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = objc_msgSend(v5, "unsignedIntegerValue");
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __80__INCarSignalOptionsResolutionResult__intentSlotValueForObject_slotDescription___block_invoke;
      v11[3] = &unk_1E2295130;
      v12 = v7;
      INCarSignalOptionsEnumerateBackingTypes(v9, v11);

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
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "systemLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "groupingSeparator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "valueType");

  if (v10 == 143)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      INCarSignalOptionsGetNames(objc_msgSend(v5, "unsignedIntegerValue"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "if_escapedComponentsJoinedByString:forLocale:", v9, v8);
      v12 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v12;
    }
  }

  return v7;
}

uint64_t __80__INCarSignalOptionsResolutionResult__intentSlotValueForObject_slotDescription___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addPayloadCarSignalIdentifier:", a2);
}

@end
