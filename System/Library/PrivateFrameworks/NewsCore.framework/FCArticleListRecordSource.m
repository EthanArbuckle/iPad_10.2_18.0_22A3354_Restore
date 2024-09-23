@implementation FCArticleListRecordSource

- (id)recordIDPrefixes
{
  return &unk_1E470C708;
}

- (id)recordType
{
  return CFSTR("ArticleList");
}

- (int)pbRecordType
{
  return 4;
}

- (id)nonLocalizableKeys
{
  if (qword_1ED0F8360 != -1)
    dispatch_once(&qword_1ED0F8360, &__block_literal_global_3_3);
  return (id)_MergedGlobals_171;
}

- (unint64_t)storeVersion
{
  return 7;
}

- (id)storeFilename
{
  return CFSTR("article-list-record-source");
}

- (unint64_t)highThresholdDataSizeLimit
{
  return 1000000;
}

void __47__FCArticleListRecordSource_nonLocalizableKeys__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("articleIDs"), CFSTR("type"), CFSTR("metadata"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_171;
  _MergedGlobals_171 = v0;

}

- (unint64_t)lowThresholdDataSizeLimit
{
  return 10000;
}

- (id)recordFromCKRecord:(id)a3 base:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = (objc_class *)MEMORY[0x1E0D62628];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "setBase:", v6);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("articleIDs"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  objc_msgSend(v8, "setArticleIDs:", v10);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("type"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setType:", PBArticleListTypeFromString((uint64_t)v11));

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("metadata"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setMetadata:", v12);
  return v8;
}

@end
