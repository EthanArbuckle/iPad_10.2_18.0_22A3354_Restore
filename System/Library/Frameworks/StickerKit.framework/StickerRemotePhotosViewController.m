@implementation StickerRemotePhotosViewController

- (id)activityType
{
  void *v2;

  sub_234717754();
  v2 = (void *)sub_234717730();
  swift_bridgeObjectRelease();
  return v2;
}

- (_TtC10StickerKit33StickerRemotePhotosViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _TtC10StickerKit33StickerRemotePhotosViewController *v9;
  objc_super v11;

  if (a3)
  {
    sub_234717754();
    *(_QWORD *)((char *)&self->super.super.super._responderFlags
              + OBJC_IVAR____TtC10StickerKit33StickerRemotePhotosViewController_delegate) = 0;
    swift_unknownObjectWeakInit();
    v6 = a4;
    v7 = (void *)sub_234717730();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(_QWORD *)((char *)&self->super.super.super._responderFlags
              + OBJC_IVAR____TtC10StickerKit33StickerRemotePhotosViewController_delegate) = 0;
    swift_unknownObjectWeakInit();
    v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for StickerRemotePhotosViewController();
  v9 = -[RemoteBaseSceneHostingController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, v7, a4);

  return v9;
}

- (_TtC10StickerKit33StickerRemotePhotosViewController)initWithCoder:(id)a3
{
  objc_super v6;

  *(_QWORD *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC10StickerKit33StickerRemotePhotosViewController_delegate) = 0;
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for StickerRemotePhotosViewController();
  return -[RemoteBaseSceneHostingController initWithCoder:](&v6, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_2345B0C20((uint64_t)self + OBJC_IVAR____TtC10StickerKit33StickerRemotePhotosViewController_delegate);
}

- (void)stickerPhotosViewControllerShouldDismiss
{
  char *v3;
  uint64_t v4;
  void (*v5)(void);
  _TtC10StickerKit33StickerRemotePhotosViewController *v6;

  v3 = (char *)self + OBJC_IVAR____TtC10StickerKit33StickerRemotePhotosViewController_delegate;
  swift_beginAccess();
  if (MEMORY[0x234944A84](v3))
  {
    v4 = *((_QWORD *)v3 + 1);
    swift_getObjectType();
    v5 = *(void (**)(void))(v4 + 8);
    v6 = self;
    v5();

    swift_unknownObjectRelease();
  }
}

- (void)stickerPhotosViewControllerWithDidCreate:(id)a3
{
  char *v4;
  uint64_t v5;
  void (*v6)(void);
  _TtC10StickerKit33StickerRemotePhotosViewController *v7;

  sub_234717598();
  sub_2347178BC();
  v4 = (char *)self + OBJC_IVAR____TtC10StickerKit33StickerRemotePhotosViewController_delegate;
  swift_beginAccess();
  if (MEMORY[0x234944A84](v4))
  {
    v5 = *((_QWORD *)v4 + 1);
    swift_getObjectType();
    v6 = *(void (**)(void))(v5 + 16);
    v7 = self;
    v6();

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

- (void)stickerPhotosViewControllerWithDidCreate:(id)a3 isLive:(BOOL)a4
{
  char *v6;
  uint64_t v7;
  void (*v8)(void);
  id v9;
  _TtC10StickerKit33StickerRemotePhotosViewController *v10;

  v6 = (char *)self + OBJC_IVAR____TtC10StickerKit33StickerRemotePhotosViewController_delegate;
  swift_beginAccess();
  if (MEMORY[0x234944A84](v6))
  {
    v7 = *((_QWORD *)v6 + 1);
    swift_getObjectType();
    v8 = *(void (**)(void))(v7 + 24);
    v9 = a3;
    v10 = self;
    v8();

    swift_unknownObjectRelease();
  }
}

@end
