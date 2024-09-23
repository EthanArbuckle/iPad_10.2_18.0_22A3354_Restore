@implementation CKMergeableDeltaMetadata(Serialization)

+ (id)encodeMergeableDeltaMetadata:()Serialization withError:
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v10;

  v10 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "data");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  if (a4 && v6)
    *a4 = objc_retainAutorelease(v6);

  return v8;
}

+ (id)decodeMergeableDeltaMetadata:()Serialization withError:
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v12;

  v5 = (void *)MEMORY[0x24BDD1620];
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = a3;
  objc_msgSend(v6, "setWithObjects:", objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v5, "unarchivedObjectOfClasses:fromData:error:", v8, v7, &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v12;
  if (a4 && v10)
    *a4 = objc_retainAutorelease(v10);

  return v9;
}

@end
