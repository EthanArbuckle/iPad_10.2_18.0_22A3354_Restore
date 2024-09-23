@implementation SFNullCardSection(CRCardSection)

- (id)parametersForInteraction:()CRCardSection
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)&off_25511BB00;
  objc_msgSendSuper2(&v6, sel_parametersForInteraction_);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    v3 = v1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

@end
