@implementation UIPlatterTransformViewAccessibility

BOOL __61___UIPlatterTransformViewAccessibility_accessibilityElements__block_invoke(id *a1, void *a2)
{
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGRect v8;
  id location[2];
  BOOL v10;
  CGRect v11;
  CGRect v12;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  if ((objc_msgSend(location[0], "isAccessibilityElement") & 1) != 0)
  {
    if ((objc_msgSend(location[0], "_accessibilityCanAppearInContextMenuPreview") & 1) != 0)
    {
      objc_msgSend(location[0], "accessibilityFrame");
      UIAccessibilityFrameToBounds();
      v8.origin.x = v2;
      v8.origin.y = v3;
      v8.size.width = v4;
      v8.size.height = v5;
      objc_msgSend(a1[4], "bounds");
      v12 = CGRectIntersection(v11, v8);
      v10 = !CGRectIsEmpty(v12);
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }
  objc_storeStrong(location, 0);
  return v10;
}

@end
