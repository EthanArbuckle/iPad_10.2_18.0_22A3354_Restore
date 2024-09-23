@implementation HDUserDomainConceptEntityPredicateWithCodingCollection

id __HDUserDomainConceptEntityPredicateWithCodingCollection_block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = (objc_class *)MEMORY[0x1E0D298A0];
  v3 = a2;
  v4 = objc_alloc_init(v2);
  objc_msgSend(v4, "setEntityClass:", objc_opt_class());
  HDUserDomainMedicalCodingEntityPredicateForCoding(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setPredicate:", v5);
  v6 = (void *)MEMORY[0x1E0D29838];
  v10[0] = CFSTR("udc_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithProperty:comparisonType:subqueryDescriptor:subqueryProperties:", CFSTR("udc_id"), 7, v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
