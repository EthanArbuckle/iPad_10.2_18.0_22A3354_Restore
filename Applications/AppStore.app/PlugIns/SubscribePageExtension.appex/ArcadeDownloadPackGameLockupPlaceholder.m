@implementation ArcadeDownloadPackGameLockupPlaceholder

- (_TtC22SubscribePageExtension39ArcadeDownloadPackGameLockupPlaceholder)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension39ArcadeDownloadPackGameLockupPlaceholder *)sub_10056FB18(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension39ArcadeDownloadPackGameLockupPlaceholder)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1005706A4();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC22SubscribePageExtension39ArcadeDownloadPackGameLockupPlaceholder *v4;
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
  if (qword_1007F1928 != -1)
    swift_once(&qword_1007F1928, sub_10028C58C);
  sub_100076534((uint64_t)&xmmword_100853160, (uint64_t)v12);
  if (qword_1007F1930 != -1)
    swift_once(&qword_1007F1930, sub_10028CA54);
  v6 = -[ArcadeDownloadPackGameLockupPlaceholder traitCollection](v4, "traitCollection");
  -[ArcadeDownloadPackGameLockupPlaceholder layoutMargins](v4, "layoutMargins");
  v7 = sub_10028E66C((uint64_t)v12, (uint64_t)&xmmword_1008532C0, v6, width);
  v9 = v8;

  sub_100076570(v12);
  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  objc_class *ObjectType;
  _TtC22SubscribePageExtension39ArcadeDownloadPackGameLockupPlaceholder *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  id v8;
  uint64_t v9[3];
  uint64_t v10;
  uint64_t v11;
  objc_super v12;

  ObjectType = (objc_class *)swift_getObjectType();
  v12.receiver = self;
  v12.super_class = ObjectType;
  v4 = self;
  -[ArcadeDownloadPackGameLockupPlaceholder layoutSubviews](&v12, "layoutSubviews");
  sub_10056FD4C(v9);
  v5 = v10;
  v6 = v11;
  sub_100011064(v9, v10);
  v7 = LayoutMarginsAware<>.layoutFrame.getter(ObjectType);
  v8 = -[ArcadeDownloadPackGameLockupPlaceholder traitCollection](v4, "traitCollection");
  dispatch thunk of Placeable.place(at:with:)(v8, v5, v6, v7);

  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0(v9);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension39ArcadeDownloadPackGameLockupPlaceholder_iconPlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension39ArcadeDownloadPackGameLockupPlaceholder_headingPlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension39ArcadeDownloadPackGameLockupPlaceholder_titlePlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension39ArcadeDownloadPackGameLockupPlaceholder_offerButtonPlaceholder));
}

@end
