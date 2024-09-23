@implementation CLKUILoggingObjectForDomain

void ___CLKUILoggingObjectForDomain_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  os_log_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", *(_QWORD *)(a1 + 40), 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "substringFromIndex:", objc_msgSend(CFSTR("CLKUILoggingDomain"), "length"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_retainAutorelease(v3);
  v4 = os_log_create("com.apple.ClockKitUI", (const char *)objc_msgSend(v7, "cStringUsingEncoding:", 4));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = (void *)_CLKUILoggingObjectForDomain___logObjects[v5];
  _CLKUILoggingObjectForDomain___logObjects[v5] = v4;

}

@end
