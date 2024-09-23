@implementation EmojiGenerationBaseController

- (void)dealloc
{
  _TtC10StickerKit29EmojiGenerationBaseController *v3;
  _TtC10StickerKit29EmojiGenerationBaseController *v4;
  objc_super v5;

  if (*(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10StickerKit29EmojiGenerationBaseController_networkMonitor))
  {
    v3 = self;
    swift_retain();
    sub_2347164B8();
    swift_release();
  }
  else
  {
    v4 = self;
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for EmojiGenerationBaseController();
  -[EmojiGenerationBaseController dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit29EmojiGenerationBaseController_pillVC));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit29EmojiGenerationBaseController_pillContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit29EmojiGenerationBaseController_promptEntryView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit29EmojiGenerationBaseController_carouselVC));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit29EmojiGenerationBaseController_imageDescriptionVC));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_2346C04A8(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC10StickerKit29EmojiGenerationBaseController____lazy_storage___generationCache));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit29EmojiGenerationBaseController_noResultsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit29EmojiGenerationBaseController_noPersonView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit29EmojiGenerationBaseController_skinColorSelectionVC));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit29EmojiGenerationBaseController_skinColorSelectionView));
  swift_bridgeObjectRelease();
}

- (void)viewDidLoad
{
  _TtC10StickerKit29EmojiGenerationBaseController *v2;

  v2 = self;
  sub_2346BD7F4();

}

- (_TtC10StickerKit29EmojiGenerationBaseController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC10StickerKit29EmojiGenerationBaseController *)EmojiGenerationBaseController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC10StickerKit29EmojiGenerationBaseController)initWithCoder:(id)a3
{
  return (_TtC10StickerKit29EmojiGenerationBaseController *)EmojiGenerationBaseController.init(coder:)(a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  sub_2346BFB6C(self, (uint64_t)a2, a3, (const char **)&selRef_viewWillAppear_, (void (*)(id))sub_2346C0114);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC10StickerKit29EmojiGenerationBaseController *v4;

  v4 = self;
  EmojiGenerationBaseController.viewDidDisappear(_:)(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  sub_2346BFB6C(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidAppear_, (void (*)(id))sub_2346C02D4);
}

@end
