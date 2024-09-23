@implementation WFHealthQuantityAdditionalFieldParameter

- (id)localizedLabelWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  WFLocalizedStringResourceWithKey(CFSTR("Diastolic"), CFSTR("Diastolic"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localize:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isHidden
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[WFHealthQuantityFieldParameter quantityType](self, "quantityType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDD33A8]) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v2, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDD33A0]);

    v4 = v6 ^ 1;
  }

  return v4;
}

@end
