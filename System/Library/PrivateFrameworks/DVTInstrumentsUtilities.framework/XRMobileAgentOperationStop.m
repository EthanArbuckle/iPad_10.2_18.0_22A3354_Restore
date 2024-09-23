@implementation XRMobileAgentOperationStop

- (void)receiveMobileAgent:(id)a3
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  v20 = a3;
  objc_msgSend_hello(v20, v3, v4, v5, v6);
  objc_msgSend_ticket(v20, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_start(v11, v12, v13, v14, v15);

  objc_msgSend_goodbye(v20, v16, v17, v18, v19);
}

@end
