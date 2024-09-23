@implementation HMCRedirectorTuple

- (void)cancel
{
  HMCRedirectorTuple *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  HMCRedirectorTuple *v9;
  id v10;
  id v11;
  void *v12;
  HMCRedirectorTuple *v13;
  id v14;
  id v15;
  void *v16;
  HMCRedirectorTuple *v17;
  id v18;
  id v19;
  void *v20;
  HMCRedirectorTuple *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id WeakRetained;
  _QWORD v27[4];
  HMCRedirectorTuple *v28;
  id v29;
  _QWORD v30[4];
  HMCRedirectorTuple *v31;
  id v32;
  _QWORD v33[4];
  HMCRedirectorTuple *v34;
  id v35;
  _QWORD v36[4];
  HMCRedirectorTuple *v37;
  id v38;
  _QWORD v39[4];
  HMCRedirectorTuple *v40;
  id v41;

  if (self && (WeakRetained = objc_loadWeakRetained((id *)&self->_owner), v3 = self, WeakRetained))
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock_with_options();
    v6 = *((id *)WeakRetained + 3);
    objc_msgSend(v6, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x24BDAC760];
    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 3221225472;
    v39[2] = __29__HMCRedirector_removeTuple___block_invoke;
    v39[3] = &unk_24E798EE8;
    v9 = v3;
    v40 = v9;
    v10 = v4;
    v41 = v10;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v39);

    v11 = *((id *)WeakRetained + 4);
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v8;
    v36[1] = 3221225472;
    v36[2] = __29__HMCRedirector_removeTuple___block_invoke_2;
    v36[3] = &unk_24E798EE8;
    v13 = v9;
    v37 = v13;
    v14 = v10;
    v38 = v14;
    objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v36);

    v15 = *((id *)WeakRetained + 6);
    objc_msgSend(v15, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v8;
    v33[1] = 3221225472;
    v33[2] = __29__HMCRedirector_removeTuple___block_invoke_3;
    v33[3] = &unk_24E798EE8;
    v17 = v13;
    v34 = v17;
    v18 = v14;
    v35 = v18;
    objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v33);

    v19 = *((id *)WeakRetained + 5);
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v8;
    v30[1] = 3221225472;
    v30[2] = __29__HMCRedirector_removeTuple___block_invoke_4;
    v30[3] = &unk_24E798F10;
    v21 = v17;
    v31 = v21;
    v22 = v5;
    v32 = v22;
    objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v30);

    v23 = *((id *)WeakRetained + 7);
    objc_msgSend(v23, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v8;
    v27[1] = 3221225472;
    v27[2] = __29__HMCRedirector_removeTuple___block_invoke_5;
    v27[3] = &unk_24E798F10;
    v28 = v21;
    v25 = v22;
    v29 = v25;
    objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v27);

    __removeRegistrations(WeakRetained, v18, v25);
    os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);

  }
  else
  {
    WeakRetained = 0;
  }

}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  const char *selector;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMCRedirectorTuple target]((id *)&self->super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Target"), v4);
  v12[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  if (self)
    selector = self->_selector;
  else
    selector = 0;
  NSStringFromSelector(selector);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Selector"), v8);
  v12[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *selector;
  void *v7;
  void *v8;

  -[HMCRedirectorTuple target]((id *)&self->super.super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (self)
    selector = self->_selector;
  else
    selector = 0;
  NSStringFromSelector(selector);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<HMCRedirectorTuple -[%@ %@]>"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_destroyWeak((id *)&self->_owner);
}

- (id)target
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 2);
  return WeakRetained;
}

- (HMCRedirectorStrongTuple)strongify
{
  HMCRedirectorStrongTuple *v1;
  HMCRedirectorStrongTuple *v2;
  HMCRedirectorStrongTuple *v3;
  id *v4;
  uint64_t v5;
  id target;
  objc_super v8;

  v1 = a1;
  if (a1)
  {
    v2 = [HMCRedirectorStrongTuple alloc];
    v3 = v1;
    if (v2)
    {
      v8.receiver = v2;
      v8.super_class = (Class)HMCRedirectorStrongTuple;
      v4 = -[HMCRedirectorStrongTuple init](&v8, sel_init);
      v2 = (HMCRedirectorStrongTuple *)v4;
      if (!v4)
      {
LABEL_6:
        v2 = v2;
        v1 = v2;
LABEL_8:

        return v1;
      }
      objc_storeStrong(v4 + 1, v1);
      -[HMCRedirectorTuple target]((id *)&v3->super.super.isa);
      v5 = objc_claimAutoreleasedReturnValue();
      target = v2->_target;
      v2->_target = (id)v5;

      if (v2->_target)
      {
        v2->_selector = v3->_selector;
        goto LABEL_6;
      }
    }
    v1 = 0;
    goto LABEL_8;
  }
  return v1;
}

@end
