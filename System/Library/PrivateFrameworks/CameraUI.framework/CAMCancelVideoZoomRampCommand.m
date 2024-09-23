@implementation CAMCancelVideoZoomRampCommand

- (void)executeWithContext:(id)a3
{
  id v3;

  objc_msgSend(a3, "currentVideoDevice");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelVideoZoomRamp");

}

@end
