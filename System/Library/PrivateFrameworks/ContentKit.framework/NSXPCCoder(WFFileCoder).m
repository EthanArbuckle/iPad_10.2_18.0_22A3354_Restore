@implementation NSXPCCoder(WFFileCoder)

- (id)wfFileCoder
{
  void *v2;
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&off_254757D10;
  objc_msgSendSuper2(&v4, sel_wfFileCoder);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = (void *)objc_opt_new();
    objc_msgSend(v2, "setDeletionResponsibility:", 1);
    objc_msgSend(a1, "setWfFileCoder:", v2);
  }
  return v2;
}

@end
