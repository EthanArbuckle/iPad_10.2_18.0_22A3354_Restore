@implementation FCTagFilterUtilities

+ (BOOL)filterTag:(id)a3 options:(int64_t)a4
{
  return objc_msgSend(a1, "filterTag:options:context:", a3, a4, 0);
}

+ (BOOL)filterTag:(id)a3 options:(int64_t)a4 context:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  +[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentStoreFrontID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((a4 & 4) != 0 && !v10 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "(filterOptions & FCTagFilterBlockedStorefronts) == 0 || contentStoreFrontID != nil");
    *(_DWORD *)buf = 136315906;
    v29 = "+[FCTagFilterUtilities filterTag:options:context:]";
    v30 = 2080;
    v31 = "FCTagFilterUtilities.m";
    v32 = 1024;
    v33 = 28;
    v34 = 2114;
    v35 = v12;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if ((a4 & 2) == 0)
    {
LABEL_5:
      v11 = 0;
      if ((a4 & 8) == 0)
        goto LABEL_11;
      goto LABEL_9;
    }
  }
  else if ((a4 & 2) == 0)
  {
    goto LABEL_5;
  }
  v11 = objc_msgSend(v7, "isDeprecated");
  if ((a4 & 8) == 0)
    goto LABEL_11;
LABEL_9:
  +[FCRestrictions sharedInstance](FCRestrictions, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isExplicitContentAllowed");

  if (((v11 | v14) & 1) == 0)
    v11 = objc_msgSend(v7, "isExplicitContent");
LABEL_11:
  if ((a4 & 4) == 0)
    goto LABEL_24;
  objc_msgSend(v7, "blockedStorefrontIDs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
  {

  }
  else
  {
    objc_msgSend(v7, "allowedStorefrontIDs");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (!v17)
      goto LABEL_24;
  }
  if ((v11 & 1) != 0)
  {
    LOBYTE(v18) = 1;
    goto LABEL_30;
  }
  objc_msgSend(v7, "blockedStorefrontIDs");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v19, "containsObject:", v10) & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    objc_msgSend(v7, "allowedStorefrontIDs");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "count"))
    {
      objc_msgSend(v7, "allowedStorefrontIDs");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v21, "containsObject:", v10) ^ 1;

    }
    else
    {
      v11 = 0;
    }

  }
LABEL_24:
  v22 = ((unint64_t)a4 >> 4) & 1 | v11;
  if ((a4 & 0x10) != 0 && (v11 & 1) == 0)
  {
    +[FCRestrictions sharedInstance](FCRestrictions, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v23, "isNewsVersionAllowed:", objc_msgSend(v7, "minimumNewsVersion")) ^ 1;

  }
  v18 = ((unint64_t)a4 >> 5) & 1 | v22;
  if ((a4 & 0x20) != 0 && (v22 & 1) == 0)
  {
    objc_msgSend(v8, "subscriptionList");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "mutedTagIDs");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v18) = objc_msgSend(v25, "containsObject:", v26);

  }
LABEL_30:

  return v18;
}

+ (id)filterTags:(id)a3 options:(int64_t)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  int64_t v15;

  v8 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__FCTagFilterUtilities_filterTags_options_context___block_invoke;
  v12[3] = &unk_1E4648258;
  v14 = a1;
  v15 = a4;
  v13 = v8;
  v9 = v8;
  objc_msgSend(a3, "fc_arrayOfObjectsFailingTest:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __51__FCTagFilterUtilities_filterTags_options_context___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "filterTag:options:context:", a2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

@end
