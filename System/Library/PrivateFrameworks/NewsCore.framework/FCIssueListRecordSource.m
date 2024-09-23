@implementation FCIssueListRecordSource

- (id)recordIDPrefixes
{
  return &unk_1E470C810;
}

- (id)recordType
{
  return CFSTR("IssueList");
}

- (int)pbRecordType
{
  return 11;
}

- (unint64_t)storeVersion
{
  return 1;
}

- (id)storeFilename
{
  return CFSTR("issue-list-record-source");
}

- (unint64_t)highThresholdDataSizeLimit
{
  return 1000000;
}

- (id)nonLocalizableKeys
{
  if (qword_1ED0F8740 != -1)
    dispatch_once(&qword_1ED0F8740, &__block_literal_global_3_7);
  return (id)_MergedGlobals_203;
}

void __45__FCIssueListRecordSource_nonLocalizableKeys__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("issueIDs"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_203;
  _MergedGlobals_203 = v0;

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

  v5 = (objc_class *)MEMORY[0x1E0D626E0];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "setBase:", v6);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("issueIDs"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  objc_msgSend(v8, "setIssueIDs:", v10);

  return v8;
}

@end
