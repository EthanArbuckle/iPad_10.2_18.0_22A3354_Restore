@implementation NSArray(HMDCoordinationMeshAddOn)

- (id)hmd_residentWithIdentifier:()HMDCoordinationMeshAddOn
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __64__NSArray_HMDCoordinationMeshAddOn__hmd_residentWithIdentifier___block_invoke;
  v8[3] = &unk_24E7979C8;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "na_firstObjectPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
