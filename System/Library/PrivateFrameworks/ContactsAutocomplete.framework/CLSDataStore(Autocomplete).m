@implementation CLSDataStore(Autocomplete)

- (id)_cna_membersOfGroupWithIdentifier:()Autocomplete
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v13;

  v4 = (objc_class *)MEMORY[0x1E0D13B20];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "completionHandlerAdapter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "membersOfGroupWithIdentifier:completion:", v5, v7);

  objc_msgSend(v6, "future");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v8, "result:", &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v13;

  objc_msgSend(MEMORY[0x1E0D13B60], "resultWithValue:orError:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_cna_objectsMatching:()Autocomplete
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v4 = (objc_class *)MEMORY[0x1E0D13B20];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "completionHandlerAdapter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectsMatching:completion:", v5, v7);

  objc_msgSend(v6, "future");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
