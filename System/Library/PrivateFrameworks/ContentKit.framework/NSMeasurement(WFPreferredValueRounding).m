@implementation NSMeasurement(WFPreferredValueRounding)

- (id)wf_preferredValueRounding
{
  return objc_getAssociatedObject(a1, sel_wf_preferredValueRounding);
}

- (void)setWf_preferredValueRounding:()WFPreferredValueRounding
{
  objc_setAssociatedObject(a1, sel_wf_preferredValueRounding, a3, (void *)1);
}

@end
