@implementation CALayer(MTCoreMaterialVisualStylingAdditions)

- (uint64_t)mt_removeAllVisualStyling
{
  objc_msgSend(a1, "setCompositingFilter:", 0);
  return objc_msgSend(a1, "setFilters:", 0);
}

- (uint64_t)mt_applyVisualStying:()MTCoreMaterialVisualStylingAdditions
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __70__CALayer_MTCoreMaterialVisualStylingAdditions__mt_applyVisualStying___block_invoke;
  v4[3] = &unk_1E5879038;
  v4[4] = a1;
  return objc_msgSend(a3, "_applyToLayer:withColorBlock:", a1, v4);
}

- (void)mt_replaceAllVisualStylingWithStyling:()MTCoreMaterialVisualStylingAdditions
{
  id v4;

  v4 = a3;
  objc_msgSend(a1, "mt_removeAllVisualStyling");
  objc_msgSend(a1, "mt_applyVisualStying:", v4);

}

@end
