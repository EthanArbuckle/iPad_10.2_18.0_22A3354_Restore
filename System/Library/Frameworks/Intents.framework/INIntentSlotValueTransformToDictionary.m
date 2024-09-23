@implementation INIntentSlotValueTransformToDictionary

void __INIntentSlotValueTransformToDictionary_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _INPBPair *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  char v29;
  void *v30;
  char v31;
  void *v32;
  char v33;
  void *v34;
  char v35;
  void *v36;
  char v37;
  void *v38;
  char v39;
  void *v40;
  char v41;
  void *v42;
  char v43;
  void *v44;
  char v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  _QWORD v59[2];

  v59[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_alloc_init(_INPBPair);
    -[_INPBPair setKey:](v7, "setKey:", v5);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_INPBPair setRepeated:](v7, "setRepeated:", 1);
      objc_msgSend(v6, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        INIntentSlotValueTransformToStringValues(v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[_INPBPair setPairStringValues:](v7, "setPairStringValues:", v10);
LABEL_70:

        objc_msgSend(*(id *)(a1 + 32), "addPair:", v7);
        goto LABEL_71;
      }
      objc_msgSend(v6, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v13 = objc_opt_isKindOfClass();

      if ((v13 & 1) != 0)
      {
        INIntentSlotValueTransformToURLValues(v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[_INPBPair setPairUrlValues:](v7, "setPairUrlValues:", v10);
        goto LABEL_70;
      }
      objc_msgSend(v6, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "firstObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "_intents_isDouble");

        if (v16)
        {
          INIntentSlotValueTransformToDoubleValues(v6);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[_INPBPair setPairDoubleValues:](v7, "setPairDoubleValues:", v10);
          goto LABEL_70;
        }
      }
      else
      {

      }
      objc_msgSend(v6, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "firstObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "_intents_isInteger");

        if (v19)
        {
          INIntentSlotValueTransformToIntegerValues(v6);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[_INPBPair setPairIntegerValues:](v7, "setPairIntegerValues:", v10);
          goto LABEL_70;
        }
      }
      else
      {

      }
      objc_msgSend(v6, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "firstObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "unit");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v23 = objc_opt_isKindOfClass();

        if ((v23 & 1) != 0)
        {
          INIntentSlotValueTransformToDistanceValues(v6);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[_INPBPair setPairDistanceValues:](v7, "setPairDistanceValues:", v10);
          goto LABEL_70;
        }
      }
      else
      {

      }
      objc_msgSend(v6, "firstObject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "firstObject");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "unit");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v27 = objc_opt_isKindOfClass();

        if ((v27 & 1) != 0)
        {
          INIntentSlotValueTransformToTemperatureValues(v6);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[_INPBPair setPairTemperatureValues:](v7, "setPairTemperatureValues:", v10);
          goto LABEL_70;
        }
      }
      else
      {

      }
      objc_msgSend(v6, "firstObject");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v31 = objc_opt_isKindOfClass();

      if ((v31 & 1) != 0)
      {
        INIntentSlotValueTransformToLocationValues(v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[_INPBPair setPairLocationValues:](v7, "setPairLocationValues:", v10);
        goto LABEL_70;
      }
      objc_msgSend(v6, "firstObject");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v35 = objc_opt_isKindOfClass();

      if ((v35 & 1) != 0)
      {
        INIntentSlotValueTransformToContactValues(v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[_INPBPair setPairPersonValues:](v7, "setPairPersonValues:", v10);
        goto LABEL_70;
      }
      objc_msgSend(v6, "firstObject");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v37 = objc_opt_isKindOfClass();

      if ((v37 & 1) != 0)
      {
        INIntentSlotValueTransformToCurrencyAmountValues(v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[_INPBPair setPairCurrencyAmountValues:](v7, "setPairCurrencyAmountValues:", v10);
        goto LABEL_70;
      }
      objc_msgSend(v6, "firstObject");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v39 = objc_opt_isKindOfClass();

      if ((v39 & 1) != 0)
      {
        INIntentSlotValueTransformToImageValues(v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[_INPBPair setPairImageValues:](v7, "setPairImageValues:", v10);
        goto LABEL_70;
      }
      objc_msgSend(v6, "firstObject");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v41 = objc_opt_isKindOfClass();

      if ((v41 & 1) != 0)
      {
        INIntentSlotValueTransformToDataStrings(v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[_INPBPair setPairDataStrings:](v7, "setPairDataStrings:", v10);
        goto LABEL_70;
      }
      objc_msgSend(v6, "firstObject");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v43 = objc_opt_isKindOfClass();

      if ((v43 & 1) != 0)
      {
        INIntentSlotValueTransformToPaymentMethodValues(v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[_INPBPair setPairPaymentMethodValues:](v7, "setPairPaymentMethodValues:", v10);
        goto LABEL_70;
      }
      objc_msgSend(v6, "firstObject");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v45 = objc_opt_isKindOfClass();

      if ((v45 & 1) != 0)
      {
        INIntentSlotValueTransformToCustomObjects(v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[_INPBPair setPairCustomObjects:](v7, "setPairCustomObjects:", v10);
        goto LABEL_70;
      }
LABEL_71:

      goto LABEL_72;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      INIntentSlotValueTransformToStringValue(v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v59[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_INPBPair setPairStringValues:](v7, "setPairStringValues:", v11);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        INIntentSlotValueTransformToDataValue(v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[_INPBPair setPairDataValues:](v7, "setPairDataValues:", v11);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          INIntentSlotValueTransformToURLValue(v6);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = v10;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[_INPBPair setPairUrlValues:](v7, "setPairUrlValues:", v11);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "_intents_isDouble"))
          {
            INIntentSlotValueTransformToDoubleValue(v6);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = v10;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            -[_INPBPair setPairDoubleValues:](v7, "setPairDoubleValues:", v11);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "_intents_isInteger"))
            {
              INIntentSlotValueTransformToIntegerValue(v6);
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              v55 = v10;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              -[_INPBPair setPairIntegerValues:](v7, "setPairIntegerValues:", v11);
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                && (objc_msgSend(v6, "unit"),
                    v28 = (void *)objc_claimAutoreleasedReturnValue(),
                    objc_opt_class(),
                    v29 = objc_opt_isKindOfClass(),
                    v28,
                    (v29 & 1) != 0))
              {
                INIntentSlotValueTransformToDistanceValue(v6);
                v10 = (void *)objc_claimAutoreleasedReturnValue();
                v54 = v10;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
                v11 = (void *)objc_claimAutoreleasedReturnValue();
                -[_INPBPair setPairDistanceValues:](v7, "setPairDistanceValues:", v11);
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0
                  && (objc_msgSend(v6, "unit"),
                      v32 = (void *)objc_claimAutoreleasedReturnValue(),
                      objc_opt_class(),
                      v33 = objc_opt_isKindOfClass(),
                      v32,
                      (v33 & 1) != 0))
                {
                  INIntentSlotValueTransformToTemperatureValue(v6);
                  v10 = (void *)objc_claimAutoreleasedReturnValue();
                  v53 = v10;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
                  v11 = (void *)objc_claimAutoreleasedReturnValue();
                  -[_INPBPair setPairTemperatureValues:](v7, "setPairTemperatureValues:", v11);
                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    INIntentSlotValueTransformToLocationValue(v6);
                    v10 = (void *)objc_claimAutoreleasedReturnValue();
                    v52 = v10;
                    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
                    v11 = (void *)objc_claimAutoreleasedReturnValue();
                    -[_INPBPair setPairLocationValues:](v7, "setPairLocationValues:", v11);
                  }
                  else
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      INIntentSlotValueTransformToContactValue(v6);
                      v10 = (void *)objc_claimAutoreleasedReturnValue();
                      v51 = v10;
                      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
                      v11 = (void *)objc_claimAutoreleasedReturnValue();
                      -[_INPBPair setPairPersonValues:](v7, "setPairPersonValues:", v11);
                    }
                    else
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        INIntentSlotValueTransformToCurrencyAmountValue(v6);
                        v10 = (void *)objc_claimAutoreleasedReturnValue();
                        v50 = v10;
                        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
                        v11 = (void *)objc_claimAutoreleasedReturnValue();
                        -[_INPBPair setPairCurrencyAmountValues:](v7, "setPairCurrencyAmountValues:", v11);
                      }
                      else
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          INIntentSlotValueTransformToImageValue(v6);
                          v10 = (void *)objc_claimAutoreleasedReturnValue();
                          v49 = v10;
                          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
                          v11 = (void *)objc_claimAutoreleasedReturnValue();
                          -[_INPBPair setPairImageValues:](v7, "setPairImageValues:", v11);
                        }
                        else
                        {
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            INIntentSlotValueTransformToDataString(v6);
                            v10 = (void *)objc_claimAutoreleasedReturnValue();
                            v48 = v10;
                            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
                            v11 = (void *)objc_claimAutoreleasedReturnValue();
                            -[_INPBPair setPairDataStrings:](v7, "setPairDataStrings:", v11);
                          }
                          else
                          {
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              INIntentSlotValueTransformToPaymentMethodValue(v6);
                              v10 = (void *)objc_claimAutoreleasedReturnValue();
                              v47 = v10;
                              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
                              v11 = (void *)objc_claimAutoreleasedReturnValue();
                              -[_INPBPair setPairPaymentMethodValues:](v7, "setPairPaymentMethodValues:", v11);
                            }
                            else
                            {
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) == 0)
                                goto LABEL_71;
                              INIntentSlotValueTransformToCustomObject(v6);
                              v10 = (void *)objc_claimAutoreleasedReturnValue();
                              v46 = v10;
                              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
                              v11 = (void *)objc_claimAutoreleasedReturnValue();
                              -[_INPBPair setPairCustomObjects:](v7, "setPairCustomObjects:", v11);
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }

    goto LABEL_70;
  }
LABEL_72:

}

@end
