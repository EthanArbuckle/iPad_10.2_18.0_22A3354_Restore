@implementation ACDChangeDictionaryForAccount

void ___ACDChangeDictionaryForAccount_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = ___ACDChangeDictionaryForAccount_block_invoke_2;
  v7[3] = &unk_24C7E2970;
  v6 = v3;
  v8 = v6;
  v9 = *(id *)(a1 + 32);
  ___ACDChangeDictionaryForAccount_block_invoke_2((uint64_t)v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v4, v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v6);

  }
}

__CFString *___ACDChangeDictionaryForAccount_block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  __CFString *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  if (!objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BDB42D0]))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BDB42E0]))
    {
      objc_msgSend(*(id *)(a1 + 40), "trackedProvisionedDataclasses");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BDB42A8]))
    {
      v5 = (void *)MEMORY[0x24BDD16E0];
      v6 = objc_msgSend(*(id *)(a1 + 40), "isActive");
    }
    else
    {
      if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BDB42C8]))
      {
        objc_msgSend(*(id *)(a1 + 40), "creationDate");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
      if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BDB42D8]))
      {
        objc_msgSend(*(id *)(a1 + 40), "parentAccount");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
      if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BDB42E8]))
      {
        v5 = (void *)MEMORY[0x24BDD16E0];
        v6 = objc_msgSend(*(id *)(a1 + 40), "isVisible");
      }
      else
      {
        if (!objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *MEMORY[0x24BDB42F0]))
        {
          NSSelectorFromString(*(NSString **)(a1 + 32));
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            v4 = CFSTR("<failed>");
            return v4;
          }
          objc_msgSend(*(id *)(a1 + 40), "valueForKey:", *(_QWORD *)(a1 + 32));
          v7 = objc_claimAutoreleasedReturnValue();
          goto LABEL_13;
        }
        v5 = (void *)MEMORY[0x24BDD16E0];
        v6 = objc_msgSend(*(id *)(a1 + 40), "isWarmingUp");
      }
    }
    objc_msgSend(v5, "numberWithBool:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v4 = (__CFString *)v7;
    return v4;
  }
  objc_msgSend(*(id *)(a1 + 40), "trackedEnabledDataclasses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
  v3 = v2;
  v4 = (__CFString *)objc_msgSend(v2, "copy");

  return v4;
}

void ___ACDChangeDictionaryForAccount_block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, v5);

  }
}

@end
