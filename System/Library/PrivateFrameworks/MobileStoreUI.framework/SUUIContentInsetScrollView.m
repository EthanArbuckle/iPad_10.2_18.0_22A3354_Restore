@implementation SUUIContentInsetScrollView

- (void)setScrollIndicatorInsets:(UIEdgeInsets)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUIContentInsetScrollView;
  -[SUUIContentInsetScrollView setScrollIndicatorInsets:](&v5, sel_setScrollIndicatorInsets_, a3.top, a3.left, a3.bottom, a3.right);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("SUUIScrollViewContentInsetDidChangeNotification"), self);

}

@end
