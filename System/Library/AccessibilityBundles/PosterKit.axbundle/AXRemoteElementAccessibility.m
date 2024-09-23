@implementation AXRemoteElementAccessibility

void __101__AXRemoteElementAccessibility__PosterKit__AXRuntime__accessibilityShouldHitTestRemoteElementProcess__block_invoke()
{
  void *v0;
  Class v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x24BDBCE30];
  v1 = NSClassFromString(CFSTR("PREditingSceneViewController"));
  objc_msgSend(v0, "axArrayByIgnoringNilElementsWithCount:", 2, v1, NSClassFromString(CFSTR("PRUISAmbientPosterViewController")));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_accessibilityShouldHitTestRemoteElementProcess_Classes;
  _accessibilityShouldHitTestRemoteElementProcess_Classes = v2;

}

uint64_t __101__AXRemoteElementAccessibility__PosterKit__AXRuntime__accessibilityShouldHitTestRemoteElementProcess__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "_accessibilityViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "_axIsKindOfClass:fromArray:", v3, _accessibilityShouldHitTestRemoteElementProcess_Classes);

  return v4;
}

@end
