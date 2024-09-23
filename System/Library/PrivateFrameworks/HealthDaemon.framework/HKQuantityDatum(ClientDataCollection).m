@implementation HKQuantityDatum(ClientDataCollection)

+ (id)quantityDatumWithHDQuantityDatum:()ClientDataCollection
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x1E0CB6A30];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "datumIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "quantity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resumeContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v5, "initWithIdentifier:dateInterval:quantity:resumeContext:", v6, v7, v8, v9);
  return v10;
}

@end
