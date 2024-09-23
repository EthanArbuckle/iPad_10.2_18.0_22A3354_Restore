@implementation NSArray

uint64_t __75__NSArray_AXMVisionEngineLookupConvenience__axm_featuresSortedByConfidence__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "confidence");
  v7 = v6;
  objc_msgSend(v5, "confidence");
  if (v7 >= v8)
  {
    objc_msgSend(v4, "confidence");
    v11 = v10;
    objc_msgSend(v5, "confidence");
    v9 = v11 > v12;
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

@end
