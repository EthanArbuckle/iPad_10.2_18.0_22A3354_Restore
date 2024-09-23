@implementation NSMutableDictionary

uint64_t __86__NSMutableDictionary_MCMDeeplyMutable___findKeyPathsSortedByDepthFirstOfKindOfClass___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "count");
  if (v6 <= objc_msgSend(v5, "count"))
  {
    v8 = objc_msgSend(v4, "count");
    v7 = v8 < objc_msgSend(v5, "count");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

uint64_t __91__NSMutableDictionary_MCMDeeplyMutable__MCM_overlayDictionary_existingValuesTakePrecedent___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, *(_QWORD *)(a1 + 40));
}

@end
