@implementation HKListUserDomainConcept(HDSyncSupport)

- (void)applyCodableSubclassData:()HDSyncSupport mutableUserDomainConceptProperties:
{
  id v4;
  void *v5;
  HDCodableListUserDomainConcept *v6;

  v4 = a3;
  v6 = -[HDCodableListUserDomainConcept initWithData:]([HDCodableListUserDomainConcept alloc], "initWithData:", v4);

  if (v6)
  {
    -[HDCodableListUserDomainConcept name](v6, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_setListName:", v5);

    objc_msgSend(a1, "_setListType:", -[HDCodableListUserDomainConcept type](v6, "type"));
  }

}

- (id)codableSubclassData
{
  HDCodableListUserDomainConcept *v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(HDCodableListUserDomainConcept);
  objc_msgSend(a1, "listName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableListUserDomainConcept setName:](v2, "setName:", v3);

  -[HDCodableListUserDomainConcept setType:](v2, "setType:", objc_msgSend(a1, "listType"));
  -[HDCodableListUserDomainConcept data](v2, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
