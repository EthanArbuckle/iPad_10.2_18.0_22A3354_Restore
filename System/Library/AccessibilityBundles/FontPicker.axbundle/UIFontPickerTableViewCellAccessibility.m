@implementation UIFontPickerTableViewCellAccessibility

id __85___UIFontPickerTableViewCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  __int128 v3;
  CGAffineTransform v5;
  CGAffineTransform t1;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "transform");
  else
    memset(&t1, 0, sizeof(t1));
  v3 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v5.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v5.c = v3;
  *(_OWORD *)&v5.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  CGAffineTransformEqualToTransform(&t1, &v5);

  UIKitAccessibilityLocalizedString();
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
