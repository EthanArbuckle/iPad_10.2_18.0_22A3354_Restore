@implementation CalculateUnitCategory

- (unint64_t)unitType
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[CalculateUnitCategory name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_1E6EAD1D0, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (int)objc_msgSend(v3, "intValue");

  return v4;
}

- (NSString)name
{
  void *v2;
  void *v3;

  -[CalculateUnitCategory typeInfo](self, "typeInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)locale
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[CalculateUnitCategory collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "locales");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    +[Localize systemLocale](Localize, "systemLocale");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (NSString)displayName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CalculateUnitCategory name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalculateUnitCategory locale](self, "locale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[Localize localizationForLocale:](Localize, "localizationForLocale:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[Localize localizedStringForKey:value:table:localization:](Localize, "localizedStringForKey:value:table:localization:", v3, 0, CFSTR("Localizable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)_findPreferredSIUnit:(id *)a3 metric:(id *)a4 US:(id *)a5 UK:(id *)a6
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  id *v23;
  void *v24;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[CalculateUnitCategory units](self, "units");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v33 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        if (objc_msgSend(v14, "isPreferredUnit"))
        {
          objc_msgSend(v14, "unitInfo");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "measurementSystem");

          if (!v16)
            ++v11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[CalculateUnitCategory units](self, "units");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v29 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
        if (objc_msgSend(v22, "isPreferredUnit"))
        {
          if (v11 < 2 || (v23 = a4, objc_msgSend(v22, "isBaseUnit")))
          {
            objc_msgSend(v22, "unitInfo");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "measurementSystem");

            v23 = a3;
            switch((unint64_t)a3)
            {
              case 0uLL:
                goto LABEL_25;
              case 1uLL:
                v23 = a4;
                goto LABEL_25;
              case 2uLL:
                v23 = a5;
                goto LABEL_25;
              case 3uLL:
                v23 = a6;
                goto LABEL_25;
              default:
                continue;
            }
          }
          else
          {
LABEL_25:
            *v23 = objc_retainAutorelease(v22);
          }
        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v19);
  }

}

- (id)preferredUnits
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  id v17;
  void *v18;
  char v19;
  void *v20;
  int v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  -[CalculateUnitCategory locale](self, "locale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0C997F0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  if (-[CalculateUnitCategory unitType](self, "unitType") != 16)
  {
    v37 = 0;
    v38 = 0;
    v35 = 0;
    v36 = 0;
    -[CalculateUnitCategory _findPreferredSIUnit:metric:US:UK:](self, "_findPreferredSIUnit:metric:US:UK:", &v38, &v37, &v36, &v35);
    v6 = v38;
    v23 = v37;
    v24 = v36;
    v10 = v35;
    if (v6)
      objc_msgSend(v5, "addObject:", v6);
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C99800]))
    {
      if (v10)
        objc_msgSend(v5, "addObject:", v10);
      if (v23)
        objc_msgSend(v5, "addObject:", v23);
      v26 = v24;
      if (!v24)
        goto LABEL_50;
      goto LABEL_48;
    }
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C997F8]))
    {
      if (v23)
        objc_msgSend(v5, "addObject:", v23);
      if (v24)
      {
        v27 = v5;
        v28 = v24;
LABEL_46:
        objc_msgSend(v27, "addObject:", v28);
      }
    }
    else
    {
      if (v24)
        objc_msgSend(v5, "addObject:", v24);
      if (v23)
      {
        v27 = v5;
        v28 = v23;
        goto LABEL_46;
      }
    }
    v26 = v10;
    if (!v10)
      goto LABEL_50;
LABEL_48:
    v25 = v5;
    goto LABEL_49;
  }
  objc_msgSend(v3, "currencyCode");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  -[CalculateUnitCategory units](self, "units");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (!v8)
  {

    objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C99808]);
    v10 = 0;
    v24 = 0;
    v23 = 0;
    goto LABEL_50;
  }
  v9 = v8;
  v30 = v4;
  v31 = v5;
  v32 = v3;
  v33 = 0;
  v34 = 0;
  v10 = 0;
  v11 = *(_QWORD *)v40;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v40 != v11)
        objc_enumerationMutation(v7);
      v13 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
      if (v6
        && (objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "name"),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            v15 = objc_msgSend(v14, "isEqualToString:", v6),
            v14,
            (v15 & 1) != 0))
      {
        v16 = v33;
        v17 = v10;
        v33 = v13;
      }
      else
      {
        objc_msgSend(v13, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("EUR"));

        if ((v19 & 1) != 0)
        {
          v16 = v34;
          v34 = v13;
          v17 = v10;
        }
        else
        {
          objc_msgSend(v13, "name");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("USD"));

          v16 = v10;
          v17 = v13;
          if (!v21)
            continue;
        }
      }
      v22 = v13;

      v10 = v17;
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  }
  while (v9);

  v5 = v31;
  v23 = v33;
  if (v33)
    objc_msgSend(v31, "addObject:", v33);
  v4 = v30;
  v3 = v32;
  v24 = v34;
  if ((objc_msgSend(v30, "isEqualToString:", *MEMORY[0x1E0C99808]) & 1) == 0)
  {
    if (v34)
      objc_msgSend(v31, "addObject:", v34);
    if (!v10)
      goto LABEL_50;
    v25 = v31;
    v26 = v10;
LABEL_49:
    objc_msgSend(v25, "addObject:", v26);
    goto LABEL_50;
  }
  if (v10)
    objc_msgSend(v31, "addObject:", v10);
  if (v34)
  {
    v25 = v31;
    v26 = v34;
    goto LABEL_49;
  }
LABEL_50:

  return v5;
}

- (CalculateUnit)preferredFromUnit
{
  void *v2;
  void *v3;

  -[CalculateUnitCategory preferredUnits](self, "preferredUnits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CalculateUnit *)v3;
}

- (CalculateUnit)preferredToUnit
{
  void *v2;
  void *v3;

  -[CalculateUnitCategory preferredUnits](self, "preferredUnits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CalculateUnit *)v3;
}

- (BOOL)contains:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v4, "decomposedStringWithCanonicalMapping");
    v5 = objc_claimAutoreleasedReturnValue();

    -[CalculateUnitCategory displayName](self, "displayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "rangeOfString:options:", v5, 129) != 0x7FFFFFFFFFFFFFFFLL;

    v4 = (id)v5;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (id)findUnitWithName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[CalculateUnitCategory units](self, "units", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)findUnitsWithQuery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[CalculateUnitCategory units](self, "units", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "contains:", v4))
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (CalculateUnitCategory)initWithTypeInfo:(id)a3 unitsInfo:(id)a4 collection:(id)a5
{
  id v8;
  id v9;
  id v10;
  CalculateUnitCategory *v11;
  CalculateUnitCategory *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)CalculateUnitCategory;
  v11 = -[CalculateUnitCategory init](&v26, sel_init);
  v12 = v11;
  if (v11)
  {
    v21 = v10;
    -[CalculateUnitCategory setCollection:](v11, "setCollection:", v10);
    -[CalculateUnitCategory setTypeInfo:](v12, "setTypeInfo:", v8);
    v13 = (void *)objc_opt_new();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v8, "units");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v23;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v23 != v17)
            objc_enumerationMutation(v14);
          +[CalculateUnit unitWithID:unitsInfo:exponent:](CalculateUnit, "unitWithID:unitsInfo:exponent:", objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v18), "unitID"), v9, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setCategory:", v12);
          objc_msgSend(v13, "addObject:", v19);

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v16);
    }

    -[CalculateUnitCategory setUnits:](v12, "setUnits:", v13);
    v10 = v21;
  }

  return v12;
}

- (NSArray)units
{
  return self->_units;
}

- (void)setUnits:(id)a3
{
  objc_storeStrong((id *)&self->_units, a3);
}

- (UnitTypeInfo)typeInfo
{
  return self->_typeInfo;
}

- (void)setTypeInfo:(id)a3
{
  objc_storeStrong((id *)&self->_typeInfo, a3);
}

- (CalculateUnitCollection)collection
{
  return (CalculateUnitCollection *)objc_loadWeakRetained((id *)&self->_collection);
}

- (void)setCollection:(id)a3
{
  objc_storeWeak((id *)&self->_collection, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_collection);
  objc_storeStrong((id *)&self->_typeInfo, 0);
  objc_storeStrong((id *)&self->_units, 0);
}

+ (id)categoryWithTypeInfo:(id)a3 unitsInfo:(id)a4 collection:(id)a5
{
  id v7;
  id v8;
  id v9;
  CalculateUnitCategory *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[CalculateUnitCategory initWithTypeInfo:unitsInfo:collection:]([CalculateUnitCategory alloc], "initWithTypeInfo:unitsInfo:collection:", v9, v8, v7);

  return v10;
}

@end
