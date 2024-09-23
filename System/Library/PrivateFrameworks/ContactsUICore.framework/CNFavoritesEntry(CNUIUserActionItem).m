@implementation CNFavoritesEntry(CNUIUserActionItem)

+ (id)favoritesEntryForUserActionItem:()CNUIUserActionItem
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  objc_msgSend(v3, "contactProperty");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0C97300]);
  objc_msgSend(v4, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "type");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v5, "initWithContact:propertyKey:labeledValueIdentifier:actionType:bundleIdentifier:store:", v6, v7, v8, v9, v10, 0);
  return v11;
}

@end
