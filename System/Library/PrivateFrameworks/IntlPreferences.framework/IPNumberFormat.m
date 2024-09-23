@implementation IPNumberFormat

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[IPNumberFormat decimalSeparator](self, "decimalSeparator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decimalSeparator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    -[IPNumberFormat groupingSeparator](self, "groupingSeparator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "groupingSeparator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[IPNumberFormat formattedNumber](self, "formattedNumber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (IPNumberFormat)initWithDecimalSeparator:(id)a3 groupingSeparator:(id)a4
{
  id v7;
  id v8;
  IPNumberFormat *v9;
  IPNumberFormat *v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSString *formattedNumber;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)IPNumberFormat;
  v9 = -[IPNumberFormat init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_decimalSeparator, a3);
    objc_storeStrong((id *)&v10->_groupingSeparator, a4);
    v11 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLocale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLocale:", v12);

    objc_msgSend(v11, "setDecimalSeparator:", v7);
    objc_msgSend(v11, "setGroupingSeparator:", v8);
    objc_msgSend(v11, "setNumberStyle:", 1);
    objc_msgSend(v11, "stringFromNumber:", &unk_1E706DE48);
    v13 = objc_claimAutoreleasedReturnValue();
    formattedNumber = v10->_formattedNumber;
    v10->_formattedNumber = (NSString *)v13;

  }
  return v10;
}

- (IPNumberFormat)initWithLocale:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  IPNumberFormat *v7;

  v4 = a3;
  objc_msgSend(v4, "decimalSeparator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupingSeparator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[IPNumberFormat initWithDecimalSeparator:groupingSeparator:](self, "initWithDecimalSeparator:groupingSeparator:", v5, v6);
  return v7;
}

+ (id)availableFormats
{
  void *v2;
  IPNumberFormat *v3;
  void *v4;
  IPNumberFormat *v5;
  IPNumberFormat *v6;
  void *v7;
  IPNumberFormat *v8;
  IPNumberFormat *v9;
  IPNumberFormat *v10;
  IPNumberFormat *v11;
  IPNumberFormat *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = [IPNumberFormat alloc];
  +[IPFormat localeFromDeviceLocale](IPFormat, "localeFromDeviceLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[IPNumberFormat initWithLocale:](v3, "initWithLocale:", v4);
  objc_msgSend(v2, "addObject:", v5);

  v6 = [IPNumberFormat alloc];
  +[IPFormat localeFromDeviceLanguage](IPFormat, "localeFromDeviceLanguage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[IPNumberFormat initWithLocale:](v6, "initWithLocale:", v7);
  objc_msgSend(v2, "addObject:", v8);

  v9 = -[IPNumberFormat initWithDecimalSeparator:groupingSeparator:]([IPNumberFormat alloc], "initWithDecimalSeparator:groupingSeparator:", CFSTR("."), CFSTR(","));
  objc_msgSend(v2, "addObject:", v9);

  v10 = -[IPNumberFormat initWithDecimalSeparator:groupingSeparator:]([IPNumberFormat alloc], "initWithDecimalSeparator:groupingSeparator:", CFSTR(","), CFSTR("."));
  objc_msgSend(v2, "addObject:", v10);

  v11 = -[IPNumberFormat initWithDecimalSeparator:groupingSeparator:]([IPNumberFormat alloc], "initWithDecimalSeparator:groupingSeparator:", CFSTR("."), CFSTR(" "));
  objc_msgSend(v2, "addObject:", v11);

  v12 = -[IPNumberFormat initWithDecimalSeparator:groupingSeparator:]([IPNumberFormat alloc], "initWithDecimalSeparator:groupingSeparator:", CFSTR(","), CFSTR(" "));
  objc_msgSend(v2, "addObject:", v12);

  objc_msgSend(v2, "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)currentFormat
{
  IPNumberFormat *v2;
  void *v3;
  IPNumberFormat *v4;

  v2 = [IPNumberFormat alloc];
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[IPNumberFormat initWithLocale:](v2, "initWithLocale:", v3);

  return v4;
}

+ (void)setFormat:(id)a3
{
  id v3;
  IPNumberFormat *v4;
  void *v5;
  IPNumberFormat *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = [IPNumberFormat alloc];
  +[IPFormat localeFromDeviceLocale](IPFormat, "localeFromDeviceLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[IPNumberFormat initWithLocale:](v4, "initWithLocale:", v5);

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqual:", v6))
  {
    objc_msgSend(v7, "removeObjectForKey:inDomain:", CFSTR("AppleICUNumberSymbols"), *MEMORY[0x1E0CB2B58]);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v16;
    objc_msgSend(v3, "decimalSeparator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v15;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v8;
    objc_msgSend(v3, "groupingSeparator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v9;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 10);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2] = v10;
    objc_msgSend(v3, "decimalSeparator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2] = v11;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), 17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[3] = v12;
    objc_msgSend(v3, "groupingSeparator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[3] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setObject:forKey:inDomain:", v14, CFSTR("AppleICUNumberSymbols"), *MEMORY[0x1E0CB2B58]);
  }

}

- (NSString)formattedNumber
{
  return self->_formattedNumber;
}

- (NSString)decimalSeparator
{
  return self->_decimalSeparator;
}

- (NSString)groupingSeparator
{
  return self->_groupingSeparator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupingSeparator, 0);
  objc_storeStrong((id *)&self->_decimalSeparator, 0);
  objc_storeStrong((id *)&self->_formattedNumber, 0);
}

@end
