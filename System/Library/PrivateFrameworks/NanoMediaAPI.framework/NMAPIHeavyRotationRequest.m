@implementation NMAPIHeavyRotationRequest

- (id)urlComponentsWithStoreURLBag:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;
  void *v16;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x24BDAC8D0];
  v15.receiver = self;
  v15.super_class = (Class)NMAPIHeavyRotationRequest;
  -[NMAPIRequest urlComponentsWithStoreURLBag:error:](&v15, sel_urlComponentsWithStoreURLBag_error_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD17C8];
  v17[0] = CFSTR("/v1/me");
  v17[1] = CFSTR("history");
  v17[2] = CFSTR("heavy-rotation");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathWithComponents:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPath:", v7);

  objc_msgSend(v4, "queryItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x24BDD1838]);
  objc_msgSend(&unk_24DD2C770, "componentsJoinedByString:", CFSTR(","));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("types"), v10);
  v16 = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setQueryItems:", v13);

  return v4;
}

- (Class)responseParserClass
{
  return (Class)objc_opt_class();
}

@end
