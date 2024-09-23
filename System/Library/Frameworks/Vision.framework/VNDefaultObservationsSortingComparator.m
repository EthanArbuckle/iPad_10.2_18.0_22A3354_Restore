@implementation VNDefaultObservationsSortingComparator

uint64_t __VNDefaultObservationsSortingComparator_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  float v6;
  float v7;
  float v8;
  uint64_t v9;

  v4 = a2;
  v5 = a3;
  if (v4 == v5)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v4, "confidence");
    v7 = v6;
    objc_msgSend(v5, "confidence");
    if (v7 > v8)
      v9 = -1;
    else
      v9 = v7 < v8;
  }

  return v9;
}

@end
