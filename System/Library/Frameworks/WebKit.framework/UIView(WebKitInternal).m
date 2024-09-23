@implementation UIView(WebKitInternal)

- (void)_wk_viewControllerForFullScreenPresentation
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = (void *)objc_msgSend((id)objc_msgSend(a1, "window"), "rootViewController");
  do
  {
    v3 = v2;
    v2 = (void *)objc_msgSend(v2, "presentedViewController");
  }
  while (v2);
  v4 = objc_msgSend((id)objc_msgSend(v3, "viewIfLoaded"), "window");
  if (v4 == objc_msgSend(a1, "window"))
    return v3;
  else
    return 0;
}

@end
