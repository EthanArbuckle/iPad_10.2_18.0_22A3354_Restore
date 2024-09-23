@implementation ContentSizedTableView

- (CGSize)contentSize
{
  double v2;
  double v3;
  objc_super v4;
  CGSize result;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ContentSizedTableView();
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
  v6.super_class = (Class)type metadata accessor for ContentSizedTableView();
  v5 = v6.receiver;
  -[ContentSizedTableView setContentSize:](&v6, sel_setContentSize_, width, height);
  objc_msgSend(v5, sel_invalidateIntrinsicContentSize, v6.receiver, v6.super_class);

}

- (CGSize)intrinsicContentSize
{
  _TtC15HealthRecordsUIP33_8F81952E28F1531DFFBDDCE2B833C80321ContentSizedTableView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  -[ContentSizedTableView layoutIfNeeded](v2, sel_layoutIfNeeded);
  v3 = *MEMORY[0x1E0DC55F0];
  -[ContentSizedTableView contentSize](v2, sel_contentSize);
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (_TtC15HealthRecordsUIP33_8F81952E28F1531DFFBDDCE2B833C80321ContentSizedTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
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
  v10.super_class = (Class)type metadata accessor for ContentSizedTableView();
  return -[ContentSizedTableView initWithFrame:style:](&v10, sel_initWithFrame_style_, a4, x, y, width, height);
}

- (_TtC15HealthRecordsUIP33_8F81952E28F1531DFFBDDCE2B833C80321ContentSizedTableView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ContentSizedTableView();
  return -[ContentSizedTableView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
