@implementation HKQueryDescriptor

id __75__HKQueryDescriptor_HKMenstrualCycles__hkmc_descriptorsForTypes_predicate___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BDD3E98];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithSampleType:predicate:", v4, *(_QWORD *)(a1 + 32));

  return v5;
}

@end
