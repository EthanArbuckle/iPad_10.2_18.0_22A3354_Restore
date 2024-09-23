@implementation HKClinicalConnectedAccount(HealthRecordServices)

- (uint64_t)initWithClinicalAccount:()HealthRecordServices
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = (objc_class *)MEMORY[0x24BDD39C0];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "provenance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "provenance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "subtitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "brand");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v5, "needsRelogin");

  v14 = objc_msgSend(v6, "initWithIdentifier:title:subtitle:brand:needsRelogin:", v7, v9, v11, v12, v13);
  return v14;
}

@end
