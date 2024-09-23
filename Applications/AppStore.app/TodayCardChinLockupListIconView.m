@implementation TodayCardChinLockupListIconView

- (_TtC8AppStore31TodayCardChinLockupListIconView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore31TodayCardChinLockupListIconView *)sub_1000D0F48(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore31TodayCardChinLockupListIconView)initWithCoder:(id)a3
{
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _TtC8AppStore31TodayCardChinLockupListIconView *result;

  v5 = OBJC_IVAR____TtC8AppStore31TodayCardChinLockupListIconView_artworkView;
  type metadata accessor for ArtworkView(0);
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)static ArtworkView.iconArtworkView.getter(a3);
  v6 = (char *)self + OBJC_IVAR____TtC8AppStore31TodayCardChinLockupListIconView_clickAction;
  v7 = sub_10007B804((uint64_t *)&unk_100833700);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);

  result = (_TtC8AppStore31TodayCardChinLockupListIconView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/TodayCardChinLockupListView.swift", 42, 2, 402, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
  v2 = v3.receiver;
  -[TodayCardChinLockupListIconView layoutSubviews](&v3, "layoutSubviews");
  ArtworkView.frame.setter(objc_msgSend(v2, "bounds", v3.receiver, v3.super_class));

}

- (void)handleTap
{
  _TtC8AppStore31TodayCardChinLockupListIconView *v2;

  v2 = self;
  sub_1000D121C();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31TodayCardChinLockupListIconView_artworkView));
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore31TodayCardChinLockupListIconView_clickAction, (uint64_t *)&unk_100835F20);
}

@end
