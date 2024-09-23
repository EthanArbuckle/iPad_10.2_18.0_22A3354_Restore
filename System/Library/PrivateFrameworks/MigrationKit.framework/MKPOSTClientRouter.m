@implementation MKPOSTClientRouter

- (void)server:(id)a3 didReceiveRequest:(id)a4 response:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  MKClient *v14;
  id WeakRetained;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;

  v6 = a4;
  objc_msgSend(v6, "body");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    v23 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v7, 0, &v23);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v23)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("brand"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", CFSTR("model"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", CFSTR("name"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", CFSTR("os"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringValue");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "objectForKey:", CFSTR("version"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", CFSTR("locale"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "hostname");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", CFSTR("input_method_languages"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", CFSTR("activated_cellular_plans"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "unsignedLongValue");

      v14 = -[MKClient initWithHostname:brand:model:name:os:version:locale:inputMethodLanguages:activatedCellularPlans:]([MKClient alloc], "initWithHostname:brand:model:name:os:version:locale:inputMethodLanguages:activatedCellularPlans:", v17, v22, v20, v10, v21, v19, v18, v16, v13);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "router:didReceiveClient:", self, v14);

    }
  }

}

- (MKPOSTClientRouterDelegate)delegate
{
  return (MKPOSTClientRouterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
