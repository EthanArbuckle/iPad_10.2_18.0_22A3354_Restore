@implementation HMService(AccessoryLikeObjectDataSource)

- (id)hf_rootAccessoryLikeHomeKitObject
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;

  objc_msgSend(a1, "hf_serviceGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
  {
    objc_msgSend(a1, "accessory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "hf_showAsAccessoryTile") & 1) != 0)
    {
      objc_msgSend(a1, "accessory");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "hf_isHomePod");

      if (v7)
        goto LABEL_11;
    }
    else
    {

    }
    objc_msgSend(a1, "accessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "hf_showAsAccessoryTile") & 1) != 0)
    {
      objc_msgSend(a1, "accessory");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "hf_primaryService");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "serviceType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "serviceType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToString:", v12);

      if (v13)
      {
        objc_msgSend(a1, "accessory");
        v4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
    }
    else
    {

    }
LABEL_11:
    v4 = a1;
    goto LABEL_12;
  }
  objc_msgSend(v2, "hf_rootAccessoryLikeHomeKitObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
  v14 = v4;

  return v14;
}

@end
