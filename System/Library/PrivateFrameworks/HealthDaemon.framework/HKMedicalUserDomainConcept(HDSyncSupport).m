@implementation HKMedicalUserDomainConcept(HDSyncSupport)

- (void)applyCodableSubclassData:()HDSyncSupport mutableUserDomainConceptProperties:
{
  id v4;
  void *v5;
  void *v6;
  HDCodableMedicalUserDomainConcept *v7;

  v4 = a3;
  v7 = -[HDCodableMedicalUserDomainConcept initWithData:]([HDCodableMedicalUserDomainConcept alloc], "initWithData:", v4);

  if (v7)
  {
    PBRepeatedInt64NSArray();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_setCategoryTypes:", v5);

    -[HDCodableMedicalUserDomainConcept countryCode](v7, "countryCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_setCountryCode:", v6);

  }
}

- (id)codableSubclassData
{
  HDCodableMedicalUserDomainConcept *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(HDCodableMedicalUserDomainConcept);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a1, "categoryTypes", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        -[HDCodableMedicalUserDomainConcept addCategoryTypes:](v2, "addCategoryTypes:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7++), "longLongValue"));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  objc_msgSend(a1, "countryCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableMedicalUserDomainConcept setCountryCode:](v2, "setCountryCode:", v8);

  -[HDCodableMedicalUserDomainConcept data](v2, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
