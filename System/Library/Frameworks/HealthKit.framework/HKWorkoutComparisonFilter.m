@implementation HKWorkoutComparisonFilter

BOOL __61___HKWorkoutComparisonFilter_areValidTypes_forKeyPath_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  uint64_t v5;

  v4 = a2;
  v5 = objc_msgSend(v4, "code");
  if (v5 != 79)
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 3, CFSTR("unexpected data type code %ld for %@"), objc_msgSend(v4, "code"), objc_opt_class());

  return v5 == 79;
}

@end
