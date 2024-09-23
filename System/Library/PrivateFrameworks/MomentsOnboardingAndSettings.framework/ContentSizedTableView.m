@implementation ContentSizedTableView

- (CGSize)contentSize
{
  double v2;
  double v3;
  objc_super v4;
  CGSize result;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  -[ContentSizedTableView contentSize](&v4, sel_contentSize);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  double height;
  double width;
  id v5;
  objc_super v6;

  height = a3.height;
  width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v5 = v6.receiver;
  -[ContentSizedTableView setContentSize:](&v6, sel_setContentSize_, width, height);
  objc_msgSend(v5, sel_invalidateIntrinsicContentSize, v6.receiver, v6.super_class);

}

- (CGSize)intrinsicContentSize
{
  objc_class *ObjectType;
  _TtC28MomentsOnboardingAndSettings21ContentSizedTableView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGSize result;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  -[ContentSizedTableView layoutIfNeeded](v4, sel_layoutIfNeeded);
  v5 = *MEMORY[0x24BEBE9C8];
  v10.receiver = v4;
  v10.super_class = ObjectType;
  -[ContentSizedTableView contentSize](&v10, sel_contentSize);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (_TtC28MomentsOnboardingAndSettings21ContentSizedTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)swift_getObjectType();
  return -[ContentSizedTableView initWithFrame:style:](&v10, sel_initWithFrame_style_, a4, x, y, width, height);
}

- (_TtC28MomentsOnboardingAndSettings21ContentSizedTableView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[ContentSizedTableView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
