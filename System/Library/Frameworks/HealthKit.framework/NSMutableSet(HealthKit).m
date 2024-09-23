@implementation NSMutableSet(HealthKit)

- (void)hk_addNonNilObject:()HealthKit
{
  if (a3)
    return (void *)objc_msgSend(a1, "addObject:");
  return a1;
}

- (void)hk_removeObjectsPassingTest:()HealthKit
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__NSMutableSet_HealthKit__hk_removeObjectsPassingTest___block_invoke;
  v7[3] = &unk_1E37F37C8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(a1, "objectsPassingTest:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "minusSet:", v5);

}

@end
