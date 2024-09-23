@implementation LSApplicationRecord

uint64_t __49__LSApplicationRecord_Workflow__wf_isLinkEnabled__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "isLinkEnabled");
  else
    v3 = 1;

  return v3;
}

uint64_t __53__LSApplicationRecord_Intents2__in2_supportedIntents__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "extensionPointRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD9958]);

  return v4;
}

void __51__LSApplicationRecord_Workflow__wf_bundleAllowList__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];

  v5[4] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v1 = *MEMORY[0x24BEC16A8];
  v5[0] = CFSTR("com.apple.TapToRadar");
  v5[1] = v1;
  v5[2] = CFSTR("com.apple.Livability");
  v5[3] = CFSTR("com.apple.Terminal");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)wf_bundleAllowList_allowlist;
  wf_bundleAllowList_allowlist = v3;

}

@end
