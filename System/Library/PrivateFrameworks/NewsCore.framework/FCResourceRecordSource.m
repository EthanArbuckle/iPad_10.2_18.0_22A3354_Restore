@implementation FCResourceRecordSource

- (id)recordType
{
  return CFSTR("Resource");
}

- (int)pbRecordType
{
  return 3;
}

- (id)nonLocalizableKeys
{
  if (qword_1ED0F7DE8 != -1)
    dispatch_once(&qword_1ED0F7DE8, &__block_literal_global_3_0);
  return (id)_MergedGlobals_144;
}

- (unint64_t)storeVersion
{
  return 7;
}

- (id)storeFilename
{
  return CFSTR("resource-record-source");
}

- (unint64_t)highThresholdDataSizeLimit
{
  return 2000000;
}

void __44__FCResourceRecordSource_nonLocalizableKeys__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("type"), CFSTR("encoding"), CFSTR("data"), CFSTR("asset"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_144;
  _MergedGlobals_144 = v0;

}

- (unint64_t)lowThresholdDataSizeLimit
{
  return 250000;
}

- (id)recordFromCKRecord:(id)a3 base:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _BOOL4 IsFont;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0D62800];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  objc_msgSend(v8, "setBase:", v5);
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMimeType:", v9);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("encoding"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEncoding:", v10);

  objc_opt_class();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("asset"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
  }
  else
  {
    v12 = 0;
  }
  v13 = v12;
  objc_msgSend(v8, "setUrl:", v13);

  objc_msgSend(v8, "mimeType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  IsFont = FCMIMETypeIsFont(v14);

  if (IsFont)
    objc_msgSend(v5, "setCacheLifetimeHint:", 1);

  return v8;
}

@end
