@implementation VCArrayUtils

+ (unint64_t)insertionIndexForValue:(id)a3 array:(id)a4
{
  return objc_msgSend(a4, "indexOfObject:inSortedRange:options:usingComparator:", a3, 0, objc_msgSend(a4, "count"), 1536, &__block_literal_global_7);
}

uint64_t __45__VCArrayUtils_insertionIndexForValue_array___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (id)closestValueLessThanOrEqualToValue:(id)a3 array:(id)a4
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v5 = objc_msgSend(a1, "insertionIndexForValue:array:", a3);
  if (v5)
    v6 = v5 - 1;
  else
    v6 = 0;
  v7 = objc_msgSend(a4, "count");
  if (v6 >= v7 - 1)
    v8 = v7 - 1;
  else
    v8 = v6;
  return (id)objc_msgSend(a4, "objectAtIndexedSubscript:", v8);
}

@end
