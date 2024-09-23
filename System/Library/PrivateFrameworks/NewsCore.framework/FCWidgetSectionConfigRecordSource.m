@implementation FCWidgetSectionConfigRecordSource

- (id)recordIDPrefixes
{
  return &unk_1E470C750;
}

- (id)recordType
{
  return CFSTR("WidgetSectionConfig");
}

- (int)pbRecordType
{
  return 8;
}

- (unint64_t)storeVersion
{
  return 4;
}

- (id)storeFilename
{
  return CFSTR("widget-section-config-record-source");
}

- (unint64_t)highThresholdDataSizeLimit
{
  return 100000;
}

- (id)nonLocalizableKeys
{
  if (qword_1ED0F84A0 != -1)
    dispatch_once(&qword_1ED0F84A0, &__block_literal_global_9_1);
  return (id)_MergedGlobals_181;
}

void __55__FCWidgetSectionConfigRecordSource_nonLocalizableKeys__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("configuration2"), CFSTR("singleTagConfiguration"), CFSTR("articleListIDs2"), CFSTR("articleIDs2"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_181;
  _MergedGlobals_181 = v0;

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

  v5 = (objc_class *)MEMORY[0x1E0D628C0];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "setBase:", v6);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("configuration2"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConfiguration2:", v9);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("singleTagConfiguration"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSingleTagConfiguration:", v10);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("articleListIDs2"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setArticleListIDs2s:", v11);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("articleIDs2"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setArticleIDs2s:", v12);
  return v8;
}

@end
