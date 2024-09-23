@implementation NPKRemotePassActionRequest

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NPKRemotePassActionRequest;
  -[NPKRemotePassAction description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKRemotePassActionRequest identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKRemotePassActionRequest action](self, "action");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" (ID:%@, action:%@)"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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
      v6 = "-[NPKRemotePassActionRequest identifier]";
      v7 = 2082;
      v8 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKRemotePassActionRequest.m";
      v9 = 2048;
      v10 = 29;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Subclasses must override)", (uint8_t *)&v5, 0x20u);
    }

  }
  _NPKAssertAbort();
}

- (PKPaymentPassAction)action
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
      v6 = "-[NPKRemotePassActionRequest action]";
      v7 = 2082;
      v8 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKRemotePassActionRequest.m";
      v9 = 2048;
      v10 = 35;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Subclasses must override)", (uint8_t *)&v5, 0x20u);
    }

  }
  _NPKAssertAbort();
}

- (NSString)actionText
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[NPKRemotePassActionRequest action](self, "action");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(v2, "confirmationTitle");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSString *)v6;
}

@end
