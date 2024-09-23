@implementation UIGestureRecognizer(WKContentViewHelpers)

- (uint64_t)_wk_cancel
{
  uint64_t result;

  result = objc_msgSend(a1, "isEnabled");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "setEnabled:", 0);
    return objc_msgSend(a1, "setEnabled:", 1);
  }
  return result;
}

- (BOOL)_wk_isTapAndAHalf
{
  objc_class *v0;

  v0 = (objc_class *)objc_opt_class();
  return -[NSString containsString:](NSStringFromClass(v0), "containsString:", CFSTR("TapAndAHalfRecognizer"));
}

@end
