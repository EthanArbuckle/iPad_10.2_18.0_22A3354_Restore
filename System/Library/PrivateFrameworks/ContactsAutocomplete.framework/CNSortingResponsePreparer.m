@implementation CNSortingResponsePreparer

uint64_t __54___CNSortingResponsePreparer_prepareResults_forFetch___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "compare:withPriorityComparator:", a3, *(_QWORD *)(a1 + 32));
}

@end
