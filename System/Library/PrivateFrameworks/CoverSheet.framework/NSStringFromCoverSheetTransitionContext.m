@implementation NSStringFromCoverSheetTransitionContext

id __NSStringFromCoverSheetTransitionContext_block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  __int128 v7;
  __int128 v8;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendFloat:withName:", CFSTR("value"), *(double *)(a1 + 40));
  v3 = *(void **)(a1 + 32);
  v7 = *(_OWORD *)(a1 + 48);
  v8 = *(_OWORD *)(a1 + 64);
  NSStringFromInterval();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("interval"), v7, v8);

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", *(_QWORD *)(a1 + 80), CFSTR("mode"));
}

@end
