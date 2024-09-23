@implementation FCChannelMembershipRecordSource

- (id)recordType
{
  return CFSTR("Membership");
}

- (int)pbRecordType
{
  return 5;
}

- (id)nonLocalizableKeys
{
  if (qword_1ED0F8870 != -1)
    dispatch_once(&qword_1ED0F8870, &__block_literal_global_3_9);
  return (id)_MergedGlobals_217;
}

void __53__FCChannelMembershipRecordSource_nonLocalizableKeys__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("channelTagID"), CFSTR("canAccessDrafts"), CFSTR("draftsArticleListID"), CFSTR("draftsIssueListID"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_217;
  _MergedGlobals_217 = v0;

}

- (id)storeFilename
{
  return CFSTR("channel-membership-record-source");
}

- (unint64_t)storeVersion
{
  return 7;
}

- (unint64_t)lowThresholdDataSizeLimit
{
  return 1000;
}

- (unint64_t)highThresholdDataSizeLimit
{
  return 100000;
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

  v5 = (objc_class *)MEMORY[0x1E0D62680];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "setBase:", v6);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("channelTagID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setChannelID:", v9);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("canAccessDrafts"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCanAccessDrafts:", objc_msgSend(v10, "BOOLValue"));

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("draftsArticleListID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDraftArticleListID:", v11);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("draftsIssueListID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setDraftIssueListID:", v12);
  return v8;
}

@end
