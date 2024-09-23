@implementation AvatarEditorCoordinator

- (void)avatarPicker:(id)a3 didSelectAvatarRecord:(id)a4
{
  _TtC10StickerKit23AvatarEditorCoordinator *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;

  if (a4)
  {
    if (MEMORY[0x234944A84]((char *)self + OBJC_IVAR____TtC10StickerKit23AvatarEditorCoordinator_delegate, a2))
    {
      swift_unknownObjectRetain_n();
      swift_unknownObjectRetain();
      v6 = self;
      v7 = objc_msgSend(a4, sel_identifier);
      v8 = sub_234717754();
      v10 = v9;

      sub_2345E4B64(v8, v10);
      swift_unknownObjectRelease();

      swift_bridgeObjectRelease();
      swift_unknownObjectRelease_n();
      swift_unknownObjectRelease();
    }
  }
}

- (void)presentAvatarUIController:(id)a3 animated:(BOOL)a4
{
  id v6;
  _TtC10StickerKit23AvatarEditorCoordinator *v7;

  if (MEMORY[0x234944A84]((char *)self + OBJC_IVAR____TtC10StickerKit23AvatarEditorCoordinator_delegate, a2, a3, a4))
  {
    v6 = a3;
    v7 = self;
    sub_2345E4D00(v6);

    swift_unknownObjectRelease();
  }
}

- (void)dismissAvatarUIControllerWithIdentifier:(id)a3 animated:(BOOL)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _TtC10StickerKit23AvatarEditorCoordinator *v8;

  if (a3)
  {
    v5 = (void *)sub_234717754();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  if (MEMORY[0x234944A84]((char *)self + OBJC_IVAR____TtC10StickerKit23AvatarEditorCoordinator_delegate))
  {
    v8 = self;
    sub_2345E4EEC(v5, v7);

    swift_unknownObjectRelease();
  }
  swift_bridgeObjectRelease();
}

- (_TtC10StickerKit23AvatarEditorCoordinator)init
{
  objc_super v4;

  *(_QWORD *)&self->delegate[OBJC_IVAR____TtC10StickerKit23AvatarEditorCoordinator_delegate] = 0;
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AvatarEditorCoordinator();
  return -[AvatarEditorCoordinator init](&v4, sel_init);
}

- (void).cxx_destruct
{
  sub_2345B0C20((uint64_t)self + OBJC_IVAR____TtC10StickerKit23AvatarEditorCoordinator_delegate);
}

@end
