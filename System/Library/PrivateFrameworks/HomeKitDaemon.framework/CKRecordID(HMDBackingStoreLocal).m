@implementation CKRecordID(HMDBackingStoreLocal)

- (id)encodeForKey
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "zoneID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ownerName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "zoneID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "zoneName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "recordName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@/%@/%@"), v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)parseFromString:()HMDBackingStoreLocal
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("/"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 3)
  {
    v4 = objc_alloc(MEMORY[0x24BDB91F8]);
    objc_msgSend(v3, "objectAtIndex:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "initWithZoneName:ownerName:", v5, v6);

    v8 = objc_alloc(MEMORY[0x24BDB91E8]);
    objc_msgSend(v3, "objectAtIndex:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithRecordName:zoneID:", v9, v7);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
