@implementation SGDelivery(Building)

+ (id)deliveryForEntity:()Building store:
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  id v16;

  v7 = a4;
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0D198C8];
    v9 = a3;
    objc_msgSend(v9, "duplicateKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sourceKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "originForDuplicateKey:sourceKey:store:", v10, v11, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = (void *)MEMORY[0x1E0CB3488];
    v16 = a3;
    objc_msgSend(v15, "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGDelivery+Building.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("store"));
    v12 = 0;
  }

  objc_msgSend(a1, "deliveryForEntity:origin:", a3, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)deliveryForEntity:()Building origin:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "duplicateKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deliveryKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "duplicateKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "parentKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "externalKey");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_9;
  v12 = (void *)v11;
  objc_msgSend(v6, "externalKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");

  if (!v14)
    goto LABEL_9;
  if (objc_msgSend(v10, "entityType") == 5)
  {
    objc_msgSend(v6, "externalKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByAddingPercentEncodingWithAllowedCharacters:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x1E0C99E98];
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("message:%@"), v17);
    objc_msgSend(v18, "URLWithString:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (objc_msgSend(v10, "entityType") != 13)
    {
LABEL_9:
      v26 = 0;
      goto LABEL_10;
    }
    v21 = (void *)MEMORY[0x1E0D197D8];
    objc_msgSend(v6, "externalKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "urlForEKEventFromTextMessageWithUniqueIdentifier:", v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (!v20)
    goto LABEL_9;
  v22 = objc_alloc(MEMORY[0x1E0D197D0]);
  objc_msgSend(v5, "recordId");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v8, "provider");
  objc_msgSend(v8, "trackingNumber");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v22, "initWithRecordId:origin:parentURL:provider:trackingNumber:", v23, v6, v20, v24, v25);

LABEL_10:
  return v26;
}

@end
