@implementation SFAbstractCommand(CRCommand)

- (id)userInfo
{
  return objc_getAssociatedObject(a1, sel_userInfo);
}

- (void)setUserInfo:()CRCommand
{
  objc_setAssociatedObject(a1, sel_userInfo, a3, (void *)0x303);
}

- (id)referenceIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  if (objc_msgSend(a1, "type") == 1)
  {
    objc_msgSend(a1, "value");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "referentialCommand");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "referenceIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end
