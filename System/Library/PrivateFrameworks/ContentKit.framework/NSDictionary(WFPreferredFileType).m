@implementation NSDictionary(WFPreferredFileType)

- (id)wf_preferredFileType
{
  return objc_getAssociatedObject(a1, sel_wf_preferredFileType);
}

- (void)setWf_preferredFileType:()WFPreferredFileType
{
  objc_setAssociatedObject(a1, sel_wf_preferredFileType, a3, (void *)1);
}

@end
