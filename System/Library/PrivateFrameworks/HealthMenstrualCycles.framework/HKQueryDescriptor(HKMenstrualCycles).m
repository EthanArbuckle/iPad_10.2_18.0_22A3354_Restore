@implementation HKQueryDescriptor(HKMenstrualCycles)

+ (id)hkmc_descriptorsForTypes:()HKMenstrualCycles predicate:
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __75__HKQueryDescriptor_HKMenstrualCycles__hkmc_descriptorsForTypes_predicate___block_invoke;
  v9[3] = &unk_24D99DB88;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a3, "hk_map:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
