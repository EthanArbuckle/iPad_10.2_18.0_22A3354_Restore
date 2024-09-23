@implementation StickerPhotosCoordinator

- (_TtC10StickerKit24StickerPhotosCoordinator)init
{
  return (_TtC10StickerKit24StickerPhotosCoordinator *)sub_23463C2C0();
}

- (void)dealloc
{
  void *v2;
  _TtC10StickerKit24StickerPhotosCoordinator *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10StickerKit24StickerPhotosCoordinator_picker);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10StickerKit24StickerPhotosCoordinator_picker) = 0;
  v3 = self;

  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for StickerPhotosCoordinator();
  -[StickerPhotosCoordinator dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_2345B0C20((uint64_t)self + OBJC_IVAR____TtC10StickerKit24StickerPhotosCoordinator_delegate);
  v3 = (char *)self + OBJC_IVAR____TtC10StickerKit24StickerPhotosCoordinator_analyticsCancelState;
  v4 = sub_234715B7C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
}

- (void)presentationControllerWillDismiss:(id)a3
{
  id v4;
  _TtC10StickerKit24StickerPhotosCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_23463FE64();

}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;
  _TtC10StickerKit24StickerPhotosCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_23463FF1C();

}

@end
