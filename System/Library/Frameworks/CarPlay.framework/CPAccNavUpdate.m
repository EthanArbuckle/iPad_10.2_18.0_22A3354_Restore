@implementation CPAccNavUpdate

+ (void)configureTypesForUpdateClass:(Class)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[objc_class accNavParameters](a3, "accNavParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "configureTypesForUpdate:", a3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

+ (id)accNavParametersIndexedForUpdate:(Class)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[objc_class accNavParameters](a3, "accNavParameters", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "property");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)accNavParameterKeysIndexedForUpdate:(Class)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  id obj;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[objc_class accNavParameters](a3, "accNavParameters");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v5)
  {
    v6 = v5;
    v18 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        objc_msgSend(v8, "keys");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v20;
          do
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v20 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * j);
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", objc_msgSend(v14, "key"));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, v15);

            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v11);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v6);
  }

  return v4;
}

+ (id)updateClass:(Class)a3 paramForProperty:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[objc_class accNavParametersIndexed](a3, "accNavParametersIndexed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)updateClass:(Class)a3 paramKeyForKey:(unsigned __int16)a4
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a4;
  -[objc_class accNavParameterKeysIndexed](a3, "accNavParameterKeysIndexed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)isUpdate:(id)a3 equalTo:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  BOOL v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  BOOL v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_opt_class();
  if (v7 == objc_opt_class())
  {
    objc_msgSend((id)objc_opt_class(), "accNavParameters");
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v14, "property", (_QWORD)v21);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "valueForKey:", v15);
          v16 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "property");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "valueForKey:", v17);
          v18 = objc_claimAutoreleasedReturnValue();

          if (v16 | v18)
          {
            v19 = !v16 || v18 == 0;
            if (v19 || v16 != v18 && (objc_msgSend((id)v16, "isEqual:", v18) & 1) == 0)
            {

              v8 = 0;
              goto LABEL_19;
            }
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v11)
          continue;
        break;
      }
    }
    v8 = 1;
LABEL_19:

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (void)resetUpdate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "configureTypesForUpdateClass:", objc_opt_class());
  objc_msgSend((id)objc_opt_class(), "accNavParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(a1, "_update:resetValueForParameter:", v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

+ (void)update:(id)a3 resetValueForProperty:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "accNavParametersIndexed");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_update:resetValueForParameter:", v7, v9);
}

+ (void)_update:(id)a3 resetValueForParameter:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  NSObject *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "primaryKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "enumType");

  objc_msgSend(v6, "primaryKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    v11 = objc_msgSend(v9, "enumType");
    objc_msgSend(v6, "primaryKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NotSetFromCPNavEnum(v11, objc_msgSend(v12, "accNavType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "property");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forKey:", v13, v14);

    goto LABEL_16;
  }
  v15 = objc_msgSend(v9, "isIntegerValue");

  objc_msgSend(v6, "primaryKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v15)
  {
    v19 = objc_msgSend(v16, "isTimeIntervalValue");

    if (v19)
    {
      objc_msgSend(v6, "property");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = &unk_24C79E068;
    }
    else
    {
      objc_msgSend(v6, "primaryKey");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isBoolValue");

      objc_msgSend(v6, "property");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v22)
      {
        v23 = v5;
        v20 = 0;
        goto LABEL_15;
      }
      v20 = (void *)MEMORY[0x24BDBD1C0];
    }
    v23 = v5;
LABEL_15:
    objc_msgSend(v23, "setValue:forKey:", v20, v10);
    goto LABEL_16;
  }
  NotSetFromCPAccNavType(objc_msgSend(v16, "accNavType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v6, "property");
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forKey:", v10, v18);
  }
  else
  {
    CarPlayFrameworkACCNavLogging();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      +[CPAccNavUpdate _update:resetValueForParameter:].cold.1(v6, v18);
  }

LABEL_16:
}

+ (id)update:(id)a3 valueForProperty:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "accNavParametersIndexed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[CPAccNavUpdate update:valueForParam:](CPAccNavUpdate, "update:valueForParam:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)update:(id)a3 valueForKey:(unsigned __int16)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "accNavParameterKeysIndexed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPAccNavUpdate update:valueForParamKey:](CPAccNavUpdate, "update:valueForParamKey:", v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)update:(id)a3 valueForParam:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "property");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "primaryKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "enumType");
  if (v10
    || (objc_msgSend(v5, "primaryKey"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        (objc_msgSend(v7, "isIntegerValue") & 1) != 0))
  {
    objc_msgSend(v5, "primaryKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "unsetValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v8, "isEqual:", v12);

    if (!v10)
    if ((v13 & 1) != 0)
      goto LABEL_12;
  }
  else
  {

  }
  objc_msgSend(v5, "primaryKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "isTimeIntervalValue"))
  {
LABEL_13:

    goto LABEL_14;
  }
  if (objc_msgSend(v8, "isEqual:", &unk_24C79E068))
  {

LABEL_12:
    v14 = v8;
    v8 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v5, "primaryKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "unsetValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v8, "isEqual:", v16);

  if (v17)
    goto LABEL_12;
LABEL_14:

  return v8;
}

+ (id)update:(id)a3 valueForParamKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "param");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "property");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_19;
  objc_msgSend(v6, "param");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "objcType");
  v13 = objc_opt_class();

  if (v12 == v13)
  {
    objc_msgSend(a1, "_valueFromMeasurement:forParamKey:", v10, v6);
    v17 = objc_claimAutoreleasedReturnValue();
LABEL_17:
    v16 = (void *)v17;
    goto LABEL_18;
  }
  if ((objc_msgSend(v6, "enumType") || objc_msgSend(v6, "isIntegerValue"))
    && (NotSetFromCPAccNavType(objc_msgSend(v6, "accNavType")),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v10, "isEqual:", v14),
        v14,
        (v15 & 1) != 0)
    || objc_msgSend(v6, "isTimeIntervalValue") && (objc_msgSend(v10, "isEqual:", &unk_24C79E068) & 1) != 0)
  {
    v16 = 0;
LABEL_18:

    v10 = v16;
    goto LABEL_19;
  }
  objc_msgSend(v6, "param");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "objcType");
  v20 = objc_opt_class();

  if (v19 == v20)
  {
    v26 = objc_msgSend(v6, "accNavType");
    objc_msgSend(v10, "timeIntervalSince1970");
    NSNumberForCPAccNavTypeFromDouble(v26, v27);
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  objc_msgSend(v6, "param");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "objcType");
  if (v22 == objc_opt_class())
  {

LABEL_16:
    objc_msgSend(a1, "_valueFromCollection:forParamKey:", v10, v6);
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  objc_msgSend(v6, "param");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "objcType");
  v25 = objc_opt_class();

  if (v24 == v25)
    goto LABEL_16;
LABEL_19:

  return v10;
}

+ (id)_valueFromMeasurement:(id)a3 forParamKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "dimension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v7, "dimension");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "accNav_safeToBeConvertedToUnit:", v9);

    if (v10)
    {
      objc_msgSend(v7, "dimension");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "measurementByConvertingToUnit:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "doubleValue");
      v14 = v13;

      NSNumberForCPAccNavTypeFromDouble(objc_msgSend(v7, "accNavType"), v14);
      v15 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v18 = (void *)v15;
      goto LABEL_9;
    }
    v18 = 0;
  }
  else
  {
    if (objc_msgSend(v7, "enumType") != 5)
    {
      objc_msgSend(v6, "doubleValue");
      objc_msgSend(a1, "_formattedDistanceString:");
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    v16 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v6, "unit");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "numberWithUnsignedChar:", CPDistanceUnitsFromNSUnitLength(v17));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_9:

  return v18;
}

+ (id)_valueFromCollection:(id)a3 forParamKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v26;
  id v27;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "param");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "objcType");
  v9 = objc_opt_class();

  if (v8 == v9)
  {
    v14 = v5;
  }
  else
  {
    objc_msgSend(v6, "param");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "objcType");
    v12 = objc_opt_class();

    if (v11 != v12)
    {
      v13 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v5, "allObjects");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v14;
LABEL_7:
  if (objc_msgSend(v13, "count"))
  {
    v27 = v5;
    v15 = (void *)objc_opt_new();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v26 = v13;
    obj = v13;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v31;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v31 != v18)
            objc_enumerationMutation(obj);
          v20 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v19);
          objc_msgSend(v6, "param", v26);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "collectionGeneric");
          v23 = objc_opt_class();

          if (v22 == v23)
          {
            objc_msgSend(a1, "_valueFromMeasurement:forParamKey:", v20, v6);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v24);

          }
          else
          {
            objc_msgSend(v15, "addObject:", v20);
          }
          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v17);
    }

    v13 = v26;
    v5 = v27;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (void)enumerateUpdateClass:(Class)a3 paramsWithBlock:(id)a4
{
  void (**v5)(id, _QWORD);
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = (void (**)(id, _QWORD))a4;
  if (-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &unk_2549DB9A0))
  {
    -[objc_class accNavParameters](a3, "accNavParameters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          v5[2](v5, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

+ (void)enumerateUpdateClass:(Class)a3 paramKeysWithBlock:(id)a4
{
  void (**v5)(id, _QWORD);
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = (void (**)(id, _QWORD))a4;
  if (-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", &unk_2549DB9A0))
  {
    -[objc_class accNavParameters](a3, "accNavParameters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v22;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v10);
          v17 = 0u;
          v18 = 0u;
          v19 = 0u;
          v20 = 0u;
          objc_msgSend(v11, "keys", 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v18;
            do
            {
              v16 = 0;
              do
              {
                if (*(_QWORD *)v18 != v15)
                  objc_enumerationMutation(v12);
                v5[2](v5, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++));
              }
              while (v14 != v16);
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
            }
            while (v14);
          }

          ++v10;
        }
        while (v10 != v8);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v8);
    }

  }
}

+ (void)enumerateUpdate:(id)a3 paramsAndValuesWithBlock:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = objc_opt_class();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __59__CPAccNavUpdate_enumerateUpdate_paramsAndValuesWithBlock___block_invoke;
  v10[3] = &unk_24C77DB30;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  +[CPAccNavUpdate enumerateUpdateClass:paramsWithBlock:](CPAccNavUpdate, "enumerateUpdateClass:paramsWithBlock:", v7, v10);

}

void __59__CPAccNavUpdate_enumerateUpdate_paramsAndValuesWithBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  +[CPAccNavUpdate update:valueForParam:](CPAccNavUpdate, "update:valueForParam:", v3, v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (void)enumerateUpdate:(id)a3 paramKeysAndValuesWithBlock:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = objc_opt_class();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __62__CPAccNavUpdate_enumerateUpdate_paramKeysAndValuesWithBlock___block_invoke;
  v10[3] = &unk_24C77DB58;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  +[CPAccNavUpdate enumerateUpdateClass:paramKeysWithBlock:](CPAccNavUpdate, "enumerateUpdateClass:paramKeysWithBlock:", v7, v10);

}

void __62__CPAccNavUpdate_enumerateUpdate_paramKeysAndValuesWithBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  +[CPAccNavUpdate update:valueForParamKey:](CPAccNavUpdate, "update:valueForParamKey:", v3, v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (id)dictionaryIAPFormat:(id)a3
{
  return (id)objc_msgSend(a1, "_dictionaryFormat:resolveEnums:", a3, 0);
}

+ (id)dictionaryStringFormat:(id)a3
{
  return (id)objc_msgSend(a1, "_dictionaryFormat:resolveEnums:", a3, 1);
}

+ (id)_dictionaryFormat:(id)a3 resolveEnums:(BOOL)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  BOOL v14;

  v5 = a3;
  v6 = (void *)objc_opt_new();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __49__CPAccNavUpdate__dictionaryFormat_resolveEnums___block_invoke;
  v11[3] = &unk_24C77DB80;
  v14 = a4;
  v12 = v5;
  v13 = v6;
  v7 = v6;
  v8 = v5;
  +[CPAccNavUpdate enumerateUpdate:paramKeysAndValuesWithBlock:](CPAccNavUpdate, "enumerateUpdate:paramKeysAndValuesWithBlock:", v8, v11);
  v9 = (void *)objc_msgSend(v7, "copy");

  return v9;
}

void __49__CPAccNavUpdate__dictionaryFormat_resolveEnums___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __CFString *v17;
  int v18;
  __CFString *v19;
  __CFString *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "hasVariants"))
  {
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "param");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend((id)objc_msgSend(v8, "collectionGeneric"), "conformsToProtocol:", &unk_2549DB9A0);

    v7 = v6;
    if (v9)
    {
      v10 = (void *)objc_opt_new();
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v11 = v6;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v25 != v14)
              objc_enumerationMutation(v11);
            +[CPAccNavUpdate _dictionaryFormat:resolveEnums:](CPAccNavUpdate, "_dictionaryFormat:resolveEnums:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i), *(unsigned __int8 *)(a1 + 48), (_QWORD)v24);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v16);

          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v13);
      }

      if (objc_msgSend(v10, "count"))
        v7 = (void *)objc_msgSend(v10, "copy");
      else
        v7 = 0;

    }
  }
  if (!*(_BYTE *)(a1 + 48))
    goto LABEL_25;
  if (objc_msgSend(v5, "enumType"))
  {
    +[CPNavigationEnum stringForEnum:navEnum:](CPNavigationEnum, "stringForEnum:navEnum:", objc_msgSend(v7, "integerValue"), objc_msgSend(v5, "enumType"));
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v5, "isBoolValue"))
      goto LABEL_23;
    v18 = objc_msgSend(v7, "BOOLValue");
    v19 = CFSTR("NO");
    if (v18)
      v19 = CFSTR("YES");
    v17 = v19;
  }
  v20 = v17;

  v7 = v20;
LABEL_23:
  if (!*(_BYTE *)(a1 + 48))
  {
LABEL_25:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", objc_msgSend(v5, "key", (_QWORD)v24));
    v21 = objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
  +[CPAccNavInfoType stringForUpdateClass:infoType:](CPAccNavInfoType, "stringForUpdateClass:infoType:", objc_opt_class(), objc_msgSend(v5, "key"));
  v21 = objc_claimAutoreleasedReturnValue();
LABEL_26:
  v22 = (void *)v21;
  v23 = (void *)objc_msgSend(v7, "copy", (_QWORD)v24);
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v23, v22);

}

+ (id)iapDescription:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_descriptionArray:resolveEnums:showNils:prefix:", a3, 0, 1, CFSTR("     "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)description:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_descriptionArray:resolveEnums:showNils:prefix:", a3, 1, 1, CFSTR("     "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_descriptionArray:(id)a3 resolveEnums:(BOOL)a4 showNils:(BOOL)a5 prefix:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  BOOL v22;
  BOOL v23;

  v9 = a3;
  v10 = a6;
  v11 = (void *)objc_opt_new();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __65__CPAccNavUpdate__descriptionArray_resolveEnums_showNils_prefix___block_invoke;
  v18[3] = &unk_24C77DBA8;
  v22 = a4;
  v23 = a5;
  v19 = v10;
  v20 = v9;
  v12 = v11;
  v21 = v12;
  v13 = v9;
  v14 = v10;
  +[CPAccNavUpdate enumerateUpdate:paramKeysAndValuesWithBlock:](CPAccNavUpdate, "enumerateUpdate:paramKeysAndValuesWithBlock:", v13, v18);
  v15 = v21;
  v16 = v12;

  return v16;
}

void __65__CPAccNavUpdate__descriptionArray_resolveEnums_showNils_prefix___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  objc_class *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  __CFString *v36;
  int v37;
  __CFString *v38;
  __CFString *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  id v49;
  id obj;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "hasVariants"))
  {
    objc_msgSend(v6, "firstObject");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_22;
  }
  objc_msgSend(v5, "param");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend((id)objc_msgSend(v8, "collectionGeneric"), "conformsToProtocol:", &unk_2549DB9A0);

  if (!v9)
  {
    objc_msgSend(v5, "param");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "objcType");
    v28 = objc_opt_class();

    if (v6 && v27 == v28)
    {
      v29 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringWithFormat:", CFSTR("[%@]"), v30);
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v5, "param");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "objcType");
      v33 = objc_opt_class();

      v7 = v6;
      if (!v6)
        goto LABEL_22;
      v7 = v6;
      if (v32 != v33)
        goto LABEL_22;
      v34 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v6, "allObjects");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "componentsJoinedByString:", CFSTR(", "));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "stringWithFormat:", CFSTR("[%@]"), v35);
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_22;
  }
  v49 = v5;
  v10 = (void *)objc_opt_new();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v48 = v6;
  obj = v6;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
  if (v11)
  {
    v12 = v11;
    v51 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v53 != v51)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i);
        v15 = (void *)MEMORY[0x24BDD17C8];
        v16 = *(_QWORD *)(a1 + 32);
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", CFSTR("%@     %@ {"), v16, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v19);

        v20 = *(unsigned __int8 *)(a1 + 56);
        v21 = *(unsigned __int8 *)(a1 + 57);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@          "), *(_QWORD *)(a1 + 32));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        +[CPAccNavUpdate _descriptionArray:resolveEnums:showNils:prefix:](CPAccNavUpdate, "_descriptionArray:resolveEnums:showNils:prefix:", v14, v20, v21, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObjectsFromArray:", v23);

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@     }"), *(_QWORD *)(a1 + 32));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v24);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    }
    while (v12);
  }

  if (objc_msgSend(v10, "count"))
    v25 = v10;
  else
    v25 = 0;
  v7 = v25;

  v6 = v48;
  v5 = v49;
LABEL_22:
  if (!*(_BYTE *)(a1 + 56))
  {
LABEL_32:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", objc_msgSend(v5, "key"));
    v40 = objc_claimAutoreleasedReturnValue();
    goto LABEL_33;
  }
  if (objc_msgSend(v5, "enumType"))
  {
    +[CPNavigationEnum stringForEnum:navEnum:](CPNavigationEnum, "stringForEnum:navEnum:", objc_msgSend(v7, "integerValue"), objc_msgSend(v5, "enumType"));
    v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v5, "isBoolValue"))
      goto LABEL_30;
    v37 = objc_msgSend(v7, "BOOLValue");
    v38 = CFSTR("NO");
    if (v37)
      v38 = CFSTR("YES");
    v36 = v38;
  }
  v39 = v36;

  v7 = v39;
LABEL_30:
  if (!*(_BYTE *)(a1 + 56))
    goto LABEL_32;
  +[CPAccNavInfoType stringForUpdateClass:infoType:](CPAccNavInfoType, "stringForUpdateClass:infoType:", objc_opt_class(), objc_msgSend(v5, "key"));
  v40 = objc_claimAutoreleasedReturnValue();
LABEL_33:
  v41 = (void *)v40;
  if (v7 || *(_BYTE *)(a1 + 57))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "count"))
    {
      v42 = *(void **)(a1 + 48);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@: ["), *(_QWORD *)(a1 + 32), v41);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "addObject:", v43);

      objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:", v7);
      v44 = *(void **)(a1 + 48);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@]"), *(_QWORD *)(a1 + 32), v46, v47);
    }
    else
    {
      v44 = *(void **)(a1 + 48);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@: %@"), *(_QWORD *)(a1 + 32), v41, v7);
    }
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "addObject:", v45);

  }
}

+ (id)_formattedDistanceString:(double)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v4, "setNumberStyle:", 1);
  objc_msgSend(v4, "setMaximumFractionDigits:", a3 < 100.0);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromNumber:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)copyUpdate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_opt_class();
  v4 = (void *)objc_opt_new();
  objc_msgSend((id)objc_opt_class(), "accNavParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v10, "encodeable"))
        {
          objc_msgSend(v10, "property");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "valueForKey:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "property");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setValue:forKey:", v12, v13);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

+ (void)decodeUpdate:(id)a3 withCoder:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[2];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v24 = a3;
  v25 = a4;
  objc_msgSend((id)objc_opt_class(), "accNavParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    v9 = 0x24BDBC000uLL;
    v10 = 0x24BDBC000uLL;
    do
    {
      v11 = 0;
      v23 = v7;
      do
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v11);
        if (objc_msgSend(v12, "encodeable"))
        {
          v13 = objc_msgSend(v12, "objcType");
          if ((v13 == objc_opt_class() || v13 == objc_opt_class()) && objc_msgSend(v12, "collectionGeneric"))
          {
            v14 = v8;
            v15 = *(void **)(v10 + 3872);
            v30[0] = v13;
            v30[1] = objc_msgSend(v12, "collectionGeneric");
            objc_msgSend(*(id *)(v9 + 3632), "arrayWithObjects:count:", v30, 2);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setWithArray:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "property");
            v18 = v10;
            v19 = v9;
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "decodeObjectOfClasses:forKey:", v17, v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            v9 = v19;
            v10 = v18;

            v8 = v14;
            v7 = v23;
          }
          else
          {
            objc_msgSend(v12, "property");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "decodeObjectOfClass:forKey:", v13, v16);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
          }

          if (v21)
          {
            objc_msgSend(v12, "property");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "setValue:forKey:", v21, v22);

          }
        }
        ++v11;
      }
      while (v7 != v11);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v7);
  }

}

+ (void)encodeUpdate:(id)a3 withCoder:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend((id)objc_opt_class(), "accNavParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "encodeable"))
        {
          objc_msgSend(v12, "property");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "valueForKey:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "property");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "encodeObject:forKey:", v14, v15);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

}

+ (id)accNavInfoWithUpdate:(id)a3 component:(id)a4 customValueBlock:(id)a5
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v6 = a3;
  v7 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = (void *)objc_opt_new();
  }
  else
  {
    v8 = 0;
  }
  v9 = objc_opt_class();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __66__CPAccNavUpdate_accNavInfoWithUpdate_component_customValueBlock___block_invoke;
  v16[3] = &unk_24C77DBD0;
  v19 = v7;
  v17 = v6;
  v10 = v8;
  v18 = v10;
  v11 = v6;
  v12 = v7;
  +[CPAccNavUpdate enumerateUpdateClass:paramKeysWithBlock:](CPAccNavUpdate, "enumerateUpdateClass:paramKeysWithBlock:", v9, v16);
  v13 = v18;
  v14 = v10;

  return v14;
}

void __66__CPAccNavUpdate_accNavInfoWithUpdate_component_customValueBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    || (+[CPAccNavUpdate update:valueForParamKey:](CPAccNavUpdate, "update:valueForParamKey:", *(_QWORD *)(a1 + 32), v4), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(*(id *)(a1 + 40), "setInfo:data:", objc_msgSend(v4, "key"), v3);

  }
}

+ (void)_update:(void *)a1 resetValueForParameter:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "property");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "primaryKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "key");
  objc_msgSend(a1, "primaryKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 136315906;
  v9 = "+[CPAccNavUpdate _update:resetValueForParameter:]";
  v10 = 2112;
  v11 = v4;
  v12 = 1024;
  v13 = v6;
  v14 = 2048;
  v15 = objc_msgSend(v7, "accNavType");
  _os_log_error_impl(&dword_20D6F4000, a2, OS_LOG_TYPE_ERROR, "%s unexpected nil for %@ primaryKey=%d accNavType=%ld", (uint8_t *)&v8, 0x26u);

}

@end
