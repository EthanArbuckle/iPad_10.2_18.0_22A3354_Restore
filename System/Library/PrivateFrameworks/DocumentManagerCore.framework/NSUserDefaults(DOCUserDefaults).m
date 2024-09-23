@implementation NSUserDefaults(DOCUserDefaults)

- (id)doc_roleSpecificKeyForKey:()DOCUserDefaults configuration:
{
  id v5;
  id v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "hostIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(CFSTR("com.apple.DocumentsApp"), "isEqualToString:", v7);

  if (v8)
  {
    v9 = v5;
  }
  else
  {
    objc_msgSend(v6, "roleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "hostIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v10)
    {
      objc_msgSend(v6, "roleIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@-%@-%@"), v13, v14, v5);
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@-%@"), v12, v5);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  return v9;
}

- (void)doc_setObject:()DOCUserDefaults forRoleKey:configuation:
{
  id v8;
  id v9;

  v8 = a3;
  objc_msgSend(a1, "doc_roleSpecificKeyForKey:configuration:", a4, a5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKey:", v8, v9);

}

@end
