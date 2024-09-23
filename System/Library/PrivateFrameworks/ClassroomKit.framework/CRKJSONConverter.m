@implementation CRKJSONConverter

+ (id)JSONArrayForArray:(id)a3
{
  id v3;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  objc_class *v9;
  void *v10;

  objc_msgSend(a1, "bestEffortJSONObjectForObject:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[CRKJSONConverter JSONArrayForArray:]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("CRKJSONConverter.m"), 23, CFSTR("expected %@, got %@"), v8, v10);

  }
  return v3;
}

+ (id)JSONDictionaryForDictionary:(id)a3
{
  id v3;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  objc_class *v9;
  void *v10;

  objc_msgSend(a1, "bestEffortJSONObjectForObject:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[CRKJSONConverter JSONDictionaryForDictionary:]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("CRKJSONConverter.m"), 30, CFSTR("expected %@, got %@"), v8, v10);

  }
  return v3;
}

+ (id)bestEffortJSONObjectForObject:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  _QWORD v32[5];
  _QWORD v33[4];
  id v34;
  id v35;

  v4 = a3;
  if (!objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v4))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v8 = v4;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[CRKJSONConverter bestEffortJSONObjectForObject:]");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = (objc_class *)objc_opt_class();
            NSStringFromClass(v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = (objc_class *)objc_opt_class();
            NSStringFromClass(v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("CRKJSONConverter.m"), 45, CFSTR("expected %@, got %@"), v17, v19);

          }
          v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v8, "count"));
          v33[0] = MEMORY[0x24BDAC760];
          v33[1] = 3221225472;
          v33[2] = __50__CRKJSONConverter_bestEffortJSONObjectForObject___block_invoke;
          v33[3] = &unk_24D9CAA90;
          v34 = v9;
          v35 = a1;
          v10 = v9;
          objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v33);
          v6 = (void *)objc_msgSend(v10, "copy");

LABEL_11:
LABEL_18:

          goto LABEL_6;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v4, "dictionaryValue");
          v11 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_msgSend(a1, "stringForObject:", v4);
                v5 = (id)objc_claimAutoreleasedReturnValue();
                goto LABEL_5;
              }
              v8 = v4;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[CRKJSONConverter bestEffortJSONObjectForObject:]");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = (objc_class *)objc_opt_class();
                NSStringFromClass(v28);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = (objc_class *)objc_opt_class();
                NSStringFromClass(v30);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, CFSTR("CRKJSONConverter.m"), 69, CFSTR("expected %@, got %@"), v29, v31);

              }
              objc_msgSend(v8, "allObjects");
              v10 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1, "JSONArrayForArray:", v10);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "sortedArrayUsingSelector:", sel_compare_);
              v6 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_11;
            }
            v8 = v4;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[CRKJSONConverter bestEffortJSONObjectForObject:]");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = (objc_class *)objc_opt_class();
              NSStringFromClass(v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = (objc_class *)objc_opt_class();
              NSStringFromClass(v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("CRKJSONConverter.m"), 62, CFSTR("expected %@, got %@"), v23, v25);

            }
            v32[0] = MEMORY[0x24BDAC760];
            v32[1] = 3221225472;
            v32[2] = __50__CRKJSONConverter_bestEffortJSONObjectForObject___block_invoke_2;
            v32[3] = &__block_descriptor_40_e8__16__0_8l;
            v32[4] = a1;
            objc_msgSend(v8, "crk_mapUsingBlock:", v32);
            v12 = objc_claimAutoreleasedReturnValue();
LABEL_17:
            v6 = (void *)v12;
            goto LABEL_18;
          }
          objc_msgSend(v4, "dictionaryRepresentation");
          v11 = objc_claimAutoreleasedReturnValue();
        }
        v8 = (id)v11;
        objc_msgSend(a1, "bestEffortJSONObjectForObject:", v11);
        v12 = objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
    }
  }
  v5 = v4;
LABEL_5:
  v6 = v5;
LABEL_6:

  return v6;
}

void __50__CRKJSONConverter_bestEffortJSONObjectForObject___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = *(void **)(a1 + 40);
  v6 = a2;
  objc_msgSend(v5, "bestEffortJSONObjectForObject:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "stringForObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v8);
}

uint64_t __50__CRKJSONConverter_bestEffortJSONObjectForObject___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "bestEffortJSONObjectForObject:", a2);
}

+ (id)stringForObject:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  objc_class *v20;
  void *v21;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
LABEL_3:
    v6 = v5;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[CRKJSONConverter stringForObject:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("CRKJSONConverter.m"), 84, CFSTR("expected %@, got %@"), v13, v15);

    }
    objc_msgSend(a1, "stringForDate:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v4, "stringValue");
      else
        objc_msgSend(v4, "description");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    }
    v8 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[CRKJSONConverter stringForObject:]");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("CRKJSONConverter.m"), 89, CFSTR("expected %@, got %@"), v19, v21);

    }
    objc_msgSend(v8, "base64EncodedStringWithOptions:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_12:

  return v6;
}

+ (id)stringForDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCF38];
  v4 = a3;
  objc_msgSend(v3, "timeZoneWithAbbreviation:", CFSTR("GMT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15D0], "stringFromDate:timeZone:formatOptions:", v4, v5, 1907);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
