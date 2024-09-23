@implementation UIView(NCScreenCaptureAdditions)

- (void)nc_setScreenCaptureProhibited:()NCScreenCaptureAdditions
{
  uint64_t v4;
  int v5;
  id v6;

  objc_msgSend(a1, "layer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v6, "disableUpdateMask") & 0xFFFFFFEDLL;
  if (a3)
    v5 = 18;
  else
    v5 = 0;
  objc_msgSend(v6, "setDisableUpdateMask:", v4 | v5);

}

@end
