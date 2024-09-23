@implementation RenderTimer

- (void)fire
{
  void *v2;
  CGRect v3;
  CGRect v4;

  v2 = *(void **)self->metalLayer;
  swift_retain();
  objc_msgSend(v2, sel_bounds);
  v4.origin.x = 0.0;
  v4.origin.y = 0.0;
  v4.size.width = 0.0;
  v4.size.height = 0.0;
  if (!CGRectEqualToRect(v3, v4))
    sub_2264A20E4();
  swift_release();
}

@end
