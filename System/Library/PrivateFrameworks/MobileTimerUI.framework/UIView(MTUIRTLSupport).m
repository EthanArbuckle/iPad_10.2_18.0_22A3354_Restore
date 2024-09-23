@implementation UIView(MTUIRTLSupport)

- (BOOL)mtui_isRTL
{
  return objc_msgSend(MEMORY[0x24BDF6F90], "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(a1, "semanticContentAttribute")) == 1;
}

@end
