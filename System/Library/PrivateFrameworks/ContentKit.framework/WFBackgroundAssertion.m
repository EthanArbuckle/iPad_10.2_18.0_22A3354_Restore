@implementation WFBackgroundAssertion

+ (id)backgroundAssertionWithName:(id)a3 expirationHandler:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  getWFBackgroundAssertionLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "+[WFBackgroundAssertion backgroundAssertionWithName:expirationHandler:]";
    v23 = 2114;
    v24 = v5;
    _os_log_impl(&dword_20BBAD000, v7, OS_LOG_TYPE_INFO, "%s Starting background assertion for %{public}@", buf, 0x16u);
  }

  v8 = (void *)objc_opt_class();
  +[WFApplicationContext sharedContext](WFApplicationContext, "sharedContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applicationOrNil");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    +[WFApplicationContext sharedContext](WFApplicationContext, "sharedContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "applicationState");

    if (v13 != 2)
      v8 = (void *)objc_opt_class();
  }
  else
  {

  }
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __71__WFBackgroundAssertion_backgroundAssertionWithName_expirationHandler___block_invoke;
  v18[3] = &unk_24C4E00C0;
  v19 = v5;
  v20 = v6;
  v14 = v6;
  v15 = v5;
  objc_msgSend(v8, "backgroundAssertionWithName:expirationHandler:", v15, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

uint64_t __71__WFBackgroundAssertion_backgroundAssertionWithName_expirationHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t result;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  getWFBackgroundAssertionLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 136315394;
    v6 = "+[WFBackgroundAssertion backgroundAssertionWithName:expirationHandler:]_block_invoke";
    v7 = 2114;
    v8 = v3;
    _os_log_impl(&dword_20BBAD000, v2, OS_LOG_TYPE_INFO, "%s Background assertion expired for %{public}@", (uint8_t *)&v5, 0x16u);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
