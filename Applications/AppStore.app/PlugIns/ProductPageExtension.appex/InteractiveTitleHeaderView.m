@implementation InteractiveTitleHeaderView

- (_TtC20ProductPageExtension26InteractiveTitleHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension26InteractiveTitleHeaderView *)sub_10060DCC4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension26InteractiveTitleHeaderView)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  char *v9;
  uint64_t v10;
  _TtC20ProductPageExtension26InteractiveTitleHeaderView *result;

  v5 = OBJC_IVAR____TtC20ProductPageExtension26InteractiveTitleHeaderView_titleView;
  v6 = type metadata accessor for TitleHeaderView(0);
  v7 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v6));
  v8 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v7, "init");
  v9 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension26InteractiveTitleHeaderView_currentState;
  v10 = type metadata accessor for InteractiveSectionBackgroundScrollObserver.State(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);

  result = (_TtC20ProductPageExtension26InteractiveTitleHeaderView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/InteractiveTitleHeaderView.swift", 53, 2, 46, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for InteractiveTitleHeaderView(0);
  v2 = (char *)v4.receiver;
  -[InteractiveTitleHeaderView layoutSubviews](&v4, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC20ProductPageExtension26InteractiveTitleHeaderView_titleView];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");

}

- (void)prepareForReuse
{
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  objc_class *v6;
  _TtC20ProductPageExtension26InteractiveTitleHeaderView *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v11[24];
  objc_super v12;

  v3 = sub_10000DAF8((uint64_t *)&unk_10081EB80);
  __chkstk_darwin(v3);
  v5 = &v11[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = (objc_class *)type metadata accessor for InteractiveTitleHeaderView(0);
  v12.receiver = self;
  v12.super_class = v6;
  v7 = self;
  -[InteractiveTitleHeaderView prepareForReuse](&v12, "prepareForReuse");
  objc_msgSend(*(id *)((char *)&v7->super.super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension26InteractiveTitleHeaderView_titleView), "prepareForReuse");
  v8 = type metadata accessor for InteractiveSectionBackgroundScrollObserver.State(0);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);
  v9 = (uint64_t)v7 + OBJC_IVAR____TtC20ProductPageExtension26InteractiveTitleHeaderView_currentState;
  swift_beginAccess((char *)v7 + OBJC_IVAR____TtC20ProductPageExtension26InteractiveTitleHeaderView_currentState, v11, 33, 0);
  sub_1001D536C((uint64_t)v5, v9);
  swift_endAccess(v11);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension26InteractiveTitleHeaderView_titleView));
  sub_10060E4F8((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension26InteractiveTitleHeaderView_currentState);
}

@end
