@implementation UIBarButtonItem(MUIPresentationSource)

- (uint64_t)mui_setAsSourceForPopoverPresentationController:()MUIPresentationSource
{
  return objc_msgSend(a3, "setBarButtonItem:", a1);
}

@end
