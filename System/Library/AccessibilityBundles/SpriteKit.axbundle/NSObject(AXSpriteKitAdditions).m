@implementation NSObject(AXSpriteKitAdditions)

- (id)accessibilitySpriteKitChildElements
{
  void *v2;

  objc_getAssociatedObject(a1, &_axChildElementsStorageKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(a1, "accessibilityMakeSpriteKitChildElementsIfNeeded");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setAccessibilitySpriteKitChildElements:", v2);
  }
  return v2;
}

- (void)setAccessibilitySpriteKitChildElements:()AXSpriteKitAdditions
{
  objc_setAssociatedObject(a1, &_axChildElementsStorageKey, a3, (void *)1);
}

- (uint64_t)accessibilityMakeSpriteKitChildElementsIfNeeded
{
  return 0;
}

@end
