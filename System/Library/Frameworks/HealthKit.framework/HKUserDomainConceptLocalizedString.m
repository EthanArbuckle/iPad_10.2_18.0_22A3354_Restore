@implementation HKUserDomainConceptLocalizedString

- (HKUserDomainConceptLocalizedString)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKUserDomainConceptLocalizedString)initWithType:(int64_t)a3 version:(int64_t)a4 timestamp:(double)a5 deleted:(BOOL)a6
{
  void *v7;
  uint64_t v8;
  void *v9;

  v7 = (void *)MEMORY[0x1E0C99DA0];
  v8 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "raise:format:", v8, CFSTR("The -%@ method is not available on %@"), v9, objc_opt_class());

  return 0;
}

- (HKUserDomainConceptLocalizedString)initWithType:(int64_t)a3 stringValue:(id)a4 locale:(id)a5 version:(int64_t)a6 timestamp:(double)a7 deleted:(BOOL)a8
{
  _BOOL8 v8;
  id v15;
  id v16;
  void *v17;
  HKUserDomainConceptLocalizedString *v18;
  uint64_t v19;
  NSString *stringValue;
  uint64_t v21;
  NSString *locale;
  void *v24;
  void *v25;
  objc_super v26;

  v8 = a8;
  v15 = a4;
  v16 = a5;
  v17 = v16;
  if (v15)
  {
    if (v16)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKUserDomainConceptLocalizedString.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("stringValue"));

    if (v17)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKUserDomainConceptLocalizedString.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("locale"));

LABEL_3:
  v26.receiver = self;
  v26.super_class = (Class)HKUserDomainConceptLocalizedString;
  v18 = -[HKUserDomainConceptProperty initWithType:version:timestamp:deleted:](&v26, sel_initWithType_version_timestamp_deleted_, a3, a6, v8, a7);
  if (v18)
  {
    v19 = objc_msgSend(v15, "copy");
    stringValue = v18->_stringValue;
    v18->_stringValue = (NSString *)v19;

    v21 = objc_msgSend(v17, "copy");
    locale = v18->_locale;
    v18->_locale = (NSString *)v21;

  }
  return v18;
}

+ (id)nullPropertyWithType:(int64_t)a3 locale:(id)a4 version:(int64_t)a5
{
  id v7;
  HKUserDomainConceptLocalizedString *v8;

  v7 = a4;
  v8 = -[HKUserDomainConceptLocalizedString initWithType:stringValue:locale:version:timestamp:deleted:]([HKUserDomainConceptLocalizedString alloc], "initWithType:stringValue:locale:version:timestamp:deleted:", a3, &stru_1E37FD4C0, v7, a5, 1, CFAbsoluteTimeGetCurrent());

  return v8;
}

- (HKUserDomainConceptLocalizedString)initWithType:(int64_t)a3 stringValue:(id)a4 locale:(id)a5 version:(int64_t)a6
{
  id v10;
  id v11;
  HKUserDomainConceptLocalizedString *v12;

  v10 = a5;
  v11 = a4;
  v12 = -[HKUserDomainConceptLocalizedString initWithType:stringValue:locale:version:timestamp:](self, "initWithType:stringValue:locale:version:timestamp:", a3, v11, v10, a6, CFAbsoluteTimeGetCurrent());

  return v12;
}

- (HKUserDomainConceptLocalizedString)initWithType:(int64_t)a3 stringValue:(id)a4 locale:(id)a5 version:(int64_t)a6 timestamp:(double)a7
{
  return -[HKUserDomainConceptLocalizedString initWithType:stringValue:locale:version:timestamp:deleted:](self, "initWithType:stringValue:locale:version:timestamp:deleted:", a3, a4, a5, a6, 0, a7);
}

- (id)valueDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'(%@, %@)'"), self->_stringValue, self->_locale);
}

+ (id)mergeListsOfPropertiesWithType:(int64_t)a3 intoListOfProperties:(id)a4 fromListOfProperties:(id)a5 options:(unint64_t)a6
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  id v32;
  void *v34;
  void *v35;
  id v36;
  id v37;
  char v38;
  void *v39;
  void *v41;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  objc_super v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[5];
  _QWORD v53[5];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __119__HKUserDomainConceptLocalizedString_mergeListsOfPropertiesWithType_intoListOfProperties_fromListOfProperties_options___block_invoke;
  v53[3] = &__block_descriptor_40_e37_B16__0__HKUserDomainConceptProperty_8l;
  v53[4] = a3;
  if ((objc_msgSend(v9, "hk_allObjectsPassTest:", v53) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKUserDomainConceptLocalizedString.m"), 96, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[intoListOfProperties hk_allObjectsPassTest:^BOOL(HKUserDomainConceptProperty *property) { return property.type == type && [property isKindOfClass:HKUserDomainConceptLocalizedString.class]; }]"));

  }
  v52[0] = v11;
  v52[1] = 3221225472;
  v52[2] = __119__HKUserDomainConceptLocalizedString_mergeListsOfPropertiesWithType_intoListOfProperties_fromListOfProperties_options___block_invoke_2;
  v52[3] = &__block_descriptor_40_e37_B16__0__HKUserDomainConceptProperty_8l;
  v52[4] = a3;
  if ((objc_msgSend(v10, "hk_allObjectsPassTest:", v52) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKUserDomainConceptLocalizedString.m"), 99, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[fromListOfProperties hk_allObjectsPassTest:^BOOL(HKUserDomainConceptProperty *property) { return property.type == type && [property isKindOfClass:HKUserDomainConceptLocalizedString.class]; }]"));

  }
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(a1, "_propertiesByLocale:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_propertiesByLocale:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v12;
    v39 = (void *)objc_msgSend(v12, "mutableCopy");
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v14 = v13;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
    if (v15)
    {
      v16 = v15;
      v36 = v10;
      v37 = v9;
      v38 = 0;
      v17 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v49 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
          objc_msgSend(v14, "objectForKeyedSubscript:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "objectForKeyedSubscript:", v19);
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = (void *)v21;
          v23 = (void *)MEMORY[0x1E0C9AA60];
          if (v21)
            v23 = (void *)v21;
          v24 = v23;

          v47.receiver = a1;
          v47.super_class = (Class)&OBJC_METACLASS___HKUserDomainConceptLocalizedString;
          objc_msgSendSuper2(&v47, sel_mergeListsOfPropertiesWithType_intoListOfProperties_fromListOfProperties_options_, a3, v24, v20, a6);
          v25 = (id)objc_claimAutoreleasedReturnValue();

          if (v25 != v24)
          {
            objc_msgSend(v39, "setObject:forKeyedSubscript:", v25, v19);
            v38 = 1;
          }

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
      }
      while (v16);

      v10 = v36;
      v9 = v37;
      if ((v38 & 1) != 0)
      {
        v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        objc_msgSend(v39, "allValues");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v44;
          do
          {
            for (j = 0; j != v29; ++j)
            {
              if (*(_QWORD *)v44 != v30)
                objc_enumerationMutation(v27);
              objc_msgSend(v26, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j));
            }
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
          }
          while (v29);
        }

        v32 = (id)objc_msgSend(v26, "copy");
        goto LABEL_29;
      }
    }
    else
    {

    }
    v32 = v9;
LABEL_29:

    goto LABEL_30;
  }
  v32 = v9;
LABEL_30:

  return v32;
}

uint64_t __119__HKUserDomainConceptLocalizedString_mergeListsOfPropertiesWithType_intoListOfProperties_fromListOfProperties_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char isKindOfClass;

  v3 = a2;
  if (objc_msgSend(v3, "type") == *(_QWORD *)(a1 + 32))
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

uint64_t __119__HKUserDomainConceptLocalizedString_mergeListsOfPropertiesWithType_intoListOfProperties_fromListOfProperties_options___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  char isKindOfClass;

  v3 = a2;
  if (objc_msgSend(v3, "type") == *(_QWORD *)(a1 + 32))
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HKUserDomainConceptLocalizedString *v5;
  HKUserDomainConceptLocalizedString *v6;
  uint64_t v7;
  NSString *stringValue;
  NSString *v9;
  uint64_t v10;
  NSString *v11;
  char v12;
  NSString *locale;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSString *v18;
  void *v19;
  objc_super v21;

  v5 = (HKUserDomainConceptLocalizedString *)a3;
  if (v5 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      v21.receiver = self;
      v21.super_class = (Class)HKUserDomainConceptLocalizedString;
      if (!-[HKUserDomainConceptProperty isEqual:](&v21, sel_isEqual_, v6))
      {
        v12 = 0;
LABEL_20:

        goto LABEL_21;
      }
      v7 = 40;
      stringValue = self->_stringValue;
      -[HKUserDomainConceptLocalizedString stringValue](v6, "stringValue");
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (stringValue == v9)
        goto LABEL_11;
      -[HKUserDomainConceptLocalizedString stringValue](v6, "stringValue");
      v10 = objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        v12 = 0;
LABEL_19:

        goto LABEL_20;
      }
      v3 = (void *)v10;
      v11 = self->_stringValue;
      -[HKUserDomainConceptLocalizedString stringValue](v6, "stringValue");
      v7 = objc_claimAutoreleasedReturnValue();
      if (-[NSString isEqual:](v11, "isEqual:", v7))
      {
LABEL_11:
        locale = self->_locale;
        -[HKUserDomainConceptLocalizedString locale](v6, "locale");
        v14 = objc_claimAutoreleasedReturnValue();
        if (locale == (NSString *)v14)
        {

          v12 = 1;
        }
        else
        {
          v15 = (void *)v14;
          -[HKUserDomainConceptLocalizedString locale](v6, "locale");
          v16 = objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            v17 = (void *)v16;
            v18 = self->_locale;
            -[HKUserDomainConceptLocalizedString locale](v6, "locale");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = -[NSString isEqual:](v18, "isEqual:", v19);

          }
          else
          {

            v12 = 0;
          }
        }
        if (stringValue == v9)
          goto LABEL_19;
      }
      else
      {
        v12 = 0;
      }

      goto LABEL_19;
    }
    v12 = 0;
  }
LABEL_21:

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKUserDomainConceptLocalizedString;
  v3 = -[HKUserDomainConceptProperty hash](&v6, sel_hash);
  v4 = -[NSString hash](self->_stringValue, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_locale, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKUserDomainConceptLocalizedString;
  v4 = a3;
  -[HKUserDomainConceptProperty encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_stringValue, CFSTR("stringValue"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_locale, CFSTR("locale"));

}

- (HKUserDomainConceptLocalizedString)initWithCoder:(id)a3
{
  id v4;
  HKUserDomainConceptLocalizedString *v5;
  uint64_t v6;
  NSString *stringValue;
  uint64_t v8;
  NSString *locale;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKUserDomainConceptLocalizedString;
  v5 = -[HKUserDomainConceptProperty initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stringValue"));
    v6 = objc_claimAutoreleasedReturnValue();
    stringValue = v5->_stringValue;
    v5->_stringValue = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locale"));
    v8 = objc_claimAutoreleasedReturnValue();
    locale = v5->_locale;
    v5->_locale = (NSString *)v8;

  }
  return v5;
}

+ (id)_propertiesByLocale:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
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
        objc_msgSend(v10, "locale", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v11);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v11);
        }
        objc_msgSend(v12, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(v4, "copy");
  return v13;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (NSString)locale
{
  return self->_locale;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
}

@end
