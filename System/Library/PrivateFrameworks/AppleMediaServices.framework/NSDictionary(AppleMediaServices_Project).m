@implementation NSDictionary(AppleMediaServices_Project)

- (id)ams_keysForChangedValuesComparedToDictionary:()AppleMediaServices_Project
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  id v17;

  v4 = a3;
  v5 = v4;
  if (!v4 || !objc_msgSend(v4, "count"))
  {
    v7 = (void *)MEMORY[0x1E0C99E60];
    v13 = a1;
LABEL_7:
    objc_msgSend(v13, "allKeys");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  v6 = objc_msgSend(a1, "count");
  v7 = (void *)MEMORY[0x1E0C99E60];
  if (!v6)
  {
    v13 = v5;
    goto LABEL_7;
  }
  objc_msgSend(a1, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setByAddingObjectsFromArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __89__NSDictionary_AppleMediaServices_Project__ams_keysForChangedValuesComparedToDictionary___block_invoke;
  v16[3] = &unk_1E2547A00;
  v16[4] = a1;
  v17 = v5;
  objc_msgSend(v11, "ams_filterUsingTest:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v12;
}

- (id)ams_valuesForKeys:()AppleMediaServices_Project
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__NSDictionary_AppleMediaServices_Project__ams_valuesForKeys___block_invoke;
  v8[3] = &unk_1E2541570;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "ams_filterUsingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
