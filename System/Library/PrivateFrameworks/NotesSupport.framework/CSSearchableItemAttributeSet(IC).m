@implementation CSSearchableItemAttributeSet(IC)

+ (id)ic_customAttributeKeyDictionary
{
  if (ic_customAttributeKeyDictionary_onceTokenCustomAttributeKeys != -1)
    dispatch_once(&ic_customAttributeKeyDictionary_onceTokenCustomAttributeKeys, &__block_literal_global);
  return (id)ic_customAttributeKeyDictionary_sCustomAttributeKeyDictionary;
}

+ (id)ic_customAttributeKeyWithName:()IC searchable:searchableByDefault:unique:multiValued:
{
  id v12;
  id v13;
  void *v14;
  void *v15;

  v12 = a3;
  v13 = a1;
  objc_sync_enter(v13);
  objc_msgSend(v13, "ic_customAttributeKeyDictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", v12, a4, a5, a6, a7);
    objc_msgSend(v14, "setObject:forKey:", v15, v12);
  }

  objc_sync_exit(v13);
  return v15;
}

+ (uint64_t)ic_specializedIndexFieldAttributeKeyForStringField:()IC
{
  return objc_msgSend(a1, "ic_customAttributeKeyWithName:searchable:searchableByDefault:unique:multiValued:", a3, 1, 0, 0, 1);
}

- (void)ic_populateValuesForSpecializedFields
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CA6B50], "ic_specializedIndexFieldAttributeKeyForStringField:", CFSTR("_ICItemDisplayName"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(a1, "displayName");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setValue:forCustomKey:", v2, v3);

  }
}

+ (id)ic_dataSourceIdentifierCustomKey
{
  if (ic_dataSourceIdentifierCustomKey_onceToken != -1)
    dispatch_once(&ic_dataSourceIdentifierCustomKey_onceToken, &__block_literal_global_6);
  return (id)ic_dataSourceIdentifierCustomKey_sDataSourceIdentifierCustomKey;
}

- (void)setIc_dataSourceIdentifier:()IC
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "ic_dataSourceIdentifierCustomKey");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setValue:forCustomKey:", v4, v5);

}

- (id)ic_dataSourceIdentifier
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = objc_opt_class();
  objc_msgSend((id)objc_opt_class(), "ic_dataSourceIdentifierCustomKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "valueForCustomKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast(v2, (uint64_t)v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_opt_class();
    objc_msgSend(a1, "attributeForKey:", CFSTR("DataSourceIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast(v6, (uint64_t)v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (uint64_t)ic_searchResultTypeCustomKey
{
  return objc_msgSend(a1, "ic_customAttributeKeyWithName:searchable:searchableByDefault:unique:multiValued:", CFSTR("_ICItemSearchResultType"), 1, 0, 0, 0);
}

- (uint64_t)ic_searchResultType
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "attributeForKey:", CFSTR("_ICItemSearchResultType"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntegerValue");

  return v2;
}

- (void)setIc_searchResultType:()IC
{
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CA6B50], "ic_searchResultTypeCustomKey");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setValue:forCustomKey:", v5, v6);

  }
}

- (uint64_t)ic_relevance
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "queryResultRelevance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "integerValue");

  return v2;
}

+ (uint64_t)ic_itemIsLockedCustomKey
{
  return objc_msgSend(a1, "ic_customAttributeKeyWithName:searchable:searchableByDefault:unique:multiValued:", CFSTR("_ICItemIsLocked"), 1, 0, 0, 0);
}

- (uint64_t)ic_isLocked
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "attributeForKey:", CFSTR("_ICItemIsLocked"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)setIc_isLocked:()IC
{
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CA6B50], "ic_itemIsLockedCustomKey");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setValue:forCustomKey:", v5, v6);

  }
}

+ (uint64_t)ic_itemIsSharedCustomKey
{
  return objc_msgSend(a1, "ic_customAttributeKeyWithName:searchable:searchableByDefault:unique:multiValued:", CFSTR("_ICItemIsShared"), 1, 0, 0, 0);
}

- (uint64_t)ic_isShared
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "attributeForKey:", CFSTR("_ICItemIsShared"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)setIc_isShared:()IC
{
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CA6B50], "ic_itemIsSharedCustomKey");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setValue:forCustomKey:", v5, v6);

  }
}

+ (uint64_t)ic_relatedModernNoteUniqueIdentifierCustomKey
{
  return objc_msgSend(a1, "ic_customAttributeKeyWithName:searchable:searchableByDefault:unique:multiValued:", CFSTR("_ICItemRelatedNoteUniqueIdentifier"), 1, 0, 0, 0);
}

- (uint64_t)ic_relatedModernNoteUniqueIdentifier
{
  return objc_msgSend(a1, "attributeForKey:", CFSTR("_ICItemRelatedNoteUniqueIdentifier"));
}

- (void)setIc_relatedModernNoteUniqueIdentifier:()IC
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CA6B50], "ic_relatedModernNoteUniqueIdentifierCustomKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(a1, "setValue:forCustomKey:", v5, v4);

}

+ (uint64_t)ic_itemHasChecklistsCustomKey
{
  return objc_msgSend(a1, "ic_customAttributeKeyWithName:searchable:searchableByDefault:unique:multiValued:", CFSTR("_ICItemHasChecklists"), 1, 0, 0, 0);
}

- (uint64_t)ic_hasChecklists
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "attributeForKey:", CFSTR("_ICItemHasChecklists"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)setIc_hasChecklists:()IC
{
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CA6B50], "ic_itemHasChecklistsCustomKey");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setValue:forCustomKey:", v5, v6);

  }
}

+ (uint64_t)ic_itemHasTagsCustomKey
{
  return objc_msgSend(a1, "ic_customAttributeKeyWithName:searchable:searchableByDefault:unique:multiValued:", CFSTR("_ICItemHasICItemHasTags"), 1, 0, 0, 0);
}

- (uint64_t)ic_hasTags
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "attributeForKey:", CFSTR("_ICItemHasICItemHasTags"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)setIc_hasTags:()IC
{
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CA6B50], "ic_itemHasTagsCustomKey");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setValue:forCustomKey:", v5, v6);

  }
}

+ (uint64_t)ic_itemHasDrawingsCustomKey
{
  return objc_msgSend(a1, "ic_customAttributeKeyWithName:searchable:searchableByDefault:unique:multiValued:", CFSTR("_ICItemHasDrawings"), 1, 0, 0, 0);
}

- (uint64_t)ic_hasDrawings
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "attributeForKey:", CFSTR("_ICItemHasDrawings"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)setIc_hasDrawings:()IC
{
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CA6B50], "ic_itemHasDrawingsCustomKey");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setValue:forCustomKey:", v5, v6);

  }
}

+ (uint64_t)ic_itemHasScannedDocumentsCustomKey
{
  return objc_msgSend(a1, "ic_customAttributeKeyWithName:searchable:searchableByDefault:unique:multiValued:", CFSTR("_ICItemHasScannedDocuments"), 1, 0, 0, 0);
}

- (uint64_t)ic_hasScannedDocuments
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "attributeForKey:", CFSTR("_ICItemHasScannedDocuments"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)setIc_hasScannedDocuments:()IC
{
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CA6B50], "ic_itemHasScannedDocumentsCustomKey");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setValue:forCustomKey:", v5, v6);

  }
}

+ (uint64_t)ic_itemHasAttachmentsCustomKey
{
  return objc_msgSend(a1, "ic_customAttributeKeyWithName:searchable:searchableByDefault:unique:multiValued:", CFSTR("_ICItemHasAttachments"), 1, 0, 0, 0);
}

- (uint64_t)ic_hasAttachments
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "attributeForKey:", CFSTR("_ICItemHasAttachments"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)setIc_hasAttachments:()IC
{
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CA6B50], "ic_itemHasAttachmentsCustomKey");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setValue:forCustomKey:", v5, v6);

  }
}

+ (uint64_t)ic_accountNameCustomKey
{
  return objc_msgSend(a1, "ic_customAttributeKeyWithName:searchable:searchableByDefault:unique:multiValued:", CFSTR("_ICItemAccountName"), 1, 1, 1, 0);
}

- (id)ic_accountName
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "attributeForKey:", CFSTR("_ICItemAccountName"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)setIc_accountName:()IC
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CA6B50], "ic_accountNameCustomKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(a1, "setValue:forCustomKey:", v5, v4);

}

+ (uint64_t)ic_folderNameCustomKey
{
  return objc_msgSend(a1, "ic_customAttributeKeyWithName:searchable:searchableByDefault:unique:multiValued:", CFSTR("_ICItemFolderName"), 1, 1, 1, 0);
}

- (id)ic_folderName
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "attributeForKey:", CFSTR("_ICItemFolderName"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)setIc_folderName:()IC
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CA6B50], "ic_folderNameCustomKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(a1, "setValue:forCustomKey:", v5, v4);

}

@end
