@implementation CBSDeviceInformationField

+ (id)fieldWithFormat:(unint64_t)a3 value:(id)a4
{
  id v5;
  CBSDeviceInformationField *v6;

  v5 = a4;
  v6 = -[CBSDeviceInformationField initWithFormat:value:]([CBSDeviceInformationField alloc], "initWithFormat:value:", a3, v5);

  return v6;
}

- (CBSDeviceInformationField)initWithFormat:(unint64_t)a3 value:(id)a4
{
  id v7;
  CBSDeviceInformationField *v8;
  CBSDeviceInformationField *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CBSDeviceInformationField;
  v8 = -[CBSDeviceInformationField init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_format = a3;
    objc_storeStrong((id *)&v8->_value, a4);
  }

  return v9;
}

- (NSString)formattedTitle
{
  unint64_t v2;
  void *v3;
  __CFString *v4;

  v2 = -[CBSDeviceInformationField format](self, "format");
  if (v2 == 2)
  {
    v4 = CFSTR("IMEI");
  }
  else if (v2 == 1)
  {
    v4 = CFSTR("MEID");
  }
  else if (v2)
  {
    v4 = CFSTR("ID");
  }
  else
  {
    +[FrameworkBundleHelper getBundle](FrameworkBundleHelper, "getBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SERIAL_NUMBER"), &stru_24FCB15E8, 0);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v4;
}

- (NSString)formattedValue
{
  unint64_t v3;
  void *v4;
  uint64_t v5;

  v3 = -[CBSDeviceInformationField format](self, "format");
  -[CBSDeviceInformationField value](self, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == 2)
  {
    -[CBSDeviceInformationField _formattedIMEI:](self, "_formattedIMEI:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  return (NSString *)v4;
}

- (id)_formattedIMEI:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  if ((unint64_t)objc_msgSend(v3, "length") >= 3)
    objc_msgSend(v3, "insertString:atIndex:", CFSTR(" "), 2);
  if ((unint64_t)objc_msgSend(v3, "length") >= 0xA)
    objc_msgSend(v3, "insertString:atIndex:", CFSTR(" "), 9);
  if ((unint64_t)objc_msgSend(v3, "length") >= 0x11)
    objc_msgSend(v3, "insertString:atIndex:", CFSTR(" "), 16);
  return v3;
}

- (BOOL)multiLineFormatted
{
  return -[CBSDeviceInformationField format](self, "format") == 2;
}

- (NSArray)formattedValuesArray
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CBSDeviceInformationField value](self, "value", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(";"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        -[CBSDeviceInformationField _formattedIMEI:](self, "_formattedIMEI:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return (NSArray *)v3;
}

- (unint64_t)format
{
  return self->_format;
}

- (void)setFormat:(unint64_t)a3
{
  self->_format = a3;
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
