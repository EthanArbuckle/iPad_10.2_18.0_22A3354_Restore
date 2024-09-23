@implementation INBooleanResolutionResult

+ (INBooleanResolutionResult)successWithResolvedValue:(BOOL)resolvedValue
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", resolvedValue);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "resolutionResultSuccessWithResolvedValue:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (INBooleanResolutionResult *)v5;
}

- (id)_intentSlotValueForObject:(id)a3 slotDescription:(id)a4
{
  id v5;
  id v6;
  _INPBIntentSlotValue *v7;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(_INPBIntentSlotValue);
  if (objc_msgSend(v6, "valueType") == 1)
  {
    -[_INPBIntentSlotValue setType:](v7, "setType:", 100);
    if (objc_msgSend(v6, "valueStyle") != 3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[_INPBIntentSlotValue addPayloadPrimitiveBool:](v7, "addPayloadPrimitiveBool:", objc_msgSend(v5, "BOOLValue"));
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
  char isKindOfClass;
  void *v13;
  uint64_t v14;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "systemLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "groupingSeparator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "valueType");

  if (v10 == 1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v5, "valueForKey:", CFSTR("stringValue"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "if_escapedComponentsJoinedByString:forLocale:", v9, v8);
        v14 = objc_claimAutoreleasedReturnValue();

        v7 = v13;
LABEL_7:

        v7 = (void *)v14;
        goto LABEL_8;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "stringValue");
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
LABEL_8:

  return v7;
}

@end
