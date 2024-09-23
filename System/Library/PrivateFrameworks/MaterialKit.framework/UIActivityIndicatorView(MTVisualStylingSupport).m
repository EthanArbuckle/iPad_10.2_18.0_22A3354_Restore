@implementation UIActivityIndicatorView(MTVisualStylingSupport)

- (uint64_t)mt_applyVisualStyling:()MTVisualStylingSupport
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __73__UIActivityIndicatorView_MTVisualStylingSupport__mt_applyVisualStyling___block_invoke;
  v4[3] = &unk_24C3DBA90;
  v4[4] = a1;
  return objc_msgSend(a3, "applyToView:withColorBlock:", a1, v4);
}

@end
