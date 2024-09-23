@implementation EmojiGenerationController

- (void)dealloc
{
  void *v3;
  _TtC10StickerKit25EmojiGenerationController *v4;
  id v5;
  objc_super v6;

  v3 = (void *)objc_opt_self();
  v4 = self;
  v5 = objc_msgSend(v3, sel_defaultCenter);
  objc_msgSend(v5, sel_removeObserver_, v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for EmojiGenerationController();
  -[EmojiGenerationBaseController dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit25EmojiGenerationController_addButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit25EmojiGenerationController_cancelButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit25EmojiGenerationController_imageLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit25EmojiGenerationController_imageLayoutGuideDebugView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit25EmojiGenerationController_contextMenuButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit25EmojiGenerationController_imageDescriptionVC));
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  id v7;
  _TtC10StickerKit25EmojiGenerationController *v8;

  v7 = a3;
  v8 = self;
  sub_23464E0CC((uint64_t)a3, a4);

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC10StickerKit25EmojiGenerationController *v4;

  v4 = self;
  sub_23464E228(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for EmojiGenerationController();
  v4 = (char *)v5.receiver;
  -[EmojiGenerationBaseController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC10StickerKit29EmojiGenerationBaseController_promptEntryView], sel_resignFirstResponder, v5.receiver, v5.super_class);

}

- (void)didTapCancelButton:(id)a3
{
  id v4;
  _TtC10StickerKit25EmojiGenerationController *v5;

  v4 = a3;
  v5 = self;
  sub_234656B1C();

}

- (void)didTapInsertButton:(id)a3
{
  id v4;
  _TtC10StickerKit25EmojiGenerationController *v5;

  v4 = a3;
  v5 = self;
  sub_234656C60();

}

- (void)closeButtonPressed:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  _TtC10StickerKit25EmojiGenerationController *v10;

  v4 = qword_256171C40;
  v5 = a3;
  v10 = self;
  if (v4 != -1)
    swift_once();
  v6 = sub_234716224();
  __swift_project_value_buffer(v6, (uint64_t)qword_2561773B0);
  v7 = sub_23471620C();
  v8 = sub_234717B08();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_23459E000, v7, v8, "Emoji Gen: Close button pressed", v9, 2u);
    MEMORY[0x2349449B8](v9, -1, -1);
  }

  -[EmojiGenerationController dismissViewControllerAnimated:completion:](v10, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

- (void)appearanceDidChange
{
  _TtC10StickerKit25EmojiGenerationController *v2;

  v2 = self;
  sub_23464FC9C();

}

- (void)willBeginRotation:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC10StickerKit25EmojiGenerationController *v8;
  uint64_t v9;

  v4 = sub_234715870();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_234715840();
  v8 = self;
  sub_2346501F0();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC10StickerKit25EmojiGenerationController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_2346503B8(a4, width, height);
  swift_unknownObjectRelease();

}

- (_TtC10StickerKit25EmojiGenerationController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC10StickerKit25EmojiGenerationController *)EmojiGenerationController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC10StickerKit25EmojiGenerationController)initWithCoder:(id)a3
{
  return (_TtC10StickerKit25EmojiGenerationController *)EmojiGenerationController.init(coder:)(a3);
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  uint64_t v6;
  UIImagePickerController *v7;
  _TtC10StickerKit25EmojiGenerationController *v8;

  type metadata accessor for InfoKey(0);
  sub_2346085B4(&qword_256172510, 255, (uint64_t (*)(uint64_t))type metadata accessor for InfoKey, (uint64_t)&unk_23471E414);
  v6 = sub_2347176C4();
  v7 = (UIImagePickerController *)a3;
  v8 = self;
  EmojiGenerationController.imagePickerController(_:didFinishPickingMediaWithInfo:)(v7, (Swift::OpaquePointer)v6);

  swift_bridgeObjectRelease();
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  objc_msgSend(a3, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

- (void)imageDescriptionViewControllerDidCancel:(id)a3
{
  void *v3;

  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10StickerKit25EmojiGenerationController_imageDescriptionVC);
  if (v3)
    objc_msgSend(v3, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

- (void)imageDescriptionViewControllerDidSave:(id)a3
{
  id v4;
  _TtC10StickerKit25EmojiGenerationController *v5;

  v4 = a3;
  v5 = self;
  EmojiGenerationController.imageDescriptionViewControllerDidSave(_:)(v4);

}

- (void)addCaptionFromCarousel
{
  _TtC10StickerKit25EmojiGenerationController *v2;

  v2 = self;
  sub_234655E10();

}

@end
