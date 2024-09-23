@implementation AvatarStickersViewController

- (_TtC22StickersUltraExtension28AvatarStickersViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100069368();
}

- (void)viewDidLoad
{
  void (*v2)(void);
  id v3;
  void *v4;
  _QWORD *v5;
  _TtC22StickersUltraExtension28AvatarStickersViewController *v6;

  v2 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0x108);
  v6 = self;
  v2();
  v3 = -[AvatarStickersViewController view](v6, "view");
  if (v3)
  {
    v4 = v3;
    type metadata accessor for KeylineView();
    v5 = sub_100046D0C(v4);
    (*(void (**)(_QWORD *))((swift_isaMask & (uint64_t)v6->super.super.super.isa) + 0xA0))(v5);

  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidLayoutSubviews
{
  _TtC22StickersUltraExtension28AvatarStickersViewController *v2;

  v2 = self;
  sub_100068CC8();

}

- (_TtC22StickersUltraExtension28AvatarStickersViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC22StickersUltraExtension28AvatarStickersViewController *result;

  v4 = a4;
  result = (_TtC22StickersUltraExtension28AvatarStickersViewController *)_swift_stdlib_reportUnimplementedInitializer("StickersUltraExtension.AvatarStickersViewController", 51, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension28AvatarStickersViewController_stickerSheetView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension28AvatarStickersViewController_keyline));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC22StickersUltraExtension28AvatarStickersViewController_puppetRecord));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC22StickersUltraExtension28AvatarStickersViewController_delegate));
  swift_bridgeObjectRelease(*(_QWORD *)&self->stickerSheetView[OBJC_IVAR____TtC22StickersUltraExtension28AvatarStickersViewController_puppetIdentifier]);
}

- (id)stickerSheetControllerProvider:(id)a3 requestsStickerForFileURL:(id)a4 localizedDescription:(id)a5 forItemWithIdentifier:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  _TtC22StickersUltraExtension28AvatarStickersViewController *v22;
  id v23;
  uint64_t v25;

  v11 = type metadata accessor for URL(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v17 = v16;
  v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  v20 = v19;
  v21 = a3;
  v22 = self;
  v23 = sub_100069478((uint64_t)v14, v15, v17, v18, v20);

  swift_bridgeObjectRelease(v17);
  swift_bridgeObjectRelease(v20);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  return v23;
}

- (void)stickerSheetControllerDidScrollToContentOffset:(CGPoint)a3
{
  double y;
  uint64_t (*v4)(void);
  _TtC22StickersUltraExtension28AvatarStickersViewController *v5;
  _TtC22StickersUltraExtension28AvatarStickersViewController *v6;
  _TtC22StickersUltraExtension28AvatarStickersViewController *v7;
  _TtC22StickersUltraExtension28AvatarStickersViewController *v8;

  y = a3.y;
  v4 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0x98);
  v8 = self;
  v5 = (_TtC22StickersUltraExtension28AvatarStickersViewController *)v4();
  if (v5)
  {
    v6 = v5;
    (*(void (**)(double))((swift_isaMask & (uint64_t)v5->super.super.super.isa) + 0x58))(y);

    v7 = v6;
  }
  else
  {
    v7 = v8;
  }

}

- (void)stickerSheetControllerDidUpdateContent
{
  void (*v2)(void);
  _TtC22StickersUltraExtension28AvatarStickersViewController *v3;

  v2 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0x110);
  v3 = self;
  v2();

}

@end
