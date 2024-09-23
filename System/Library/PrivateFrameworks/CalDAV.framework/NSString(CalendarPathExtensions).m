@implementation NSString(CalendarPathExtensions)

+ (id)stringWithContentsOfFile:()CalendarPathExtensions usingEncoding:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithData:encoding:", v6, a4);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE1AB50], "sharedLogging");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logHandleForAccountInfoProvider:", 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = v5;
      _os_log_impl(&dword_2096EB000, v10, OS_LOG_TYPE_ERROR, "unable to read data at path : %@", (uint8_t *)&v12, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

@end
