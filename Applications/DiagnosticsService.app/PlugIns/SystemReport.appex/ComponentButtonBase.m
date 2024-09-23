@implementation ComponentButtonBase

- (ComponentButtonBase)init
{
  ComponentButtonBase *v2;
  ComponentButtonBase *v3;
  uint64_t v4;
  NSArray *buttonsDetected;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ComponentButtonBase;
  v2 = -[ComponentButtonBase init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[ComponentButtonBase buttonsDetected](v2, "buttonsDetected"));
    buttonsDetected = v3->_buttonsDetected;
    v3->_buttonsDetected = (NSArray *)v4;

  }
  return v3;
}

- (id)parseStringToArray:(char *)a3 length:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  char *v8;
  void *v9;

  v6 = objc_alloc_init((Class)NSMutableArray);
  if (a4)
  {
    v7 = 0;
    v8 = a3;
    do
    {
      if (a3[v7])
      {
        ++v7;
      }
      else
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v8));
        objc_msgSend(v6, "addObject:", v9);

        v8 = &a3[++v7];
      }
    }
    while (v7 != a4);
  }
  return v6;
}

- (NSArray)buttonsDetected
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  __CFDictionary *v9;
  uint8_t v10[16];
  CFMutableDictionaryRef properties;
  int v12;
  io_registry_entry_t entry[30];

  v12 = 0;
  if (FindDevicesWithProp("IOService:name", "buttons", (uint64_t)entry, 30, &v12))
    return (NSArray *)0;
  if (!v12)
  {
    v7 = DiagnosticLogHandleForCategory(6);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(properties) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Error: IOService:buttons is not found in IORegistry", (uint8_t *)&properties, 2u);
    }

    return (NSArray *)0;
  }
  properties = 0;
  if (IORegistryEntryCreateCFProperties(entry[0], &properties, 0, 0))
  {
    v4 = DiagnosticLogHandleForCategory(6);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Error: IORegistryEntryCreateCFProperties failed", v10, 2u);
    }
    v6 = 0;
  }
  else
  {
    v9 = properties;
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("button-names"))));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentButtonBase parseStringToArray:length:](self, "parseStringToArray:length:", -[NSObject bytes](v5, "bytes"), -[NSObject length](v5, "length")));
    CFRelease(properties);

  }
  return (NSArray *)v6;
}

- (void)setButtonsDetected:(id)a3
{
  objc_storeStrong((id *)&self->_buttonsDetected, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonsDetected, 0);
}

@end
