@implementation HUGraphicsUtilities

+ (BOOL)shouldReduceVisualEffects
{
  if (qword_1ED580BE8 != -1)
    dispatch_once(&qword_1ED580BE8, &__block_literal_global_222);
  return _MergedGlobals_634;
}

void __48__HUGraphicsUtilities_shouldReduceVisualEffects__block_invoke()
{
  char v0;
  void *v1;
  void *v2;
  id v3;

  v3 = MTLCreateSystemDefaultDevice();
  v0 = objc_msgSend(v3, "supportsFamily:", 1003) ^ 1;
  objc_msgSend(MEMORY[0x1E0D286B8], "systemInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "modelIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _MergedGlobals_634 = v0 | objc_msgSend(v2, "hasPrefix:", CFSTR("iPhone8"));

}

+ (void)setRearrangingAnimation:(BOOL)a3 layer:(id)a4 frame:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  CGRect v11;
  CGRect v12;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v10 = a4;
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  CGRectGetHeight(v11);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  CGRectGetWidth(v12);
  sub_1B8E33EF8(a3, v10);

}

@end
