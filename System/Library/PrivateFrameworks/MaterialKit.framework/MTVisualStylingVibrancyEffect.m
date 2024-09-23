@implementation MTVisualStylingVibrancyEffect

id __42___MTVisualStylingVibrancyEffect_isEqual___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_visualStyling");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "visualStyleSetName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __42___MTVisualStylingVibrancyEffect_isEqual___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_visualStyling");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "visualStyleName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
