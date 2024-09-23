@implementation CLKLocalizableSimpleTextProvider

- (CLKLocalizableSimpleTextProvider)initWithTextKey:(id)a3 shortTextKey:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CLKLocalizableSimpleTextProvider;
  return -[CLKSimpleTextProvider initWithText:shortText:](&v5, sel_initWithText_shortText_, a3, a4);
}

- (id)_localizedTextProviderWithBundle:(id)a3 forLocalization:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v29;
  void *v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    CLKLoggingObjectForDomain(4);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(0, "bundlePath");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v32 = v30;
      _os_log_impl(&dword_2114F4000, v29, OS_LOG_TYPE_DEFAULT, "Didn't find requested localization bundle at path %@", buf, 0xCu);

    }
    v6 = 0;
    v21 = 0;
LABEL_22:
    -[CLKSimpleTextProvider text](self, "text");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
      goto LABEL_18;
LABEL_23:
    -[CLKSimpleTextProvider shortText](self, "shortText");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (v7)
  {
    objc_msgSend(v6, "bundlePath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.lproj"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingPathComponent:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;

      v6 = v14;
    }

  }
  -[CLKSimpleTextProvider text](self, "text");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[CLKSimpleTextProvider text](self, "text");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKSimpleTextProvider text](self, "text");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", v16, v17, CFSTR("ckcomplication"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      CLKLoggingObjectForDomain(4);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        -[CLKSimpleTextProvider text](self, "text");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "bundlePath");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v32 = v19;
        v33 = 2112;
        v34 = v20;
        _os_log_impl(&dword_2114F4000, v18, OS_LOG_TYPE_DEFAULT, "Didn't find entry for '%@' in %@", buf, 0x16u);

      }
      v15 = 0;
    }
  }
  -[CLKSimpleTextProvider shortText](self, "shortText");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[CLKSimpleTextProvider shortText](self, "shortText");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKSimpleTextProvider shortText](self, "shortText");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", v22, v23, CFSTR("ckcomplication"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      CLKLoggingObjectForDomain(4);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        -[CLKSimpleTextProvider shortText](self, "shortText");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "bundlePath");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v32 = v25;
        v33 = 2112;
        v34 = v26;
        _os_log_impl(&dword_2114F4000, v24, OS_LOG_TYPE_DEFAULT, "Didn't find entry for '%@' in %@", buf, 0x16u);

      }
      v21 = 0;
    }
  }
  if (!v15)
    goto LABEL_22;
  if (!v21)
    goto LABEL_23;
LABEL_18:
  +[CLKSimpleTextProvider textProviderWithText:shortText:](CLKSimpleTextProvider, "textProviderWithText:shortText:", v15, v21);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

@end
