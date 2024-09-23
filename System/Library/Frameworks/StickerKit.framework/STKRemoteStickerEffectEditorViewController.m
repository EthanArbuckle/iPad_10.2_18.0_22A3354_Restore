@implementation STKRemoteStickerEffectEditorViewController

- (id)activityType
{
  void *v2;

  sub_234717754();
  v2 = (void *)sub_234717730();
  swift_bridgeObjectRelease();
  return v2;
}

- (STKRemoteStickerEffectEditorViewController)initWithStickerIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  STKRemoteStickerEffectEditorViewController *v9;
  objc_class *v10;
  STKRemoteStickerEffectEditorViewController *v11;
  uint64_t v13;
  objc_super v14;

  v4 = sub_234715A98();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_234715A80();
  v8 = (char *)self + OBJC_IVAR___STKRemoteStickerEffectEditorViewController_stickerIdentifier;
  v9 = self;
  sub_234715A8C();
  swift_unknownObjectWeakInit();
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v5 + 24))(v8, v7, v4);
  swift_endAccess();

  v10 = (objc_class *)type metadata accessor for RemoteStickerEffectEditorViewController();
  v14.receiver = v9;
  v14.super_class = v10;
  v11 = -[RemoteBaseSceneHostingController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, 0, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v11;
}

- (STKRemoteStickerEffectEditorViewController)initWithCoder:(id)a3
{
  id v4;
  STKRemoteStickerEffectEditorViewController *result;

  v4 = a3;
  sub_234715A8C();
  swift_unknownObjectWeakInit();

  result = (STKRemoteStickerEffectEditorViewController *)sub_2347180B4();
  __break(1u);
  return result;
}

- (STKStickerEffectEditorViewControllerDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___STKRemoteStickerEffectEditorViewController_delegate;
  swift_beginAccess();
  return (STKStickerEffectEditorViewControllerDelegate *)(id)MEMORY[0x234944A84](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (void)stickerEffectEditorViewControllerControllerDidTapDone
{
  char *v3;
  uint64_t v4;
  void *v5;
  STKRemoteStickerEffectEditorViewController *v6;

  v3 = (char *)self + OBJC_IVAR___STKRemoteStickerEffectEditorViewController_delegate;
  swift_beginAccess();
  v4 = MEMORY[0x234944A84](v3);
  if (v4)
  {
    v5 = (void *)v4;
    v6 = self;
    objc_msgSend(v5, sel_stickerEffectEditorViewControllerControllerDidTapDone);

    swift_unknownObjectRelease();
  }
}

- (void)showStickerEffectViewWithSourceRect:(CGRect)a3 showing:(BOOL)a4
{
  STKRemoteStickerEffectEditorViewController *v4;
  id v5;
  id v6;
  __int128 v7;
  CGFloat width;
  CGFloat height;
  BOOL v10;

  *(CGFloat *)&v7 = a3.origin.x;
  *((_QWORD *)&v7 + 1) = *(_QWORD *)&a3.origin.y;
  width = a3.size.width;
  height = a3.size.height;
  v10 = a4;
  v4 = self;
  v5 = sub_2345CDC1C(0, &v7, 0, 1);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_234717B5C();
  swift_release();
  swift_release();
  objc_msgSend(v6, sel_sendAction_, v5);

}

- (STKRemoteStickerEffectEditorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  STKRemoteStickerEffectEditorViewController *result;

  v4 = a4;
  result = (STKRemoteStickerEffectEditorViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___STKRemoteStickerEffectEditorViewController_stickerIdentifier;
  v4 = sub_234715A98();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_2345B0C20((uint64_t)self + OBJC_IVAR___STKRemoteStickerEffectEditorViewController_delegate);
}

@end
