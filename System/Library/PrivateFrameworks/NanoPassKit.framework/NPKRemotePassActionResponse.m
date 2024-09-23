@implementation NPKRemotePassActionResponse

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NPKRemotePassActionResponse;
  -[NPKRemotePassAction description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKRemotePassActionResponse identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" (ID:%@, result:%d)"), v4, -[NPKRemotePassActionResponse result](self, "result"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)identifier
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446722;
      v6 = "-[NPKRemotePassActionResponse identifier]";
      v7 = 2082;
      v8 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKRemotePassActionResponse.m";
      v9 = 2048;
      v10 = 63;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Subclasses must override)", (uint8_t *)&v5, 0x20u);
    }

  }
  _NPKAssertAbort();
}

- (int)result
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446722;
      v6 = "-[NPKRemotePassActionResponse result]";
      v7 = 2082;
      v8 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKRemotePassActionResponse.m";
      v9 = 2048;
      v10 = 69;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Subclasses must override)", (uint8_t *)&v5, 0x20u);
    }

  }
  _NPKAssertAbort();
}

- (PKCurrencyAmount)currencyAmount
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446722;
      v6 = "-[NPKRemotePassActionResponse currencyAmount]";
      v7 = 2082;
      v8 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKRemotePassActionResponse.m";
      v9 = 2048;
      v10 = 75;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Subclasses must override)", (uint8_t *)&v5, 0x20u);
    }

  }
  _NPKAssertAbort();
}

@end
