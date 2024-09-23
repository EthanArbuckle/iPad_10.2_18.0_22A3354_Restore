@implementation ABValuePredicate

- (ABValuePredicate)init
{
  ABValuePredicate *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ABValuePredicate;
  result = -[ABPredicate init](&v3, sel_init);
  if (result)
  {
    result->_comparison = 0;
    result->_property = -1;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ABValuePredicate;
  -[ABPredicate dealloc](&v3, sel_dealloc);
}

- (void)setValue:(id)a3
{
  NSObject *value;

  value = self->_value;
  if (value != a3)
  {

    self->_value = objc_msgSend(a3, "copy");
    objc_opt_class();
    self->_dictionaryValue = objc_opt_isKindOfClass() & 1;
  }
}

- (BOOL)isValid
{
  ABPropertyType TypeOfProperty;
  int property;
  unint64_t comparison;
  BOOL v6;
  uint64_t v7;
  char v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char isKindOfClass;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  TypeOfProperty = ABPersonGetTypeOfProperty(self->_property);
  property = self->_property;
  if (property == -1)
    return 0;
  if ((TypeOfProperty & 0xFFFFFEFF) == 4)
  {
    comparison = self->_comparison;
    v6 = comparison > 5;
    v7 = (1 << comparison) & 0x31;
    if (v6 || v7 == 0)
    {
      ABDiagnosticsEnabled();
      _ABLog2(3, (uint64_t)"-[ABValuePredicate isValid]", 69, 0, (uint64_t)CFSTR("Equality and inequalities are the only supported comparisons for date properties"), v19, v20, v21, v30);
      v9 = 0;
    }
    else
    {
      v9 = 1;
    }
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) == 0)
    {
      ABDiagnosticsEnabled();
      _ABLog2(3, (uint64_t)"-[ABValuePredicate isValid]", 73, 0, (uint64_t)CFSTR("Date properties can only be matched with dates"), v23, v24, v25, v30);
    }
    return v9 & isKindOfClass;
  }
  if (property != kABPersonPhoneProperty)
  {
    if ((TypeOfProperty & 0xFFFFFEFF) != 5)
      return 1;
    if (self->_dictionaryValue)
      return 1;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return 1;
    ABDiagnosticsEnabled();
    v26 = ABPersonNameForProperty(self->_property);
    _ABLog2(3, (uint64_t)"-[ABValuePredicate isValid]", 89, 0, (uint64_t)CFSTR("Dictionary properties like <%@> can only be compared to dictionaries or strings"), v27, v28, v29, (uint64_t)v26);
    return 0;
  }
  v10 = self->_comparison;
  objc_opt_class();
  v11 = objc_opt_isKindOfClass();
  if (v10 >= 2)
  {
    ABDiagnosticsEnabled();
    _ABLog2(3, (uint64_t)"-[ABValuePredicate isValid]", 80, 0, (uint64_t)CFSTR("Equality and prefix are the only supported comparison for the phone property."), v12, v13, v14, v30);
  }
  if ((v11 & 1) == 0)
  {
    ABDiagnosticsEnabled();
    _ABLog2(3, (uint64_t)"-[ABValuePredicate isValid]", 83, 0, (uint64_t)CFSTR("Phone numbers can only be compared to strings"), v15, v16, v17, v30);
  }
  return (v10 < 2) & v11;
}

- (id)querySelectPropertiesForPredicateIdentifier:(int)a3
{
  if (ABPersonGetTypeOfProperty(self->_property) == 261)
    return &unk_1E3CB97B0;
  else
    return 0;
}

- (id)queryJoinsInCompound:(BOOL)a3 predicateIdentifier:(int)a4
{
  _BOOL4 v4;
  const __CFString *v5;

  v4 = a3;
  if (ABPersonGetTypeOfProperty(self->_property) != 261)
    return 0;
  if (v4)
    v5 = CFSTR("LEFT OUTER JOIN ABMultiValue abv ON abp.ROWID = abv.record_id");
  else
    v5 = CFSTR("JOIN ABMultiValue abv ON abp.ROWID = abv.record_id");
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v5);
}

- (BOOL)_shouldConsultIndexForKey:(id)a3
{
  const __CFArray *ArrayOfAllFTSPropertyIDs;
  CFIndex Count;
  int v7;
  int v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CFRange v18;

  ArrayOfAllFTSPropertyIDs = (const __CFArray *)_ABPersonGetArrayOfAllFTSPropertyIDs();
  Count = CFArrayGetCount(ArrayOfAllFTSPropertyIDs);
  v7 = -[ABValuePredicate property](self, "property");
  v18.location = 0;
  v18.length = Count;
  v8 = CFArrayContainsValue(ArrayOfAllFTSPropertyIDs, v18, (const void *)v7);
  if (v8)
  {
    if (-[ABValuePredicate property](self, "property") == kABPersonSocialProfileProperty)
    {
      v9 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("identifier"), CFSTR("username"), 0, v12, v13, v14, v15, v16, v17);
    }
    else if (-[ABValuePredicate property](self, "property") == kABPersonAddressProperty)
    {
      v9 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("State"), CFSTR("City"), CFSTR("CountryCode"), CFSTR("Country"), CFSTR("ZIP"), CFSTR("Street"), CFSTR("SubLocality"), CFSTR("SubAdministrativeArea"), 0);
    }
    else
    {
      if (-[ABValuePredicate property](self, "property") != kABPersonInstantMessageProperty)
        goto LABEL_10;
      v9 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("username"), 0, v11, v12, v13, v14, v15, v16, v17);
    }
    if (v9)
    {
      LOBYTE(v8) = objc_msgSend(v9, "containsObject:", a3);
      return v8;
    }
LABEL_10:
    LOBYTE(v8) = 1;
  }
  return v8;
}

- (BOOL)_supportsFTSSearch
{
  uint64_t v3;
  unint64_t comparison;
  ABPropertyType TypeOfProperty;
  NSArray *orderedKeys;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  LODWORD(v3) = ABCFTSIsEnabled();
  if (!(_DWORD)v3)
    return v3;
  comparison = self->_comparison;
  TypeOfProperty = ABPersonGetTypeOfProperty(self->_property);
  if (TypeOfProperty == 1)
  {
    if (self->_value)
      v10 = comparison >= 2;
    else
      v10 = 1;
    if (v10)
      goto LABEL_20;
    goto LABEL_23;
  }
  if (TypeOfProperty == 257)
  {
    if (comparison > 1)
    {
LABEL_20:
      LOBYTE(v3) = 0;
      return v3;
    }
LABEL_23:
    LOBYTE(v3) = -[ABValuePredicate _shouldConsultIndexForKey:](self, "_shouldConsultIndexForKey:", 0);
    return v3;
  }
  if (TypeOfProperty != 261 || comparison > 1)
    goto LABEL_20;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  orderedKeys = self->_orderedKeys;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](orderedKeys, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v7 = v3;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(orderedKeys);
        if (-[ABValuePredicate _shouldConsultIndexForKey:](self, "_shouldConsultIndexForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i)))
        {
          LOBYTE(v3) = 1;
          return v3;
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](orderedKeys, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      LOBYTE(v3) = 0;
      if (v7)
        continue;
      break;
    }
  }
  return v3;
}

- (BOOL)_allowsLaxCheckingForFTS
{
  return -[ABValuePredicate property](self, "property") == kABPersonPhoneProperty;
}

- (id)queryWhereStringForPredicateIdentifier:(int)a3
{
  ABPropertyType TypeOfProperty;
  ABPropertyType v5;
  const __CFString *v6;
  void *v7;
  NSObject *value;
  uint64_t v9;
  uint64_t v10;
  char v11;
  _BOOL4 v12;
  const __CFString *v13;
  __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  id result;
  const __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  const __CFString *v22;
  const __CFString *v23;

  TypeOfProperty = ABPersonGetTypeOfProperty(self->_property);
  v5 = TypeOfProperty;
  switch(self->_comparison)
  {
    case 0:
      if ((TypeOfProperty & 0xFFFFFEFF) == 4)
      {
        v6 = CFSTR("BETWEEN ? AND ?");
        goto LABEL_20;
      }
      v6 = CFSTR("LIKE ?");
      if (TypeOfProperty != 1)
        break;
      if (!self->_value)
        v6 = CFSTR("IS NULL");
      v15 = ABPersonNameForProperty(self->_property);
      goto LABEL_37;
    case 1:
    case 2:
    case 3:
      v6 = CFSTR("LIKE ?");
      break;
    case 4:
      v6 = CFSTR("> ?");
      break;
    case 5:
      v6 = CFSTR("< ?");
      break;
    default:
      v6 = 0;
      break;
  }
  if (TypeOfProperty == 261)
  {
    if (!self->_dictionaryValue)
      return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("((SELECT COUNT() FROM ABMultiValue JOIN ABMultiValueEntry abve ON abve.parent_id = abv.UID WHERE (abp.ROWID = abv.record_id AND abv.property+0 = ? AND abve.value %@) LIMIT 1) > 0)"), v6, v20, v21);
    v22 = v6;
    v7 = (void *)objc_opt_new();
    v23 = ABCPersonNameForProperty(-[ABValuePredicate property](self, "property"));
    objc_msgSend(v7, "appendString:", CFSTR("(abv.ROWID IN ("));
    value = self->_value;
    v9 = -[NSObject count](value, "count");

    self->_orderedKeys = (NSArray *)(id)-[NSObject allKeys](value, "allKeys");
    if (v9 < 1)
    {
      v11 = 0;
    }
    else
    {
      v10 = 0;
      v11 = 0;
      do
      {
        -[NSObject objectForKey:](value, "objectForKey:", -[NSArray objectAtIndex:](self->_orderedKeys, "objectAtIndex:", v10));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (v10)
            objc_msgSend(v7, "appendString:", CFSTR(" INTERSECT "));
          v12 = -[ABValuePredicate _supportsFTSSearch](self, "_supportsFTSSearch");
          v13 = CFSTR("(SELECT ROWID FROM ABPerson)");
          if (v12)
            v13 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(SELECT rowid FROM ABPersonFullTextSearch WHERE %@ MATCH ?)"), v23);
          objc_msgSend(v7, "appendFormat:", CFSTR("SELECT parent_id FROM ABMultiValueEntry mve JOIN ABMultiValueEntryKey mvk NOT INDEXED ON mve.key = mvk.rowid WHERE mve.ROWID IN (SELECT ROWID FROM ABMultiValueEntry WHERE parent_id IN (SELECT UID FROM ABMultiValue WHERE record_id IN %@ )) AND mvk.value = ? AND mve.value LIKE ?"), v13);
          v11 = 1;
        }
        ++v10;
      }
      while (v9 != v10);
    }
    objc_msgSend(v7, "appendString:", CFSTR("))"));
    result = v7;
    v6 = v22;
    if ((v11 & 1) == 0)
      return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("((SELECT COUNT() FROM ABMultiValue JOIN ABMultiValueEntry abve ON abve.parent_id = abv.UID WHERE (abp.ROWID = abv.record_id AND abv.property+0 = ? AND abve.value %@) LIMIT 1) > 0)"), v6, v20, v21);
  }
  else
  {
LABEL_20:
    if ((TypeOfProperty & 0x100) != 0)
    {
      v16 = CFSTR("value COLLATE NOCASE");
      if ((TypeOfProperty & 0xFFFFFEFF) == 4)
        v16 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CAST(%@ AS NUMERIC)"), CFSTR("value COLLATE NOCASE"));
      if (-[ABValuePredicate _supportsFTSSearch](self, "_supportsFTSSearch"))
      {
        v17 = ABCPersonNameForProperty(-[ABValuePredicate property](self, "property"));
        if (-[ABValuePredicate _allowsLaxCheckingForFTS](self, "_allowsLaxCheckingForFTS"))
          return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ROWID IN (SELECT rowid FROM ABPersonFullTextSearch fts WHERE fts.%@ MATCH ?)"), v17, v20, v21);
        else
          return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ROWID IN (SELECT abv.record_id FROM ABPersonFullTextSearch fts JOIN ABMultiValue abv ON abv.record_id = fts.rowid WHERE fts.%@ MATCH ? AND abv.%@ %@)"), v17, v16, v6);
      }
      else
      {
        return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ROWID IN (select record_id from ABMultiValue where property = ? and %@ %@)"), v16, v6, v21);
      }
    }
    else
    {
      v14 = (__CFString *)ABPersonNameForProperty(self->_property);
      if (v5 == 4)
      {
        v15 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CAST(%@ AS NUMERIC)"), v14);
LABEL_37:
        v14 = (__CFString *)v15;
      }
      if (-[ABValuePredicate _supportsFTSSearch](self, "_supportsFTSSearch"))
      {
        v19 = ABCPersonNameForProperty(-[ABValuePredicate property](self, "property"));
        if (-[ABValuePredicate _allowsLaxCheckingForFTS](self, "_allowsLaxCheckingForFTS"))
          return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ROWID IN (SELECT rowid FROM ABPersonFullTextSearch WHERE %@ MATCH ?)"), v19, v20, v21);
        else
          return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ROWID IN (SELECT rowid FROM ABPersonFullTextSearch WHERE %@ MATCH ? AND %@ %@)"), v19, v14, v6);
      }
      else
      {
        return (id)-[__CFString stringByAppendingFormat:](v14, "stringByAppendingFormat:", CFSTR(" %@"), v6);
      }
    }
  }
  return result;
}

+ (id)stringForComparison:(id)a3 withComparision:(int64_t)a4
{
  __CFString *v4;

  switch(a4)
  {
    case 3:
      v4 = (__CFString *)objc_msgSend(CFSTR("%"), "stringByAppendingString:", a3);
      a3 = CFSTR("%");
      return (id)-[__CFString stringByAppendingString:](v4, "stringByAppendingString:", a3);
    case 2:
      v4 = CFSTR("%");
      return (id)-[__CFString stringByAppendingString:](v4, "stringByAppendingString:", a3);
    case 1:
      v4 = (__CFString *)a3;
      a3 = CFSTR("%");
      return (id)-[__CFString stringByAppendingString:](v4, "stringByAppendingString:", a3);
  }
  return a3;
}

- (id)stringForComparison:(id)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "stringForComparison:withComparision:", a3, self->_comparison);
}

- (id)_ftsTermStringForString:(id)a3
{
  const __CFString *v5;
  const __CFString *v6;

  if (-[ABValuePredicate comparison](self, "comparison") == 3
    || -[ABValuePredicate comparison](self, "comparison") == 2)
  {
    v5 = CFSTR("*");
  }
  else
  {
    v5 = &stru_1E3CA4E68;
  }
  if (-[ABValuePredicate comparison](self, "comparison") == 3
    || -[ABValuePredicate comparison](self, "comparison") == 1)
  {
    v6 = CFSTR("*");
  }
  else
  {
    v6 = &stru_1E3CA4E68;
  }
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("##&%@%@%@"), v5, a3, v6);
}

- (id)_ftsTokenizedTermStringForString:(id)a3
{
  const __CFArray *v5;
  const __CFArray *v6;
  const __CFString *ValueAtIndex;
  const __CFLocale *v8;
  __CFStringTokenizer *v9;
  const void *v10;
  void *v11;
  uint64_t Count;
  uint64_t v13;
  uint64_t i;
  CFRange v16;

  v5 = CFLocaleCopyPreferredLanguages();
  if (v5)
  {
    v6 = v5;
    if (CFArrayGetCount(v5))
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v6, 0);
      v8 = CFLocaleCreate(0, ValueAtIndex);
      CFRelease(v6);
      if (v8)
        goto LABEL_7;
    }
    else
    {
      CFRelease(v6);
    }
  }
  v8 = CFLocaleCopyCurrent();
LABEL_7:
  v16.location = 0;
  v16.length = 0;
  v9 = CFStringTokenizerCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &stru_1E3CA4E68, v16, 0, v8);
  v10 = (const void *)ABTokenListCreate();
  ABTokenListPopulateFromString((uint64_t)v10, v9, 0, (const __CFString *)a3, 0, 1, 0);
  v11 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  Count = ABTokenListGetCount((uint64_t)v10);
  if (Count >= 1)
  {
    v13 = Count;
    for (i = 0; i != v13; ++i)
      objc_msgSend(v11, "appendFormat:", CFSTR("%@ "), -[ABValuePredicate _ftsTermStringForString:](self, "_ftsTermStringForString:", ABTokenListGetTokenAtIndex((uint64_t)v10, i)));
  }
  if (v8)
    CFRelease(v8);
  CFRelease(v9);
  CFRelease(v10);
  return v11;
}

- (id)_ftsAllQueryStrings
{
  void *v3;
  NSArray *orderedKeys;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  orderedKeys = self->_orderedKeys;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](orderedKeys, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(orderedKeys);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (-[ABValuePredicate _shouldConsultIndexForKey:](self, "_shouldConsultIndexForKey:", v9))
          objc_msgSend(v3, "appendFormat:", CFSTR("%@ "), -[NSObject objectForKey:](self->_value, "objectForKey:", v9));
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](orderedKeys, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  return -[ABValuePredicate _ftsTokenizedTermStringForString:](self, "_ftsTokenizedTermStringForString:", v3);
}

- (void)ab_bindWhereClauseComponentOfStatement:(CPSqliteStatement *)a3 withBindingOffset:(int *)a4 predicateIdentifier:(int)a5
{
  ABPropertyType TypeOfProperty;
  NSObject *value;
  NSArray *orderedKeys;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  id v16;
  char v17;
  char isKindOfClass;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int64_t comparison;
  _BOOL4 v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (self->_value)
  {
    TypeOfProperty = ABPersonGetTypeOfProperty(self->_property);
    v25 = -[ABValuePredicate _supportsFTSSearch](self, "_supportsFTSSearch");
    if (TypeOfProperty == 261 && self->_dictionaryValue)
    {
      value = self->_value;
      orderedKeys = self->_orderedKeys;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](orderedKeys, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v28 != v12)
              objc_enumerationMutation(orderedKeys);
            v14 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
            v15 = -[NSObject objectForKey:](value, "objectForKey:", v14);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v16 = -[ABValuePredicate stringForComparison:](self, "stringForComparison:", v15);
              if (v25)
                -[ABPredicate bindString:toStatement:withBindingOffset:](self, "bindString:toStatement:withBindingOffset:", -[ABValuePredicate _ftsAllQueryStrings](self, "_ftsAllQueryStrings"), a3, a4);
              -[ABPredicate bindString:toStatement:withBindingOffset:](self, "bindString:toStatement:withBindingOffset:", v14, a3, a4);
              -[ABPredicate bindString:toStatement:withBindingOffset:](self, "bindString:toStatement:withBindingOffset:", v16, a3, a4);
            }
          }
          v11 = -[NSArray countByEnumeratingWithState:objects:count:](orderedKeys, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        }
        while (v11);
      }
    }
    else
    {
      v17 = v25;
      if ((TypeOfProperty & 0x100) == 0)
        v17 = 1;
      if ((v17 & 1) == 0)
      {
        sqlite3_bind_int(a3->var1, *a4, self->_property);
        ++*a4;
      }
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v19 = self->_value;
      if ((isKindOfClass & 1) != 0)
      {
        if (!v25
          || (-[ABPredicate bindString:toStatement:withBindingOffset:](self, "bindString:toStatement:withBindingOffset:", -[ABValuePredicate _ftsTokenizedTermStringForString:](self, "_ftsTokenizedTermStringForString:", self->_value), a3, a4), !-[ABValuePredicate _allowsLaxCheckingForFTS](self, "_allowsLaxCheckingForFTS")))
        {
          -[ABPredicate bindString:toStatement:withBindingOffset:](self, "bindString:toStatement:withBindingOffset:", -[ABValuePredicate stringForComparison:](self, "stringForComparison:", v19), a3, a4);
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v20 = (void *)objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
          v21 = (void *)objc_msgSend(v20, "components:fromDate:", 254, self->_value);
          objc_msgSend(v20, "setTimeZone:", objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0));
          objc_msgSend(v21, "setHour:", 12);
          objc_msgSend(v21, "setMinute:", 0);
          objc_msgSend(v21, "setSecond:", 0);
          v22 = (void *)objc_msgSend(v20, "dateFromComponents:", v21);
          v23 = v22;
          comparison = self->_comparison;
          if (comparison == 5 || !comparison)
          {
            objc_msgSend((id)objc_msgSend(v22, "dateByAddingTimeInterval:", -43200.0), "timeIntervalSinceReferenceDate");
            -[ABPredicate bindDouble:toStatement:withBindingOffset:](self, "bindDouble:toStatement:withBindingOffset:", a3, a4);
            comparison = self->_comparison;
          }
          if ((comparison | 4) == 4)
          {
            objc_msgSend((id)objc_msgSend(v23, "dateByAddingTimeInterval:", 43200.0), "timeIntervalSinceReferenceDate");
            -[ABPredicate bindDouble:toStatement:withBindingOffset:](self, "bindDouble:toStatement:withBindingOffset:", a3, a4);
          }
        }
      }
    }
  }
}

- (id)predicateFormat
{
  unint64_t comparison;
  __CFString *v3;
  NSObject *value;

  comparison = self->_comparison;
  if (comparison > 5)
    v3 = 0;
  else
    v3 = off_1E3CA3D40[comparison];
  if (self->_value)
    value = self->_value;
  else
    value = CFSTR("nil");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ABPredicate %p - Value matching (%@): %@ %@"), self, v3, value, ABPersonNameForProperty(self->_property));
}

- (int)property
{
  return self->_property;
}

- (void)setProperty:(int)a3
{
  self->_property = a3;
}

- (int64_t)comparison
{
  return self->_comparison;
}

- (void)setComparison:(int64_t)a3
{
  self->_comparison = a3;
}

- (NSObject)value
{
  return self->_value;
}

@end
