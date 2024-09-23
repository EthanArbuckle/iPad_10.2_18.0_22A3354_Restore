@implementation UIGestureRecognizer(WebKitInternal)

- (uint64_t)_wk_isTextInteractionLoupeGesture
{
  return objc_msgSend((id)objc_msgSend(a1, "name"), "isEqualToString:", CFSTR("UITextInteractionNameInteractiveRefinement"));
}

- (uint64_t)_wk_isTextInteractionTapGesture
{
  return objc_msgSend((id)objc_msgSend(a1, "name"), "isEqualToString:", CFSTR("UITextInteractionNameSingleTap"));
}

- (uint64_t)_wk_hasRecognizedOrEnded
{
  unint64_t v1;

  v1 = objc_msgSend(a1, "state");
  return (v1 < 6) & (0xEu >> v1);
}

@end
