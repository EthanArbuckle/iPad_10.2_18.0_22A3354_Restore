@implementation StoryCardMediaView

- (_TtC20ProductPageExtension18StoryCardMediaView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension18StoryCardMediaView *)sub_10021EED0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension18StoryCardMediaView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100220D00();
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self, a2);
  v2 = (char *)v5.receiver;
  -[StoryCardMediaView layoutSubviews](&v5, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC20ProductPageExtension18StoryCardMediaView_revealingImageView];
  objc_msgSend(v2, "bounds", v5.receiver, v5.super_class);
  objc_msgSend(v3, "setFrame:");
  v4 = *(void **)&v2[OBJC_IVAR____TtC20ProductPageExtension18StoryCardMediaView_revealingVideoView];
  objc_msgSend(v2, "bounds");
  objc_msgSend(v4, "setFrame:");

}

- (void).cxx_destruct
{
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension18StoryCardMediaView_pageGrid, &qword_10082AF10);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension18StoryCardMediaView_revealingImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension18StoryCardMediaView_revealingVideoView));
}

@end
