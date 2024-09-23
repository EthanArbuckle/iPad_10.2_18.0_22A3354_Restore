@implementation INCodableAttributeDialog

- (INCodableDescription)_codableDescription
{
  void *v2;
  void *v3;

  -[INCodableAttributeDialog _codableAttribute](self, "_codableAttribute");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_codableDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (INCodableDescription *)v3;
}

- (INCodableAttribute)_codableAttribute
{
  return (INCodableAttribute *)objc_loadWeakRetained((id *)&self->_codableAttribute);
}

- (void)_setCodableAttribute:(id)a3
{
  objc_storeWeak((id *)&self->_codableAttribute, a3);
}

- (void)updateWithDictionary:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *formatString;
  NSString *v8;
  NSString *formatStringID;
  id v10;

  v4 = a3;
  -[INCodableAttributeDialog __INCodableDescriptionFormatStringKey](self, "__INCodableDescriptionFormatStringKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  formatString = self->_formatString;
  self->_formatString = v6;

  -[INCodableAttributeDialog __INCodableDescriptionFormatStringIDKey](self, "__INCodableDescriptionFormatStringIDKey");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v10);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();

  formatStringID = self->_formatStringID;
  self->_formatStringID = v8;

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[INCodableAttributeDialog formatString](self, "formatString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("formatString"));

  -[INCodableAttributeDialog formatStringID](self, "formatStringID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("formatStringID"));

  -[INCodableAttributeDialog _codableAttribute](self, "_codableAttribute");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeConditionalObject:forKey:", v7, CFSTR("_codableAttribute"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatStringID, 0);
  objc_storeStrong((id *)&self->_formatString, 0);
  objc_destroyWeak((id *)&self->_codableAttribute);
}

- (INCodableAttributeDialog)initWithCoder:(id)a3
{
  id v4;
  INCodableAttributeDialog *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSString *formatString;
  uint64_t v11;
  NSString *formatStringID;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)INCodableAttributeDialog;
  v5 = -[INCodableAttributeDialog init](&v15, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("formatString"));
    v9 = objc_claimAutoreleasedReturnValue();
    formatString = v5->_formatString;
    v5->_formatString = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("formatStringID"));
    v11 = objc_claimAutoreleasedReturnValue();
    formatStringID = v5->_formatStringID;
    v5->_formatStringID = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_codableAttribute"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableAttributeDialog _setCodableAttribute:](v5, "_setCodableAttribute:", v13);

  }
  return v5;
}

- (NSString)formatString
{
  return self->_formatString;
}

- (NSString)formatStringID
{
  return self->_formatStringID;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[INCodableAttributeDialog formatString](self, "formatString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFormatString:", v5);

  -[INCodableAttributeDialog formatStringID](self, "formatStringID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFormatStringID:", v6);

  return v4;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[INCodableAttributeDialog formatString](self, "formatString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[INCodableAttributeDialog formatStringID](self, "formatStringID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  objc_super v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (v11.receiver = self,
        v11.super_class = (Class)INCodableAttributeDialog,
        -[INCodableAttributeDialog isEqual:](&v11, sel_isEqual_, v4)))
  {
    -[INCodableAttributeDialog formatStringID](self, "formatStringID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "formatStringID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", v6))
    {
      -[INCodableAttributeDialog formatString](self, "formatString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "formatString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)localizedDialogWithIntent:(id)a3 tokens:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  -[INCodableAttributeDialog localizedDialogWithIntent:tokens:localizer:](self, "localizedDialogWithIntent:tokens:localizer:", v7, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)localizedDialogWithIntent:(id)a3 tokens:(id)a4 forLanguage:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  +[INStringLocalizer localizerForLanguage:](INStringLocalizer, "localizerForLanguage:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableAttributeDialog localizedDialogWithIntent:tokens:localizer:](self, "localizedDialogWithIntent:tokens:localizer:", v9, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)localizedDialogWithIntent:(id)a3 tokens:(id)a4 localizer:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  INCodableLocalizationTable *v22;
  void *v23;
  void *v24;
  void *v25;
  __CFBundle *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  INCodableLocalizationTable *v46;
  void *v47;
  void *v48;
  id v49;
  const __CFString *v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "backingStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
  }
  else
  {
    v12 = 0;
  }
  v13 = v12;

  -[INCodableAttributeDialog _codableAttribute](self, "_codableAttribute");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = CFSTR("displayName");
  objc_msgSend(v14, "localizedDisplayNameWithLocalizer:", v10);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  v17 = &stru_1E2295770;
  if (v15)
    v17 = (const __CFString *)v15;
  v51[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "mutableCopy");

  objc_msgSend(v14, "metadata");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_localizedDialogTokensWithLocalizer:", v10);
  v21 = objc_claimAutoreleasedReturnValue();

  if (v21)
    objc_msgSend(v19, "addEntriesFromDictionary:", v21);
  if (v9)
    objc_msgSend(v19, "addEntriesFromDictionary:", v9);
  v47 = (void *)v21;
  v48 = v19;
  if (-[INCodableAttributeDialog isDefaultDialog](self, "isDefaultDialog"))
  {
    v22 = -[INCodableLocalizationTable initWithBundleIdentifier:tableName:]([INCodableLocalizationTable alloc], "initWithBundleIdentifier:tableName:", CFSTR("com.apple.Intents"), CFSTR("Localizable"));
  }
  else
  {
    objc_msgSend(v14, "_codableDescription");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_localizationTable");
    v22 = (INCodableLocalizationTable *)objc_claimAutoreleasedReturnValue();

  }
  -[INCodableAttributeDialog formatString](self, "formatString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableLocalizationTable bundleIdentifier](v22, "bundleIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (__CFBundle *)objc_msgSend(v10, "bundleWithIdentifier:fileURL:", v25, 0);

  v46 = v22;
  if (v26)
  {
    v44 = v13;
    v45 = v10;
    v42 = v14;
    v43 = v9;
    v27 = v8;
    v28 = objc_msgSend(v8, "_type");
    -[INCodableAttributeDialog formatStringID](self, "formatStringID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableAttributeDialog formatString](self, "formatString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableLocalizationTable tableName](v22, "tableName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28 == 2)
    {
      v32 = v27;
      INLocalizedFormatStringFromCodable(v29, v30, v31, v26, v45, v44, v48, 0, 0);
      v33 = objc_claimAutoreleasedReturnValue();
      v26 = 0;
    }
    else
    {
      v49 = 0;
      v32 = v27;
      INLocalizedFormatStringFromSlotComposing(v29, v30, v31, v26, v45, v27, v48, &v49);
      v33 = objc_claimAutoreleasedReturnValue();
      v26 = (__CFBundle *)v49;
    }

    v24 = (void *)v33;
    v8 = v32;
    v9 = v43;
    v13 = v44;
    v14 = v42;
    v10 = v45;
  }
  if (-[INCodableAttributeDialog isDefaultDialog](self, "isDefaultDialog"))
  {
    objc_msgSend(v14, "propertyName");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringByReplacingOccurrencesOfString:withString:", CFSTR("__PARAMETER_NAME__"), v34);
    v35 = objc_claimAutoreleasedReturnValue();

    v24 = (void *)v35;
  }
  if (objc_msgSend(v8, "_type") == 2)
  {
    v36 = v48;
    INReplaceVariablesInFormatStringFromCodable(v24, v10, v13, v48, 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v10, "languageCode");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v38, "isEqualToString:", v26))
    {
      v39 = v10;
    }
    else
    {
      +[INStringLocalizer localizerForLanguage:](INStringLocalizer, "localizerForLanguage:", v26);
      v39 = (id)objc_claimAutoreleasedReturnValue();
    }
    v40 = v39;

    INReplaceVariablesInFormatStringFromSlotComposing(v24, v40, v8);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = v48;
  }

  return v37;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[INCodableAttributeDialog dictionaryRepresentationWithLocalizer:](self, "dictionaryRepresentationWithLocalizer:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  id v4;
  void *v5;
  INCodableLocalizationTable *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  INCodableLocalizationTable *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v39;
  void *v40;
  id v41;
  INCodableLocalizationTable *v42;
  id v43;
  id v44;
  id v45;
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[2];
  _QWORD v49[3];

  v49[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[INCodableAttributeDialog _codableAttribute](self, "_codableAttribute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[INCodableAttributeDialog isDefaultDialog](self, "isDefaultDialog"))
  {
    v6 = -[INCodableLocalizationTable initWithBundleIdentifier:tableName:]([INCodableLocalizationTable alloc], "initWithBundleIdentifier:tableName:", CFSTR("com.apple.Intents"), CFSTR("Localizable"));
  }
  else
  {
    objc_msgSend(v5, "_codableDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_localizationTable");
    v6 = (INCodableLocalizationTable *)objc_claimAutoreleasedReturnValue();

  }
  -[INCodableAttributeDialog formatStringID](self, "formatStringID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableAttributeDialog formatString](self, "formatString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0;
  INLocalizedStringFromCodable(v8, v9, v6, v4, &v45);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v45;

  if (-[INCodableAttributeDialog isDefaultDialog](self, "isDefaultDialog"))
  {
    objc_msgSend(v5, "propertyName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("__PARAMETER_NAME__"), v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v13;
  }
  v41 = v11;
  v42 = v6;
  -[INCodableAttributeDialog __INCodableDescriptionFormatStringKey](self, "__INCodableDescriptionFormatStringKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v14;
  v15 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v40 = v5;
  v49[0] = v15;
  -[INCodableAttributeDialog __INCodableDescriptionFormatStringIDKey](self, "__INCodableDescriptionFormatStringIDKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v16;
  -[INCodableAttributeDialog formatStringID](self, "formatStringID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v49[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "mutableCopy");

  if (!v17)
  if (!v10)

  -[INCodableAttributeDialog __INCodableDescriptionFormatStringLanguageCodeKey](self, "__INCodableDescriptionFormatStringLanguageCodeKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v41;
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v41, v21);

  objc_msgSend(v4, "languageCode");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "length");

  v25 = v42;
  if (v24 && objc_msgSend(v10, "length"))
  {
    -[INCodableAttributeDialog formatString](self, "formatString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableAttributeDialog formatStringID](self, "formatStringID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 0;
    v44 = v26;
    INStringsDictEntryForKeyInTable(v27, &v44, v42, v4, &v43);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v44;

    v39 = v43;
    if (-[INCodableAttributeDialog isDefaultDialog](self, "isDefaultDialog"))
    {
      objc_msgSend(v40, "propertyName");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "stringByReplacingOccurrencesOfString:withString:", CFSTR("__PARAMETER_NAME__"), v30);
      v31 = objc_claimAutoreleasedReturnValue();

      v29 = (id)v31;
    }
    if (v28)
    {
      -[INCodableAttributeDialog __INCodableDescriptionFormatStringKey](self, "__INCodableDescriptionFormatStringKey");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = v32;
      v33 = v29;
      if (!v29)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v47[0] = v33;
      -[INCodableAttributeDialog __INCodableDescriptionFormatStringDictionaryKey](self, "__INCodableDescriptionFormatStringDictionaryKey", v39);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v46[1] = v34;
      v47[1] = v28;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addEntriesFromDictionary:", v35);

      if (!v29)
      -[INCodableAttributeDialog __INCodableDescriptionFormatStringDictionaryLanguageCodeKey](self, "__INCodableDescriptionFormatStringDictionaryLanguageCodeKey");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v39, v36);

      v22 = v41;
      v25 = v42;
    }

  }
  objc_msgSend(v20, "if_dictionaryWithNonEmptyValues", v39);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return v37;
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableAttributeDialog formatString](self, "formatString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "intents_encodeForPlistRepresentationWithParameters:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v9, CFSTR("formatString"));
  -[INCodableAttributeDialog formatStringID](self, "formatStringID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v10, CFSTR("formatStringID"));

  return v7;
}

- (void)setFormatString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setFormatStringID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isDefaultDialog
{
  return self->_defaultDialog;
}

- (void)setDefaultDialog:(BOOL)a3
{
  self->_defaultDialog = a3;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a3;
  v6 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "intents_stringForKey:", CFSTR("formatString"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v6[3];
  v6[3] = v7;

  objc_msgSend(v5, "intents_stringForKey:", CFSTR("formatStringID"));
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = (void *)v6[4];
  v6[4] = v9;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)__INCodableDescriptionFormatStringLanguageCodeKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeDialog _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeDialogFormatStringLanguageCodeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionFormatStringIDKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeDialog _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeDialogFormatStringIDKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionFormatStringDictionaryLanguageCodeKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeDialog _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeDialogFormatStringDictionaryLanguageCodeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionFormatStringDictionaryKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeDialog _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeDialogFormatStringDictionaryKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionFormatStringKey
{
  void *v2;
  void *v3;

  -[INCodableAttributeDialog _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INCodableAttributeDialogFormatStringKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
