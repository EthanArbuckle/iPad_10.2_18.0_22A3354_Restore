@implementation FCPurchaseLookupRecordSource

- (id)recordIDPrefixes
{
  return &unk_1E470C720;
}

- (id)recordType
{
  return CFSTR("PurchaseLookup");
}

- (int)pbRecordType
{
  return 6;
}

+ (id)defaultCachePolicy
{
  if (qword_1ED0F8450 != -1)
    dispatch_once(&qword_1ED0F8450, &__block_literal_global_7_2);
  return (id)qword_1ED0F8448;
}

- (unint64_t)storeVersion
{
  return 4;
}

- (id)storeFilename
{
  return CFSTR("purchaselookup-record-source");
}

- (unint64_t)highThresholdDataSizeLimit
{
  return 1000000;
}

uint64_t __50__FCPurchaseLookupRecordSource_defaultCachePolicy__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)qword_1ED0F8448;
  qword_1ED0F8448 = v0;

  objc_msgSend((id)qword_1ED0F8448, "setCachePolicy:", 4);
  return objc_msgSend((id)qword_1ED0F8448, "setMaximumCachedAge:", 900.0);
}

void __50__FCPurchaseLookupRecordSource_nonLocalizableKeys__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("appAdamID"), CFSTR("channelTagIDs"), CFSTR("bundleChannelTagIDs"), CFSTR("bundleChannelTagIDsVersion"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_176;
  _MergedGlobals_176 = v0;

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
  void *v13;
  void *v14;

  v5 = (objc_class *)MEMORY[0x1E0D627C0];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "setBase:", v6);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("appAdamID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAppAdamID:", v9);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("channelTagIDs"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  objc_msgSend(v8, "setChannelTagIDs:", v11);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("bundleChannelTagIDs"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");
  objc_msgSend(v8, "setBundleChannelTagIDs:", v13);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("bundleChannelTagIDsVersion"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setBundleChannelTagIDsVersion:", v14);
  return v8;
}

- (id)nonLocalizableKeys
{
  if (qword_1ED0F8440 != -1)
    dispatch_once(&qword_1ED0F8440, &__block_literal_global_3_4);
  return (id)_MergedGlobals_176;
}

- (unint64_t)lowThresholdDataSizeLimit
{
  return 10000;
}

@end
