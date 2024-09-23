@implementation HMDCoreDataCloudTransformDevice

+ (BOOL)exportInsertWithObjectID:(id)a3 additionalUpdates:(id)a4 context:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;

  v8 = (void *)MEMORY[0x24BDBCF20];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "exportUpdateWithObjectID:updatedProperties:additionalUpdates:context:", v11, v12, v10, v9);

  return (char)a1;
}

+ (BOOL)exportUpdateWithObjectID:(id)a3 updatedProperties:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;

  objc_msgSend(a6, "objectWithID:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resident");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = HMFEqualObjects();

    if ((v11 & 1) == 0)
    {
      objc_msgSend(v6, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setName:", v12);

    }
  }

  return 1;
}

+ (BOOL)exportDeleteWithObjectID:(id)a3 modelID:(id)a4 additionalUpdates:(id)a5 context:(id)a6
{
  return 1;
}

@end
