@implementation StickerProvidingViewController

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for StickerProvidingViewController();
  v4 = v8.receiver;
  -[StickerProvidingViewController viewWillAppear:](&v8, "viewWillAppear:", v3);
  v5 = objc_msgSend(v4, "view", v8.receiver, v8.super_class);
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend((id)objc_opt_self(UIColor), "clearColor");
    objc_msgSend(v6, "setBackgroundColor:", v7);

  }
  else
  {
    __break(1u);
  }
}

- (_TtC22StickersUltraExtension30StickerProvidingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC22StickersUltraExtension30StickerProvidingViewController *)sub_10004AEE4(v5, v7, a4);
}

- (_TtC22StickersUltraExtension30StickerProvidingViewController)initWithCoder:(id)a3
{
  return (_TtC22StickersUltraExtension30StickerProvidingViewController *)sub_10004B004(a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC22StickersUltraExtension30StickerProvidingViewController_delegate));
  swift_bridgeObjectRelease(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC22StickersUltraExtension30StickerProvidingViewController__puppetIdentifier]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC22StickersUltraExtension30StickerProvidingViewController__thirdPartyAppIdentifier]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension30StickerProvidingViewController_activeController));
}

@end
