@implementation MUIHighlightedMessagesReusableView

+ (NSString)reusableIdentifier
{
  return (NSString *)CFSTR("MUIHighlightedMessagesReusableView");
}

- (MUIHighlightedMessagesReusableView)initWithFrame:(CGRect)a3
{
  MUIHighlightedMessagesReusableView *v3;
  MUIHighlightedMessagesReusableView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MUIHighlightedMessagesReusableView;
  v3 = -[MUIHighlightedMessagesReusableView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[MUIHighlightedMessagesReusableView _sharedInit](v3, "_sharedInit");
  return v4;
}

- (MUIHighlightedMessagesReusableView)initWithCoder:(id)a3
{
  MUIHighlightedMessagesReusableView *v3;
  MUIHighlightedMessagesReusableView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MUIHighlightedMessagesReusableView;
  v3 = -[MUIHighlightedMessagesReusableView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[MUIHighlightedMessagesReusableView _sharedInit](v3, "_sharedInit");
  return v4;
}

- (void)_sharedInit
{
  -[MUIHighlightedMessagesReusableView setClipsToBounds:](self, "setClipsToBounds:", 1);
}

- (void)applyLayoutAttributes:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MUIHighlightedMessagesReusableView;
  -[MUIHighlightedMessagesReusableView applyLayoutAttributes:](&v6, sel_applyLayoutAttributes_, a3);
  -[MUIHighlightedMessagesReusableView subviews](self, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[MUIHighlightedMessagesReusableView layoutIfNeeded](self, "layoutIfNeeded");

}

@end
