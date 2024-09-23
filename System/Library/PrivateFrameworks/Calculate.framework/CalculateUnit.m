@implementation CalculateUnit

- (id)locale
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  -[CalculateUnit category](self, "category");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locales");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    +[Localize systemLocale](Localize, "systemLocale");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (NSString)displayName
{
  NSString *displayName;
  void *v4;
  NSString *v5;
  void *v6;
  NSString *name;
  void *v8;
  NSString *v9;
  NSString *v10;

  displayName = self->_displayName;
  if (!displayName)
  {
    if (self->_unitType == 16)
    {
      -[CalculateUnit locale](self, "locale");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "displayNameForKey:value:", *MEMORY[0x1E0C997B8], self->_name);
      v5 = (NSString *)objc_claimAutoreleasedReturnValue();
      v6 = self->_displayName;
      self->_displayName = v5;
    }
    else
    {
      -[NSString stringByAppendingString:](self->_name, "stringByAppendingString:", CFSTR(" (Title)"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      name = self->_name;
      -[CalculateUnit locale](self, "locale");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[Localize localizationForLocale:](Localize, "localizationForLocale:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[Localize localizedStringForKey:value:table:localization:](Localize, "localizedStringForKey:value:table:localization:", v4, name, CFSTR("LocalizableUnitsOutput"), v8);
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      v10 = self->_displayName;
      self->_displayName = v9;

    }
    displayName = self->_displayName;
  }
  return displayName;
}

- (NSString)shortName
{
  NSString *shortName;
  NSString *v4;
  NSString *v5;

  shortName = self->_shortName;
  if (!shortName)
  {
    -[CalculateUnit localizedNameForFormat:](self, "localizedNameForFormat:", 2);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_shortName;
    self->_shortName = v4;

    shortName = self->_shortName;
  }
  return shortName;
}

- (id)localizedNameForFormat:(unint64_t)a3
{
  unint64_t v4;
  void *v5;
  void *v6;

  if (a3)
    v4 = a3;
  else
    v4 = 4;
  -[CalculateUnit locale](self, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CalculateUnit localizedNameForValue:locale:retainingFormat:unitFormat:](self, "localizedNameForValue:locale:retainingFormat:unitFormat:", v5, 0, v4, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isNumerator
{
  return -[CalculateUnit exponent](self, "exponent") >= 0;
}

- (BOOL)isDenominator
{
  return -[CalculateUnit exponent](self, "exponent") >> 31;
}

- (BOOL)isBaseUnit
{
  return -[UnitInfo isBaseUnit](self->_unitInfo, "isBaseUnit");
}

- (BOOL)isPreferredUnit
{
  return -[UnitInfo isPreferredUnit](self->_unitInfo, "isPreferredUnit");
}

- (CalculateUnit)nextSmallest
{
  void *v3;
  void *v4;
  CalculateUnit *v5;
  CalculateUnit *nextSmallest;
  uint64_t v7;
  CalculateUnit *v8;
  NSString *name;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;

  if (!self->_nextSmallest)
  {
    -[UnitInfo nextSmallest](self->_unitInfo, "nextSmallest");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[UnitInfo nextSmallest](self->_unitInfo, "nextSmallest");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (CalculateUnit *)objc_opt_new();
      nextSmallest = self->_nextSmallest;
      self->_nextSmallest = v5;

      objc_msgSend(v4, "name");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = self->_nextSmallest;
      name = v8->_name;
      v8->_name = (NSString *)v7;

      self->_nextSmallest->_exponent = self->_exponent;
      objc_storeStrong((id *)&self->_nextSmallest->_unitInfo, v4);
      objc_msgSend(v4, "typeInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(&unk_1E6EAD1D0, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        v13 = (int)objc_msgSend(v12, "intValue");
      else
        v13 = 1;
      self->_nextSmallest->_unitType = v13;

    }
  }
  return self->_nextSmallest;
}

- (BOOL)formatNextSmallest
{
  return -[UnitInfo formatNextSmallest](self->_unitInfo, "formatNextSmallest");
}

- (id)localizedNameForValue:(double)a3 locale:(id)a4 retainingFormat:(BOOL)a5 unitFormat:(unint64_t)a6
{
  _BOOL8 v7;
  id v10;
  void *v11;

  v7 = a5;
  v10 = a4;
  objc_msgSend((id)objc_opt_class(), "localizedNameForValue:locale:retainingFormat:unitFormat:unitType:name:", v10, v7, a6, self->_unitType, self->_name, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (int64_t)compare:(id)a3
{
  id v4;
  int v5;
  int v6;
  int64_t v7;
  int v8;
  int v9;

  v4 = a3;
  v5 = -[CalculateUnit unitType](self, "unitType");
  v6 = objc_msgSend(v4, "unitType");
  if (v5 < v6)
    v7 = -1;
  else
    v7 = v5 > v6;
  if (!v7)
  {
    v8 = -[CalculateUnit exponent](self, "exponent");
    v9 = objc_msgSend(v4, "exponent");
    if (v8 < v9)
      v7 = -1;
    else
      v7 = v8 > v9;
  }

  return v7;
}

- (NSString)displayNames
{
  void *v3;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *displayNames;
  NSString *v8;

  +[Localize systemLocale](Localize, "systemLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_displayNames || (-[NSLocale isEqual:](self->_displayNamesLocale, "isEqual:", v3) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_displayNamesLocale, v3);
    -[CalculateUnit name](self, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[Localize localizationForLocale:](Localize, "localizationForLocale:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[Localize localizedStringForKey:value:table:localization:](Localize, "localizedStringForKey:value:table:localization:", v4, 0, CFSTR("LocalizableUnits"), v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    displayNames = self->_displayNames;
    self->_displayNames = v6;

  }
  v8 = self->_displayNames;

  return v8;
}

- (BOOL)contains:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    if ((objc_msgSend(v4, "containsString:", CFSTR("|")) & 1) != 0)
    {
      v5 = 0;
    }
    else
    {
      -[CalculateUnit displayNames](self, "displayNames");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v6, "rangeOfString:options:", v4, 129) != 0x7FFFFFFFFFFFFFFFLL;

    }
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[CalculateUnit compare:](self, "compare:", v4) == 0;

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  if (-[CalculateUnit exponent](self, "exponent") == 1)
  {
    -[CalculateUnit name](self, "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[CalculateUnit name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@^%d"), v5, -[CalculateUnit exponent](self, "exponent"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (void)setShortName:(id)a3
{
  objc_storeStrong((id *)&self->_shortName, a3);
}

- (int)exponent
{
  return self->_exponent;
}

- (unint64_t)unitType
{
  return self->_unitType;
}

- (CalculateUnitCategory)category
{
  return (CalculateUnitCategory *)objc_loadWeakRetained((id *)&self->_category);
}

- (void)setCategory:(id)a3
{
  objc_storeWeak((id *)&self->_category, a3);
}

- (void)setNextSmallest:(id)a3
{
  objc_storeStrong((id *)&self->_nextSmallest, a3);
}

- (void)setDisplayNames:(id)a3
{
  objc_storeStrong((id *)&self->_displayNames, a3);
}

- (NSLocale)displayNamesLocale
{
  return self->_displayNamesLocale;
}

- (void)setDisplayNamesLocale:(id)a3
{
  objc_storeStrong((id *)&self->_displayNamesLocale, a3);
}

- (UnitInfo)unitInfo
{
  return self->_unitInfo;
}

- (void)setUnitInfo:(id)a3
{
  objc_storeStrong((id *)&self->_unitInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitInfo, 0);
  objc_storeStrong((id *)&self->_displayNamesLocale, 0);
  objc_storeStrong((id *)&self->_displayNames, 0);
  objc_storeStrong((id *)&self->_nextSmallest, 0);
  objc_destroyWeak((id *)&self->_category);
  objc_storeStrong((id *)&self->_shortName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (CalculateUnit)unitWithID:(int)a3 unitsInfo:(id)a4 exponent:(int)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  v7 = a4;
  v8 = objc_opt_new();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(v8 + 16);
  *(_QWORD *)(v8 + 16) = v10;

  *(_DWORD *)(v8 + 8) = a5;
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v12 = objc_claimAutoreleasedReturnValue();

  v13 = *(void **)(v8 + 80);
  *(_QWORD *)(v8 + 80) = v12;

  objc_msgSend(*(id *)(v8 + 80), "typeInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_1E6EAD1D0, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    v17 = (int)objc_msgSend(v16, "intValue");
  else
    v17 = 1;
  *(_QWORD *)(v8 + 40) = v17;

  return (CalculateUnit *)(id)v8;
}

+ (id)localizedNameForValue:(double)a3 locale:(id)a4 retainingFormat:(BOOL)a5 unitFormat:(unint64_t)a6 unitType:(unint64_t)a7 name:(id)a8
{
  _BOOL4 v11;
  id v13;
  id v14;
  void *v15;
  unint64_t v16;
  id v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  _BOOL4 v36;
  void *v37;
  char v38[16];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _OWORD src[32];
  _QWORD dst[4];

  v11 = a5;
  dst[1] = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a8;
  +[Localize localizationForLocale:](Localize, "localizationForLocale:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 4;
  if (a6)
    v16 = a6;
  if (a7 != 16 || v16 != 4)
  {
    if (v16 <= 3)
    {
      v18 = off_1E6EA0280[v16 - 1];
      goto LABEL_9;
    }
LABEL_8:
    v18 = CFSTR(" (Long)");
LABEL_9:
    objc_msgSend(v14, "stringByAppendingString:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[Localize localizedStringForKey:value:table:localization:](Localize, "localizedStringForKey:value:table:localization:", v19, &stru_1E6EA0F18, CFSTR("LocalizableUnitsOutput"), v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "isEqualToString:", v19))
    {
      objc_msgSend(CFSTR("%g "), "stringByAppendingString:", v14);
      v21 = objc_claimAutoreleasedReturnValue();

      v20 = (void *)v21;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v20, *(_QWORD *)&a3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%g"), *(_QWORD *)&a3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "rangeOfString:", v23);
    if (v24 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v26 = v22;
    }
    else
    {
      if (!v11)
      {
        objc_msgSend(v22, "stringByReplacingCharactersInRange:withString:", v24, v25, &stru_1E6EA0F18);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "stringByTrimmingCharactersInSet:", v29);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_17;
      }
      objc_msgSend(v22, "stringByReplacingCharactersInRange:withString:", v24, v25, CFSTR("%g"));
      v26 = (id)objc_claimAutoreleasedReturnValue();
    }
    v27 = v26;
LABEL_17:

    goto LABEL_18;
  }
  objc_msgSend(v13, "localeIdentifier");
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v17, "UTF8String");

  unum_open();
  dst[0] = 0;
  u_uastrncpy((UChar *)dst, (const char *)objc_msgSend(objc_retainAutorelease(v14), "UTF8String"), 3);
  memset(src, 0, sizeof(src));
  unum_formatDoubleCurrency();
  v36 = v11;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v45 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  *(_OWORD *)v38 = 0u;
  u_austrcpy(v38, (const UChar *)src);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v38);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "substringWithRange:", 0, 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "stringByReplacingOccurrencesOfString:withString:", v37, &stru_1E6EA0F18);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "stringByTrimmingCharactersInSet:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  unum_close();
  if (!v37)
  {
    v11 = v36;

    goto LABEL_8;
  }
  if (v36)
  {
    objc_msgSend(v31, "stringByReplacingOccurrencesOfString:withString:", v34, CFSTR("%g"));
    v35 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v35 = v37;
  }
  v27 = v35;

LABEL_18:
  return v27;
}

@end
