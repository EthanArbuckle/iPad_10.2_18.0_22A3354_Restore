@implementation _CSSuggestionToken

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)commonInitWithUserString:(id)a3 displayString:(id)a4 score:(id)a5
{
  NSString *v8;
  NSString *v9;
  NSNumber *v10;
  NSAttributedString *displayText;
  NSNumber *score;
  NSNumber *v13;
  NSArray *scopes;
  NSArray *v15;
  NSString *displayString;
  NSString *v17;
  NSString *searchString;
  NSString *v19;
  NSString *spotlightQueryString;
  NSArray *filterQueries;
  NSString *personIdentifier;
  CSSearchableItem *personItem;
  NSString *nlpCompletionType;
  NSDictionary *nlpCompletionAttributes;
  NSArray *localCompletionAttributes;
  NSArray *localCompletionAttributesStrings;
  NSMutableDictionary *v28;
  NSMutableDictionary *features;

  v8 = (NSString *)a3;
  v9 = (NSString *)a4;
  v10 = (NSNumber *)a5;
  displayText = self->_displayText;
  self->_displayText = 0;

  self->_replacementRange = (_NSRange)xmmword_18C4EDF90;
  score = self->_score;
  self->_score = v10;
  v13 = v10;

  scopes = self->_scopes;
  v15 = (NSArray *)MEMORY[0x1E0C9AA60];
  self->_scopes = (NSArray *)MEMORY[0x1E0C9AA60];

  displayString = self->_displayString;
  self->_selectedScope = -1;
  self->_displayString = v9;
  v17 = v9;

  searchString = self->_searchString;
  self->_searchString = v8;
  v19 = v8;

  spotlightQueryString = self->_spotlightQueryString;
  self->_spotlightQueryString = 0;

  filterQueries = self->_filterQueries;
  self->_filterQueries = 0;

  *(_QWORD *)&self->_personIsUser = 0;
  self->_age = 0.0;
  personIdentifier = self->_personIdentifier;
  self->_personIdentifier = 0;

  personItem = self->_personItem;
  self->_personItem = 0;

  self->_megadomeCompositeScore = 0.0;
  self->_isMegadomeToken = 0;
  self->_suggestionTokenDataSources = 0;
  nlpCompletionType = self->_nlpCompletionType;
  self->_nlpCompletionType = 0;

  nlpCompletionAttributes = self->_nlpCompletionAttributes;
  self->_nlpCompletionAttributes = (NSDictionary *)MEMORY[0x1E0C9AA70];

  self->_nlpKind = 0;
  localCompletionAttributes = self->_localCompletionAttributes;
  self->_localCompletionType = 0x7FFFFFFFFFFFFFFFLL;
  self->_localCompletionAttributes = v15;

  localCompletionAttributesStrings = self->_localCompletionAttributesStrings;
  self->_localCompletionAttributesStrings = v15;

  v28 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  features = self->_features;
  self->_features = v28;

  -[_CSSuggestionToken setInternalType:](self, "setInternalType:", 0);
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *score;
  id v5;
  uint64_t length_low;
  void *v7;
  id v8;

  score = self->_score;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", score, CFSTR("score"));
  length_low = LODWORD(self->_replacementRange.length);
  objc_msgSend(v5, "encodeInt32:forKey:", LODWORD(self->_replacementRange.location), CFSTR("replacementRangeLocation"));
  objc_msgSend(v5, "encodeInt32:forKey:", length_low, CFSTR("replacementRangeLength"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_scopes, CFSTR("scopes"));
  objc_msgSend(v5, "encodeInt32:forKey:", LODWORD(self->_selectedScope), CFSTR("selectedScope"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tokenScopes, CFSTR("tokenScopes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayString, CFSTR("displayString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_searchString, CFSTR("searchString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_spotlightQueryString, CFSTR("spotlightQueryString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_filterQueries, CFSTR("filterQueries"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_personItem, CFSTR("personItem"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nlpCompletionType, CFSTR("nlpCompletionType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nlpCompletionAttributes, CFSTR("nlpCompletionAttributes"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[_CSSuggestionToken localCompletionType](self, "localCompletionType"), CFSTR("localCompletionType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localCompletionAttributes, CFSTR("localCompletionAttributes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localCompletionAttributesStrings, CFSTR("localCompletionBundleIdentifiers"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[_CSSuggestionToken internalType](self, "internalType"), CFSTR("type"));
  -[_CSSuggestionToken suggestionDisplayText](self, "suggestionDisplayText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("suggestionDisplayText"));

  -[_CSSuggestionToken itemSummary](self, "itemSummary");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("itemSummary"));

}

- (_CSSuggestionToken)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _CSSuggestionToken *v20;
  void *v21;
  void *v22;
  _CSSuggestionToken *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  _CSSuggestionToken *v33;
  _CSSuggestionToken *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  _CSSuggestionToken *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  int v53;
  int v54;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id obj;
  uint64_t v60;
  unint64_t v61;
  void *v62;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("searchString"));
  v58 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayString"));
  v57 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("spotlightQueryString"));
  v56 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v6, CFSTR("filterQueries"));
  obj = (id)objc_claimAutoreleasedReturnValue();

  v54 = objc_msgSend(v3, "decodeInt32ForKey:", CFSTR("replacementRangeLocation"));
  v53 = objc_msgSend(v3, "decodeInt32ForKey:", CFSTR("replacementRangeLength"));
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, v9, v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v11, CFSTR("scopes"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  v61 = (int)objc_msgSend(v3, "decodeInt32ForKey:", CFSTR("selectedScope"));
  v12 = (void *)MEMORY[0x1E0C99E60];
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  objc_msgSend(v12, "setWithObjects:", v13, v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v15, CFSTR("tokenScopes"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itemSummary"));
  v60 = objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("type"));
  switch(v17)
  {
    case 1:
      v22 = (void *)v56;
      v19 = (void *)v57;
      v23 = -[_CSSuggestionToken initWithUserString:queryString:](self, "initWithUserString:queryString:", v57, v56);
      goto LABEL_23;
    case 2:
      v19 = (void *)v57;
      v18 = (void *)v58;
      v24 = v62;
      v20 = -[_CSSuggestionToken initWithUserString:scopes:selectedIndex:displayString:](self, "initWithUserString:scopes:selectedIndex:displayString:", v58, v62, v61, v57);
      -[_CSSuggestionToken setInternalType:](v20, "setInternalType:", 2);
      v22 = (void *)v56;
      v25 = obj;
      if (!v20)
        goto LABEL_32;
      goto LABEL_31;
    case 3:
      v26 = v16;
      v27 = (void *)MEMORY[0x1E0C99E60];
      v28 = objc_opt_class();
      v29 = objc_opt_class();
      v30 = objc_opt_class();
      objc_msgSend(v27, "setWithObjects:", v28, v29, v30, objc_opt_class(), 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v31, CFSTR("nlpCompletionAttributes"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v32, "count"))
        goto LABEL_15;
      v18 = (void *)v58;
      v33 = -[_CSSuggestionToken initWithUserString:suggestionTokenResult:](self, "initWithUserString:suggestionTokenResult:", v58, v32);
      goto LABEL_12;
    case 4:
      v26 = v16;
      objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("personItem"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v32)
        goto LABEL_15;
      v18 = (void *)v58;
      v33 = -[_CSSuggestionToken initWithUserString:itemResult:](self, "initWithUserString:itemResult:", v58, v32);
LABEL_12:
      v20 = v33;
      v19 = (void *)v57;
      goto LABEL_17;
    case 5:
      v26 = v16;
      objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("score"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (v32)
      {
        v19 = (void *)v57;
        v18 = (void *)v58;
        v34 = -[_CSSuggestionToken initWithUserString:displayString:score:](self, "initWithUserString:displayString:score:", v58, v57, v32);
      }
      else
      {
LABEL_15:
        v19 = (void *)v57;
        v18 = (void *)v58;
        v34 = -[_CSSuggestionToken initWithUserString:displayString:](self, "initWithUserString:displayString:", v58, v57);
      }
      v20 = v34;
LABEL_17:

      v22 = (void *)v56;
      v25 = obj;
      v24 = v62;
      goto LABEL_30;
    case 6:
      v35 = v16;
      v36 = (void *)MEMORY[0x1E0C99E60];
      v37 = objc_opt_class();
      objc_msgSend(v36, "setWithObjects:", v37, objc_opt_class(), 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v38, CFSTR("localCompletionAttributes"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      v40 = (void *)MEMORY[0x1E0C99E60];
      v41 = objc_opt_class();
      objc_msgSend(v40, "setWithObjects:", v41, objc_opt_class(), 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v42, CFSTR("localCompletionBundleIdentifiers"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = (void *)v57;
      v18 = (void *)v58;
      if (objc_msgSend(v39, "count"))
        v44 = -[_CSSuggestionToken initWithUserString:displayString:attributeValues:attributeStrings:options:](self, "initWithUserString:displayString:attributeValues:attributeStrings:options:", v58, v57, v39, v43, MEMORY[0x1E0C9AA70]);
      else
        v44 = -[_CSSuggestionToken initWithUserString:displayString:](self, "initWithUserString:displayString:", v58, v57);
      v20 = v44;
      v44->_localCompletionType = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("localCompletionType"));

      v22 = (void *)v56;
      v25 = obj;
      v16 = v35;
      goto LABEL_31;
    case 7:
    case 8:
    case 9:
    case 10:
      v19 = (void *)v57;
      v18 = (void *)v58;
      v20 = -[_CSSuggestionToken initWithUserString:tokenScopes:selectedIndex:displayString:internalType:](self, "initWithUserString:tokenScopes:selectedIndex:displayString:internalType:", v58, v16, v61, v57, v17);
      objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("suggestionDisplayText"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CSSuggestionToken setSuggestionDisplayText:](v20, "setSuggestionDisplayText:", v21);

      goto LABEL_3;
    case 11:
      v26 = v16;
      v45 = (void *)MEMORY[0x1E0C99E60];
      v46 = objc_opt_class();
      v47 = objc_opt_class();
      v48 = objc_opt_class();
      objc_msgSend(v45, "setWithObjects:", v46, v47, v48, objc_opt_class(), 0);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v49, CFSTR("nlpCompletionAttributes"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v50, "count"))
      {
        v18 = (void *)v58;
        v20 = -[_CSSuggestionToken initWithUserString:suggestionResult:](self, "initWithUserString:suggestionResult:", v58, v50);
        v19 = (void *)v57;
      }
      else
      {
        v19 = (void *)v57;
        v18 = (void *)v58;
        v20 = -[_CSSuggestionToken initWithUserString:displayString:](self, "initWithUserString:displayString:", v58, v57);
      }
      v22 = (void *)v56;
      v24 = v62;

      v25 = obj;
LABEL_30:
      v16 = v26;
      if (v20)
        goto LABEL_31;
      goto LABEL_32;
    case 12:
      v22 = (void *)v56;
      v19 = (void *)v57;
      v23 = -[_CSSuggestionToken initWithUserString:displayString:queryString:](self, "initWithUserString:displayString:queryString:", v57, v57, v56);
LABEL_23:
      v20 = v23;
      v18 = (void *)v58;
      goto LABEL_24;
    default:
      v19 = (void *)v57;
      v18 = (void *)v58;
      v20 = -[_CSSuggestionToken initWithUserString:displayString:](self, "initWithUserString:displayString:", v58, v57);
LABEL_3:
      v22 = (void *)v56;
LABEL_24:
      v25 = obj;
      v24 = v62;
      if (v20)
      {
LABEL_31:
        objc_storeStrong((id *)&v20->_filterQueries, v25);
        objc_storeStrong((id *)&v20->_scopes, v62);
        v20->_selectedScope = v61;
        objc_storeStrong((id *)&v20->_tokenScopes, v16);
        v24 = v62;
        -[_CSSuggestionToken updateReplacementRange:](v20, "updateReplacementRange:", v54, v53);
        -[_CSSuggestionToken setInternalType:](v20, "setInternalType:", v17);
        v51 = (void *)v60;
        -[_CSSuggestionToken setItemSummary:](v20, "setItemSummary:", v60);
      }
      else
      {
LABEL_32:
        v51 = (void *)v60;
      }

      return v20;
  }
}

- (_CSSuggestionToken)initWithUserString:(id)a3 queryString:(id)a4
{
  id v6;
  id v7;
  _CSSuggestionToken *v8;
  _CSSuggestionToken *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_CSSuggestionToken;
  v8 = -[_CSSuggestionToken init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[_CSSuggestionToken commonInitWithUserString:displayString:score:](v8, "commonInitWithUserString:displayString:score:", v6, v6, &unk_1E2430368);
    objc_storeStrong((id *)&v9->_spotlightQueryString, a4);
    -[_CSSuggestionToken setInternalType:](v9, "setInternalType:", 1);
  }

  return v9;
}

- (_CSSuggestionToken)initWithUserString:(id)a3 displayString:(id)a4 queryString:(id)a5
{
  id v8;
  id v9;
  id v10;
  _CSSuggestionToken *v11;
  _CSSuggestionToken *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_CSSuggestionToken;
  v11 = -[_CSSuggestionToken init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[_CSSuggestionToken commonInitWithUserString:displayString:score:](v11, "commonInitWithUserString:displayString:score:", v8, v9, &unk_1E2430368);
    objc_storeStrong((id *)&v12->_spotlightQueryString, a5);
    -[_CSSuggestionToken setInternalType:](v12, "setInternalType:", 12);
  }

  return v12;
}

- (_CSSuggestionToken)initWithUserString:(id)a3 displayString:(id)a4 score:(id)a5
{
  id v8;
  id v9;
  id v10;
  _CSSuggestionToken *v11;
  _CSSuggestionToken *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_CSSuggestionToken;
  v11 = -[_CSSuggestionToken init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[_CSSuggestionToken commonInitWithUserString:displayString:score:](v11, "commonInitWithUserString:displayString:score:", v8, v9, v10);
    -[_CSSuggestionToken setInternalType:](v12, "setInternalType:", 5);
  }

  return v12;
}

- (_CSSuggestionToken)initWithUserString:(id)a3 displayString:(id)a4
{
  id v6;
  id v7;
  _CSSuggestionToken *v8;
  _CSSuggestionToken *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_CSSuggestionToken;
  v8 = -[_CSSuggestionToken init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[_CSSuggestionToken commonInitWithUserString:displayString:score:](v8, "commonInitWithUserString:displayString:score:", v6, v7, &unk_1E2430378);
    v9->_localCompletionType = 9;
    v9->_internalType = 6;
  }

  return v9;
}

- (_CSSuggestionToken)initWithUserString:(id)a3 displayString:(id)a4 attributeValues:(id)a5 attributeStrings:(id)a6 options:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _CSSuggestionToken *v17;
  _CSSuggestionToken *v18;
  _CSSuggestionToken *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  unsigned int v29;
  int v30;
  uint64_t v31;
  NSNumber *score;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSArray *v40;
  uint64_t v41;
  NSString *v42;
  id v43;
  CSItemSummary *v44;
  uint64_t v45;
  NSAttributedString *v46;
  CSItemSummary *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  uint64_t j;
  uint64_t v59;
  void *v60;
  NSString *v61;
  void *v62;
  int v63;
  NSString *v64;
  NSString *v65;
  void *v66;
  CSItemSummary *v67;
  CSItemSummary *v68;
  void *v69;
  CSItemSummary *v70;
  void *v71;
  CSItemSummary *v72;
  uint64_t v73;
  NSString *v74;
  NSString *v75;
  void *v76;
  _QWORD *v77;
  _QWORD *v78;
  uint64_t v79;
  NSString *v80;
  NSString *v81;
  uint64_t v82;
  NSString *v83;
  NSString *v84;
  uint64_t v85;
  NSString *v86;
  NSString *v87;
  NSString *v88;
  _BOOL4 v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  int v94;
  NSString *v95;
  NSString *v96;
  CSItemSummary *v97;
  uint64_t v98;
  NSString *v99;
  NSString *v100;
  void *v101;
  id v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  NSString *v106;
  NSString *v107;
  void *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  void *v112;
  uint64_t v113;
  NSString *v114;
  NSString *v115;
  void *v116;
  CSItemSummary *v117;
  void *v118;
  id v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t k;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  uint64_t v129;
  NSString *v130;
  void *v131;
  __CFString *v132;
  int v133;
  uint64_t v134;
  NSString *spotlightQueryString;
  NSString *v136;
  void *v137;
  uint64_t v138;
  NSAttributedString *suggestionDisplayText;
  CSItemSummary *v140;
  NSString *v141;
  _BOOL4 personNameIsMissing;
  void *v143;
  void *v144;
  void *v145;
  int v146;
  NSString *v147;
  NSArray *scopes;
  NSArray *v149;
  uint64_t v150;
  int v152;
  uint64_t v153;
  CSItemSummary *v154;
  CSItemSummary *v155;
  id v156;
  NSArray *v157;
  void *v158;
  _CSSuggestionToken *v159;
  void *v160;
  void *v161;
  void *v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  objc_super v175;
  _QWORD v176[4];
  _QWORD v177[4];
  _QWORD v178[4];
  _QWORD v179[4];
  _QWORD v180[4];
  _QWORD v181[4];
  _QWORD v182[4];
  _QWORD v183[4];
  _QWORD v184[4];
  _QWORD v185[4];
  _QWORD v186[4];
  _QWORD v187[4];
  _QWORD v188[4];
  _QWORD v189[4];
  void *v190;
  void *v191;
  _QWORD v192[4];
  _QWORD v193[4];
  _BYTE v194[128];
  _BYTE v195[128];
  _BYTE v196[128];
  uint64_t v197;

  v197 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = 0;
  if (v13 && v14)
  {
    if ((unint64_t)objc_msgSend(v14, "count") < 0x15)
    {
      v17 = 0;
      goto LABEL_79;
    }
    v162 = v16;
    v175.receiver = self;
    v175.super_class = (Class)_CSSuggestionToken;
    v18 = -[_CSSuggestionToken init](&v175, sel_init);
    v19 = v18;
    if (!v18)
      goto LABEL_77;
    v158 = v15;
    v159 = v18;
    v161 = v13;
    -[_CSSuggestionToken commonInitWithUserString:displayString:score:](v18, "commonInitWithUserString:displayString:score:", v12, v13, &unk_1E2430378);
    objc_msgSend(v14, "objectAtIndexedSubscript:", 14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "integerValue");

    objc_msgSend(v14, "objectAtIndexedSubscript:", 12);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "doubleValue");
    v24 = v23;

    v157 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v14, "objectAtIndexedSubscript:", 20);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v160 = v14;
    v156 = v12;
    if ((objc_msgSend(v25, "unsignedLongLongValue") & 4) != 0)
    {
      LODWORD(v27) = 1;
    }
    else
    {
      objc_msgSend(v14, "objectAtIndexedSubscript:", 20);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = ((unint64_t)objc_msgSend(v26, "unsignedLongLongValue") >> 3) & 1;

      v14 = v160;
    }

    objc_msgSend(v14, "objectAtIndexedSubscript:", 20);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "unsignedLongLongValue");

    v30 = (v29 >> 3) & 1;
    v14 = v160;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v24);
    v31 = objc_claimAutoreleasedReturnValue();
    v19 = v159;
    score = v159->_score;
    v159->_score = (NSNumber *)v31;

    v159->_megadomeCompositeScore = 0.0;
    v159->_isMegadomeToken = 0;
    v159->_suggestionTokenDataSources = 0;
    v159->_localCompletionType = v21;
    objc_storeStrong((id *)&v159->_localCompletionAttributes, a5);
    objc_storeStrong((id *)&v159->_localCompletionAttributesStrings, a6);
    objc_msgSend(v160, "objectAtIndexedSubscript:", 20);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v159->_isMailIntent = (objc_msgSend(v33, "unsignedLongLongValue") & 2) != 0;

    v159->_hasRecentActivity = v30;
    objc_msgSend(v160, "objectAtIndexedSubscript:", 20);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v159->_personNameIsMissing = objc_msgSend(v34, "unsignedLongLongValue") & 1;

    objc_msgSend(v160, "objectAtIndexedSubscript:", 4);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "doubleValue");
    v159->_age = v36;

    objc_msgSend(v160, "objectAtIndexedSubscript:", 17);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v159->_hasUsedDate = objc_msgSend(v37, "integerValue") == 1;

    if (-[_CSSuggestionToken localCompletionType](v159, "localCompletionType") == 10
      || -[_CSSuggestionToken localCompletionType](v159, "localCompletionType") == 15)
    {
      objc_msgSend(v160, "objectAtIndexedSubscript:", 15);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v38, "unsignedIntValue");

    }
    else
    {
      v39 = 0;
    }
    v40 = v157;
    -[_CSSuggestionToken setInternalType:](v159, "setInternalType:", 6);
    switch(-[_CSSuggestionToken localCompletionType](v159, "localCompletionType"))
    {
      case 6:
        v153 = v39;
        if (initWithUserString_displayString_attributeValues_attributeStrings_options__onceScopesToken != -1)
          dispatch_once(&initWithUserString_displayString_attributeValues_attributeStrings_options__onceScopesToken, &__block_literal_global_5);
        v47 = (CSItemSummary *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v167 = 0u;
        v168 = 0u;
        v169 = 0u;
        v170 = 0u;
        v48 = objc_msgSend(&unk_1E242F868, "countByEnumeratingWithState:objects:count:", &v167, v195, 16);
        if (v48)
        {
          v49 = v48;
          v50 = *(_QWORD *)v168;
          do
          {
            for (i = 0; i != v49; ++i)
            {
              if (*(_QWORD *)v168 != v50)
                objc_enumerationMutation(&unk_1E242F868);
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=\"%@\"cwd"), *(_QWORD *)(*((_QWORD *)&v167 + 1) + 8 * i), v161);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              -[CSItemSummary addObject:](v47, "addObject:", v52);

            }
            v49 = objc_msgSend(&unk_1E242F868, "countByEnumeratingWithState:objects:count:", &v167, v195, 16);
          }
          while (v49);
        }
        v154 = v47;
        v165 = 0u;
        v166 = 0u;
        v163 = 0u;
        v164 = 0u;
        objc_msgSend(v162, "objectForKeyedSubscript:", CFSTR("photosBundleIDs"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v163, v194, 16);
        if (v54)
        {
          v55 = v54;
          v56 = 0;
          v57 = *(_QWORD *)v164;
          v40 = v157;
          while (1)
          {
            for (j = 0; j != v55; ++j)
            {
              if (*(_QWORD *)v164 != v57)
                objc_enumerationMutation(v53);
              v59 = *(_QWORD *)(*((_QWORD *)&v163 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {

                v56 = 0;
LABEL_64:

                -[CSItemSummary componentsJoinedByString:](v154, "componentsJoinedByString:", CFSTR(" || "));
                v131 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v56, "count"))
                {
                  objc_msgSend(v56, "componentsJoinedByString:", CFSTR(" || "));
                  v132 = (__CFString *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v132 = CFSTR("true");
                }
                v19 = v159;
                v14 = v160;
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("((%@) && (%@) && %@)"), v131, v132, CFSTR("(kMDItemContentTypeTree=\"public.image\" || kMDItemContentTypeTree=\"public.movie\")"));
                v134 = objc_claimAutoreleasedReturnValue();
                spotlightQueryString = v159->_spotlightQueryString;
                v159->_spotlightQueryString = (NSString *)v134;

                v192[0] = CFSTR("TOKEN");
                v192[1] = CFSTR("TEXT");
                v193[0] = initWithUserString_displayString_attributeValues_attributeStrings_options__gPhoto;
                v193[1] = v161;
                v136 = v159->_spotlightQueryString;
                v192[2] = CFSTR("QUERY");
                v192[3] = CFSTR("TYPE");
                v193[2] = v136;
                v193[3] = &unk_1E242FDA8;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v193, v192, 4);
                v137 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSArray addObject:](v40, "addObject:", v137);

                v138 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v161);
                suggestionDisplayText = v159->_suggestionDisplayText;
                v159->_suggestionDisplayText = (NSAttributedString *)v138;

                v39 = v153;
                v44 = v154;
                goto LABEL_74;
              }
              if (!v56)
                v56 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_kMDItemBundleID=\"%@\"), v59);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "addObject:", v60);

            }
            v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v163, v194, 16);
            if (!v55)
              goto LABEL_64;
          }
        }
        v56 = 0;
        v40 = v157;
        goto LABEL_64;
      case 7:
        v61 = (NSString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
        v13 = v161;
        objc_msgSend(v161, "cs_escapedStringForSearchQuery");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = tokenScopesWithPersonKey(v62, 0, 0, 0, v61, &unk_1E242F850, v157, 0, 0);

        if (v63)
        {
          v19 = v159;
          v64 = v159->_spotlightQueryString;
          v159->_spotlightQueryString = v61;
          v65 = v61;

          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF CONTAINS %@"), CFSTR("@"));
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v158, "filteredArrayUsingPredicate:", v66);
          v44 = (CSItemSummary *)objc_claimAutoreleasedReturnValue();

          v67 = [CSItemSummary alloc];
          v68 = -[CSItemSummary initWithName:contactIdentifier:alternateNames:phoneNumbers:emailAddresses:contactScope:](v67, "initWithName:contactIdentifier:alternateNames:phoneNumbers:emailAddresses:contactScope:", v161, 0, 0, 0, v44, 0);
          -[_CSSuggestionToken setItemSummary:](v159, "setItemSummary:", v68);

          goto LABEL_47;
        }
        v155 = (CSItemSummary *)v61;
        goto LABEL_82;
      case 10:
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF CONTAINS %@"), CFSTR("@"));
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v158, "filteredArrayUsingPredicate:", v69);
        v70 = (CSItemSummary *)objc_claimAutoreleasedReturnValue();

        v155 = v70;
        if ((v27 & 1) != 0
          || -[_CSSuggestionToken nameAndEmailRenderableWithName:emails:](v159, "nameAndEmailRenderableWithName:emails:", v161, v70))
        {
          v71 = v161;
          v72 = -[CSItemSummary initWithName:contactIdentifier:alternateNames:phoneNumbers:emailAddresses:contactScope:]([CSItemSummary alloc], "initWithName:contactIdentifier:alternateNames:phoneNumbers:emailAddresses:contactScope:", v161, 0, 0, 0, v70, 0);
        }
        else
        {
          v71 = v161;
          v72 = -[CSItemSummary initWithName:contactIdentifier:alternateNames:phoneNumbers:emailAddresses:allEmailAddresses:contactScope:]([CSItemSummary alloc], "initWithName:contactIdentifier:alternateNames:phoneNumbers:emailAddresses:allEmailAddresses:contactScope:", v161, 0, 0, 0, 0, v70, 0);
        }
        v140 = v72;
        -[_CSSuggestionToken setItemSummary:](v159, "setItemSummary:", v72);

        v141 = (NSString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
        personNameIsMissing = v159->_personNameIsMissing;
        objc_msgSend(v71, "cs_escapedStringForSearchQuery");
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        if (personNameIsMissing)
        {
          objc_msgSend(v71, "cs_escapedStringForSearchQuery");
          v144 = (void *)objc_claimAutoreleasedReturnValue();
          v191 = v144;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v191, 1);
          v145 = (void *)objc_claimAutoreleasedReturnValue();
          v146 = tokenScopesForPeopleSuggestions(v143, v145, v141, v157, 1, v27, -[_CSSuggestionToken shouldDisplayNameAndEmail](v159, "shouldDisplayNameAndEmail"));

          if (v146)
          {
LABEL_73:
            v147 = v159->_spotlightQueryString;
            v159->_spotlightQueryString = v141;

            v14 = v160;
            v44 = v155;
            goto LABEL_74;
          }
        }
        else
        {
          v152 = tokenScopesForPeopleSuggestions(v143, v70, v141, v157, v159->_isMailIntent, v27, -[_CSSuggestionToken shouldDisplayNameAndEmail](v159, "shouldDisplayNameAndEmail"));

          if ((v152 & 1) != 0)
            goto LABEL_73;
        }

        v13 = v161;
LABEL_82:
        v15 = v158;

        v17 = 0;
        v12 = v156;
        self = v159;
        v14 = v160;
        goto LABEL_78;
      case 11:
        objc_msgSend(v161, "cs_escapedStringForSearchQuery");
        v44 = (CSItemSummary *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(kMDItemPhotosSeasons=\"%@\"cwd || kMDItemTitle=\"%@\"cwd)"), v44, v44);
        v73 = objc_claimAutoreleasedReturnValue();
        v74 = v159->_spotlightQueryString;
        v159->_spotlightQueryString = (NSString *)v73;

        v182[0] = CFSTR("TOKEN");
        v182[1] = CFSTR("TEXT");
        v183[0] = &stru_1E2406B38;
        v183[1] = v44;
        v75 = v159->_spotlightQueryString;
        v182[2] = CFSTR("QUERY");
        v182[3] = CFSTR("TYPE");
        v183[2] = v75;
        v183[3] = &unk_1E242FE08;
        v76 = (void *)MEMORY[0x1E0C99D80];
        v77 = v183;
        v78 = v182;
        goto LABEL_49;
      case 12:
        objc_msgSend(v161, "cs_escapedStringForSearchQuery");
        v44 = (CSItemSummary *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(kMDItemPhotosHolidays=\"%@\"cwd || kMDItemTitle=\"%@\"cwd)"), v44, v44);
        v79 = objc_claimAutoreleasedReturnValue();
        v80 = v159->_spotlightQueryString;
        v159->_spotlightQueryString = (NSString *)v79;

        v180[0] = CFSTR("TOKEN");
        v180[1] = CFSTR("TEXT");
        v181[0] = &stru_1E2406B38;
        v181[1] = v44;
        v81 = v159->_spotlightQueryString;
        v180[2] = CFSTR("QUERY");
        v180[3] = CFSTR("TYPE");
        v181[2] = v81;
        v181[3] = &unk_1E242FE20;
        v76 = (void *)MEMORY[0x1E0C99D80];
        v77 = v181;
        v78 = v180;
        goto LABEL_49;
      case 13:
        objc_msgSend(v161, "cs_escapedStringForSearchQuery");
        v44 = (CSItemSummary *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(kMDItemAcquisitionModel=\"%@\"cwd)"), v44);
        v82 = objc_claimAutoreleasedReturnValue();
        v83 = v159->_spotlightQueryString;
        v159->_spotlightQueryString = (NSString *)v82;

        v186[0] = CFSTR("TOKEN");
        v186[1] = CFSTR("TEXT");
        v187[0] = &stru_1E2406B38;
        v187[1] = v44;
        v84 = v159->_spotlightQueryString;
        v186[2] = CFSTR("QUERY");
        v186[3] = CFSTR("TYPE");
        v187[2] = v84;
        v187[3] = &unk_1E242FDD8;
        v76 = (void *)MEMORY[0x1E0C99D80];
        v77 = v187;
        v78 = v186;
        goto LABEL_49;
      case 14:
        objc_msgSend(v161, "cs_escapedStringForSearchQuery");
        v44 = (CSItemSummary *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(kMDItemPhotosMediaTypes=\"%@\"cwd || kMDItemTitle=\"%@\"cwd)"), v44, v44);
        v85 = objc_claimAutoreleasedReturnValue();
        v86 = v159->_spotlightQueryString;
        v159->_spotlightQueryString = (NSString *)v85;

        v188[0] = CFSTR("TOKEN");
        v188[1] = CFSTR("TEXT");
        v189[0] = &stru_1E2406B38;
        v189[1] = v44;
        v87 = v159->_spotlightQueryString;
        v188[2] = CFSTR("QUERY");
        v188[3] = CFSTR("TYPE");
        v189[2] = v87;
        v189[3] = &unk_1E242FDC0;
        v76 = (void *)MEMORY[0x1E0C99D80];
        v77 = v189;
        v78 = v188;
        goto LABEL_49;
      case 15:
        v88 = (NSString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
        v89 = v159->_personNameIsMissing;
        v13 = v161;
        objc_msgSend(v161, "cs_escapedStringForSearchQuery");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = v90;
        if (v89)
        {
          objc_msgSend(v161, "cs_escapedStringForSearchQuery");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          v190 = v92;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v190, 1);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          v94 = tokenScopesWithPersonKey(v91, 0, v93, 0, v88, &unk_1E242F898, v157, v159->_isMailIntent, 0);

          if (v94)
          {
LABEL_46:
            v95 = v159->_spotlightQueryString;
            v159->_spotlightQueryString = v88;
            v96 = v88;

            v97 = [CSItemSummary alloc];
            v44 = -[CSItemSummary initWithName:contactIdentifier:alternateNames:phoneNumbers:emailAddresses:contactScope:](v97, "initWithName:contactIdentifier:alternateNames:phoneNumbers:emailAddresses:contactScope:", v161, 0, 0, 0, 0, 0);
            -[_CSSuggestionToken setItemSummary:](v159, "setItemSummary:", v44);
LABEL_47:
            v14 = v160;
LABEL_74:

LABEL_75:
            scopes = v19->_scopes;
            v19->_scopes = v40;
            v149 = v40;

            v150 = -[NSArray count](v149, "count");
            v12 = v156;
            v13 = v161;
            v15 = v158;
            if (v150)
              -[_CSSuggestionToken updateScopeSelection:](v19, "updateScopeSelection:", v39);
LABEL_77:
            self = v19;
            v17 = self;
LABEL_78:
            v16 = v162;
            break;
          }
        }
        else
        {
          v133 = tokenScopesWithPersonKey(v90, 0, 0, 0, v88, &unk_1E242F898, v157, v159->_isMailIntent, 0);

          if ((v133 & 1) != 0)
            goto LABEL_46;
        }
        v155 = (CSItemSummary *)v88;
        goto LABEL_82;
      case 16:
        objc_msgSend(v161, "cs_escapedStringForSearchQuery");
        v44 = (CSItemSummary *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(kMDItemPhotosKeywords=\"%@\"cwd || kMDItemTitle=\"%@\"cwd || kMDItemKeywords=\"%@\"cwd)"), v44, v44, v44);
        v98 = objc_claimAutoreleasedReturnValue();
        v99 = v159->_spotlightQueryString;
        v159->_spotlightQueryString = (NSString *)v98;

        v184[0] = CFSTR("TOKEN");
        v184[1] = CFSTR("TEXT");
        v185[0] = &stru_1E2406B38;
        v185[1] = v44;
        v100 = v159->_spotlightQueryString;
        v184[2] = CFSTR("QUERY");
        v184[3] = CFSTR("TYPE");
        v185[2] = v100;
        v185[3] = &unk_1E242FDF0;
        v76 = (void *)MEMORY[0x1E0C99D80];
        v77 = v185;
        v78 = v184;
LABEL_49:
        objc_msgSend(v76, "dictionaryWithObjects:forKeys:count:", v77, v78, 4);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v157, "addObject:", v101);

        goto LABEL_74;
      case 19:
        objc_msgSend(v161, "cs_escapedStringForSearchQuery");
        v44 = (CSItemSummary *)objc_claimAutoreleasedReturnValue();
        v102 = objc_alloc_init(MEMORY[0x1E0CB3578]);
        objc_msgSend(v102, "standaloneMonthSymbols");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        v104 = objc_msgSend(v103, "indexOfObject:", v161);

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(InRange(_kMDItemContentCreationDateMonth,%lu,%lu))"), v104 + 1, v104 + 1);
        v105 = objc_claimAutoreleasedReturnValue();
        v106 = v159->_spotlightQueryString;
        v159->_spotlightQueryString = (NSString *)v105;

        v178[0] = CFSTR("TOKEN");
        v178[1] = CFSTR("TEXT");
        v179[0] = &stru_1E2406B38;
        v179[1] = v44;
        v107 = v159->_spotlightQueryString;
        v178[2] = CFSTR("QUERY");
        v178[3] = CFSTR("TYPE");
        v179[2] = v107;
        v179[3] = &unk_1E242FD60;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v179, v178, 4);
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v157, "addObject:", v108);

        goto LABEL_52;
      case 20:
        objc_msgSend(v161, "cs_escapedStringForSearchQuery");
        v44 = (CSItemSummary *)objc_claimAutoreleasedReturnValue();
        v102 = objc_alloc_init(MEMORY[0x1E0CB3578]);
        objc_msgSend(v102, "setDateStyle:", 4);
        objc_msgSend(v102, "setTimeStyle:", 0);
        objc_msgSend(v102, "setDateFormat:", CFSTR("y"));
        objc_msgSend(v102, "dateFromString:", v44);
        v109 = v39;
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v111, "components:fromDate:", 4, v110);
        v112 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(InRange(_kMDItemContentCreationDateYear,%ld,%ld))"), objc_msgSend(v112, "year"), objc_msgSend(v112, "year"));
        v113 = objc_claimAutoreleasedReturnValue();
        v114 = v159->_spotlightQueryString;
        v159->_spotlightQueryString = (NSString *)v113;

        v176[0] = CFSTR("TOKEN");
        v176[1] = CFSTR("TEXT");
        v177[0] = &stru_1E2406B38;
        v177[1] = v44;
        v115 = v159->_spotlightQueryString;
        v176[2] = CFSTR("QUERY");
        v176[3] = CFSTR("TYPE");
        v177[2] = v115;
        v177[3] = &unk_1E242FD60;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v177, v176, 4);
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v157, "addObject:", v116);

        v39 = v109;
LABEL_52:

        goto LABEL_74;
      case 21:
      case 22:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(**=\"%@\"cwd)"), v161);
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = v159->_spotlightQueryString;
        v159->_spotlightQueryString = (NSString *)v41;

        v43 = objc_alloc(MEMORY[0x1E0CB3498]);
        objc_msgSend(v161, "lowercaseString");
        v44 = (CSItemSummary *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v43, "initWithString:", v44);
        v46 = v159->_suggestionDisplayText;
        v159->_suggestionDisplayText = (NSAttributedString *)v45;

        goto LABEL_74;
      case 23:
        v117 = (CSItemSummary *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("**=\"%@\"cwd"), v161);
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v117;
        -[CSItemSummary addObject:](v117, "addObject:", v118);

        v173 = 0u;
        v174 = 0u;
        v171 = 0u;
        v172 = 0u;
        v119 = v158;
        v120 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v171, v196, 16);
        if (v120)
        {
          v121 = v120;
          v122 = *(_QWORD *)v172;
          do
          {
            for (k = 0; k != v121; ++k)
            {
              if (*(_QWORD *)v172 != v122)
                objc_enumerationMutation(v119);
              v124 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(*(id *)(*((_QWORD *)&v171 + 1) + 8 * k), "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("*"));
              v125 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v124, "stringWithFormat:", CFSTR("**=\"%@\"cwd"), v125);
              v126 = (void *)objc_claimAutoreleasedReturnValue();
              -[CSItemSummary addObject:](v44, "addObject:", v126);

            }
            v121 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v171, v196, 16);
          }
          while (v121);
        }

        v127 = (void *)MEMORY[0x1E0CB3940];
        -[CSItemSummary componentsJoinedByString:](v44, "componentsJoinedByString:", CFSTR(" || "));
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v127, "stringWithFormat:", CFSTR("(%@)"), v128);
        v129 = objc_claimAutoreleasedReturnValue();
        v19 = v159;
        v130 = v159->_spotlightQueryString;
        v159->_spotlightQueryString = (NSString *)v129;

        v14 = v160;
        v40 = v157;
        goto LABEL_74;
      default:
        goto LABEL_75;
    }
  }
LABEL_79:

  return v17;
}

- (_CSSuggestionToken)initWithUserString:(id)a3 itemResult:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  double v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  char v54;
  char v55;
  int v56;
  _CSSuggestionToken *v57;
  double v58;
  void *v59;
  void *v60;
  int v61;
  int v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  id v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t i;
  void *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t j;
  void *v84;
  id v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t k;
  void *v90;
  id v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t m;
  void *v96;
  id v97;
  void *v98;
  id v99;
  void *v100;
  _CSSuggestionToken *v101;
  _CSSuggestionToken *v102;
  CSItemSummary *v103;
  CSItemSummary *v104;
  uint64_t v106;
  char v107;
  BOOL v108;
  BOOL v109;
  int v110;
  void *v111;
  id v112;
  id obj;
  void *v114;
  int v115;
  void *v116;
  void *v117;
  int v118;
  int v119;
  id v120;
  void *v121;
  id v122;
  id v123;
  id v124;
  __CFString *v125;
  void *v126;
  id v127;
  void *v129;
  id v130;
  id v131;
  void *v132;
  void *v133;
  objc_super v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  _QWORD v151[4];
  id v152;
  uint64_t v153;
  uint64_t *v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  uint64_t v159;
  uint64_t *v160;
  uint64_t v161;
  char v162;
  _BYTE v163[128];
  _BYTE v164[128];
  _BYTE v165[128];
  _BYTE v166[128];
  _BYTE v167[128];
  uint64_t v168;

  v168 = *MEMORY[0x1E0C80C00];
  v130 = a3;
  v5 = a4;
  v133 = v5;
  if (v5
    && (v124 = a4,
        objc_msgSend(v5, "attributeSet"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    objc_msgSend(v133, "attributeSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayName");
    v126 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v133, "attributeSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attributeDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("_kMDItemPersonScore"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = (void *)v10;
    else
      v12 = &unk_1E242FE38;
    v127 = v12;

    objc_msgSend(v133, "attributeSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "attributeDictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("com_apple_spotlight_contacts_type"));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    v17 = CFSTR("un");
    if (v15)
      v17 = (__CFString *)v15;
    v125 = v17;

    objc_msgSend(v133, "attributeSet");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "attributeDictionary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("_kMDItemBundleID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.spotlight.contacts"));

    v159 = 0;
    v160 = &v159;
    v161 = 0x2020000000;
    v162 = 0;
    v22 = 0.0;
    if (v21)
    {
      v118 = v21;
      objc_msgSend(v133, "attributeSet");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "attributeDictionary");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("_kMDItemPersonInCount"));
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = (void *)v25;
      if (v25)
        v27 = (void *)v25;
      else
        v27 = &unk_1E242FE38;
      v122 = v27;

      objc_msgSend(v133, "attributeSet");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "attributeDictionary");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("_kMDItemPersonOutCount"));
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = (void *)v30;
      if (v30)
        v32 = (void *)v30;
      else
        v32 = &unk_1E242FE38;
      v131 = v32;

      objc_msgSend(v133, "attributeSet");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "attributeDictionary");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("_kMDItemPersonCount"));
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = (void *)v35;
      if (v35)
        v37 = (void *)v35;
      else
        v37 = &unk_1E242FE38;
      v120 = v37;

      objc_msgSend(v127, "doubleValue");
      v39 = v38;
      objc_msgSend(v122, "doubleValue");
      v41 = v40;
      objc_msgSend(v131, "doubleValue");
      v43 = v42;
      objc_msgSend(v120, "doubleValue");
      v45 = log2(v41 * 0.1 + v39 * 0.5 + v43 * 5.0 + v44 * 0.15);
      v157 = 0u;
      v158 = 0u;
      v155 = 0u;
      v156 = 0u;
      objc_msgSend(v133, "attributeSet");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "emailAddresses");
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v155, v167, 16);
      if (v48)
      {
        v49 = *(_QWORD *)v156;
        v50 = MEMORY[0x1E0C809B0];
LABEL_20:
        v51 = 0;
        while (1)
        {
          if (*(_QWORD *)v156 != v49)
            objc_enumerationMutation(v47);
          if (*((_BYTE *)v160 + 24))
            break;
          v52 = *(_QWORD *)(*((_QWORD *)&v155 + 1) + 8 * v51);
          +[CSSuggestion noreplyTemplates](CSSuggestion, "noreplyTemplates");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v151[0] = v50;
          v151[1] = 3221225472;
          v151[2] = __52___CSSuggestionToken_initWithUserString_itemResult___block_invoke;
          v151[3] = &unk_1E2401848;
          v152 = v131;
          v153 = v52;
          v154 = &v159;
          objc_msgSend(v53, "enumerateObjectsUsingBlock:", v151);

          if (v48 == ++v51)
          {
            v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v155, v167, 16);
            if (v48)
              goto LABEL_20;
            break;
          }
        }
      }

      v22 = fmax(fmin(v45, 10.0) * 0.1, 0.0);
      v21 = v118;
    }
    v54 = objc_msgSend(v127, "isEqualToNumber:", &unk_1E242FE50);
    v55 = -[__CFString isEqualToString:](v125, "isEqualToString:", CFSTR("im"));
    if (*((_BYTE *)v160 + 24))
      v56 = 1;
    else
      v56 = -[__CFString isEqualToString:](v125, "isEqualToString:", CFSTR("ml"));
    if (v126
      && ((objc_msgSend(v127, "doubleValue"), v58 != 0.0) || objc_msgSend(v130, "length"))
      && (((v21 | v56 ^ 1) & 1) != 0 || v130 && (unint64_t)objc_msgSend(v130, "length") >= 5))
    {
      objc_msgSend(v133, "uniqueIdentifier");
      obj = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v133, "domainIdentifier");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v59;
      v111 = v59;
      if (v59)
      {
        v110 = objc_msgSend(v59, "isEqualToString:", CFSTR("com.apple.mobileslideshow"));
        v61 = objc_msgSend(v60, "isEqualToString:", CFSTR("com.apple.mobilemail"));
        v115 = objc_msgSend(v60, "isEqualToString:", CFSTR("com.apple.mobilephone"));
        v62 = objc_msgSend(v60, "isEqualToString:", CFSTR("pseudoContacts"));
        v63 = 1;
        if (v62)
          v63 = 2;
      }
      else
      {
        v115 = 0;
        v110 = 0;
        v61 = 0;
        v63 = 1;
      }
      v106 = v63;
      v107 = v56;
      v108 = v55;
      v109 = v54;
      v119 = v21;
      objc_msgSend(v133, "attributeSet");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "contactKeywords");
      v121 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v133, "attributeSet");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "emailAddresses");
      v132 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v133, "attributeSet");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "phoneNumbers");
      v116 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v133, "attributeSet");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "attributeDictionary");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("kMDItemAlternateNames"));
      v117 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v133, "attributeSet");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "attributeDictionary");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "objectForKeyedSubscript:", CFSTR("_kMDItemContactIdentifier"));
      v71 = objc_claimAutoreleasedReturnValue();
      v72 = (void *)v71;
      v73 = (void *)MEMORY[0x1E0C9AA60];
      if (v71)
        v73 = (void *)v71;
      v112 = v73;

      if (v61 && !objc_msgSend(v132, "count"))
      {
        v57 = 0;
      }
      else
      {
        objc_msgSend(v126, "cs_escapedStringForSearchQuery");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v149 = 0u;
        v150 = 0u;
        v147 = 0u;
        v148 = 0u;
        v75 = v121;
        v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v147, v166, 16);
        if (v76)
        {
          v77 = *(_QWORD *)v148;
          do
          {
            for (i = 0; i != v76; ++i)
            {
              if (*(_QWORD *)v148 != v77)
                objc_enumerationMutation(v75);
              objc_msgSend(*(id *)(*((_QWORD *)&v147 + 1) + 8 * i), "cs_escapedStringForSearchQuery");
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v74, "addObject:", v79);

            }
            v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v147, v166, 16);
          }
          while (v76);
        }

        v145 = 0u;
        v146 = 0u;
        v143 = 0u;
        v144 = 0u;
        v80 = v117;
        v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v143, v165, 16);
        if (v81)
        {
          v82 = *(_QWORD *)v144;
          do
          {
            for (j = 0; j != v81; ++j)
            {
              if (*(_QWORD *)v144 != v82)
                objc_enumerationMutation(v80);
              objc_msgSend(*(id *)(*((_QWORD *)&v143 + 1) + 8 * j), "cs_escapedStringForSearchQuery");
              v84 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v74, "addObject:", v84);

            }
            v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v143, v165, 16);
          }
          while (v81);
        }

        v85 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v141 = 0u;
        v142 = 0u;
        v139 = 0u;
        v140 = 0u;
        v86 = v132;
        v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v139, v164, 16);
        if (v87)
        {
          v88 = *(_QWORD *)v140;
          do
          {
            for (k = 0; k != v87; ++k)
            {
              if (*(_QWORD *)v140 != v88)
                objc_enumerationMutation(v86);
              objc_msgSend(*(id *)(*((_QWORD *)&v139 + 1) + 8 * k), "cs_escapedStringForSearchQuery");
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v85, "addObject:", v90);

            }
            v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v139, v164, 16);
          }
          while (v87);
        }

        v91 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v137 = 0u;
        v138 = 0u;
        v135 = 0u;
        v136 = 0u;
        v92 = v116;
        v93 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v135, v163, 16);
        if (v93)
        {
          v94 = *(_QWORD *)v136;
          do
          {
            for (m = 0; m != v93; ++m)
            {
              if (*(_QWORD *)v136 != v94)
                objc_enumerationMutation(v92);
              objc_msgSend(*(id *)(*((_QWORD *)&v135 + 1) + 8 * m), "cs_escapedStringForSearchQuery");
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v91, "addObject:", v96);

            }
            v93 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v135, v163, 16);
          }
          while (v93);
        }

        v97 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
        v123 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v98 = &unk_1E242F8C8;
        if (v110)
          v98 = &unk_1E242F8B0;
        v99 = v98;
        v100 = v99;
        if (v115)
        {

          v100 = &unk_1E242F8E0;
        }
        if ((tokenScopesWithPersonKey(v114, v74, v85, v91, v97, v100, v123, 0, v115) & 1) != 0)
        {
          v134.receiver = self;
          v134.super_class = (Class)_CSSuggestionToken;
          v101 = -[_CSSuggestionToken init](&v134, sel_init);
          v102 = v101;
          if (v101)
          {
            -[_CSSuggestionToken commonInitWithUserString:displayString:score:](v101, "commonInitWithUserString:displayString:score:", v130, v126, v127);
            -[_CSSuggestionToken setInternalType:](v102, "setInternalType:", 4);
            objc_storeStrong((id *)&v102->_spotlightQueryString, v97);
            v102->_personIsUser = v109;
            v102->_personIsImportant = v108;
            v102->_personIsMailingList = v107;
            objc_storeStrong((id *)&v102->_personIdentifier, obj);
            objc_storeStrong((id *)&v102->_personItem, v124);
            objc_storeStrong((id *)&v102->_scopes, v123);
            if (v119)
            {
              v102->_megadomeCompositeScore = v22;
              v102->_isMegadomeToken = 1;
            }
            v103 = [CSItemSummary alloc];
            objc_msgSend(v112, "firstObject");
            v129 = (void *)objc_claimAutoreleasedReturnValue();
            v104 = -[CSItemSummary initWithName:contactIdentifier:alternateNames:phoneNumbers:emailAddresses:contactScope:](v103, "initWithName:contactIdentifier:alternateNames:phoneNumbers:emailAddresses:contactScope:", v126, v129, v80, v92, v86, 0);
            -[_CSSuggestionToken setItemSummary:](v102, "setItemSummary:", v104);

            -[_CSSuggestionToken setBundleType:](v102, "setBundleType:", v106);
            if (objc_msgSend(v123, "count"))
              -[_CSSuggestionToken updateScopeSelection:](v102, "updateScopeSelection:", 0);
          }
          v57 = v102;
          self = v57;
        }
        else
        {
          v57 = 0;
        }

      }
    }
    else
    {
      v57 = 0;
    }
    _Block_object_dispose(&v159, 8);

  }
  else
  {
    v57 = 0;
  }

  return v57;
}

- (_CSSuggestionToken)initWithUserString:(id)a3 scopes:(id)a4 selectedIndex:(int64_t)a5 displayString:(id)a6
{
  id v10;
  id v11;
  id v12;
  _CSSuggestionToken *v13;
  _CSSuggestionToken *v14;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)_CSSuggestionToken;
  v13 = -[_CSSuggestionToken init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    -[_CSSuggestionToken commonInitWithUserString:displayString:score:](v13, "commonInitWithUserString:displayString:score:", v10, v12, &unk_1E242FE50);
    -[_CSSuggestionToken setInternalType:](v14, "setInternalType:", 2);
    objc_storeStrong((id *)&v14->_scopes, a4);
    v14->_selectedScope = a5;
    -[_CSSuggestionToken updateScopeSelection:](v14, "updateScopeSelection:", a5);
  }

  return v14;
}

- (_CSSuggestionToken)initWithUserString:(id)a3 tokenScopes:(id)a4 selectedIndex:(int64_t)a5 displayString:(id)a6 internalType:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  _CSSuggestionToken *v15;
  _CSSuggestionToken *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSArray *scopes;
  objc_super v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)_CSSuggestionToken;
  v15 = -[_CSSuggestionToken init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    -[_CSSuggestionToken commonInitWithUserString:displayString:score:](v15, "commonInitWithUserString:displayString:score:", v12, v14, &unk_1E242FE50);
    -[_CSSuggestionToken setInternalType:](v16, "setInternalType:", a7);
    -[_CSSuggestionToken setTokenScopes:](v16, "setTokenScopes:", v13);
    if (objc_msgSend(v12, "length"))
    {
      v23[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = &unk_1E242F8F8;
    }
    -[_CSSuggestionToken tokenScopes](v16, "tokenScopes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CSTokenScope scopesFromCSTokenScopes:displayString:handles:](_CSTokenScope, "scopesFromCSTokenScopes:displayString:handles:", v18, v14, v17);
    v19 = objc_claimAutoreleasedReturnValue();
    scopes = v16->_scopes;
    v16->_scopes = (NSArray *)v19;

    -[_CSSuggestionToken updateScopeSelection:](v16, "updateScopeSelection:", a5);
  }

  return v16;
}

- (_CSSuggestionToken)initWithUserString:(id)a3 suggestionTokenResult:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  char isKindOfClass;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  _CSSuggestionToken *v55;
  void *v56;
  _CSSuggestionToken *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  id v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t i;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  _BOOL4 v79;
  id v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  unint64_t v85;
  void *v86;
  _CSSuggestionToken *v88;
  _CSSuggestionToken *v89;
  uint64_t v90;
  NSArray *filterQueries;
  uint64_t v92;
  void *v93;
  void *v94;
  CSItemSummary *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  id obj;
  id v105;
  id v106;
  id v107;
  void *v109;
  id v110;
  id v111;
  uint64_t v112;
  void *v113;
  objc_super v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  void *v127;
  _BYTE v128[128];
  _BYTE v129[128];
  _BYTE v130[128];
  uint64_t v131;

  v131 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("suggestionTypeKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("suggestionTypeKey"));
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("suggestionTokensKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("suggestionTokensKey"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v9 = 0;
    v10 = 0;
  }
  v102 = objc_msgSend(v10, "count");
  if (v102)
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("STATUS"));
    v112 = objc_claimAutoreleasedReturnValue();

    v103 = 0;
  }
  else
  {
    v112 = 0;
    v103 = -1;
  }
  obj = a4;
  if (initWithUserString_suggestionTokenResult__onceToken != -1)
    dispatch_once(&initWithUserString_suggestionTokenResult__onceToken, &__block_literal_global_445);
  objc_msgSend((id)initWithUserString_suggestionTokenResult__gSuggestionTypes, "objectForKeyedSubscript:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend((id)initWithUserString_suggestionTokenResult__gSuggestionTypes, "objectForKeyedSubscript:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "intValue");
    v16 = v15;

    if (v15 == 25 && v112)
    {
      objc_msgSend((id)initWithUserString_suggestionTokenResult__gSuggestionFlagColorTypes, "objectForKeyedSubscript:", v112);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (int)objc_msgSend(v17, "intValue");

    }
  }
  else
  {
    v16 = 0;
  }
  v109 = v7;
  v110 = v10;
  v111 = (id)v9;
  if (!v10 || !objc_msgSend(v10, "count"))
  {
LABEL_51:
    if (v7)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("suggestionTextKey"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("suggestionTextKey"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v42 = 0;
      }

    }
    else
    {
      v42 = 0;
    }
    if (v16 == 16)
    {
      objc_msgSend(v10, "firstObject");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("TEXT"));
      v44 = objc_claimAutoreleasedReturnValue();

      v42 = (void *)v44;
    }
    v113 = v42;
    if (v7)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("suggestionDescriptionKey"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("suggestionDescriptionKey"));
        v25 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v25 = 0;
      }

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("suggestionFilterQueries"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v48 = v5;
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("suggestionFilterQueries"));
        v49 = v7;
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "firstObject");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v52 = v16;
          objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("suggestionFilterQueries"));
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "lastObject");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("suggestionFilterQueries"));
            v31 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v31 = 0;
          }

          v16 = v52;
        }
        else
        {
          v31 = 0;
        }

        v5 = v48;
        v7 = v109;
      }
      else
      {
        v31 = 0;
      }

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("suggestionIncludeBundles"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v106 = v5;
        v59 = v16;
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("suggestionIncludeBundles"));
        v60 = v7;
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "firstObject");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("suggestionIncludeBundles"));
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "lastObject");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("suggestionIncludeBundles"));
            v65 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v65 = 0;
          }

          v46 = v65;
        }
        else
        {
          v46 = 0;
        }

        v7 = v109;
        v16 = v59;
        v5 = v106;
      }
      else
      {
        v46 = 0;
      }

    }
    else
    {
      v25 = 0;
      v31 = 0;
      v46 = 0;
    }
    if (!(v46 | v31))
    {
      v81 = 0;
      v56 = (void *)v112;
      v57 = self;
LABEL_105:
      if (v16 == 44 && v56 && v25)
      {
        if (objc_msgSend(v25, "containsString:", CFSTR("flagColor")))
        {
          objc_msgSend((id)initWithUserString_suggestionTokenResult__gSuggestionFlagColorTypes, "objectForKeyedSubscript:", v56);
          v83 = v46;
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (int)objc_msgSend(v84, "intValue");

          v46 = v83;
        }
        else
        {
          v16 = 44;
        }
      }
      v85 = v16;
      v55 = 0;
      if (!v113 || !v25 || !v111)
      {
LABEL_117:

LABEL_118:
LABEL_119:

        v86 = v110;
        v18 = v113;
        goto LABEL_120;
      }
      if (v85 <= 0x23 && ((1 << v85) & 0x800104A00) != 0)
      {
        v55 = 0;
        goto LABEL_117;
      }
      v114.receiver = v57;
      v114.super_class = (Class)_CSSuggestionToken;
      v88 = -[_CSSuggestionToken init](&v114, sel_init);
      v89 = v88;
      if (!v88)
      {
LABEL_139:
        v57 = v89;
        v55 = v57;
        goto LABEL_117;
      }
      -[_CSSuggestionToken commonInitWithUserString:displayString:score:](v88, "commonInitWithUserString:displayString:score:", v5, v113, &unk_1E2430378);
      objc_storeStrong((id *)&v89->_spotlightQueryString, v25);
      if (v81)
      {
        v127 = v81;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v127, 1);
        v90 = objc_claimAutoreleasedReturnValue();
        filterQueries = v89->_filterQueries;
        v89->_filterQueries = (NSArray *)v90;

      }
      v92 = v103;
      if (v85)
      {
        v101 = v46;
        if (objc_msgSend(v110, "count"))
        {
          if (!v102 || v85 != 16)
            goto LABEL_138;
          objc_msgSend(v110, "objectAtIndexedSubscript:", 0);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "objectForKey:", CFSTR("EMAILS"));
          v94 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v94, "count"))
          {
            v95 = -[CSItemSummary initWithName:contactIdentifier:alternateNames:phoneNumbers:emailAddresses:contactScope:]([CSItemSummary alloc], "initWithName:contactIdentifier:alternateNames:phoneNumbers:emailAddresses:contactScope:", v113, 0, 0, 0, v94, 0);
            -[_CSSuggestionToken setItemSummary:](v89, "setItemSummary:", v95);

          }
        }
        else
        {
          v94 = v110;
          v92 = -1;
          v110 = (id)MEMORY[0x1E0C9AA60];
        }
        v46 = v101;
      }
      else
      {
        v94 = v110;
        v92 = -1;
        v110 = (id)MEMORY[0x1E0C9AA60];
      }

      v7 = v109;
LABEL_138:
      objc_storeStrong((id *)&v89->_nlpCompletionAttributes, obj);
      objc_storeStrong((id *)&v89->_nlpCompletionType, v111);
      v89->_nlpKind = v85;
      objc_storeStrong((id *)&v89->_scopes, v110);
      -[_CSSuggestionToken setInternalType:](v89, "setInternalType:", 3);
      -[_CSSuggestionToken updateScopeSelection:](v89, "updateScopeSelection:", v92);
      goto LABEL_139;
    }
    v98 = v16;
    v107 = v5;
    v66 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v115 = 0u;
    v116 = 0u;
    v117 = 0u;
    v118 = 0u;
    v100 = v46;
    v67 = (id)v46;
    v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v115, v128, 16);
    if (v68)
    {
      v69 = v68;
      v70 = *(_QWORD *)v116;
      do
      {
        for (i = 0; i != v69; ++i)
        {
          if (*(_QWORD *)v116 != v70)
            objc_enumerationMutation(v67);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_kMDItemBundleID=\"%@\"), *(_QWORD *)(*((_QWORD *)&v115 + 1) + 8 * i));
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "addObject:", v72);

        }
        v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v115, v128, 16);
      }
      while (v69);
    }

    v73 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v66, "componentsJoinedByString:", CFSTR(" || "));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "stringWithFormat:", CFSTR("(%@)"), v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      v76 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend((id)v31, "componentsJoinedByString:", CFSTR(" || "));
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "stringWithFormat:", CFSTR("(%@)"), v77);
      v78 = (void *)objc_claimAutoreleasedReturnValue();

      v79 = v75 != 0;
      if (v75)
      {
        v5 = v107;
        if (v78)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ && %@)"), v75, v78);
          v80 = (id)objc_claimAutoreleasedReturnValue();
LABEL_104:
          v81 = v80;
          v56 = (void *)v112;
          v57 = self;

          v7 = v109;
          v16 = v98;
          v46 = v100;
          goto LABEL_105;
        }
LABEL_100:
        if (v79)
          v82 = v75;
        else
          v82 = v78;
        v80 = v82;
        goto LABEL_104;
      }
    }
    else
    {
      v78 = 0;
      v79 = v75 != 0;
    }
    v5 = v107;
    goto LABEL_100;
  }
  v125 = 0u;
  v126 = 0u;
  v123 = 0u;
  v124 = 0u;
  v18 = v10;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v123, v130, 16);
  if (!v19)
    goto LABEL_50;
  v20 = v19;
  v21 = *(_QWORD *)v124;
  v105 = v5;
  v113 = v18;
  v97 = *(_QWORD *)v124;
  while (2)
  {
    v22 = 0;
    v99 = v20;
LABEL_25:
    if (*(_QWORD *)v124 != v21)
      objc_enumerationMutation(v18);
    v23 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * v22);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v55 = 0;
      goto LABEL_133;
    }
    v24 = v16;
    v121 = 0u;
    v122 = 0u;
    v119 = 0u;
    v120 = 0u;
    v25 = v23;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v119, v129, 16);
    if (!v26)
      goto LABEL_42;
    v27 = v26;
    v28 = *(_QWORD *)v120;
    v96 = v22;
    while (2)
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v120 != v28)
          objc_enumerationMutation(v25);
        v30 = *(_QWORD *)(*((_QWORD *)&v119 + 1) + 8 * j);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_69:
          v55 = 0;
          v56 = (void *)v112;
          v110 = v113;
          v5 = v105;
          v57 = self;
          v7 = v109;
          goto LABEL_119;
        }
        objc_msgSend(v25, "objectForKeyedSubscript:", v30);
        v31 = objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_38;
        if (v24 != 16)
        {
          v55 = 0;
          v56 = (void *)v112;
          v110 = v113;
          v5 = v105;
          v57 = self;
          v7 = v109;
          goto LABEL_118;
        }
        objc_msgSend(v25, "objectForKeyedSubscript:", v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {

LABEL_38:
          continue;
        }
        objc_msgSend(v25, "objectForKeyedSubscript:", v30);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
          goto LABEL_69;
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v119, v129, 16);
      v7 = v109;
      v22 = v96;
      if (v27)
        continue;
      break;
    }
LABEL_42:

    objc_msgSend(v25, "objectForKey:", CFSTR("TOKEN"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      objc_msgSend(v25, "objectForKey:", CFSTR("TEXT"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v105;
      if (!v36)
        goto LABEL_131;
      objc_msgSend(v25, "objectForKey:", CFSTR("QUERY"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v37)
        goto LABEL_131;
      v16 = v24;
      if (v24 == 16)
      {
        objc_msgSend(v25, "objectForKey:", CFSTR("TYPE"));
        v38 = objc_claimAutoreleasedReturnValue();
        if (!v38
          || (v39 = (void *)v38,
              objc_msgSend(v25, "objectForKey:", CFSTR("EMAILS")),
              v40 = (void *)objc_claimAutoreleasedReturnValue(),
              v40,
              v39,
              !v40))
        {
LABEL_131:
          v55 = 0;
          v18 = v113;
LABEL_133:
          v86 = v18;
          goto LABEL_134;
        }
      }
      ++v22;
      v21 = v97;
      v10 = v110;
      v18 = v113;
      if (v22 == v99)
      {
        v20 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v123, v130, 16);
        if (!v20)
        {
LABEL_50:

          goto LABEL_51;
        }
        continue;
      }
      goto LABEL_25;
    }
    break;
  }
  v55 = 0;
  v18 = v113;
  v86 = v113;
  v5 = v105;
LABEL_134:
  v56 = (void *)v112;
  v57 = self;
LABEL_120:

  return v55;
}

- (_CSSuggestionToken)initWithUserString:(id)a3 suggestionResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _CSSuggestionToken *v13;
  _CSSuggestionToken *v14;
  _CSSuggestionToken *v15;
  NSString *nlpCompletionType;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v7)
  {
    v11 = 0;
    v10 = 0;
LABEL_13:
    v13 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("suggestion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("suggestion"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("query"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v11 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("query"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  if (v10 && v11)
  {
    v18.receiver = self;
    v18.super_class = (Class)_CSSuggestionToken;
    v14 = -[_CSSuggestionToken init](&v18, sel_init);
    v15 = v14;
    if (v14)
    {
      -[_CSSuggestionToken commonInitWithUserString:displayString:score:](v14, "commonInitWithUserString:displayString:score:", v6, v10, &unk_1E2430378);
      objc_storeStrong((id *)&v15->_spotlightQueryString, v11);
      objc_storeStrong((id *)&v15->_nlpCompletionAttributes, a4);
      nlpCompletionType = v15->_nlpCompletionType;
      v15->_nlpCompletionType = (NSString *)CFSTR("kQPSuggestion");

      v15->_nlpKind = 0;
      -[_CSSuggestionToken setInternalType:](v15, "setInternalType:", 11);
    }
    self = v15;
    v13 = self;
  }
LABEL_14:

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _CSSuggestionToken *v3;
  _CSSuggestionToken *v4;
  _CSSuggestionToken *v5;
  NSAttributedString *suggestionDisplayText;
  _CSSuggestionToken *v7;
  _CSSuggestionToken *v8;
  void *v9;
  uint64_t v10;
  _CSSuggestionToken *v11;
  _CSSuggestionToken *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _CSSuggestionToken *v24;
  NSArray *obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v3 = self;
  v31 = *MEMORY[0x1E0C80C00];
  switch(self->_internalType)
  {
    case 1:
      v7 = -[_CSSuggestionToken initWithUserString:queryString:]([_CSSuggestionToken alloc], "initWithUserString:queryString:", self->_displayString, self->_spotlightQueryString);
      goto LABEL_12;
    case 2:
      v5 = -[_CSSuggestionToken initWithUserString:scopes:selectedIndex:displayString:]([_CSSuggestionToken alloc], "initWithUserString:scopes:selectedIndex:displayString:", self->_searchString, self->_scopes, self->_selectedScope, self->_displayString);
      -[_CSSuggestionToken setInternalType:](v5, "setInternalType:", v3->_internalType);
      suggestionDisplayText = v3->_suggestionDisplayText;
      v4 = v5;
      goto LABEL_3;
    case 3:
      v7 = -[_CSSuggestionToken initWithUserString:suggestionTokenResult:]([_CSSuggestionToken alloc], "initWithUserString:suggestionTokenResult:", self->_searchString, self->_nlpCompletionAttributes);
      goto LABEL_12;
    case 4:
      v7 = -[_CSSuggestionToken initWithUserString:itemResult:]([_CSSuggestionToken alloc], "initWithUserString:itemResult:", self->_searchString, self->_personItem);
      goto LABEL_12;
    case 6:
      v8 = [_CSSuggestionToken alloc];
      v7 = -[_CSSuggestionToken initWithUserString:displayString:attributeValues:attributeStrings:options:](v8, "initWithUserString:displayString:attributeValues:attributeStrings:options:", v3->_searchString, v3->_displayString, v3->_localCompletionAttributes, v3->_localCompletionAttributesStrings, MEMORY[0x1E0C9AA70]);
      goto LABEL_12;
    case 7:
    case 8:
    case 9:
    case 0xALL:
      v4 = -[_CSSuggestionToken initWithUserString:tokenScopes:selectedIndex:displayString:internalType:]([_CSSuggestionToken alloc], "initWithUserString:tokenScopes:selectedIndex:displayString:internalType:", self->_searchString, self->_tokenScopes, self->_selectedScope, self->_displayString, self->_internalType);
      v5 = v4;
      suggestionDisplayText = v3->_suggestionDisplayText;
LABEL_3:
      -[_CSSuggestionToken setSuggestionDisplayText:](v4, "setSuggestionDisplayText:", suggestionDisplayText);
      if (!v5)
        goto LABEL_16;
      goto LABEL_13;
    case 0xBLL:
      v7 = -[_CSSuggestionToken initWithUserString:suggestionResult:]([_CSSuggestionToken alloc], "initWithUserString:suggestionResult:", self->_searchString, self->_nlpCompletionAttributes);
      goto LABEL_12;
    case 0xCLL:
      v13 = -[_CSSuggestionToken initWithUserString:displayString:queryString:]([_CSSuggestionToken alloc], "initWithUserString:displayString:queryString:", self->_displayString, self->_displayString, self->_spotlightQueryString);
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v24 = v3;
      obj = v3->_scopes;
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v27 != v16)
              objc_enumerationMutation(obj);
            v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
            objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("TOKEN"), v24);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("TEXT"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("QUERY"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[_CSSuggestionToken addTokenScope:tokenText:queryString:](v13, "addTokenScope:tokenText:queryString:", v19, v20, v21);

          }
          v15 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v15);
      }

      v5 = v13;
      -[_CSSuggestionToken scopes](v13, "scopes");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");

      v3 = v24;
      if (!v23)
        goto LABEL_15;
      goto LABEL_14;
    default:
      v7 = -[_CSSuggestionToken initWithUserString:displayString:score:]([_CSSuggestionToken alloc], "initWithUserString:displayString:score:", self->_searchString, self->_displayString, self->_score);
LABEL_12:
      v5 = v7;
      if (v7)
      {
LABEL_13:
        v3->_selectedScope = -[_CSSuggestionToken selectedScope](v5, "selectedScope");
        -[_CSSuggestionToken updateScopes:](v5, "updateScopes:", v3->_scopes);
        -[_CSSuggestionToken scopes](v5, "scopes");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "count");

        if (v10)
LABEL_14:
          -[_CSSuggestionToken updateScopeSelection:](v5, "updateScopeSelection:", v3->_selectedScope, v24);
LABEL_15:
        -[_CSSuggestionToken updateReplacementRange:](v5, "updateReplacementRange:", v3->_replacementRange.location, v3->_replacementRange.length, v24);
      }
LABEL_16:
      v11 = v5;

      return v11;
  }
}

- (BOOL)nameAndEmailRenderableWithName:(id)a3 emails:(id)a4
{
  return 0;
}

- (void)updateNameAndEmailDisplayState
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[_CSSuggestionToken itemSummary](self, "itemSummary");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CSSuggestionToken itemSummary](self, "itemSummary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allEmailAddresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_shouldDisplayNameAndEmail = -[_CSSuggestionToken nameAndEmailRenderableWithName:emails:](self, "nameAndEmailRenderableWithName:emails:", v3, v5);

}

- (void)mergeTokenAttributes:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  unsigned int v16;
  unint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  v21 = a3;
  -[_CSSuggestionToken age](self, "age");
  if (v4 <= 0.0 || (objc_msgSend(v21, "age"), v5 <= 0.0))
  {
    -[_CSSuggestionToken age](self, "age");
    if (v9 > 0.0)
      goto LABEL_10;
    objc_msgSend(v21, "age");
    if (v10 <= 0.0)
      goto LABEL_10;
    objc_msgSend(v21, "age");
  }
  else
  {
    -[_CSSuggestionToken age](self, "age");
    v7 = v6;
    objc_msgSend(v21, "age");
    if (v7 < v8)
      v8 = v7;
  }
  -[_CSSuggestionToken setAge:](self, "setAge:", v8);
LABEL_10:
  if (-[_CSSuggestionToken hasUsedDate](self, "hasUsedDate"))
    v11 = 1;
  else
    v11 = objc_msgSend(v21, "hasUsedDate");
  -[_CSSuggestionToken setHasUsedDate:](self, "setHasUsedDate:", v11);
  if (-[_CSSuggestionToken hasRecentActivity](self, "hasRecentActivity"))
    v12 = 1;
  else
    v12 = objc_msgSend(v21, "hasRecentActivity");
  -[_CSSuggestionToken setHasRecentActivity:](self, "setHasRecentActivity:", v12);
  if (-[_CSSuggestionToken isMegadomeToken](self, "isMegadomeToken")
    || objc_msgSend(v21, "isMegadomeToken"))
  {
    -[_CSSuggestionToken megadomeCompositeScore](self, "megadomeCompositeScore");
    v14 = v13;
    objc_msgSend(v21, "megadomeCompositeScore");
    if (v14 >= v15)
      v15 = v14;
    -[_CSSuggestionToken setMegadomeCompositeScore:](self, "setMegadomeCompositeScore:", v15);
    v16 = 4;
  }
  else
  {
    v16 = 0;
  }
  if (!-[_CSSuggestionToken selectedScope](self, "selectedScope") || !objc_msgSend(v21, "selectedScope"))
  {
    v17 = 0;
    goto LABEL_28;
  }
  if (-[_CSSuggestionToken selectedScope](self, "selectedScope") == 1 || objc_msgSend(v21, "selectedScope") == 1)
  {
    v17 = 1;
LABEL_28:
    self->_selectedScope = v17;
  }
  if (-[_CSSuggestionToken internalType](self, "internalType") == 4
    && -[_CSSuggestionToken bundleType](self, "bundleType") == 1
    && !-[_CSSuggestionToken isMegadomeToken](self, "isMegadomeToken"))
  {
    v18 = 1;
  }
  else if (objc_msgSend(v21, "internalType") == 4 && objc_msgSend(v21, "bundleType") == 1)
  {
    v18 = objc_msgSend(v21, "isMegadomeToken") ^ 1;
  }
  else
  {
    v18 = 0;
  }
  if (-[_CSSuggestionToken internalType](self, "internalType") == 6
    && -[_CSSuggestionToken tokenKind](self, "tokenKind") == 16)
  {
    if (v18)
      LODWORD(v19) = v16 | 2;
    else
      LODWORD(v19) = v16;
LABEL_46:
    v19 = v19 | 1;
    goto LABEL_50;
  }
  if (objc_msgSend(v21, "internalType") == 6)
  {
    v20 = objc_msgSend(v21, "tokenKind");
    if (v18)
      v19 = v16 | 2;
    else
      v19 = v16;
    if (v20 == 16)
      goto LABEL_46;
  }
  else if (v18)
  {
    v19 = v16 | 2;
  }
  else
  {
    v19 = v16;
  }
LABEL_50:
  -[_CSSuggestionToken setSuggestionTokenDataSources:](self, "setSuggestionTokenDataSources:", v19);

}

- (void)mergeTokenScopesAndSpotlightQueryString:(id)a3
{
  id *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id *v30;
  _CSSuggestionToken *v31;
  uint64_t v32;
  uint64_t v33;
  NSString *spotlightQueryString;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
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
  char v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  id *v80;
  void *v81;
  int v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  _BOOL4 v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  BOOL v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  _CSSuggestionToken *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  CSItemSummary *v114;
  int v115;
  CSItemSummary *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  uint64_t v121;
  id *v122;
  char v124;
  void *v125;
  uint64_t v126;
  void *v127;
  NSArray *obj;
  id obja;
  void *v130;
  id v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  _BYTE v140[128];
  _BYTE v141[128];
  uint64_t v142;

  v142 = *MEMORY[0x1E0C80C00];
  v3 = (id *)a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v136 = 0u;
  v137 = 0u;
  v138 = 0u;
  v139 = 0u;
  v122 = v3;
  v5 = v3[6];
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v136, v141, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v137;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v137 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("TOKEN"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("TOKEN"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v12);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v136, v141, 16);
    }
    while (v7);
  }

  v131 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v132 = 0u;
  v133 = 0u;
  v134 = 0u;
  v135 = 0u;
  v13 = self->_scopes;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v132, v140, 16);
  v130 = v4;
  if (!v14)
  {
    v30 = v122;
    v31 = self;
    goto LABEL_26;
  }
  v15 = v14;
  v124 = 0;
  v16 = *(_QWORD *)v133;
  obj = v13;
  do
  {
    v17 = 0;
    v126 = v15;
    do
    {
      if (*(_QWORD *)v133 != v16)
        objc_enumerationMutation(obj);
      v18 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * v17);
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("TOKEN"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("TOKEN"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v21)
          goto LABEL_18;
        objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("QUERY"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("QUERY"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v22, "isEqual:", v23);

        v4 = v130;
        if ((v24 & 1) == 0)
        {
          v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v18);
          v26 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("QUERY"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("QUERY"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "stringWithFormat:", CFSTR("(%@ || %@)"), v27, v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v126;
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v29, CFSTR("QUERY"));

          v4 = v130;
          objc_msgSend(v131, "addObject:", v25);

          v124 = 1;
        }
        else
        {
LABEL_18:
          objc_msgSend(v131, "addObject:", v18);
        }

      }
      ++v17;
    }
    while (v15 != v17);
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v132, v140, 16);
  }
  while (v15);

  v30 = v122;
  v31 = self;
  if ((v124 & 1) != 0)
  {
    v13 = (NSArray *)objc_msgSend(v131, "copy");
    -[_CSSuggestionToken updateScopes:](self, "updateScopes:", v13);
LABEL_26:

  }
  v32 = (uint64_t)v30[10];
  if (v32)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ || %@)"), v31->_spotlightQueryString, v32);
    v33 = objc_claimAutoreleasedReturnValue();
    spotlightQueryString = v31->_spotlightQueryString;
    v31->_spotlightQueryString = (NSString *)v33;

  }
  v35 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[_CSSuggestionToken itemSummary](v31, "itemSummary");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "emailAddresses");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "addObjectsFromArray:", v37);

  objc_msgSend(v30, "itemSummary");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "emailAddresses");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  obja = v35;
  objc_msgSend(v35, "addObjectsFromArray:", v39);

  v40 = objc_alloc(MEMORY[0x1E0C99E20]);
  -[_CSSuggestionToken itemSummary](v31, "itemSummary");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "allEmailAddresses");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)objc_msgSend(v40, "initWithArray:", v42);

  objc_msgSend(v30, "itemSummary");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "allEmailAddresses");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = v43;
  objc_msgSend(v43, "addObjectsFromArray:", v45);

  v46 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[_CSSuggestionToken itemSummary](v31, "itemSummary");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "alternateNames");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "addObjectsFromArray:", v48);

  objc_msgSend(v30, "itemSummary");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "alternateNames");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "addObjectsFromArray:", v50);

  objc_msgSend(v30, "itemSummary");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "name");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v52, "length"))
  {
    objc_msgSend(v30, "itemSummary");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "name");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CSSuggestionToken itemSummary](v31, "itemSummary");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "name");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v54, "isEqualToString:", v56);

    v30 = v122;
    if ((v57 & 1) != 0)
      goto LABEL_33;
    objc_msgSend(v122, "itemSummary");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "name");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "addObject:", v52);
  }

LABEL_33:
  v58 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[_CSSuggestionToken itemSummary](v31, "itemSummary");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "phoneNumbers");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "addObjectsFromArray:", v60);

  objc_msgSend(v30, "itemSummary");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "phoneNumbers");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "addObjectsFromArray:", v62);

  -[_CSSuggestionToken itemSummary](v31, "itemSummary");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v63, "contactScope");

  if (objc_msgSend(v30, "selectedScope"))
  {
    v121 = v64;
  }
  else
  {
    v31->_selectedScope = 0;
    v121 = 1;
  }
  -[_CSSuggestionToken itemSummary](v31, "itemSummary");
  v65 = objc_claimAutoreleasedReturnValue();
  v125 = v46;
  if (!v65
    || (v66 = (void *)v65,
        objc_msgSend(v30, "itemSummary"),
        v67 = (void *)objc_claimAutoreleasedReturnValue(),
        v67,
        v66,
        !v67))
  {
    objc_msgSend(v30, "itemSummary");
    v83 = (void *)objc_claimAutoreleasedReturnValue();

    if (v83)
    {
      objc_msgSend(v30, "itemSummary");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CSSuggestionToken setItemSummary:](v31, "setItemSummary:", v84);
LABEL_60:

      goto LABEL_61;
    }
    goto LABEL_61;
  }
  v68 = v58;
  -[_CSSuggestionToken itemSummary](v31, "itemSummary");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "nameComponents");
  v70 = objc_claimAutoreleasedReturnValue();
  if (!v70)
  {

LABEL_46:
    objc_msgSend(v30, "itemSummary");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "nameComponents");
    v86 = (void *)objc_claimAutoreleasedReturnValue();

    v58 = v68;
    if (!v86)
      goto LABEL_61;
    goto LABEL_59;
  }
  v71 = (void *)v70;
  objc_msgSend(v30, "itemSummary");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "nameComponents");
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v73)
    goto LABEL_46;
  objc_msgSend(v30, "itemSummary");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "nameComponents");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "givenName");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  if (v76)
  {
    objc_msgSend(v30, "itemSummary");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "nameComponents");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "middleName");
    v79 = objc_claimAutoreleasedReturnValue();
    v80 = v30;
    v81 = (void *)v79;
    if (v79)
    {
      v82 = 1;
    }
    else
    {
      objc_msgSend(v80, "itemSummary");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "nameComponents");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "familyName");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v118 = v74;
      v90 = v89 != 0;

      v82 = v90;
      v74 = v118;
    }

    v30 = v122;
  }
  else
  {
    v82 = 0;
  }
  v58 = v68;

  -[_CSSuggestionToken itemSummary](v31, "itemSummary");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "nameComponents");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "givenName");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  if (v93)
  {
    v119 = v91;
    -[_CSSuggestionToken itemSummary](v31, "itemSummary");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "nameComponents");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "middleName");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    if (v96)
    {
      v97 = 1;
    }
    else
    {
      -[_CSSuggestionToken itemSummary](v31, "itemSummary");
      v115 = v82;
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "nameComponents");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "familyName");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = v100 != 0;

      v58 = v68;
      v82 = v115;
    }

    v30 = v122;
    v91 = v119;
  }
  else
  {
    v97 = 0;
  }

  v46 = v125;
  if (!v97 && ((v82 ^ 1) & 1) == 0)
  {
LABEL_59:
    objc_msgSend(v30, "itemSummary");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "nameComponents");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    -[_CSSuggestionToken itemSummary](v31, "itemSummary");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "setNameComponents:", v101);

    goto LABEL_60;
  }
LABEL_61:
  v117 = v58;
  v116 = [CSItemSummary alloc];
  -[_CSSuggestionToken itemSummary](v31, "itemSummary");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "name");
  v103 = objc_claimAutoreleasedReturnValue();
  -[_CSSuggestionToken itemSummary](v31, "itemSummary");
  v104 = v31;
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "contactIdentifier");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "allObjects");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "allObjects");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obja, "allObjects");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "allObjects");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CSSuggestionToken itemSummary](v104, "itemSummary");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v111, "nameComponents");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = (void *)v103;
  v114 = -[CSItemSummary initWithName:contactIdentifier:alternateNames:phoneNumbers:emailAddresses:allEmailAddresses:nameComponents:contactScope:](v116, "initWithName:contactIdentifier:alternateNames:phoneNumbers:emailAddresses:allEmailAddresses:nameComponents:contactScope:", v103, v106, v107, v108, v109, v110, v112, v121);

  -[_CSSuggestionToken setItemSummary:](self, "setItemSummary:", v114);
}

- (BOOL)isEqual:(id)a3
{
  _CSSuggestionToken *v4;
  BOOL v5;

  v4 = (_CSSuggestionToken *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[_CSSuggestionToken isEqualToToken:](self, "isEqualToToken:", v4);
  }

  return v5;
}

- (BOOL)isEqualToToken:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  void *v60;
  void *v61;
  void *v62;
  char v63;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;

  v4 = a3;
  if (!v4)
    goto LABEL_75;
  v5 = -[_CSSuggestionToken internalType](self, "internalType");
  if (v5 != objc_msgSend(v4, "internalType"))
    goto LABEL_75;
  v6 = -[_CSSuggestionToken bundleType](self, "bundleType");
  if (v6 != objc_msgSend(v4, "bundleType"))
    goto LABEL_75;
  v7 = -[_CSSuggestionToken replacementRange](self, "replacementRange");
  if (v7 != objc_msgSend(v4, "replacementRange"))
    goto LABEL_75;
  -[_CSSuggestionToken replacementRange](self, "replacementRange");
  v9 = v8;
  objc_msgSend(v4, "replacementRange");
  if (v9 != v10)
    goto LABEL_75;
  -[_CSSuggestionToken score](self, "score");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "score");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqualToNumber:", v12);

  if (!v13)
    goto LABEL_75;
  -[_CSSuggestionToken scopes](self, "scopes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scopes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isEqualToArray:", v15);

  if (!v16)
    goto LABEL_75;
  v17 = -[_CSSuggestionToken selectedScope](self, "selectedScope");
  if (v17 != objc_msgSend(v4, "selectedScope"))
    goto LABEL_75;
  -[_CSSuggestionToken displayText](self, "displayText");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    objc_msgSend(v4, "displayText");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
      goto LABEL_78;
  }
  -[_CSSuggestionToken displayText](self, "displayText");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_msgSend(v4, "displayText");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    if (!v20)
      goto LABEL_75;
  }
  else
  {

    if (v18)
  }
  -[_CSSuggestionToken displayText](self, "displayText");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {

  }
  else
  {
    -[_CSSuggestionToken displayText](self, "displayText");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "string");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayText");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "string");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v24, "isEqualToString:", v26);

    if (!v27)
      goto LABEL_75;
  }
  -[_CSSuggestionToken queryString](self, "queryString");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v28)
  {
    objc_msgSend(v4, "queryString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
      goto LABEL_78;
  }
  -[_CSSuggestionToken queryString](self, "queryString");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    objc_msgSend(v4, "queryString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    if (!v30)
      goto LABEL_75;
  }
  else
  {

    if (v28)
  }
  -[_CSSuggestionToken queryString](self, "queryString");
  v31 = objc_claimAutoreleasedReturnValue();
  if (!v31)
    goto LABEL_87;
  v32 = (void *)v31;
  -[_CSSuggestionToken queryString](self, "queryString");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queryString");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v33, "isEqualToString:", v34);

  if (v35)
  {
LABEL_87:
    -[_CSSuggestionToken personItem](self, "personItem");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v36)
    {
      objc_msgSend(v4, "personItem");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
        goto LABEL_78;
    }
    -[_CSSuggestionToken personItem](self, "personItem");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      objc_msgSend(v4, "personItem");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
      if (!v38)
        goto LABEL_75;
    }
    else
    {

      if (v36)
    }
    -[_CSSuggestionToken personItem](self, "personItem");
    v39 = objc_claimAutoreleasedReturnValue();
    if (!v39)
      goto LABEL_46;
    v40 = (void *)v39;
    -[_CSSuggestionToken personItem](self, "personItem");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "personItem");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v41, "isEqual:", v42);

    if (v43)
    {
LABEL_46:
      -[_CSSuggestionToken nlpCompletionAttributes](self, "nlpCompletionAttributes");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v44)
      {
        objc_msgSend(v4, "nlpCompletionAttributes");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
          goto LABEL_78;
      }
      -[_CSSuggestionToken nlpCompletionAttributes](self, "nlpCompletionAttributes");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (v45)
      {
        objc_msgSend(v4, "nlpCompletionAttributes");
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        if (v44)
        if (!v46)
          goto LABEL_75;
      }
      else
      {

        if (v44)
      }
      -[_CSSuggestionToken nlpCompletionAttributes](self, "nlpCompletionAttributes");
      v47 = objc_claimAutoreleasedReturnValue();
      if (!v47)
        goto LABEL_58;
      v48 = (void *)v47;
      -[_CSSuggestionToken nlpCompletionAttributes](self, "nlpCompletionAttributes");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "nlpCompletionAttributes");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v49, "isEqualToDictionary:", v50);

      if (v51)
      {
LABEL_58:
        -[_CSSuggestionToken localCompletionAttributes](self, "localCompletionAttributes");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v52)
        {
          objc_msgSend(v4, "localCompletionAttributes");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
            goto LABEL_78;
        }
        -[_CSSuggestionToken localCompletionAttributes](self, "localCompletionAttributes");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        if (v53)
        {
          objc_msgSend(v4, "localCompletionAttributes");
          v54 = (void *)objc_claimAutoreleasedReturnValue();

          if (v52)
          if (!v54)
            goto LABEL_75;
        }
        else
        {

          if (v52)
        }
        -[_CSSuggestionToken localCompletionAttributes](self, "localCompletionAttributes");
        v55 = objc_claimAutoreleasedReturnValue();
        if (!v55)
          goto LABEL_70;
        v56 = (void *)v55;
        -[_CSSuggestionToken localCompletionAttributes](self, "localCompletionAttributes");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "localCompletionAttributes");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend(v57, "isEqualToArray:", v58);

        if (v59)
        {
LABEL_70:
          -[_CSSuggestionToken tokenScopes](self, "tokenScopes");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v60)
          {
            objc_msgSend(v4, "tokenScopes");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (v21)
            {
LABEL_78:
              v63 = 0;
LABEL_79:

              goto LABEL_76;
            }
          }
          -[_CSSuggestionToken tokenScopes](self, "tokenScopes");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          if (v61)
          {
            objc_msgSend(v4, "tokenScopes");
            v62 = (void *)objc_claimAutoreleasedReturnValue();

            if (v60)
            if (!v62)
              goto LABEL_75;
          }
          else
          {

            if (v60)
          }
          -[_CSSuggestionToken tokenScopes](self, "tokenScopes");
          v65 = objc_claimAutoreleasedReturnValue();
          if (!v65)
          {
            v63 = 1;
            goto LABEL_76;
          }
          v66 = (void *)v65;
          -[_CSSuggestionToken tokenScopes](self, "tokenScopes");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "tokenScopes");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = objc_msgSend(v67, "isEqualToArray:", v68);

          v21 = v66;
          goto LABEL_79;
        }
      }
    }
  }
LABEL_75:
  v63 = 0;
LABEL_76:

  return v63;
}

- (BOOL)isValid
{
  _CSSuggestionToken *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = self;
  if (self)
  {
    if (-[_CSSuggestionToken tokenKind](self, "tokenKind")
      && (-[_CSSuggestionToken scopes](v2, "scopes"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          v4 = objc_msgSend(v3, "count"),
          v3,
          !v4))
    {
      LOBYTE(v2) = 0;
    }
    else
    {
      -[_CSSuggestionToken displayText](v2, "displayText");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5 && objc_msgSend(v5, "length"))
      {
        -[_CSSuggestionToken queryString](v2, "queryString");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (v7)
          LOBYTE(v2) = objc_msgSend(v7, "length") != 0;
        else
          LOBYTE(v2) = 0;

      }
      else
      {
        LOBYTE(v2) = 0;
      }

    }
  }
  return (char)v2;
}

- (unint64_t)hash
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[_CSSuggestionToken displayText](self, "displayText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_CSSuggestionToken displayText](self, "displayText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

  }
  -[_CSSuggestionToken queryString](self, "queryString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_CSSuggestionToken queryString](self, "queryString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v8);

  }
  -[_CSSuggestionToken tokenScopes](self, "tokenScopes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v9);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld:%ld:%ld"), -[_CSSuggestionToken selectedScope](self, "selectedScope"), -[_CSSuggestionToken tokenKind](self, "tokenKind"), -[_CSSuggestionToken internalType](self, "internalType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  objc_msgSend(v3, "componentsJoinedByString:", &stru_1E2406B38);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");

  return v12;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<%@:%p %lu>"), objc_opt_class(), self, -[_CSSuggestionToken internalType](self, "internalType"));
}

- (int64_t)compareByRank:(id)a3
{
  id v4;
  _BOOL4 v5;
  _BOOL4 v6;
  int v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  BOOL v13;
  int64_t v14;
  int64_t v15;
  uint64_t v16;
  int64_t v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;

  v4 = a3;
  v5 = -[_CSSuggestionToken internalType](self, "internalType") == 4
    || -[_CSSuggestionToken localCompletionType](self, "localCompletionType") == 10
    || -[_CSSuggestionToken localCompletionType](self, "localCompletionType") == 7;
  v6 = objc_msgSend(v4, "internalType") == 4
    || objc_msgSend(v4, "localCompletionType") == 10
    || objc_msgSend(v4, "localCompletionType") == 7;
  v7 = v5 && v6;
  v8 = -[_CSSuggestionToken internalType](self, "internalType");
  v9 = v8;
  if (v7 == 1)
  {
    if (v8 != 6 || objc_msgSend(v4, "internalType") != 6)
    {
      if (!_os_feature_enabled_impl()
        || -[_CSSuggestionToken localCompletionType](self, "localCompletionType") == 7
        && -[_CSSuggestionToken localCompletionType](self, "localCompletionType") == 7)
      {
LABEL_34:
        v15 = -[_CSSuggestionToken internalType](self, "internalType");
        v16 = objc_msgSend(v4, "internalType");
LABEL_35:
        v13 = v15 < v16;
LABEL_36:
        if (v13)
          v14 = -1;
        else
          v14 = 1;
        goto LABEL_39;
      }
      goto LABEL_28;
    }
    goto LABEL_19;
  }
  v10 = objc_msgSend(v4, "internalType");
  v11 = -[_CSSuggestionToken internalType](self, "internalType");
  if (v9 != v10)
  {
    v13 = v11 < objc_msgSend(v4, "internalType");
    goto LABEL_36;
  }
  if (v11 == 6 && objc_msgSend(v4, "internalType") == 6)
  {
LABEL_19:
    v12 = -[_CSSuggestionToken localCompare:](self, "localCompare:", v4);
LABEL_29:
    v14 = v12;
    goto LABEL_39;
  }
  if ((-[_CSSuggestionToken internalType](self, "internalType") == 3
     || -[_CSSuggestionToken internalType](self, "internalType") == 11)
    && (objc_msgSend(v4, "internalType") == 3 || objc_msgSend(v4, "internalType") == 11))
  {
    v12 = -[_CSSuggestionToken nlpCompare:](self, "nlpCompare:", v4);
    goto LABEL_29;
  }
  if (-[_CSSuggestionToken internalType](self, "internalType") == 4 && objc_msgSend(v4, "internalType") == 4)
  {
LABEL_28:
    v12 = -[_CSSuggestionToken peopleCompare:](self, "peopleCompare:", v4);
    goto LABEL_29;
  }
  if (-[_CSSuggestionToken internalType](self, "internalType") == 7
    || -[_CSSuggestionToken internalType](self, "internalType") == 8
    || -[_CSSuggestionToken internalType](self, "internalType") == 9
    || -[_CSSuggestionToken internalType](self, "internalType") == 10)
  {
    goto LABEL_34;
  }
  v18 = -[_CSSuggestionToken tokenKind](self, "tokenKind");
  if (v18 != objc_msgSend(v4, "tokenKind"))
  {
    v15 = -[_CSSuggestionToken tokenKind](self, "tokenKind");
    v16 = objc_msgSend(v4, "tokenKind");
    goto LABEL_35;
  }
  if (-[_CSSuggestionToken isEqualToToken:](self, "isEqualToToken:", v4))
  {
    v14 = 0;
  }
  else
  {
    -[_CSSuggestionToken score](self, "score");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");
    v21 = v20;
    objc_msgSend(v4, "score");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "doubleValue");
    if (v21 <= v23)
      v14 = 1;
    else
      v14 = -1;

  }
LABEL_39:

  return v14;
}

- (NSAttributedString)displayText
{
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  unint64_t internalType;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  __CFString *v13;
  id v14;
  void *v15;
  void *v17;
  void *v18;
  uint64_t v19;

  -[_CSSuggestionToken displayString](self, "displayString");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = &stru_1E2406B38;
  if (v3)
    v5 = (__CFString *)v3;
  v6 = v5;

  -[_CSSuggestionToken searchString](self, "searchString");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString length](v6, "length"))
  {
    internalType = self->_internalType;
    if (internalType <= 0xA)
    {
      if (((1 << internalType) & 0x78C) == 0)
      {
        if (internalType != 6
          || (-[_CSSuggestionToken localCompletionType](self, "localCompletionType") & 0xFFFFFFFFFFFFFFFELL) != 2)
        {
          goto LABEL_11;
        }
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString stringByTrimmingCharactersInSet:](v6, "stringByTrimmingCharactersInSet:", v17);
        v10 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString stringByTrimmingCharactersInSet:](v7, "stringByTrimmingCharactersInSet:", v18);
        v19 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v19, v10);
        v11 = objc_claimAutoreleasedReturnValue();

        v6 = (__CFString *)v19;
        goto LABEL_9;
      }
      if (-[_CSSuggestionToken tokenKind](self, "tokenKind"))
      {
        -[_CSSuggestionToken tokenDisplayString](self, "tokenDisplayString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (!v9)
        {
LABEL_10:

          goto LABEL_11;
        }
        v10 = v9;
        v11 = (uint64_t)v10;
LABEL_9:

        v6 = (__CFString *)v11;
        goto LABEL_10;
      }
    }
LABEL_11:
    v12 = objc_alloc(MEMORY[0x1E0CB3778]);
    v13 = v6;
    goto LABEL_14;
  }
  if (!-[__CFString length](v7, "length"))
  {
    v14 = objc_alloc_init(MEMORY[0x1E0CB3778]);
    goto LABEL_15;
  }
  v12 = objc_alloc(MEMORY[0x1E0CB3778]);
  v13 = v7;
LABEL_14:
  v14 = (id)objc_msgSend(v12, "initWithString:", v13);
LABEL_15:
  v15 = v14;

  return (NSAttributedString *)v15;
}

- (_NSRange)replacementRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_replacementRange.length;
  if (self->_replacementRange.location == -1)
    location = 0x7FFFFFFFFFFFFFFFLL;
  else
    location = self->_replacementRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (NSArray)scopes
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_scopes;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "objectForKeyedSubscript:", CFSTR("TOKEN"), (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (unint64_t)selectedScope
{
  if (-[_CSSuggestionToken tokenKind](self, "tokenKind"))
    return self->_selectedScope;
  else
    return -1;
}

- (void)updateReplacementRange:(_NSRange)a3
{
  self->_replacementRange = a3;
}

- (void)updateScopes:(id)a3
{
  objc_storeStrong((id *)&self->_scopes, a3);
}

- (BOOL)isMessageWithAttachmentsToken
{
  void *v3;
  void *v4;
  BOOL v5;
  BOOL v6;

  if (-[_CSSuggestionToken internalType](self, "internalType") == 2)
  {
    -[_CSSuggestionToken tokenScopes](self, "tokenScopes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(v4, "scopeType") == 6;
  }
  else
  {
    -[_CSSuggestionToken nlpCompletionType](self, "nlpCompletionType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("kQPTokenAttachmentAny")) & 1) != 0)
    {
      v6 = 1;
      goto LABEL_9;
    }
    v5 = -[_CSSuggestionToken internalType](self, "internalType") == 9;
  }
  v6 = v5;
LABEL_9:

  return v6;
}

- (void)updateItemSummary
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 56);
  v5 = objc_msgSend(*a2, "count");
  v6 = 134218240;
  v7 = v4;
  v8 = 2048;
  v9 = v5;
  _os_log_error_impl(&dword_18C42F000, a3, OS_LOG_TYPE_ERROR, "CSUserQuery: Selected scope %ld is out of bounds to scopes array of size %ld", (uint8_t *)&v6, 0x16u);
}

- (void)updateScopeSelection:(unint64_t)a3
{
  self->_selectedScope = a3;
  -[_CSSuggestionToken updateItemSummary](self, "updateItemSummary");
}

- (void)updateSearchString:(id)a3
{
  NSString *v4;
  NSString *searchString;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  searchString = self->_searchString;
  self->_searchString = v4;

}

- (id)tokenText
{
  unint64_t v3;
  void *v4;
  void *v5;

  v3 = -[_CSSuggestionToken selectedScope](self, "selectedScope");
  if (-[NSArray count](self->_scopes, "count") && v3 < -[NSArray count](self->_scopes, "count"))
  {
    -[NSArray objectAtIndex:](self->_scopes, "objectAtIndex:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TOKEN"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)tokenDisplayString
{
  unint64_t v3;
  void *v4;
  void *v5;

  v3 = -[_CSSuggestionToken selectedScope](self, "selectedScope");
  if (-[NSArray count](self->_scopes, "count") && v3 < -[NSArray count](self->_scopes, "count"))
  {
    -[NSArray objectAtIndex:](self->_scopes, "objectAtIndex:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_CSSuggestionToken isMessageWithAttachmentsToken](self, "isMessageWithAttachmentsToken"))
      CSGetLocalizedString(CFSTR("ATTACHMENT_TITLE"));
    else
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TEXT"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)tokenQueryString
{
  unint64_t v3;
  void *v4;
  void *v5;

  v3 = -[_CSSuggestionToken selectedScope](self, "selectedScope");
  if (-[NSArray count](self->_scopes, "count") && v3 < -[NSArray count](self->_scopes, "count"))
  {
    -[NSArray objectAtIndex:](self->_scopes, "objectAtIndex:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("QUERY"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)searchString
{
  return self->_searchString;
}

- (id)displayString
{
  return self->_displayString;
}

- (id)queryString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;

  -[_CSSuggestionToken displayString](self, "displayString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CSSuggestionToken searchString](self, "searchString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CSSuggestionToken spotlightQueryString](self, "spotlightQueryString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CSSuggestionToken filterQueries](self, "filterQueries");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  switch(self->_internalType)
  {
    case 0:
      goto LABEL_9;
    case 1:
      if (v5)
        goto LABEL_8;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(**=\"%@\"cwdt)"), v11, v21);
      break;
    case 3:
    case 7:
    case 8:
    case 9:
    case 0xALL:
      if (-[_CSSuggestionToken tokenKind](self, "tokenKind"))
      {
        -[_CSSuggestionToken tokenQueryString](self, "tokenQueryString");
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        if (v12)
          v14 = (void *)v12;
        else
          v14 = v5;
        v15 = v14;

        v5 = v15;
      }
      goto LABEL_7;
    case 6:
      switch(-[_CSSuggestionToken localCompletionType](self, "localCompletionType"))
      {
        case 2:
        case 3:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(**=\"%@\"cwd && **=\"%@\"cwd)"), v11, v9);
          goto LABEL_23;
        case 7:
        case 10:
          goto LABEL_7;
        case 9:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(**=\"%@\"cwdt)"), v11, v21);
          goto LABEL_23;
        default:
          if (objc_msgSend(v5, "length"))
            goto LABEL_7;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(**=\"%@\"cwd || _kMDItemLaunchString=\"%@*\"cwdt)"), v11, v11);
LABEL_23:
          v20 = objc_claimAutoreleasedReturnValue();

          v5 = (void *)v20;
          break;
      }
      goto LABEL_7;
    default:
      if (v5)
        goto LABEL_8;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(**=\"%@\"cwd || _kMDItemLaunchString=\"%@*\"cwdt)"), v11, v11);
      break;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  if (v5)
  {
LABEL_8:
    objc_msgSend(v7, "addObject:", v5);
LABEL_9:

  }
  if (v6)
    objc_msgSend(v7, "addObjectsFromArray:", v6);
  v16 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(" && "));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)spotlightQueryString
{
  return self->_spotlightQueryString;
}

- (void)setScore:(id)a3
{
  objc_storeStrong((id *)&self->_score, a3);
}

- (NSNumber)score
{
  return self->_score;
}

- (void)setMegadomeCompositeScore:(double)a3
{
  self->_megadomeCompositeScore = a3;
}

- (double)megadomeCompositeScore
{
  return self->_megadomeCompositeScore;
}

- (void)setIsMegadomeToken:(BOOL)a3
{
  self->_isMegadomeToken = a3;
}

- (BOOL)isMegadomeToken
{
  return self->_isMegadomeToken;
}

- (void)setInternalType:(int64_t)a3
{
  self->_internalType = a3;
}

- (int64_t)internalType
{
  return self->_internalType;
}

- (void)setBundleType:(int64_t)a3
{
  self->_bundleType = a3;
}

- (int64_t)bundleType
{
  return self->_bundleType;
}

- (id)suggestionDisplayText
{
  return self->_suggestionDisplayText;
}

- (void)setSuggestionDisplayText:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionDisplayText, a3);
}

- (int64_t)tokenKind
{
  int64_t result;
  int64_t v4;

  result = 0;
  switch(self->_internalType)
  {
    case 2:
    case 7:
      result = 14;
      break;
    case 3:
    case 0xBLL:
      result = self->_nlpKind;
      break;
    case 4:
      result = 16;
      break;
    case 6:
      v4 = -[_CSSuggestionToken localCompletionType](self, "localCompletionType");
      if ((unint64_t)(v4 - 6) >= 0xF)
        result = 0;
      else
        result = qword_18C4EDFF8[v4 - 6];
      break;
    case 8:
    case 9:
      result = 2;
      break;
    case 0xALL:
      result = 46;
      break;
    case 0xCLL:
      if (-[NSArray count](self->_scopes, "count"))
        result = 47;
      else
        result = 0;
      break;
    default:
      return result;
  }
  return result;
}

- (NSDictionary)features
{
  NSMutableDictionary *features;
  void *v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;
  void *v8;

  features = self->_features;
  -[_CSSuggestionToken localCompletionFeatures](self, "localCompletionFeatures");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary addEntriesFromDictionary:](features, "addEntriesFromDictionary:", v4);

  v5 = self->_features;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[_CSSuggestionToken score](self, "score");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  objc_msgSend(v6, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v8, CFSTR("score"));

  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_features, "copy");
}

- (id)nlpCompletionType
{
  return self->_nlpCompletionType;
}

- (id)nlpCompletionAttributes
{
  return self->_nlpCompletionAttributes;
}

- (id)nlpCompletionCategories
{
  return -[NSDictionary objectForKeyedSubscript:](self->_nlpCompletionAttributes, "objectForKeyedSubscript:", CFSTR("rankCategoriesKey"));
}

- (int64_t)nlpCompare:(id)a3
{
  return 0;
}

- (int64_t)localCompletionType
{
  return self->_localCompletionType;
}

- (id)localCompletionAttributes
{
  return self->_localCompletionAttributes;
}

- (id)localCompletionAttributeStrings
{
  return self->_localCompletionAttributesStrings;
}

- (id)localCompletionFeatures
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  int v57;
  int v58;
  double v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;

  if (-[NSArray count](self->_localCompletionAttributes, "count") == 21)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[NSArray objectAtIndexedSubscript:](self->_localCompletionAttributes, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "integerValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("queryLen"));

    -[NSArray objectAtIndexedSubscript:](self->_localCompletionAttributes, "objectAtIndexedSubscript:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "integerValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("queryFragmentCount"));

    -[NSArray objectAtIndexedSubscript:](self->_localCompletionAttributes, "objectAtIndexedSubscript:", 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "longLongValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("queryCompletionCounnt"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSString length](self->_displayString, "length"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("len"));

    -[NSArray objectAtIndexedSubscript:](self->_localCompletionAttributes, "objectAtIndexedSubscript:", 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "integerValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("fragments"));

    -[NSArray objectAtIndexedSubscript:](self->_localCompletionAttributes, "objectAtIndexedSubscript:", 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "doubleValue");
    v19 = v18;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("age"));

    -[NSArray objectAtIndexedSubscript:](self->_localCompletionAttributes, "objectAtIndexedSubscript:", 5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    v23 = v22;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("prob"));

    -[NSArray objectAtIndexedSubscript:](self->_localCompletionAttributes, "objectAtIndexedSubscript:", 6);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "longLongValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v27, CFSTR("maxscore"));

    -[NSArray objectAtIndexedSubscript:](self->_localCompletionAttributes, "objectAtIndexedSubscript:", 7);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (int)objc_msgSend(v28, "intValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("weight"));

    -[NSArray objectAtIndexedSubscript:](self->_localCompletionAttributes, "objectAtIndexedSubscript:", 8);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (int)objc_msgSend(v31, "intValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("parentWeight"));

    -[NSArray objectAtIndexedSubscript:](self->_localCompletionAttributes, "objectAtIndexedSubscript:", 9);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "integerValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v36, CFSTR("rootWeight"));

    -[NSArray objectAtIndexedSubscript:](self->_localCompletionAttributes, "objectAtIndexedSubscript:", 10);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "doubleValue");
    v39 = v38;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("phraseScore"));

    -[NSArray objectAtIndexedSubscript:](self->_localCompletionAttributes, "objectAtIndexedSubscript:", 11);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "doubleValue");
    v43 = v42;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v44, CFSTR("punishment"));

    -[NSArray objectAtIndexedSubscript:](self->_localCompletionAttributes, "objectAtIndexedSubscript:", 12);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "doubleValue");
    v47 = v46;

    v48 = 0.0;
    if (v47 != 1.79769313e308)
      v48 = v47;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v49, CFSTR("compositeScore"));

    -[NSArray objectAtIndexedSubscript:](self->_localCompletionAttributes, "objectAtIndexedSubscript:", 14);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "integerValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v52, CFSTR("completionType"));

    -[NSArray objectAtIndexedSubscript:](self->_localCompletionAttributes, "objectAtIndexedSubscript:", 15);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "integerValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v55, CFSTR("prefixLen"));

    -[NSArray objectAtIndexedSubscript:](self->_localCompletionAttributes, "objectAtIndexedSubscript:", 13);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "floatValue");
    v58 = v57;

    LODWORD(v59) = v58;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v60, CFSTR("fieldWeight"));

    -[NSArray objectAtIndexedSubscript:](self->_localCompletionAttributes, "objectAtIndexedSubscript:", 16);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v61, "integerValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v63, CFSTR("isSingleThread"));

    -[NSArray objectAtIndexedSubscript:](self->_localCompletionAttributes, "objectAtIndexedSubscript:", 17);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v64, "integerValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v66, CFSTR("hasUsedDate"));

    -[NSArray objectAtIndexedSubscript:](self->_localCompletionAttributes, "objectAtIndexedSubscript:", 18);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v67, "integerValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v69, CFSTR("isShortcut"));

    -[NSArray objectAtIndexedSubscript:](self->_localCompletionAttributes, "objectAtIndexedSubscript:", 19);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = objc_msgSend(v70, "integerValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v72, CFSTR("hasMultipleResults"));

  }
  else
  {
    v3 = (id)MEMORY[0x1E0C9AA70];
  }
  return v3;
}

- (int64_t)localCompare:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unsigned int v7;
  int v9;
  int v11;
  unint64_t v12;
  _BOOL4 v14;
  int v15;
  int v16;
  int64_t v17;
  BOOL v18;
  int v19;
  unint64_t v20;
  _BOOL4 v21;
  _BOOL4 v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  unsigned int v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  uint64_t v48;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  unint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;

  v4 = a3;
  v5 = -[_CSSuggestionToken localCompletionType](self, "localCompletionType");
  v6 = objc_msgSend(v4, "localCompletionType");
  v7 = (v5 < 0x10) & (0x8480u >> v5);
  v9 = v5 < 5 || v5 == 9;
  v11 = v6 < 5 || v6 == 9;
  v12 = v5 - 21;
  v14 = v6 == 21 || v5 == 22;
  if (((v5 < 0x10) & (0x8480u >> v5)) != 0 || v5 < 0xE && ((0x3A1Fu >> v5) & 1) != 0)
  {
    v15 = 1;
    if (((v6 < 0x10) & (0x8480u >> v6)) != 0)
    {
LABEL_30:
      v16 = 1;
      goto LABEL_31;
    }
  }
  else
  {
    v15 = v12 < 3;
    if (((v6 < 0x10) & (0x8480u >> v6)) != 0)
      goto LABEL_30;
  }
  if (v6 < 0xE && ((0x3A1Fu >> v6) & 1) != 0)
    goto LABEL_30;
  v16 = v6 == 23 || v14;
LABEL_31:
  if ((v15 & v16 & 1) != 0)
  {
    if (v7)
      v17 = -1;
    else
      v17 = 1;
    if (v7 == ((v6 < 0x10) & (0x8480u >> v6)))
    {
      if ((v5 < 5 || v5 == 9 || v6 < 5 || v6 == 9) && v9 != v11)
      {
        if (v5 < 0xA && ((0x21Fu >> v5) & 1) != 0)
        {
          v17 = -1;
          goto LABEL_99;
        }
        if (v6 < 0xA && ((0x21Fu >> v6) & 1) != 0)
        {
          v17 = 1;
          goto LABEL_99;
        }
      }
      v18 = v6 == 21;
      v19 = v12 < 2 || v14;
      if (v12 < 2)
        v17 = -1;
      else
        v17 = 1;
      if (v12 < 2)
        v18 = 1;
      if (v19 != 1 || v12 < 2 == v14 || !v18)
      {
        v20 = v6 - 11;
        v17 = v5 - 11 < 3 ? -1 : 1;
        v21 = v20 < 3;
        v22 = v20 < 3 || v5 - 11 < 3;
        if (!v22 || (((v5 - 11 < 3) ^ v21) & 1) == 0)
        {
          v17 = v5 == 23 ? -1 : 1;
          v23 = v6 == 23 || v5 == 23;
          if (!v23 || (v5 == 23) == (v6 == 23))
          {
LABEL_74:
            -[_CSSuggestionToken localCompletionAttributes](self, "localCompletionAttributes");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "objectAtIndexedSubscript:", 18);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = objc_msgSend(v25, "integerValue");

            objc_msgSend(v24, "objectAtIndexedSubscript:", 17);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = objc_msgSend(v26, "integerValue");

            objc_msgSend(v24, "objectAtIndexedSubscript:", 3);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "intValue");

            objc_msgSend(v24, "objectAtIndexedSubscript:", 4);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "doubleValue");
            v31 = v30;

            -[_CSSuggestionToken score](self, "score");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "doubleValue");
            v34 = v33;

            objc_msgSend(v4, "localCompletionAttributes");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "objectAtIndexedSubscript:", 18);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v36, "integerValue");

            objc_msgSend(v35, "objectAtIndexedSubscript:", 17);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = objc_msgSend(v38, "integerValue");

            objc_msgSend(v35, "objectAtIndexedSubscript:", 3);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = objc_msgSend(v40, "intValue");

            objc_msgSend(v35, "objectAtIndexedSubscript:", 4);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "doubleValue");
            v44 = v43;

            objc_msgSend(v4, "score");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "doubleValue");
            v47 = v46;

            if (v5 == 23 && v28 != v41)
            {
              if (v28 == 1)
              {
                v17 = 1;
LABEL_98:

                goto LABEL_99;
              }
              if (v41 == 1)
              {
                v17 = -1;
                goto LABEL_98;
              }
            }
            if (v34 == v47)
            {
              v48 = v58;
              if (v58 == v37 && (v48 = v57, v57 == v39))
              {
                if (!v57 || v31 == v44)
                {
                  if (v28 == v41)
                  {
                    -[_CSSuggestionToken displayText](self, "displayText");
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    v51 = objc_msgSend(v50, "length");
                    objc_msgSend(v4, "displayText");
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                    v53 = objc_msgSend(v52, "length");

                    if (v51 == v53)
                    {
                      v17 = 0;
                    }
                    else
                    {
                      -[_CSSuggestionToken displayText](self, "displayText");
                      v54 = (void *)objc_claimAutoreleasedReturnValue();
                      v55 = objc_msgSend(v54, "length");
                      objc_msgSend(v4, "displayText");
                      v56 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v55 > objc_msgSend(v56, "length"))
                        v17 = -1;
                      else
                        v17 = 1;

                    }
                  }
                  else if (v28 > v41)
                  {
                    v17 = -1;
                  }
                  else
                  {
                    v17 = 1;
                  }
                }
                else if (v31 >= v44)
                {
                  v17 = 1;
                }
                else
                {
                  v17 = -1;
                }
              }
              else if (v48)
              {
                v17 = -1;
              }
              else
              {
                v17 = 1;
              }
            }
            else if (v34 <= v47)
            {
              v17 = 1;
            }
            else
            {
              v17 = -1;
            }
            goto LABEL_98;
          }
        }
      }
    }
  }
  else
  {
    if (v15 == v16)
      goto LABEL_74;
    if (v15)
      v17 = 1;
    else
      v17 = -1;
  }
LABEL_99:

  return v17;
}

- (BOOL)shouldDisplayNameAndEmail
{
  -[_CSSuggestionToken updateNameAndEmailDisplayState](self, "updateNameAndEmailDisplayState");
  return self->_shouldDisplayNameAndEmail;
}

- (int)suggestionTokenDataSources
{
  return self->_suggestionTokenDataSources;
}

- (BOOL)hasRecentActivity
{
  return self->_hasRecentActivity;
}

- (BOOL)hasUsedDate
{
  return self->_hasUsedDate;
}

- (double)age
{
  return self->_age;
}

- (BOOL)isUser
{
  return self->_personIsUser;
}

- (BOOL)isMailingList
{
  return self->_personIsMailingList;
}

- (BOOL)isImportant
{
  return self->_personIsImportant;
}

- (double)lastUsedDate
{
  CSSearchableItem *personItem;
  void *v3;
  void *v4;
  double v5;

  personItem = self->_personItem;
  if (!personItem)
    return 0.0;
  -[CSSearchableItem attributeSet](personItem, "attributeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastUsedDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0.0;
  v5 = MEMORY[0x18D7817BC](v4);

  return v5;
}

- (void)setSuggestionTokenDataSources:(int)a3
{
  self->_suggestionTokenDataSources = a3;
}

- (void)setHasRecentActivity:(BOOL)a3
{
  self->_hasRecentActivity = a3;
}

- (void)setHasUsedDate:(BOOL)a3
{
  self->_hasUsedDate = a3;
}

- (void)setAge:(double)a3
{
  self->_age = a3;
}

- (void)setIsMailingList:(BOOL)a3
{
  self->_personIsMailingList = a3;
}

- (id)personItem
{
  return self->_personItem;
}

- (int64_t)peopleCompare:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (!-[_CSSuggestionToken isMailingList](self, "isMailingList") && (objc_msgSend(v4, "isMailingList") & 1) != 0)
    goto LABEL_7;
  if (-[_CSSuggestionToken isMailingList](self, "isMailingList") && !objc_msgSend(v4, "isMailingList"))
  {
LABEL_11:
    v5 = 1;
    goto LABEL_12;
  }
  if (-[_CSSuggestionToken isUser](self, "isUser") || (objc_msgSend(v4, "isUser") & 1) == 0)
  {
    if (!-[_CSSuggestionToken isUser](self, "isUser") || objc_msgSend(v4, "isUser"))
    {
      objc_msgSend(v4, "score");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_CSSuggestionToken score](self, "score");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v6, "compare:", v7);

      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_7:
  v5 = -1;
LABEL_12:

  return v5;
}

- (id)debugDescription
{
  id v3;
  uint64_t v4;
  int64_t v5;
  _BOOL4 v6;
  _BOOL4 v7;
  void *v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  v5 = -[_CSSuggestionToken bundleType](self, "bundleType");
  v6 = -[_CSSuggestionToken isMailingList](self, "isMailingList");
  v7 = -[_CSSuggestionToken isImportant](self, "isImportant");
  -[_CSSuggestionToken score](self, "score");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@:%p; %d; %d; %d, %@>"), v4, self, v5, v6, v7, v8);

  return v9;
}

- (void)setSelectedScope:(unint64_t)a3
{
  self->_selectedScope = a3;
}

- (CSItemSummary)itemSummary
{
  return self->_itemSummary;
}

- (void)setItemSummary:(id)a3
{
  objc_storeStrong((id *)&self->_itemSummary, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSArray)tokenScopes
{
  return self->_tokenScopes;
}

- (void)setTokenScopes:(id)a3
{
  objc_storeStrong((id *)&self->_tokenScopes, a3);
}

- (NSArray)filterQueries
{
  return self->_filterQueries;
}

- (void)setFilterQueries:(id)a3
{
  objc_storeStrong((id *)&self->_filterQueries, a3);
}

- (void)setFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_features, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenScopes, 0);
  objc_storeStrong((id *)&self->_itemSummary, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_displayText, 0);
  objc_storeStrong((id *)&self->_localCompletionAttributesStrings, 0);
  objc_storeStrong((id *)&self->_localCompletionAttributes, 0);
  objc_storeStrong((id *)&self->_nlpCompletionAttributes, 0);
  objc_storeStrong((id *)&self->_nlpCompletionType, 0);
  objc_storeStrong((id *)&self->_personItem, 0);
  objc_storeStrong((id *)&self->_personIdentifier, 0);
  objc_storeStrong((id *)&self->_filterQueries, 0);
  objc_storeStrong((id *)&self->_suggestionDisplayText, 0);
  objc_storeStrong((id *)&self->_spotlightQueryString, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->_scopes, 0);
  objc_storeStrong((id *)&self->_score, 0);
}

+ (id)suggestionTokenWithUserString:(id)a3 displayText:(id)a4 queryString:(id)a5
{
  id v7;
  id v8;
  id v9;
  _CSSuggestionToken *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[_CSSuggestionToken initWithUserString:displayString:queryString:]([_CSSuggestionToken alloc], "initWithUserString:displayString:queryString:", v9, v8, v7);

  return v10;
}

- (void)addTokenScope:(id)a3 tokenText:(id)a4 queryString:(id)a5
{
  NSArray *scopes;
  id v9;
  id v10;
  id v11;
  NSArray *v12;
  void *v13;
  NSArray *v14;
  _QWORD v15[4];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  if (self->_internalType == 12)
  {
    scopes = self->_scopes;
    v9 = a5;
    v10 = a4;
    v11 = a3;
    v12 = (NSArray *)-[NSArray mutableCopy](scopes, "mutableCopy");
    v15[0] = CFSTR("TOKEN");
    v15[1] = CFSTR("TEXT");
    v16[0] = v11;
    v16[1] = v10;
    v15[2] = CFSTR("QUERY");
    v15[3] = CFSTR("TYPE");
    v16[2] = v9;
    v16[3] = &unk_1E24300F0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v12, "addObject:", v13);

    v14 = self->_scopes;
    self->_scopes = v12;

    -[_CSSuggestionToken setSelectedScope:](self, "setSelectedScope:", 0);
  }
}

@end
