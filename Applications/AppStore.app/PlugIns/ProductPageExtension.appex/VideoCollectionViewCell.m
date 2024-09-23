@implementation VideoCollectionViewCell

- (_TtC20ProductPageExtension23VideoCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC20ProductPageExtension23VideoCollectionViewCell *v7;
  _TtC20ProductPageExtension23VideoCollectionViewCell *v8;
  id v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  static VideoConfiguration.defaultConfiguration.getter(v7);
  swift_unknownObjectWeakInit((char *)v7 + OBJC_IVAR____TtC20ProductPageExtension23VideoCollectionViewCell_videoView);

  v11.receiver = v7;
  v11.super_class = (Class)type metadata accessor for VideoCollectionViewCell(0);
  v8 = -[VideoCollectionViewCell initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
  v9 = -[VideoCollectionViewCell contentView](v8, "contentView");
  objc_msgSend(v9, "setLayoutMargins:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);

  return v8;
}

- (_TtC20ProductPageExtension23VideoCollectionViewCell)initWithCoder:(id)a3
{
  _TtC20ProductPageExtension23VideoCollectionViewCell *result;

  static VideoConfiguration.defaultConfiguration.getter(a3);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC20ProductPageExtension23VideoCollectionViewCell_videoView, 0);

  result = (_TtC20ProductPageExtension23VideoCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/VideoCollectionViewCell.swift", 50, 2, 51, 0);
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VideoCollectionViewCell(0);
  v2 = v3.receiver;
  -[VideoCollectionViewCell prepareForReuse](&v3, "prepareForReuse");
  sub_1004CC3DC();

}

- (void)layoutSubviews
{
  char *v2;
  id v3;
  unint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *Strong;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for VideoCollectionViewCell(0);
  v2 = (char *)v13.receiver;
  -[VideoCollectionViewCell layoutSubviews](&v13, "layoutSubviews");
  v3 = objc_msgSend(v2, "contentView", v13.receiver, v13.super_class);
  v4 = sub_1000951BC();
  v5 = LayoutMarginsAware<>.layoutFrame.getter(v4);
  v7 = v6;
  v9 = v8;
  v11 = v10;

  Strong = (void *)swift_unknownObjectWeakLoadStrong(&v2[OBJC_IVAR____TtC20ProductPageExtension23VideoCollectionViewCell_videoView]);
  objc_msgSend(Strong, "setFrame:", v5, v7, v9, v11);

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension23VideoCollectionViewCell_configuration;
  v4 = type metadata accessor for VideoConfiguration(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC20ProductPageExtension23VideoCollectionViewCell_videoView);
}

@end
