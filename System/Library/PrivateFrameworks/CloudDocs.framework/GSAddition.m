@implementation GSAddition

void __58__GSAddition_BRConflictLosers___br_markResolvedWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v3;
  id v6;
  void *v7;
  id v8;

  v8 = a2;
  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(v8, "allValues");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v7);
  if (!v6)
  {

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t __57__GSAddition_BRConflictLosers__br_markResolvedWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObjResult:error:", 0, a2);
}

@end
