@implementation LARight

- (id)_authOptionsWithLocalizedReason:(void *)a3 presentationContext:
{
  __CFString *v5;
  id v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *MEMORY[0x24BE60630]);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = &stru_24FDCE800;
    if (v5)
      v9 = v5;
    v13 = v7;
    v14[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    a1 = (void *)objc_msgSend(v10, "mutableCopy");

    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *MEMORY[0x24BE60690]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "setObject:forKeyedSubscript:", v6, v11);

    }
  }

  return a1;
}

@end
