@implementation PictureInPictureWrapperView

- (UIEdgeInsets)_touchInsets
{
  _TtC15ConversationKitP33_79596CCA642CA492AB6C13B2E093D6A627PictureInPictureWrapperView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  v2 = self;
  PictureInPictureWrapperView._touchInsets.getter();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)_setTouchInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  _TtC15ConversationKitP33_79596CCA642CA492AB6C13B2E093D6A627PictureInPictureWrapperView *v7;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v7 = self;
  PictureInPictureWrapperView._touchInsets.setter(top, left, bottom, right);

}

- (void)layoutSubviews
{
  _TtC15ConversationKitP33_79596CCA642CA492AB6C13B2E093D6A627PictureInPictureWrapperView *v2;

  v2 = self;
  PictureInPictureWrapperView.layoutSubviews()();

}

- (void)addSubview:(id)a3
{
  id v4;
  _TtC15ConversationKitP33_79596CCA642CA492AB6C13B2E093D6A627PictureInPictureWrapperView *v5;

  v4 = a3;
  v5 = self;
  PictureInPictureWrapperView.addSubview(_:)(v4);

}

- (void)didMoveToSuperview
{
  _TtC15ConversationKitP33_79596CCA642CA492AB6C13B2E093D6A627PictureInPictureWrapperView *v2;

  v2 = self;
  PictureInPictureWrapperView._touchInsets.didset();

}

- (_TtC15ConversationKitP33_79596CCA642CA492AB6C13B2E093D6A627PictureInPictureWrapperView)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKitP33_79596CCA642CA492AB6C13B2E093D6A627PictureInPictureWrapperView *)PictureInPictureWrapperView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15ConversationKitP33_79596CCA642CA492AB6C13B2E093D6A627PictureInPictureWrapperView)initWithCoder:(id)a3
{
  return (_TtC15ConversationKitP33_79596CCA642CA492AB6C13B2E093D6A627PictureInPictureWrapperView *)PictureInPictureWrapperView.init(coder:)(a3);
}

@end
