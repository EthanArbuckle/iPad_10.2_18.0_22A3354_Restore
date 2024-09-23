@implementation EXPlaceholderView

- (EXPlaceholderView)init
{
  EXPlaceholderView *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EXPlaceholderView;
  v2 = -[EXPlaceholderView init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[EXPlaceholderView setBackgroundColor:](v2, "setBackgroundColor:", v3);

  }
  return v2;
}

@end
