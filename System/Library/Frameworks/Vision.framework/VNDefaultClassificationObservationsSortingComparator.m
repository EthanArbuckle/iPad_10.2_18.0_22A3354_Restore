@implementation VNDefaultClassificationObservationsSortingComparator

uint64_t __VNDefaultClassificationObservationsSortingComparator_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  float v6;
  float v7;
  float v8;
  uint64_t v9;
  void *v10;
  void *v11;

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
    if (!v9)
    {
      objc_msgSend(v4, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v10, "compare:options:", v11, 129);

    }
  }

  return v9;
}

@end
