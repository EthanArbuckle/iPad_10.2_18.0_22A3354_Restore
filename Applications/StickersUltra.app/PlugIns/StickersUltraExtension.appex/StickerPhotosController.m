@implementation StickerPhotosController

- (_TtC22StickersUltraExtension23StickerPhotosController)init
{
  return (_TtC22StickersUltraExtension23StickerPhotosController *)sub_100034444();
}

- (void)dealloc
{
  void **v3;
  void *v4;
  _TtC22StickersUltraExtension23StickerPhotosController *v5;
  objc_super v6;
  _BYTE v7[24];

  v3 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC22StickersUltraExtension23StickerPhotosController_picker);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC22StickersUltraExtension23StickerPhotosController_picker, v7, 1, 0);
  v4 = *v3;
  *v3 = 0;
  v5 = self;

  v6.receiver = v5;
  v6.super_class = (Class)type metadata accessor for StickerPhotosController(0);
  -[StickerPhotosController dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_10000D10C((uint64_t)self + OBJC_IVAR____TtC22StickersUltraExtension23StickerPhotosController_delegate);
  v3 = (char *)self + OBJC_IVAR____TtC22StickersUltraExtension23StickerPhotosController_analyticsCancelState;
  v4 = type metadata accessor for StickersCancelState(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension23StickerPhotosController_picker));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC22StickersUltraExtension23StickerPhotosController_selection));
}

- (void)presentationControllerWillDismiss:(id)a3
{
  id v4;
  _TtC22StickersUltraExtension23StickerPhotosController *v5;

  v4 = a3;
  v5 = self;
  sub_100035CCC();

}

- (void)presentationControllerDidDismiss:(id)a3
{
  uint64_t (*v4)(void);
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t ObjectType;
  _TtC22StickersUltraExtension23StickerPhotosController *v11;

  v4 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x78);
  v5 = a3;
  v11 = self;
  v6 = v4();
  if (v6)
  {
    v8 = v6;
    v9 = v7;
    ObjectType = swift_getObjectType();
    (*(void (**)(_TtC22StickersUltraExtension23StickerPhotosController *, uint64_t, uint64_t))(v9 + 8))(v11, ObjectType, v9);

    swift_unknownObjectRelease(v8);
  }
  else
  {

  }
}

@end
