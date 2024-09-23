@implementation QLErrorView

- (QLErrorView)initWithTitle:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)QLErrorView;
  return -[_UIContentUnavailableView initWithFrame:title:style:](&v4, sel_initWithFrame_title_style_, a3, 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

@end
