@implementation INIntentResponseCodableCode

- (void)updateWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  int v20;

  v4 = a3;
  -[INIntentResponseCodableCode __INCodableDescriptionNameKey](self, "__INCodableDescriptionNameKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponseCodableCode setName:](self, "setName:", v6);

  -[INIntentResponseCodableCode __INCodableDescriptionFormatStringKey](self, "__INCodableDescriptionFormatStringKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponseCodableCode setFormatString:](self, "setFormatString:", v8);

  -[INIntentResponseCodableCode __INCodableDescriptionFormatStringIDKey](self, "__INCodableDescriptionFormatStringIDKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponseCodableCode setFormatStringLocID:](self, "setFormatStringLocID:", v10);

  -[INIntentResponseCodableCode __INCodableDescriptionConciseFormatStringKey](self, "__INCodableDescriptionConciseFormatStringKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponseCodableCode setConciseFormatString:](self, "setConciseFormatString:", v12);

  -[INIntentResponseCodableCode __INCodableDescriptionConciseFormatStringIDKey](self, "__INCodableDescriptionConciseFormatStringIDKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponseCodableCode setConciseFormatStringLocID:](self, "setConciseFormatStringLocID:", v14);

  -[INIntentResponseCodableCode __INCodableDescriptionSuccessKey](self, "__INCodableDescriptionSuccessKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[INIntentResponseCodableCode setSuccess:](self, "setSuccess:", objc_msgSend(v16, "BOOLValue"));
  -[INIntentResponseCodableCode name](self, "name");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("failure"));

  if ((v18 & 1) != 0
    || (-[INIntentResponseCodableCode name](self, "name"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("success")),
        v19,
        v20))
  {
    -[INIntentResponseCodableCode setSuccess:](self, "setSuccess:", v18 ^ 1u);
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (id)__INCodableDescriptionSuccessKey
{
  void *v2;
  void *v3;

  -[INIntentResponseCodableCode _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INIntentResponseCodableCodeSuccessKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionNameKey
{
  void *v2;
  void *v3;

  -[INIntentResponseCodableCode _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INIntentResponseCodableCodeNameKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (INIntentResponseCodableDescription)_codableDescription
{
  return (INIntentResponseCodableDescription *)objc_loadWeakRetained((id *)&self->__codableDescription);
}

- (id)__INCodableDescriptionFormatStringIDKey
{
  void *v2;
  void *v3;

  -[INIntentResponseCodableCode _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INIntentResponseCodableCodeFormatStringIDKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionFormatStringKey
{
  void *v2;
  void *v3;

  -[INIntentResponseCodableCode _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INIntentResponseCodableCodeFormatStringKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionConciseFormatStringIDKey
{
  void *v2;
  void *v3;

  -[INIntentResponseCodableCode _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INIntentResponseCodableCodeConciseFormatStringIDKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionConciseFormatStringKey
{
  void *v2;
  void *v3;

  -[INIntentResponseCodableCode _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INIntentResponseCodableCodeConciseFormatStringKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setValue:(int64_t)a3
{
  self->_value = a3;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setFormatStringLocID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setFormatString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setConciseFormatStringLocID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setConciseFormatString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)_setCodableDescription:(id)a3
{
  objc_storeWeak((id *)&self->__codableDescription, a3);
}

- (NSArray)parameterNames
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0C99E60];
  -[INIntentResponseCodableCode _parameterNamesFromString:](self, "_parameterNamesFromString:", self->_formatString);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponseCodableCode _parameterNamesFromString:](self, "_parameterNamesFromString:", self->_conciseFormatString);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v8;
}

- (id)_parameterNamesFromString:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0CB38E8], "_intents_sharedFormatRegularExpression");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v11), "resultByAdjustingRangesWithOffset:", 0, (_QWORD)v18);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "rangeAtIndex:", 1);
          objc_msgSend(v3, "substringWithRange:", v13, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
            objc_msgSend(v4, "addObject:", v15);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    v16 = (void *)objc_msgSend(v4, "copy");
  }
  else
  {
    v16 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v16;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[INIntentResponseCodableCode dictionaryRepresentationWithLocalizer:](self, "dictionaryRepresentationWithLocalizer:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  _QWORD v80[2];
  _QWORD v81[2];
  _QWORD v82[2];
  _QWORD v83[2];
  _QWORD v84[6];
  _QWORD v85[8];

  v85[6] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[INIntentResponseCodableCode _codableDescription](self, "_codableDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponseCodableCode formatStringLocID](self, "formatStringLocID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponseCodableCode formatString](self, "formatString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_localizationTable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = 0;
  INLocalizedStringFromCodable(v6, v7, v8, v4, &v79);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v79;

  -[INIntentResponseCodableCode conciseFormatStringLocID](self, "conciseFormatStringLocID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponseCodableCode conciseFormatString](self, "conciseFormatString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_localizationTable");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = 0;
  INLocalizedStringFromCodable(v11, v12, v13, v4, &v78);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v78;

  -[INIntentResponseCodableCode __INCodableDescriptionNameKey](self, "__INCodableDescriptionNameKey");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = v66;
  -[INIntentResponseCodableCode name](self, "name");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v61 = (void *)v14;
  v85[0] = v14;
  -[INIntentResponseCodableCode __INCodableDescriptionFormatStringKey](self, "__INCodableDescriptionFormatStringKey");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v84[1] = v64;
  v16 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v67 = v4;
  v60 = (void *)v16;
  v85[1] = v16;
  -[INIntentResponseCodableCode __INCodableDescriptionFormatStringIDKey](self, "__INCodableDescriptionFormatStringIDKey");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v84[2] = v63;
  -[INIntentResponseCodableCode formatStringLocID](self, "formatStringLocID");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v68 = (void *)v9;
  v59 = (void *)v17;
  v85[2] = v17;
  -[INIntentResponseCodableCode __INCodableDescriptionConciseFormatStringKey](self, "__INCodableDescriptionConciseFormatStringKey");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v84[3] = v62;
  v19 = v73;
  if (!v73)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v65 = v15;
  v69 = v10;
  v70 = v5;
  v85[3] = v19;
  -[INIntentResponseCodableCode __INCodableDescriptionConciseFormatStringIDKey](self, "__INCodableDescriptionConciseFormatStringIDKey");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v84[4] = v20;
  -[INIntentResponseCodableCode conciseFormatStringLocID](self, "conciseFormatStringLocID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v85[4] = v22;
  -[INIntentResponseCodableCode __INCodableDescriptionSuccessKey](self, "__INCodableDescriptionSuccessKey");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v84[5] = v23;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INIntentResponseCodableCode isSuccess](self, "isSuccess"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (!v24)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v85[5] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, v84, 6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = (void *)objc_msgSend(v26, "mutableCopy");

  if (!v24)
  if (!v21)

  v27 = v69;
  v28 = v70;
  v29 = v72;
  if (!v73)

  v30 = v68;
  if (!v18)

  if (!v68)
  if (!v65)

  -[INIntentResponseCodableCode __INCodableDescriptionFormatStringLanguageCodeKey](self, "__INCodableDescriptionFormatStringLanguageCodeKey");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v69, v31);

  -[INIntentResponseCodableCode __INCodableDescriptionConciseFormatStringLanguageCodeKey](self, "__INCodableDescriptionConciseFormatStringLanguageCodeKey");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setObject:forKeyedSubscript:", v71, v32);

  objc_msgSend(v67, "languageCode");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "length");

  if (v34)
  {
    if (objc_msgSend(v68, "length"))
    {
      -[INIntentResponseCodableCode formatString](self, "formatString");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[INIntentResponseCodableCode formatStringLocID](self, "formatStringLocID");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = v35;
      objc_msgSend(v70, "_localizationTable");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = 0;
      INStringsDictEntryForKeyInTable(v36, &v77, v37, v67, &v76);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v77;

      v40 = v76;
      if (v38)
      {
        -[INIntentResponseCodableCode __INCodableDescriptionFormatStringKey](self, "__INCodableDescriptionFormatStringKey");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v82[0] = v41;
        v42 = v39;
        if (!v39)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v83[0] = v42;
        -[INIntentResponseCodableCode __INCodableDescriptionFormatStringDictionaryKey](self, "__INCodableDescriptionFormatStringDictionaryKey");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v82[1] = v43;
        v83[1] = v38;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v83, v82, 2);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "addEntriesFromDictionary:", v44);

        if (!v39)
        -[INIntentResponseCodableCode __INCodableDescriptionFormatStringDictionaryLanguageCodeKey](self, "__INCodableDescriptionFormatStringDictionaryLanguageCodeKey");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "setObject:forKeyedSubscript:", v40, v45);

        v30 = v68;
        v27 = v69;
        v28 = v70;
      }

      v29 = v72;
    }
    if (objc_msgSend(v73, "length"))
    {
      -[INIntentResponseCodableCode conciseFormatString](self, "conciseFormatString");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[INIntentResponseCodableCode conciseFormatStringLocID](self, "conciseFormatStringLocID");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = v46;
      objc_msgSend(v28, "_localizationTable");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = 0;
      INStringsDictEntryForKeyInTable(v47, &v75, v48, v67, &v74);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v75;

      v51 = v74;
      if (v49)
      {
        -[INIntentResponseCodableCode __INCodableDescriptionConciseFormatStringKey](self, "__INCodableDescriptionConciseFormatStringKey");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v80[0] = v52;
        v53 = v50;
        if (!v50)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v81[0] = v53;
        -[INIntentResponseCodableCode __INCodableDescriptionConciseFormatStringDictionaryKey](self, "__INCodableDescriptionConciseFormatStringDictionaryKey");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v80[1] = v54;
        v81[1] = v49;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v81, v80, 2);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "addEntriesFromDictionary:", v55);

        if (!v50)
        -[INIntentResponseCodableCode __INCodableDescriptionConciseFormatStringDictionaryLanguageCodeKey](self, "__INCodableDescriptionConciseFormatStringDictionaryLanguageCodeKey");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "setObject:forKeyedSubscript:", v51, v56);

        v30 = v68;
        v27 = v69;
        v28 = v70;
      }

      v29 = v72;
    }
  }
  objc_msgSend(v29, "if_dictionaryWithNonEmptyValues");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  return v57;
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intents_setIntegerIfNonZero:forKey:", self->_value, CFSTR("value"));
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v7, "intents_setBoolIfTrue:forKey:", self->_success, CFSTR("success"));
  -[NSString intents_encodeForPlistRepresentationWithParameters:](self->_formatString, "intents_encodeForPlistRepresentationWithParameters:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v8, CFSTR("formatString"));

  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", self->_formatStringLocID, CFSTR("formatStringLocID"));
  -[NSString intents_encodeForPlistRepresentationWithParameters:](self->_conciseFormatString, "intents_encodeForPlistRepresentationWithParameters:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v9, CFSTR("conciseFormatString"));
  objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", self->_conciseFormatStringLocID, CFSTR("conciseFormatStringLocID"));
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t value;
  id v5;

  value = self->_value;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", value, CFSTR("value"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_success, CFSTR("success"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_formatString, CFSTR("formatString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_formatStringLocID, CFSTR("formatStringLocID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_conciseFormatString, CFSTR("conciseFormatString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_conciseFormatStringLocID, CFSTR("conciseFormatStringLocID"));

}

- (INIntentResponseCodableCode)initWithCoder:(id)a3
{
  id v4;
  INIntentResponseCodableCode *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)INIntentResponseCodableCode;
  v5 = -[INIntentResponseCodableCode init](&v18, sel_init);
  if (v5)
  {
    -[INIntentResponseCodableCode setValue:](v5, "setValue:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("value")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[INIntentResponseCodableCode setName:](v5, "setName:", v6);

    -[INIntentResponseCodableCode setSuccess:](v5, "setSuccess:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("success")));
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("formatString"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[INIntentResponseCodableCode setFormatString:](v5, "setFormatString:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("formatStringLocID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[INIntentResponseCodableCode setFormatStringLocID:](v5, "setFormatStringLocID:", v11);

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("conciseFormatString"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[INIntentResponseCodableCode setConciseFormatString:](v5, "setConciseFormatString:", v15);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("conciseFormatStringLocID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[INIntentResponseCodableCode setConciseFormatStringLocID:](v5, "setConciseFormatStringLocID:", v16);

  }
  return v5;
}

- (int64_t)value
{
  return self->_value;
}

- (BOOL)isSuccess
{
  return self->_success;
}

- (NSString)formatString
{
  return self->_formatString;
}

- (NSString)formatStringLocID
{
  return self->_formatStringLocID;
}

- (NSString)conciseFormatString
{
  return self->_conciseFormatString;
}

- (NSString)conciseFormatStringLocID
{
  return self->_conciseFormatStringLocID;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__codableDescription);
  objc_storeStrong((id *)&self->_conciseFormatStringLocID, 0);
  objc_storeStrong((id *)&self->_conciseFormatString, 0);
  objc_storeStrong((id *)&self->_formatStringLocID, 0);
  objc_storeStrong((id *)&self->_formatString, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v4;
  INIntentResponseCodableCode *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = objc_alloc_init(INIntentResponseCodableCode);
  -[INIntentResponseCodableCode setValue:](v5, "setValue:", objc_msgSend(v4, "intents_intForKey:", CFSTR("value")));
  objc_msgSend(v4, "intents_stringForKey:", CFSTR("name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponseCodableCode setName:](v5, "setName:", v6);

  -[INIntentResponseCodableCode setSuccess:](v5, "setSuccess:", objc_msgSend(v4, "intents_BOOLForKey:", CFSTR("success")));
  objc_msgSend(v4, "intents_stringForKey:", CFSTR("formatString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponseCodableCode setFormatString:](v5, "setFormatString:", v7);

  objc_msgSend(v4, "intents_stringForKey:", CFSTR("formatStringLocID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponseCodableCode setFormatStringLocID:](v5, "setFormatStringLocID:", v8);

  objc_msgSend(v4, "intents_stringForKey:", CFSTR("conciseFormatString"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponseCodableCode setConciseFormatString:](v5, "setConciseFormatString:", v9);

  objc_msgSend(v4, "intents_stringForKey:", CFSTR("conciseFormatStringLocID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[INIntentResponseCodableCode setConciseFormatStringLocID:](v5, "setConciseFormatStringLocID:", v10);
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)__INCodableDescriptionFormatStringLanguageCodeKey
{
  void *v2;
  void *v3;

  -[INIntentResponseCodableCode _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INIntentResponseCodableCodeFormatStringLanguageCodeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionFormatStringDictionaryLanguageCodeKey
{
  void *v2;
  void *v3;

  -[INIntentResponseCodableCode _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INIntentResponseCodableCodeFormatStringDictionaryLanguageCodeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionFormatStringDictionaryKey
{
  void *v2;
  void *v3;

  -[INIntentResponseCodableCode _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INIntentResponseCodableCodeFormatStringDictionaryKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionConciseFormatStringLanguageCodeKey
{
  void *v2;
  void *v3;

  -[INIntentResponseCodableCode _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INIntentResponseCodableCodeConciseFormatStringLanguageCodeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionConciseFormatStringDictionaryLanguageCodeKey
{
  void *v2;
  void *v3;

  -[INIntentResponseCodableCode _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INIntentResponseCodableCodeConciseFormatStringDictionaryLanguageCodeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)__INCodableDescriptionConciseFormatStringDictionaryKey
{
  void *v2;
  void *v3;

  -[INIntentResponseCodableCode _codableDescription](self, "_codableDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__INIntentResponseCodableCodeConciseFormatStringDictionaryKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
