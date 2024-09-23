@implementation HKCalculateWorkoutDuration

double ___HKCalculateWorkoutDuration_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  double v5;
  double result;

  objc_msgSend(a3, "timeIntervalSinceDate:", a2);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = v5 + *(double *)(v4 + 24);
  *(double *)(v4 + 24) = result;
  return result;
}

@end
