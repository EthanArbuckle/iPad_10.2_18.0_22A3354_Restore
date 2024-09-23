@implementation NSCoder(WFFileCoder)

- (id)wfFileCoder
{
  return objc_getAssociatedObject(a1, sel_wfFileCoder);
}

- (void)setWfFileCoder:()WFFileCoder
{
  objc_setAssociatedObject(a1, sel_wfFileCoder, a3, (void *)1);
}

@end
