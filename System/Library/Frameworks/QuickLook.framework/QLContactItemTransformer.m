@implementation QLContactItemTransformer

+ (id)allowedOutputClasses
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
}

- (id)transformedContentsFromData:(id)a3 context:(id)a4 error:(id *)a5
{
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v12;

  v12 = 0;
  objc_msgSend(MEMORY[0x24BDBAD08], "contactsWithData:error:", a3, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  v8 = v7;
  if (!v7)
  {
    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(v6, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.quicklook.contactItemTransformer"), 1, 0);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  if (!a5)
    goto LABEL_9;
  v9 = objc_retainAutorelease(v7);
LABEL_4:
  v10 = 0;
  *a5 = v9;
LABEL_10:

  return v10;
}

@end
