@implementation APKInspectorLogger

+ (id)inspectorLogger
{
  dispatch_once_t predicate;

  predicate = 0;
  dispatch_once(&predicate, &__block_literal_global_0);
  return (id)inspectorLogger_logger;
}

void __37__APKInspectorLogger_inspectorLogger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)objc_msgSend(CFSTR("com.apple.AirPlayKit"), "cStringUsingEncoding:", 4), "inspector");
  v1 = (void *)inspectorLogger_logger;
  inspectorLogger_logger = (uint64_t)v0;

}

+ (void)log:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "inspectorLogger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_22A61E000, v4, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v5, 0xCu);
  }

}

@end
