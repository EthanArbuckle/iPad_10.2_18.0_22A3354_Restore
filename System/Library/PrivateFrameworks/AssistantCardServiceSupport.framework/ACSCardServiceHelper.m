@implementation ACSCardServiceHelper

+ (id)rowCardSectionFromLeadingText:(id)a3 trailingText:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x24BE84F88];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "acs_uniquelyIdentifiedCardSection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE84F78], "textWithString:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setLeadingText:", v9);
  objc_msgSend(MEMORY[0x24BE84F78], "textWithString:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setTrailingText:", v10);
  return v8;
}

+ (id)formattedDateTimeStringFromDateComponents:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDBCE48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateFromComponents:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "formattedDateTimeStringFromDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)formattedDateTimeStringFromDate:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = formattedDateTimeStringFromDate__once;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&formattedDateTimeStringFromDate__once, &__block_literal_global_1);
  objc_msgSend((id)formattedDateTimeStringFromDate__acsDateFormatter, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __56__ACSCardServiceHelper_formattedDateTimeStringFromDate___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)formattedDateTimeStringFromDate__acsDateFormatter;
  formattedDateTimeStringFromDate__acsDateFormatter = (uint64_t)v0;

  objc_msgSend((id)formattedDateTimeStringFromDate__acsDateFormatter, "setDateStyle:", 1);
  return objc_msgSend((id)formattedDateTimeStringFromDate__acsDateFormatter, "setTimeStyle:", 1);
}

+ (void)addParameterToSection:(id)a3 selectorStrings:(id)a4 class:(Class)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v7 = a3;
  objc_msgSend(a4, "componentsJoinedByString:", CFSTR("."));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD9EF8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "parameterForClass:keyPath:", a5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "acs_addParameter:", v10);
}

@end
