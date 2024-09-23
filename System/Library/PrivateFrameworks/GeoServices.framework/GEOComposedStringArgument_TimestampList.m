@implementation GEOComposedStringArgument_TimestampList

- (id)_initWithGeoFormatArgument:(id)a3
{
  id v4;
  id *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GEOComposedStringArgument_TimestampList;
  v5 = -[GEOComposedStringArgument _initWithGeoFormatArgument:](&v11, sel__initWithGeoFormatArgument_, v4);
  if (v5)
  {
    objc_msgSend(v4, "timestampDatas");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_geo_map:", &__block_literal_global_56);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v5[4];
    v5[4] = (id)v7;

    objc_msgSend(v5, "setHasDefaultValue:", objc_msgSend(v5[4], "count") != 0);
    v9 = v5;
  }

  return v5;
}

- (void)setOverrideTimestamps:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *overrideTimestamps;

  v4 = a3;
  -[GEOComposedStringArgument setHasOverrideValue:](self, "setHasOverrideValue:", 1);
  v5 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v4, 1);

  overrideTimestamps = self->_overrideTimestamps;
  self->_overrideTimestamps = v5;

}

- (id)_stringReplacementWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSArray *overrideTimestamps;
  NSArray *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  id obj;
  void *v32;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  if (-[GEOComposedStringArgument hasOverrideValue](self, "hasOverrideValue")
    || -[GEOComposedStringArgument hasDefaultValue](self, "hasDefaultValue"))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    +[GEOComposedString localizationProvider](GEOComposedString, "localizationProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "locale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLocale:", v6);

    objc_msgSend(v4, "AMSymbol");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v4;
    objc_msgSend(v4, "PMSymbol");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    overrideTimestamps = self->_overrideTimestamps;
    if (!overrideTimestamps)
      overrideTimestamps = self->_defaultTimestamps;
    v8 = overrideTimestamps;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](v8, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    -[NSArray reverseObjectEnumerator](v8, "reverseObjectEnumerator");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v36 != v13)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "_stringReplacementWithOptions:", v34);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "rangeOfString:", v33);
          v18 = v17;
          v19 = objc_msgSend(v15, "rangeOfString:", v32);
          if (v16 == 0x7FFFFFFFFFFFFFFFLL)
          {
            if (v19 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v12 = 0;
              goto LABEL_22;
            }
            if (v12 == 2)
            {
              v16 = v19;
              v18 = v20;
              v21 = 2;
LABEL_17:
              objc_msgSend(v15, "stringByReplacingCharactersInRange:withString:", v16, v18, &stru_1E1C241D0);
              v22 = objc_claimAutoreleasedReturnValue();

              v15 = (void *)v22;
              goto LABEL_19;
            }
            v21 = 2;
          }
          else
          {
            v21 = 1;
            if (v12 == 1)
              goto LABEL_17;
          }
LABEL_19:
          if (v21 == v12)
          {
            objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("[  ]{2,}"), 0, 0);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "stringByReplacingMatchesInString:options:range:withTemplate:", v15, 0, 0, objc_msgSend(v15, "length"), CFSTR(" "));
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "stringByTrimmingCharactersInSet:", v25);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v12 = v21;
          }
LABEL_22:
          objc_msgSend(v9, "insertObject:atIndex:", v15, 0);

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v11);
    }

    +[GEOComposedString localizationProvider](GEOComposedString, "localizationProvider");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "separatorForTimestampList");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "componentsJoinedByString:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GEOComposedStringArgument_TimestampList;
  v4 = -[GEOComposedStringArgument copyWithZone:](&v10, sel_copyWithZone_, a3);
  if (self->_defaultTimestamps)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", self->_defaultTimestamps, 1);
    v6 = (void *)v4[4];
    v4[4] = v5;

  }
  if (self->_overrideTimestamps)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", self->_overrideTimestamps, 1);
    v8 = (void *)v4[5];
    v4[5] = v7;

  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEOComposedStringArgument_TimestampList;
  v4 = a3;
  -[GEOComposedStringArgument encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_defaultTimestamps, CFSTR("_defaultTimestamps"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_overrideTimestamps, CFSTR("_overrideTimestamps"));

}

- (GEOComposedStringArgument_TimestampList)initWithCoder:(id)a3
{
  id v4;
  GEOComposedStringArgument_TimestampList *v5;
  uint64_t v6;
  NSArray *defaultTimestamps;
  uint64_t v8;
  NSArray *overrideTimestamps;
  GEOComposedStringArgument_TimestampList *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOComposedStringArgument_TimestampList;
  v5 = -[GEOComposedStringArgument initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_defaultTimestamps"));
    v6 = objc_claimAutoreleasedReturnValue();
    defaultTimestamps = v5->_defaultTimestamps;
    v5->_defaultTimestamps = (NSArray *)v6;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_overrideTimestamps"));
    v8 = objc_claimAutoreleasedReturnValue();
    overrideTimestamps = v5->_overrideTimestamps;
    v5->_overrideTimestamps = (NSArray *)v8;

    v10 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  int v10;
  NSArray *overrideTimestamps;
  uint64_t v12;
  id v13;
  void *v14;
  char v15;
  objc_super v17;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    v17.receiver = self;
    v17.super_class = (Class)GEOComposedStringArgument_TimestampList;
    if (-[GEOComposedStringArgument isEqual:](&v17, sel_isEqual_, v5)
      && ((v6 = (void *)v5[4], v7 = self->_defaultTimestamps, v8 = v6, !(v7 | v8))
       || (v9 = (void *)v8, v10 = objc_msgSend((id)v7, "isEqual:", v8), v9, (id)v7, v10)))
    {
      overrideTimestamps = self->_overrideTimestamps;
      v12 = v5[5];
      v13 = overrideTimestamps;
      v14 = v13;
      if ((unint64_t)v13 | v12)
        v15 = objc_msgSend(v13, "isEqual:", v12);
      else
        v15 = 1;

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (NSArray)overrideTimestamps
{
  return self->_overrideTimestamps;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideTimestamps, 0);
  objc_storeStrong((id *)&self->_defaultTimestamps, 0);
}

@end
