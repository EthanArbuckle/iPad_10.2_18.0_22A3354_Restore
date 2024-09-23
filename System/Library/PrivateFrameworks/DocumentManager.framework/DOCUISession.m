@implementation DOCUISession

+ (UIWindow)keyWindow
{
  return (UIWindow *)objc_msgSend((id)*MEMORY[0x24BEBDF78], "keyWindow");
}

+ (void)performAfterCATransactionCommits:(id)a3
{
  objc_msgSend((id)*MEMORY[0x24BEBDF78], "_performBlockAfterCATransactionCommits:", a3);
}

+ (id)shared
{
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, &__block_literal_global_0);
  return 0;
}

void __22__DOCUISession_shared__block_invoke()
{
  DOCUISession *v0;
  void *v1;

  v0 = objc_alloc_init(DOCUISession);
  v1 = (void *)shared_session;
  shared_session = (uint64_t)v0;

}

+ (NSString)defaultContentSizeCategory
{
  return (NSString *)objc_msgSend((id)*MEMORY[0x24BEBDF78], "preferredContentSizeCategory");
}

+ (UIWindow)anyWindowPreferingKeyWindow
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a1, "keyWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend((id)*MEMORY[0x24BEBDF78], "windows");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (UIWindow *)v4;
}

+ (id)windowWithRootViewController:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend((id)*MEMORY[0x24BEBDF78], "windows", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v8, "rootViewController");
        v9 = (id)objc_claimAutoreleasedReturnValue();

        if (v9 == v3)
        {
          v5 = v8;
          goto LABEL_11;
        }
      }
      v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

@end
