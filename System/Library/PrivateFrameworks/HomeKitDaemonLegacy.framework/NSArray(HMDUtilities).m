@implementation NSArray(HMDUtilities)

- (uint64_t)combineAllFutures
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "combineAllFutures:", a1);
}

- (uint64_t)asSet
{
  return objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a1);
}

- (id)arrayByRemovingObjectsInArray:()HMDUtilities
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__NSArray_HMDUtilities__arrayByRemovingObjectsInArray___block_invoke;
  v8[3] = &unk_1E89BEAD8;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "na_filter:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
