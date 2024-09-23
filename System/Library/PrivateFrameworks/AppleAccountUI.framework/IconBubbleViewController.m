@implementation IconBubbleViewController

- (_TtC14AppleAccountUI24IconBubbleViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DB5E1574();
}

- (void)loadView
{
  _TtC14AppleAccountUI24IconBubbleViewController *v2;

  v2 = self;
  sub_1DB5E1780();

}

- (void)viewDidLoad
{
  _TtC14AppleAccountUI24IconBubbleViewController *v2;

  v2 = self;
  sub_1DB5E182C();

}

- (CGSize)preferredContentSize
{
  _TtC14AppleAccountUI24IconBubbleViewController *v2;
  double v3;
  double v4;
  double v5;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  v7 = sub_1DB5E205C();
  v8 = v3;

  v4 = v7;
  v5 = v8;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  _TtC14AppleAccountUI24IconBubbleViewController *v3;

  v3 = self;
  sub_1DB5E20FC(a3.width, a3.height);

}

- (void)viewDidLayoutSubviews
{
  _TtC14AppleAccountUI24IconBubbleViewController *v2;

  v2 = self;
  sub_1DB5E2188();

}

- (_TtC14AppleAccountUI24IconBubbleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a4;
  if (a3)
  {
    sub_1DB62FCE0();

  }
  return (_TtC14AppleAccountUI24IconBubbleViewController *)sub_1DB5E5348();
}

- (void).cxx_destruct
{
  sub_1DB57F810((id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14AppleAccountUI24IconBubbleViewController_contentView));
  sub_1DB57F810((id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14AppleAccountUI24IconBubbleViewController_player));
  sub_1DB57F810((id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14AppleAccountUI24IconBubbleViewController_memojiWrapperLayer));
  sub_1DB57F810((id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14AppleAccountUI24IconBubbleViewController_memojiContainerLayer));
  sub_1DB57F810((id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14AppleAccountUI24IconBubbleViewController_memojiLayer));
  sub_1DB57F810((id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14AppleAccountUI24IconBubbleViewController_logoLayer));
  sub_1DB57F810((id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14AppleAccountUI24IconBubbleViewController_logoFillLayer));
  sub_1DB59FF7C();
  sub_1DB59FF7C();
  sub_1DB57045C();
}

- (void)AAUIMicaPlayerDidChangePlaybackTime:(id)a3
{
  id v4;
  _TtC14AppleAccountUI24IconBubbleViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1DB5E5658(a3);

}

@end
