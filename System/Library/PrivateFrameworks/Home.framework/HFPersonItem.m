@implementation HFPersonItem

- (HFPersonItem)initWithPerson:(id)a3 fromPersonManager:(id)a4 home:(id)a5
{
  id v9;
  id v10;
  HFPersonItem *v11;
  HFPersonItem *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HFPersonItem;
  v11 = -[HFFetchedHomeKitObjectItem initWithHomeKitObject:](&v14, sel_initWithHomeKitObject_, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_personManager, a4);
    objc_storeStrong((id *)&v12->_home, a5);
  }

  return v12;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)HFPersonItem;
  -[HFItem description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFPersonItem person](self, "person");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFPersonItem personManager](self, "personManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ person: %@ manager: %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HFPersonItem person](self, "person");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFPersonItem personManager](self, "personManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFPersonItem home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithPerson:fromPersonManager:home:", v5, v6, v7);

  objc_msgSend(v8, "copyLatestResultsFromItem:", self);
  return v8;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HFPersonItem;
  -[HFFetchedHomeKitObjectItem _subclass_updateWithOptions:](&v11, sel__subclass_updateWithOptions_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__HFPersonItem__subclass_updateWithOptions___block_invoke;
  v9[3] = &unk_1EA726DC0;
  v9[4] = self;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __44__HFPersonItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  HFPersonItemUpdateRequest *v4;
  void *v5;
  void *v6;
  void *v7;
  HFPersonItemUpdateRequest *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  v4 = [HFPersonItemUpdateRequest alloc];
  objc_msgSend(*(id *)(a1 + 32), "person");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "personManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HFPersonItemUpdateRequest initWithPerson:personManager:home:](v4, "initWithPerson:personManager:home:", v5, v6, v7);

  -[HFPersonItemUpdateRequest updateWithOptions:](v8, "updateWithOptions:", *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __44__HFPersonItem__subclass_updateWithOptions___block_invoke_2;
  v13[3] = &unk_1EA7289C8;
  v14 = v3;
  v10 = v3;
  objc_msgSend(v9, "flatMap:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __44__HFPersonItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addResultsFromOutcome:", a2);
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(a1 + 32));
}

- (id)_homeKitObjectFetch
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HFPersonItem personManager](self, "personManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFPersonItem person](self, "person");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_personWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HMPersonManager)personManager
{
  return self->_personManager;
}

- (HMHome)home
{
  return self->_home;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_personManager, 0);
}

@end
