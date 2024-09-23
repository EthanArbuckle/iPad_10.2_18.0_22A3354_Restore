@implementation CLKUIBlinkingTimeLabelManager

void __48___CLKUIBlinkingTimeLabelManager__startBlinking__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id WeakRetained;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateBlinkerAlphaForSecondFraction:", *(double *)(a3 + 32));

}

id __48___CLKUIBlinkingTimeLabelManager__startBlinking__block_invoke_137(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  _IdentifyingInfoForView(WeakRetained);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
