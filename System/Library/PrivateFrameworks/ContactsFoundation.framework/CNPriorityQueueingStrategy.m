@implementation CNPriorityQueueingStrategy

BOOL __63___CNPriorityQueueingStrategy__insertionIndexForObject_buffer___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t (**v5)(_QWORD, _QWORD, _QWORD);
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "priorityComparator");
  v5 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v6 = ((uint64_t (**)(_QWORD, id, _QWORD))v5)[2](v5, v4, *(_QWORD *)(a1 + 40));

  return v6 == 1;
}

@end
