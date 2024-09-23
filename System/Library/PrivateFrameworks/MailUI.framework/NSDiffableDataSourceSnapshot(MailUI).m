@implementation NSDiffableDataSourceSnapshot(MailUI)

- (id)mui_validSectionIdentifiers
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  objc_msgSend(a1, "sectionIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__NSDiffableDataSourceSnapshot_MailUI__mui_validSectionIdentifiers__block_invoke;
  v5[3] = &unk_1E99E3830;
  v5[4] = a1;
  objc_msgSend(v2, "ef_filter:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__NSDiffableDataSourceSnapshot_MailUI__log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_15 != -1)
    dispatch_once(&log_onceToken_15, block);
  return (id)log_log_15;
}

- (id)mui_validItemIDFromExistingItemID:()MailUI updateReason:
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(a1, "indexOfItemIdentifier:", v6) == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0DC3398], "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543618;
      v12 = v7;
      v13 = 2114;
      v14 = v6;
      _os_log_impl(&dword_1D5522000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ : Failed to find existing itemID in snapshot: %{public}@", (uint8_t *)&v11, 0x16u);
    }

    v9 = 0;
  }
  else
  {
    v9 = v6;
  }

  return v9;
}

- (id)mui_validItemIDsFromExistingItemIDs:()MailUI updateReason:
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __89__NSDiffableDataSourceSnapshot_MailUI__mui_validItemIDsFromExistingItemIDs_updateReason___block_invoke;
  v10[3] = &unk_1E99E37B8;
  v10[4] = a1;
  v11 = v6;
  v7 = v6;
  objc_msgSend(a3, "ef_compactMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)mui_validItemIDsFromExistingItemIDs:()MailUI section:updateReason:
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;

  v8 = a5;
  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = a3;
  objc_msgSend(a1, "itemIdentifiersInSectionWithIdentifier:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __97__NSDiffableDataSourceSnapshot_MailUI__mui_validItemIDsFromExistingItemIDs_section_updateReason___block_invoke;
  v17[3] = &unk_1E99E37E0;
  v18 = v12;
  v19 = v8;
  v13 = v8;
  v14 = v12;
  objc_msgSend(v10, "ef_filter:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)mui_validItemIDsFromIndexPaths:()MailUI
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  void *v11;

  v4 = a3;
  objc_msgSend(a1, "sectionIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__NSDiffableDataSourceSnapshot_MailUI__mui_validItemIDsFromIndexPaths___block_invoke;
  v9[3] = &unk_1E99E3808;
  v10 = v5;
  v11 = a1;
  v6 = v5;
  objc_msgSend(v4, "ef_compactMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
