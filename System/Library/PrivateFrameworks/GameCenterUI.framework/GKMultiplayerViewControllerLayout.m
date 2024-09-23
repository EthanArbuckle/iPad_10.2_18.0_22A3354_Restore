@implementation GKMultiplayerViewControllerLayout

- (_TtC12GameCenterUI33GKMultiplayerViewControllerLayout)init
{
  return (_TtC12GameCenterUI33GKMultiplayerViewControllerLayout *)GKMultiplayerViewControllerLayout.init()();
}

- (_TtC12GameCenterUI33GKMultiplayerViewControllerLayout)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB541DC8();
}

- (void)prepareLayout
{
  _TtC12GameCenterUI33GKMultiplayerViewControllerLayout *v2;

  v2 = self;
  sub_1AB541E50();

}

- (CGSize)collectionViewContentSize
{
  _TtC12GameCenterUI33GKMultiplayerViewControllerLayout *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = sub_1AB542190();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (int64_t)cellLayoutMode
{
  _TtC12GameCenterUI33GKMultiplayerViewControllerLayout *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_1AB542308((uint64_t)v2);

  return v3;
}

+ (UIEdgeInsets)minimumContentInsetIn:(id)a3
{
  id v3;
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

  v3 = a3;
  v4 = static GKMultiplayerViewControllerLayout.minimumContentInset(in:)(v3);
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

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC12GameCenterUI33GKMultiplayerViewControllerLayout *v7;
  char v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = sub_1AB54252C((uint64_t)v7, x, y, width, height);

  return v8 & 1;
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC12GameCenterUI33GKMultiplayerViewControllerLayout *v8;
  id v9;
  uint64_t v11;

  v4 = sub_1AB7D7D68();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AB7D7D14();
  v8 = self;
  v9 = sub_1AB542650();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

@end
