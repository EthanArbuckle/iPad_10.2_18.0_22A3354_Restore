@implementation CalDAVPostAuditFailureTask

- (CalDAVPostAuditFailureTask)initWithResourceURL:(id)a3 reason:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CalDAVPostAuditFailureTask *v17;
  objc_super v19;

  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", a3, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queryItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  v9 = v8;
  if (v8)
    v10 = v8;
  else
    v10 = (id)objc_opt_new();
  v11 = v10;

  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("action"), CFSTR("audit-failure"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v12);

  v13 = (void *)MEMORY[0x24BDD1838];
  objc_msgSend((id)objc_opt_class(), "_stringForReason:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "queryItemWithName:value:", CFSTR("reason"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v15);

  objc_msgSend(v6, "setQueryItems:", v11);
  objc_msgSend(v6, "URL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = self;
  v19.super_class = (Class)CalDAVPostAuditFailureTask;
  v17 = -[CoreDAVPostOrPutTask initWithURL:](&v19, sel_initWithURL_, v16);

  return v17;
}

+ (id)_stringForReason:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  id v6;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Unexpected value for \"reason\" argument."), 0, v3, v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  return CFSTR("junk");
}

@end
