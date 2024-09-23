@implementation AvatarEditorRemoteViewController

- (id)activityType
{
  void *v2;

  sub_234717754();
  v2 = (void *)sub_234717730();
  swift_bridgeObjectRelease();
  return v2;
}

- (_TtC10StickerKit32AvatarEditorRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _TtC10StickerKit32AvatarEditorRemoteViewController *v9;
  objc_super v11;

  if (a3)
  {
    sub_234717754();
    *(_QWORD *)((char *)&self->super.super.super._responderFlags
              + OBJC_IVAR____TtC10StickerKit32AvatarEditorRemoteViewController_delegate) = 0;
    swift_unknownObjectWeakInit();
    v6 = a4;
    v7 = (void *)sub_234717730();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(_QWORD *)((char *)&self->super.super.super._responderFlags
              + OBJC_IVAR____TtC10StickerKit32AvatarEditorRemoteViewController_delegate) = 0;
    swift_unknownObjectWeakInit();
    v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for AvatarEditorRemoteViewController();
  v9 = -[RemoteBaseSceneHostingController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, v7, a4);

  return v9;
}

- (_TtC10StickerKit32AvatarEditorRemoteViewController)initWithCoder:(id)a3
{
  objc_super v6;

  *(_QWORD *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC10StickerKit32AvatarEditorRemoteViewController_delegate) = 0;
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AvatarEditorRemoteViewController();
  return -[RemoteBaseSceneHostingController initWithCoder:](&v6, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_2345B0C20((uint64_t)self + OBJC_IVAR____TtC10StickerKit32AvatarEditorRemoteViewController_delegate);
}

@end
