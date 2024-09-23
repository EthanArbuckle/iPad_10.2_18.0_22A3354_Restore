@implementation MusicKit_SoftLinking_MPMediaLibrary(MusicKit_SoftLinking_FilteringSupport)

- (uint64_t)filterAvailableContentGroups:()MusicKit_SoftLinking_FilteringSupport withOptions:
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v6 = objc_msgSend(MEMORY[0x1E0CCDDE8], "_underlyingContentGroupsForSoftLinkingContentGroups:");
  v7 = objc_msgSend(MEMORY[0x1E0CCDDE8], "_underlyingFilteringOptionsForSoftLinkingFilteringOptions:", a4);
  objc_msgSend(a1, "_underlyingMediaLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "filterAvailableContentGroups:withOptions:", v6, v7);

  return objc_msgSend(MEMORY[0x1E0CCDDE8], "_softLinkingContentGroupsForUnderlyingContentGroups:", v9);
}

+ (uint64_t)_underlyingContentGroupsForSoftLinkingContentGroups:()MusicKit_SoftLinking_FilteringSupport
{
  return a3 & 0x7FF;
}

+ (uint64_t)_softLinkingContentGroupsForUnderlyingContentGroups:()MusicKit_SoftLinking_FilteringSupport
{
  return a3 & 0x7FF;
}

+ (uint64_t)_underlyingFilteringOptionsForSoftLinkingFilteringOptions:()MusicKit_SoftLinking_FilteringSupport
{
  return a3 & 2;
}

@end
