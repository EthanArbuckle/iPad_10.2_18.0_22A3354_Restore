@implementation SFAccountCellData

+ (id)accountCellDataWithSavedAccount:(id)a3 warning:(id)a4 searchPattern:(id)a5 savedAccountIsOnlySavedAccountForHighLevelDomain:(BOOL)a6 shouldShowReusedPasswordWarning:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  void *v15;

  v7 = a7;
  v8 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSavedAccount:warning:searchPattern:savedAccountIsOnlySavedAccountForHighLevelDomain:shouldShowReusedPasswordWarning:", v14, v13, v12, v8, v7);

  return v15;
}

+ (id)accountCellDataWithSavedAccount:(id)a3 warning:(id)a4 searchPattern:(id)a5 savedAccountIsOnlySavedAccountForHighLevelDomain:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;

  v6 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSavedAccount:warning:searchPattern:savedAccountIsOnlySavedAccountForHighLevelDomain:shouldShowReusedPasswordWarning:", v12, v11, v10, v6, 0);

  return v13;
}

- (SFAccountCellData)initWithSavedAccount:(id)a3 warning:(id)a4 searchPattern:(id)a5 savedAccountIsOnlySavedAccountForHighLevelDomain:(BOOL)a6 shouldShowReusedPasswordWarning:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  SFAccountCellData *v16;
  SFAccountCellData *v17;
  uint64_t v18;
  NSString *searchPattern;
  SFAccountCellData *v20;
  objc_super v22;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v22.receiver = self;
  v22.super_class = (Class)SFAccountCellData;
  v16 = -[SFAccountCellData init](&v22, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_savedAccount, a3);
    objc_storeStrong((id *)&v17->_warning, a4);
    v18 = objc_msgSend(v15, "copy");
    searchPattern = v17->_searchPattern;
    v17->_searchPattern = (NSString *)v18;

    v17->_savedAccountIsOnlySavedAccountForHighLevelDomain = a6;
    v17->_savedAccountHash = objc_msgSend(v13, "hash");
    v17->_warningHash = objc_msgSend(v14, "hash");
    v17->_shouldShowReusedPasswordWarning = a7;
    v20 = v17;
  }

  return v17;
}

- (NSString)effectiveTitle
{
  return (NSString *)-[WBSSavedAccount effectiveTitle](self->_savedAccount, "effectiveTitle");
}

- (NSString)effectiveTitleForSorting
{
  return (NSString *)-[WBSSavedAccount effectiveTitleForSorting](self->_savedAccount, "effectiveTitleForSorting");
}

- (NSString)highLevelDomain
{
  return (NSString *)-[WBSSavedAccount highLevelDomain](self->_savedAccount, "highLevelDomain");
}

- (BOOL)isEqual:(id)a3
{
  SFAccountCellData *v4;
  SFAccountCellData *v5;
  SFAccountCellData *v6;
  char v7;

  v4 = (SFAccountCellData *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = v5;
      if (self->_savedAccountHash == v5->_savedAccountHash
        && self->_shouldShowReusedPasswordWarning == v5->_shouldShowReusedPasswordWarning
        && self->_warningHash == v5->_warningHash
        && WBSIsEqual()
        && WBSIsEqual())
      {
        v7 = WBSIsEqual();
      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v2;

  v2 = self->_warningHash ^ self->_savedAccountHash;
  return v2 ^ -[NSString hash](self->_searchPattern, "hash") ^ self->_shouldShowReusedPasswordWarning;
}

- (WBSSavedAccount)savedAccount
{
  return self->_savedAccount;
}

- (WBSPasswordWarning)warning
{
  return self->_warning;
}

- (NSString)searchPattern
{
  return self->_searchPattern;
}

- (BOOL)savedAccountIsOnlySavedAccountForHighLevelDomain
{
  return self->_savedAccountIsOnlySavedAccountForHighLevelDomain;
}

- (BOOL)shouldShowReusedPasswordWarning
{
  return self->_shouldShowReusedPasswordWarning;
}

- (void)setShouldShowReusedPasswordWarning:(BOOL)a3
{
  self->_shouldShowReusedPasswordWarning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchPattern, 0);
  objc_storeStrong((id *)&self->_warning, 0);
  objc_storeStrong((id *)&self->_savedAccount, 0);
}

@end
