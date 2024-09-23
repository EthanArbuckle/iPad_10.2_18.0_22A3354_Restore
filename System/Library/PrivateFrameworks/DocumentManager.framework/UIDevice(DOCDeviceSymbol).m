@implementation UIDevice(DOCDeviceSymbol)

- (__CFString)doc_symbolName
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  BOOL v5;
  NSObject **v6;
  NSObject *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  int HasHomeButton;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  NSObject **v16;
  NSObject *v17;
  id v18;

  objc_msgSend(MEMORY[0x24BDF8240], "_typeOfCurrentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(MEMORY[0x24BE51AB8], "symbolForTypeIdentifier:error:", v1, &v18);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v18;
  v4 = v3;
  if (v2)
    v5 = v3 == 0;
  else
    v5 = 0;
  if (!v5)
  {
    v6 = (NSObject **)MEMORY[0x24BE2DF90];
    v7 = *MEMORY[0x24BE2DF90];
    if (!*MEMORY[0x24BE2DF90])
    {
      DOCInitLogging();
      v7 = *v6;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[UIDevice(DOCDeviceSymbol) doc_symbolName].cold.2((uint64_t)v1, (uint64_t)v4, v7);
  }
  objc_msgSend(v2, "name");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "model");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    HasHomeButton = DOCDeviceHasHomeButton();
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("iPhone")) & 1) != 0
      || objc_msgSend(v10, "isEqualToString:", CFSTR("iPod touch")))
    {
      v12 = CFSTR("iphone.homebutton");
      if (!HasHomeButton)
        v12 = CFSTR("iphone");
    }
    else
    {
      if (!objc_msgSend(v10, "isEqualToString:", CFSTR("iPad")))
      {
        if ((objc_msgSend(v10, "isEqualToString:", CFSTR("Apple Vision")) & 1) != 0)
        {
          v13 = CFSTR("visionpro");
        }
        else
        {
          v16 = (NSObject **)MEMORY[0x24BE2DF90];
          v17 = *MEMORY[0x24BE2DF90];
          if (!*MEMORY[0x24BE2DF90])
          {
            DOCInitLogging();
            v17 = *v16;
          }
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            -[UIDevice(DOCDeviceSymbol) doc_symbolName].cold.1((uint64_t)v10, v17);
          v13 = 0;
        }
        goto LABEL_15;
      }
      v12 = CFSTR("ipad");
      if (HasHomeButton)
        v12 = CFSTR("ipad.homebutton");
    }
    v13 = v12;
LABEL_15:
    if (v13)
      v14 = v13;
    else
      v14 = CFSTR("iphone");
    v8 = v14;

  }
  return v8;
}

- (void)doc_symbolName
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_209052000, log, OS_LOG_TYPE_ERROR, "Unable to get ISSymbol for UTI: %@ Error: %@", (uint8_t *)&v3, 0x16u);
}

@end
