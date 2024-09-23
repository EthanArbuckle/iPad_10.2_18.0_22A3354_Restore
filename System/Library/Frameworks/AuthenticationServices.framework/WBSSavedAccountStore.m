@implementation WBSSavedAccountStore

id __73__WBSSavedAccountStore_PasskeyExtras___passkeyDataFromWebKitPasskeyData___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  const __CFString *v35;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  _QWORD v43[9];
  _QWORD v44[11];

  v44[9] = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDFAA88]);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDFAA70]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDFAA90]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDFAA78]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDFAA80]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDFAA60]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDFAA98]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDFAAA0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "base64EncodedStringWithOptions:", 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDFAA68]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("apple.com"))
    && (objc_msgSend(MEMORY[0x24BDBCF50], "safari_browserDefaults"),
        v15 = v14,
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v16, "BOOLForKey:", CFSTR("showAppleIDPasskey")),
        v16,
        v14 = v15,
        !v17))
  {
    v40 = 0;
    v28 = v41;
  }
  else
  {
    v43[0] = *MEMORY[0x24BE82EF0];
    v38 = (void *)objc_msgSend(v42, "copy");
    v18 = *MEMORY[0x24BE82EC0];
    v44[0] = v38;
    v44[1] = v3;
    v19 = *MEMORY[0x24BE82EE0];
    v43[1] = v18;
    v43[2] = v19;
    v20 = objc_msgSend(v4, "copy");
    v37 = (void *)v20;
    v21 = *MEMORY[0x24BE82ED0];
    if (v5)
      v22 = v5;
    else
      v22 = v10;
    v44[2] = v20;
    v44[3] = v22;
    v23 = *MEMORY[0x24BE82ED8];
    v43[3] = v21;
    v43[4] = v23;
    if (v6)
      v24 = v6;
    else
      v24 = v10;
    v25 = *MEMORY[0x24BE82EB0];
    v44[4] = v24;
    v44[5] = v10;
    v26 = *MEMORY[0x24BE82EC8];
    v43[5] = v25;
    v43[6] = v26;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v12);
    v39 = v3;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v44[6] = v27;
    v43[7] = *MEMORY[0x24BE82EE8];
    v28 = v41;
    v29 = (void *)objc_msgSend(v41, "copy");
    v44[7] = v29;
    v43[8] = *MEMORY[0x24BE82EB8];
    v30 = objc_msgSend(v14, "copy");
    v31 = v14;
    v32 = v5;
    v33 = v4;
    v34 = (void *)v30;
    v35 = &stru_24C955390;
    if (v30)
      v35 = (const __CFString *)v30;
    v44[8] = v35;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, v43, 9);
    v40 = (id)objc_claimAutoreleasedReturnValue();

    v4 = v33;
    v5 = v32;
    v14 = v31;

    v3 = v39;
  }

  return v40;
}

uint64_t __62__WBSSavedAccountStore_WebsiteNameExtras__websiteNameProvider__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[_ASWebsiteNameProvider initForPasswordManager]([_ASWebsiteNameProvider alloc], "initForPasswordManager");
  v1 = (void *)websiteNameProvider_websiteNameProvider;
  websiteNameProvider_websiteNameProvider = (uint64_t)v0;

  return objc_msgSend((id)websiteNameProvider_websiteNameProvider, "beginLoadingBuiltInAndRemotelyUpdatableWebsiteNames");
}

@end
