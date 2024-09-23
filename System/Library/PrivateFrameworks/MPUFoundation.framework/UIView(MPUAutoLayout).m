@implementation UIView(MPUAutoLayout)

- (void)initForAutolayout
{
  void *v1;
  void *v2;

  v1 = (void *)objc_msgSend(a1, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v2 = v1;
  if (v1)
    objc_msgSend(v1, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v2;
}

@end
