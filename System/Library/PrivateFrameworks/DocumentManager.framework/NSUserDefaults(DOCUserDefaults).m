@implementation NSUserDefaults(DOCUserDefaults)

- (void)doc_setObject:()DOCUserDefaults forRoleKey:configuation:
{
  id v8;
  id v9;

  v8 = a3;
  objc_msgSend(a1, "doc_roleSpecificKeyForKey:configuration:", a4, a5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKey:", v8, v9);

}

- (id)doc_roleSpecificKeyForKey:()DOCUserDefaults configuration:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v5 = a3;
  v6 = a4;
  v7 = (void *)*MEMORY[0x24BE2DE50];
  objc_msgSend(v6, "hostIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "isEqualToString:", v8);

  if ((_DWORD)v7)
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

@end
