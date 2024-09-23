@implementation UILabel(NUITestExtras)

+ (id)labelWithString:()NUITestExtras
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setText:", v3);

  return v4;
}

+ (id)wrappingLabelWithString:()NUITestExtras
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setText:", v3);

  objc_msgSend(v4, "setNumberOfLines:", 0);
  return v4;
}

@end
