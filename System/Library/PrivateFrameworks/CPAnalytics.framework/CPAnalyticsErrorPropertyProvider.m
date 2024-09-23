@implementation CPAnalyticsErrorPropertyProvider

+ (id)_indepthErrorFromError:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDD1398];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (__CFString *)objc_alloc_init(MEMORY[0x24BDD16A8]);
    v7 = v5;
    v8 = 0;
    do
    {
      v9 = v7;
      objc_msgSend(v7, "domain");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString appendFormat:](v6, "appendFormat:", CFSTR("%@:%ld|"), v10, objc_msgSend(v9, "code"));

      objc_msgSend(v9, "userInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v4);
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if (v8 > 1)
        break;
      ++v8;
    }
    while (v7);
    -[__CFString deleteCharactersInRange:](v6, "deleteCharactersInRange:", -[__CFString length](v6, "length") - 1, 1);

  }
  else
  {
    v6 = CFSTR("None");
  }

  return v6;
}

- (void)registerSystemProperties:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "addDynamicProperty:withProvider:", CFSTR("cpa_error_domain"), self);
  objc_msgSend(v4, "addDynamicProperty:withProvider:", CFSTR("cpa_error_code"), self);
  objc_msgSend(v4, "addDynamicProperty:withProvider:", CFSTR("cpa_error_codeAsString"), self);
  objc_msgSend(v4, "addDynamicProperty:withProvider:", CFSTR("cpa_error_description"), self);
  objc_msgSend(v4, "addDynamicProperty:withProvider:", CFSTR("cpa_error_indepthErrors"), self);

}

- (id)getDynamicProperty:(id)a3 forEventName:(id)a4 payloadForSystemPropertyExtraction:(id)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("cpa_error"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_13;
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("cpa_error_domain")))
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("cpa_error_code")))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v7, "code"));
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("cpa_error_codeAsString")))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v7, "code"));
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("cpa_error_description")))
    {
      objc_msgSend(v7, "description");
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("cpa_error_indepthErrors")))
    {
      objc_msgSend((id)objc_opt_class(), "_indepthErrorFromError:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_13:
    v9 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v7, "domain");
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_12:
  v9 = (void *)v8;
LABEL_14:

  return v9;
}

@end
