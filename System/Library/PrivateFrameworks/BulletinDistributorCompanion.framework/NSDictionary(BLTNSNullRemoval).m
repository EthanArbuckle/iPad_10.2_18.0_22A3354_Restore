@implementation NSDictionary(BLTNSNullRemoval)

- (id)objectWithNoNSNulls:()BLTNSNullRemoval
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *);
  void *v16;
  id v17;
  id v18;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a3 = v5;
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __54__NSDictionary_BLTNSNullRemoval__objectWithNoNSNulls___block_invoke;
  v16 = &unk_24D763DA8;
  v7 = v6;
  v17 = v7;
  v8 = v5;
  v18 = v8;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", &v13);
  v9 = objc_msgSend(v8, "count", v13, v14, v15, v16);
  if (a3 && !v9)
    *a3 = 0;
  v10 = v18;
  v11 = v7;

  return v11;
}

- (id)objectWithNSNulls:()BLTNSNullRemoval
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = a1;
  if (objc_msgSend(v4, "count"))
  {
    v6 = (id)objc_msgSend(v5, "mutableCopy");

    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __52__NSDictionary_BLTNSNullRemoval__objectWithNSNulls___block_invoke;
    v8[3] = &unk_24D762798;
    v9 = v6;
    v5 = v6;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

  }
  return v5;
}

- (uint64_t)objectSentinelNull
{
  return 0;
}

@end
