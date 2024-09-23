@implementation NSExtensionContext(RPBroadcastExtension)

- (void)completeRequestWithBroadcastURL:()RPBroadcastExtension setupInfo:
{
  id v6;
  id v7;
  RPBroadcastConfiguration *v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(RPBroadcastConfiguration);
  objc_msgSend(a1, "completeRequestWithBroadcastURL:broadcastConfiguration:setupInfo:", v7, v8, v6);

}

- (void)completeRequestWithBroadcastURL:()RPBroadcastExtension broadcastConfiguration:setupInfo:
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  _QWORD v42[4];
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x24BDAC8D0];
  v7 = (objc_class *)MEMORY[0x24BDD1560];
  v8 = a5;
  v40 = a4;
  v9 = a3;
  v10 = objc_alloc_init(v7);
  v11 = objc_alloc(MEMORY[0x24BDD1458]);
  objc_msgSend(MEMORY[0x24BDD17C8], "_rpLocalizationNotNeeded:", CFSTR("kRPBroadcastExtensionKeyExtensionServiceURL"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithString:", v12);
  objc_msgSend(v10, "setAttributedTitle:", v13);

  v14 = objc_alloc(MEMORY[0x24BDD15F0]);
  v15 = *MEMORY[0x24BDC1748];
  v16 = (void *)objc_msgSend(v14, "initWithItem:typeIdentifier:", v9, *MEMORY[0x24BDC1748]);

  v46[0] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAttachments:", v17);

  v18 = objc_alloc_init(MEMORY[0x24BDD1560]);
  v19 = objc_alloc(MEMORY[0x24BDD1458]);
  objc_msgSend(MEMORY[0x24BDD17C8], "_rpLocalizationNotNeeded:", CFSTR("RPBroadcastExtensionKeyExtensionUserInfo"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithString:", v20);
  objc_msgSend(v18, "setAttributedTitle:", v21);

  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD15F0]), "initWithItem:typeIdentifier:", v8, v15);
  v45 = v22;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v45, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAttachments:", v23);

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bundleIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_alloc_init(MEMORY[0x24BDD1560]);
  v27 = objc_alloc(MEMORY[0x24BDD1458]);
  objc_msgSend(MEMORY[0x24BDD17C8], "_rpLocalizationNotNeeded:", CFSTR("RPBroadcastExtensionKeyExtensionBundleIdentifier"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v27, "initWithString:", v28);
  objc_msgSend(v26, "setAttributedTitle:", v29);

  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD15F0]), "initWithItem:typeIdentifier:", v25, v15);
  v44 = v30;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v44, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setAttachments:", v31);

  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:", v40);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = objc_alloc_init(MEMORY[0x24BDD1560]);
  v34 = objc_alloc(MEMORY[0x24BDD1458]);
  objc_msgSend(MEMORY[0x24BDD17C8], "_rpLocalizationNotNeeded:", CFSTR("RPBroadcastExtensionKeyBroadcastConfiguration"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v34, "initWithString:", v35);
  objc_msgSend(v33, "setAttributedTitle:", v36);

  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD15F0]), "initWithItem:typeIdentifier:", v32, v15);
  v43 = v37;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v43, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setAttachments:", v38);

  v42[0] = v18;
  v42[1] = v26;
  v42[2] = v33;
  v42[3] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 4);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "completeRequestReturningItems:completionHandler:", v39, 0);

}

- (void)loadBroadcastingApplicationInfoWithCompletion:()RPBroadcastExtension
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD *v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  v5 = (id)*MEMORY[0x24BDC1748];
  objc_msgSend(a1, "inputItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "attachments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__0;
  v13[4] = __Block_byref_object_dispose__0;
  v14 = 0;
  if (objc_msgSend(v9, "hasItemConformingToTypeIdentifier:", v5))
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __90__NSExtensionContext_RPBroadcastExtension__loadBroadcastingApplicationInfoWithCompletion___block_invoke;
    v10[3] = &unk_24D15E3D0;
    v12 = v13;
    v11 = v4;
    objc_msgSend(v9, "loadItemForTypeIdentifier:options:completionHandler:", v5, 0, v10);

  }
  _Block_object_dispose(v13, 8);

}

@end
