@implementation EKRecurrenceHelper

- (NSArray)weeksOfTheYear
{
  -[EKRecurrenceHelper _parseSpecifierIfNeeded](self, "_parseSpecifierIfNeeded");
  return (NSArray *)(id)-[NSArray copy](self->_weeksOfTheYear, "copy");
}

- (NSArray)setPositions
{
  -[EKRecurrenceHelper _parseSpecifierIfNeeded](self, "_parseSpecifierIfNeeded");
  return (NSArray *)(id)-[NSArray copy](self->_setPositions, "copy");
}

- (NSArray)monthsOfTheYear
{
  -[EKRecurrenceHelper _parseSpecifierIfNeeded](self, "_parseSpecifierIfNeeded");
  return (NSArray *)(id)-[NSArray copy](self->_monthsOfTheYear, "copy");
}

- (EKRecurrenceHelper)initWithSpecifier:(id)a3
{
  id v4;
  EKRecurrenceHelper *v5;
  uint64_t v6;
  NSString *specifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKRecurrenceHelper;
  v5 = -[EKRecurrenceHelper init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    specifier = v5->_specifier;
    v5->_specifier = (NSString *)v6;

  }
  return v5;
}

- (NSArray)daysOfTheYear
{
  -[EKRecurrenceHelper _parseSpecifierIfNeeded](self, "_parseSpecifierIfNeeded");
  return (NSArray *)(id)-[NSArray copy](self->_daysOfTheYear, "copy");
}

- (NSArray)daysOfTheWeek
{
  -[EKRecurrenceHelper _parseSpecifierIfNeeded](self, "_parseSpecifierIfNeeded");
  return (NSArray *)(id)-[NSArray copy](self->_daysOfTheWeek, "copy");
}

- (void)_parseSpecifierIfNeeded
{
  EKRecurrenceHelper *v2;
  uint64_t v3;
  unint64_t v4;
  const __CFString *specifier;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  int64_t v8;
  int64_t v9;
  unsigned int v10;
  int64_t v11;
  UniChar *v12;
  int64_t v13;
  int v14;
  uint64_t v16;
  int64_t v17;
  int64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  int64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int64_t v28;
  int64_t v29;
  int64_t v30;
  int64_t v31;
  int64_t v32;
  int64_t v33;
  uint64_t v34;
  NSArray *setPositions;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  EKRecurrenceHelper *v41;
  UniChar buffer[8];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  CFStringRef theString;
  UniChar *v51;
  const char *v52;
  uint64_t v53;
  int64_t v54;
  int64_t v55;
  int64_t v56;
  CFRange v57;
  CFRange v58;

  if (!self->_parsed)
  {
    v2 = self;
    -[EKRecurrenceHelper _clearArrays](self, "_clearArrays");
    v3 = -[NSString length](v2->_specifier, "length");
    if (!v3)
      goto LABEL_74;
    v4 = v3;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    *(_OWORD *)buffer = 0u;
    v43 = 0u;
    specifier = (const __CFString *)v2->_specifier;
    theString = specifier;
    v53 = 0;
    v54 = v3;
    CharactersPtr = CFStringGetCharactersPtr(specifier);
    CStringPtr = 0;
    v51 = (UniChar *)CharactersPtr;
    if (!CharactersPtr)
      CStringPtr = CFStringGetCStringPtr(specifier, 0x600u);
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v55 = 0;
    v56 = 0;
    v52 = CStringPtr;
    v41 = v2;
    while (1)
    {
      if (v8 < 0 || (v11 = v54, v54 <= v8))
      {
        v14 = 0;
        goto LABEL_12;
      }
      v12 = v51;
      if (v51)
      {
        v13 = v53 + v8;
      }
      else
      {
        if (v52)
        {
          v14 = v52[v53 + v8];
          goto LABEL_18;
        }
        if (v56 <= v8 || (v32 = v55, v55 > v8))
        {
          v33 = v8 - 4;
          if ((unint64_t)v8 < 4)
            v33 = 0;
          if (v33 + 64 < v54)
            v11 = v33 + 64;
          v55 = v33;
          v56 = v11;
          v58.location = v53 + v33;
          v58.length = v11 - v33;
          CFStringGetCharacters(theString, v58, buffer);
          v32 = v55;
        }
        v13 = v8 - v32;
        v12 = buffer;
      }
      v14 = v12[v13];
LABEL_18:
      if ((unsigned __int16)v14 != 61)
        goto LABEL_12;
      if (v8 - v9 != 1 && v8 - v9 < 3)
        v16 = 0;
      else
        v16 = v10;
      v17 = v8 + 1;
      if (v8 + 1 >= v4)
      {
        v14 = 61;
        ++v8;
        goto LABEL_59;
      }
      v18 = ~v8;
      v19 = v8 + 65;
      v20 = v8 + 1;
      while (1)
      {
        v21 = v8 + 1;
        v22 = v20 >= 4 ? 4 : v20;
        if ((v21 & 0x8000000000000000) == 0)
        {
          v23 = v54;
          if (v54 > v21)
            break;
        }
        v14 = 0;
LABEL_46:
        ++v20;
        --v18;
        ++v19;
        ++v8;
        if (v4 - 1 == v21)
        {
          v8 = v4;
          goto LABEL_58;
        }
      }
      if (v51)
      {
        v14 = v51[v8 + 1 + v53];
      }
      else if (v52)
      {
        v14 = v52[v53 + 1 + v8];
      }
      else
      {
        if (v56 <= v21 || (v24 = v55, v55 > v21))
        {
          v25 = -v22;
          v26 = v16;
          v27 = v22 + v18;
          v28 = v19 - v22;
          v29 = v8 + v25;
          v30 = v29 + 1;
          v31 = v29 + 65;
          if (v31 >= v54)
            v31 = v54;
          v55 = v30;
          v56 = v31;
          if (v54 >= v28)
            v23 = v28;
          v57.length = v23 + v27;
          v57.location = v30 + v53;
          CFStringGetCharacters(theString, v57, buffer);
          v16 = v26;
          v24 = v55;
        }
        v14 = buffer[v8 + 1 - v24];
      }
      if ((unsigned __int16)v14 != 59)
        goto LABEL_46;
      ++v8;
      v14 = 59;
LABEL_58:
      v2 = v41;
LABEL_59:
      if ((unsigned __int16)v16 > 0x52u)
      {
        switch((unsigned __int16)v16)
        {
          case 'S':
            -[EKRecurrenceHelper _parseIndexList:range:](v2, "_parseIndexList:range:", buffer, v17, v8 - v17);
            v39 = objc_claimAutoreleasedReturnValue();
            setPositions = v2->_setPositions;
            v2->_setPositions = (NSArray *)v39;
            break;
          case 'W':
            -[EKRecurrenceHelper _parseIndexList:range:](v2, "_parseIndexList:range:", buffer, v17, v8 - v17);
            v40 = objc_claimAutoreleasedReturnValue();
            setPositions = v2->_weeksOfTheYear;
            v2->_weeksOfTheYear = (NSArray *)v40;
            break;
          case 'Y':
            -[EKRecurrenceHelper _parseIndexList:range:](v2, "_parseIndexList:range:", buffer, v17, v8 - v17);
            v36 = objc_claimAutoreleasedReturnValue();
            setPositions = v2->_daysOfTheYear;
            v2->_daysOfTheYear = (NSArray *)v36;
            break;
          default:
            goto LABEL_73;
        }
        goto LABEL_72;
      }
      switch((unsigned __int16)v16)
      {
        case 'D':
          -[EKRecurrenceHelper _parseDaysOfWeek:range:](v2, "_parseDaysOfWeek:range:", buffer, v17, v8 - v17);
          v37 = objc_claimAutoreleasedReturnValue();
          setPositions = v2->_daysOfTheWeek;
          v2->_daysOfTheWeek = (NSArray *)v37;
LABEL_72:

          break;
        case 'M':
          -[EKRecurrenceHelper _parseIndexList:range:](v2, "_parseIndexList:range:", buffer, v17, v8 - v17);
          v38 = objc_claimAutoreleasedReturnValue();
          setPositions = v2->_daysOfTheMonth;
          v2->_daysOfTheMonth = (NSArray *)v38;
          goto LABEL_72;
        case 'O':
          -[EKRecurrenceHelper _parseIndexList:range:](v2, "_parseIndexList:range:", buffer, v17, v8 - v17);
          v34 = objc_claimAutoreleasedReturnValue();
          setPositions = v2->_monthsOfTheYear;
          v2->_monthsOfTheYear = (NSArray *)v34;
          goto LABEL_72;
      }
LABEL_73:
      v10 = 0;
      v9 = v8 + 1;
LABEL_12:
      if (((++v8 - v9) | 2) == 3)
        v10 = v14;
      if (v8 >= v4)
      {
LABEL_74:
        v2->_parsed = 1;
        return;
      }
    }
  }
}

- (NSArray)daysOfTheMonth
{
  -[EKRecurrenceHelper _parseSpecifierIfNeeded](self, "_parseSpecifierIfNeeded");
  return (NSArray *)(id)-[NSArray copy](self->_daysOfTheMonth, "copy");
}

- (void)_clearArrays
{
  NSArray *daysOfTheWeek;
  NSArray *daysOfTheMonth;
  NSArray *daysOfTheYear;
  NSArray *weeksOfTheYear;
  NSArray *monthsOfTheYear;
  NSArray *setPositions;

  daysOfTheWeek = self->_daysOfTheWeek;
  self->_daysOfTheWeek = 0;

  daysOfTheMonth = self->_daysOfTheMonth;
  self->_daysOfTheMonth = 0;

  daysOfTheYear = self->_daysOfTheYear;
  self->_daysOfTheYear = 0;

  weeksOfTheYear = self->_weeksOfTheYear;
  self->_weeksOfTheYear = 0;

  monthsOfTheYear = self->_monthsOfTheYear;
  self->_monthsOfTheYear = 0;

  setPositions = self->_setPositions;
  self->_setPositions = 0;

}

- (void)revert
{
  NSString *specifier;
  NSArray *daysOfTheWeek;
  NSArray *daysOfTheMonth;
  NSArray *daysOfTheYear;
  NSArray *weeksOfTheYear;
  NSArray *monthsOfTheYear;
  NSArray *setPositions;

  specifier = self->_specifier;
  self->_specifier = 0;

  daysOfTheWeek = self->_daysOfTheWeek;
  self->_daysOfTheWeek = 0;

  daysOfTheMonth = self->_daysOfTheMonth;
  self->_daysOfTheMonth = 0;

  daysOfTheYear = self->_daysOfTheYear;
  self->_daysOfTheYear = 0;

  weeksOfTheYear = self->_weeksOfTheYear;
  self->_weeksOfTheYear = 0;

  monthsOfTheYear = self->_monthsOfTheYear;
  self->_monthsOfTheYear = 0;

  setPositions = self->_setPositions;
  self->_setPositions = 0;

  *(_WORD *)&self->_dirty = 0;
}

- (BOOL)isDirty
{
  return self->_dirty;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[EKRecurrenceHelper specifier](self, "specifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "specifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == v6)
    {
      v9 = 1;
    }
    else
    {
      -[EKRecurrenceHelper specifier](self, "specifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "specifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)specifier
{
  if (self->_dirty)
    -[EKRecurrenceHelper _updateSpecifier](self, "_updateSpecifier");
  return (NSString *)(id)-[NSString copy](self->_specifier, "copy");
}

- (void)setSpecifier:(id)a3
{
  NSString *v4;
  NSString *v5;
  BOOL v6;
  NSString *v7;
  NSString *specifier;
  NSString *v9;

  v4 = (NSString *)a3;
  v5 = v4;
  if (self->_specifier != v4)
  {
    v9 = v4;
    if (!v4 || (v6 = -[NSString isEqualToString:](v4, "isEqualToString:"), v5 = v9, !v6))
    {
      *(_WORD *)&self->_dirty = 0;
      -[EKRecurrenceHelper _clearArrays](self, "_clearArrays");
      v7 = (NSString *)-[NSString copy](v9, "copy");
      specifier = self->_specifier;
      self->_specifier = v7;

      v5 = v9;
    }
  }

}

- (void)setDaysOfTheWeek:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  NSArray *daysOfTheWeek;
  id v8;

  v8 = a3;
  -[EKRecurrenceHelper daysOfTheWeek](self, "daysOfTheWeek");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v8;
  if (v4 != v8)
  {
    v6 = (NSArray *)objc_msgSend(v8, "copy");
    daysOfTheWeek = self->_daysOfTheWeek;
    self->_daysOfTheWeek = v6;

    v5 = v8;
    self->_dirty = 1;
  }

}

- (void)setDaysOfTheMonth:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  NSArray *daysOfTheMonth;
  id v8;

  v8 = a3;
  -[EKRecurrenceHelper daysOfTheMonth](self, "daysOfTheMonth");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v8;
  if (v4 != v8)
  {
    v6 = (NSArray *)objc_msgSend(v8, "copy");
    daysOfTheMonth = self->_daysOfTheMonth;
    self->_daysOfTheMonth = v6;

    v5 = v8;
    self->_dirty = 1;
  }

}

- (void)setDaysOfTheYear:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  NSArray *daysOfTheYear;
  id v8;

  v8 = a3;
  -[EKRecurrenceHelper daysOfTheYear](self, "daysOfTheYear");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v8;
  if (v4 != v8)
  {
    v6 = (NSArray *)objc_msgSend(v8, "copy");
    daysOfTheYear = self->_daysOfTheYear;
    self->_daysOfTheYear = v6;

    v5 = v8;
    self->_dirty = 1;
  }

}

- (void)setWeeksOfTheYear:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  NSArray *weeksOfTheYear;
  id v8;

  v8 = a3;
  -[EKRecurrenceHelper weeksOfTheYear](self, "weeksOfTheYear");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v8;
  if (v4 != v8)
  {
    v6 = (NSArray *)objc_msgSend(v8, "copy");
    weeksOfTheYear = self->_weeksOfTheYear;
    self->_weeksOfTheYear = v6;

    v5 = v8;
    self->_dirty = 1;
  }

}

- (void)setMonthsOfTheYear:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  NSArray *monthsOfTheYear;
  id v8;

  v8 = a3;
  -[EKRecurrenceHelper monthsOfTheYear](self, "monthsOfTheYear");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v8;
  if (v4 != v8)
  {
    v6 = (NSArray *)objc_msgSend(v8, "copy");
    monthsOfTheYear = self->_monthsOfTheYear;
    self->_monthsOfTheYear = v6;

    v5 = v8;
    self->_dirty = 1;
  }

}

- (void)setSetPositions:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  NSArray *setPositions;
  id v8;

  v8 = a3;
  -[EKRecurrenceHelper setPositions](self, "setPositions");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v8;
  if (v4 != v8)
  {
    v6 = (NSArray *)objc_msgSend(v8, "copy");
    setPositions = self->_setPositions;
    self->_setPositions = v6;

    v5 = v8;
    self->_dirty = 1;
  }

}

- (void)_updateSpecifier
{
  NSUInteger v3;
  void *v4;
  NSString *v5;
  NSString *specifier;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_daysOfTheWeek, "count"))
    -[EKRecurrenceHelper _appendDaysOfTheWeek:toSpecifier:](self, "_appendDaysOfTheWeek:toSpecifier:", self->_daysOfTheWeek, v7);
  if (-[NSArray count](self->_daysOfTheMonth, "count"))
    -[EKRecurrenceHelper _appendIndexList:toSpecifier:propertyKey:](self, "_appendIndexList:toSpecifier:propertyKey:", self->_daysOfTheMonth, v7, 77);
  if (-[NSArray count](self->_daysOfTheYear, "count"))
    -[EKRecurrenceHelper _appendIndexList:toSpecifier:propertyKey:](self, "_appendIndexList:toSpecifier:propertyKey:", self->_daysOfTheYear, v7, 89);
  if (-[NSArray count](self->_weeksOfTheYear, "count"))
    -[EKRecurrenceHelper _appendIndexList:toSpecifier:propertyKey:](self, "_appendIndexList:toSpecifier:propertyKey:", self->_weeksOfTheYear, v7, 87);
  if (-[NSArray count](self->_monthsOfTheYear, "count"))
    -[EKRecurrenceHelper _appendIndexList:toSpecifier:propertyKey:](self, "_appendIndexList:toSpecifier:propertyKey:", self->_monthsOfTheYear, v7, 79);
  v3 = -[NSArray count](self->_setPositions, "count");
  v4 = v7;
  if (v3)
  {
    -[EKRecurrenceHelper _appendIndexList:toSpecifier:propertyKey:](self, "_appendIndexList:toSpecifier:propertyKey:", self->_setPositions, v7, 83);
    v4 = v7;
  }
  v5 = (NSString *)objc_msgSend(v4, "copy");
  specifier = self->_specifier;
  self->_specifier = v5;

  *(_WORD *)&self->_dirty = 256;
}

- (void)_appendDaysOfTheWeek:(id)a3 toSpecifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  const __CFString *v13;
  const char *v14;
  __int16 v15;

  v5 = a3;
  v6 = a4;
  v15 = 68;
  if (objc_msgSend(v6, "length"))
    objc_msgSend(v6, "appendString:", CFSTR(";"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v15, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v7);

  objc_msgSend(v6, "appendString:", CFSTR("="));
  v8 = objc_msgSend(v5, "count");
  if (v8)
  {
    v9 = v8;
    for (i = 0; i != v9; ++i)
    {
      objc_msgSend(v5, "objectAtIndex:", i);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (i)
        v13 = CFSTR(",%s%ld%s");
      else
        v13 = CFSTR("%s%ld%s");
      if (objc_msgSend(v11, "weekNumber") <= 0)
        v14 = "";
      else
        v14 = "+";
      objc_msgSend(v6, "appendFormat:", v13, v14, objc_msgSend(v12, "weekNumber"), __CalDayStrings[objc_msgSend(v12, "dayOfTheWeek")]);

    }
  }

}

- (void)_appendIndexList:(id)a3 toSpecifier:(id)a4 propertyKey:(unsigned __int16)a5
{
  int v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  const __CFString *v16;
  __int16 v17;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  v9 = v8;
  v17 = v5;
  if (v5)
  {
    if (objc_msgSend(v8, "length"))
      objc_msgSend(v9, "appendString:", CFSTR(";"));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v17, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendString:", v10);

    objc_msgSend(v9, "appendString:", CFSTR("="));
    v11 = objc_msgSend(v7, "count");
    if (v11)
    {
      v12 = v11;
      for (i = 0; i != v12; ++i)
      {
        objc_msgSend(v7, "objectAtIndex:", i);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (i)
          v16 = CFSTR(",%d");
        else
          v16 = CFSTR("%d");
        objc_msgSend(v9, "appendFormat:", v16, objc_msgSend(v14, "intValue"));

      }
    }
  }

}

- (id)_parseDaysOfWeek:(id *)a3 range:(id)a4
{
  int64_t var0;
  int v6;
  char v7;
  char v8;
  int64_t v9;
  int64_t v10;
  int64_t var1;
  unsigned __int16 *var2;
  unsigned __int16 v13;
  uint64_t v14;
  int64_t v15;
  unsigned __int16 *v16;
  unsigned __int16 v17;
  _BOOL4 v18;
  _BOOL4 v19;
  uint64_t v20;
  int v21;
  void *v22;
  void *v23;
  int64_t v24;
  int64_t v25;
  int64_t v26;
  uint64_t v27;
  int64_t v28;
  unsigned __int16 *v29;
  unsigned __int16 v30;
  char *v31;
  int64_t v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  int64_t v36;
  int64_t v37;
  int64_t v38;
  char *var3;
  char *v40;
  int64_t var5;
  int64_t v42;
  int64_t v43;
  int64_t v44;
  unsigned __int16 *v46;
  id v47;
  CFRange v48;
  CFRange v49;
  CFRange v50;

  if (a4.var1 >= 1)
  {
    var0 = a4.var0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = a4.var0 + a4.var1;
    v10 = a4.var0 + a4.var1 - 1;
    v46 = &a3->var0[1];
    v47 = 0;
    while (1)
    {
      if (var0 < 0 || (var1 = a3->var4.var1, var1 <= var0))
      {
        v13 = 0;
      }
      else
      {
        var2 = a3->var2;
        if (var2)
        {
          v13 = var2[a3->var4.var0 + var0];
        }
        else
        {
          var3 = a3->var3;
          if (var3)
          {
            v13 = var3[a3->var4.var0 + var0];
          }
          else
          {
            if (a3->var6 <= var0 || (var5 = a3->var5, var5 > var0))
            {
              v42 = var0 - 4;
              if ((unint64_t)var0 < 4)
                v42 = 0;
              if (v42 + 64 < var1)
                var1 = v42 + 64;
              a3->var5 = v42;
              a3->var6 = var1;
              v49.location = a3->var4.var0 + v42;
              v49.length = var1 - v42;
              CFStringGetCharacters(a3->var1, v49, a3->var0);
              var5 = a3->var5;
            }
            v13 = a3->var0[var0 - var5];
          }
        }
        if ((unsigned __int16)(v13 - 48) <= 9u)
        {
          v6 = 10 * v6 + v13 - 48;
          v7 = 1;
          goto LABEL_62;
        }
      }
      if ((v7 & 1) != 0 || v13 > 0x2Du || ((1 << v13) & 0x280100000000) == 0)
      {
        v14 = var0 + 1;
        if (var0 < -1 || v14 >= v9 || (v15 = a3->var4.var1, v15 <= v14))
        {
          v18 = 0;
          v19 = v13 == 83;
        }
        else
        {
          v16 = a3->var2;
          if (v16)
          {
            v17 = v16[a3->var4.var0 + v14];
          }
          else
          {
            v40 = a3->var3;
            if (v40)
            {
              v17 = v40[a3->var4.var0 + v14];
            }
            else
            {
              if (a3->var6 <= v14 || (v43 = a3->var5, v43 > v14))
              {
                v44 = var0 - 3;
                if ((unint64_t)v14 < 4)
                  v44 = 0;
                if (v44 + 64 < v15)
                  v15 = v44 + 64;
                a3->var5 = v44;
                a3->var6 = v15;
                v50.location = a3->var4.var0 + v44;
                v50.length = v15 - v44;
                CFStringGetCharacters(a3->var1, v50, a3->var0);
                v43 = a3->var5;
              }
              v17 = a3->var0[v14 - v43];
            }
          }
          if (v13 == 77 && v17 == 79)
          {
            v20 = 2;
            goto LABEL_19;
          }
          v18 = v17 == 85;
          if (v13 == 84 && v17 == 85)
          {
            v20 = 3;
            goto LABEL_19;
          }
          if (v13 == 87 && v17 == 69)
          {
            v20 = 4;
            goto LABEL_19;
          }
          if (v13 == 84 && v17 == 72)
          {
            v20 = 5;
            goto LABEL_19;
          }
          if (v13 == 70 && v17 == 82)
          {
            v20 = 6;
            goto LABEL_19;
          }
          v19 = v13 == 83;
          if (v13 == 83 && v17 == 65)
          {
            v20 = 7;
LABEL_19:
            if ((v8 & 1) != 0)
              v21 = -v6;
            else
              v21 = v6;
            v22 = v47;
            if (!v47)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
            }
            +[EKRecurrenceDayOfWeek dayOfWeek:weekNumber:](EKRecurrenceDayOfWeek, "dayOfWeek:weekNumber:", v20, v21, v46);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "addObject:", v23);

            v47 = v22;
            if (v14 >= v9)
            {
              v8 = 0;
              v7 = 0;
              v6 = 0;
              ++var0;
            }
            else
            {
              v24 = ~var0;
              v25 = var0 + 65;
              while (1)
              {
                v26 = var0 + 1;
                v27 = (unint64_t)v14 >= 4 ? 4 : v14;
                if ((v26 & 0x8000000000000000) == 0)
                {
                  v28 = a3->var4.var1;
                  if (v28 > v26)
                  {
                    v29 = a3->var2;
                    if (v29)
                    {
                      v30 = v29[var0 + 1 + a3->var4.var0];
                    }
                    else
                    {
                      v31 = a3->var3;
                      if (v31)
                      {
                        v30 = v31[a3->var4.var0 + 1 + var0];
                      }
                      else
                      {
                        if (a3->var6 <= v26 || (v32 = a3->var5, v32 > v26))
                        {
                          v33 = -v27;
                          v34 = v27 + v24;
                          v35 = v25 - v27;
                          v36 = var0 + v33;
                          v37 = v36 + 1;
                          v38 = v36 + 65;
                          if (v38 >= v28)
                            v38 = a3->var4.var1;
                          a3->var5 = v37;
                          a3->var6 = v38;
                          if (v28 >= v35)
                            v28 = v35;
                          v48.length = v28 + v34;
                          v48.location = v37 + a3->var4.var0;
                          CFStringGetCharacters(a3->var1, v48, a3->var0);
                          v32 = a3->var5;
                        }
                        v30 = v46[var0 - v32];
                      }
                    }
                    if (v30 == 44)
                      break;
                  }
                }
                ++v14;
                --v24;
                ++v25;
                ++var0;
                if (v10 == v26)
                {
                  v8 = 0;
                  v7 = 0;
                  v6 = 0;
                  var0 = v9;
                  goto LABEL_62;
                }
              }
              v8 = 0;
              v7 = 0;
              v6 = 0;
              ++var0;
            }
            goto LABEL_62;
          }
        }
        v20 = v19 & v18;
        goto LABEL_19;
      }
      v7 = 0;
      v8 |= v13 == 45;
LABEL_62:
      if (++var0 >= v9)
        return v47;
    }
  }
  v47 = 0;
  return v47;
}

- (id)_parseIndexList:(id *)a3 range:(id)a4
{
  int64_t var0;
  uint64_t v6;
  int v7;
  int v8;
  void *v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unsigned __int16 *var2;
  unsigned __int16 v16;
  unsigned int v17;
  uint64_t v18;
  BOOL v19;
  int v20;
  int v21;
  int v22;
  BOOL v23;
  char *var3;
  int64_t var5;
  uint64_t v26;
  uint64_t v27;
  int64_t v28;
  int64_t v29;
  int64_t var1;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  CFRange v36;

  if (a4.var1 < 1)
  {
    v9 = 0;
    return v9;
  }
  var0 = a4.var0;
  LODWORD(v6) = 0;
  LOBYTE(v7) = 0;
  v8 = 0;
  v9 = 0;
  v10 = a4.var0 + a4.var1;
  v11 = -a4.var0;
  v12 = a4.var0 + 64;
  do
  {
    if ((unint64_t)var0 >= 4)
      v13 = 4;
    else
      v13 = var0;
    if (var0 < 0 || (v14 = a3->var4.var1, v14 <= var0))
    {
      v16 = 0;
    }
    else
    {
      var2 = a3->var2;
      if (var2)
      {
        v16 = var2[var0 + a3->var4.var0];
      }
      else
      {
        var3 = a3->var3;
        if (var3)
        {
          v16 = var3[a3->var4.var0 + var0];
        }
        else
        {
          if (a3->var6 <= var0 || (var5 = a3->var5, var5 > var0))
          {
            v26 = -v13;
            v27 = v13 + v11;
            v28 = v12 - v13;
            v29 = var0 + v26;
            var1 = v29 + 64;
            if (v29 + 64 >= v14)
              var1 = a3->var4.var1;
            a3->var5 = v29;
            a3->var6 = var1;
            if (v14 >= v28)
              v14 = v28;
            v36.length = v14 + v27;
            v36.location = v29 + a3->var4.var0;
            CFStringGetCharacters(a3->var1, v36, a3->var0);
            var5 = a3->var5;
          }
          v16 = a3->var0[var0 - var5];
        }
      }
      if (v16 != 44 || (v7 & 1) == 0)
      {
        if ((unsigned __int16)(v16 - 48) <= 9u)
        {
          LODWORD(v6) = v16 + 10 * v6 - 48;
          v7 = 1;
          goto LABEL_26;
        }
      }
      else
      {
        if ((v8 & 1) != 0)
          v6 = -(int)v6;
        else
          v6 = v6;
        if (!v9)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
        v31 = v9;
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "addObject:", v32);

        v9 = v31;
        v16 = 44;
      }
    }
    v17 = v16;
    v18 = 1 << v16;
    v19 = (v18 & 0x280100000000) == 0;
    if ((v18 & 0x280100000000) != 0)
      v20 = v8 | (v17 == 45);
    else
      v20 = 0;
    if (v19)
      v21 = 0;
    else
      v21 = v6;
    if (v17 <= 0x2D)
    {
      v22 = v21;
    }
    else
    {
      v20 = 0;
      v22 = 0;
    }
    v23 = (v7 & 1) == 0;
    if ((v7 & 1) != 0)
      v8 = 0;
    else
      v8 = v20;
    v7 = 0;
    if (v23)
      LODWORD(v6) = v22;
    else
      LODWORD(v6) = 0;
LABEL_26:
    ++var0;
    --v11;
    ++v12;
  }
  while (var0 < v10);
  if (v7)
  {
    if ((v8 & 1) != 0)
      v33 = -(int)v6;
    else
      v33 = v6;
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v34);

  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setPositions, 0);
  objc_storeStrong((id *)&self->_monthsOfTheYear, 0);
  objc_storeStrong((id *)&self->_weeksOfTheYear, 0);
  objc_storeStrong((id *)&self->_daysOfTheYear, 0);
  objc_storeStrong((id *)&self->_daysOfTheMonth, 0);
  objc_storeStrong((id *)&self->_daysOfTheWeek, 0);
  objc_storeStrong((id *)&self->_specifier, 0);
}

@end
