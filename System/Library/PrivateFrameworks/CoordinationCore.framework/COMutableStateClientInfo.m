@implementation COMutableStateClientInfo

- (COMutableStateClientInfo)initWithSuite:(id)a3 clusters:(id)a4 state:(id)a5 observers:(id)a6
{
  id v11;
  id v12;
  COMutableStateClientInfo *v13;
  COMutableStateClientInfo *v14;
  objc_super v16;

  v11 = a5;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)COMutableStateClientInfo;
  v13 = -[COStateClientInfo initWithSuite:clusters:](&v16, sel_initWithSuite_clusters_, a3, a4);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->super._state, a5);
    objc_storeStrong((id *)&v14->super._observers, a6);
  }

  return v14;
}

- (void)removeKeyPath:(id)a3 cluster:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[COMutableStateClientInfo state](self, "state");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  if (v9)
  {
    objc_msgSend(v9, "removeObjectForKey:", v12);
    -[COMutableStateClientInfo state](self, "state");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    objc_msgSend(v11, "setObject:forKey:", v9, v6);
    -[COMutableStateClientInfo setState:](self, "setState:", v11);

  }
}

- (void)setValue:(id)a3 forKeyPath:(id)a4 cluster:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a5;
  v8 = a4;
  v9 = a3;
  -[COMutableStateClientInfo state](self, "state");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[COMutableStateClientInfo state](self, "state");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v14, "setObject:forKey:", v9, v8);
  -[COMutableStateClientInfo state](self, "state");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  objc_msgSend(v16, "setObject:forKey:", v14, v17);
  -[COMutableStateClientInfo setState:](self, "setState:", v16);

}

- (void)addObserverWithPredicate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[COMutableStateClientInfo observers](self, "observers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "objectForKey:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allowEvaluation");
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v6, "intValue") + 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v7, v8);

  }
  else
  {
    objc_msgSend(v5, "setObject:forKey:", &unk_24D4CF3D8, v8);
  }
  -[COMutableStateClientInfo setObservers:](self, "setObservers:", v5);

}

- (void)removeObserverWithPredicate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[COMutableStateClientInfo observers](self, "observers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "objectForKey:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "intValue") == 1)
    {
      objc_msgSend(v5, "removeObjectForKey:", v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v7, "intValue") - 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v8, v9);

    }
    -[COMutableStateClientInfo setObservers:](self, "setObservers:", v5);
  }

}

- (NSDictionary)observers
{
  return self->super._observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->super._observers, a3);
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->super._state, a3);
}

- (NSDictionary)state
{
  return self->super._state;
}

@end
