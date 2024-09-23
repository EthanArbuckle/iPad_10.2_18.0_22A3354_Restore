@implementation AMSEngagementRequest(AMSUIWeb)

- (id)generateWebExportWithContext:()AMSUIWeb
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDB4398];
  objc_msgSend(v4, "clientInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountMediaType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ams_sharedAccountStoreForMediaType:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(a1, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "absoluteString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("url"));

  objc_msgSend(a1, "clientData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("clientData"));

  objc_msgSend(a1, "metricsOverlay");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("metricsOverlay"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "presentationStyle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, CFSTR("presentationStyle"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "destinationStyle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, CFSTR("destinationStyle"));

  objc_msgSend(a1, "account");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(a1, "account");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "JSAccountFromAccount:store:", v17, v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, CFSTR("account"));

  }
  else
  {
    objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, CFSTR("account"));
  }

  return v9;
}

@end
