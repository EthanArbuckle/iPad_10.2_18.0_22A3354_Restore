@implementation EmojiCarouselViewController

- (void)viewDidLoad
{
  _TtC10StickerKit27EmojiCarouselViewController *v2;

  v2 = self;
  sub_2345A8734();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC10StickerKit27EmojiCarouselViewController *v4;

  v4 = self;
  sub_2345A921C(a3);

}

- (void)viewDidLayoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EmojiCarouselViewController();
  v2 = v3.receiver;
  -[EmojiCarouselViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  sub_2345A9F34();

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  _TtC10StickerKit27EmojiCarouselViewController *v6;

  swift_unknownObjectRetain();
  v6 = self;
  sub_2345AFDF4(a4);
  swift_unknownObjectRelease();

}

- (_TtC10StickerKit27EmojiCarouselViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC10StickerKit27EmojiCarouselViewController *)EmojiCarouselViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC10StickerKit27EmojiCarouselViewController)initWithCoder:(id)a3
{
  return (_TtC10StickerKit27EmojiCarouselViewController *)EmojiCarouselViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  sub_2345B0C20((uint64_t)self + OBJC_IVAR____TtC10StickerKit27EmojiCarouselViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit27EmojiCarouselViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit27EmojiCarouselViewController_pageControl));
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit27EmojiCarouselViewController_pageControllerVerticalConstraint));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit27EmojiCarouselViewController_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit27EmojiCarouselViewController_evaluationResult));
}

@end
