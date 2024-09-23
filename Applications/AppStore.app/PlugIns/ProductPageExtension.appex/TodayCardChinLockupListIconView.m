@implementation TodayCardChinLockupListIconView

- (_TtC20ProductPageExtension31TodayCardChinLockupListIconView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension31TodayCardChinLockupListIconView *)sub_1003288E8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension31TodayCardChinLockupListIconView)initWithCoder:(id)a3
{
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _TtC20ProductPageExtension31TodayCardChinLockupListIconView *result;

  v5 = OBJC_IVAR____TtC20ProductPageExtension31TodayCardChinLockupListIconView_artworkView;
  type metadata accessor for ArtworkView(0);
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)static ArtworkView.iconArtworkView.getter(a3);
  v6 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension31TodayCardChinLockupListIconView_clickAction;
  v7 = sub_10000DAF8((uint64_t *)&unk_10081D490);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);

  result = (_TtC20ProductPageExtension31TodayCardChinLockupListIconView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/TodayCardChinLockupListView.swift", 54, 2, 402, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[TodayCardChinLockupListIconView layoutSubviews](&v3, "layoutSubviews");
  ArtworkView.frame.setter(objc_msgSend(v2, "bounds", v3.receiver, v3.super_class));

}

- (void)handleTap
{
  _TtC20ProductPageExtension31TodayCardChinLockupListIconView *v2;

  v2 = self;
  sub_100328BBC();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31TodayCardChinLockupListIconView_artworkView));
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension31TodayCardChinLockupListIconView_clickAction, &qword_100819850);
}

@end
