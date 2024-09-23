@implementation EmojiForegroundReplicatorViewController

- (void)viewDidLoad
{
  _TtC11EmojiPoster39EmojiForegroundReplicatorViewController *v2;

  v2 = self;
  sub_1DD2CFD40();

}

- (void)adjustScaleWithGesture:(id)a3
{
  id v4;
  _TtC11EmojiPoster39EmojiForegroundReplicatorViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1DD2D0950(v4);

}

- (_TtC11EmojiPoster39EmojiForegroundReplicatorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_1DD2F9DE4();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC11EmojiPoster39EmojiForegroundReplicatorViewController *)EmojiForegroundReplicatorViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC11EmojiPoster39EmojiForegroundReplicatorViewController)initWithCoder:(id)a3
{
  return (_TtC11EmojiPoster39EmojiForegroundReplicatorViewController *)EmojiForegroundReplicatorViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster39EmojiForegroundReplicatorViewController_emojiLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster39EmojiForegroundReplicatorViewController_secondaryEmojiLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster39EmojiForegroundReplicatorViewController_horizontalReplicatorLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster39EmojiForegroundReplicatorViewController_offsetHorizontalReplicatorLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster39EmojiForegroundReplicatorViewController_verticalReplicatorLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster39EmojiForegroundReplicatorViewController_offsetVerticalReplicatorLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11EmojiPoster39EmojiForegroundReplicatorViewController_pinchGestureRecognizer));
}

@end
