@implementation StoryCardMediaView

- (_TtC22SubscribePageExtension18StoryCardMediaView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension18StoryCardMediaView *)sub_1005F82A8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension18StoryCardMediaView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1005F969C();
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  -[StoryCardMediaView layoutSubviews](&v5, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_revealingImageView];
  objc_msgSend(v2, "bounds", v5.receiver, v5.super_class);
  objc_msgSend(v3, "setFrame:");
  v4 = *(void **)&v2[OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_revealingVideoView];
  objc_msgSend(v2, "bounds");
  objc_msgSend(v4, "setFrame:");

}

- (void).cxx_destruct
{
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_pageGrid, &qword_1008027B0);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_revealingImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension18StoryCardMediaView_revealingVideoView));
}

@end
