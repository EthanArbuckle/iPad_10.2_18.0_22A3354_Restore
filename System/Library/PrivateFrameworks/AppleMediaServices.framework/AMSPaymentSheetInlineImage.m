@implementation AMSPaymentSheetInlineImage

- (AMSPaymentSheetInlineImage)initWithURLString:(id)a3
{
  id v4;
  AMSPaymentSheetInlineImage *v5;
  uint64_t v6;
  NSString *URLString;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSPaymentSheetInlineImage;
  v5 = -[AMSPaymentSheetInlineImage init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    URLString = v5->_URLString;
    v5->_URLString = (NSString *)v6;

    v5->_imageType = 1;
  }

  return v5;
}

- (AMSPaymentSheetInlineImage)initWithDictionary:(id)a3
{
  id v4;
  AMSPaymentSheetInlineImage *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *v11;
  uint64_t v12;
  void *localAssetConfiguration;
  void *v14;
  uint64_t v15;
  NSString *value;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AMSPaymentSheetInlineImage;
  v5 = -[AMSPaymentSheetInlineImage init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[AMSPaymentSheetInlineImage _ratingTypeForType:](v5, "_ratingTypeForType:", v6);
    v5->_imageType = v7;
    switch(v7)
    {
      case 0:
      case 1:
      case 2:
      case 12:
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("value"));
        localAssetConfiguration = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(localAssetConfiguration, "uppercaseString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "copy");
        value = v5->_value;
        v5->_value = (NSString *)v15;

        goto LABEL_6;
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("value"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "uppercaseString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "copy");
        v11 = v5->_value;
        v5->_value = (NSString *)v10;

        -[AMSPaymentSheetInlineImage _imageAssetConfigurationForDictionary:](v5, "_imageAssetConfigurationForDictionary:", v4);
        v12 = objc_claimAutoreleasedReturnValue();
        goto LABEL_4;
      case 13:
        -[AMSPaymentSheetInlineImage _symbolAssetConfigurationForDictionary:](v5, "_symbolAssetConfigurationForDictionary:", v4);
        v12 = objc_claimAutoreleasedReturnValue();
LABEL_4:
        localAssetConfiguration = v5->_localAssetConfiguration;
        v5->_localAssetConfiguration = (AMSPaymentSheetAssetConfiguration *)v12;
LABEL_6:

        break;
      default:
        break;
    }

  }
  return v5;
}

+ (id)textEncapsulationForServerValue:(id)a3
{
  id v3;
  const __CFString *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = CFSTR("TV-Y");
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TV-Y")) & 1) == 0)
  {
    v4 = CFSTR("TV-Y7");
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TV-Y7")) & 1) == 0)
    {
      if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FV")) & 1) != 0)
      {
        v4 = CFSTR("TV-Y7FV");
      }
      else
      {
        v4 = CFSTR("TV-14");
        if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TV-14")) & 1) == 0)
        {
          v4 = CFSTR("TV-G");
          if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TV-G")) & 1) == 0)
          {
            v4 = CFSTR("TV-PG");
            if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TV-PG")) & 1) == 0)
            {
              v4 = CFSTR("TV-MA");
              if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TV-MA")) & 1) == 0)
              {
                v4 = CFSTR("D");
                if ((objc_msgSend(v3, "isEqualToString:", CFSTR("D")) & 1) == 0)
                {
                  v4 = CFSTR("L");
                  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("L")) & 1) == 0)
                  {
                    v4 = CFSTR("S");
                    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("S")) & 1) == 0)
                    {
                      v4 = CFSTR("V");
                      if ((objc_msgSend(v3, "isEqualToString:", CFSTR("V")) & 1) == 0)
                      {
                        +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
                        v5 = (void *)objc_claimAutoreleasedReturnValue();
                        if (!v5)
                        {
                          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
                          v5 = (void *)objc_claimAutoreleasedReturnValue();
                        }
                        objc_msgSend(v5, "OSLogObject");
                        v6 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
                        {
                          v7 = objc_opt_class();
                          AMSLogKey();
                          v8 = (void *)objc_claimAutoreleasedReturnValue();
                          v10 = 138543874;
                          v11 = v7;
                          v12 = 2114;
                          v13 = v8;
                          v14 = 2112;
                          v15 = v3;
                          _os_log_impl(&dword_18C849000, v6, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Failed to find text encapsulation mapping for: %@", (uint8_t *)&v10, 0x20u);

                        }
                        v4 = 0;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return (id)v4;
}

- (BOOL)isServerSupplied
{
  return -[AMSPaymentSheetInlineImage imageType](self, "imageType") == 1;
}

- (BOOL)tint
{
  return ((-[AMSPaymentSheetInlineImage imageType](self, "imageType") - 7) & 0xFFFFFFFFFFFFFFFBLL) == 0;
}

- (int64_t)_defaultAssetType
{
  return 0;
}

- (id)_imageAssetConfigurationForDictionary:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  AMSPaymentSheetImageAssetConfiguration *v11;

  v4 = a3;
  v5 = -[AMSPaymentSheetInlineImage _defaultAssetType](self, "_defaultAssetType");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("value"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "uppercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  switch(-[AMSPaymentSheetInlineImage imageType](self, "imageType"))
  {
    case 3:
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("10")) & 1) != 0)
      {
        v8 = CFSTR("Rating-Brazil_10");
        goto LABEL_111;
      }
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("12")) & 1) != 0)
      {
        v8 = CFSTR("Rating-Brazil_12");
        goto LABEL_111;
      }
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("14")) & 1) != 0)
      {
        v8 = CFSTR("Rating-Brazil_14");
        goto LABEL_111;
      }
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("16")) & 1) != 0)
      {
        v8 = CFSTR("Rating-Brazil_16");
        goto LABEL_111;
      }
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("18")) & 1) != 0)
      {
        v8 = CFSTR("Rating-Brazil_18");
        goto LABEL_111;
      }
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("L")) & 1) == 0)
        goto LABEL_108;
      v8 = CFSTR("Rating-Brazil_L");
      goto LABEL_111;
    case 4:
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ALL")) & 1) != 0)
      {
        v8 = CFSTR("Rating-Australia_ALL");
        goto LABEL_111;
      }
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("15")) & 1) != 0)
      {
        v8 = CFSTR("Rating-Australia_15");
        goto LABEL_111;
      }
LABEL_22:
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("18")) & 1) == 0)
        goto LABEL_108;
      v8 = CFSTR("Rating-Australia_18");
      goto LABEL_111;
    case 5:
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ALL")) & 1) != 0)
      {
        v8 = CFSTR("Rating-Korea_ALL");
        goto LABEL_111;
      }
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("12")) & 1) != 0)
      {
        v8 = CFSTR("Rating-Korea_12");
        goto LABEL_111;
      }
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("15")) & 1) == 0)
        goto LABEL_108;
      v8 = CFSTR("Rating-Korea_15");
      goto LABEL_111;
    case 6:
      goto LABEL_22;
    case 7:
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("G")) & 1) != 0)
      {
        v8 = CFSTR("Rating-MPAA_G");
        goto LABEL_111;
      }
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("GP")) & 1) != 0)
        goto LABEL_108;
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("PG")) & 1) != 0)
      {
        v8 = CFSTR("Rating-MPAA_PG");
        goto LABEL_111;
      }
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("PG-13")) & 1) != 0)
      {
        v8 = CFSTR("Rating-MPAA_PG13");
        goto LABEL_111;
      }
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("M")) & 1) != 0)
        goto LABEL_108;
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("R")) & 1) != 0)
      {
        v8 = CFSTR("Rating-MPAA_R");
        goto LABEL_111;
      }
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("NC-17")) & 1) != 0)
      {
        v8 = CFSTR("Rating-MPAA_NC17");
        goto LABEL_111;
      }
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("UNRATED")) & 1) != 0)
      {
        v8 = CFSTR("Rating-MPAA_Unrated");
        goto LABEL_111;
      }
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("NR")) & 1) != 0)
      {
        v8 = CFSTR("Rating-MPAA_NR");
        goto LABEL_111;
      }
      v10 = CFSTR("X");
      goto LABEL_107;
    case 8:
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("CLEAN")) & 1) != 0)
      {
        v8 = CFSTR("Rating-RIAA_Clean");
        goto LABEL_111;
      }
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("EXPLICIT")) & 1) == 0)
        goto LABEL_108;
      v8 = CFSTR("Rating-RIAA_Explicit");
      goto LABEL_111;
    case 9:
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("G")) & 1) != 0)
      {
        v8 = CFSTR("Rating-Movie_NZ_G");
        goto LABEL_111;
      }
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("PG")) & 1) != 0)
      {
        v8 = CFSTR("Rating-Movie_NZ_PG");
        goto LABEL_111;
      }
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("M")) & 1) != 0)
      {
        v8 = CFSTR("Rating-Movie_NZ_M");
        goto LABEL_111;
      }
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("R13")) & 1) != 0)
      {
        v8 = CFSTR("Rating-Movie_NZ_R13");
        goto LABEL_111;
      }
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("R15")) & 1) != 0)
      {
        v8 = CFSTR("Rating-Movie_NZ_R15");
        goto LABEL_111;
      }
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("R16")) & 1) != 0)
      {
        v8 = CFSTR("Rating-Movie_NZ_R16");
        goto LABEL_111;
      }
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("R18")) & 1) != 0)
      {
        v8 = CFSTR("Rating-Movie_NZ_R18");
        goto LABEL_111;
      }
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RP13")) & 1) != 0)
      {
        v8 = CFSTR("Rating-Movie_NZ_RP13");
        goto LABEL_111;
      }
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RP16")) & 1) != 0)
      {
        v8 = CFSTR("Rating-Movie_NZ_RP16");
        goto LABEL_111;
      }
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("R")) & 1) != 0)
      {
        v8 = CFSTR("Rating-Movie_NZ_R");
        goto LABEL_111;
      }
      v9 = CFSTR("NOT RATED");
      goto LABEL_105;
    case 10:
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("U")) & 1) != 0)
      {
        v8 = CFSTR("Rating-Movie_UK_U");
        goto LABEL_111;
      }
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("UC")) & 1) != 0)
        goto LABEL_108;
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("PG")) & 1) != 0)
      {
        v8 = CFSTR("Rating-Movie_UK_PG");
        goto LABEL_111;
      }
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("12")) & 1) != 0)
      {
        v8 = CFSTR("Rating-Movie_UK_12");
        goto LABEL_111;
      }
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("12A")) & 1) != 0)
      {
        v8 = CFSTR("Rating-Movie_UK_12A");
        goto LABEL_111;
      }
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("15")) & 1) != 0)
      {
        v8 = CFSTR("Rating-Movie_UK_15");
        goto LABEL_111;
      }
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("18")) & 1) != 0)
      {
        v8 = CFSTR("Rating-Movie_UK_18");
        goto LABEL_111;
      }
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("18R")) & 1) != 0)
      {
        v8 = CFSTR("Rating-Movie_UK_R18");
        goto LABEL_111;
      }
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("E")) & 1) == 0)
      {
        v9 = CFSTR("TBC");
LABEL_105:
        if ((objc_msgSend(v7, "isEqualToString:", v9) & 1) == 0)
        {
          v10 = CFSTR("UNRATED");
LABEL_107:
          objc_msgSend(v7, "isEqualToString:", v10);
        }
      }
      goto LABEL_108;
    case 11:
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("TV-Y")) & 1) != 0)
      {
        v8 = CFSTR("Rating-TV_US_Y");
      }
      else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("TV-Y7")) & 1) != 0)
      {
        v8 = CFSTR("Rating-TV_US_Y7");
      }
      else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FV")) & 1) != 0)
      {
        v8 = CFSTR("Rating-TV_US_Y7FV");
      }
      else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("TV-14")) & 1) != 0)
      {
        v8 = CFSTR("Rating-TV_US_14");
      }
      else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("TV-G")) & 1) != 0)
      {
        v8 = CFSTR("Rating-TV_US_G");
      }
      else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("TV-PG")) & 1) != 0)
      {
        v8 = CFSTR("Rating-TV_US_PG");
      }
      else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("TV-MA")) & 1) != 0)
      {
        v8 = CFSTR("Rating-TV_US_MA");
      }
      else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("D")) & 1) != 0)
      {
        v8 = CFSTR("Rating-TV_US_D");
      }
      else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("L")) & 1) != 0)
      {
        v8 = CFSTR("Rating-TV_US_L");
      }
      else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("S")) & 1) != 0)
      {
        v8 = CFSTR("Rating-TV_US_S");
      }
      else
      {
        if (!objc_msgSend(v7, "isEqualToString:", CFSTR("V")))
        {
LABEL_108:
          v11 = 0;
          goto LABEL_112;
        }
        v8 = CFSTR("Rating-TV_US_V");
      }
LABEL_111:
      v11 = -[AMSPaymentSheetImageAssetConfiguration initWithFilename:size:type:]([AMSPaymentSheetImageAssetConfiguration alloc], "initWithFilename:size:type:", v8, v5, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
LABEL_112:

      return v11;
    default:
      goto LABEL_108;
  }
}

- (int64_t)_ratingTypeForType:(id)a3
{
  void *v3;
  int64_t v4;

  objc_msgSend(a3, "uppercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APPS-BRAZIL")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APPS-AUSTRALIA")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APPS-FRANCE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APPS-KOREA")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GAMES")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("ITUNESGAMES")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("ITUNES-GAMES")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NZ-OFLC")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BBFC")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MPAA")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RIAA")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TV-US")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("US-TV")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("TV")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PAYMENTTYPE")) & 1) != 0)
  {
    v4 = 12;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SYMBOL")))
  {
    v4 = 13;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int64_t)_scaleForString:(id)a3
{
  id v4;
  int64_t v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("small")) & 1) == 0)
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("medium")) & 1) == 0)
    {
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("large")) & 1) != 0)
      {
        v5 = 2;
        goto LABEL_28;
      }
      v6 = +[AMSUnitTests isRunningUnitTests](AMSUnitTests, "isRunningUnitTests");
      +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      if (v6)
      {
        if (!v7)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v8, "OSLogObject");
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          AMSLogKey();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (void *)MEMORY[0x1E0CB3940];
          v12 = objc_opt_class();
          v13 = v12;
          if (v10)
          {
            AMSLogKey();
            self = (AMSPaymentSheetInlineImage *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: [%@] "), v13, self);
          }
          else
          {
            objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: "), v12);
          }
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          AMSHashIfNeeded(v4);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v25 = v14;
          v26 = 2114;
          v27 = v21;
          _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unexpected image scale: %{public}@", buf, 0x16u);
          if (v10)
          {

            v14 = self;
          }

        }
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[AMSLogConfig sharedPurchaseConfig](AMSLogConfig, "sharedPurchaseConfig");
        v15 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("com.apple.AppleMediaServicesTests.FaultLogged"), v15, 0);
      }
      else
      {
        if (!v7)
        {
          +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v8, "OSLogObject");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          AMSLogKey();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)MEMORY[0x1E0CB3940];
          v18 = objc_opt_class();
          v19 = v18;
          if (v16)
          {
            AMSLogKey();
            self = (AMSPaymentSheetInlineImage *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "stringWithFormat:", CFSTR("%@: [%@] "), v19, self);
          }
          else
          {
            objc_msgSend(v17, "stringWithFormat:", CFSTR("%@: "), v18);
          }
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          AMSHashIfNeeded(v4);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v25 = v20;
          v26 = 2114;
          v27 = v22;
          _os_log_impl(&dword_18C849000, v15, OS_LOG_TYPE_FAULT, "%{public}@Unexpected image scale: %{public}@", buf, 0x16u);
          if (v16)
          {

            v20 = self;
          }

        }
      }

    }
    v5 = 1;
    goto LABEL_28;
  }
  v5 = 0;
LABEL_28:

  return v5;
}

- (id)_symbolAssetConfigurationForDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  int64_t v11;
  AMSPaymentSheetSymbolAssetConfiguration *v12;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("accessibilityText"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("value"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("scale"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;

  v11 = -[AMSPaymentSheetInlineImage _scaleForString:](self, "_scaleForString:", v10);
  if (v8)
    v12 = -[AMSPaymentSheetSymbolAssetConfiguration initWithName:accessibilityText:scale:]([AMSPaymentSheetSymbolAssetConfiguration alloc], "initWithName:accessibilityText:scale:", v8, v6, v11);
  else
    v12 = 0;

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AMSPaymentSheetInlineImage *v5;
  void *v6;
  uint64_t v7;
  NSString *URLString;
  void *v9;
  uint64_t v10;
  NSString *value;

  v5 = -[AMSPaymentSheetInlineImage init](+[AMSPaymentSheetInlineImage allocWithZone:](AMSPaymentSheetInlineImage, "allocWithZone:"), "init");
  v5->_imageType = -[AMSPaymentSheetInlineImage imageType](self, "imageType");
  -[AMSPaymentSheetInlineImage URLString](self, "URLString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  URLString = v5->_URLString;
  v5->_URLString = (NSString *)v7;

  -[AMSPaymentSheetInlineImage value](self, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copyWithZone:", a3);
  value = v5->_value;
  v5->_value = (NSString *)v10;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[AMSPaymentSheetInlineImage imageType](self, "imageType"), CFSTR("imagetype"));
  -[AMSPaymentSheetInlineImage URLString](self, "URLString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("URLString"));

  -[AMSPaymentSheetInlineImage value](self, "value");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("value"));

}

- (AMSPaymentSheetInlineImage)initWithCoder:(id)a3
{
  id v4;
  AMSPaymentSheetInlineImage *v5;
  uint64_t v6;
  NSString *URLString;
  uint64_t v8;
  NSString *value;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSPaymentSheetInlineImage;
  v5 = -[AMSPaymentSheetInlineImage init](&v11, sel_init);
  if (v5)
  {
    v5->_imageType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("imagetype"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URLString"));
    v6 = objc_claimAutoreleasedReturnValue();
    URLString = v5->_URLString;
    v5->_URLString = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
    v8 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (NSString *)v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AMSPaymentSheetAssetConfiguration)localAssetConfiguration
{
  return self->_localAssetConfiguration;
}

- (int64_t)imageType
{
  return self->_imageType;
}

- (NSString)URLString
{
  return self->_URLString;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_URLString, 0);
  objc_storeStrong((id *)&self->_localAssetConfiguration, 0);
}

@end
