@implementation MKFCKSharedUserPrivateRoot

+ (unint64_t)cloudStoreTypes
{
  return 1;
}

+ (id)rootKeyPath
{
  return 0;
}

+ (id)createWithHomeModelID:(id)a3 persistentStore:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithContext:", v8);
  objc_msgSend(v8, "assignObject:toPersistentStore:", v11, v9);

  objc_msgSend(v11, "setModelID:", v10);
  objc_msgSend(v11, "setHomeModelID:", v10);

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWriterTimestamp:", v12);

  MKFCKModelCurrentWriterVersionString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWriterVersion:", v13);

  return v11;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFCKSharedUserPrivateRoot"));
}

@end
