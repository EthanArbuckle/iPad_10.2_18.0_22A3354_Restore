@implementation ADAggregationParameters(ARAdditions)

- (BOOL)ar_isEqualToParameters:()ARAdditions
{
  id v4;
  int v5;
  double v6;
  double v7;
  double v8;
  _BOOL8 v9;

  v4 = a3;
  v5 = objc_msgSend(a1, "aggregationSize");
  if (v5 == objc_msgSend(v4, "aggregationSize"))
  {
    objc_msgSend(a1, "maxPointCloudAge");
    v7 = v6;
    objc_msgSend(v4, "maxPointCloudAge");
    v9 = v7 == v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)copyWithZone:()ARAdditions
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CFCDB8]);
  objc_msgSend(a1, "maxPointCloudAge");
  objc_msgSend(v2, "setMaxPointCloudAge:");
  objc_msgSend(v2, "setAggregationSize:", objc_msgSend(a1, "aggregationSize"));
  return v2;
}

@end
