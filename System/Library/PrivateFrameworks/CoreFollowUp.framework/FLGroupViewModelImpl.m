@implementation FLGroupViewModelImpl

- (FLGroupViewModelImpl)initWithIdentifier:(id)a3
{
  id v5;
  FLGroupViewModelImpl *v6;
  FLGroupViewModelImpl *v7;

  v5 = a3;
  v6 = -[FLGroupViewModelImpl init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_identifier, a3);

  return v7;
}

- (void)setRowTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setNeedsAccountID:(BOOL)a3
{
  self->_needsAccountID = a3;
}

- (void)setAccountID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)items
{
  return (id)-[NSMutableArray copy](self->_mutableItems, "copy");
}

- (void)setGroupTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)groupTitle
{
  return self->_groupTitle;
}

- (void)addItem:(id)a3
{
  id v4;
  NSMutableArray *mutableItems;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  mutableItems = self->_mutableItems;
  v8 = v4;
  if (!mutableItems)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_mutableItems;
    self->_mutableItems = v6;

    v4 = v8;
    mutableItems = self->_mutableItems;
  }
  -[NSMutableArray addObject:](mutableItems, "addObject:", v4);

}

- (id)footerText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (!-[NSString isEqualToString:](self->_identifier, "isEqualToString:", CFSTR("com.apple.followup.group.ndo")))
  {
    if (-[NSString isEqualToString:](self->_identifier, "isEqualToString:", CFSTR("com.apple.followup.group.services")))
    {
      v8 = 0;
      return v8;
    }
LABEL_7:
    -[FLGroupViewModelImpl _expirationOrInformativeText](self, "_expirationOrInformativeText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    return v8;
  }
  if (!-[FLGroupViewModelImpl shouldCoalesceItems](self, "shouldCoalesceItems"))
    goto LABEL_7;
  -[NSMutableArray firstObject](self->_mutableItems, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FLUserInfoPropertyCoalescedGroupFooterText"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_7;
  -[NSMutableArray firstObject](self->_mutableItems, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("FLUserInfoPropertyCoalescedGroupFooterText"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)subtitleText
{
  void *v3;

  if (-[NSString isEqualToString:](self->_identifier, "isEqualToString:", CFSTR("com.apple.followup.group.services")))
  {
    -[FLGroupViewModelImpl _expirationOrInformativeText](self, "_expirationOrInformativeText");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_expirationOrInformativeText
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v4 = self->_mutableItems;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v10, "informativeFooterText");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v10, "informativeFooterText");
          v12 = objc_claimAutoreleasedReturnValue();

          v7 = (void *)v12;
        }
        if (objc_msgSend(v10, "displayExpirationDate"))
        {
          objc_msgSend(v3, "addObject:", v10);
          objc_msgSend(v10, "formattedExpirationDate");
          v13 = objc_claimAutoreleasedReturnValue();

          v7 = (void *)v13;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    objc_msgSend(v3, "sortUsingComparator:", &__block_literal_global_12);
    objc_msgSend(v3, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[FLFollowUpItem _expirationDateFormatter](FLFollowUpItem, "_expirationDateFormatter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_midnightAdjustedDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringFromDate:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x1E0CB3940];
    FLLoc(CFSTR("EARLIEST_ITEM_EXPIRATION_FORMAT"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringWithFormat:", v19, v17);
    v20 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v20;
  }

  return v7;
}

uint64_t __52__FLGroupViewModelImpl__expirationOrInformativeText__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "expirationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expirationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - \x10%@ - %@ - %@"), self->_rowTitle, self->_groupTitle, self->_identifier, self->_mutableItems);
}

- (BOOL)restrictionEnabled
{
  void *v2;
  BOOL v3;

  if (!-[NSString isEqualToString:](self->_identifier, "isEqualToString:", CFSTR("com.apple.followup.group.account")))
    return 0;
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46ED8]) == 2;

  return v3;
}

- (BOOL)shouldCoalesceItems
{
  void *v3;
  BOOL v4;
  BOOL v5;

  if (-[NSString isEqualToString:](self->_identifier, "isEqualToString:", CFSTR("com.apple.followup.group.account"))
    || -[NSString isEqualToString:](self->_identifier, "isEqualToString:", CFSTR("com.apple.followup.group.services"))
    || -[NSString isEqualToString:](self->_identifier, "isEqualToString:", CFSTR("com.apple.followup.group.ndo")))
  {
    -[FLGroupViewModelImpl items](self, "items");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (unint64_t)objc_msgSend(v3, "count") > 1;
  }
  else
  {
    if (!-[NSString isEqualToString:](self->_identifier, "isEqualToString:", CFSTR("com.apple.followup.group.device")))
    {
      -[NSString isEqualToString:](self->_identifier, "isEqualToString:", CFSTR("com.apple.followup.group.none"));
      return 0;
    }
    -[FLGroupViewModelImpl items](self, "items");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (unint64_t)objc_msgSend(v3, "count") > 2;
  }
  v5 = v4;

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)rowTitle
{
  return self->_rowTitle;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (BOOL)needsAccountID
{
  return self->_needsAccountID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_groupTitle, 0);
  objc_storeStrong((id *)&self->_rowTitle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_mutableItems, 0);
}

@end
