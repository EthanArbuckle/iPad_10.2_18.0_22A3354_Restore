@implementation NSDiffableDataSourceSnapshot

BOOL __67__NSDiffableDataSourceSnapshot_MailUI__mui_validSectionIdentifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "numberOfItemsInSection:", a2) > 0;
}

void __43__NSDiffableDataSourceSnapshot_MailUI__log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_15;
  log_log_15 = (uint64_t)v1;

}

uint64_t __89__NSDiffableDataSourceSnapshot_MailUI__mui_validItemIDsFromExistingItemIDs_updateReason___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "mui_validItemIDFromExistingItemID:updateReason:", a2, *(_QWORD *)(a1 + 40));
}

uint64_t __97__NSDiffableDataSourceSnapshot_MailUI__mui_validItemIDsFromExistingItemIDs_section_updateReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3);
  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3398], "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v8 = 138543618;
      v9 = v6;
      v10 = 2114;
      v11 = v3;
      _os_log_impl(&dword_1D5522000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ : Failed to find existing itemID in snapshot: %{public}@", (uint8_t *)&v8, 0x16u);
    }

  }
  return v4;
}

id __71__NSDiffableDataSourceSnapshot_MailUI__mui_validItemIDsFromIndexPaths___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = a2;
  v4 = objc_msgSend(v3, "section");
  if (v4 >= objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", objc_msgSend(v3, "section"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "itemIdentifiersInSectionWithIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v3, "item");
    if (v7 >= objc_msgSend(v6, "count"))
    {
      v8 = 0;
    }
    else
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v3, "item"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v8;
}

@end
