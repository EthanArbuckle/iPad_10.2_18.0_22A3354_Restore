@implementation INIntentCodableDescription

- (id)_attributeKey
{
  return (id)objc_msgSend((id)objc_opt_class(), "__ParameterKey");
}

+ (id)__ParameterKey
{
  return CFSTR("INIntentParameter");
}

- (id)_attributesKey
{
  return (id)objc_msgSend((id)objc_opt_class(), "__ParametersKey");
}

+ (id)__ParametersKey
{
  return CFSTR("INIntentParameters");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)attributes
{
  void *v3;
  void *v4;
  void *v5;
  INCodableObjectAttribute *v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)INIntentCodableDescription;
  -[INCodableDescription attributes](&v11, sel_attributes);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", &unk_1E23E9A78);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = (void *)objc_msgSend(v3, "mutableCopy");
    v6 = objc_alloc_init(INCodableObjectAttribute);
    -[INCodableAttribute setModifier:](v6, "setModifier:", 1);
    -[INCodableAttribute setPropertyName:](v6, "setPropertyName:", CFSTR("_metadata"));
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableObjectAttribute setTypeName:](v6, "setTypeName:", v8);

    -[INCodableAttribute setDisplayPriorityRank:](v6, "setDisplayPriorityRank:", &unk_1E23E9A90);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, &unk_1E23E9A78);

    v9 = objc_msgSend(v5, "copy");
    -[INCodableDescription setAttributes:](self, "setAttributes:", v9);

    v3 = (void *)v9;
  }
  return v3;
}

- (void)_establishReferencedCodableDescriptionsUsingTypes:(id)a3 intentResponseCodableDescription:(id)a4
{
  id v6;
  INIntentCodableDescription *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[INIntentCodableDescription attributes](v7, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_calculateReferencedCodableDescriptionsFromAttributes:usingTypes:", v12, v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[INRootCodableDescription _setReferencedCodableDescriptions:](v7, "_setReferencedCodableDescriptions:", v13);

  objc_sync_exit(v7);
}

- (INIntentCodableDescription)initWithCoder:(id)a3
{
  id v4;
  INIntentCodableDescription *v5;
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
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)INIntentCodableDescription;
  v5 = -[INRootCodableDescription initWithCoder:](&v25, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("title"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[INIntentCodableDescription setTitle:](v5, "setTitle:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("titleLocID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[INIntentCodableDescription setTitleLocID:](v5, "setTitleLocID:", v10);

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("descriptiveText"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[INIntentCodableDescription setDescriptiveText:](v5, "setDescriptiveText:", v14);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("descriptiveTextLocID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[INIntentCodableDescription setDescriptiveTextLocID:](v5, "setDescriptiveTextLocID:", v15);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("verb"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[INIntentCodableDescription setVerb:](v5, "setVerb:", v16);

    -[INIntentCodableDescription setIntentCategory:](v5, "setIntentCategory:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("intentCategory")));
    -[INIntentCodableDescription setUserConfirmationRequired:](v5, "setUserConfirmationRequired:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("userConfirmationRequired")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("defaultImageName"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[INIntentCodableDescription setDefaultImageName:](v5, "setDefaultImageName:", v17);

    -[INIntentCodableDescription setConfigurable:](v5, "setConfigurable:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("configurable")));
    -[INIntentCodableDescription setForeground:](v5, "setForeground:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("foreground")));
    -[INIntentCodableDescription setDeprecated:](v5, "setDeprecated:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("deprecated")));
    -[INIntentCodableDescription setEligibleForSuggestions:](v5, "setEligibleForSuggestions:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("eligibleForSuggestions")));
    -[INIntentCodableDescription setEligibleForWidgets:](v5, "setEligibleForWidgets:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("eligibleForWidgets")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_inputAttributeName"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[INIntentCodableDescription _setInputAttributeName:](v5, "_setInputAttributeName:", v18);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_keyAttributeName"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[INIntentCodableDescription _setKeyAttributeName:](v5, "_setKeyAttributeName:", v19);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entityVerbs"));
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    if (v20)
      v22 = v20;
    else
      v22 = MEMORY[0x1E0C9AA60];
    -[INIntentCodableDescription setEntityVerbs:](v5, "setEntityVerbs:", v22);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("versioningHash"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[INIntentCodableDescription setVersioningHash:](v5, "setVersioningHash:", v23);

  }
  return v5;
}

- (void)updateWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
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
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  NSArray *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t i;
  uint64_t v56;
  INIntentCodablePhrase *v57;
  NSArray *phrases;
  void *v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  objc_super v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v65.receiver = self;
  v65.super_class = (Class)INIntentCodableDescription;
  -[INCodableDescription updateWithDictionary:](&v65, sel_updateWithDictionary_, v4);
  objc_msgSend((id)objc_opt_class(), "_intentClassNameWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableDescription setClassName:](self, "setClassName:", v5);

  objc_msgSend((id)objc_opt_class(), "__TitleKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v6);
  v7 = objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "__DescriptionKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v10 = v9;
    v9 = (void *)v7;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "__SummaryKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[INIntentCodableDescription setTitle:](self, "setTitle:", v9);
  objc_msgSend((id)objc_opt_class(), "__TitleIDKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentCodableDescription setTitleLocID:](self, "setTitleLocID:", v13);

  -[INIntentCodableDescription setDescriptiveText:](self, "setDescriptiveText:", v10);
  objc_msgSend((id)objc_opt_class(), "__DescriptionIDKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentCodableDescription setDescriptiveTextLocID:](self, "setDescriptiveTextLocID:", v15);

  objc_msgSend((id)objc_opt_class(), "__VerbKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentCodableDescription setVerb:](self, "setVerb:", v17);

  objc_msgSend((id)objc_opt_class(), "__CategoryKey");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentCodableDescription setIntentCategory:](self, "setIntentCategory:", INIntentCategoryWithString(v19));

  objc_msgSend((id)objc_opt_class(), "__DefaultImageNameKey");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentCodableDescription setDefaultImageName:](self, "setDefaultImageName:", v21);

  objc_msgSend((id)objc_opt_class(), "__UserConfirmationRequiredKey");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentCodableDescription setUserConfirmationRequired:](self, "setUserConfirmationRequired:", objc_msgSend(v23, "BOOLValue"));

  objc_msgSend((id)objc_opt_class(), "__ConfigurableKey");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentCodableDescription setConfigurable:](self, "setConfigurable:", objc_msgSend(v25, "BOOLValue"));

  objc_msgSend((id)objc_opt_class(), "__DeprecatedKey");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentCodableDescription setDeprecated:](self, "setDeprecated:", objc_msgSend(v27, "BOOLValue"));

  objc_msgSend((id)objc_opt_class(), "__ForegroundKey");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentCodableDescription setForeground:](self, "setForeground:", objc_msgSend(v29, "BOOLValue"));

  objc_msgSend((id)objc_opt_class(), "__IneligibleForSuggestionsKey");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentCodableDescription setEligibleForSuggestions:](self, "setEligibleForSuggestions:", objc_msgSend(v31, "BOOLValue") ^ 1);

  objc_msgSend((id)objc_opt_class(), "__EligibleForWidgetsKey");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentCodableDescription setEligibleForWidgets:](self, "setEligibleForWidgets:", objc_msgSend(v33, "BOOLValue"));

  objc_msgSend((id)objc_opt_class(), "__InputKey");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentCodableDescription _setInputAttributeName:](self, "_setInputAttributeName:", v35);

  objc_msgSend((id)objc_opt_class(), "__KeyParameterKey");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentCodableDescription _setKeyAttributeName:](self, "_setKeyAttributeName:", v37);

  objc_msgSend((id)objc_opt_class(), "__VerbAssociationsKey");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v38);
  v39 = objc_claimAutoreleasedReturnValue();
  v40 = (void *)v39;
  if (v39)
    v41 = v39;
  else
    v41 = MEMORY[0x1E0C9AA60];
  -[INIntentCodableDescription setEntityVerbs:](self, "setEntityVerbs:", v41);

  objc_msgSend((id)objc_opt_class(), "__EntityKey");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableDescription setSemanticRoot:](self, "setSemanticRoot:", v43);

  objc_msgSend((id)objc_opt_class(), "__HashKey");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentCodableDescription setVersioningHash:](self, "setVersioningHash:", v45);

  objc_msgSend((id)objc_opt_class(), "__PhrasesKey");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v48 = v47;
    else
      v48 = 0;
  }
  else
  {
    v48 = 0;
  }
  v49 = v48;

  if (objc_msgSend(v49, "count"))
  {
    v59 = v10;
    v60 = v4;
    v50 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v51 = v49;
    v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
    if (v52)
    {
      v53 = v52;
      v54 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v53; ++i)
        {
          if (*(_QWORD *)v62 != v54)
            objc_enumerationMutation(v51);
          v56 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v57 = objc_alloc_init(INIntentCodablePhrase);
            -[INIntentCodablePhrase _setCodableDescription:](v57, "_setCodableDescription:", self);
            -[INIntentCodablePhrase updateWithDictionary:](v57, "updateWithDictionary:", v56);
            -[NSArray if_addObjectIfNonNil:](v50, "if_addObjectIfNonNil:", v57);

          }
        }
        v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
      }
      while (v53);
    }

    phrases = self->_phrases;
    self->_phrases = v50;

    v4 = v60;
    v10 = v59;
  }

}

- (void)setVersioningHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (void)setVerb:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void)setUserConfirmationRequired:(BOOL)a3
{
  self->_userConfirmationRequired = a3;
}

- (void)setTitleLocID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void)setIntentCategory:(int64_t)a3
{
  self->_intentCategory = a3;
}

- (void)setForeground:(BOOL)a3
{
  self->_foreground = a3;
}

- (void)setEntityVerbs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (void)setEligibleForWidgets:(BOOL)a3
{
  self->_eligibleForWidgets = a3;
}

- (void)setEligibleForSuggestions:(BOOL)a3
{
  self->_eligibleForSuggestions = a3;
}

- (void)setDescriptiveTextLocID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (void)setDescriptiveText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void)setDeprecated:(BOOL)a3
{
  self->_deprecated = a3;
}

- (void)setDefaultImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (void)setConfigurable:(BOOL)a3
{
  self->_configurable = a3;
}

- (void)_setKeyAttributeName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void)_setInputAttributeName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

+ (id)__VerbAssociationsKey
{
  return CFSTR("INIntentVerbAssociations");
}

+ (id)__VerbKey
{
  return CFSTR("INIntentVerb");
}

+ (id)__UserConfirmationRequiredKey
{
  return CFSTR("INIntentUserConfirmationRequired");
}

+ (id)__TitleIDKey
{
  return CFSTR("INIntentTitleID");
}

+ (id)__TitleKey
{
  return CFSTR("INIntentTitle");
}

+ (id)__PhrasesKey
{
  return CFSTR("INIntentPhrases");
}

+ (id)__KeyParameterKey
{
  return CFSTR("INIntentKeyParameter");
}

+ (id)__InputKey
{
  return CFSTR("INIntentInput");
}

+ (id)__IneligibleForSuggestionsKey
{
  return CFSTR("INIntentIneligibleForSuggestions");
}

+ (id)__HashKey
{
  return CFSTR("INIntentHash");
}

+ (id)__ForegroundKey
{
  return CFSTR("INIntentForeground");
}

+ (id)__EntityKey
{
  return CFSTR("INIntentEntity");
}

+ (id)__EligibleForWidgetsKey
{
  return CFSTR("INIntentEligibleForWidgets");
}

+ (id)__DescriptionIDKey
{
  return CFSTR("INIntentDescriptionID");
}

+ (id)__DescriptionKey
{
  return CFSTR("INIntentDescription");
}

+ (id)__DeprecatedKey
{
  return CFSTR("INIntentDeprecated");
}

+ (id)__DefaultImageNameKey
{
  return CFSTR("INIntentDefaultImageName");
}

+ (id)__ConfigurableKey
{
  return CFSTR("INIntentConfigurable");
}

+ (id)__CategoryKey
{
  return CFSTR("INIntentCategory");
}

+ (id)_intentClassNameWithDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "__ClassNameKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    v6 = v5;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)objc_opt_class(), "__ClassPrefixKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (const __CFString *)v9;
    else
      v11 = &stru_1E2295770;
    objc_msgSend((id)objc_opt_class(), "__NameKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@%@Intent"), v11, v13);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

+ (id)__ClassNameKey
{
  return CFSTR("INIntentClassName");
}

- (NSNumber)versioningHash
{
  return self->_versioningHash;
}

- (BOOL)userConfirmationRequired
{
  return self->_userConfirmationRequired;
}

- (BOOL)isDeprecated
{
  return self->_deprecated;
}

- (BOOL)isConfigurable
{
  return self->_configurable;
}

- (NSString)verb
{
  return self->_verb;
}

- (int64_t)intentCategory
{
  return self->_intentCategory;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)INIntentCodableDescription;
  v4 = a3;
  -[INRootCodableDescription encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_title, CFSTR("title"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_titleLocID, CFSTR("titleLocID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_descriptiveText, CFSTR("descriptiveText"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_descriptiveTextLocID, CFSTR("descriptiveTextLocID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_verb, CFSTR("verb"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_intentCategory, CFSTR("intentCategory"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_userConfirmationRequired, CFSTR("userConfirmationRequired"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_defaultImageName, CFSTR("defaultImageName"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_configurable, CFSTR("configurable"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_foreground, CFSTR("foreground"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_deprecated, CFSTR("deprecated"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_eligibleForSuggestions, CFSTR("eligibleForSuggestions"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_eligibleForWidgets, CFSTR("eligibleForWidgets"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_inputAttributeName, CFSTR("_inputAttributeName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_keyAttributeName, CFSTR("_keyAttributeName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_entityVerbs, CFSTR("entityVerbs"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_versioningHash, CFSTR("versioningHash"));

}

- (NSString)defaultImageName
{
  return self->_defaultImageName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityVerbs, 0);
  objc_storeStrong((id *)&self->_versioningHash, 0);
  objc_storeStrong((id *)&self->_phrases, 0);
  objc_storeStrong((id *)&self->_verb, 0);
  objc_storeStrong((id *)&self->_defaultImageName, 0);
  objc_storeStrong((id *)&self->_descriptiveTextLocID, 0);
  objc_storeStrong((id *)&self->_descriptiveText, 0);
  objc_storeStrong((id *)&self->_titleLocID, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_keyAttributeName, 0);
  objc_storeStrong((id *)&self->_inputAttributeName, 0);
}

+ (id)__ClassPrefixKey
{
  return CFSTR("INIntentClassPrefix");
}

+ (id)__Key
{
  return CFSTR("INIntent");
}

- (id)resolvableParameterCombinationsWithParameterCombinations:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  char v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v22;
  void *v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v23 = v4;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v4, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v30;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v8);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v26;
          while (2)
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v26 != v13)
                objc_enumerationMutation(v10);
              -[INCodableDescription attributeByName:](self, "attributeByName:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v14));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "supportsResolution");

              if (!v16)
              {
                v17 = 1;
                goto LABEL_16;
              }
              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
            if (v12)
              continue;
            break;
          }
        }
        v17 = 0;
LABEL_16:

        v18 = objc_msgSend(v10, "count");
        if ((v17 & 1) == 0 && v18)
        {
          objc_msgSend(v23, "objectForKeyedSubscript:", v10);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v19, v10);

        }
        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v6);
  }

  v20 = (void *)objc_msgSend(v22, "copy");
  return v20;
}

- (INCodableAttribute)inputAttribute
{
  void *v3;
  void *v4;
  void *v5;

  -[INIntentCodableDescription _inputAttributeName](self, "_inputAttributeName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[INIntentCodableDescription _inputAttributeName](self, "_inputAttributeName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableDescription attributeByName:](self, "attributeByName:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (INCodableAttribute *)v5;
}

- (INCodableAttribute)keyAttribute
{
  void *v3;
  void *v4;
  void *v5;

  -[INIntentCodableDescription _keyAttributeName](self, "_keyAttributeName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[INIntentCodableDescription _keyAttributeName](self, "_keyAttributeName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[INCodableDescription attributeByName:](self, "attributeByName:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (INCodableAttribute *)v5;
}

- (NSString)localizedTitle
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[INIntentCodableDescription localizedTitleWithLocalizer:](self, "localizedTitleWithLocalizer:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)localizedTitleWithLocalizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[INIntentCodableDescription titleLocID](self, "titleLocID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentCodableDescription title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableDescription _customLocalizationTable](self, "_customLocalizationTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    INLocalizedStringFromCodable(v5, v6, v7, v4, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[INCodableDescription _localizationTable](self, "_localizationTable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    INLocalizedStringFromCodable(v5, v6, v9, v4, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (NSString)localizedDescriptiveText
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[INIntentCodableDescription localizedDescriptiveTextWithLocalizer:](self, "localizedDescriptiveTextWithLocalizer:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)localizedDescriptiveTextWithLocalizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[INIntentCodableDescription descriptiveTextLocID](self, "descriptiveTextLocID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentCodableDescription descriptiveText](self, "descriptiveText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableDescription _customLocalizationTable](self, "_customLocalizationTable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    INLocalizedStringFromCodable(v5, v6, v7, v4, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[INCodableDescription _localizationTable](self, "_localizationTable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    INLocalizedStringFromCodable(v5, v6, v9, v4, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)_ignoredAttributeTags
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", &unk_1E23E9A78);
}

- (id)dictionaryRepresentationWithLocalizer:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int64_t v17;
  __CFString *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
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
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  __CFString *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  objc_super v94;
  _BYTE v95[128];
  _QWORD v96[18];
  _QWORD v97[20];

  v97[18] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v94.receiver = self;
  v94.super_class = (Class)INIntentCodableDescription;
  -[INCodableDescription dictionaryRepresentationWithLocalizer:](&v94, sel_dictionaryRepresentationWithLocalizer_, v4);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "__ClassNameKey");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v96[0] = v88;
  -[INCodableDescription className](self, "className");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v56 = (void *)v5;
  v97[0] = v5;
  objc_msgSend((id)objc_opt_class(), "__TitleKey");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v96[1] = v86;
  -[INIntentCodableDescription localizedTitleWithLocalizer:](self, "localizedTitleWithLocalizer:", v4);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v55 = (void *)v7;
  v97[1] = v7;
  objc_msgSend((id)objc_opt_class(), "__TitleIDKey");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v96[2] = v84;
  -[INIntentCodableDescription titleLocID](self, "titleLocID");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v54 = (void *)v9;
  v97[2] = v9;
  objc_msgSend((id)objc_opt_class(), "__DescriptionKey");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v96[3] = v82;
  -[INIntentCodableDescription localizedDescriptiveTextWithLocalizer:](self, "localizedDescriptiveTextWithLocalizer:", v4);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v53 = (void *)v11;
  v97[3] = v11;
  objc_msgSend((id)objc_opt_class(), "__DescriptionIDKey");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v96[4] = v80;
  -[INIntentCodableDescription descriptiveTextLocID](self, "descriptiveTextLocID");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v52 = (void *)v13;
  v97[4] = v13;
  objc_msgSend((id)objc_opt_class(), "__VerbKey");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v96[5] = v78;
  -[INIntentCodableDescription verb](self, "verb");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v51 = (void *)v15;
  v97[5] = v15;
  objc_msgSend((id)objc_opt_class(), "__CategoryKey");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v96[6] = v76;
  v17 = -[INIntentCodableDescription intentCategory](self, "intentCategory");
  if ((unint64_t)(v17 - 1) > 0x13)
    v18 = CFSTR("unknown");
  else
    v18 = off_1E2292DC8[v17 - 1];
  v85 = v8;
  v87 = v6;
  v75 = v18;
  v97[6] = v75;
  objc_msgSend((id)objc_opt_class(), "__DefaultImageNameKey");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v96[7] = v74;
  -[INIntentCodableDescription defaultImageName](self, "defaultImageName");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v50 = (void *)v19;
  v97[7] = v19;
  objc_msgSend((id)objc_opt_class(), "__UserConfirmationRequiredKey");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v96[8] = v72;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INIntentCodableDescription userConfirmationRequired](self, "userConfirmationRequired"));
  v21 = objc_claimAutoreleasedReturnValue();
  v71 = (void *)v21;
  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v49 = (void *)v21;
  v97[8] = v21;
  objc_msgSend((id)objc_opt_class(), "__InputKey");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v96[9] = v70;
  -[INIntentCodableDescription _inputAttributeName](self, "_inputAttributeName");
  v22 = objc_claimAutoreleasedReturnValue();
  v69 = (void *)v22;
  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v48 = (void *)v22;
  v97[9] = v22;
  objc_msgSend((id)objc_opt_class(), "__KeyParameterKey");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v96[10] = v68;
  -[INIntentCodableDescription _keyAttributeName](self, "_keyAttributeName");
  v23 = objc_claimAutoreleasedReturnValue();
  v89 = (void *)v23;
  if (!v23)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = objc_claimAutoreleasedReturnValue();
  }
  v47 = (void *)v23;
  v97[10] = v23;
  objc_msgSend((id)objc_opt_class(), "__ConfigurableKey");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v96[11] = v67;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INIntentCodableDescription isConfigurable](self, "isConfigurable"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v97[11] = v66;
  objc_msgSend((id)objc_opt_class(), "__ForegroundKey");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v96[12] = v65;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INIntentCodableDescription isForeground](self, "isForeground"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v97[12] = v64;
  objc_msgSend((id)objc_opt_class(), "__DeprecatedKey");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v96[13] = v63;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[INIntentCodableDescription isDeprecated](self, "isDeprecated"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v97[13] = v62;
  objc_msgSend((id)objc_opt_class(), "__EntityKey");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v96[14] = v61;
  -[INCodableDescription semanticRoot](self, "semanticRoot");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v24;
  if (!v24)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v73 = v20;
  v79 = v14;
  v81 = v12;
  v83 = v10;
  v46 = (void *)v24;
  v97[14] = v24;
  objc_msgSend((id)objc_opt_class(), "__VerbAssociationsKey");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v96[15] = v60;
  -[INIntentCodableDescription entityVerbs](self, "entityVerbs");
  v26 = objc_claimAutoreleasedReturnValue();
  v59 = (void *)v26;
  if (!v26)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = objc_claimAutoreleasedReturnValue();
  }
  v45 = (void *)v26;
  v97[15] = v26;
  objc_msgSend((id)objc_opt_class(), "__PhrasesKey");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v96[16] = v57;
  -[INIntentCodableDescription phrases](self, "phrases");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "count");

  if (!v28)
    goto LABEL_38;
  v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  -[INIntentCodableDescription phrases](self, "phrases", v45, v46, v47, v48, v49, v50, v51, v52, v53, v54, v55, v56);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v90, v95, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v91;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v91 != v33)
          objc_enumerationMutation(v30);
        objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * i), "dictionaryRepresentationWithLocalizer:", v4);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "if_addObjectIfNonNil:", v35);

      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v90, v95, 16);
    }
    while (v32);
  }

  if (v29)
  {
    v36 = 0;
    v37 = v29;
  }
  else
  {
LABEL_38:
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v45);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    v36 = 1;
  }
  v97[16] = v37;
  objc_msgSend((id)objc_opt_class(), "__HashKey");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v96[17] = v38;
  -[INIntentCodableDescription versioningHash](self, "versioningHash");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39;
  if (!v39)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v97[17] = v40;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v97, v96, 18);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "if_dictionaryByAddingEntriesFromDictionary:", v41);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v39)
  if (v36)

  if (!v59)
  if (!v25)

  v42 = v89;
  if (!v89)
  {

    v42 = 0;
  }

  if (!v69)
  if (!v71)

  if (!v73)
  if (!v16)

  if (!v79)
  if (!v81)

  if (!v83)
  if (!v85)

  if (!v87)
  objc_msgSend(v58, "if_dictionaryWithNonEmptyValues");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  return v43;
}

- (void)_updateWithIntentCodableDescription:(id)a3
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
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
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
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "_localizationTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableDescription _setCustomLocalizationTable:](self, "_setCustomLocalizationTable:", v5);

  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentCodableDescription setTitle:](self, "setTitle:", v6);

  objc_msgSend(v4, "titleLocID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentCodableDescription setTitleLocID:](self, "setTitleLocID:", v7);

  objc_msgSend(v4, "descriptiveText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentCodableDescription setDescriptiveText:](self, "setDescriptiveText:", v8);

  objc_msgSend(v4, "descriptiveTextLocID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentCodableDescription setDescriptiveTextLocID:](self, "setDescriptiveTextLocID:", v9);

  objc_msgSend(v4, "defaultImageName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentCodableDescription setDefaultImageName:](self, "setDefaultImageName:", v10);

  if (objc_msgSend(v4, "isConfigurable"))
  {
    objc_msgSend(v4, "inputAttribute");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "propertyName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[INIntentCodableDescription _setInputAttributeName:](self, "_setInputAttributeName:", v12);

    objc_msgSend(v4, "keyAttribute");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "propertyName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[INIntentCodableDescription _setKeyAttributeName:](self, "_setKeyAttributeName:", v14);

  }
  v15 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[INIntentCodableDescription attributes](self, "attributes", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allValues");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v34 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v22, "propertyName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "attributeByName:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v24, "displayName");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setDisplayName:", v25);

        objc_msgSend(v24, "displayNameID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setDisplayNameID:", v26);

        if (objc_msgSend(v22, "supportsResolution"))
          objc_msgSend(v22, "setSupportsResolution:", objc_msgSend(v24, "supportsResolution"));
        objc_msgSend(v22, "setSupportsDynamicEnumeration:", objc_msgSend(v24, "supportsDynamicEnumeration"));
        objc_msgSend(v24, "metadata");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setMetadata:", v27);

        objc_msgSend(v24, "relationship");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setRelationship:", v28);

        objc_msgSend(v24, "displayPriorityRank");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setDisplayPriorityRank:", v29);

        objc_msgSend(v22, "displayPriorityRank");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
          objc_msgSend(v15, "addObject:", v22);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v19);
  }

  objc_msgSend(v15, "sortUsingComparator:", &__block_literal_global_34522);
  -[INCodableDescription setDisplayOrderedAttributes:](self, "setDisplayOrderedAttributes:", v15);
  objc_msgSend(v4, "entityVerbs");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentCodableDescription setEntityVerbs:](self, "setEntityVerbs:", v31);

  objc_msgSend(v4, "semanticRoot");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCodableDescription setSemanticRoot:](self, "setSemanticRoot:", v32);

}

- (void)_reestablishReferencedCodableDescriptionsUsingTypes:(id)a3 intentResponseCodableDescription:(id)a4
{
  id v6;
  INIntentCodableDescription *v7;
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
  id v18;

  v18 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  v8 = (void *)MEMORY[0x1E0C99E10];
  -[INRootCodableDescription referencedCodableDescriptions](v7, "referencedCodableDescriptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "orderedSetWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[INIntentCodableDescription attributes](v7, "attributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allValues");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "arrayByAddingObjectsFromArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_calculateReferencedCodableDescriptionsFromAttributes:usingTypes:", v15, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObjectsFromArray:", v16);

  objc_msgSend(v10, "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[INRootCodableDescription _setReferencedCodableDescriptions:](v7, "_setReferencedCodableDescriptions:", v17);

  objc_sync_exit(v7);
}

- (int64_t)codableDescriptionType
{
  return 4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3710], "_in_safeUnarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)widgetPlistableRepresentationWithParameters:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  objc_super v14;
  id v15;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)INIntentCodableDescription;
  v15 = 0;
  -[INRootCodableDescription widgetPlistableRepresentationWithParameters:error:](&v14, sel_widgetPlistableRepresentationWithParameters_error_, v6, &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v15;
  v9 = v8;
  if (v8)
  {
    v10 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v8);
  }
  else
  {
    -[NSString intents_encodeForPlistRepresentationWithParameters:](self->_title, "intents_encodeForPlistRepresentationWithParameters:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v11, CFSTR("title"));

    objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", self->_titleLocID, CFSTR("titleLocID"));
    -[NSString intents_encodeForPlistRepresentationWithParameters:](self->_descriptiveText, "intents_encodeForPlistRepresentationWithParameters:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", v12, CFSTR("descriptiveText"));

    objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", self->_descriptiveTextLocID, CFSTR("descriptiveTextLocID"));
    objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", self->_verb, CFSTR("verb"));
    objc_msgSend(v7, "intents_setIntegerIfNonZero:forKey:", self->_intentCategory, CFSTR("intentCategory"));
    objc_msgSend(v7, "intents_setBoolIfTrue:forKey:", self->_userConfirmationRequired, CFSTR("userConfirmationRequired"));
    objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", self->_defaultImageName, CFSTR("defaultImageName"));
    objc_msgSend(v7, "intents_setBoolIfTrue:forKey:", self->_configurable, CFSTR("configurable"));
    objc_msgSend(v7, "intents_setBoolIfTrue:forKey:", self->_foreground, CFSTR("foreground"));
    objc_msgSend(v7, "intents_setBoolIfTrue:forKey:", self->_deprecated, CFSTR("deprecated"));
    objc_msgSend(v7, "intents_setBoolIfTrue:forKey:", self->_eligibleForSuggestions, CFSTR("eligibleForSuggestions"));
    objc_msgSend(v7, "intents_setBoolIfTrue:forKey:", self->_eligibleForWidgets, CFSTR("eligibleForWidgets"));
    objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", self->_inputAttributeName, CFSTR("_inputAttributeName"));
    objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", self->_keyAttributeName, CFSTR("_keyAttributeName"));
    objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", self->_entityVerbs, CFSTR("entityVerbs"));
    objc_msgSend(v7, "intents_setPlistSafeObject:forKey:", self->_versioningHash, CFSTR("versioningHash"));
    v10 = v7;
  }

  return v10;
}

- (NSString)_inputAttributeName
{
  return self->_inputAttributeName;
}

- (NSString)_keyAttributeName
{
  return self->_keyAttributeName;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)titleLocID
{
  return self->_titleLocID;
}

- (NSString)descriptiveText
{
  return self->_descriptiveText;
}

- (NSString)descriptiveTextLocID
{
  return self->_descriptiveTextLocID;
}

- (BOOL)isForeground
{
  return self->_foreground;
}

- (BOOL)isEligibleForSuggestions
{
  return self->_eligibleForSuggestions;
}

- (BOOL)isEligibleForWidgets
{
  return self->_eligibleForWidgets;
}

- (NSArray)phrases
{
  return self->_phrases;
}

- (void)setPhrases:(id)a3
{
  objc_storeStrong((id *)&self->_phrases, a3);
}

- (NSArray)entityVerbs
{
  return self->_entityVerbs;
}

uint64_t __66__INIntentCodableDescription__updateWithIntentCodableDescription___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "displayPriorityRank");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayPriorityRank");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

+ (id)makeFromWidgetPlistableRepresentation:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  objc_super v24;
  id v25;

  v6 = a3;
  v24.receiver = a1;
  v24.super_class = (Class)&OBJC_METACLASS___INIntentCodableDescription;
  v25 = 0;
  objc_msgSendSuper2(&v24, sel_makeFromWidgetPlistableRepresentation_error_, v6, &v25);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v25;
  v9 = v8;
  if (v8)
  {
    v10 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v8);
  }
  else
  {
    objc_msgSend(v6, "intents_stringForKey:", CFSTR("title"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:", v11);

    objc_msgSend(v6, "intents_stringForKey:", CFSTR("titleLocID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitleLocID:", v12);

    objc_msgSend(v6, "intents_stringForKey:", CFSTR("descriptiveText"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDescriptiveText:", v13);

    objc_msgSend(v6, "intents_stringForKey:", CFSTR("descriptiveTextLocID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDescriptiveTextLocID:", v14);

    objc_msgSend(v6, "intents_stringForKey:", CFSTR("verb"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setVerb:", v15);

    objc_msgSend(v7, "setIntentCategory:", objc_msgSend(v6, "intents_intForKey:", CFSTR("intentCategory")));
    objc_msgSend(v7, "setUserConfirmationRequired:", objc_msgSend(v6, "intents_BOOLForKey:", CFSTR("userConfirmationRequired")));
    objc_msgSend(v6, "intents_stringForKey:", CFSTR("defaultImageName"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDefaultImageName:", v16);

    objc_msgSend(v7, "setConfigurable:", objc_msgSend(v6, "intents_BOOLForKey:", CFSTR("configurable")));
    objc_msgSend(v7, "setForeground:", objc_msgSend(v6, "intents_BOOLForKey:", CFSTR("foreground")));
    objc_msgSend(v7, "setDeprecated:", objc_msgSend(v6, "intents_BOOLForKey:", CFSTR("deprecated")));
    objc_msgSend(v7, "setEligibleForSuggestions:", objc_msgSend(v6, "intents_BOOLForKey:", CFSTR("eligibleForSuggestions")));
    objc_msgSend(v7, "setEligibleForWidgets:", objc_msgSend(v6, "intents_BOOLForKey:", CFSTR("eligibleForWidgets")));
    objc_msgSend(v6, "intents_stringForKey:", CFSTR("_inputAttributeName"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setInputAttributeName:", v17);

    objc_msgSend(v6, "intents_stringForKey:", CFSTR("_keyAttributeName"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setKeyAttributeName:", v18);

    objc_msgSend(v6, "intents_safeObjectForKey:ofType:", CFSTR("entityVerbs"), objc_opt_class());
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (v19)
      v21 = v19;
    else
      v21 = MEMORY[0x1E0C9AA60];
    objc_msgSend(v7, "setEntityVerbs:", v21);

    objc_msgSend(v6, "intents_numberForKey:", CFSTR("versioningHash"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setVersioningHash:", v22);

    v10 = v7;
  }

  return v10;
}

+ (id)__SummaryKey
{
  return CFSTR("INIntentSummary");
}

+ (id)__NameKey
{
  return CFSTR("INIntentName");
}

@end
