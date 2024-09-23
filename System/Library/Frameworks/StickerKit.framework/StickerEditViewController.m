@implementation StickerEditViewController

- (_TtC10StickerKit25StickerEditViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2346E2144();
}

- (void)loadView
{
  _TtC10StickerKit25StickerEditViewController *v2;

  v2 = self;
  sub_2346DFED8();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC10StickerKit25StickerEditViewController *v4;

  v4 = self;
  sub_2346E0A78(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for StickerEditViewController();
  v4 = v5.receiver;
  -[StickerEditViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
  v4[OBJC_IVAR____TtC10StickerKit25StickerEditViewController_isPaused] = 1;
  sub_2346DE8B8();

}

- (void)viewDidLayoutSubviews
{
  _TtC10StickerKit25StickerEditViewController *v2;

  v2 = self;
  sub_2346E0C38();

}

- (void)handleDoneButton
{
  _TtC10StickerKit25StickerEditViewController *v2;

  v2 = self;
  sub_2346E0EC4();

}

- (void)handleLiveButton
{
  _TtC10StickerKit25StickerEditViewController *v2;

  v2 = self;
  sub_2346E1040();

}

- (_TtC10StickerKit25StickerEditViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC10StickerKit25StickerEditViewController *result;

  v4 = a4;
  result = (_TtC10StickerKit25StickerEditViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit25StickerEditViewController_preLiveSickerEffect));
  sub_2345B5CF0(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC10StickerKit25StickerEditViewController__animatedData), *(_QWORD *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC10StickerKit25StickerEditViewController__animatedData));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit25StickerEditViewController__image));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit25StickerEditViewController__effect));
  sub_2345B0C20((uint64_t)self + OBJC_IVAR____TtC10StickerKit25StickerEditViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit25StickerEditViewController____lazy_storage___previewView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit25StickerEditViewController____lazy_storage___effectChooser));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit25StickerEditViewController____lazy_storage___doneButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit25StickerEditViewController____lazy_storage___liveButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit25StickerEditViewController____lazy_storage___previewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit25StickerEditViewController____lazy_storage___previewHeightConstraint));
}

@end
