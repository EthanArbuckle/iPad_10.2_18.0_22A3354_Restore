@implementation AvatarPickerCoordinator

- (void)avatarPicker:(id)a3 didSelectAvatarRecord:(id)a4
{
  _TtC22StickersUltraExtension23AvatarPickerCoordinator *v7;

  swift_unknownObjectRetain(a3);
  swift_unknownObjectRetain(a4);
  v7 = self;
  sub_10000E3D8((uint64_t)a4);
  swift_unknownObjectRelease(a3);
  swift_unknownObjectRelease(a4);

}

- (void)presentAvatarUIController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void (*v6)(_QWORD *__return_ptr);
  id v7;
  _TtC22StickersUltraExtension23AvatarPickerCoordinator *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[3];
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[9];

  v4 = a4;
  v6 = *(void (**)(_QWORD *__return_ptr))((swift_isaMask & (uint64_t)self->super.isa) + 0x58);
  v7 = a3;
  v8 = self;
  v6(v14);
  if (v14[3])
  {
    sub_10000E4F4((uint64_t)v14, (uint64_t)v11);
    sub_10000D960((uint64_t)v14);
    v9 = v12;
    v10 = v13;
    sub_10000E538(v11, v12);
    (*(void (**)(id, _BOOL8, uint64_t, uint64_t))(v10 + 16))(v7, v4, v9, v10);
    sub_10000D4A4(v11);
  }
  else
  {
    sub_10000D960((uint64_t)v14);
  }

}

- (void)dismissAvatarUIControllerWithIdentifier:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(_QWORD *__return_ptr);
  _TtC22StickersUltraExtension23AvatarPickerCoordinator *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[3];
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[9];

  v4 = a4;
  if (a3)
  {
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = *(void (**)(_QWORD *__return_ptr))((swift_isaMask & (uint64_t)self->super.isa) + 0x58);
  v10 = self;
  v9(v16);
  if (v16[3])
  {
    sub_10000E4F4((uint64_t)v16, (uint64_t)v13);
    sub_10000D960((uint64_t)v16);
    v11 = v14;
    v12 = v15;
    sub_10000E538(v13, v14);
    (*(void (**)(uint64_t, uint64_t, _BOOL8, uint64_t, uint64_t))(v12 + 24))(v6, v8, v4, v11, v12);
    sub_10000D4A4(v13);
  }
  else
  {
    sub_10000D960((uint64_t)v16);
  }

  swift_bridgeObjectRelease(v8);
}

- (_TtC22StickersUltraExtension23AvatarPickerCoordinator)init
{
  _TtC22StickersUltraExtension23AvatarPickerCoordinator *result;

  result = (_TtC22StickersUltraExtension23AvatarPickerCoordinator *)_swift_stdlib_reportUnimplementedInitializer("StickersUltraExtension.AvatarPickerCoordinator", 46, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10000D960((uint64_t)self + OBJC_IVAR____TtC22StickersUltraExtension23AvatarPickerCoordinator_parent);
}

@end
