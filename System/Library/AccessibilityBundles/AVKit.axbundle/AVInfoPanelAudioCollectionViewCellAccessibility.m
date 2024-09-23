@implementation AVInfoPanelAudioCollectionViewCellAccessibility

void __74__tvOS_AVInfoPanelAudioCollectionViewCellAccessibility_accessibilityValue__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("route"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_imageForRoute:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __83__tvOS_AVInfoPanelAudioCollectionViewCellAccessibility_accessibilityHeaderElements__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  NSClassFromString(CFSTR("AVInfoPanelCollectionReusableHeaderView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "_accessibilityViewIsVisible");
  else
    v3 = 0;

  return v3;
}

@end
