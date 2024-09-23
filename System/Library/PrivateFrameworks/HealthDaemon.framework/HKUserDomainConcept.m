@implementation HKUserDomainConcept

uint64_t __71__HKUserDomainConcept_HDSyncSupport__createWithCodableConcept_profile___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB6CF8], "createWithCodable:", a2);
}

uint64_t __71__HKUserDomainConcept_HDSyncSupport__createWithCodableConcept_profile___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB6828], "createWithCodable:", a2);
}

id __71__HKUserDomainConcept_HDSyncSupport__createWithCodableConcept_profile___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(v2, "type");
  if ((HKIsDeprecatedPropertyType() & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB6CF0], "createWithCodable:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

id __71__HKUserDomainConcept_HDSyncSupport__createWithCodableConcept_profile___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(v2, "type");
  if ((HKIsDeprecatedPropertyType() & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB6D08], "createWithCodable:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

id __71__HKUserDomainConcept_HDSyncSupport__createWithCodableConcept_profile___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(v2, "type");
  if ((HKIsDeprecatedPropertyType() & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB6D10], "createWithCodable:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

@end
