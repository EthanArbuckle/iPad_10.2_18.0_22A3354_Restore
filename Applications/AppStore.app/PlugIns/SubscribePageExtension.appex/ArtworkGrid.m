@implementation ArtworkGrid

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  -[ArtworkGrid frame](&v6, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  v7 = v8.receiver;
  -[ArtworkGrid setFrame:](&v8, "setFrame:", x, y, width, height);
  sub_10050796C();
  objc_msgSend(v7, "setNeedsLayout", v8.receiver, v8.super_class);

}

- (_TtC22SubscribePageExtension11ArtworkGrid)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  char *v9;
  uint64_t ObjectType;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = objc_allocWithZone((Class)swift_getObjectType());
  v9 = sub_100507D58(0, x, y, width, height);
  ObjectType = swift_getObjectType();
  swift_deallocPartialClassInstance(self, ObjectType, 104, 7);
  return (_TtC22SubscribePageExtension11ArtworkGrid *)v9;
}

- (_TtC22SubscribePageExtension11ArtworkGrid)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100508D90();
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension11ArtworkGrid *v2;

  v2 = self;
  sub_1005080D4();

}

- (void)didMoveToSuperview
{
  sub_100508A90(self, (uint64_t)a2, (const char **)&selRef_didMoveToSuperview);
}

- (void)didMoveToWindow
{
  sub_100508A90(self, (uint64_t)a2, (const char **)&selRef_didMoveToWindow);
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension11ArtworkGrid *v5;

  v4 = a3;
  v5 = self;
  sub_100509E30();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  v4 = v8.receiver;
  v5 = a3;
  -[ArtworkGrid traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v5);
  v6 = objc_msgSend(v4, "traitCollection", v8.receiver, v8.super_class);
  v7 = objc_msgSend(v6, "layoutDirection");

  if (!v5 || v7 != objc_msgSend(v5, "layoutDirection"))
    objc_msgSend(v4, "setNeedsLayout");

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension11ArtworkGrid_artworkViews));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension11ArtworkGrid_artworkImages));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension11ArtworkGrid_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension11ArtworkGrid_imageBorderView));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC22SubscribePageExtension11ArtworkGrid_nearestCollectionView);
}

@end
