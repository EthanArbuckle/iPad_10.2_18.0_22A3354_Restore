@implementation HDHealthRecordsExtractionUtilities

+ (id)_FHIRMedicalCodingWithCode:(id)a3 medicalCodingSystem:(id)a4 codingVersion:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  HKSafeObject();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDD3CC8], "medicalCodingWithSystem:codingVersion:code:displayString:", v9, v10, v8, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

+ (id)_firstCodingForSystem:(id)a3 inCodeableConcept:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;

  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "medicalCodingsWithCodeableConcept:error:", v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __84__HDHealthRecordsExtractionUtilities__firstCodingForSystem_inCodeableConcept_error___block_invoke;
    v16[3] = &unk_24ECF53B8;
    v11 = v8;
    v17 = v11;
    objc_msgSend(v10, "hk_firstObjectPassingTest:", v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
      v14 = v12;
    else
      objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a5, 3, CFSTR("Expecting codeable concept with system %@ but none was present in %@"), v11, v9);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __84__HDHealthRecordsExtractionUtilities__firstCodingForSystem_inCodeableConcept_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "codingSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

+ (id)wrapInArray:(id)a3 error:(id *)a4
{
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v8[0] = a3;
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)stringArrayWithStrings:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  HKSafeObject();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          objc_opt_class();
          HKSafeObject();
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v11)
          {

            goto LABEL_12;
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
          continue;
        break;
      }
    }

    v12 = v6;
  }
  else
  {
LABEL_12:
    v12 = 0;
  }

  return v12;
}

+ (id)medicalCodingWithCoding:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a3;
  objc_opt_class();
  HKSafeObject();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (!objc_msgSend(v5, "hk_hasValueForKeyPath:", CFSTR("system")))
    {
      v9 = 0;
LABEL_7:
      if (objc_msgSend(v5, "hk_hasValueForKeyPath:", CFSTR("version")))
      {
        objc_msgSend(v5, "hk_safeStringForKeyPath:error:", CFSTR("version"), a4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {
          v10 = 0;
LABEL_22:

          goto LABEL_23;
        }
      }
      else
      {
        v11 = 0;
      }
      if (objc_msgSend(v5, "hk_hasValueForKeyPath:", CFSTR("code")))
      {
        objc_msgSend(v5, "hk_safeStringForKeyPath:error:", CFSTR("code"), a4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          v10 = 0;
LABEL_21:

          goto LABEL_22;
        }
      }
      else
      {
        v12 = 0;
      }
      if (objc_msgSend(v5, "hk_hasValueForKeyPath:", CFSTR("display")))
      {
        objc_msgSend(v5, "hk_safeStringForKeyPath:error:", CFSTR("display"), a4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          v10 = 0;
LABEL_20:

          goto LABEL_21;
        }
      }
      else
      {
        v13 = 0;
      }
      objc_msgSend(MEMORY[0x24BDD3CC8], "medicalCodingWithSystem:codingVersion:code:displayString:", v9, v11, v12, v13);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_20;
    }
    objc_msgSend(v5, "hk_safeStringForKeyPath:error:", CFSTR("system"), a4);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      objc_msgSend(MEMORY[0x24BDD3CD8], "codeSystemWithIdentifier:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
  }
  v10 = 0;
LABEL_23:

  return v10;
}

+ (id)medicalCodingCollectionWithCodeableConcept:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "medicalCodingsWithCodeableConcept:error:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD3CD0], "collectionWithCodings:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)medicalCodingsWithCodeableConcept:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_opt_class();
  HKSafeObject();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_4;
  if (!objc_msgSend(v6, "hk_hasValueForKeyPath:", CFSTR("text")))
  {
    v8 = 0;
LABEL_6:
    if (objc_msgSend(v6, "hk_hasValueForKeyPath:", CFSTR("coding")))
    {
      objc_msgSend(v6, "hk_safeArrayForKeyPath:error:", CFSTR("coding"), a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        v9 = 0;
LABEL_25:

        goto LABEL_26;
      }
    }
    else
    {
      v10 = (void *)MEMORY[0x24BDBD1A8];
    }
    v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    if (v8)
    {
      v12 = (void *)MEMORY[0x24BDD3CC8];
      objc_msgSend(MEMORY[0x24BDD3CD8], "textSystem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "medicalCodingWithSystem:codingVersion:code:displayString:", v13, *MEMORY[0x24BDD30B8], v8, v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v14);

    }
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v15 = v10;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v24 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(a1, "medicalCodingWithCoding:error:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i), a4, (_QWORD)v23);
          v20 = objc_claimAutoreleasedReturnValue();
          if (!v20)
          {

            goto LABEL_23;
          }
          v21 = (void *)v20;
          objc_msgSend(v11, "addObject:", v20);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v17)
          continue;
        break;
      }
    }

    if (objc_msgSend(v11, "count"))
    {
      v9 = (void *)objc_msgSend(v11, "copy");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a4, 3, CFSTR("Medical codings has no valid text or coding"));
LABEL_23:
      v9 = 0;
    }

    goto LABEL_25;
  }
  objc_msgSend(v6, "hk_safeStringForKeyPath:error:", CFSTR("text"), a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    goto LABEL_6;
LABEL_4:
  v9 = 0;
LABEL_26:

  return v9;
}

+ (id)_transformArray:(id)a3 error:(id *)a4 transformBlock:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD, id *);
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void (**)(id, _QWORD, id *))a5;
  objc_opt_class();
  HKSafeObject();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      while (2)
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          v8[2](v8, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v15), a4);
          v16 = objc_claimAutoreleasedReturnValue();
          if (!v16)
          {

            v18 = 0;
            goto LABEL_12;
          }
          v17 = (void *)v16;
          objc_msgSend(v10, "addObject:", v16, (_QWORD)v20);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v13)
          continue;
        break;
      }
    }

    v18 = v10;
LABEL_12:

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)medicalCodingCollectionArrayWithCodeableConcepts:(id)a3 error:(id *)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __93__HDHealthRecordsExtractionUtilities_medicalCodingCollectionArrayWithCodeableConcepts_error___block_invoke;
  v5[3] = &__block_descriptor_40_e12__24__0_8__16l;
  v5[4] = a1;
  objc_msgSend(a1, "_transformArray:error:transformBlock:", a3, a4, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __93__HDHealthRecordsExtractionUtilities_medicalCodingCollectionArrayWithCodeableConcepts_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "medicalCodingCollectionWithCodeableConcept:error:", a2, a3);
}

+ (id)medicalCodingsWithCodeableConcepts:(id)a3 error:(id *)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __79__HDHealthRecordsExtractionUtilities_medicalCodingsWithCodeableConcepts_error___block_invoke;
  v5[3] = &__block_descriptor_40_e12__24__0_8__16l;
  v5[4] = a1;
  objc_msgSend(a1, "_transformArray:error:transformBlock:", a3, a4, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __79__HDHealthRecordsExtractionUtilities_medicalCodingsWithCodeableConcepts_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "medicalCodingsWithCodeableConcept:error:", a2, a3);
}

+ (id)medicalCodingsArrayWithCodeableConcept:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "medicalCodingsWithCodeableConcept:error:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)medicalCodingWithCode:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_opt_class();
  HKSafeObject();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    +[؋ objectForKeyedSubscript:](&unk_24ED0FCB0, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BDD3CC8];
    objc_msgSend(MEMORY[0x24BDD3CD8], "FHIRQuantityComparatorSystem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "medicalCodingWithSystem:codingVersion:code:displayString:", v8, 0, v4, v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (id)codedQuantityWithQuantity:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;

  v6 = a3;
  objc_opt_class();
  HKSafeObject();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "hk_safeNumberForKeyPath:error:", CFSTR("value"), a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
    {
      v12 = 0;
LABEL_31:

      goto LABEL_32;
    }
    objc_msgSend(v8, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a4, 3, CFSTR("Unable to convert number to string"));
LABEL_10:
      v12 = 0;
LABEL_30:

      goto LABEL_31;
    }
    if (objc_msgSend(v6, "hk_hasValueForKeyPath:", CFSTR("unit")))
    {
      objc_msgSend(v6, "hk_safeStringForKeyPath:error:", CFSTR("unit"), a4);
      v11 = objc_claimAutoreleasedReturnValue();
      if (!v11)
        goto LABEL_10;
    }
    else
    {
      v11 = 0;
    }
    if (objc_msgSend(v6, "hk_hasValueForKeyPath:", CFSTR("system")))
    {
      objc_msgSend(v6, "hk_safeStringForKeyPath:error:", CFSTR("system"), a4);
      v13 = objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        v12 = 0;
        goto LABEL_29;
      }
      v14 = (void *)v13;
      objc_msgSend(MEMORY[0x24BDD3CD8], "codeSystemWithIdentifier:", v13);
      v15 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }
    if (objc_msgSend(v6, "hk_hasValueForKeyPath:", CFSTR("code")))
    {
      objc_msgSend(v6, "hk_safeStringForKeyPath:error:", CFSTR("code"), a4);
      v16 = objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        v12 = 0;
LABEL_28:

LABEL_29:
        goto LABEL_30;
      }
    }
    else
    {
      v16 = 0;
      v17 = 0;
      v18 = 0;
      if (!(v11 | v15))
        goto LABEL_21;
    }
    objc_msgSend(MEMORY[0x24BDD3CC8], "medicalCodingWithSystem:codingVersion:code:displayString:", v15, 0, v16, v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
LABEL_21:
    if (objc_msgSend(v6, "hk_hasValueForKeyPath:", CFSTR("comparator")))
    {
      objc_msgSend(v6, "hk_safeStringForKeyPath:error:", CFSTR("comparator"), a4);
      v19 = objc_claimAutoreleasedReturnValue();
      if (!v19
        || (v20 = (void *)v19,
            objc_msgSend(a1, "medicalCodingWithCode:error:", v19, a4),
            v21 = (void *)objc_claimAutoreleasedReturnValue(),
            v20,
            !v21))
      {
        v12 = 0;
LABEL_27:

        goto LABEL_28;
      }
    }
    else
    {
      v21 = 0;
    }
    objc_msgSend(MEMORY[0x24BDD3A10], "codedQuantityWithValue:comparatorCoding:unitCoding:", v10, v21, v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_27;
  }
  v12 = 0;
LABEL_32:

  return v12;
}

+ (id)ratioValueWithRatio:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  objc_opt_class();
  HKSafeObject();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("numerator"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "codedQuantityWithQuantity:error:", v8, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("denominator"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "codedQuantityWithQuantity:error:", v10, a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(MEMORY[0x24BDD3EB0], "ratioValueWithNumerator:andDenominator:", v9, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)stringWithAttachment:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v6 = a3;
  objc_opt_class();
  HKSafeObject();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "hk_safeStringForKeyPath:error:", CFSTR("contentType"), a4);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      if (v8 == CFSTR("text/plain")
        || (v10 = -[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("text/plain")),
            v9 == CFSTR("application/rtf"))
        || (v10 & 1) != 0
        || (-[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("application/rtf")) & 1) != 0)
      {
        objc_msgSend(v6, "hk_safeStringForKeyPath:error:", CFSTR("data"), a4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v11, 0);
          v13 = v12;
          if (v12 && objc_msgSend(v12, "length"))
          {
            v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v13, 4);
            if (v14)
            {
              objc_msgSend(a1, "stringWithRTF:error:", v14, a4);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = v15;
              if (v15)
              {
                v17 = v15;
              }
              else
              {
                objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a4, 3, CFSTR("Error RTF scrubbing valueAttachment.data"));
                _HKInitializeLogging();
                v34 = *MEMORY[0x24BDD2FF8];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
                  +[HDHealthRecordsExtractionUtilities stringWithAttachment:error:].cold.3(v34, v35, v36, v37, v38, v39, v40, v41);
              }

            }
            else
            {
              objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a4, 3, CFSTR("Decoded valueAttachment.data is not a UTF8 String"));
              _HKInitializeLogging();
              v26 = *MEMORY[0x24BDD2FF8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
                +[HDHealthRecordsExtractionUtilities stringWithAttachment:error:].cold.2(v26, v27, v28, v29, v30, v31, v32, v33);
              v16 = 0;
            }

          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a4, 3, CFSTR("Could not Base64 decode valueAttachment.data"));
            _HKInitializeLogging();
            v18 = *MEMORY[0x24BDD2FF8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_ERROR))
              +[HDHealthRecordsExtractionUtilities stringWithAttachment:error:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);
            v16 = 0;
          }

        }
        else
        {
          v16 = 0;
        }

        goto LABEL_29;
      }
      objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a4, 3, CFSTR("Unsupported MIME type for valueAttachment.contentType %@"), v9);
    }
    v16 = 0;
LABEL_29:

    goto LABEL_30;
  }
  v16 = 0;
LABEL_30:

  return v16;
}

+ (id)observationCategoryWithObservationCategory:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "medicalCodingsWithCodeableConcept:error:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v20 = a4;
    if (observationCategoryWithObservationCategory_error__onceToken != -1)
      dispatch_once(&observationCategoryWithObservationCategory_error__onceToken, &__block_literal_global);
    v6 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v7 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v21 = v5;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v13, "codingSystem", v20);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "isEqual:", observationCategoryWithObservationCategory_error__observationCategorySystem))
          {
            objc_msgSend(v13, "code");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v15)
              continue;
            objc_msgSend(v13, "code");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            HKDiagnosticTestResultCategoryFromNSString();
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (v14)
            {
              objc_msgSend(v6, "addObject:", v14);
            }
            else
            {
              objc_msgSend(v13, "code");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "addObject:", v17);

            }
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v10);
    }

    +[HDHealthRecordsExtractionUtilities preferredSupporedCategory:unsupportedCategories:error:](HDHealthRecordsExtractionUtilities, "preferredSupporedCategory:unsupportedCategories:error:", v6, v7, v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v21;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

void __87__HDHealthRecordsExtractionUtilities_observationCategoryWithObservationCategory_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD3CD8], "codeSystemWithIdentifier:", CFSTR("http://hl7.org/fhir/observation-category"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)observationCategoryWithObservationCategory_error__observationCategorySystem;
  observationCategoryWithObservationCategory_error__observationCategorySystem = v0;

}

+ (id)observationCategoryWithObservationCategories:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id *v32;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "medicalCodingCollectionArrayWithCodeableConcepts:error:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v23 = 0;
    goto LABEL_29;
  }
  v32 = a4;
  if (observationCategoryWithObservationCategories_error__onceToken != -1)
    dispatch_once(&observationCategoryWithObservationCategories_error__onceToken, &__block_literal_global_360);
  v6 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v33 = v5;
  v34 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v7 = v5;
  v29 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (!v29)
    goto LABEL_25;
  v8 = *(_QWORD *)v40;
  v31 = v7;
  v28 = *(_QWORD *)v40;
  do
  {
    v9 = 0;
    do
    {
      if (*(_QWORD *)v40 != v8)
        objc_enumerationMutation(v7);
      v30 = v9;
      v10 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v9);
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      objc_msgSend(v10, "codings");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      if (!v12)
        goto LABEL_23;
      v13 = v12;
      v14 = 0;
      v15 = *(_QWORD *)v36;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v36 != v15)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(v17, "codingSystem");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v18, "isEqual:", observationCategoryWithObservationCategories_error__observationCategorySystem))
          {
            objc_msgSend(v17, "code");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v19)
              continue;
            objc_msgSend(v17, "code");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            HKDiagnosticTestResultCategoryFromNSString();
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18)
            {
              objc_msgSend(v6, "addObject:", v18);
              if (v14 > 0)
              {
                v24 = (void *)MEMORY[0x24BDD1540];
                objc_msgSend(v6, "allObjects");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "componentsJoinedByString:", CFSTR(", "));
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "hk_assignError:code:format:", v32, 3, CFSTR("More than 1 supported Observation category in same R4 coding: %@"), v26);

                v23 = 0;
                v22 = v34;
                goto LABEL_27;
              }
              v14 = 1;
            }
            else
            {
              objc_msgSend(v17, "code");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "addObject:", v21);

            }
          }

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        if (v13)
          continue;
        break;
      }
LABEL_23:

      v9 = v30 + 1;
      v7 = v31;
      v8 = v28;
    }
    while (v30 + 1 != v29);
    v29 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  }
  while (v29);
LABEL_25:

  v22 = v34;
  +[HDHealthRecordsExtractionUtilities preferredSupporedCategory:unsupportedCategories:error:](HDHealthRecordsExtractionUtilities, "preferredSupporedCategory:unsupportedCategories:error:", v6, v34, v32);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_27:

  v5 = v33;
LABEL_29:

  return v23;
}

void __89__HDHealthRecordsExtractionUtilities_observationCategoryWithObservationCategories_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD3CD8], "codeSystemWithIdentifier:", CFSTR("http://terminology.hl7.org/CodeSystem/observation-category"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)observationCategoryWithObservationCategories_error__observationCategorySystem;
  observationCategoryWithObservationCategories_error__observationCategorySystem = v0;

}

+ (id)preferredSupporedCategory:(id)a3 unsupportedCategories:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v8, "count") && !objc_msgSend(v7, "count"))
  {
    v12 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v8, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "componentsJoinedByString:", CFSTR(", "));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hk_assignError:code:format:", a5, 3, CFSTR("unsupported Observation categories: %@"), v14);

LABEL_11:
    v11 = 0;
    goto LABEL_12;
  }
  if ((unint64_t)objc_msgSend(v7, "count") < 2)
  {
    objc_msgSend(v7, "anyObject");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v9 = (void *)*MEMORY[0x24BDD2BA8];
  if (!objc_msgSend(v7, "containsObject:", *MEMORY[0x24BDD2BA8]))
  {
    v9 = (void *)*MEMORY[0x24BDD2BA0];
    if (!objc_msgSend(v7, "containsObject:", *MEMORY[0x24BDD2BA0]))
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a5, 3, CFSTR("No supported Observation categories found"));
      goto LABEL_11;
    }
  }
  v10 = v9;
LABEL_8:
  v11 = v10;
LABEL_12:

  return v11;
}

+ (id)referenceRangesWithObservationReferenceRanges:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_opt_class();
  HKSafeObject();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      while (2)
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(a1, "referenceRangeWithObservationReferenceRange:error:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13), a4, (_QWORD)v18);
          v14 = objc_claimAutoreleasedReturnValue();
          if (!v14)
          {

            v16 = 0;
            goto LABEL_12;
          }
          v15 = (void *)v14;
          objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v11)
          continue;
        break;
      }
    }

    v16 = v8;
LABEL_12:

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)referenceRangeWithObservationReferenceRange:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  objc_opt_class();
  HKSafeObject();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_4;
  if (!objc_msgSend(v6, "hk_hasValueForKeyPath:", CFSTR("low")))
  {
    v9 = 0;
LABEL_6:
    if (objc_msgSend(v6, "hk_hasValueForKeyPath:", CFSTR("high")))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("high"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "codedQuantityWithQuantity:error:", v11, a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        v10 = 0;
LABEL_24:

        goto LABEL_25;
      }
    }
    else
    {
      v12 = 0;
    }
    if (objc_msgSend(v6, "hk_hasValueForKeyPath:", CFSTR("meaning")))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("meaning"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "medicalCodingsWithCodeableConcept:error:", v13, a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        v10 = 0;
LABEL_23:

        goto LABEL_24;
      }
    }
    else
    {
      v14 = 0;
    }
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy_;
    v22 = __Block_byref_object_dispose_;
    v23 = 0;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __88__HDHealthRecordsExtractionUtilities_referenceRangeWithObservationReferenceRange_error___block_invoke;
    v17[3] = &unk_24ECF5460;
    v17[4] = &v18;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v17);
    if (v9 && v12)
    {
      objc_msgSend(MEMORY[0x24BDD3EB8], "referenceRangeWithIdentifier:minValue:maxValue:", v19[5], v9, v12);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else if (v9)
    {
      objc_msgSend(MEMORY[0x24BDD3EB8], "referenceRangeWithIdentifier:minValue:", v19[5], v9);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v12)
      {
        if ((objc_msgSend(v6, "hk_hasValueForKeyPath:", CFSTR("text")) & 1) == 0)
          objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a4, 3, CFSTR("Observation.ReferenceRange missing high, low and text"));
        v10 = 0;
        goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x24BDD3EB8], "referenceRangeWithIdentifier:maxValue:", v19[5], v12);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v15;
LABEL_22:
    _Block_object_dispose(&v18, 8);

    goto LABEL_23;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("low"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "codedQuantityWithQuantity:error:", v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    goto LABEL_6;
LABEL_4:
  v10 = 0;
LABEL_25:

  return v10;
}

void __88__HDHealthRecordsExtractionUtilities_referenceRangeWithObservationReferenceRange_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "codingSystem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3CD8], "textSystem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v8)
  {
    objc_msgSend(v12, "displayString");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    *a4 = 1;
  }

}

+ (id)medicalCodingWithObservationStatus:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_opt_class();
  HKSafeObject();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDD3CC8];
    objc_msgSend(MEMORY[0x24BDD3CD8], "FHIRObservationStatus");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "medicalCodingWithSystem:codingVersion:code:displayString:", v7, *MEMORY[0x24BDD3098], v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (id)medicalCodingWithMedicationStatementStatusCode:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_opt_class();
  HKSafeObject();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDD3CC8];
    objc_msgSend(MEMORY[0x24BDD3CD8], "FHIRMedicationStatementStatus");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "medicalCodingWithSystem:codingVersion:code:displayString:", v7, *MEMORY[0x24BDD3098], v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (id)BOOLeanNotDoneFromStatusCode:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_opt_class();
  HKSafeObject();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "lowercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithBool:", objc_msgSend(v7, "isEqualToString:", CFSTR("not-done")));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (id)BOOLeanNotTakenFromStatusCode:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_opt_class();
  HKSafeObject();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "lowercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithBool:", objc_msgSend(v7, "isEqualToString:", CFSTR("not-taken")));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (id)medicalCodingsWithReference:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  objc_opt_class();
  HKSafeObject();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if ((objc_msgSend(v5, "hk_hasValueForKeyPath:", CFSTR("display")) & 1) == 0)
    {
      v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      goto LABEL_6;
    }
    objc_msgSend(v5, "hk_safeStringForKeyPath:error:", CFSTR("display"), a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v8 = (void *)MEMORY[0x24BDD3CC8];
      objc_msgSend(MEMORY[0x24BDD3CD8], "textSystem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "medicalCodingWithSystem:codingVersion:code:displayString:", v9, *MEMORY[0x24BDD30B8], v6, v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v10);

LABEL_6:
      v6 = (void *)objc_msgSend(v7, "copy");

    }
  }

  return v6;
}

+ (id)resourceReferencedBy:(id)a3 containedIn:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  HKSafeObject();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    +[HDFHIRReferenceProcessor resourceReferenceInReference:error:](HDFHIRReferenceProcessor, "resourceReferenceInReference:error:", v7, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      +[HDFHIRReferenceProcessor resourceContainedInResource:reference:error:](HDFHIRReferenceProcessor, "resourceContainedInResource:reference:error:", v8, v10, a5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)inspectableValueWithObservationValues:(id)a3 FHIRVersion:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;

  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (objc_msgSend(v8, "hk_hasValueForKeyPath:", CFSTR("valueQuantity")))
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("valueQuantity"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "codedQuantityWithQuantity:error:", v11, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      goto LABEL_51;
    objc_msgSend(MEMORY[0x24BDD3C78], "inspectableValueWithCodedQuantity:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v13);

  }
  if (objc_msgSend(v8, "hk_hasValueForKeyPath:", CFSTR("valueCodeableConcept")))
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("valueCodeableConcept"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "medicalCodingsWithCodeableConcept:error:", v14, a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      goto LABEL_51;
    objc_msgSend(MEMORY[0x24BDD3C78], "inspectableValueWithMedicalCodings:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v16);

  }
  if (objc_msgSend(v8, "hk_hasValueForKeyPath:", CFSTR("valueString")))
  {
    objc_msgSend(v8, "hk_safeStringForKeyPath:error:", CFSTR("valueString"), a5);
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
      goto LABEL_51;
    v18 = (void *)v17;
    objc_msgSend(MEMORY[0x24BDD3C78], "inspectableValueWithString:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v19);

  }
  if (objc_msgSend(v8, "hk_hasValueForKeyPath:", CFSTR("valueBoolean"))
    && (objc_msgSend(v9, "FHIRRelease"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v21 = (void *)*MEMORY[0x24BDD2C00],
        v20,
        v20 == v21))
  {
    objc_msgSend(v8, "hk_safeNumberForKeyPath:error:", CFSTR("valueBoolean"), a5);
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
      goto LABEL_51;
    v23 = (void *)v22;
    objc_msgSend(MEMORY[0x24BDD3C78], "inspectableValueWithBoolean:", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v24);

  }
  else if (!objc_msgSend(v8, "hk_expectMissingKeyPath:error:", CFSTR("valueBoolean"), a5))
  {
    goto LABEL_51;
  }
  if (objc_msgSend(v8, "hk_hasValueForKeyPath:", CFSTR("valueInteger"))
    && (objc_msgSend(v9, "FHIRRelease"),
        v25 = (void *)objc_claimAutoreleasedReturnValue(),
        v26 = (void *)*MEMORY[0x24BDD2C00],
        v25,
        v25 == v26))
  {
    objc_msgSend(v8, "hk_safeNumberForKeyPath:error:", CFSTR("valueInteger"), a5);
    v27 = objc_claimAutoreleasedReturnValue();
    if (!v27)
      goto LABEL_51;
    v28 = (void *)v27;
    objc_msgSend(MEMORY[0x24BDD3C78], "inspectableValueWithInteger:", v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v29);

  }
  else if (!objc_msgSend(v8, "hk_expectMissingKeyPath:error:", CFSTR("valueInteger"), a5))
  {
    goto LABEL_51;
  }
  if (!objc_msgSend(v8, "hk_expectMissingKeyPath:error:", CFSTR("valueRange"), a5))
    goto LABEL_51;
  if (objc_msgSend(v8, "hk_hasValueForKeyPath:", CFSTR("valueRatio")))
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("valueRatio"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "ratioValueWithRatio:error:", v30, a5);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v31)
      goto LABEL_51;
    objc_msgSend(MEMORY[0x24BDD3C78], "inspectableValueWithRatio:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v32);

  }
  if (!objc_msgSend(v8, "hk_expectMissingKeyPath:error:", CFSTR("valueSampledData"), a5))
    goto LABEL_51;
  if (objc_msgSend(v8, "hk_hasValueForKeyPath:", CFSTR("valueAttachment"))
    && (objc_msgSend(v9, "FHIRRelease"),
        v33 = (void *)objc_claimAutoreleasedReturnValue(),
        v34 = (void *)*MEMORY[0x24BDD2BF0],
        v33,
        v33 == v34))
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("valueAttachment"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "stringWithAttachment:error:", v35, a5);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v36)
      goto LABEL_51;
    objc_msgSend(MEMORY[0x24BDD3C78], "inspectableValueWithString:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v37);

  }
  else if (!objc_msgSend(v8, "hk_expectMissingKeyPath:error:", CFSTR("valueAttachment"), a5))
  {
    goto LABEL_51;
  }
  if (objc_msgSend(v8, "hk_hasValueForKeyPath:", CFSTR("valueTime")))
  {
    objc_msgSend(v8, "hk_safeStringForKeyPath:error:", CFSTR("valueTime"), a5);
    v38 = objc_claimAutoreleasedReturnValue();
    if (!v38)
      goto LABEL_51;
    v39 = (void *)v38;
    objc_msgSend(a1, "timeSinceMidnightWithTimeString:error:", v38, a5);
    v40 = objc_claimAutoreleasedReturnValue();
    if (!v40)
      goto LABEL_50;
    v41 = (void *)v40;
    objc_msgSend(MEMORY[0x24BDD3C78], "inspectableValueWithDateComponents:", v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v42);

  }
  if (objc_msgSend(v8, "hk_hasValueForKeyPath:", CFSTR("valueDateTime")))
  {
    objc_msgSend(v8, "hk_safeStringForKeyPath:error:", CFSTR("valueDateTime"), a5);
    v43 = objc_claimAutoreleasedReturnValue();
    if (!v43)
      goto LABEL_51;
    v39 = (void *)v43;
    objc_msgSend(a1, "medicalDateWithDateTimeString:error:", v43, a5);
    v44 = objc_claimAutoreleasedReturnValue();
    if (!v44)
      goto LABEL_50;
    v45 = (void *)v44;
    objc_msgSend(MEMORY[0x24BDD3C78], "inspectableValueWithMedicalDate:", v44);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v46);

  }
  if (objc_msgSend(v8, "hk_hasValueForKeyPath:", CFSTR("valuePeriod")))
  {
    objc_msgSend(v8, "hk_safeDictionaryForKeyPath:error:", CFSTR("valuePeriod"), a5);
    v47 = objc_claimAutoreleasedReturnValue();
    if (!v47)
      goto LABEL_51;
    v39 = (void *)v47;
    objc_msgSend(a1, "medicalDateIntervalWithPeriod:error:", v47, a5);
    v48 = objc_claimAutoreleasedReturnValue();
    if (v48)
    {
      v49 = (void *)v48;
      objc_msgSend(MEMORY[0x24BDD3C78], "inspectableValueWithMedicalDateInterval:", v48);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v50);

      goto LABEL_45;
    }
LABEL_50:

    goto LABEL_51;
  }
LABEL_45:
  if (objc_msgSend(v8, "hk_hasValueForKeyPath:", CFSTR("dataAbsentReason")))
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("dataAbsentReason"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "medicalCodingsWithCodeableConcept:error:", v51, a5);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v52)
      goto LABEL_51;
    objc_msgSend(MEMORY[0x24BDD3C78], "inspectableValueWithDataAbsentReasonCodings:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v53);

  }
  if ((unint64_t)objc_msgSend(v10, "count") < 2)
  {
    objc_msgSend(v10, "firstObject");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_52;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a5, 3, CFSTR("Encountered values of more than one type"));
LABEL_51:
  v54 = 0;
LABEL_52:

  return v54;
}

+ (id)inspectableValueWithAbatementValue:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;

  v6 = a3;
  objc_opt_class();
  HKSafeObject();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v28 = 0;
    goto LABEL_29;
  }
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (objc_msgSend(v6, "hk_hasValueForKeyPath:", CFSTR("abatementAge")))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("abatementAge"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "codedQuantityWithQuantity:error:", v9, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_26;
    objc_msgSend(MEMORY[0x24BDD3C78], "inspectableValueWithCodedQuantity:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v11);

  }
  if (objc_msgSend(v6, "hk_hasValueForKeyPath:", CFSTR("abatementQuantity")))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("abatementQuantity"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "codedQuantityWithQuantity:error:", v12, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      goto LABEL_26;
    objc_msgSend(MEMORY[0x24BDD3C78], "inspectableValueWithCodedQuantity:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v14);

  }
  if (objc_msgSend(v6, "hk_hasValueForKeyPath:", CFSTR("abatementDateTime")))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("abatementDateTime"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "medicalDateWithDateTimeString:error:", v15, a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
      goto LABEL_26;
    objc_msgSend(MEMORY[0x24BDD3C78], "inspectableValueWithMedicalDate:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v17);

  }
  if (objc_msgSend(v6, "hk_hasValueForKeyPath:", CFSTR("abatementBoolean")))
  {
    objc_msgSend(v6, "hk_safeNumberForKeyPath:error:", CFSTR("abatementBoolean"), a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
      goto LABEL_26;
    v19 = v18;
    if (objc_msgSend(v18, "BOOLValue"))
      v20 = CFSTR("YES");
    else
      v20 = CFSTR("NO");
    objc_msgSend(MEMORY[0x24BDD3C78], "inspectableValueWithString:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v21);

  }
  if (objc_msgSend(v6, "hk_hasValueForKeyPath:", CFSTR("abatementPeriod")))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("abatementPeriod"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "medicalDateIntervalWithPeriod:error:", v22, a4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
      goto LABEL_26;
    objc_msgSend(MEMORY[0x24BDD3C78], "inspectableValueWithMedicalDateInterval:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v24);

  }
  if (objc_msgSend(v6, "hk_hasValueForKeyPath:", CFSTR("abatementString")))
  {
    objc_msgSend(v6, "hk_safeStringForKeyPath:error:", CFSTR("abatementString"), a4);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!v25)
      goto LABEL_26;
    v26 = (void *)v25;
    objc_msgSend(MEMORY[0x24BDD3C78], "inspectableValueWithString:", v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v27);

  }
  if (objc_msgSend(v6, "hk_expectMissingKeyPath:error:", CFSTR("abatementRange"), a4))
  {
    if ((unint64_t)objc_msgSend(v8, "count") < 2)
    {
      objc_msgSend(v8, "firstObject");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a4, 3, CFSTR("Encountered values of more than one type"));
  }
LABEL_26:
  v28 = 0;
LABEL_27:

LABEL_29:
  return v28;
}

+ (id)medicalCodingWithConditionClinicalStatusCode:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x24BDD3CD8];
  v7 = a3;
  objc_msgSend(v6, "FHIRConditionClinicalStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_FHIRMedicalCodingWithCode:medicalCodingSystem:codingVersion:error:", v7, v8, *MEMORY[0x24BDD3098], a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)medicalCodingWithConditionVerificationStatusCode:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x24BDD3CD8];
  v7 = a3;
  objc_msgSend(v6, "FHIRConditionVerificationStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_FHIRMedicalCodingWithCode:medicalCodingSystem:codingVersion:error:", v7, v8, *MEMORY[0x24BDD3098], a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)inspectableValueWithOnsetValue:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;

  v6 = a3;
  objc_opt_class();
  HKSafeObject();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v21 = 0;
    goto LABEL_20;
  }
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (objc_msgSend(v6, "hk_hasValueForKeyPath:", CFSTR("onsetQuantity")))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("onsetQuantity"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "codedQuantityWithQuantity:error:", v9, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_17;
    objc_msgSend(MEMORY[0x24BDD3C78], "inspectableValueWithCodedQuantity:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v11);

  }
  if (objc_msgSend(v6, "hk_hasValueForKeyPath:", CFSTR("onsetDateTime")))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("onsetDateTime"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "medicalDateWithDateTimeString:error:", v12, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      goto LABEL_17;
    objc_msgSend(MEMORY[0x24BDD3C78], "inspectableValueWithMedicalDate:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v14);

  }
  if (objc_msgSend(v6, "hk_hasValueForKeyPath:", CFSTR("onsetPeriod")))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("onsetPeriod"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "medicalDateIntervalWithPeriod:error:", v15, a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
      goto LABEL_17;
    objc_msgSend(MEMORY[0x24BDD3C78], "inspectableValueWithMedicalDateInterval:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v17);

  }
  if (objc_msgSend(v6, "hk_hasValueForKeyPath:", CFSTR("onsetString")))
  {
    objc_msgSend(v6, "hk_safeStringForKeyPath:error:", CFSTR("onsetString"), a4);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
      goto LABEL_17;
    v19 = (void *)v18;
    objc_msgSend(MEMORY[0x24BDD3C78], "inspectableValueWithString:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v20);

  }
  if (objc_msgSend(v6, "hk_expectMissingKeyPath:error:", CFSTR("onsetRange"), a4))
  {
    if ((unint64_t)objc_msgSend(v8, "count") < 2)
    {
      objc_msgSend(v8, "firstObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a4, 3, CFSTR("Encountered values of more than one type"));
  }
LABEL_17:
  v21 = 0;
LABEL_18:

LABEL_20:
  return v21;
}

+ (id)conditionClinicalStatusCodingWithCodeableConcept:(id)a3 error:(id *)a4
{
  uint64_t v6;
  id v7;
  void *v8;

  v6 = conditionClinicalStatusCodingWithCodeableConcept_error__onceToken;
  v7 = a3;
  if (v6 != -1)
    dispatch_once(&conditionClinicalStatusCodingWithCodeableConcept_error__onceToken, &__block_literal_global_402);
  objc_msgSend(a1, "_firstCodingForSystem:inCodeableConcept:error:", conditionClinicalStatusCodingWithCodeableConcept_error__conditionClinicalStatusCoding, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __93__HDHealthRecordsExtractionUtilities_conditionClinicalStatusCodingWithCodeableConcept_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD3CD8], "codeSystemWithIdentifier:", CFSTR("http://terminology.hl7.org/CodeSystem/condition-clinical"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)conditionClinicalStatusCodingWithCodeableConcept_error__conditionClinicalStatusCoding;
  conditionClinicalStatusCodingWithCodeableConcept_error__conditionClinicalStatusCoding = v0;

}

+ (id)conditionVerificationStatusCodingWithCodeableConcept:(id)a3 error:(id *)a4
{
  uint64_t v6;
  id v7;
  void *v8;

  v6 = conditionVerificationStatusCodingWithCodeableConcept_error__onceToken;
  v7 = a3;
  if (v6 != -1)
    dispatch_once(&conditionVerificationStatusCodingWithCodeableConcept_error__onceToken, &__block_literal_global_405);
  objc_msgSend(a1, "_firstCodingForSystem:inCodeableConcept:error:", conditionVerificationStatusCodingWithCodeableConcept_error__conditionVerificationStatusCoding, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __97__HDHealthRecordsExtractionUtilities_conditionVerificationStatusCodingWithCodeableConcept_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD3CD8], "codeSystemWithIdentifier:", CFSTR("http://terminology.hl7.org/CodeSystem/condition-ver-status"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)conditionVerificationStatusCodingWithCodeableConcept_error__conditionVerificationStatusCoding;
  conditionVerificationStatusCodingWithCodeableConcept_error__conditionVerificationStatusCoding = v0;

}

+ (id)enteredInErrorWithConditionVerificationStatusCodeableConcept:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a1, "conditionVerificationStatusCodingWithCodeableConcept:error:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v5, "code");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "numberWithBool:", objc_msgSend(a1, "_determineEnteredInError:", v8));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)medicalCodingWithCoverageStatusCode:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x24BDD3CD8];
  v7 = a3;
  objc_msgSend(v6, "FHIRCoverageStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_FHIRMedicalCodingWithCode:medicalCodingSystem:codingVersion:error:", v7, v8, *MEMORY[0x24BDD30A0], a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)coverageClassificationWithClassElements:(id)a3 error:(id *)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __84__HDHealthRecordsExtractionUtilities_coverageClassificationWithClassElements_error___block_invoke;
  v5[3] = &__block_descriptor_40_e26__24__0__NSDictionary_8__16l;
  v5[4] = a1;
  objc_msgSend(a1, "_transformArray:error:transformBlock:", a3, a4, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __84__HDHealthRecordsExtractionUtilities_coverageClassificationWithClassElements_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a2;
  objc_opt_class();
  HKSafeObject();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "medicalCodingsWithCodeableConcept:error:", v8, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (objc_msgSend(v5, "hk_hasValueForKeyPath:", CFSTR("value")))
      {
        objc_msgSend(v5, "hk_safeStringForKeyPath:error:", CFSTR("value"), a3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }
      if (objc_msgSend(v5, "hk_hasValueForKeyPath:", CFSTR("name")))
      {
        objc_msgSend(v5, "hk_safeStringForKeyPath:error:", CFSTR("name"), a3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }
      objc_msgSend(MEMORY[0x24BDD3AB8], "coverageClassificationWithTypeCodings:value:name:", v9, v10, v12);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)medicalCodingWithDeviceStatusCode:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x24BDD3CD8];
  v7 = a3;
  objc_msgSend(v6, "FHIRDeviceStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_FHIRMedicalCodingWithCode:medicalCodingSystem:codingVersion:error:", v7, v8, *MEMORY[0x24BDD30A0], a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)medicalCodingWithCarePlanStatusCode:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x24BDD3CD8];
  v7 = a3;
  objc_msgSend(v6, "FHIRCarePlanStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_FHIRMedicalCodingWithCode:medicalCodingSystem:codingVersion:error:", v7, v8, *MEMORY[0x24BDD3098], a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)medicalCodingWithGoalStatusCode:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x24BDD3CD8];
  v7 = a3;
  objc_msgSend(v6, "FHIRGoalStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_FHIRMedicalCodingWithCode:medicalCodingSystem:codingVersion:error:", v7, v8, *MEMORY[0x24BDD3098], a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)medicalCodingWithDiagnosticReportStatusCode:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x24BDD3CD8];
  v7 = a3;
  objc_msgSend(v6, "FHIRDiagnosticReportStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_FHIRMedicalCodingWithCode:medicalCodingSystem:codingVersion:error:", v7, v8, *MEMORY[0x24BDD3098], a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)medicalCodingWithEventStatusCode:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x24BDD3CD8];
  v7 = a3;
  objc_msgSend(v6, "FHIREventStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_FHIRMedicalCodingWithCode:medicalCodingSystem:codingVersion:error:", v7, v8, *MEMORY[0x24BDD30A0], a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)medicalCodingWithImmunizationStatusCode:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x24BDD3CD8];
  v7 = a3;
  objc_msgSend(v6, "FHIRImmunizationStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_FHIRMedicalCodingWithCode:medicalCodingSystem:codingVersion:error:", v7, v8, *MEMORY[0x24BDD30A0], a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)medicalCodingWithMedicationAdminStatusCode:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x24BDD3CD8];
  v7 = a3;
  objc_msgSend(v6, "FHIRMedicationAdminStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_FHIRMedicalCodingWithCode:medicalCodingSystem:codingVersion:error:", v7, v8, *MEMORY[0x24BDD3098], a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)medicalCodingWithMedicationDispenseStatusCode:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x24BDD3CD8];
  v7 = a3;
  objc_msgSend(v6, "FHIRMedicationDispenseStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_FHIRMedicalCodingWithCode:medicalCodingSystem:codingVersion:error:", v7, v8, *MEMORY[0x24BDD3098], a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)medicalCodingWithR4MedicationDispenseStatusCode:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x24BDD3CD8];
  v7 = a3;
  objc_msgSend(v6, "FHIRMedicationDispenseStatusR4");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_FHIRMedicalCodingWithCode:medicalCodingSystem:codingVersion:error:", v7, v8, *MEMORY[0x24BDD30A0], a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)medicalCodingWithMedicationOrderStatusCode:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x24BDD3CD8];
  v7 = a3;
  objc_msgSend(v6, "FHIRMedicationOrderStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_FHIRMedicalCodingWithCode:medicalCodingSystem:codingVersion:error:", v7, v8, *MEMORY[0x24BDD3098], a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)medicalCodingWithR4MedicationRequestStatusCode:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x24BDD3CD8];
  v7 = a3;
  objc_msgSend(v6, "FHIRMedicationRequestStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_FHIRMedicalCodingWithCode:medicalCodingSystem:codingVersion:error:", v7, v8, *MEMORY[0x24BDD30A0], a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)medicalCodingWithProcedureStatusCode:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x24BDD3CD8];
  v7 = a3;
  objc_msgSend(v6, "FHIRProcedureStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_FHIRMedicalCodingWithCode:medicalCodingSystem:codingVersion:error:", v7, v8, *MEMORY[0x24BDD3098], a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)medicalCodingWithAllergyIntoleranceStatusCode:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x24BDD3CD8];
  v7 = a3;
  objc_msgSend(v6, "FHIRAllergyIntoleranceStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_FHIRMedicalCodingWithCode:medicalCodingSystem:codingVersion:error:", v7, v8, *MEMORY[0x24BDD3098], a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)medicalCodingWithAllergyIntoleranceCategoryCode:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x24BDD3CD8];
  v7 = a3;
  objc_msgSend(v6, "FHIRAllergyIntoleranceCategory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_FHIRMedicalCodingWithCode:medicalCodingSystem:codingVersion:error:", v7, v8, *MEMORY[0x24BDD3098], a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)medicalCodingWithAllergyIntoleranceCriticalityCode:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x24BDD3CD8];
  v7 = a3;
  objc_msgSend(v6, "FHIRAllergyIntoleranceCriticality");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_FHIRMedicalCodingWithCode:medicalCodingSystem:codingVersion:error:", v7, v8, *MEMORY[0x24BDD3098], a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)medicalCodingWithAllergyIntoleranceSeverityCode:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x24BDD3CD8];
  v7 = a3;
  objc_msgSend(v6, "FHIRAllergyIntoleranceSeverity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_FHIRMedicalCodingWithCode:medicalCodingSystem:codingVersion:error:", v7, v8, *MEMORY[0x24BDD3098], a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)medicalCodingWithAllergyIntoleranceTypeCode:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x24BDD3CD8];
  v7 = a3;
  objc_msgSend(v6, "FHIRAllergyIntoleranceType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_FHIRMedicalCodingWithCode:medicalCodingSystem:codingVersion:error:", v7, v8, *MEMORY[0x24BDD3098], a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)medicalCodingWithR4AllergyIntoleranceCriticalityCode:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x24BDD3CD8];
  v7 = a3;
  objc_msgSend(v6, "FHIRAllergyIntoleranceCriticality");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_FHIRMedicalCodingWithCode:medicalCodingSystem:codingVersion:error:", v7, v8, *MEMORY[0x24BDD30A0], a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)allergyIntoleranceClinicalStatusCodingWithCodeableConcept:(id)a3 error:(id *)a4
{
  uint64_t v6;
  id v7;
  void *v8;

  v6 = allergyIntoleranceClinicalStatusCodingWithCodeableConcept_error__onceToken;
  v7 = a3;
  if (v6 != -1)
    dispatch_once(&allergyIntoleranceClinicalStatusCodingWithCodeableConcept_error__onceToken, &__block_literal_global_413);
  objc_msgSend(a1, "_firstCodingForSystem:inCodeableConcept:error:", allergyIntoleranceClinicalStatusCodingWithCodeableConcept_error__codingSystem, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __102__HDHealthRecordsExtractionUtilities_allergyIntoleranceClinicalStatusCodingWithCodeableConcept_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD3CD8], "codeSystemWithIdentifier:", CFSTR("http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)allergyIntoleranceClinicalStatusCodingWithCodeableConcept_error__codingSystem;
  allergyIntoleranceClinicalStatusCodingWithCodeableConcept_error__codingSystem = v0;

}

+ (id)allergyIntoleranceVerificationStatusCodingWithCodeableConcept:(id)a3 error:(id *)a4
{
  uint64_t v6;
  id v7;
  void *v8;

  v6 = allergyIntoleranceVerificationStatusCodingWithCodeableConcept_error__onceToken;
  v7 = a3;
  if (v6 != -1)
    dispatch_once(&allergyIntoleranceVerificationStatusCodingWithCodeableConcept_error__onceToken, &__block_literal_global_416);
  objc_msgSend(a1, "_firstCodingForSystem:inCodeableConcept:error:", allergyIntoleranceVerificationStatusCodingWithCodeableConcept_error__codingSystem, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __106__HDHealthRecordsExtractionUtilities_allergyIntoleranceVerificationStatusCodingWithCodeableConcept_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD3CD8], "codeSystemWithIdentifier:", CFSTR("http://terminology.hl7.org/CodeSystem/allergyintolerance-verification"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)allergyIntoleranceVerificationStatusCodingWithCodeableConcept_error__codingSystem;
  allergyIntoleranceVerificationStatusCodingWithCodeableConcept_error__codingSystem = v0;

}

+ (id)enteredInErrorWithAllergyIntoleranceVerificationStatusCodeableConcept:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a1, "allergyIntoleranceVerificationStatusCodingWithCodeableConcept:error:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v5, "code");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "numberWithBool:", objc_msgSend(a1, "_determineEnteredInError:", v8));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)allergyReactionsWithAllergyIntoleranceReaction:(id)a3 error:(id *)a4
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __91__HDHealthRecordsExtractionUtilities_allergyReactionsWithAllergyIntoleranceReaction_error___block_invoke;
  v5[3] = &__block_descriptor_40_e26__24__0__NSDictionary_8__16l;
  v5[4] = a1;
  objc_msgSend(a1, "_transformArray:error:transformBlock:", a3, a4, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __91__HDHealthRecordsExtractionUtilities_allergyReactionsWithAllergyIntoleranceReaction_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a2;
  objc_opt_class();
  HKSafeObject();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("manifestation"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "medicalCodingsWithCodeableConcepts:error:", v8, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
LABEL_5:
      v13 = 0;
LABEL_14:

      goto LABEL_15;
    }
    if (objc_msgSend(v5, "hk_hasValueForKeyPath:", CFSTR("onset")))
    {
      v10 = *(void **)(a1 + 32);
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("onset"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "medicalDateWithDateTimeString:error:", v11, a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
        goto LABEL_5;
    }
    else
    {
      v12 = 0;
    }
    if (objc_msgSend(v5, "hk_hasValueForKeyPath:", CFSTR("severity")))
    {
      v14 = *(void **)(a1 + 32);
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("severity"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "medicalCodingWithAllergyIntoleranceSeverityCode:error:", v15, a3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        v13 = 0;
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {
      v16 = 0;
    }
    objc_msgSend(MEMORY[0x24BDD38F8], "allergyReactionWithManifestationCodings:onsetDate:severityCoding:", v9, v12, v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }
  v13 = 0;
LABEL_15:

  return v13;
}

+ (id)identifierWithReference:(id)a3 parentResource:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v7 = a4;
  +[HDFHIRReferenceProcessor resourceReferenceInReference:error:](HDFHIRReferenceProcessor, "resourceReferenceInReference:error:", a3, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (!+[HDFHIRReferenceProcessor referenceRequiresContaining:](HDFHIRReferenceProcessor, "referenceRequiresContaining:", v8))
    {
      if (!+[HDFHIRReferenceProcessor referenceIsAbsolute:](HDFHIRReferenceProcessor, "referenceIsAbsolute:", v8))
      {
        objc_msgSend(MEMORY[0x24BDD3B88], "FHIRIdentifierWithString:error:", v8, a5);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[HDFHIRReferenceProcessor identifierFromAbsoluteReferenceURL:](HDFHIRReferenceProcessor, "identifierFromAbsoluteReferenceURL:", v10);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    +[HDFHIRReferenceProcessor resourceContainedInResource:reference:error:](HDFHIRReferenceProcessor, "resourceContainedInResource:reference:error:", v7, v8, a5);
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      +[HDFHIRReferenceProcessor identifierForResource:containedInResource:error:](HDFHIRReferenceProcessor, "identifierForResource:containedInResource:error:", v9, v7, a5);
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v12 = (void *)v11;

      goto LABEL_10;
    }
  }
  v12 = 0;
LABEL_10:

  return v12;
}

+ (id)identifiersWithReferences:(id)a3 parentResource:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_opt_class();
  HKSafeObject();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      while (2)
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(a1, "identifierWithReference:parentResource:error:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v16), v9, a5, (_QWORD)v21);
          v17 = objc_claimAutoreleasedReturnValue();
          if (!v17)
          {

            v19 = 0;
            goto LABEL_12;
          }
          v18 = (void *)v17;
          objc_msgSend(v11, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v14)
          continue;
        break;
      }
    }

    v19 = (void *)objc_msgSend(v11, "copy");
LABEL_12:

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (id)identifierFromReference:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  objc_opt_class();
  HKSafeObject();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "hk_safeDictionaryIfExistsForKeyPath:error:", CFSTR("identifier"), a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "hk_safeDictionaryIfExistsForKeyPath:error:", CFSTR("type"), a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(a1, "medicalCodingsWithCodeableConcept:error:", v10, a4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "hk_safeStringIfExistsForKeyPath:error:", CFSTR("value"), a4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD3B90], "identifierWithTypeCodings:value:", v11, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)codedValueWithObservationComponent:(id)a3 FHIRVersion:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a3;
  v9 = a4;
  objc_opt_class();
  HKSafeObject();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("code"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "medicalCodingsWithCodeableConcept:error:", v11, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      if (objc_msgSend(v8, "hk_hasValueForKeyPath:", CFSTR("referenceRange")))
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("referenceRange"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "referenceRangesWithObservationReferenceRanges:error:", v13, a5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
          goto LABEL_5;
      }
      else
      {
        v14 = 0;
      }
      objc_msgSend(a1, "inspectableValueWithObservationValues:FHIRVersion:error:", v8, v9, a5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        objc_msgSend(MEMORY[0x24BDD3A18], "codedValueWithCodings:value:referenceRanges:", v12, v16, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = 0;
      }

      goto LABEL_12;
    }
LABEL_5:
    v15 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v15 = 0;
LABEL_13:

  return v15;
}

+ (id)inspectableValueCollectionWithQuantity:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "codedQuantityWithQuantity:error:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD3C80];
    objc_msgSend(MEMORY[0x24BDD3C78], "inspectableValueWithCodedQuantity:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inspectableValueCollectionSingleWithValue:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)inspectableValueCollectionWithRatio:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "ratioValueWithRatio:error:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD3C80];
    objc_msgSend(MEMORY[0x24BDD3C78], "inspectableValueWithRatio:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inspectableValueCollectionSingleWithValue:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)inspectableValueCollectionWithString:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_opt_class();
  HKSafeObject();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDD3C80];
    objc_msgSend(MEMORY[0x24BDD3C78], "inspectableValueWithString:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "inspectableValueCollectionSingleWithValue:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (id)inspectableValueCollectionWithCodeableConcept:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "medicalCodingsWithCodeableConcept:error:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD3C80];
    objc_msgSend(MEMORY[0x24BDD3C78], "inspectableValueWithMedicalCodings:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inspectableValueCollectionSingleWithValue:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)inspectableValueCollectionWithObservationComponents:(id)a3 FHIRVersion:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_opt_class();
  HKSafeObject();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      while (2)
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(a1, "codedValueWithObservationComponent:FHIRVersion:error:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v16), v9, a5, (_QWORD)v23);
          v17 = objc_claimAutoreleasedReturnValue();
          if (!v17)
          {
            v21 = 0;
            goto LABEL_12;
          }
          v18 = (void *)v17;
          objc_msgSend(v11, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v14)
          continue;
        break;
      }
    }

    objc_msgSend(MEMORY[0x24BDD3A20], "codedValueCollectionWithCodedValues:", v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x24BDD3C80];
    objc_msgSend(MEMORY[0x24BDD3C78], "inspectableValueWithCodedValueCollection:", v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "inspectableValueCollectionSingleWithValue:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

+ (id)inspectableValueCollectionWithObservationValues:(id)a3 FHIRVersion:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v22 = 0;
  objc_msgSend(a1, "inspectableValueWithObservationValues:FHIRVersion:error:", v8, v9, &v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v22;
  v12 = v11;
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDD3C80], "inspectableValueCollectionSingleWithValue:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  if (!v11)
  {
    v13 = 0;
LABEL_3:
    if (!objc_msgSend(v8, "hk_hasValueForKeyPath:", CFSTR("component")))
    {
      v17 = v13;
      if (!v17)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a5, 3, CFSTR("No Observation value provided"));
        goto LABEL_24;
      }
      v18 = 0;
LABEL_10:

LABEL_24:
      goto LABEL_25;
    }
    v21 = v12;
    objc_msgSend(v8, "hk_safeArrayForKeyPath:error:", CFSTR("component"), &v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v21;

    if (v14)
    {
      v20 = v15;
      objc_msgSend(a1, "inspectableValueCollectionWithObservationComponents:FHIRVersion:error:", v14, v9, &v20);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v20;

      if (v16)
      {

        if (v13)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a5, 3, CFSTR("Encountered values of more than one type"));

LABEL_23:
          v17 = 0;
          goto LABEL_24;
        }
        v17 = v16;
        v18 = v17;
        goto LABEL_10;
      }
      v12 = v12;
      if (v12)
      {
        if (!a5)
          goto LABEL_21;
LABEL_16:
        v12 = objc_retainAutorelease(v12);
        *a5 = v12;
      }
    }
    else
    {
      v12 = v15;
      if (v12)
      {
        if (!a5)
        {
LABEL_21:
          _HKLogDroppedError();
          goto LABEL_22;
        }
        goto LABEL_16;
      }
    }
LABEL_22:

    goto LABEL_23;
  }
  if (a5)
  {
    v12 = objc_retainAutorelease(v11);
    v17 = 0;
    *a5 = v12;
  }
  else
  {
    _HKLogDroppedError();
    v17 = 0;
  }
LABEL_25:

  return v17;
}

+ (id)inspectableValueCollectionWithDateTime:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "medicalDateWithDateTimeString:error:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD3C78], "inspectableValueWithMedicalDate:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD3C80], "inspectableValueCollectionSingleWithValue:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)inspectableValueCollectionWithTime:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "timeSinceMidnightWithTimeString:error:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD3C78], "inspectableValueWithDateComponents:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD3C80], "inspectableValueCollectionSingleWithValue:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)inspectableValueCollectionWithPeriod:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "medicalDateIntervalWithPeriod:error:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD3C78], "inspectableValueWithMedicalDateInterval:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD3C80], "inspectableValueCollectionSingleWithValue:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (int64_t)_integerFromTextCheckingResult:(id)a3 string:(id)a4 index:(int64_t)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int64_t v11;

  v7 = a4;
  v8 = objc_msgSend(a3, "rangeAtIndex:", a5);
  objc_msgSend(v7, "substringWithRange:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "integerValue");
  return v11;
}

+ (id)_medicalDateWithDateTimeString:(id)a3 range:(_NSRange)a4 error:(id *)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id *v22;
  void *v23;
  uint64_t v25;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  _DateTimeFormatRegularExpressionYearMonthDayTime();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "matchesInString:options:range:", v9, 0, location, length);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  if (objc_msgSend(v11, "count") == 1)
  {
    objc_msgSend(v11, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(a1, "_integerFromTextCheckingResult:string:index:", v13, v9, 1);
    v14 = objc_msgSend(a1, "_integerFromTextCheckingResult:string:index:", v13, v9, 2);
    v15 = objc_msgSend(a1, "_integerFromTextCheckingResult:string:index:", v13, v9, 3);
    v16 = objc_msgSend(a1, "_integerFromTextCheckingResult:string:index:", v13, v9, 4);
    v17 = objc_msgSend(a1, "_integerFromTextCheckingResult:string:index:", v13, v9, 5);
    v18 = objc_msgSend(a1, "_integerFromTextCheckingResult:string:index:", v13, v9, 6);
    v19 = objc_msgSend(v13, "rangeAtIndex:", 7);
    objc_msgSend(v9, "substringWithRange:", v19, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = a5;
    v23 = (void *)v21;
    objc_msgSend(MEMORY[0x24BDD3CE0], "medicalDateWithYear:month:day:hour:minute:second:originalTimeZoneString:error:", v25, v14, v15, v16, v17, v18, v21, v22);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

+ (id)_medicalDateWithOnlyDateString:(id)a3 range:(_NSRange)a4 error:(id *)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  if (_DateTimeFormatRegularExpressionYear_onceToken != -1)
    dispatch_once(&_DateTimeFormatRegularExpressionYear_onceToken, &__block_literal_global_618);
  v10 = (id)_DateTimeFormatRegularExpressionYear_regex;
  objc_msgSend(v10, "matchesInString:options:range:", v9, 0, location, length);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count") == 1)
  {
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(a1, "_integerFromTextCheckingResult:string:index:", v12, v9, 1);
    objc_msgSend(MEMORY[0x24BDD3CE0], "medicalDateWithYear:error:", v13, a5);
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v19 = (void *)v14;
    goto LABEL_14;
  }
  if (_DateTimeFormatRegularExpressionYearMonth_onceToken != -1)
    dispatch_once(&_DateTimeFormatRegularExpressionYearMonth_onceToken, &__block_literal_global_621);
  v15 = (id)_DateTimeFormatRegularExpressionYearMonth_regex;

  objc_msgSend(v15, "matchesInString:options:range:", v9, 0, location, length);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v16, "count") != 1)
  {
    if (_DateTimeFormatRegularExpressionYearMonthDay_onceToken != -1)
      dispatch_once(&_DateTimeFormatRegularExpressionYearMonthDay_onceToken, &__block_literal_global_624);
    v10 = (id)_DateTimeFormatRegularExpressionYearMonthDay_regex;

    objc_msgSend(v10, "matchesInString:options:range:", v9, 0, location, length);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "count") != 1)
    {
      v19 = 0;
      goto LABEL_15;
    }
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(a1, "_integerFromTextCheckingResult:string:index:", v12, v9, 1);
    v21 = objc_msgSend(a1, "_integerFromTextCheckingResult:string:index:", v12, v9, 2);
    v22 = objc_msgSend(a1, "_integerFromTextCheckingResult:string:index:", v12, v9, 3);
    objc_msgSend(MEMORY[0x24BDD3CE0], "medicalDateWithYear:month:day:error:", v20, v21, v22, a5);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  objc_msgSend(v16, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(a1, "_integerFromTextCheckingResult:string:index:", v12, v9, 1);
  v18 = objc_msgSend(a1, "_integerFromTextCheckingResult:string:index:", v12, v9, 2);
  objc_msgSend(MEMORY[0x24BDD3CE0], "medicalDateWithYear:month:error:", v17, v18, a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v16;
  v10 = v15;
LABEL_14:

LABEL_15:
  return v19;
}

+ (id)medicalDateWithDateTimeString:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  objc_opt_class();
  HKSafeObject();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_msgSend(v6, "length");
    objc_msgSend(a1, "_medicalDateWithDateTimeString:range:error:", v6, 0, v8, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(a1, "_medicalDateWithOnlyDateString:range:error:", v6, 0, v8, a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
        objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a4, 3, CFSTR("FHIR date string not parseable"));
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)medicalDateWithDateString:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t v17[16];

  v6 = a3;
  objc_opt_class();
  HKSafeObject();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_msgSend(v6, "length");
    _DateTimeFormatRegularExpressionYearMonthDayTime();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "matchesInString:options:range:", v6, 0, 0, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count") == 1)
    {
      _HKInitializeLogging();
      v11 = *MEMORY[0x24BDD2FF8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_224DAC000, v11, OS_LOG_TYPE_DEFAULT, "HDHealthRecordsExtractionUtilities: received 'date' string with time, dropping time", v17, 2u);
      }
      objc_msgSend(v6, "substringWithRange:", 0, objc_msgSend(v6, "rangeOfString:", CFSTR("T")));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v12, "length");
      v6 = v12;
    }
    objc_msgSend(a1, "_medicalDateWithOnlyDateString:range:error:", v6, 0, v8, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v14;
    if (v14)
      v15 = v14;
    else
      objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a4, 3, CFSTR("FHIR instant string not parseable"));

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)medicalDateWithInstantString:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a3;
  objc_opt_class();
  HKSafeObject();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(a1, "_medicalDateWithDateTimeString:range:error:", v6, 0, objc_msgSend(v6, "length"), a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      v10 = v8;
    else
      objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a4, 3, CFSTR("FHIR instant string not parseable"));

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)timeSinceMidnightWithTimeString:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a3;
  objc_opt_class();
  HKSafeObject();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_msgSend(v6, "length");
    if (_TimeFormatRegularExpressionTimeSinceMidnight_onceToken != -1)
      dispatch_once(&_TimeFormatRegularExpressionTimeSinceMidnight_onceToken, &__block_literal_global_627);
    objc_msgSend((id)_TimeFormatRegularExpressionTimeSinceMidnight_regex, "matchesInString:options:range:", v6, 0, 0, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count") == 1)
    {
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_alloc_init(MEMORY[0x24BDBCE68]);
      objc_msgSend(v11, "setHour:", objc_msgSend(a1, "_integerFromTextCheckingResult:string:index:", v10, v6, 1));
      objc_msgSend(v11, "setMinute:", objc_msgSend(a1, "_integerFromTextCheckingResult:string:index:", v10, v6, 2));
      objc_msgSend(v11, "setSecond:", objc_msgSend(a1, "_integerFromTextCheckingResult:string:index:", v10, v6, 3));

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a4, 3, CFSTR("FHIR time string not parseable"));
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)medicalDateIntervalWithPeriod:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  v6 = a3;
  objc_opt_class();
  HKSafeObject();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (!objc_msgSend(v6, "hk_hasValueForKeyPath:", CFSTR("start")))
    {
      v10 = 0;
LABEL_7:
      if (objc_msgSend(v6, "hk_hasValueForKeyPath:", CFSTR("end")))
      {
        objc_msgSend(v6, "hk_safeStringForKeyPath:error:", CFSTR("end"), a4);
        v12 = objc_claimAutoreleasedReturnValue();
        if (!v12)
          goto LABEL_13;
        v13 = (void *)v12;
        objc_msgSend(a1, "medicalDateWithDateTimeString:error:", v12, a4);
        v14 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v14 = 0;
      }
      if (v10 | v14)
      {
        if (v14)
        {
          if (v10)
            objc_msgSend(MEMORY[0x24BDD3CE8], "medicalDateIntervalWithStartDate:endDate:error:", v10, v14, a4);
          else
            objc_msgSend(MEMORY[0x24BDD3CE8], "medicalDateIntervalWithEndDate:", v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD3CE8], "medicalDateIntervalWithStartDate:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_20;
      }
      objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a4, 3, CFSTR("FHIR Period must have either start or end"));
LABEL_13:
      v11 = 0;
LABEL_20:

      goto LABEL_21;
    }
    objc_msgSend(v6, "hk_safeStringForKeyPath:error:", CFSTR("start"), a4);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      objc_msgSend(a1, "medicalDateWithDateTimeString:error:", v8, a4);
      v10 = objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
  }
  v11 = 0;
LABEL_21:

  return v11;
}

+ (id)_earliestDosageDateWithMedicationDosageArray:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  id v25;
  id v26;
  uint64_t v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_opt_class();
  HKSafeObject();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v25 = v6;
    obj = v6;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v30;
      v26 = a1;
      v27 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v30 != v11)
            objc_enumerationMutation(obj);
          objc_msgSend(a1, "_medicalDateIntervalWithDosage:error:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i), a4, v25);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "startDate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            objc_msgSend(v10, "dateForUTC");
            v15 = objc_claimAutoreleasedReturnValue();
            if (!v15)
              goto LABEL_10;
            v16 = (void *)v15;
            objc_msgSend(v13, "startDate");
            v17 = a4;
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "dateForUTC");
            v19 = v9;
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "dateForUTC");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v20, "hk_isBeforeDate:", v21);

            v9 = v19;
            a4 = v17;
            a1 = v26;
            v11 = v27;

            if (v22)
            {
LABEL_10:
              objc_msgSend(v13, "startDate");
              v23 = objc_claimAutoreleasedReturnValue();

              v10 = (void *)v23;
            }
          }

        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v9);
    }
    else
    {
      v10 = 0;
    }

    v6 = v25;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)_medicationDosagesWithDosageArray:(id)a3 FHIRRelease:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  id *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  id v31;
  uint64_t v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_opt_class();
  HKSafeObject();
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v31 = v8;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v12)
    {
      v13 = v12;
      v14 = (id)*MEMORY[0x24BDD2BF0];
      v15 = *(_QWORD *)v35;
      do
      {
        v16 = 0;
        v32 = v13;
        do
        {
          if (*(_QWORD *)v35 != v15)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v16);
          if (v14 == v9
            || !objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v16), "hk_hasValueForKeyPath:", CFSTR("patientInstruction")))
          {
            if (!objc_msgSend(v17, "hk_hasValueForKeyPath:", CFSTR("text")))
            {
              v20 = 0;
              goto LABEL_15;
            }
            v18 = v17;
            v19 = CFSTR("text");
          }
          else
          {
            v18 = v17;
            v19 = CFSTR("patientInstruction");
          }
          objc_msgSend(v18, "hk_safeStringForKeyPath:error:", v19, a5);
          v20 = objc_claimAutoreleasedReturnValue();
          if (!v20)
          {

            v10 = 0;
            v8 = v31;
            v29 = v33;
            goto LABEL_25;
          }
LABEL_15:
          objc_msgSend(a1, "_medicalDateIntervalWithDosage:error:", v17, a5);
          v21 = objc_claimAutoreleasedReturnValue();
          if (v20 | v21)
          {
            objc_msgSend(MEMORY[0x24BDD3D28], "dosageWithInstruction:timingPeriod:", v20, v21);
            v22 = a5;
            v23 = v15;
            v24 = v14;
            v25 = a1;
            v26 = v9;
            v27 = v11;
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "addObject:", v28);

            v11 = v27;
            v9 = v26;
            a1 = v25;
            v14 = v24;
            v15 = v23;
            a5 = v22;
            v13 = v32;
          }

          ++v16;
        }
        while (v13 != v16);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v13);
    }

    v29 = v33;
    if (objc_msgSend(v33, "count"))
    {
      v10 = v33;
    }
    else
    {
      if (!objc_msgSend(v11, "count"))
        objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a5, 3, CFSTR("Dosage array must be nonempty if present"));
      v10 = 0;
    }
    v8 = v31;
LABEL_25:

  }
  return v10;
}

+ (id)medicationDosagesWithStatementDosageInstructionArray:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "_medicationDosagesWithDosageArray:FHIRRelease:error:", a3, *MEMORY[0x24BDD2BF0], a4);
}

+ (id)medicationDosagesWithDispenseDosageInstructionArray:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "_medicationDosagesWithDosageArray:FHIRRelease:error:", a3, *MEMORY[0x24BDD2BF0], a4);
}

+ (id)medicationDosagesWithOrderDosageInstructionArray:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "_medicationDosagesWithDosageArray:FHIRRelease:error:", a3, *MEMORY[0x24BDD2BF0], a4);
}

+ (id)medicationDosagesWithDosageArray:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "_medicationDosagesWithDosageArray:FHIRRelease:error:", a3, *MEMORY[0x24BDD2C00], a4);
}

+ (id)_medicalDateIntervalWithDosage:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  objc_opt_class();
  HKSafeObject();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (objc_msgSend(v6, "hk_hasValueForKeyPath:", CFSTR("timing")))
    {
      objc_msgSend(v6, "hk_safeDictionaryForKeyPath:error:", CFSTR("timing"), a4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = v8;
        if (objc_msgSend(v8, "hk_hasValueForKeyPath:", CFSTR("repeat")))
        {
          objc_msgSend(v9, "hk_safeDictionaryForKeyPath:error:", CFSTR("repeat"), a4);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (v10 && objc_msgSend(v10, "hk_hasValueForKeyPath:", CFSTR("boundsPeriod")))
          {
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("boundsPeriod"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "medicalDateIntervalWithPeriod:error:", v12, a4);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
            goto LABEL_9;
          }
        }
        else
        {
          v11 = 0;
        }
        v13 = 0;
        goto LABEL_12;
      }
    }
  }
  v13 = 0;
LABEL_9:

  return v13;
}

+ (id)referencedMedicationStatementActorTypeWithString:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_opt_class();
  HKSafeObject();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDFHIRReferenceProcessor identifierFromAbsoluteReferenceURL:](HDFHIRReferenceProcessor, "identifierFromAbsoluteReferenceURL:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resourceType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("Organization")) & 1) != 0)
      {
        v9 = &unk_24ED0FCF0;
      }
      else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("Patient")) & 1) != 0)
      {
        v9 = &unk_24ED0FD08;
      }
      else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("Practitioner")) & 1) != 0
             || (objc_msgSend(v8, "isEqualToString:", CFSTR("PractitionerRole")) & 1) != 0)
      {
        v9 = &unk_24ED0FD20;
      }
      else if (objc_msgSend(v8, "isEqualToString:", CFSTR("RelatedPerson")))
      {
        v9 = &unk_24ED0FD38;
      }
      else
      {
        v9 = &unk_24ED0FD50;
      }
    }
    else
    {
      v9 = &unk_24ED0FCD8;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)preferredNameWithHumanNames:(id)a3 FHIRVersion:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = a4;
  +[HDHealthRecordParsedHumanName parsedNamesWithHumanNames:FHIRVersion:error:](HDHealthRecordParsedHumanName, "parsedNamesWithHumanNames:FHIRVersion:error:", a3, v7, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    +[HDHealthRecordParsedHumanName preferredNameInNames:FHIRVersion:](HDHealthRecordParsedHumanName, "preferredNameInNames:FHIRVersion:", v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "fullName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:description:", a5, 3, CFSTR("no preferred name available"));
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)stringWithRTF:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id *v8;
  void *v9;
  id v10;
  id *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25[2];

  v25[1] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  HKSafeObject();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "dataUsingEncoding:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x24BDD1458]);
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v8 = (id *)getNSDocumentTypeDocumentAttributeSymbolLoc_ptr;
    v23 = getNSDocumentTypeDocumentAttributeSymbolLoc_ptr;
    if (!getNSDocumentTypeDocumentAttributeSymbolLoc_ptr)
    {
      v9 = (void *)UIFoundationLibrary();
      v8 = (id *)dlsym(v9, "NSDocumentTypeDocumentAttribute");
      v21[3] = (uint64_t)v8;
      getNSDocumentTypeDocumentAttributeSymbolLoc_ptr = (uint64_t)v8;
    }
    _Block_object_dispose(&v20, 8);
    if (!v8)
      +[HDHealthRecordsExtractionUtilities stringWithRTF:error:].cold.1();
    v10 = *v8;
    v24 = v10;
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v11 = (id *)getNSRTFTextDocumentTypeSymbolLoc_ptr;
    v23 = getNSRTFTextDocumentTypeSymbolLoc_ptr;
    if (!getNSRTFTextDocumentTypeSymbolLoc_ptr)
    {
      v12 = (void *)UIFoundationLibrary();
      v11 = (id *)dlsym(v12, "NSRTFTextDocumentType");
      v21[3] = (uint64_t)v11;
      getNSRTFTextDocumentTypeSymbolLoc_ptr = (uint64_t)v11;
    }
    _Block_object_dispose(&v20, 8);
    if (!v11)
      +[HDHealthRecordsExtractionUtilities stringWithRTF:error:].cold.2();
    v25[0] = *v11;
    v13 = (void *)MEMORY[0x24BDBCE70];
    v14 = v25[0];
    objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)objc_msgSend(v7, "initWithData:options:documentAttributes:error:", v6, v15, 0, 0);
    if (v16)
    {
      objc_msgSend(v16, "string");
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = v4;
    }
    v18 = v17;

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (BOOL)_determineEnteredInError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "lowercaseString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR(" -"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsSeparatedByCharactersInSet:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "componentsJoinedByString:", CFSTR("-"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v4) = objc_msgSend(v8, "isEqualToString:", CFSTR("entered-in-error"));
    LOBYTE(v3) = (_BYTE)v4;
  }
  return (char)v3;
}

+ (id)enteredInErrorWithStatusString:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_opt_class();
  HKSafeObject();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1, "_determineEnteredInError:", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)wasEnteredInError:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("status"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("verificationStatus"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1, "_determineEnteredInError:", v10));
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v13 = (void *)MEMORY[0x24BDD1540];
      v14 = objc_opt_class();
      v15 = objc_opt_class();
      objc_msgSend(v13, "hk_assignError:code:format:", a4, 3, CFSTR("Unexpected class for status (expected %@ or %@, found %@)"), v14, v15, objc_opt_class());
      v12 = 0;
      goto LABEL_10;
    }
    objc_msgSend(a1, "enteredInErrorWithConditionVerificationStatusCodeableConcept:error:", v10, a4);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v11;
LABEL_10:

  return v12;
}

+ (id)localeFromLanguage:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_opt_class();
  HKSafeObject();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (void)stringWithAttachment:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_224DAC000, a1, a3, "Could not Base64 decode valueAttachment.data.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

+ (void)stringWithAttachment:(uint64_t)a3 error:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_224DAC000, a1, a3, "Decoded valueAttachment.data is not a UTF8 String.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

+ (void)stringWithAttachment:(uint64_t)a3 error:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_224DAC000, a1, a3, "RTF scrubbing valueAttachment.data failed.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

+ (void)stringWithRTF:error:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getNSDocumentTypeDocumentAttribute(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("HDHealthRecordsExtractionUtilities.m"), 25, CFSTR("%s"), dlerror());

  __break(1u);
}

+ (void)stringWithRTF:error:.cold.2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getNSRTFTextDocumentType(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("HDHealthRecordsExtractionUtilities.m"), 26, CFSTR("%s"), dlerror());

  __break(1u);
}

@end
