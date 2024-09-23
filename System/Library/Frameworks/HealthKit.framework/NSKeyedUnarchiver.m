@implementation NSKeyedUnarchiver

void __77__NSKeyedUnarchiver_HealthKit__hk_unarchivedObjectOfClass_forKey_data_error___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "decodeObjectOfClass:forKey:", a1[6], a1[4]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __79__NSKeyedUnarchiver_HealthKit__hk_unarchivedObjectOfClasses_forKey_data_error___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "decodeObjectOfClasses:forKey:", a1[4], a1[5]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

@end
