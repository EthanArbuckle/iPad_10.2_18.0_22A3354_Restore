@implementation LocalEmojiAndStickerCollectionViewController

- (void)viewDidLoad
{
  _TtC10StickerKit44LocalEmojiAndStickerCollectionViewController *v2;

  v2 = self;
  sub_23470F61C();

}

- (void)viewIsAppearing:(BOOL)a3
{
  _TtC10StickerKit44LocalEmojiAndStickerCollectionViewController *v3;

  v3 = self;
  sub_234714204();

}

- (void)handleKeyEvent:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC10StickerKit44LocalEmojiAndStickerCollectionViewController_uiEmojiAndStickerCollectionViewController), sel_handleKeyEvent_, a3);
}

- (void)didSelectEmoji:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC10StickerKit44LocalEmojiAndStickerCollectionViewController *v7;

  v4 = sub_234717754();
  v6 = v5;
  v7 = self;
  sub_2347102CC(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)didSelectEmoji:(id)a3 dismiss:(BOOL)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC10StickerKit44LocalEmojiAndStickerCollectionViewController *v9;

  v6 = sub_234717754();
  v8 = v7;
  v9 = self;
  sub_2347103EC(v6, v8, a4);

  swift_bridgeObjectRelease();
}

- (void)didBeginDragWithShouldDismiss:(BOOL)a3
{
  id v4;
  void *v5;
  _TtC10StickerKit44LocalEmojiAndStickerCollectionViewController *v6;
  _TtC10StickerKit44LocalEmojiAndStickerCollectionViewController *v7;
  _TtC10StickerKit44LocalEmojiAndStickerCollectionViewController *v8;

  v8 = self;
  v4 = -[LocalEmojiAndStickerCollectionViewController _hostedWindowScene](v8, sel__hostedWindowScene);
  if (v4)
  {
    v5 = v4;
    v6 = (_TtC10StickerKit44LocalEmojiAndStickerCollectionViewController *)sub_2347133F4(7, a3, 0, 0);
    objc_msgSend(v5, sel_sendAction_, v6);

    v7 = v6;
  }
  else
  {
    v7 = v8;
  }

}

- (void)didTapToInsertSticker:(id)a3
{
  sub_2346D2D24(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_234710638);
}

- (void)didTapToEdit:(id)a3
{
  sub_2346D2D24(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_234711454);
}

- (void)didTapToPresentPicker:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC10StickerKit44LocalEmojiAndStickerCollectionViewController *v8;
  id v9;
  void *v10;
  _TtC10StickerKit44LocalEmojiAndStickerCollectionViewController *v11;
  uint64_t v12;

  v4 = sub_234715870();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_234715840();
  v8 = self;
  v9 = -[LocalEmojiAndStickerCollectionViewController _hostedWindowScene](v8, sel__hostedWindowScene);
  if (v9)
  {
    v10 = v9;
    v11 = (_TtC10StickerKit44LocalEmojiAndStickerCollectionViewController *)sub_2347133F4(3, 1, 0, 0);
    objc_msgSend(v10, sel_sendAction_, v11);

    v8 = v11;
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)didTapToCreateNew:(id)a3
{
  sub_2346D2D24(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_2347118DC);
}

- (void)didChangePlaceholder:(id)a3
{
  sub_2346D2D24(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_234711B78);
}

- (void)stickerViewDidBeginDrag:(id)a3
{
  sub_2346D2D24(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_234711D0C);
}

- (void)handleWithPinch:(id)a3
{
  id v4;
  double v5;
  double v6;
  id v7;
  void *v8;
  _TtC10StickerKit44LocalEmojiAndStickerCollectionViewController *v9;
  _TtC10StickerKit44LocalEmojiAndStickerCollectionViewController *v10;

  v4 = a3;
  v10 = self;
  if (objc_msgSend(v4, sel_state) == (id)3)
  {
    objc_msgSend(v4, sel_scale);
    v6 = v5;
    v7 = -[LocalEmojiAndStickerCollectionViewController _hostedWindowScene](v10, sel__hostedWindowScene);
    if (v7)
    {
      v8 = v7;
      v9 = (_TtC10StickerKit44LocalEmojiAndStickerCollectionViewController *)sub_234713D48(v6, 6, 0, 0);
      objc_msgSend(v8, sel_sendAction_, v9);

      v4 = v8;
      v10 = v9;
    }
  }

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)dealloc
{
  _TtC10StickerKit44LocalEmojiAndStickerCollectionViewController *v2;

  v2 = self;
  LocalEmojiAndStickerCollectionViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit44LocalEmojiAndStickerCollectionViewController_uiEmojiAndStickerCollectionViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit44LocalEmojiAndStickerCollectionViewController_configuration));
  swift_release();
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC10StickerKit44LocalEmojiAndStickerCollectionViewController__pinchGestureRecognizer;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25617CE60);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (_TtC10StickerKit44LocalEmojiAndStickerCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC10StickerKit44LocalEmojiAndStickerCollectionViewController *)LocalEmojiAndStickerCollectionViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC10StickerKit44LocalEmojiAndStickerCollectionViewController)initWithCoder:(id)a3
{
  return (_TtC10StickerKit44LocalEmojiAndStickerCollectionViewController *)LocalEmojiAndStickerCollectionViewController.init(coder:)(a3);
}

- (void)viewWillDisappear:
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  id v4;

  if (qword_256171E68 != -1)
    swift_once();
  v0 = sub_234716224();
  __swift_project_value_buffer(v0, (uint64_t)qword_25617C9E0);
  v1 = sub_23471620C();
  v2 = sub_234717AE4();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_23459E000, v1, v2, "viewWillDisappear", v3, 2u);
    MEMORY[0x2349449B8](v3, -1, -1);
  }

  if (qword_256171738 != -1)
    swift_once();
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE2E820]), sel_initWithMachName_, 0);
  objc_msgSend(v4, sel_writeEmojiDefaults);

}

@end
