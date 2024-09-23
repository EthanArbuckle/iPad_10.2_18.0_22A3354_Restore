@implementation HMCameraClip

void __71__HMCameraClip_HUAdditions__hu_accessibilityStringForSignificantEvents__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "hu_accessibilityStringForSignificantEvent:inReferenceDate:", a2, *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "stringByAppendingString:", v4);

}

@end
