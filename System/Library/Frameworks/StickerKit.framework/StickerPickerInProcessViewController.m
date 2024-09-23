@implementation StickerPickerInProcessViewController

- (void)loadView
{
  _TtC10StickerKit36StickerPickerInProcessViewController *v2;

  v2 = self;
  sub_2346E2C80();

}

- (void)handleCloseButton
{
  id v2;
  void *v3;
  _TtC10StickerKit36StickerPickerInProcessViewController *v4;
  _TtC10StickerKit36StickerPickerInProcessViewController *v5;
  _TtC10StickerKit36StickerPickerInProcessViewController *v6;

  v6 = self;
  v2 = -[StickerPickerInProcessViewController _hostedWindowScene](v6, sel__hostedWindowScene);
  if (v2)
  {
    v3 = v2;
    v4 = (_TtC10StickerKit36StickerPickerInProcessViewController *)objc_msgSend((id)objc_opt_self(), sel_actionForStickerPickerSceneDidRequestDismissal);
    objc_msgSend(v3, sel_sendAction_, v4);

    v5 = v4;
  }
  else
  {
    v5 = v6;
  }

}

- (_TtC10StickerKit36StickerPickerInProcessViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC10StickerKit36StickerPickerInProcessViewController *v10;
  id v11;
  void *v12;
  _TtC10StickerKit36StickerPickerInProcessViewController *v13;
  objc_super v15;

  if (a3)
  {
    sub_234717754();
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  v8 = OBJC_IVAR____TtC10StickerKit36StickerPickerInProcessViewController_nav;
  v9 = objc_allocWithZone(MEMORY[0x24BEBD7A0]);
  v10 = self;
  v11 = a4;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(v9, sel_init);

  if (v7)
  {
    v12 = (void *)sub_234717730();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  v15.receiver = v10;
  v15.super_class = (Class)type metadata accessor for StickerPickerInProcessViewController();
  v13 = -[StickerPickerInProcessViewController initWithNibName:bundle:](&v15, sel_initWithNibName_bundle_, v12, v11);

  return v13;
}

- (_TtC10StickerKit36StickerPickerInProcessViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC10StickerKit36StickerPickerInProcessViewController *v8;
  _TtC10StickerKit36StickerPickerInProcessViewController *v9;
  objc_super v11;

  v5 = OBJC_IVAR____TtC10StickerKit36StickerPickerInProcessViewController_nav;
  v6 = objc_allocWithZone(MEMORY[0x24BEBD7A0]);
  v7 = a3;
  v8 = self;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for StickerPickerInProcessViewController();
  v9 = -[StickerPickerInProcessViewController initWithCoder:](&v11, sel_initWithCoder_, v7);

  return v9;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit36StickerPickerInProcessViewController_nav));
}

@end
