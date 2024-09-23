@implementation ASGeoCodingKeyedUnarchiver

- (id)allowedClasses
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  _QWORD v16[11];

  v16[10] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  objc_opt_self();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v15;
  objc_opt_self();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v14;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v3;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v4;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v5;
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v6;
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[6] = v7;
  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[7] = v8;
  objc_opt_self();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[8] = v9;
  objc_opt_self();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[9] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
