@implementation ATXPosterDescriptorGalleryOptions

- (ATXPosterDescriptorGalleryOptions)init
{
  ATXPosterDescriptorGalleryOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ATXPosterDescriptorGalleryOptions;
  result = -[ATXPosterDescriptorGalleryOptions init](&v3, sel_init);
  if (result)
  {
    *(_WORD *)&result->_allowsSystemSuggestedComplications = 257;
    result->_featuredConfidenceLevel = 1;
  }
  return result;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  const __CFString *v14;
  void *v15;
  id v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  const __CFString *v30;
  void *v31;
  id v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  const __CFString *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;

  v3 = (void *)objc_opt_new();
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[ATXPosterDescriptorGalleryOptions modularComplications](self, "modularComplications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("modularComplications: %@"), v5);
  objc_msgSend(v3, "addObject:", v6);

  v7 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[ATXPosterDescriptorGalleryOptions modularLandscapeComplications](self, "modularLandscapeComplications");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("modularLandscapeComplications: %@"), v8);
  objc_msgSend(v3, "addObject:", v9);

  v10 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[ATXPosterDescriptorGalleryOptions inlineComplication](self, "inlineComplication");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("inlineComplication: %@"), v11);
  objc_msgSend(v3, "addObject:", v12);

  v13 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (-[ATXPosterDescriptorGalleryOptions allowsSystemSuggestedComplications](self, "allowsSystemSuggestedComplications"))
  {
    v14 = CFSTR("YES");
  }
  else
  {
    v14 = CFSTR("NO");
  }
  v15 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("allowsSystemSuggestedComplications: %@"), v14);
  objc_msgSend(v3, "addObject:", v15);

  v16 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (-[ATXPosterDescriptorGalleryOptions allowsSystemSuggestedComplicationsInLandscape](self, "allowsSystemSuggestedComplicationsInLandscape"))
  {
    v17 = CFSTR("YES");
  }
  else
  {
    v17 = CFSTR("NO");
  }
  v18 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("allowsSystemSuggestedComplicationsInLandscape: %@"), v17);
  objc_msgSend(v3, "addObject:", v18);

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("featuredConfidenceLevel: %zd"), -[ATXPosterDescriptorGalleryOptions featuredConfidenceLevel](self, "featuredConfidenceLevel"));
  objc_msgSend(v3, "addObject:", v19);

  v20 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[ATXPosterDescriptorGalleryOptions displayNameLocalizationKey](self, "displayNameLocalizationKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithFormat:", CFSTR("displayNameLocalizationKey: %@"), v21);
  objc_msgSend(v3, "addObject:", v22);

  v23 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[ATXPosterDescriptorGalleryOptions spokenNameLocalizationKey](self, "spokenNameLocalizationKey");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v23, "initWithFormat:", CFSTR("spokenNameLocalizationKey: %@"), v24);
  objc_msgSend(v3, "addObject:", v25);

  v26 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[ATXPosterDescriptorGalleryOptions descriptiveTextLocalizationKey](self, "descriptiveTextLocalizationKey");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v26, "initWithFormat:", CFSTR("descriptiveTextLocalizationKey: %@"), v27);
  objc_msgSend(v3, "addObject:", v28);

  v29 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (-[ATXPosterDescriptorGalleryOptions isHero](self, "isHero"))
    v30 = CFSTR("YES");
  else
    v30 = CFSTR("NO");
  v31 = (void *)objc_msgSend(v29, "initWithFormat:", CFSTR("hero: %@"), v30);
  objc_msgSend(v3, "addObject:", v31);

  v32 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (-[ATXPosterDescriptorGalleryOptions shouldShowAsShuffleStack](self, "shouldShowAsShuffleStack"))
    v33 = CFSTR("YES");
  else
    v33 = CFSTR("NO");
  v34 = (void *)objc_msgSend(v32, "initWithFormat:", CFSTR("shouldShowAsShuffleStack: %@"), v33);
  objc_msgSend(v3, "addObject:", v34);

  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("photoSubtype: %zd"), -[ATXPosterDescriptorGalleryOptions photoSubtype](self, "photoSubtype"));
  objc_msgSend(v3, "addObject:", v35);

  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("focus: %zd"), -[ATXPosterDescriptorGalleryOptions focus](self, "focus"));
  objc_msgSend(v3, "addObject:", v36);

  v37 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (-[ATXPosterDescriptorGalleryOptions isOnlyEligibleForMadeForFocusSection](self, "isOnlyEligibleForMadeForFocusSection"))
  {
    v38 = CFSTR("YES");
  }
  else
  {
    v38 = CFSTR("NO");
  }
  v39 = (void *)objc_msgSend(v37, "initWithFormat:", CFSTR("isOnlyEligibleForMadeForFocusSection: %@"), v38);
  objc_msgSend(v3, "addObject:", v39);

  v40 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v40, "initWithFormat:", CFSTR("<ATXPosterDescriptorGalleryOptions: %@>"), v41);

  return v42;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXPosterDescriptorGalleryOptions)initWithCoder:(id)a3
{
  id v4;
  ATXPosterDescriptorGalleryOptions *v5;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (ATXPosterDescriptorGalleryOptions *)objc_opt_new();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v27[0] = objc_opt_class();
  v27[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("modularComplications"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = (void *)MEMORY[0x1E0C99E60];
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("preferredComplications"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "_pas_mappedArrayWithTransform:", &__block_literal_global_20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[ATXPosterDescriptorGalleryOptions setModularComplications:](v5, "setModularComplications:", v9);
  v14 = (void *)MEMORY[0x1E0C99E60];
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("modularLandscapeComplications"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXPosterDescriptorGalleryOptions setModularLandscapeComplications:](v5, "setModularLandscapeComplications:", v17);
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inlineComplication"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preferredInlineComplication"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      ATXComplicationFromCHSWidget(v19);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }

  }
  -[ATXPosterDescriptorGalleryOptions setInlineComplication:](v5, "setInlineComplication:", v18);
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("allowsSystemSuggestedComplications")))
    -[ATXPosterDescriptorGalleryOptions setAllowsSystemSuggestedComplications:](v5, "setAllowsSystemSuggestedComplications:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsSystemSuggestedComplications")));
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("allowsSystemSuggestedComplicationsInLandscape")))
    -[ATXPosterDescriptorGalleryOptions setAllowsSystemSuggestedComplicationsInLandscape:](v5, "setAllowsSystemSuggestedComplicationsInLandscape:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsSystemSuggestedComplicationsInLandscape")));
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("featuredConfidenceLevel")))
    -[ATXPosterDescriptorGalleryOptions setFeaturedConfidenceLevel:](v5, "setFeaturedConfidenceLevel:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("featuredConfidenceLevel")));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayNameLocalizationKey"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPosterDescriptorGalleryOptions setDisplayNameLocalizationKey:](v5, "setDisplayNameLocalizationKey:", v21);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("spokenNameLocalizationKey"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPosterDescriptorGalleryOptions setSpokenNameLocalizationKey:](v5, "setSpokenNameLocalizationKey:", v22);

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("descriptiveTextLocalizationKey"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPosterDescriptorGalleryOptions setDescriptiveTextLocalizationKey:](v5, "setDescriptiveTextLocalizationKey:", v23);

  -[ATXPosterDescriptorGalleryOptions setHero:](v5, "setHero:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hero")));
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("blankTemplate")))
    -[ATXPosterDescriptorGalleryOptions setHero:](v5, "setHero:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("blankTemplate")));
  -[ATXPosterDescriptorGalleryOptions setShouldShowAsShuffleStack:](v5, "setShouldShowAsShuffleStack:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldShowAsShuffleStack")));
  -[ATXPosterDescriptorGalleryOptions setPhotoSubtype:](v5, "setPhotoSubtype:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("photoSubtype")));
  -[ATXPosterDescriptorGalleryOptions setFocus:](v5, "setFocus:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("focus")));
  -[ATXPosterDescriptorGalleryOptions setOnlyEligibleForMadeForFocusSection:](v5, "setOnlyEligibleForMadeForFocusSection:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("onlyEligibleForMadeForFocusSection")));

  return v5;
}

ATXComplication *__51__ATXPosterDescriptorGalleryOptions_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  return ATXComplicationFromCHSWidget(a2);
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[ATXPosterDescriptorGalleryOptions modularComplications](self, "modularComplications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v4, CFSTR("modularComplications"));

  -[ATXPosterDescriptorGalleryOptions modularLandscapeComplications](self, "modularLandscapeComplications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("modularLandscapeComplications"));

  -[ATXPosterDescriptorGalleryOptions inlineComplication](self, "inlineComplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v6, CFSTR("inlineComplication"));

  objc_msgSend(v10, "encodeBool:forKey:", -[ATXPosterDescriptorGalleryOptions allowsSystemSuggestedComplications](self, "allowsSystemSuggestedComplications"), CFSTR("allowsSystemSuggestedComplications"));
  objc_msgSend(v10, "encodeBool:forKey:", -[ATXPosterDescriptorGalleryOptions allowsSystemSuggestedComplicationsInLandscape](self, "allowsSystemSuggestedComplicationsInLandscape"), CFSTR("allowsSystemSuggestedComplicationsInLandscape"));
  objc_msgSend(v10, "encodeInteger:forKey:", -[ATXPosterDescriptorGalleryOptions featuredConfidenceLevel](self, "featuredConfidenceLevel"), CFSTR("featuredConfidenceLevel"));
  -[ATXPosterDescriptorGalleryOptions displayNameLocalizationKey](self, "displayNameLocalizationKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("displayNameLocalizationKey"));

  -[ATXPosterDescriptorGalleryOptions spokenNameLocalizationKey](self, "spokenNameLocalizationKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("spokenNameLocalizationKey"));

  -[ATXPosterDescriptorGalleryOptions descriptiveTextLocalizationKey](self, "descriptiveTextLocalizationKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("descriptiveTextLocalizationKey"));

  objc_msgSend(v10, "encodeBool:forKey:", -[ATXPosterDescriptorGalleryOptions isHero](self, "isHero"), CFSTR("hero"));
  objc_msgSend(v10, "encodeBool:forKey:", -[ATXPosterDescriptorGalleryOptions shouldShowAsShuffleStack](self, "shouldShowAsShuffleStack"), CFSTR("shouldShowAsShuffleStack"));
  objc_msgSend(v10, "encodeInteger:forKey:", -[ATXPosterDescriptorGalleryOptions photoSubtype](self, "photoSubtype"), CFSTR("photoSubtype"));
  objc_msgSend(v10, "encodeBool:forKey:", -[ATXPosterDescriptorGalleryOptions isOnlyEligibleForMadeForFocusSection](self, "isOnlyEligibleForMadeForFocusSection"), CFSTR("onlyEligibleForMadeForFocusSection"));
  objc_msgSend(v10, "encodeInteger:forKey:", -[ATXPosterDescriptorGalleryOptions focus](self, "focus"), CFSTR("focus"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  ATXPosterDescriptorGalleryOptions *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = -[ATXPosterDescriptorGalleryOptions init](+[ATXPosterDescriptorGalleryOptions allocWithZone:](ATXPosterDescriptorGalleryOptions, "allocWithZone:", a3), "init");
  -[ATXPosterDescriptorGalleryOptions modularComplications](self, "modularComplications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPosterDescriptorGalleryOptions setModularComplications:](v4, "setModularComplications:", v5);

  -[ATXPosterDescriptorGalleryOptions modularLandscapeComplications](self, "modularLandscapeComplications");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPosterDescriptorGalleryOptions setModularLandscapeComplications:](v4, "setModularLandscapeComplications:", v6);

  -[ATXPosterDescriptorGalleryOptions inlineComplication](self, "inlineComplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPosterDescriptorGalleryOptions setInlineComplication:](v4, "setInlineComplication:", v7);

  -[ATXPosterDescriptorGalleryOptions setAllowsSystemSuggestedComplications:](v4, "setAllowsSystemSuggestedComplications:", -[ATXPosterDescriptorGalleryOptions allowsSystemSuggestedComplications](self, "allowsSystemSuggestedComplications"));
  -[ATXPosterDescriptorGalleryOptions setAllowsSystemSuggestedComplicationsInLandscape:](v4, "setAllowsSystemSuggestedComplicationsInLandscape:", -[ATXPosterDescriptorGalleryOptions allowsSystemSuggestedComplicationsInLandscape](self, "allowsSystemSuggestedComplicationsInLandscape"));
  -[ATXPosterDescriptorGalleryOptions setFeaturedConfidenceLevel:](v4, "setFeaturedConfidenceLevel:", -[ATXPosterDescriptorGalleryOptions featuredConfidenceLevel](self, "featuredConfidenceLevel"));
  -[ATXPosterDescriptorGalleryOptions displayNameLocalizationKey](self, "displayNameLocalizationKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPosterDescriptorGalleryOptions setDisplayNameLocalizationKey:](v4, "setDisplayNameLocalizationKey:", v8);

  -[ATXPosterDescriptorGalleryOptions spokenNameLocalizationKey](self, "spokenNameLocalizationKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPosterDescriptorGalleryOptions setSpokenNameLocalizationKey:](v4, "setSpokenNameLocalizationKey:", v9);

  -[ATXPosterDescriptorGalleryOptions descriptiveTextLocalizationKey](self, "descriptiveTextLocalizationKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXPosterDescriptorGalleryOptions setDescriptiveTextLocalizationKey:](v4, "setDescriptiveTextLocalizationKey:", v10);

  -[ATXPosterDescriptorGalleryOptions setHero:](v4, "setHero:", -[ATXPosterDescriptorGalleryOptions isHero](self, "isHero"));
  -[ATXPosterDescriptorGalleryOptions setShouldShowAsShuffleStack:](v4, "setShouldShowAsShuffleStack:", -[ATXPosterDescriptorGalleryOptions shouldShowAsShuffleStack](self, "shouldShowAsShuffleStack"));
  -[ATXPosterDescriptorGalleryOptions setPhotoSubtype:](v4, "setPhotoSubtype:", -[ATXPosterDescriptorGalleryOptions photoSubtype](self, "photoSubtype"));
  -[ATXPosterDescriptorGalleryOptions setFocus:](v4, "setFocus:", -[ATXPosterDescriptorGalleryOptions focus](self, "focus"));
  -[ATXPosterDescriptorGalleryOptions setOnlyEligibleForMadeForFocusSection:](v4, "setOnlyEligibleForMadeForFocusSection:", -[ATXPosterDescriptorGalleryOptions isOnlyEligibleForMadeForFocusSection](self, "isOnlyEligibleForMadeForFocusSection"));
  return v4;
}

+ (id)galleryOptionsFromDictionaryRepresentation:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("modularComplications"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v45 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v43 = v6;
    v46 = (void *)objc_opt_new();
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v52;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v52 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            +[ATXComplication complicationFromDictionaryRepresentation:error:](ATXComplication, "complicationFromDictionaryRepresentation:error:", v13, a4);
            v14 = objc_claimAutoreleasedReturnValue();
            v15 = (id)v14;
            if (*a4)
            {
              v26 = 0;
              v6 = v43;
              v7 = v45;
              goto LABEL_62;
            }
            if (v14)
              objc_msgSend(v46, "addObject:", v14);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
        if (v10)
          continue;
        break;
      }
    }

    v16 = (void *)objc_msgSend(v46, "copy");
    v6 = v43;
    objc_msgSend(v43, "setModularComplications:", v16);

    v7 = v45;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("modularLandscapeComplications"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v46 = v17;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v41 = v5;
    v8 = (id)objc_opt_new();
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v15 = v17;
    v18 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v48;
      while (2)
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v48 != v20)
            objc_enumerationMutation(v15);
          v22 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            +[ATXComplication complicationFromDictionaryRepresentation:error:](ATXComplication, "complicationFromDictionaryRepresentation:error:", v22, a4);
            v23 = objc_claimAutoreleasedReturnValue();
            v24 = (void *)v23;
            if (*a4)
            {
              v26 = 0;
              v5 = v41;
              goto LABEL_61;
            }
            if (v23)
              objc_msgSend(v8, "addObject:", v23);

          }
        }
        v19 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
        if (v19)
          continue;
        break;
      }
    }

    v25 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v6, "setModularLandscapeComplications:", v25);

    v5 = v41;
    v7 = v45;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("inlineComplication"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[ATXComplication complicationFromDictionaryRepresentation:error:](ATXComplication, "complicationFromDictionaryRepresentation:error:", v8, a4);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (*a4)
    {
      v26 = 0;
      goto LABEL_62;
    }
    objc_msgSend(v6, "setInlineComplication:", v15);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("allowsSystemSuggestedComplications"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setAllowsSystemSuggestedComplications:", objc_msgSend(v15, "BOOLValue"));
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("allowsSystemSuggestedComplicationsInLandscape"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setAllowsSystemSuggestedComplicationsInLandscape:", objc_msgSend(v24, "BOOLValue"));
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("featuredConfidenceLevel"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setFeaturedConfidenceLevel:", objc_msgSend(v27, "integerValue"));
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("displayNameLocalizationKey"));
  v28 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setDisplayNameLocalizationKey:", v28);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("spokenNameLocalizationKey"));
  v29 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSpokenNameLocalizationKey:", v29);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("descriptiveTextLocalizationKey"));
  v30 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v44 = (void *)v30;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setDescriptiveTextLocalizationKey:", v30);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("hero"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v38 = v31;
  v39 = (void *)v29;
  v40 = (void *)v28;
  v42 = v27;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "setHero:", objc_msgSend(v31, "BOOLValue"));
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("blankTemplate"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v6, "setHero:", objc_msgSend(v32, "BOOLValue"));

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("shouldShowAsShuffleStack"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setShouldShowAsShuffleStack:", objc_msgSend(v33, "BOOLValue"));
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("photoSubtype"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setPhotoSubtype:", objc_msgSend(v34, "integerValue"));
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("focus"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setFocus:", objc_msgSend(v35, "integerValue"));
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("onlyEligibleForMadeForFocusSection"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setOnlyEligibleForMadeForFocusSection:", objc_msgSend(v36, "BOOLValue"));
  v26 = v6;

LABEL_61:
  v7 = v45;

LABEL_62:
  return v26;
}

- (NSDictionary)dictionaryRepresentation
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
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
  _QWORD v29[12];
  _QWORD v30[14];

  v30[12] = *MEMORY[0x1E0C80C00];
  v29[0] = CFSTR("modularComplications");
  -[ATXPosterDescriptorGalleryOptions modularComplications](self, "modularComplications");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "_pas_mappedArrayWithTransform:", &__block_literal_global_87);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v3;
  v30[0] = v3;
  v29[1] = CFSTR("modularLandscapeComplications");
  -[ATXPosterDescriptorGalleryOptions modularLandscapeComplications](self, "modularLandscapeComplications");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "_pas_mappedArrayWithTransform:", &__block_literal_global_89);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v25 = v6;
  v27 = v4;
  v20 = (void *)v5;
  v30[1] = v5;
  v29[2] = CFSTR("inlineComplication");
  -[ATXPosterDescriptorGalleryOptions inlineComplication](self, "inlineComplication");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "dictionaryRepresentation");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v30[2] = v7;
  v29[3] = CFSTR("allowsSystemSuggestedComplications");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXPosterDescriptorGalleryOptions allowsSystemSuggestedComplications](self, "allowsSystemSuggestedComplications", v7));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v23;
  v29[4] = CFSTR("allowsSystemSuggestedComplicationsInLandscape");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXPosterDescriptorGalleryOptions allowsSystemSuggestedComplicationsInLandscape](self, "allowsSystemSuggestedComplicationsInLandscape"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30[4] = v22;
  v29[5] = CFSTR("featuredConfidenceLevel");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[ATXPosterDescriptorGalleryOptions featuredConfidenceLevel](self, "featuredConfidenceLevel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30[5] = v9;
  v29[6] = CFSTR("displayNameLocalizationKey");
  -[ATXPosterDescriptorGalleryOptions displayNameLocalizationKey](self, "displayNameLocalizationKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30[6] = v11;
  v29[7] = CFSTR("hero");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXPosterDescriptorGalleryOptions isHero](self, "isHero"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30[7] = v12;
  v29[8] = CFSTR("shouldShowAsShuffleStack");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXPosterDescriptorGalleryOptions shouldShowAsShuffleStack](self, "shouldShowAsShuffleStack"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30[8] = v13;
  v29[9] = CFSTR("photoSubtype");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[ATXPosterDescriptorGalleryOptions photoSubtype](self, "photoSubtype"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[9] = v14;
  v29[10] = CFSTR("focus");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[ATXPosterDescriptorGalleryOptions focus](self, "focus"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30[10] = v15;
  v29[11] = CFSTR("onlyEligibleForMadeForFocusSection");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXPosterDescriptorGalleryOptions isOnlyEligibleForMadeForFocusSection](self, "isOnlyEligibleForMadeForFocusSection"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30[11] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  if (!v8)

  if (!v25)
  if (!v27)

  return (NSDictionary *)v17;
}

uint64_t __61__ATXPosterDescriptorGalleryOptions_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

uint64_t __61__ATXPosterDescriptorGalleryOptions_dictionaryRepresentation__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

- (BOOL)isEqual:(id)a3
{
  ATXPosterDescriptorGalleryOptions *v4;
  ATXPosterDescriptorGalleryOptions *v5;
  BOOL v6;

  v4 = (ATXPosterDescriptorGalleryOptions *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXPosterDescriptorGalleryOptions isEqualToATXPosterDescriptorGalleryOptions:](self, "isEqualToATXPosterDescriptorGalleryOptions:", v5);

  return v6;
}

- (BOOL)isEqualToATXPosterDescriptorGalleryOptions:(id)a3
{
  id *v4;
  NSArray *modularComplications;
  NSArray *v6;
  NSArray *v7;
  NSArray *v8;
  char v9;
  NSArray *modularLandscapeComplications;
  NSArray *v11;
  NSArray *v12;
  NSArray *v13;
  char v14;
  ATXComplication *inlineComplication;
  ATXComplication *v16;
  ATXComplication *v17;
  ATXComplication *v18;
  BOOL v19;
  NSString *displayNameLocalizationKey;
  NSString *v21;
  NSString *v22;
  NSString *v23;
  char v24;
  NSString *spokenNameLocalizationKey;
  NSString *v26;
  NSString *v27;
  NSString *v28;
  char v29;
  NSString *descriptiveTextLocalizationKey;
  NSString *v31;
  NSString *v32;
  NSString *v33;
  char v34;
  BOOL v35;

  v4 = (id *)a3;
  modularComplications = self->_modularComplications;
  v6 = (NSArray *)v4[2];
  if (modularComplications == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = modularComplications;
    v9 = -[NSArray isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
    {
LABEL_33:
      v35 = 0;
      goto LABEL_34;
    }
  }
  modularLandscapeComplications = self->_modularLandscapeComplications;
  v11 = (NSArray *)v4[3];
  if (modularLandscapeComplications == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = modularLandscapeComplications;
    v14 = -[NSArray isEqual:](v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_33;
  }
  inlineComplication = self->_inlineComplication;
  v16 = (ATXComplication *)v4[4];
  if (inlineComplication == v16)
  {

  }
  else
  {
    v17 = v16;
    v18 = inlineComplication;
    v19 = -[ATXComplication isEqual:](v18, "isEqual:", v17);

    if (!v19)
      goto LABEL_33;
  }
  if (self->_allowsSystemSuggestedComplications != *((unsigned __int8 *)v4 + 8)
    || self->_allowsSystemSuggestedComplicationsInLandscape != *((unsigned __int8 *)v4 + 9)
    || (id)self->_featuredConfidenceLevel != v4[5])
  {
    goto LABEL_33;
  }
  displayNameLocalizationKey = self->_displayNameLocalizationKey;
  v21 = (NSString *)v4[6];
  if (displayNameLocalizationKey == v21)
  {

  }
  else
  {
    v22 = v21;
    v23 = displayNameLocalizationKey;
    v24 = -[NSString isEqual:](v23, "isEqual:", v22);

    if ((v24 & 1) == 0)
      goto LABEL_33;
  }
  spokenNameLocalizationKey = self->_spokenNameLocalizationKey;
  v26 = (NSString *)v4[7];
  if (spokenNameLocalizationKey == v26)
  {

  }
  else
  {
    v27 = v26;
    v28 = spokenNameLocalizationKey;
    v29 = -[NSString isEqual:](v28, "isEqual:", v27);

    if ((v29 & 1) == 0)
      goto LABEL_33;
  }
  descriptiveTextLocalizationKey = self->_descriptiveTextLocalizationKey;
  v31 = (NSString *)v4[8];
  if (descriptiveTextLocalizationKey == v31)
  {

  }
  else
  {
    v32 = v31;
    v33 = descriptiveTextLocalizationKey;
    v34 = -[NSString isEqual:](v33, "isEqual:", v32);

    if ((v34 & 1) == 0)
      goto LABEL_33;
  }
  if (self->_hero != *((unsigned __int8 *)v4 + 10)
    || self->_shouldShowAsShuffleStack != *((unsigned __int8 *)v4 + 11)
    || (id)self->_photoSubtype != v4[9]
    || (id)self->_focus != v4[10])
  {
    goto LABEL_33;
  }
  v35 = self->_onlyEligibleForMadeForFocusSection == *((unsigned __int8 *)v4 + 12);
LABEL_34:

  return v35;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  int64_t v15;

  v3 = -[NSArray hash](self->_modularComplications, "hash");
  v4 = -[NSArray hash](self->_modularLandscapeComplications, "hash") - v3 + 32 * v3;
  v5 = -[ATXComplication hash](self->_inlineComplication, "hash");
  v6 = self->_allowsSystemSuggestedComplications - (v5 - v4 + 32 * v4) + 32 * (v5 - v4 + 32 * v4);
  v7 = self->_allowsSystemSuggestedComplicationsInLandscape - v6 + 32 * v6;
  v8 = self->_featuredConfidenceLevel - v7 + 32 * v7;
  v9 = -[NSString hash](self->_displayNameLocalizationKey, "hash") - v8 + 32 * v8;
  v10 = -[NSString hash](self->_spokenNameLocalizationKey, "hash") - v9 + 32 * v9;
  v11 = -[NSString hash](self->_descriptiveTextLocalizationKey, "hash");
  v12 = self->_hero - (v11 - v10 + 32 * v10) + 32 * (v11 - v10 + 32 * v10);
  v13 = self->_shouldShowAsShuffleStack - v12 + 32 * v12;
  v14 = self->_photoSubtype - v13 + 32 * v13;
  v15 = self->_focus - v14 + 32 * v14;
  return self->_onlyEligibleForMadeForFocusSection - v15 + 32 * v15;
}

- (id)preferredComplications
{
  void *v2;
  void *v3;

  -[ATXPosterDescriptorGalleryOptions modularComplications](self, "modularComplications");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_91);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __59__ATXPosterDescriptorGalleryOptions_preferredComplications__block_invoke(uint64_t a1, void *a2)
{
  return CHSWidgetFromATXComplication(a2);
}

- (void)setPreferredComplications:(id)a3
{
  id v4;

  objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_92);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXPosterDescriptorGalleryOptions setModularComplications:](self, "setModularComplications:", v4);

}

ATXComplication *__63__ATXPosterDescriptorGalleryOptions_setPreferredComplications___block_invoke(uint64_t a1, void *a2)
{
  return ATXComplicationFromCHSWidget(a2);
}

- (id)preferredInlineComplication
{
  void *v2;
  void *v3;

  -[ATXPosterDescriptorGalleryOptions inlineComplication](self, "inlineComplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CHSWidgetFromATXComplication(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setPreferredInlineComplication:(id)a3
{
  id v4;

  ATXComplicationFromCHSWidget(a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXPosterDescriptorGalleryOptions setInlineComplication:](self, "setInlineComplication:", v4);

}

- (NSArray)modularComplications
{
  return self->_modularComplications;
}

- (void)setModularComplications:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)modularLandscapeComplications
{
  return self->_modularLandscapeComplications;
}

- (void)setModularLandscapeComplications:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (ATXComplication)inlineComplication
{
  return self->_inlineComplication;
}

- (void)setInlineComplication:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)allowsSystemSuggestedComplications
{
  return self->_allowsSystemSuggestedComplications;
}

- (void)setAllowsSystemSuggestedComplications:(BOOL)a3
{
  self->_allowsSystemSuggestedComplications = a3;
}

- (BOOL)allowsSystemSuggestedComplicationsInLandscape
{
  return self->_allowsSystemSuggestedComplicationsInLandscape;
}

- (void)setAllowsSystemSuggestedComplicationsInLandscape:(BOOL)a3
{
  self->_allowsSystemSuggestedComplicationsInLandscape = a3;
}

- (int64_t)featuredConfidenceLevel
{
  return self->_featuredConfidenceLevel;
}

- (void)setFeaturedConfidenceLevel:(int64_t)a3
{
  self->_featuredConfidenceLevel = a3;
}

- (NSString)displayNameLocalizationKey
{
  return self->_displayNameLocalizationKey;
}

- (void)setDisplayNameLocalizationKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)spokenNameLocalizationKey
{
  return self->_spokenNameLocalizationKey;
}

- (void)setSpokenNameLocalizationKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)descriptiveTextLocalizationKey
{
  return self->_descriptiveTextLocalizationKey;
}

- (void)setDescriptiveTextLocalizationKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)isHero
{
  return self->_hero;
}

- (void)setHero:(BOOL)a3
{
  self->_hero = a3;
}

- (BOOL)shouldShowAsShuffleStack
{
  return self->_shouldShowAsShuffleStack;
}

- (void)setShouldShowAsShuffleStack:(BOOL)a3
{
  self->_shouldShowAsShuffleStack = a3;
}

- (int64_t)photoSubtype
{
  return self->_photoSubtype;
}

- (void)setPhotoSubtype:(int64_t)a3
{
  self->_photoSubtype = a3;
}

- (int64_t)focus
{
  return self->_focus;
}

- (void)setFocus:(int64_t)a3
{
  self->_focus = a3;
}

- (BOOL)isOnlyEligibleForMadeForFocusSection
{
  return self->_onlyEligibleForMadeForFocusSection;
}

- (void)setOnlyEligibleForMadeForFocusSection:(BOOL)a3
{
  self->_onlyEligibleForMadeForFocusSection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptiveTextLocalizationKey, 0);
  objc_storeStrong((id *)&self->_spokenNameLocalizationKey, 0);
  objc_storeStrong((id *)&self->_displayNameLocalizationKey, 0);
  objc_storeStrong((id *)&self->_inlineComplication, 0);
  objc_storeStrong((id *)&self->_modularLandscapeComplications, 0);
  objc_storeStrong((id *)&self->_modularComplications, 0);
}

@end
