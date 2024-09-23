@implementation SFNavigationIntent

id __97___SFNavigationIntent_SafariExtras__safari_navigationIntentForUserActivityContainingInteraction___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "safari_originalDataAsString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationIntentWithText:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
