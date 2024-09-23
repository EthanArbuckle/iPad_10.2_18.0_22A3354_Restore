@implementation HKOutsideTapWindowCallbacks

BOOL __54___HKOutsideTapWindowCallbacks_removeCallbackForView___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

@end
