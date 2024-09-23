@implementation NSDictionary(AMSUIWeb)

- (id)ams_JSONStringWithError:()AMSUIWeb
{
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;
  id v11;

  if ((objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", a1) & 1) != 0)
  {
    v11 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", a1, 0, &v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v11;
    if (v5)
    {
      v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v5, 4);
      if (v7)
      {
        v8 = (void *)v7;
        if (!v6)
          goto LABEL_17;
        goto LABEL_14;
      }
      AMSError();
      v10 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v10;
    }
    if (v6)
    {
      v8 = 0;
    }
    else
    {
      AMSError();
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v8 = 0;
      if (!v6)
      {
LABEL_17:

        return v8;
      }
    }
LABEL_14:
    if (a3)
      *a3 = objc_retainAutorelease(v6);

    v8 = 0;
    goto LABEL_17;
  }
  if (a3)
  {
    AMSError();
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

@end
