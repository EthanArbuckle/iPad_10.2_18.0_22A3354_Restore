@implementation FormatVideoPlayerViewController

- (_TtC8NewsFeed31FormatVideoPlayerViewController)init
{
  return (_TtC8NewsFeed31FormatVideoPlayerViewController *)sub_1BB2D0DD0();
}

- (_TtC8NewsFeed31FormatVideoPlayerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BB2D2210();
}

- (void)dealloc
{
  objc_class *ObjectType;
  uint64_t v4;
  _TtC8NewsFeed31FormatVideoPlayerViewController *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = MEMORY[0x1BCCE5D40]((char *)self + OBJC_IVAR____TtC8NewsFeed31FormatVideoPlayerViewController_delegate);
  v5 = self;
  if (v4)
  {
    sub_1BB283D3C();
    swift_unknownObjectRelease();
  }
  v6.receiver = v5;
  v6.super_class = ObjectType;
  -[FormatVideoPlayerViewController dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  sub_1BA8FD860((uint64_t)self + OBJC_IVAR____TtC8NewsFeed31FormatVideoPlayerViewController_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31FormatVideoPlayerViewController_onReuse));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31FormatVideoPlayerViewController_posterFrame));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31FormatVideoPlayerViewController_placeholderView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed31FormatVideoPlayerViewController_videoContainerView));
}

- (void)viewDidLoad
{
  _TtC8NewsFeed31FormatVideoPlayerViewController *v2;

  v2 = self;
  sub_1BB2D10F8();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = (char *)v5.receiver;
  -[FormatVideoPlayerViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
  if (MEMORY[0x1BCCE5D40](&v4[OBJC_IVAR____TtC8NewsFeed31FormatVideoPlayerViewController_delegate]))
  {
    sub_1BB2843D8();

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  objc_super v12;

  height = a3.height;
  width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)swift_getObjectType();
  swift_unknownObjectRetain();
  v7 = (char *)v12.receiver;
  -[FormatVideoPlayerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, width, height);
  v8 = MEMORY[0x1BCCE5D40](&v7[OBJC_IVAR____TtC8NewsFeed31FormatVideoPlayerViewController_delegate]);
  if (v8)
  {
    v9 = v8;
    v10 = objc_msgSend((id)objc_opt_self(), sel_currentDevice, v12.receiver, v12.super_class);
    v11 = objc_msgSend(v10, sel_userInterfaceIdiom);

    if (v11 == (id)5)
      *(_BYTE *)(v9 + OBJC_IVAR____TtC8NewsFeed24FormatVideoPlayerManager_isViewTransitionInProcess) = 1;
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();

  }
}

- (void)viewDidLayoutSubviews
{
  _TtC8NewsFeed31FormatVideoPlayerViewController *v2;

  v2 = self;
  sub_1BB2D1550();

}

- (_TtC8NewsFeed31FormatVideoPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8NewsFeed31FormatVideoPlayerViewController *result;

  v4 = a4;
  result = (_TtC8NewsFeed31FormatVideoPlayerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
