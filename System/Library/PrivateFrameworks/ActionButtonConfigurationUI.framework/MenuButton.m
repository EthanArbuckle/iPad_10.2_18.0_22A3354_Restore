@implementation MenuButton

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  id v6;
  id v7;
  _TtC27ActionButtonConfigurationUI10MenuButton *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_235E45078((uint64_t)v6, (uint64_t)v7);

  return v9;
}

- (_TtC27ActionButtonConfigurationUI10MenuButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for MenuButton();
  return -[MenuButton initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC27ActionButtonConfigurationUI10MenuButton)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MenuButton();
  return -[MenuButton initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
