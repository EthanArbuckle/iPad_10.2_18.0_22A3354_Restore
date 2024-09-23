@implementation LeadingContainerView

- (UIView)viewForLastBaselineLayout
{
  return (UIView *)LeadingContainerView.forLastBaselineLayout.getter();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC15ConversationKitP33_7B133F2533FF4A198A88A5022078738420LeadingContainerView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v8 = LeadingContainerView.sizeThatFits(_:)(width, height, v6, v7);
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (_TtC15ConversationKitP33_7B133F2533FF4A198A88A5022078738420LeadingContainerView)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKitP33_7B133F2533FF4A198A88A5022078738420LeadingContainerView *)LeadingContainerView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15ConversationKitP33_7B133F2533FF4A198A88A5022078738420LeadingContainerView)initWithCoder:(id)a3
{
  return (_TtC15ConversationKitP33_7B133F2533FF4A198A88A5022078738420LeadingContainerView *)LeadingContainerView.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKitP33_7B133F2533FF4A198A88A5022078738420LeadingContainerView_wrappedView));
}

@end
