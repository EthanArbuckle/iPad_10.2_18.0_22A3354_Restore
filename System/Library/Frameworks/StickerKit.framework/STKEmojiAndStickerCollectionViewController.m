@implementation STKEmojiAndStickerCollectionViewController

- (STKEmojiAndStickerCollectionViewControllerDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___STKEmojiAndStickerCollectionViewController_delegate;
  swift_beginAccess();
  return (STKEmojiAndStickerCollectionViewControllerDelegate *)(id)MEMORY[0x234944A84](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (STKEmojiAndStickerCollectionViewConfiguration)configuration
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___STKEmojiAndStickerCollectionViewController_configuration);
  swift_beginAccess();
  return (STKEmojiAndStickerCollectionViewConfiguration *)*v2;
}

- (void)setConfiguration:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.super.super.isa
               + OBJC_IVAR___STKEmojiAndStickerCollectionViewController_configuration);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (void)viewDidLoad
{
  STKEmojiAndStickerCollectionViewController *v2;

  v2 = self;
  EmojiAndStickerCollectionViewController.viewDidLoad()();

}

- (void)viewIsAppearing:(BOOL)a3
{
  STKEmojiAndStickerCollectionViewController *v3;

  v3 = self;
  _s10StickerKit08EmojiAndA24CollectionViewControllerC15viewIsAppearingyySbF_0();

}

- (void)searchWithQuery:(id)a3
{
  char *v4;
  STKEmojiAndStickerCollectionViewController *v5;

  v4 = (char *)a3;
  v5 = self;
  EmojiAndStickerCollectionViewController.search(withQuery:)(v4);

}

- (void)handleKeyEvent:(id)a3
{
  id v4;
  STKEmojiAndStickerCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  EmojiAndStickerCollectionViewController.handleKeyEvent(_:)((UIKey)v4);

}

- (void)didSelectEmoji:(id)a3
{
  char *v4;
  uint64_t v5;
  void *v6;
  STKEmojiAndStickerCollectionViewController *v7;
  void *v8;

  sub_234717754();
  v4 = (char *)self + OBJC_IVAR___STKEmojiAndStickerCollectionViewController_delegate;
  swift_beginAccess();
  v5 = MEMORY[0x234944A84](v4);
  if (v5)
  {
    v6 = (void *)v5;
    v7 = self;
    v8 = (void *)sub_234717730();
    objc_msgSend(v6, sel_didSelectEmoji_, v8);

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

- (void)didSelectEmoji:(id)a3 dismiss:(BOOL)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  STKEmojiAndStickerCollectionViewController *v9;
  Swift::String v10;

  v6 = sub_234717754();
  v8 = v7;
  v9 = self;
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  EmojiAndStickerCollectionViewController.didSelectEmoji(_:dismiss:)(v10, a4);

  swift_bridgeObjectRelease();
}

- (void)didSelectSticker:(id)a3
{
  char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  STKEmojiAndStickerCollectionViewController *v9;

  v5 = (char *)self + OBJC_IVAR___STKEmojiAndStickerCollectionViewController_delegate;
  swift_beginAccess();
  v6 = MEMORY[0x234944A84](v5);
  if (v6)
  {
    v7 = (void *)v6;
    v8 = a3;
    v9 = self;
    objc_msgSend(v7, sel_didSelectSticker_, v8);

    swift_unknownObjectRelease();
  }
}

- (void)didSelectSticker:(id)a3 dismiss:(BOOL)a4
{
  id v6;
  STKEmojiAndStickerCollectionViewController *v7;

  v6 = a3;
  v7 = self;
  EmojiAndStickerCollectionViewController.didSelectSticker(_:dismiss:)((uint64_t)v6, a4);

}

- (void)didSelectEditWithStickerIdentifer:(id)a3 sourceRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  void *v15;
  STKEmojiAndStickerCollectionViewController *v16;
  void *v17;
  uint64_t v18;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = sub_234715A98();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_234715A80();
  v13 = (char *)self + OBJC_IVAR___STKEmojiAndStickerCollectionViewController_delegate;
  swift_beginAccess();
  v14 = MEMORY[0x234944A84](v13);
  if (v14)
  {
    v15 = (void *)v14;
    v16 = self;
    v17 = (void *)sub_234715A68();
    objc_msgSend(v15, sel_didSelectEditWithStickerIdentifer_sourceRect_, v17, x, y, width, height);

    swift_unknownObjectRelease();
  }
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)didSelectPresentPicker
{
  char *v3;
  uint64_t v4;
  void *v5;
  STKEmojiAndStickerCollectionViewController *v6;

  v3 = (char *)self + OBJC_IVAR___STKEmojiAndStickerCollectionViewController_delegate;
  swift_beginAccess();
  v4 = MEMORY[0x234944A84](v3);
  if (v4)
  {
    v5 = (void *)v4;
    v6 = self;
    objc_msgSend(v5, sel_didSelectPresentPicker);

    swift_unknownObjectRelease();
  }
}

- (void)didSelectCreate:(id)a3 queryString:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  STKEmojiAndStickerCollectionViewController *v14;
  uint64_t v15;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2561716C0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_234715A80();
    v10 = sub_234715A98();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 0, 1, v10);
  }
  else
  {
    v11 = sub_234715A98();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v9, 1, 1, v11);
  }
  if (a4)
  {
    v12 = sub_234717754();
    a4 = v13;
  }
  else
  {
    v12 = 0;
  }
  v14 = self;
  EmojiAndStickerCollectionViewController.didSelectCreate(_:queryString:)((uint64_t)v9, v12, (uint64_t)a4);

  swift_bridgeObjectRelease();
  sub_2345B0988((uint64_t)v9, (uint64_t *)&unk_2561716C0);
}

- (void)didPinch:(double)a3
{
  int v5;
  void *v6;
  STKEmojiAndStickerCollectionViewController *v7;

  v5 = a3 < 1.0;
  v6 = (void *)objc_opt_self();
  v7 = self;
  if (v5 != objc_msgSend(v6, sel_isFloating))
    objc_msgSend(v6, sel_setFloating_positionedAtDefaultOffsetAnimated_, a3 < 1.0, 0);

}

- (void)didBeingDrag:(BOOL)a3
{
  void *v4;
  STKEmojiAndStickerCollectionViewController *v5;
  id v6;
  id v7;

  if (a3)
  {
    v4 = (void *)objc_opt_self();
    v5 = self;
    v6 = objc_msgSend(v4, sel_defaultCenter);
    v7 = (id)sub_234717730();
    objc_msgSend(v6, sel_postNotificationName_object_, v7, v5);

  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)transitionerForConnectingHostingController:(id)a3
{
  void *v3;
  _QWORD v5[6];

  v5[4] = sub_23462E1F4;
  v5[5] = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 1107296256;
  v5[2] = sub_2346524EC;
  v5[3] = &block_descriptor_12;
  v3 = _Block_copy(v5);
  swift_release();
  return v3;
}

- (void)dealloc
{
  objc_class *ObjectType;
  uint64_t v4;
  STKEmojiAndStickerCollectionViewController *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = qword_256171BE8;
  v5 = self;
  if (v4 != -1)
    swift_once();
  v6 = sub_234716224();
  __swift_project_value_buffer(v6, (uint64_t)qword_256176520);
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
  -[STKEmojiAndStickerCollectionViewController dealloc](&v10, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___STKEmojiAndStickerCollectionViewController__sceneHostingController;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256176750);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_2345B0C20((uint64_t)self + OBJC_IVAR___STKEmojiAndStickerCollectionViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___STKEmojiAndStickerCollectionViewController_configuration));
  swift_bridgeObjectRelease();
}

- (STKEmojiAndStickerCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_234717754();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (STKEmojiAndStickerCollectionViewController *)EmojiAndStickerCollectionViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (STKEmojiAndStickerCollectionViewController)initWithCoder:(id)a3
{
  return (STKEmojiAndStickerCollectionViewController *)EmojiAndStickerCollectionViewController.init(coder:)(a3);
}

- (void)emojiGenerationRemoteController:(id)a3 didGenerateEmoji:(id)a4 shouldInsert:(BOOL)a5
{
  id v8;
  id v9;
  STKEmojiAndStickerCollectionViewController *v10;

  v8 = a3;
  v9 = a4;
  v10 = self;
  EmojiAndStickerCollectionViewController.emojiGenerationRemoteController(_:didGenerateEmoji:shouldInsert:)(v8, v9, a5);

}

- (void)emojiGenerationRemoteControllerDidCancel:(id)a3
{
  id v4;
  STKEmojiAndStickerCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  EmojiAndStickerCollectionViewController.emojiGenerationRemoteControllerDidCancel(_:)(v4);

}

@end
