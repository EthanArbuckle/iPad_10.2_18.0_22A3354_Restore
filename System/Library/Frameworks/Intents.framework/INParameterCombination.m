@implementation INParameterCombination

- (INParameterCombination)initWithCoder:(id)a3
{
  id v4;
  INParameterCombination *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  INCodableLocalizationTable *v18;
  void *v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)INParameterCombination;
  v5 = -[INParameterCombination init](&v21, sel_init);
  if (v5)
  {
    -[INParameterCombination setSupportsBackgroundExecution:](v5, "setSupportsBackgroundExecution:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsBackgroundExecution")));
    -[INParameterCombination setPrimary:](v5, "setPrimary:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("primary")));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("titleFormatString"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[INParameterCombination setTitleFormatString:](v5, "setTitleFormatString:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("titleFormatStringLocID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[INParameterCombination setTitleFormatStringLocID:](v5, "setTitleFormatStringLocID:", v10);

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("subtitleFormatString"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[INParameterCombination setSubtitleFormatString:](v5, "setSubtitleFormatString:", v14);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("subtitleFormatStringLocID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[INParameterCombination setSubtitleFormatStringLocID:](v5, "setSubtitleFormatStringLocID:", v15);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_localizationTable"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[INParameterCombination _setLocalizationTable:](v5, "_setLocalizationTable:", v16);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizationTable"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = objc_alloc_init(INCodableLocalizationTable);
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizationTable"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[INCodableLocalizationTable setTableName:](v18, "setTableName:", v19);

      -[INParameterCombination _setLocalizationTable:](v5, "_setLocalizationTable:", v18);
    }
  }

  return v5;
}

- (void)_setLocalizationTable:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)updateWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("INIntentParameterCombinationSupportsBackgroundExecution"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INParameterCombination setSupportsBackgroundExecution:](self, "setSupportsBackgroundExecution:", objc_msgSend(v5, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("INIntentParameterCombinationIsPrimary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INParameterCombination setPrimary:](self, "setPrimary:", objc_msgSend(v6, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("INIntentParameterCombinationTitle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INParameterCombination setTitleFormatString:](self, "setTitleFormatString:", v7);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("INIntentParameterCombinationTitleID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[INParameterCombination setTitleFormatStringLocID:](self, "setTitleFormatStringLocID:", v8);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("INIntentParameterCombinationSubtitle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[INParameterCombination setSubtitleFormatString:](self, "setSubtitleFormatString:", v9);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("INIntentParameterCombinationSubtitleID"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[INParameterCombination setSubtitleFormatStringLocID:](self, "setSubtitleFormatStringLocID:", v10);
}

- (void)setTitleFormatStringLocID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setTitleFormatString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setSupportsBackgroundExecution:(BOOL)a3
{
  self->_supportsBackgroundExecution = a3;
}

- (void)setSubtitleFormatStringLocID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setSubtitleFormatString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setPrimary:(BOOL)a3
{
  self->_primary = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)titleFormatString
{
  return self->_titleFormatString;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 supportsBackgroundExecution;
  id v5;

  supportsBackgroundExecution = self->_supportsBackgroundExecution;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", supportsBackgroundExecution, CFSTR("supportsBackgroundExecution"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_primary, CFSTR("primary"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_titleFormatString, CFSTR("titleFormatString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_titleFormatStringLocID, CFSTR("titleFormatStringLocID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subtitleFormatString, CFSTR("subtitleFormatString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subtitleFormatStringLocID, CFSTR("subtitleFormatStringLocID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizationTable, CFSTR("_localizationTable"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleFormatStringLocID, 0);
  objc_storeStrong((id *)&self->_subtitleFormatString, 0);
  objc_storeStrong((id *)&self->_titleFormatStringLocID, 0);
  objc_storeStrong((id *)&self->_titleFormatString, 0);
  objc_storeStrong((id *)&self->_localizationTable, 0);
}

- (NSString)localizedTitleFormatString
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[INParameterCombination localizedTitleFormatStringWithLocalizer:](self, "localizedTitleFormatStringWithLocalizer:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)localizedTitleFormatStringWithLocalizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[INParameterCombination titleFormatStringLocID](self, "titleFormatStringLocID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INParameterCombination titleFormatString](self, "titleFormatString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INParameterCombination _localizationTable](self, "_localizationTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  INLocalizedStringFromCodable(v5, v6, v7, v4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)localizedSubtitleFormatString
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[INParameterCombination localizedSubtitleFormatStringWithLocalizer:](self, "localizedSubtitleFormatStringWithLocalizer:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)localizedSubtitleFormatStringWithLocalizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[INParameterCombination subtitleFormatStringLocID](self, "subtitleFormatStringLocID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INParameterCombination subtitleFormatString](self, "subtitleFormatString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INParameterCombination _localizationTable](self, "_localizationTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  INLocalizedStringFromCodable(v5, v6, v7, v4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[INParameterCombination dictionaryRepresentationWithLocalizer:](self, "dictionaryRepresentationWithLocalizer:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[2];
  _QWORD v63[2];
  _QWORD v64[6];
  _QWORD v65[8];

  v65[6] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[INParameterCombination titleFormatStringLocID](self, "titleFormatStringLocID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INParameterCombination titleFormatString](self, "titleFormatString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INParameterCombination _localizationTable](self, "_localizationTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0;
  INLocalizedStringFromCodable(v5, v6, v7, v4, &v59);
  v8 = objc_claimAutoreleasedReturnValue();
  v51 = v59;

  -[INParameterCombination subtitleFormatStringLocID](self, "subtitleFormatStringLocID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[INParameterCombination subtitleFormatString](self, "subtitleFormatString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[INParameterCombination _localizationTable](self, "_localizationTable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0;
  INLocalizedStringFromCodable(v9, v10, v11, v4, &v58);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v58;

  v64[0] = CFSTR("INIntentParameterCombinationSupportsBackgroundExecution");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INParameterCombination supportsBackgroundExecution](self, "supportsBackgroundExecution"));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v48 = (void *)v12;
  v65[0] = v12;
  v64[1] = CFSTR("INIntentParameterCombinationIsPrimary");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INParameterCombination isPrimary](self, "isPrimary"));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v47 = (void *)v14;
  v65[1] = v14;
  v64[2] = CFSTR("INIntentParameterCombinationTitle");
  v16 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v65[2] = v16;
  v64[3] = CFSTR("INIntentParameterCombinationTitleID");
  -[INParameterCombination titleFormatStringLocID](self, "titleFormatStringLocID", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v50 = (void *)v8;
  v65[3] = v18;
  v64[4] = CFSTR("INIntentParameterCombinationSubtitle");
  v19 = v53;
  if (!v53)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = v4;
  v65[4] = v19;
  v64[5] = CFSTR("INIntentParameterCombinationSubtitleID");
  -[INParameterCombination subtitleFormatStringLocID](self, "subtitleFormatStringLocID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v65[5] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)objc_msgSend(v23, "mutableCopy");

  if (!v21)
  v24 = v20;
  if (!v53)

  if (!v17)
  if (v50)
  {
    if (v15)
      goto LABEL_21;
  }
  else
  {

    if (v15)
      goto LABEL_21;
  }

LABEL_21:
  if (!v13)

  v25 = v51;
  objc_msgSend(v52, "setObject:forKeyedSubscript:", v51, CFSTR("INIntentParameterCombinationTitleLanguageCode"));
  objc_msgSend(v52, "setObject:forKeyedSubscript:", v49, CFSTR("INIntentParameterCombinationSubtitleLanguageCode"));
  objc_msgSend(v20, "languageCode");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "length");

  if (v27)
  {
    if (objc_msgSend(v50, "length"))
    {
      -[INParameterCombination titleFormatString](self, "titleFormatString");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[INParameterCombination titleFormatStringLocID](self, "titleFormatStringLocID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v28;
      -[INParameterCombination _localizationTable](self, "_localizationTable");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = 0;
      INStringsDictEntryForKeyInTable(v29, &v57, v30, v24, &v56);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v57;

      v33 = v56;
      if (v31)
      {
        v62[0] = CFSTR("INIntentParameterCombinationTitle");
        v34 = v32;
        if (!v32)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v62[1] = CFSTR("INIntentParameterCombinationTitleDictionary");
        v63[0] = v34;
        v63[1] = v31;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 2);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "addEntriesFromDictionary:", v35);

        if (!v32)
        objc_msgSend(v52, "setObject:forKeyedSubscript:", v33, CFSTR("INIntentParameterCombinationTitleDictionaryLanguageCode"));
        v25 = v51;
      }

    }
    if (objc_msgSend(v53, "length"))
    {
      -[INParameterCombination subtitleFormatString](self, "subtitleFormatString");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[INParameterCombination subtitleFormatStringLocID](self, "subtitleFormatStringLocID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v36;
      -[INParameterCombination _localizationTable](self, "_localizationTable");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = 0;
      INStringsDictEntryForKeyInTable(v37, &v55, v38, v24, &v54);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v55;

      v41 = v54;
      if (v39)
      {
        v60[0] = CFSTR("INIntentParameterCombinationSubtitle");
        v42 = v40;
        if (!v40)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v60[1] = CFSTR("INIntentParameterCombinationSubtitleDictionary");
        v61[0] = v42;
        v61[1] = v39;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 2);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "addEntriesFromDictionary:", v43);

        if (!v40)
        objc_msgSend(v52, "setObject:forKeyedSubscript:", v41, CFSTR("INIntentParameterCombinationSubtitleDictionaryLanguageCode"));
      }

    }
  }
  objc_msgSend(v52, "if_dictionaryWithNonEmptyValues");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  return v44;
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  INCodableLocalizationTable *localizationTable;
  id v12;
  void *v13;
  void *v14;
  id v16;

  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a3;
  objc_msgSend(v6, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "intents_setBoolIfTrue:forKey:", self->_supportsBackgroundExecution, CFSTR("supportsBackgroundExecution"));
  objc_msgSend(v8, "intents_setBoolIfTrue:forKey:", self->_primary, CFSTR("primary"));
  -[NSString intents_encodeForPlistRepresentationWithParameters:](self->_titleFormatString, "intents_encodeForPlistRepresentationWithParameters:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "intents_setPlistSafeObject:forKey:", v9, CFSTR("titleFormatString"));

  objc_msgSend(v8, "intents_setPlistSafeObject:forKey:", self->_titleFormatStringLocID, CFSTR("titleFormatStringLocID"));
  -[NSString intents_encodeForPlistRepresentationWithParameters:](self->_subtitleFormatString, "intents_encodeForPlistRepresentationWithParameters:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "intents_setPlistSafeObject:forKey:", v10, CFSTR("subtitleFormatString"));
  objc_msgSend(v8, "intents_setPlistSafeObject:forKey:", self->_subtitleFormatStringLocID, CFSTR("subtitleFormatStringLocID"));
  localizationTable = self->_localizationTable;
  v16 = 0;
  objc_msgSend(v8, "intents_setWidgetPlistRepresentable:forKey:error:", localizationTable, CFSTR("_localizationTable"), &v16);
  v12 = v16;
  v13 = v12;
  if (v12)
  {
    v14 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v12);
  }
  else
  {
    v14 = (void *)objc_msgSend(v8, "copy");
  }

  return v14;
}

- (NSString)description
{
  return (NSString *)-[INParameterCombination descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INParameterCombination;
  -[INParameterCombination description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INParameterCombination _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  const __CFString *v3;
  const __CFString *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD v25[8];
  _QWORD v26[10];

  v26[8] = *MEMORY[0x1E0C80C00];
  v25[0] = CFSTR("supportsBackgroundExecution");
  if (-[INParameterCombination supportsBackgroundExecution](self, "supportsBackgroundExecution"))
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  v26[0] = v3;
  v25[1] = CFSTR("isPrimary");
  if (-[INParameterCombination isPrimary](self, "isPrimary"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  v26[1] = v4;
  v25[2] = CFSTR("titleFormatString");
  -[INParameterCombination titleFormatString](self, "titleFormatString");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v5;
  v26[2] = v5;
  v25[3] = CFSTR("titleFormatStringLocID");
  -[INParameterCombination titleFormatStringLocID](self, "titleFormatStringLocID");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v7;
  v26[3] = v7;
  v25[4] = CFSTR("subtitleFormatString");
  -[INParameterCombination subtitleFormatString](self, "subtitleFormatString");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)v9;
  v26[4] = v9;
  v25[5] = CFSTR("subtitleFormatStringLocID");
  -[INParameterCombination subtitleFormatStringLocID](self, "subtitleFormatStringLocID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24 = v6;
  v26[5] = v12;
  v25[6] = CFSTR("_localizationTable.tableName");
  -[INParameterCombination _localizationTable](self, "_localizationTable");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "tableName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26[6] = v15;
  v25[7] = CFSTR("_localizationTable.bundleIdentifier");
  -[INParameterCombination _localizationTable](self, "_localizationTable");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bundleIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26[7] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 8);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  if (!v17)

  if (!v14)
  if (!v11)

  if (!v10)
  if (!v8)

  if (!v24)
  return v23;
}

- (INCodableLocalizationTable)_localizationTable
{
  return self->_localizationTable;
}

- (BOOL)isPrimary
{
  return self->_primary;
}

- (BOOL)supportsBackgroundExecution
{
  return self->_supportsBackgroundExecution;
}

- (NSString)titleFormatStringLocID
{
  return self->_titleFormatStringLocID;
}

- (NSString)subtitleFormatString
{
  return self->_subtitleFormatString;
}

- (NSString)subtitleFormatStringLocID
{
  return self->_subtitleFormatStringLocID;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v5;
  INParameterCombination *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  INParameterCombination *v14;
  id v16;

  v5 = a3;
  v6 = objc_alloc_init(INParameterCombination);
  -[INParameterCombination setSupportsBackgroundExecution:](v6, "setSupportsBackgroundExecution:", objc_msgSend(v5, "intents_BOOLForKey:", CFSTR("supportsBackgroundExecution")));
  -[INParameterCombination setPrimary:](v6, "setPrimary:", objc_msgSend(v5, "intents_BOOLForKey:", CFSTR("primary")));
  objc_msgSend(v5, "intents_stringForKey:", CFSTR("titleFormatString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INParameterCombination setTitleFormatString:](v6, "setTitleFormatString:", v7);

  objc_msgSend(v5, "intents_stringForKey:", CFSTR("titleFormatStringLocID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[INParameterCombination setTitleFormatStringLocID:](v6, "setTitleFormatStringLocID:", v8);

  objc_msgSend(v5, "intents_stringForKey:", CFSTR("subtitleFormatString"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[INParameterCombination setSubtitleFormatString:](v6, "setSubtitleFormatString:", v9);

  objc_msgSend(v5, "intents_stringForKey:", CFSTR("subtitleFormatStringLocID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[INParameterCombination setSubtitleFormatStringLocID:](v6, "setSubtitleFormatStringLocID:", v10);

  v16 = 0;
  +[NSObject intents_widgetPlistRepresentableInDict:key:error:](INCodableLocalizationTable, "intents_widgetPlistRepresentableInDict:key:error:", v5, CFSTR("_localizationTable"), &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v16;
  v13 = v12;
  if (v12)
  {
    v14 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v12);
  }
  else
  {
    -[INParameterCombination _setLocalizationTable:](v6, "_setLocalizationTable:", v11);
    v14 = v6;
  }

  return v14;
}

@end
