@implementation ArcadeDownloadPackGameLockupPlaceholder

- (_TtC8AppStore39ArcadeDownloadPackGameLockupPlaceholder)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore39ArcadeDownloadPackGameLockupPlaceholder *)sub_100553738(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore39ArcadeDownloadPackGameLockupPlaceholder)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100554028();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC8AppStore39ArcadeDownloadPackGameLockupPlaceholder *v4;
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
  if (qword_100829368 != -1)
    swift_once(&qword_100829368, sub_100050594);
  sub_10005A4BC((uint64_t)&xmmword_100890B80, (uint64_t)v12);
  if (qword_100829370 != -1)
    swift_once(&qword_100829370, sub_100024764);
  v6 = -[ArcadeDownloadPackGameLockupPlaceholder traitCollection](v4, "traitCollection");
  -[ArcadeDownloadPackGameLockupPlaceholder layoutMargins](v4, "layoutMargins");
  v7 = sub_1000482BC((uint64_t)v12, (uint64_t)&xmmword_100890CE0, v6, width);
  v9 = v8;

  sub_100079D00(v12);
  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  objc_class *ObjectType;
  _TtC8AppStore39ArcadeDownloadPackGameLockupPlaceholder *v4;
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
  sub_10055396C(v15);
  v5 = v16;
  v6 = v17;
  sub_100060B40(v15, v16);
  *(_QWORD *)&v7 = LayoutMarginsAware<>.layoutFrame.getter(ObjectType).n128_u64[0];
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = -[ArcadeDownloadPackGameLockupPlaceholder traitCollection](v4, "traitCollection");
  dispatch thunk of Placeable.place(at:with:)(v14, v5, v6, v7, v9, v11, v13);

  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0(v15);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore39ArcadeDownloadPackGameLockupPlaceholder_iconPlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore39ArcadeDownloadPackGameLockupPlaceholder_headingPlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore39ArcadeDownloadPackGameLockupPlaceholder_titlePlaceholder));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore39ArcadeDownloadPackGameLockupPlaceholder_offerButtonPlaceholder));
}

@end
