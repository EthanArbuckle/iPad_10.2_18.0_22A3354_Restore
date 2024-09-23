@implementation AvatarPickerCoordinator

- (void)avatarPicker:(id)a3 didSelectAvatarRecord:(id)a4
{
  _TtC10StickerKit23AvatarPickerCoordinator *v6;

  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v6 = self;
  sub_23467DDF0(a4);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

}

- (void)presentAvatarUIController:(id)a3 animated:(BOOL)a4
{
  id v6;
  _TtC10StickerKit23AvatarPickerCoordinator *v7;

  v6 = a3;
  v7 = self;
  sub_23467CDFC((uint64_t)v6, a4);

}

- (void)dismissAvatarUIControllerWithIdentifier:(id)a3 animated:(BOOL)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC10StickerKit23AvatarPickerCoordinator *v9;

  if (a3)
  {
    v6 = sub_234717754();
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = self;
  sub_23467CFAC(v6, v8, a4);

  swift_bridgeObjectRelease();
}

- (_TtC10StickerKit23AvatarPickerCoordinator)init
{
  _TtC10StickerKit23AvatarPickerCoordinator *result;

  result = (_TtC10StickerKit23AvatarPickerCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_23467DC68((uint64_t)self + OBJC_IVAR____TtC10StickerKit23AvatarPickerCoordinator_parent);
}

@end
