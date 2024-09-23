@implementation DKApplicationMonitorBase

BOOL __33___DKApplicationMonitorBase_init__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "length") == 0;
  else
    v4 = 1;

  return v4;
}

uint64_t __33___DKApplicationMonitorBase_init__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;

  v4 = a2;
  v5 = a3;
  v6 = v4;
  v7 = v5;
  if (v6 == v7
    || (objc_msgSend(v6, "stringValue"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "stringValue"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v8, "isEqual:", v9),
        v9,
        v8,
        v10))
  {
    v11 = 0;
  }
  else
  {
    v11 = -1;
  }

  return v11;
}

void __33___DKApplicationMonitorBase_init__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;
  id v6;

  BiomeLibrary();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "App");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "InFocus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setAppInFocusSource:", v4);

}

@end
