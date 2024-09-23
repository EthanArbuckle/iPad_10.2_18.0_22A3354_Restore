@implementation UIResponder(SUUIExtensions)

- (uint64_t)_SUUIView
{
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  void *v8;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldLog");
  if (objc_msgSend(v4, "shouldLogToDisk"))
    v6 = v5 | 2;
  else
    v6 = v5;
  objc_msgSend(v4, "OSLogObject");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    v6 &= 2u;
  if (!v6)
    goto LABEL_9;
  NSStringFromSelector(a2);
  v11 = 138412546;
  v12 = a1;
  v13 = 2112;
  v14 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = 22;
  v8 = (void *)_os_log_send_and_compose_impl();

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 4, &v11, v10);
    v7 = objc_claimAutoreleasedReturnValue();
    free(v8);
    SSFileLog();
LABEL_9:

  }
  return 0;
}

@end
