@implementation CNContactSuggestionViewControllerSGOriginDataSource

- (CNContactSuggestionViewControllerSGOriginDataSource)initWithSGOrigin:(id)a3
{
  id v5;
  CNContactSuggestionViewControllerSGOriginDataSource *v6;
  CNContactSuggestionViewControllerSGOriginDataSource *v7;
  CNContactSuggestionViewControllerSGOriginDataSource *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNContactSuggestionViewControllerSGOriginDataSource;
  v6 = -[CNContactSuggestionViewControllerSGOriginDataSource init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_origin, a3);
    v8 = v7;
  }

  return v7;
}

- (NSString)appName
{
  void *v2;
  void *v3;

  -[CNContactSuggestionViewControllerSGOriginDataSource origin](self, "origin");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedApplicationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSAttributedString)formattedSnippet
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;

  v3 = *MEMORY[0x1E0D13848];
  -[CNContactSuggestionViewControllerSGOriginDataSource origin](self, "origin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextSnippet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v5);

  if ((v3 & 1) == 0)
  {
    -[CNContactSuggestionViewControllerSGOriginDataSource origin](self, "origin");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "contextSnippetRange") == 0x7FFFFFFFFFFFFFFFLL)
    {

    }
    else
    {
      -[CNContactSuggestionViewControllerSGOriginDataSource origin](self, "origin");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "contextSnippetRange");
      v11 = v9 + v10;
      -[CNContactSuggestionViewControllerSGOriginDataSource origin](self, "origin");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "contextSnippet");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "length");

      if (v11 <= v14)
      {
        v20 = objc_alloc(MEMORY[0x1E0CB3778]);
        -[CNContactSuggestionViewControllerSGOriginDataSource origin](self, "origin");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "contextSnippet");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = (void *)objc_msgSend(v20, "initWithString:", v22);

        v23 = *MEMORY[0x1E0DC1140];
        +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "textColor");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactSuggestionViewControllerSGOriginDataSource origin](self, "origin");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "contextSnippetRange");
        objc_msgSend(v6, "addAttribute:value:range:", v23, v25, v27, v28);

        objc_msgSend(v6, "mutableString");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\n\n"), CFSTR("\n"), 0, 0, objc_msgSend(v6, "length"));
        goto LABEL_8;
      }
    }
    -[CNContactSuggestionViewControllerSGOriginDataSource origin](self, "origin");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "contextSnippet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactSuggestionViewControllerSGOriginDataSource origin](self, "origin");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "contextSnippet");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("\n\n"), CFSTR("\n"), 0, 0, objc_msgSend(v18, "length"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v19);
LABEL_8:

    return (NSAttributedString *)v6;
  }
  v6 = 0;
  return (NSAttributedString *)v6;
}

- (NSString)title
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = *MEMORY[0x1E0D13848];
  -[CNContactSuggestionViewControllerSGOriginDataSource origin](self, "origin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v5);

  if ((v3 & 1) != 0)
  {
    if (-[CNContactSuggestionViewControllerSGOriginDataSource type](self, "type") != 1)
    {
      v8 = 0;
      return (NSString *)v8;
    }
    CNContactsUIBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SUGGESTION_REVIEW_MAIL_DEFAULT_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CNContactSuggestionViewControllerSGOriginDataSource origin](self, "origin");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return (NSString *)v8;
}

- (unint64_t)type
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  objc_msgSend((id)objc_opt_class(), "contactSuggestionTypeBySuggestionType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[CNContactSuggestionViewControllerSGOriginDataSource origin](self, "origin");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = objc_msgSend(v7, "unsignedIntegerValue");
  else
    v8 = 0;

  return v8;
}

- (NSString)date
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;

  -[CNContactSuggestionViewControllerSGOriginDataSource origin](self, "origin");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend((id)objc_opt_class(), "dateFormatter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDoesRelativeDateFormatting:", 1);
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactSuggestionViewControllerSGOriginDataSource origin](self, "origin");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "isDateInToday:", v8);

    objc_msgSend(v5, "setDateStyle:", v9 ^ 1);
    objc_msgSend(v5, "setTimeStyle:", v9);
    -[CNContactSuggestionViewControllerSGOriginDataSource origin](self, "origin");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringFromDate:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  return (NSString *)v12;
}

- (NSString)with
{
  void *v3;
  void *v4;
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

  if (-[CNContactSuggestionViewControllerSGOriginDataSource type](self, "type") == 1
    || -[CNContactSuggestionViewControllerSGOriginDataSource type](self, "type") == 4)
  {
    -[CNContactSuggestionViewControllerSGOriginDataSource origin](self, "origin");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isSent") & 1) != 0)
    {
      -[CNContactSuggestionViewControllerSGOriginDataSource origin](self, "origin");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "toPeople");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        -[CNContactSuggestionViewControllerSGOriginDataSource origin](self, "origin");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "toPeople");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "firstObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNContactSuggestionViewControllerSGOriginDataSource contactNameFromPerson:](self, "contactNameFromPerson:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
        goto LABEL_10;
      }
    }
    else
    {

    }
    -[CNContactSuggestionViewControllerSGOriginDataSource origin](self, "origin");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fromPerson");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactSuggestionViewControllerSGOriginDataSource contactNameFromPerson:](self, "contactNameFromPerson:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v9 = 0;
LABEL_10:
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13850] + 16))() & 1) != 0)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    CNContactsUIBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SUGGESTION_FROM_APP_WITH_CONTACT"), &stru_1E20507A8, CFSTR("Localized"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactSuggestionViewControllerSGOriginDataSource appName](self, "appName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v12, v13, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CNContactSuggestionViewControllerSGOriginDataSource appName](self, "appName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v14;
}

- (id)contactNameFromPerson:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "displayName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D13848];
  if ((*(unsigned int (**)(_QWORD, id))(*MEMORY[0x1E0D13848] + 16))(*MEMORY[0x1E0D13848], v4))
  {

    objc_msgSend(v3, "handles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (((*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v7) & 1) != 0)
      v4 = 0;
    else
      v4 = v7;

  }
  return v4;
}

- (NSURL)url
{
  void *v2;
  void *v3;

  -[CNContactSuggestionViewControllerSGOriginDataSource origin](self, "origin");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (SGOrigin)origin
{
  return self->_origin;
}

- (void)setOrigin:(id)a3
{
  objc_storeStrong((id *)&self->_origin, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_origin, 0);
}

+ (id)contactSuggestionTypeBySuggestionType
{
  if (contactSuggestionTypeBySuggestionType_cn_once_token_1 != -1)
    dispatch_once(&contactSuggestionTypeBySuggestionType_cn_once_token_1, &__block_literal_global_36786);
  return (id)contactSuggestionTypeBySuggestionType_cn_once_object_1;
}

+ (id)dateFormatter
{
  if (dateFormatter_cn_once_token_2 != -1)
    dispatch_once(&dateFormatter_cn_once_token_2, &__block_literal_global_25_36784);
  return (id)dateFormatter_cn_once_object_2;
}

void __68__CNContactSuggestionViewControllerSGOriginDataSource_dateFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)dateFormatter_cn_once_object_2;
  dateFormatter_cn_once_object_2 = (uint64_t)v0;

}

void __92__CNContactSuggestionViewControllerSGOriginDataSource_contactSuggestionTypeBySuggestionType__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[8];
  _QWORD v3[9];

  v3[8] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E20D2F40;
  v2[1] = &unk_1E20D2F58;
  v3[0] = &unk_1E20D2F40;
  v3[1] = &unk_1E20D2F58;
  v2[2] = &unk_1E20D2F70;
  v2[3] = &unk_1E20D2F88;
  v3[2] = &unk_1E20D2F70;
  v3[3] = &unk_1E20D2F88;
  v2[4] = &unk_1E20D2FA0;
  v2[5] = &unk_1E20D2FB8;
  v3[4] = &unk_1E20D2FA0;
  v3[5] = &unk_1E20D2FB8;
  v2[6] = &unk_1E20D2FD0;
  v2[7] = &unk_1E20D2FE8;
  v3[6] = &unk_1E20D2FD0;
  v3[7] = &unk_1E20D2FE8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)contactSuggestionTypeBySuggestionType_cn_once_object_1;
  contactSuggestionTypeBySuggestionType_cn_once_object_1 = v0;

}

@end
