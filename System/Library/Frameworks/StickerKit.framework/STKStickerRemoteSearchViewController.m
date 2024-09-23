@implementation STKStickerRemoteSearchViewController

- (STKStickerRemoteSearchViewControllerDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___STKStickerRemoteSearchViewController_delegate;
  swift_beginAccess();
  return (STKStickerRemoteSearchViewControllerDelegate *)(id)MEMORY[0x234944A84](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (void)viewDidLoad
{
  STKStickerRemoteSearchViewController *v2;

  v2 = self;
  StickerRemoteSearchViewController.viewDidLoad()();

}

- (void)searchWithQuery:(id)a3
{
  sub_2346CD520(self, (uint64_t)a2, a3, 0, (uint64_t (*)(uint64_t, id, _QWORD, _QWORD))sub_2346301B0);
}

- (void)configureWithConfiguration:(id)a3
{
  sub_2346CD520(self, (uint64_t)a2, a3, 1, (uint64_t (*)(uint64_t, id, _QWORD, _QWORD))sub_2346301CC);
}

- (void)didSelectEmoji:(id)a3 indexPath:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void *v11;
  STKStickerRemoteSearchViewController *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v5 = sub_234715B64();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_234717754();
  sub_234715B1C();
  v9 = (char *)self + OBJC_IVAR___STKStickerRemoteSearchViewController_delegate;
  swift_beginAccess();
  v10 = MEMORY[0x234944A84](v9);
  if (v10)
  {
    v11 = (void *)v10;
    v12 = self;
    v13 = (void *)sub_234717730();
    v14 = (void *)sub_234715B10();
    objc_msgSend(v11, sel_didSelectEmoji_indexPath_, v13, v14);

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)didSelectSticker:(id)a3 indexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  id v14;
  STKStickerRemoteSearchViewController *v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2561718D0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_234715B64();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_234715B1C();
  v13 = sub_2347179AC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v8, 1, 1, v13);
  sub_23471797C();
  v14 = a3;
  v15 = self;
  v16 = sub_234717970();
  v17 = (_QWORD *)swift_allocObject();
  v18 = MEMORY[0x24BEE6930];
  v17[2] = v16;
  v17[3] = v18;
  v17[4] = v14;
  sub_23460CBA4((uint64_t)v8, (uint64_t)&unk_25617AE20, (uint64_t)v17);

  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)toggleGlow:(BOOL)a3
{
  STKStickerRemoteSearchViewController *v4;

  v4 = self;
  StickerRemoteSearchViewController.toggleGlow(_:)(a3);

}

- (void)didRequestEmojiCreationWithSearchString:(id)a3
{
  sub_2346CDFF8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))StickerRemoteSearchViewController.didRequestEmojiCreation(searchString:));
}

- (void)presentEmojiGenerationControllerWithInputString:(id)a3
{
  sub_2346CDFF8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))StickerRemoteSearchViewController.presentEmojiGenerationControllerWithInputString(_:));
}

- (void)presentCreateStickerPhotoPickerController
{
  void *v3;
  STKStickerRemoteSearchViewController *v4;
  char *v5;
  char *v6;

  v3 = (void *)objc_opt_self();
  v4 = self;
  objc_msgSend(v3, sel_clearActiveKBForwardingInputDelegateAndResign_, 0);
  type metadata accessor for StickerRemotePhotosViewController();
  v5 = (char *)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  v6 = &v5[OBJC_IVAR____TtC10StickerKit33StickerRemotePhotosViewController_delegate];
  swift_beginAccess();
  *((_QWORD *)v6 + 1) = &protocol witness table for StickerRemoteSearchViewController;
  swift_unknownObjectWeakAssign();
  sub_23466D5CC(v5);

}

- (void)presentAvatarEditor
{
  void *v3;
  STKStickerRemoteSearchViewController *v4;
  char *v5;
  char *v6;

  v3 = (void *)objc_opt_self();
  v4 = self;
  objc_msgSend(v3, sel_clearActiveKBForwardingInputDelegateAndResign_, 0);
  type metadata accessor for AvatarEditorRemoteViewController();
  v5 = (char *)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  v6 = &v5[OBJC_IVAR____TtC10StickerKit32AvatarEditorRemoteViewController_delegate];
  swift_beginAccess();
  *((_QWORD *)v6 + 1) = &protocol witness table for StickerRemoteSearchViewController;
  swift_unknownObjectWeakAssign();
  sub_23466D5CC(v5);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)dealloc
{
  objc_class *ObjectType;
  uint64_t v4;
  STKStickerRemoteSearchViewController *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = qword_256171D90;
  v5 = self;
  if (v4 != -1)
    swift_once();
  v6 = sub_234716224();
  __swift_project_value_buffer(v6, (uint64_t)qword_25617AD20);
  v7 = sub_23471620C();
  v8 = sub_234717AE4();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_23459E000, v7, v8, "deinit", v9, 2u);
    MEMORY[0x2349449B8](v9, -1, -1);
  }

  v10.receiver = v5;
  v10.super_class = ObjectType;
  -[STKStickerRemoteSearchViewController dealloc](&v10, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___STKStickerRemoteSearchViewController__sceneHostingController;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256176750);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_2345B0C20((uint64_t)self + OBJC_IVAR___STKStickerRemoteSearchViewController_delegate);
}

- (STKStickerRemoteSearchViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_class *ObjectType;
  void *v8;
  STKStickerRemoteSearchViewController *v9;
  id v10;
  void *v11;
  STKStickerRemoteSearchViewController *v12;
  objc_super v14;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_234717754();
    a3 = v8;
  }
  sub_2345B0BE8(0, (unint64_t *)&unk_256176570);
  v9 = self;
  v10 = a4;
  sub_234717B74();
  swift_unknownObjectWeakInit();

  if (a3)
  {
    v11 = (void *)sub_234717730();
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = 0;
  }
  v14.receiver = v9;
  v14.super_class = ObjectType;
  v12 = -[STKStickerRemoteSearchViewController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, v11, v10);

  return v12;
}

- (STKStickerRemoteSearchViewController)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  id v6;
  STKStickerRemoteSearchViewController *v7;
  STKStickerRemoteSearchViewController *v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  sub_2345B0BE8(0, (unint64_t *)&unk_256176570);
  v6 = a3;
  v7 = self;
  sub_234717B74();
  swift_unknownObjectWeakInit();

  v10.receiver = v7;
  v10.super_class = ObjectType;
  v8 = -[STKStickerRemoteSearchViewController initWithCoder:](&v10, sel_initWithCoder_, v6);

  return v8;
}

- (void)emojiGenerationRemoteController:(id)a3 didGenerateEmoji:(id)a4 shouldInsert:(BOOL)a5
{
  id v8;
  id v9;
  STKStickerRemoteSearchViewController *v10;

  v8 = a3;
  v9 = a4;
  v10 = self;
  StickerRemoteSearchViewController.emojiGenerationRemoteController(_:didGenerateEmoji:shouldInsert:)(v8, v9, a5);

}

- (void)emojiGenerationRemoteControllerDidCancel:(id)a3
{
  id v4;
  STKStickerRemoteSearchViewController *v5;

  v4 = a3;
  v5 = self;
  StickerRemoteSearchViewController.avatarEditorRemoteViewControllerShouldDismiss(_:)(v4);

}

@end
