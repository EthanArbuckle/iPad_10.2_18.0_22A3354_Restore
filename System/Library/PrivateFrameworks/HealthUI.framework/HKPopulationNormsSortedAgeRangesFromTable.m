@implementation HKPopulationNormsSortedAgeRangesFromTable

uint64_t __HKPopulationNormsSortedAgeRangesFromTable_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(a2, "rangeValue");
  v6 = objc_msgSend(v4, "rangeValue");

  if (v5 >= v6)
    v7 = 0;
  else
    v7 = -1;
  if (v5 > v6)
    return 1;
  else
    return v7;
}

uint64_t __HKPopulationNormsSortedAgeRangesFromTable_block_invoke_0(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(a2, "rangeValue");
  v6 = objc_msgSend(v4, "rangeValue");

  if (v5 >= v6)
    v7 = 0;
  else
    v7 = -1;
  if (v5 > v6)
    return 1;
  else
    return v7;
}

@end
