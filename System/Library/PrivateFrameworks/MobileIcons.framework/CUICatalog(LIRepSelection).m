@implementation CUICatalog(LIRepSelection)

- (id)_LI_iconImageWithName:()LIRepSelection size:scale:idiom:subtype:gamut:layoutDirection:
{
  id v18;
  void *v19;

  v18 = a6;
  objc_msgSend(a1, "iconImageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:desiredSize:", v18, a7, a8, a9, a10, 0, a4, a2, a3, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19 && a7 <= 5 && ((1 << a7) & 0x34) != 0)
  {
    objc_msgSend(a1, "iconImageWithName:scaleFactor:deviceIdiom:deviceSubtype:displayGamut:layoutDirection:sizeClassHorizontal:sizeClassVertical:desiredSize:", v18, 1, a8, a9, a10, 0, a4, a2, a3, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

@end
