@implementation IconSilhouetteView

- (_TtC8AppStore18IconSilhouetteView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore18IconSilhouetteView *)sub_100237FB0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore18IconSilhouetteView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10023864C();
}

- (void)layoutSubviews
{
  _TtC8AppStore18IconSilhouetteView *v2;

  v2 = self;
  sub_10023828C();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  double v8;
  _TtC8AppStore18IconSilhouetteView *v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  CGSize result;

  v4 = type metadata accessor for Artwork.Style(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(double *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC8AppStore18IconSilhouetteView_preferredIconWidth);
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, (char *)self + OBJC_IVAR____TtC8AppStore18IconSilhouetteView_iconStyle, v4);
  v9 = self;
  v10 = Artwork.Style.iconHeight(fromWidth:)(v8);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC8AppStore18IconSilhouetteView_iconStyle;
  v4 = type metadata accessor for Artwork.Style(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

}

@end
