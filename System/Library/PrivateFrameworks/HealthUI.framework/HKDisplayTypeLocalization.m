@implementation HKDisplayTypeLocalization

- (id)unitDisplayNameKeyOverrideForUnit:(id)a3 nameContext:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;

  v6 = a3;
  if (v6)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_unitNameKeyOverrides, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = v7;
        if ((a4 & 0xFFFFFFFFFFFFFFFELL) != 2
          || (objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4),
              v10 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v9, "objectForKeyedSubscript:", v10),
              v8 = (id)objc_claimAutoreleasedReturnValue(),
              v10,
              !v8))
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", &unk_1E9CEC8C0);
          v8 = (id)objc_claimAutoreleasedReturnValue();
        }

      }
      else
      {
        v8 = 0;
      }
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)localizationTableNameOverride
{
  return self->_localizationTableNameOverride;
}

- (NSString)summary
{
  void *v3;
  int v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isiPad");

  if (!v4
    || (-[HKDisplayTypeLocalization _localizedStringForKeyOrNil:](self, "_localizedStringForKeyOrNil:", self->_summaryIPadNameKey), (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[HKDisplayTypeLocalization _localizedStringWithKey:](self, "_localizedStringWithKey:", self->_summaryNameKey);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v5;
}

- (id)_localizedStringWithKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v4 = a3;
  v5 = v4;
  if (self->_localizedKeySuffix)
  {
    objc_msgSend(v4, "stringByAppendingString:");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v4;
  }
  v7 = v6;
  -[HKDisplayTypeLocalization _rawLocalizedStringForKey:](self, "_rawLocalizedStringForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    -[HKDisplayTypeLocalization _rawLocalizedStringForKey:](self, "_rawLocalizedStringForKey:", v5);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (id)_rawLocalizedStringForKey:(id)a3
{
  id v4;
  NSString **p_localizationTableNameOverride;
  NSString *localizationTableNameOverride;
  void *v7;
  void *v8;
  NSString **v9;
  void *v10;

  v4 = a3;
  localizationTableNameOverride = self->_localizationTableNameOverride;
  p_localizationTableNameOverride = &self->_localizationTableNameOverride;
  HKHealthKitFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = (NSString **)MEMORY[0x1E0CB5138];
  if (localizationTableNameOverride)
    v9 = p_localizationTableNameOverride;
  objc_msgSend(v7, "localizedStringForKey:value:table:", v4, &stru_1E9C4C428, *v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "isEqualToString:", v4))
  {

    v10 = 0;
  }

  return v10;
}

- (HKDisplayTypeLocalization)initWithDisplayNameKey:(id)a3 labelDisplayNameKey:(id)a4 localizationTableNameOverride:(id)a5 localizedKeySuffix:(id)a6 unitNameKeyOverrides:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HKDisplayTypeLocalization *v17;
  uint64_t v18;
  NSString *displayNameKey;
  uint64_t v20;
  NSString *labelDisplayNameKey;
  uint64_t v22;
  NSString *localizationTableNameOverride;
  uint64_t v24;
  NSString *localizedKeySuffix;
  uint64_t v26;
  NSDictionary *unitNameKeyOverrides;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)HKDisplayTypeLocalization;
  v17 = -[HKDisplayTypeLocalization init](&v29, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    displayNameKey = v17->_displayNameKey;
    v17->_displayNameKey = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    labelDisplayNameKey = v17->_labelDisplayNameKey;
    v17->_labelDisplayNameKey = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    localizationTableNameOverride = v17->_localizationTableNameOverride;
    v17->_localizationTableNameOverride = (NSString *)v22;

    v24 = objc_msgSend(v15, "copy");
    localizedKeySuffix = v17->_localizedKeySuffix;
    v17->_localizedKeySuffix = (NSString *)v24;

    v26 = objc_msgSend(v16, "copy");
    unitNameKeyOverrides = v17->_unitNameKeyOverrides;
    v17->_unitNameKeyOverrides = (NSDictionary *)v26;

    -[HKDisplayTypeLocalization _expandLocalizationKeys](v17, "_expandLocalizationKeys");
  }

  return v17;
}

- (void)_expandLocalizationKeys
{
  NSString *v3;
  NSString *shortenedDisplayNameKey;
  NSString *v5;
  NSString *embeddedDisplayNameKey;
  NSString *v7;
  NSString *titleEmbeddedDisplayNameKey;
  NSString *v9;
  NSString *keywordsNameKey;
  NSString *v11;
  NSString *summaryNameKey;
  NSString *v13;
  NSString *summaryForEnhancedFeatureNameKey;
  NSString *v15;
  NSString *summaryPairedWatchNameKey;
  NSString *v17;
  NSString *summaryIPadNameKey;
  NSString *v19;
  NSString *displayNameFitnessJrKey;
  NSString *v21;
  NSString *summaryFitnessJrKey;
  NSString *v23;
  NSString *cautionaryTextKey;
  NSString *v25;
  NSString *unitChangeCautionaryTextKey;

  -[NSString stringByAppendingString:](self->_displayNameKey, "stringByAppendingString:", CFSTR("_SHORT"));
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  shortenedDisplayNameKey = self->_shortenedDisplayNameKey;
  self->_shortenedDisplayNameKey = v3;

  -[NSString stringByAppendingString:](self->_displayNameKey, "stringByAppendingString:", CFSTR("_EMBEDDED"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  embeddedDisplayNameKey = self->_embeddedDisplayNameKey;
  self->_embeddedDisplayNameKey = v5;

  -[NSString stringByAppendingString:](self->_displayNameKey, "stringByAppendingString:", CFSTR("_TITLE_EMBEDDED"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  titleEmbeddedDisplayNameKey = self->_titleEmbeddedDisplayNameKey;
  self->_titleEmbeddedDisplayNameKey = v7;

  -[NSString stringByAppendingString:](self->_displayNameKey, "stringByAppendingString:", CFSTR("_KEYWORDS"));
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  keywordsNameKey = self->_keywordsNameKey;
  self->_keywordsNameKey = v9;

  -[NSString stringByAppendingString:](self->_displayNameKey, "stringByAppendingString:", CFSTR("_SUMMARY"));
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  summaryNameKey = self->_summaryNameKey;
  self->_summaryNameKey = v11;

  -[NSString stringByAppendingString:](self->_displayNameKey, "stringByAppendingString:", CFSTR("_SUMMARY_ENHANCED"));
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  summaryForEnhancedFeatureNameKey = self->_summaryForEnhancedFeatureNameKey;
  self->_summaryForEnhancedFeatureNameKey = v13;

  -[NSString stringByAppendingString:](self->_displayNameKey, "stringByAppendingString:", CFSTR("_SUMMARY_PAIRED_WATCH"));
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  summaryPairedWatchNameKey = self->_summaryPairedWatchNameKey;
  self->_summaryPairedWatchNameKey = v15;

  -[NSString stringByAppendingString:](self->_displayNameKey, "stringByAppendingString:", CFSTR("_SUMMARY_IPAD"));
  v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  summaryIPadNameKey = self->_summaryIPadNameKey;
  self->_summaryIPadNameKey = v17;

  -[NSString stringByAppendingString:](self->_displayNameKey, "stringByAppendingString:", CFSTR("_FITNESS_JR"));
  v19 = (NSString *)objc_claimAutoreleasedReturnValue();
  displayNameFitnessJrKey = self->_displayNameFitnessJrKey;
  self->_displayNameFitnessJrKey = v19;

  -[NSString stringByAppendingString:](self->_displayNameKey, "stringByAppendingString:", CFSTR("_SUMMARY_FITNESS_JR"));
  v21 = (NSString *)objc_claimAutoreleasedReturnValue();
  summaryFitnessJrKey = self->_summaryFitnessJrKey;
  self->_summaryFitnessJrKey = v21;

  -[NSString stringByAppendingString:](self->_displayNameKey, "stringByAppendingString:", CFSTR("_CAUTIONARY_TEXT"));
  v23 = (NSString *)objc_claimAutoreleasedReturnValue();
  cautionaryTextKey = self->_cautionaryTextKey;
  self->_cautionaryTextKey = v23;

  -[NSString stringByAppendingString:](self->_displayNameKey, "stringByAppendingString:", CFSTR("_UNIT_CHANGE_CAUTIONARY_TEXT"));
  v25 = (NSString *)objc_claimAutoreleasedReturnValue();
  unitChangeCautionaryTextKey = self->_unitChangeCautionaryTextKey;
  self->_unitChangeCautionaryTextKey = v25;

}

- (NSString)displayName
{
  return (NSString *)-[HKDisplayTypeLocalization _localizedStringWithKey:](self, "_localizedStringWithKey:", self->_displayNameKey);
}

- (HKDisplayTypeLocalization)init
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

- (NSString)displayNameForFitnessJr
{
  void *v3;
  void *v4;

  HKHealthKitFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", self->_displayNameFitnessJrKey, &stru_1E9C4C428, CFSTR("Localizable-tinker"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)labelDisplayName
{
  return (NSString *)-[HKDisplayTypeLocalization _localizedStringWithKey:](self, "_localizedStringWithKey:", self->_labelDisplayNameKey);
}

- (NSSet)keywords
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HKDisplayTypeLocalization _localizedStringWithKey:](self, "_localizedStringWithKey:", self->_keywordsNameKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v2, "componentsSeparatedByString:", CFSTR("|"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

- (NSString)shortenedDisplayName
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[HKDisplayTypeLocalization _localizedStringWithKey:](self, "_localizedStringWithKey:", self->_shortenedDisplayNameKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[HKDisplayTypeLocalization displayName](self, "displayName");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSString *)v6;
}

- (NSString)embeddedDisplayName
{
  return (NSString *)-[HKDisplayTypeLocalization _localizedStringWithKey:](self, "_localizedStringWithKey:", self->_embeddedDisplayNameKey);
}

- (NSString)titleEmbeddedDisplayName
{
  return (NSString *)-[HKDisplayTypeLocalization _localizedStringWithKey:](self, "_localizedStringWithKey:", self->_titleEmbeddedDisplayNameKey);
}

- (NSString)summaryForEnhancedFeature
{
  return (NSString *)-[HKDisplayTypeLocalization _localizedStringWithKey:](self, "_localizedStringWithKey:", self->_summaryForEnhancedFeatureNameKey);
}

- (NSString)summaryForFitnessJr
{
  void *v3;
  void *v4;

  HKHealthKitFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", self->_summaryFitnessJrKey, &stru_1E9C4C428, CFSTR("Localizable-tinker"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)summaryForPairedWatch
{
  return (NSString *)-[HKDisplayTypeLocalization _localizedStringForKeyOrNil:](self, "_localizedStringForKeyOrNil:", self->_summaryPairedWatchNameKey);
}

- (id)_localizedStringForKeyOrNil:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v4 = a3;
  -[HKDisplayTypeLocalization _localizedStringWithKey:](self, "_localizedStringWithKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  if (v6)
    v7 = 0;
  else
    v7 = v5;
  v8 = v7;

  return v8;
}

- (NSString)cautionaryText
{
  return (NSString *)-[HKDisplayTypeLocalization _localizedStringWithKey:](self, "_localizedStringWithKey:", self->_cautionaryTextKey);
}

- (NSString)unitChangeCautionaryText
{
  return (NSString *)-[HKDisplayTypeLocalization _localizedStringWithKey:](self, "_localizedStringWithKey:", self->_unitChangeCautionaryTextKey);
}

- (id)copyWithLocalizedKeySuffix:(id)a3
{
  id v4;
  HKDisplayTypeLocalization *v5;

  v4 = a3;
  v5 = -[HKDisplayTypeLocalization initWithDisplayNameKey:labelDisplayNameKey:localizationTableNameOverride:localizedKeySuffix:unitNameKeyOverrides:]([HKDisplayTypeLocalization alloc], "initWithDisplayNameKey:labelDisplayNameKey:localizationTableNameOverride:localizedKeySuffix:unitNameKeyOverrides:", self->_displayNameKey, self->_labelDisplayNameKey, self->_localizationTableNameOverride, v4, self->_unitNameKeyOverrides);

  return v5;
}

- (id)copyWithLocalizationTableNameOverride:(id)a3
{
  id v4;
  HKDisplayTypeLocalization *v5;

  v4 = a3;
  v5 = -[HKDisplayTypeLocalization initWithDisplayNameKey:labelDisplayNameKey:localizationTableNameOverride:localizedKeySuffix:unitNameKeyOverrides:]([HKDisplayTypeLocalization alloc], "initWithDisplayNameKey:labelDisplayNameKey:localizationTableNameOverride:localizedKeySuffix:unitNameKeyOverrides:", self->_displayNameKey, self->_labelDisplayNameKey, v4, self->_localizedKeySuffix, self->_unitNameKeyOverrides);

  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;

  v3 = -[NSString hash](self->_displayNameKey, "hash");
  v4 = -[NSString hash](self->_labelDisplayNameKey, "hash") ^ v3;
  v5 = -[NSString hash](self->_localizationTableNameOverride, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_localizedKeySuffix, "hash");
  return v6 ^ -[NSDictionary hash](self->_unitNameKeyOverrides, "hash");
}

- (BOOL)isEqual:(id)a3
{
  HKDisplayTypeLocalization *v4;
  NSString *displayNameKey;
  NSString *v6;
  NSString *labelDisplayNameKey;
  NSString *v8;
  NSString *localizationTableNameOverride;
  NSString *v10;
  NSString *localizedKeySuffix;
  NSString *v12;
  NSDictionary *unitNameKeyOverrides;
  NSDictionary *v14;
  char v15;

  v4 = (HKDisplayTypeLocalization *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_18;
  if (v4 == self)
    goto LABEL_19;
  displayNameKey = self->_displayNameKey;
  v6 = v4->_displayNameKey;
  if (displayNameKey != v6 && (!v6 || !-[NSString isEqualToString:](displayNameKey, "isEqualToString:")))
    goto LABEL_18;
  labelDisplayNameKey = self->_labelDisplayNameKey;
  v8 = v4->_labelDisplayNameKey;
  if (labelDisplayNameKey != v8 && (!v8 || !-[NSString isEqualToString:](labelDisplayNameKey, "isEqualToString:")))
    goto LABEL_18;
  localizationTableNameOverride = self->_localizationTableNameOverride;
  v10 = v4->_localizationTableNameOverride;
  if (localizationTableNameOverride != v10
    && (!v10 || !-[NSString isEqualToString:](localizationTableNameOverride, "isEqualToString:")))
  {
    goto LABEL_18;
  }
  localizedKeySuffix = self->_localizedKeySuffix;
  v12 = v4->_localizedKeySuffix;
  if (localizedKeySuffix != v12 && (!v12 || !-[NSString isEqualToString:](localizedKeySuffix, "isEqualToString:")))
    goto LABEL_18;
  unitNameKeyOverrides = self->_unitNameKeyOverrides;
  v14 = v4->_unitNameKeyOverrides;
  if (unitNameKeyOverrides == v14)
  {
LABEL_19:
    v15 = 1;
    goto LABEL_20;
  }
  if (!v14)
  {
LABEL_18:
    v15 = 0;
    goto LABEL_20;
  }
  v15 = -[NSDictionary isEqual:](unitNameKeyOverrides, "isEqual:");
LABEL_20:

  return v15;
}

- (NSString)displayNameKey
{
  return self->_displayNameKey;
}

- (NSString)localizedKeySuffix
{
  return self->_localizedKeySuffix;
}

- (NSDictionary)unitNameKeyOverrides
{
  return self->_unitNameKeyOverrides;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitNameKeyOverrides, 0);
  objc_storeStrong((id *)&self->_localizedKeySuffix, 0);
  objc_storeStrong((id *)&self->_localizationTableNameOverride, 0);
  objc_storeStrong((id *)&self->_unitChangeCautionaryTextKey, 0);
  objc_storeStrong((id *)&self->_cautionaryTextKey, 0);
  objc_storeStrong((id *)&self->_summaryFitnessJrKey, 0);
  objc_storeStrong((id *)&self->_displayNameFitnessJrKey, 0);
  objc_storeStrong((id *)&self->_summaryPairedWatchNameKey, 0);
  objc_storeStrong((id *)&self->_summaryForEnhancedFeatureNameKey, 0);
  objc_storeStrong((id *)&self->_summaryIPadNameKey, 0);
  objc_storeStrong((id *)&self->_summaryNameKey, 0);
  objc_storeStrong((id *)&self->_keywordsNameKey, 0);
  objc_storeStrong((id *)&self->_titleEmbeddedDisplayNameKey, 0);
  objc_storeStrong((id *)&self->_embeddedDisplayNameKey, 0);
  objc_storeStrong((id *)&self->_shortenedDisplayNameKey, 0);
  objc_storeStrong((id *)&self->_labelDisplayNameKey, 0);
  objc_storeStrong((id *)&self->_displayNameKey, 0);
}

@end
