@implementation ICSearchSuggestion

- (ICSearchSuggestion)initWithType:(unint64_t)a3
{
  ICSearchSuggestion *v4;
  ICSearchSuggestion *v5;
  NSString *suggestionItemTitle;
  ICSearchToken *v7;
  ICSearchToken *token;
  void *subQueryString;
  uint64_t v10;
  NSString *v11;
  ICSearchToken *v12;
  void *v13;
  ICSearchToken *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSString *v19;
  ICSearchToken *v20;
  uint64_t v21;
  NSString *v22;
  ICSearchToken *v23;
  uint64_t v24;
  NSString *v25;
  ICSearchToken *v26;
  uint64_t v27;
  NSString *v28;
  ICSearchToken *v29;
  uint64_t v30;
  NSString *v31;
  ICSearchToken *v32;
  uint64_t v33;
  NSString *v34;
  ICSearchToken *v35;
  uint64_t v36;
  ICSearchToken *v37;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)ICSearchSuggestion;
  v4 = -[ICSearchSuggestion init](&v39, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    switch(a3)
    {
      case 0uLL:
        suggestionItemTitle = v4->_suggestionItemTitle;
        v4->_suggestionItemTitle = (NSString *)CFSTR(" ");

        v7 = -[ICSearchToken initWithTitle:subQueryString:suggestionType:]([ICSearchToken alloc], "initWithTitle:subQueryString:suggestionType:", CFSTR(" "), &stru_1E76DB108, 0);
        token = v5->_token;
        v5->_token = v7;

        subQueryString = v5->_subQueryString;
        v5->_subQueryString = (NSString *)CFSTR(" ");
        goto LABEL_12;
      case 1uLL:
        objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Shared Notes"), CFSTR("Shared Notes"), 0, 1);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = v5->_suggestionItemTitle;
        v5->_suggestionItemTitle = (NSString *)v10;

        v12 = [ICSearchToken alloc];
        objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Shared"), CFSTR("Shared"), 0, 1);
        subQueryString = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ = 1"), CFSTR("_ICItemIsShared"));
        v14 = v12;
        v15 = subQueryString;
        v16 = v13;
        v17 = 1;
        goto LABEL_11;
      case 2uLL:
        objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Locked Notes"), CFSTR("Locked Notes"), 0, 1);
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = v5->_suggestionItemTitle;
        v5->_suggestionItemTitle = (NSString *)v18;

        v20 = [ICSearchToken alloc];
        objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Locked"), CFSTR("Locked"), 0, 1);
        subQueryString = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ = 1"), CFSTR("_ICItemIsLocked"));
        v14 = v20;
        v15 = subQueryString;
        v16 = v13;
        v17 = 2;
        goto LABEL_11;
      case 3uLL:
        objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Notes with Checklists"), CFSTR("Notes with Checklists"), 0, 1);
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = v5->_suggestionItemTitle;
        v5->_suggestionItemTitle = (NSString *)v21;

        v23 = [ICSearchToken alloc];
        objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Checklists"), CFSTR("Checklists"), 0, 1);
        subQueryString = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ = 1"), CFSTR("_ICItemHasChecklists"));
        v14 = v23;
        v15 = subQueryString;
        v16 = v13;
        v17 = 3;
        goto LABEL_11;
      case 4uLL:
        objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Notes with Tags"), CFSTR("Notes with Tags"), 0, 1);
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = v5->_suggestionItemTitle;
        v5->_suggestionItemTitle = (NSString *)v24;

        v26 = [ICSearchToken alloc];
        objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Tags"), CFSTR("Tags"), 0, 1);
        subQueryString = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ = 1"), CFSTR("_ICItemHasICItemHasTags"));
        v14 = v26;
        v15 = subQueryString;
        v16 = v13;
        v17 = 4;
        goto LABEL_11;
      case 5uLL:
        objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Notes with Drawings"), CFSTR("Notes with Drawings"), 0, 1);
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = v5->_suggestionItemTitle;
        v5->_suggestionItemTitle = (NSString *)v27;

        v29 = [ICSearchToken alloc];
        objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Drawings"), CFSTR("Drawings"), 0, 1);
        subQueryString = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ = 1"), CFSTR("_ICItemHasDrawings"));
        v14 = v29;
        v15 = subQueryString;
        v16 = v13;
        v17 = 5;
        goto LABEL_11;
      case 6uLL:
        objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Notes with Scanned Documents"), CFSTR("Notes with Scanned Documents"), 0, 1);
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = v5->_suggestionItemTitle;
        v5->_suggestionItemTitle = (NSString *)v30;

        v32 = [ICSearchToken alloc];
        objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Scanned Documents"), CFSTR("Scanned Documents"), 0, 1);
        subQueryString = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ = 1"), CFSTR("_ICItemHasScannedDocuments"));
        v14 = v32;
        v15 = subQueryString;
        v16 = v13;
        v17 = 6;
        goto LABEL_11;
      case 7uLL:
        objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Notes with Attachments"), CFSTR("Notes with Attachments"), 0, 1);
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = v5->_suggestionItemTitle;
        v5->_suggestionItemTitle = (NSString *)v33;

        v35 = [ICSearchToken alloc];
        objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Attachments"), CFSTR("Attachments"), 0, 1);
        subQueryString = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ = 1"), CFSTR("_ICItemHasAttachments"));
        v14 = v35;
        v15 = subQueryString;
        v16 = v13;
        v17 = 7;
LABEL_11:
        v36 = -[ICSearchToken initWithTitle:subQueryString:suggestionType:](v14, "initWithTitle:subQueryString:suggestionType:", v15, v16, v17);
        v37 = v5->_token;
        v5->_token = (ICSearchToken *)v36;

LABEL_12:
        break;
      default:
        return v5;
    }
  }
  return v5;
}

- (ICSearchSuggestion)initWithSuggestion:(id)a3
{
  id v5;
  ICSearchSuggestion *v6;
  ICSearchSuggestion *v7;
  void *v8;
  uint64_t v9;
  NSString *suggestionItemTitle;
  ICSearchToken *v11;
  void *v12;
  uint64_t v13;
  ICSearchToken *token;
  uint64_t v15;
  NSString *subQueryString;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ICSearchSuggestion;
  v6 = -[ICSearchSuggestion init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_csSuggestion, a3);
    objc_msgSend(v5, "localizedAttributedSuggestion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "string");
    v9 = objc_claimAutoreleasedReturnValue();
    suggestionItemTitle = v7->_suggestionItemTitle;
    v7->_suggestionItemTitle = (NSString *)v9;

    v11 = [ICSearchToken alloc];
    objc_msgSend(v5, "currentToken");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[ICSearchToken initWithCSSuggestionToken:](v11, "initWithCSSuggestionToken:", v12);
    token = v7->_token;
    v7->_token = (ICSearchToken *)v13;

    objc_msgSend(v5, "userQueryString");
    v15 = objc_claimAutoreleasedReturnValue();
    subQueryString = v7->_subQueryString;
    v7->_subQueryString = (NSString *)v15;

  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v10;
  void *v11;

  v4 = a3;
  if (v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (v5 = -[ICSearchSuggestion type](self, "type"), v5 == objc_msgSend(v4, "type")))
  {
    -[ICSearchSuggestion csSuggestion](self, "csSuggestion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "csSuggestion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {
      -[ICSearchSuggestion suggestionItemTitle](self, "suggestionItemTitle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "suggestionItemTitle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v10, "isEqualToString:", v11);

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ICSearchSuggestion;
  -[ICSearchSuggestion description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSearchSuggestion token](self, "token");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)iconImageName
{
  void *v2;
  void *v3;

  -[ICSearchSuggestion token](self, "token");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconImageName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (UIImage)iconImage
{
  void *v3;
  ICSearchToken *v4;
  void *v5;
  void *v6;
  ICSearchToken *v7;
  void *v8;

  -[ICSearchSuggestion csSuggestion](self, "csSuggestion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = [ICSearchToken alloc];
    -[ICSearchSuggestion csSuggestion](self, "csSuggestion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[ICSearchToken initWithCSSuggestionToken:](v4, "initWithCSSuggestionToken:", v6);

  }
  else
  {
    -[ICSearchSuggestion token](self, "token");
    v7 = (ICSearchToken *)objc_claimAutoreleasedReturnValue();
  }
  +[ICSearchSuggestion iconImageForToken:](ICSearchSuggestion, "iconImageForToken:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v8;
}

+ (id)iconImageForToken:(id)a3
{
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;

  objc_msgSend(a3, "iconImageName");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = CFSTR("magnifyingglass");
  if (v3)
    v5 = (__CFString *)v3;
  v6 = v5;

  objc_msgSend(MEMORY[0x1E0DC3870], "ic_systemImageNamed:textStyle:", v6, *MEMORY[0x1E0DC4B60]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  ICSearchSuggestion *v8;

  -[ICSearchSuggestion csSuggestion](self, "csSuggestion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return -[ICSearchSuggestion initWithType:](+[ICSearchSuggestion allocWithZone:](ICSearchSuggestion, "allocWithZone:", a3), "initWithType:", -[ICSearchSuggestion type](self, "type"));
  -[ICSearchSuggestion csSuggestion](self, "csSuggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);

  v8 = -[ICSearchSuggestion initWithSuggestion:](+[ICSearchSuggestion allocWithZone:](ICSearchSuggestion, "allocWithZone:", a3), "initWithSuggestion:", v7);
  return v8;
}

- (_UISearchSuggestionItem_dci)dciSuggestion
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0DC4318]);
  -[ICSearchSuggestion suggestionItemTitle](self, "suggestionItemTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSearchSuggestion suggestionItemTitle](self, "suggestionItemTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSearchSuggestion iconImage](self, "iconImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithLocalizedSuggestion:localizedDescription:iconImage:", v4, v5, v6);

  objc_msgSend(v7, "setRepresentedObject:", self);
  return (_UISearchSuggestionItem_dci *)v7;
}

+ (NSArray)orderedDefaultSearchSuggestions
{
  if (orderedDefaultSearchSuggestions_onceToken != -1)
    dispatch_once(&orderedDefaultSearchSuggestions_onceToken, &__block_literal_global_9);
  return (NSArray *)(id)orderedDefaultSearchSuggestions_orderedDefaultSearchSuggestions;
}

void __53__ICSearchSuggestion_orderedDefaultSearchSuggestions__block_invoke()
{
  ICSearchSuggestion *v0;
  ICSearchSuggestion *v1;
  ICSearchSuggestion *v2;
  ICSearchSuggestion *v3;
  ICSearchSuggestion *v4;
  ICSearchSuggestion *v5;
  ICSearchSuggestion *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[8];

  v9[7] = *MEMORY[0x1E0C80C00];
  v0 = -[ICSearchSuggestion initWithType:]([ICSearchSuggestion alloc], "initWithType:", 1);
  v1 = -[ICSearchSuggestion initWithType:]([ICSearchSuggestion alloc], "initWithType:", 2, v0);
  v9[1] = v1;
  v2 = -[ICSearchSuggestion initWithType:]([ICSearchSuggestion alloc], "initWithType:", 3);
  v9[2] = v2;
  v3 = -[ICSearchSuggestion initWithType:]([ICSearchSuggestion alloc], "initWithType:", 4);
  v9[3] = v3;
  v4 = -[ICSearchSuggestion initWithType:]([ICSearchSuggestion alloc], "initWithType:", 5);
  v9[4] = v4;
  v5 = -[ICSearchSuggestion initWithType:]([ICSearchSuggestion alloc], "initWithType:", 6);
  v9[5] = v5;
  v6 = -[ICSearchSuggestion initWithType:]([ICSearchSuggestion alloc], "initWithType:", 7);
  v9[6] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 7);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)orderedDefaultSearchSuggestions_orderedDefaultSearchSuggestions;
  orderedDefaultSearchSuggestions_orderedDefaultSearchSuggestions = v7;

}

- (CSSuggestion)csSuggestion
{
  return self->_csSuggestion;
}

- (void)setCsSuggestion:(id)a3
{
  objc_storeStrong((id *)&self->_csSuggestion, a3);
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)suggestionItemTitle
{
  return self->_suggestionItemTitle;
}

- (ICSearchToken)token
{
  return self->_token;
}

- (NSString)subQueryString
{
  return self->_subQueryString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subQueryString, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_suggestionItemTitle, 0);
  objc_storeStrong((id *)&self->_csSuggestion, 0);
}

@end
