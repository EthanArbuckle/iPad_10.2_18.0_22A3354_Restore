@implementation BIABubbleOptionsiOSViewController

- (void)loadView
{
  _TtC8Business33BIABubbleOptionsiOSViewController *v2;

  v2 = self;
  sub_10009B220();

}

- (void)_handleBubbleTapped
{
  _TtC8Business33BIABubbleOptionsiOSViewController *v2;

  v2 = self;
  sub_10009BE08();

}

- (_TtC8Business33BIABubbleOptionsiOSViewController)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8Business33BIABubbleOptionsiOSViewController____lazy_storage___optionsLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8Business33BIABubbleOptionsiOSViewController_containingViewGestureRecognizer) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BIABubbleOptionsiOSViewController(0);
  return -[BIABubbleOptionsViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business33BIABubbleOptionsiOSViewController____lazy_storage___optionsLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business33BIABubbleOptionsiOSViewController_containingViewGestureRecognizer));
}

@end
