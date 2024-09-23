@implementation NSMutableDictionary(AppleMediaServices)

- (void)ams_setNullableObject:()AppleMediaServices forKey:
{
  if (a3)
    return (void *)objc_msgSend(a1, "setObject:forKeyedSubscript:");
  return a1;
}

- (uint64_t)ams_deleteValueForKeyPath:()AppleMediaServices
{
  return objc_msgSend(a1, "ams_setValue:forKeyPath:shouldAppendToContainers:shouldFlatten:", 0, a3, 0, 0);
}

- (void)ams_insertValue:()AppleMediaServices forKeyPath:
{
  if (a3)
    return (void *)objc_msgSend(a1, "ams_setValue:forKeyPath:shouldAppendToContainers:shouldFlatten:", a3, a4, 1, 0);
  return a1;
}

- (void)ams_flatInsertValue:()AppleMediaServices forKeyPath:
{
  if (a3)
    return (void *)objc_msgSend(a1, "ams_setValue:forKeyPath:shouldAppendToContainers:shouldFlatten:", a3, a4, 1, 1);
  return a1;
}

- (void)ams_setValue:()AppleMediaServices forKeyPath:
{
  if (a3)
    return (void *)objc_msgSend(a1, "ams_setValue:forKeyPath:shouldAppendToContainers:shouldFlatten:", a3, a4, 0, 0);
  return a1;
}

- (void)ams_setValue:()AppleMediaServices forKeyPath:shouldAppendToContainers:shouldFlatten:
{
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v10 = a4;
  if (objc_msgSend(v10, "length"))
  {
    objc_msgSend(v10, "componentsSeparatedByString:", CFSTR("."));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    if (objc_msgSend(v12, "count") && (objc_msgSend(v12, "containsObject:", &stru_1E2548760) & 1) == 0)
      objc_msgSend(a1, "ams_setValue:forKeyPathComponents:shouldAppendToContainers:shouldFlatten:", v13, v12, a5, a6);

  }
}

- (void)ams_setValue:()AppleMediaServices forKeyPathComponents:shouldAppendToContainers:shouldFlatten:
{
  id v10;
  id v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  char isKindOfClass;
  unint64_t v21;
  uint64_t v22;
  char v23;
  char v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  unint64_t v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  int v37;
  void *v38;
  int v39;
  id v40;
  id v41;

  v40 = a3;
  v10 = a4;
  if (!objc_msgSend(v10, "count"))
    goto LABEL_64;
  v37 = a6;
  v39 = a5;
  if (_MergedGlobals_160 != -1)
    dispatch_once(&_MergedGlobals_160, &__block_literal_global_147);
  v41 = (id)qword_1ECEADA68;
  v11 = a1;
  v12 = 0;
  while (v12 < objc_msgSend(v10, "count") - 1)
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", v12 + 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "numberFromString:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "numberFromString:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = v11;
      objc_msgSend(v17, "objectForKey:", v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (id)objc_msgSend(v18, "mutableCopy");

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        isKindOfClass = 1;
        if (!v19)
        {
LABEL_16:
          if (!v40)
            goto LABEL_32;
          v22 = objc_opt_new();

          v19 = (id)v22;
          goto LABEL_18;
        }
      }
      else
      {
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        if (!v19)
          goto LABEL_16;
      }
      if ((isKindOfClass & 1) == 0)
        goto LABEL_16;
LABEL_18:
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, v13);
      goto LABEL_19;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = v11;
      if (!v15 || (v21 = objc_msgSend(v15, "unsignedIntegerValue"), v21 > objc_msgSend(v17, "count")))
      {
        v19 = 0;
        goto LABEL_32;
      }
      if (v21 >= objc_msgSend(v17, "count"))
      {
        v19 = 0;
      }
      else
      {
        objc_msgSend(v17, "objectAtIndex:", v21);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (id)objc_msgSend(v38, "mutableCopy");

      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = 1;
        if (!v19)
        {
LABEL_30:
          if (v40)
          {
            v25 = objc_opt_new();

            objc_msgSend(v17, "addObject:", v25);
            v19 = (id)v25;
            goto LABEL_19;
          }
LABEL_32:
          v23 = 0;
LABEL_33:

          v11 = v17;
          goto LABEL_34;
        }
      }
      else
      {
        objc_opt_class();
        v24 = objc_opt_isKindOfClass();
        if (!v19)
          goto LABEL_30;
      }
      if ((v24 & 1) == 0)
        goto LABEL_30;
      objc_msgSend(v17, "replaceObjectAtIndex:withObject:", v21, v19);
LABEL_19:

      v19 = v19;
      v23 = 1;
      v17 = v19;
      goto LABEL_33;
    }
    v23 = 0;
LABEL_34:

    ++v12;
    if ((v23 & 1) == 0)
      goto LABEL_63;
  }
  objc_msgSend(v10, "lastObject");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "numberFromString:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || !v27)
      goto LABEL_62;
    v32 = objc_msgSend(v27, "unsignedIntegerValue");
    v33 = v11;
    if (!v40 && v32 < objc_msgSend(v33, "count"))
    {
      objc_msgSend(v33, "removeObjectAtIndex:", v32);
      goto LABEL_61;
    }
    if (v32 >= objc_msgSend(v33, "count"))
    {
      objc_msgSend(v33, "addObject:", v40);
      goto LABEL_61;
    }
    objc_msgSend(v33, "objectAtIndexedSubscript:", v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v40;
    if (v39)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v34);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addEntriesFromDictionary:", v35);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_73;
        v36 = (void *)objc_msgSend(v34, "mutableCopy");
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && v37)
          objc_msgSend(v36, "addObjectsFromArray:", v35);
        else
          objc_msgSend(v36, "addObject:", v35);
      }

      v35 = v36;
    }
    if (!v35)
    {
LABEL_74:

      goto LABEL_61;
    }
    objc_msgSend(v33, "replaceObjectAtIndex:withObject:", v32, v35);
LABEL_73:

    goto LABEL_74;
  }
  v28 = v11;
  objc_msgSend(v28, "objectForKeyedSubscript:", v26);
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)v29;
  if (v39 && v29)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v31 = (void *)objc_msgSend(v30, "mutableCopy");
        objc_msgSend(v31, "addEntriesFromDictionary:", v40);
        goto LABEL_59;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = (void *)objc_msgSend(v30, "mutableCopy");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && v37)
        objc_msgSend(v31, "addObjectsFromArray:", v40);
      else
        objc_msgSend(v31, "addObject:", v40);
LABEL_59:
      objc_msgSend(v28, "setObject:forKeyedSubscript:", v31, v26);

    }
  }
  else
  {
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v40, v26);
  }

LABEL_61:
LABEL_62:

LABEL_63:
LABEL_64:

}

@end
