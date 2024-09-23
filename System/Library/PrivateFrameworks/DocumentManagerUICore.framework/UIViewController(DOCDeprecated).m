@implementation UIViewController(DOCDeprecated)

- (uint64_t)doc_deprecated_interfaceOrientation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v8;
  NSObject *v9;

  objc_msgSend(a1, "viewIfLoaded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && (objc_msgSend(v5, "_isEmbeddedScreen") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("on external monitors, decisions should not be made using interfaceOrientation (which is always Portrait)"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    DOCLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[UIViewController(DOCDeprecated) doc_deprecated_interfaceOrientation].cold.1(v8, v9);

  }
  v6 = objc_msgSend(a1, "interfaceOrientation");

  return v6;
}

- (void)doc_deprecated_interfaceOrientation
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  _os_log_fault_impl(&dword_2172C6000, a2, OS_LOG_TYPE_FAULT, "%s", (uint8_t *)&v3, 0xCu);
}

@end
