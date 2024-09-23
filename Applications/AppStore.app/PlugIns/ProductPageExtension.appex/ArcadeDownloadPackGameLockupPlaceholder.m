@implementation ArcadeDownloadPackGameLockupPlaceholder

- (_TtC20ProductPageExtension39ArcadeDownloadPackGameLockupPlaceholder)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension39ArcadeDownloadPackGameLockupPlaceholder *)sub_1002C5CB0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension39ArcadeDownloadPackGameLockupPlaceholder)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002C68C8();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC20ProductPageExtension39ArcadeDownloadPackGameLockupPlaceholder *v4;
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _QWORD v12[43];
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = -[ArcadeDownloadPackGameLockupPlaceholder traitCollection](v4, "traitCollection");
  if (qword_100806AD8 != -1)
    swift_once(&qword_100806AD8, sub_100545BDC);
  sub_100225678((uint64_t)&xmmword_10086AF70, (uint64_t)v12);
  if (qword_100806AE0 != -1)
    swift_once(&qword_100806AE0, sub_1005460A4);
  v6 = -[ArcadeDownloadPackGameLockupPlaceholder traitCollection](v4, "traitCollection");
  -[ArcadeDownloadPackGameLockupPlaceholder layoutMargins](v4, "layoutMargins");
  v7 = sub_100547CBC((uint64_t)v12, (uint64_t)&xmmword_10086B0D0, v6, width);
  v9 = v8;

  sub_1002256B4(v12);
  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  objc_class *ObjectType;
  _TtC20ProductPageExtension39ArcadeDownloadPackGameLockupPlaceholder *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  uint64_t v15[3];
  uint64_t v16;
  uint64_t v17;
  objc_super v18;

  ObjectType = (objc_class *)swift_getObjectType();
  v18.receiver = self;
  v18.super_class = ObjectType;
  v4 = self;
  -[ArcadeDownloadPackGameLockupPlaceholder layoutSubviews](&v18, "layoutSubviews");
  sub_1002C5EE4(v15);
  v5 = v16;
  v6 = v17;
  sub_100010F08(v15, v16);
  v7 = LayoutMarginsAware<>.layoutFrame.getter(ObjectType);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = -[ArcadeDownloadPackGameLockupPlaceholder traitCollection](v4, "traitCollection");
  dispatch thunk of Placeable.place(at:with:)(v14, v5, v6, v7, v9, v11, v13);

  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0(v15);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension39ArcadeDownloadPackGameLockupPlaceholder_iconPlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension39ArcadeDownloadPackGameLockupPlaceholder_headingPlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension39ArcadeDownloadPackGameLockupPlaceholder_titlePlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension39ArcadeDownloadPackGameLockupPlaceholder_offerButtonPlaceholder));
}

@end
