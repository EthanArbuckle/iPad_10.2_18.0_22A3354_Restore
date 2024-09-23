@implementation CALayer(SwiftUIAdditions)

- (void)setSwiftUI_displayListID:()SwiftUIAdditions
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setValue:forKey:", v2, CFSTR("_swiftUI_displayListID"));

}

- (uint64_t)swiftUI_displayListID
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "valueForKey:", CFSTR("_swiftUI_displayListID"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "integerValue");
  else
    v3 = 0x7FFFFFFFFFFFFFFFLL;

  return v3;
}

- (uint64_t)swiftUI_viewTestProperties
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "valueForKey:", CFSTR("_swiftUI_viewTestProperties"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "integerValue");

  return v2;
}

- (void)setSwiftUI_viewTestProperties:()SwiftUIAdditions
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setValue:forKey:", v2, CFSTR("_swiftUI_viewTestProperties"));

}

- (uint64_t)setNoAnimationDelegate
{
  return objc_msgSend(a1, "setDelegate:", objc_opt_class());
}

@end
