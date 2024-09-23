@implementation CCUIPowerButton

- (CCUIPowerButton)init
{
  return -[CCUIPowerButton initWithFrame:luminanceMap:](self, sel_initWithFrame_luminanceMap_, 0, 0.0, 0.0, 0.0, 0.0);
}

- (CCUIPowerButton)initWithFrame:(CGRect)a3 luminanceMap:(id)a4
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
  v10.super_class = (Class)type metadata accessor for PowerButton();
  return -[CSProminentButtonControl initWithFrame:luminanceMap:](&v10, sel_initWithFrame_luminanceMap_, a4, x, y, width, height);
}

- (CCUIPowerButton)initWithCoder:(id)a3
{
  CCUIPowerButton *result;

  result = (CCUIPowerButton *)sub_1CFBFAD14();
  __break(1u);
  return result;
}

- (BOOL)isSelected
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PowerButton();
  return -[CCUIPowerButton isSelected](&v3, sel_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *v5;
  CCUIPowerButton *v6;
  unsigned int v7;
  objc_super v8;
  objc_super v9;

  v3 = a3;
  v5 = (objc_class *)type metadata accessor for PowerButton();
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  v7 = -[CCUIPowerButton isSelected](&v9, sel_isSelected);
  v8.receiver = v6;
  v8.super_class = v5;
  -[CSProminentButtonControl setSelected:](&v8, sel_setSelected_, v3);
  if (v7 != -[CCUIPowerButton isSelected](v6, sel_isSelected))
    -[CCUIPowerButton setSelected:](v6, sel_setSelected_, 0);

}

- (CCUIPowerButton)initWithFrame:(CGRect)a3
{
  CCUIPowerButton *result;

  result = (CCUIPowerButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
