@implementation NSExtensionContext

void __90__NSExtensionContext_RPBroadcastExtension__loadBroadcastingApplicationInfoWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    v8 = v7;
    NSLog(CFSTR("loadBroadcastingApplicationInfoWithCompletion: Error loading item Provider: %@"), v7);
LABEL_9:

    goto LABEL_10;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = (void *)MEMORY[0x24BDD1620];
    v10 = (void *)MEMORY[0x24BDBCF20];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v21 = 0;
    objc_msgSend(v9, "unarchivedObjectOfClasses:fromData:error:", v12, v13, &v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v21;

    if (v8)
      NSLog(CFSTR("loadBroadcastingApplicationInfoWithCompletion: Error unarchiving hostInfo %@"), v8);
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("RPBroadcastExtensionKeyExtensionHostInfoAppIcon"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = (void *)MEMORY[0x24BDF6AC8];
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("RPBroadcastExtensionKeyExtensionHostInfoAppIcon"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "imageWithData:", v17);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v18 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("RPBroadcastExtensionKeyExtensionHostInfoBundleID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("RPBroadcastExtensionKeyExtensionHostInfoAppName"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *, void *))(v18 + 16))(v18, v19, v20, v15);

    goto LABEL_9;
  }
LABEL_10:

}

@end
