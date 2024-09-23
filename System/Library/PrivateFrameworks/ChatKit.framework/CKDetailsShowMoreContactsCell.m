@implementation CKDetailsShowMoreContactsCell

+ (Class)cellClass
{
  void *v2;
  id v3;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "isAccessibilityPreferredContentSizeCategory");
  v3 = (id)objc_opt_class();

  return (Class)v3;
}

+ (id)reuseIdentifier
{
  return CFSTR("CKDetailsShowMoreContactsCell_reuseIdentifier");
}

+ (BOOL)shouldHighlight
{
  return 1;
}

+ (double)preferredHeight
{
  return 44.0;
}

@end
