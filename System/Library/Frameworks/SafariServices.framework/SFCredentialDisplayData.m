@implementation SFCredentialDisplayData

+ (id)descriptionForPasswordWithUser:(id)a3 creationDate:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    v7 = v5;
  }
  else
  {
    if (v6)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0CB3578]);
      objc_msgSend(v9, "setTimeStyle:", 0);
      objc_msgSend(v9, "setDateStyle:", 1);
      objc_msgSend(v9, "setDoesRelativeDateFormatting:", 1);
      objc_msgSend(v9, "setFormattingContext:", 1);
      v10 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringFromDate:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", v11, v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
    _WBSLocalizedString();
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
LABEL_6:

  return v8;
}

- (SFCredentialDisplayData)initWithMatch:(id)a3 detail:(id)a4 creationDate:(id)a5
{
  id v9;
  id v10;
  id v11;
  SFCredentialDisplayData *v12;
  SFCredentialDisplayData *v13;
  uint64_t v14;
  NSString *detail;
  SFCredentialDisplayData *v16;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SFCredentialDisplayData;
  v12 = -[SFCredentialDisplayData init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_match, a3);
    v14 = objc_msgSend(v10, "copy");
    detail = v13->_detail;
    v13->_detail = (NSString *)v14;

    objc_storeStrong((id *)&v13->_creationDate, a5);
    v16 = v13;
  }

  return v13;
}

- (WBSSavedAccountMatch)match
{
  return self->_match;
}

- (NSString)detail
{
  return self->_detail;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_match, 0);
}

@end
