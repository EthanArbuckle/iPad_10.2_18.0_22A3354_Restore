@implementation CALNUNNotificationCategoryMapper

+ (id)unNotificationCategoriesFromCALNNotificationCategories:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void *v13;
  id v14;
  id v15;

  v4 = (void *)MEMORY[0x24BDBCEF0];
  v5 = a3;
  objc_msgSend(v4, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __91__CALNUNNotificationCategoryMapper_unNotificationCategoriesFromCALNNotificationCategories___block_invoke;
  v13 = &unk_24D484EA8;
  v14 = v6;
  v15 = a1;
  v7 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v10);

  v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13);
  return v8;
}

void __91__CALNUNNotificationCategoryMapper_unNotificationCategoriesFromCALNNotificationCategories___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 40), "_unNotificationCategoryFromCALNNotificationCategory:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

+ (id)calnNotificationCategoriesFromUNNotificationCategories:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void *v13;
  id v14;
  id v15;

  v4 = (void *)MEMORY[0x24BDBCEF0];
  v5 = a3;
  objc_msgSend(v4, "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __91__CALNUNNotificationCategoryMapper_calnNotificationCategoriesFromUNNotificationCategories___block_invoke;
  v13 = &unk_24D484ED0;
  v14 = v6;
  v15 = a1;
  v7 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v10);

  v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13);
  return v8;
}

void __91__CALNUNNotificationCategoryMapper_calnNotificationCategoriesFromUNNotificationCategories___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 40), "_calnNotificationCategoryFromUNNotificationCategory:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

+ (id)_unNotificationCategoryFromCALNNotificationCategory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNUNNotificationActionMapper unNotificationActionsFromCALNNotificationActions:](CALNUNNotificationActionMapper, "unNotificationActionsFromCALNNotificationActions:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(a1, "_unNotificationCategoryOptionsFromCALNNotificationCategoryOptions:", objc_msgSend(v4, "options"));
  v8 = (void *)MEMORY[0x24BDF8838];
  objc_msgSend(v4, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hiddenPreviewsBodyPlaceholder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "categorySummaryFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "categoryWithIdentifier:actions:intentIdentifiers:hiddenPreviewsBodyPlaceholder:categorySummaryFormat:options:", v9, v6, MEMORY[0x24BDBD1A8], v10, v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_calnNotificationCategoryFromUNNotificationCategory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CALNUNNotificationActionMapper calnNotificationActionsFromUNNotificationActions:](CALNUNNotificationActionMapper, "calnNotificationActionsFromUNNotificationActions:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(a1, "_calnNotificationCategoryOptionsFromUNNotificationCategoryOptions:", objc_msgSend(v4, "options"));
  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hiddenPreviewsBodyPlaceholder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "categorySummaryFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[CALNNotificationCategory categoryWithIdentifier:actions:hiddenPreviewsBodyPlaceholder:options:categorySummaryFormat:](CALNNotificationCategory, "categoryWithIdentifier:actions:hiddenPreviewsBodyPlaceholder:options:categorySummaryFormat:", v8, v6, v9, v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (unint64_t)_unNotificationCategoryOptionsFromCALNNotificationCategoryOptions:(unint64_t)a3
{
  uint64_t v3;

  v3 = 8388609;
  if ((a3 & 4) == 0)
    v3 = 1;
  return a3 & 2 | (((a3 >> 3) & 1) << 17) | v3;
}

+ (unint64_t)_calnNotificationCategoryOptionsFromUNNotificationCategoryOptions:(unint64_t)a3
{
  return (a3 >> 21) & 4 | a3 & 2 | (a3 >> 14) & 8;
}

@end
