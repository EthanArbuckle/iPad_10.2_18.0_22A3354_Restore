@implementation AFLocalizationManager

- (AFLocalizationManager)init
{
  void *v3;
  void *v4;
  AFLocalizationManager *v5;

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AFLocalizationManager initWithLocaleIdentifier:](self, "initWithLocaleIdentifier:", v4);

  return v5;
}

- (id)initForLocalizedStrings
{
  AFLocalizationManager *v2;
  void *v3;
  uint64_t v4;
  NSString *localeIdentifier;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AFLocalizationManager;
  v2 = -[AFLocalizationManager init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localeIdentifier");
    v4 = objc_claimAutoreleasedReturnValue();
    localeIdentifier = v2->_localeIdentifier;
    v2->_localeIdentifier = (NSString *)v4;

  }
  return v2;
}

- (AFLocalizationManager)initWithLocaleIdentifier:(id)a3
{
  id v5;
  AFLocalizationManager *v6;
  AFLocalizationManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFLocalizationManager;
  v6 = -[AFLocalizationManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_localeIdentifier, a3);

  return v7;
}

- (void)setLocaleIdentifier:(id)a3
{
  id v5;
  NSString **p_localeIdentifier;
  NSString *localeIdentifier;
  id v8;

  v5 = a3;
  localeIdentifier = self->_localeIdentifier;
  p_localeIdentifier = &self->_localeIdentifier;
  v8 = v5;
  if ((objc_msgSend(v5, "isEqualToString:", localeIdentifier) & 1) == 0)
    objc_storeStrong((id *)p_localeIdentifier, a3);

}

- (id)localizedStringForKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "_deviceLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredLocalizations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD1488];
  v15[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferredLocalizationsFromArray:forPreferences:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:localization:", v3, 0, CFSTR("SuggestionContent"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isEqual:", v3) & 1) != 0)
  {
    objc_msgSend(v4, "localizedStringForKey:value:table:", v3, &stru_250853C50, CFSTR("SuggestionContent"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = v11;
  }
  v13 = v12;

  return v13;
}

- (id)_truncationSentinel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD __buf[3];

  __buf[2] = *MEMORY[0x24BDAC8D0];
  __buf[0] = 0;
  __buf[1] = 0;
  arc4random_buf(__buf, 0x10uLL);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", __buf);
  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v2, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("*%@*"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)accessibilityLabelsForSecureHeaders:(id)a3 secureContents:(id)a4 truncationSentinel:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  __CFString *v18;
  id v19;
  __CFString *v20;
  __CFString *v21;
  NSObject *v22;
  __CFString *v23;
  id v25;
  id v27;
  uint8_t v28[4];
  _DWORD v29[7];

  *(_QWORD *)&v29[5] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v11 = 0;
    v25 = v9;
    do
    {
      objc_msgSend(v7, "objectAtIndex:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", v9, &stru_250853C50);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "objectAtIndex:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "length") && objc_msgSend(v14, "length"))
      {
        v15 = v10;
        v16 = v8;
        -[AFLocalizationManager localizedStringForKey:](self, "localizedStringForKey:", CFSTR("PROACTIVE_CANDIDATE_ACCESSIBILITY_LABEL"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 0;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v17, CFSTR("%@%@"), &v27, v13, v14);
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v19 = v27;
        v20 = &stru_250853C50;
        if (v18)
          v20 = v18;
        v21 = v20;

        if (v19)
        {
          AFLocalizationManagerOSLogFacility();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            -[AFLocalizationManager accessibilityLabelsForSecureHeaders:secureContents:truncationSentinel:].cold.1(v28, (uint64_t)v19, v29, v22);

        }
        v8 = v16;
        v10 = v15;
        v9 = v25;
        goto LABEL_17;
      }
      if (objc_msgSend(v13, "length"))
      {
        v23 = v13;
      }
      else
      {
        if (!objc_msgSend(v14, "length"))
        {
          v21 = &stru_250853C50;
          goto LABEL_17;
        }
        v23 = v14;
      }
      v21 = v23;
LABEL_17:
      objc_msgSend(v10, "addObject:", v21);

      ++v11;
    }
    while (v11 < objc_msgSend(v7, "count"));
  }

  return v10;
}

- (id)accessibilityLabelForAFTextContentType:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "_deviceLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredLocalizations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD1488];
  v15[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferredLocalizationsFromArray:forPreferences:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:localization:", v3, 0, CFSTR("AXAFTextContentType"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isEqual:", v3) & 1) != 0)
  {
    objc_msgSend(v4, "localizedStringForKey:value:table:", v3, &stru_250853C50, CFSTR("AXAFTextContentType"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = v11;
  }
  v13 = v12;

  return v13;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
}

- (void)accessibilityLabelsForSecureHeaders:(_QWORD *)a3 secureContents:(NSObject *)a4 truncationSentinel:.cold.1(uint8_t *a1, uint64_t a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s ERROR: invalid localized format for key PROACTIVE_CANDIDATE_ACCESSIBILITY_LABEL: %@"), "-[AFLocalizationManager accessibilityLabelsForSecureHeaders:secureContents:truncationSentinel:]", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_236D9D000, a4, OS_LOG_TYPE_ERROR, "%@", a1, 0xCu);

}

@end
