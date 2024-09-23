@implementation NSIndexSet

uint64_t __60__NSIndexSet_CyclicRange___filteredCyclicRangeForItemCount___block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

__n128 __60__NSIndexSet_CyclicRange___filteredCyclicRangeForItemCount___block_invoke_2(_QWORD *a1, NSRange range2)
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v5;
  uint64_t v6;
  __n128 result;
  NSRange v8;
  __n128 *v9;
  uint64_t v10;
  __n128 *v11;
  __n128 *v12;
  NSRange v13;
  NSRange v14;
  NSRange v15;

  length = range2.length;
  location = range2.location;
  v5 = *(_QWORD *)(a1[4] + 8);
  v6 = *(_QWORD *)(v5 + 40);
  if (!v6)
  {
    *(NSRange *)(v5 + 32) = range2;
    v5 = *(_QWORD *)(a1[4] + 8);
    v6 = *(_QWORD *)(v5 + 40);
  }
  v13.location = *(_QWORD *)(v5 + 32);
  v13.length = a1[7] + v6;
  v14.location = location;
  v14.length = length;
  if (NSIntersectionRange(v13, v14).length)
  {
    v15.location = location;
    v15.length = length;
    v8 = NSUnionRange(*(NSRange *)(*(_QWORD *)(a1[4] + 8) + 32), v15);
    location = v8.location;
    length = v8.length;
  }
  else
  {
    v9 = *(__n128 **)(a1[5] + 8);
    if (!v9[2].n128_u64[1])
    {
      result = *(__n128 *)(*(_QWORD *)(a1[4] + 8) + 32);
      v9[2] = result;
    }
  }
  v10 = *(_QWORD *)(a1[4] + 8);
  *(_QWORD *)(v10 + 32) = location;
  *(_QWORD *)(v10 + 40) = length;
  v11 = *(__n128 **)(a1[6] + 8);
  v12 = *(__n128 **)(a1[4] + 8);
  if (v12[2].n128_u64[1] > v11[2].n128_u64[1])
  {
    result = v12[2];
    v11[2] = result;
  }
  return result;
}

uint64_t __60__NSIndexSet_CyclicRange___filteredCyclicRangeForItemCount___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a2 + a3 + *(_QWORD *)(a1 + 32);
}

BOOL __60__NSIndexSet_CyclicRange___filteredCyclicRangeForItemCount___block_invoke_4(uint64_t a1, unint64_t a2)
{
  return (unint64_t)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() >= *(_QWORD *)(a1 + 40)
      && a2 <= (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() - *(_QWORD *)(a1 + 40);
}

void __64__NSIndexSet_CyclicRange___allInclusiveCyclicRangeForItemCount___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

@end
