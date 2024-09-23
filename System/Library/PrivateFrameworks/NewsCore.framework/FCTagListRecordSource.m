@implementation FCTagListRecordSource

- (id)recordIDPrefixes
{
  return &unk_1E470C780;
}

- (id)recordType
{
  return CFSTR("TagList");
}

- (int)pbRecordType
{
  return 12;
}

- (unint64_t)storeVersion
{
  return 1;
}

- (id)storeFilename
{
  return CFSTR("tag-list-record-source");
}

- (unint64_t)highThresholdDataSizeLimit
{
  return 100000;
}

- (id)nonLocalizableKeys
{
  if (qword_1ED0F85C8 != -1)
    dispatch_once(&qword_1ED0F85C8, &__block_literal_global_3_6);
  return (id)_MergedGlobals_192;
}

void __43__FCTagListRecordSource_nonLocalizableKeys__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("tagIDs"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_192;
  _MergedGlobals_192 = v0;

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

  v5 = (objc_class *)MEMORY[0x1E0D62838];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "setBase:", v6);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("tagIDs"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  objc_msgSend(v8, "setTagIDs:", v10);

  return v8;
}

@end
