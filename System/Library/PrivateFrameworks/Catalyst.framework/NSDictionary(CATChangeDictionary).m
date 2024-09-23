@implementation NSDictionary(CATChangeDictionary)

- (id)cat_calculateAddedObjects
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v19;

  objc_msgSend(a1, "valueForKey:", *MEMORY[0x24BDD0E68]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntValue");

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSDictionary+ChangeDictionary.m"), 18, CFSTR("This is not a KVO change dictionary"));

  }
  objc_msgSend(a1, "valueForKey:", *MEMORY[0x24BDD0E70]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_msgSend(MEMORY[0x24BDBCEF8], "null"), v7 = objc_claimAutoreleasedReturnValue(), v6 == (void *)v7))
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    if (!v6)
      goto LABEL_12;
  }
  else
  {
    v8 = (void *)v7;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = v6;
    }
    v10 = v9;
  }

LABEL_12:
  objc_msgSend(a1, "valueForKey:", *MEMORY[0x24BDD0E80]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v11 != (void *)v12)
    {
      v13 = (void *)v12;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v11);
        v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = v11;
      }
      v15 = v14;
      goto LABEL_20;
    }
  }
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11;
  if (v11)
LABEL_20:

  if ((v5 - 2) >= 3)
  {
    if (v5 == 1)
    {
      v16 = (void *)objc_msgSend(v10, "mutableCopy");
      objc_msgSend(v16, "minusSet:", v15);
      v17 = objc_msgSend(v16, "copy");

      v10 = (void *)v17;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSDictionary+ChangeDictionary.m"), 40, CFSTR("Unexpected change type from a KVO'd collection"));
    }

  }
  return v10;
}

- (id)cat_calculateRemovedObjects
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v19;

  objc_msgSend(a1, "valueForKey:", *MEMORY[0x24BDD0E68]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntValue");

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSDictionary+ChangeDictionary.m"), 50, CFSTR("This is not a KVO change dictionary"));

  }
  objc_msgSend(a1, "valueForKey:", *MEMORY[0x24BDD0E70]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_msgSend(MEMORY[0x24BDBCEF8], "null"), v7 = objc_claimAutoreleasedReturnValue(), v6 == (void *)v7))
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    if (!v6)
      goto LABEL_12;
  }
  else
  {
    v8 = (void *)v7;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = v6;
    }
    v10 = v9;
  }

LABEL_12:
  objc_msgSend(a1, "valueForKey:", *MEMORY[0x24BDD0E80]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v11 != (void *)v12)
    {
      v13 = (void *)v12;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v11);
        v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = v11;
      }
      v15 = v14;
      goto LABEL_20;
    }
  }
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11;
  if (v11)
LABEL_20:

  if ((v5 - 2) >= 3)
  {
    if (v5 == 1)
    {
      v16 = (void *)objc_msgSend(v15, "mutableCopy");
      objc_msgSend(v16, "minusSet:", v10);
      v17 = objc_msgSend(v16, "copy");

      v15 = (void *)v17;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSDictionary+ChangeDictionary.m"), 72, CFSTR("Unexpected change type from a KVO'd collection"));
    }

  }
  return v15;
}

@end
