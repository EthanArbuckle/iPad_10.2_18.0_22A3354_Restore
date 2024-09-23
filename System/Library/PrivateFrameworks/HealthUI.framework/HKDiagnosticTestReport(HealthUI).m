@implementation HKDiagnosticTestReport(HealthUI)

- (id)localizedStatusDisplayString
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "status");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedPreferredName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)displayItems
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(a1, "recordItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_addNonNilObject:", v3);

  objc_msgSend(a1, "statusItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_addNonNilObject:", v4);

  v5 = (void *)objc_msgSend(v2, "copy");
  return v5;
}

@end
