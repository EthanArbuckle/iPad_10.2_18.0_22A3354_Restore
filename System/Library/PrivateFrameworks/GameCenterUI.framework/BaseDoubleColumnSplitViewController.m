@implementation BaseDoubleColumnSplitViewController

- (_TtC12GameCenterUI35BaseDoubleColumnSplitViewController)init
{
  return (_TtC12GameCenterUI35BaseDoubleColumnSplitViewController *)sub_1AB708C58();
}

- (_TtC12GameCenterUI35BaseDoubleColumnSplitViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB708D2C();
}

- (void)viewDidLoad
{
  _TtC12GameCenterUI35BaseDoubleColumnSplitViewController *v2;

  v2 = self;
  sub_1AB708EC0();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC12GameCenterUI35BaseDoubleColumnSplitViewController *v6;

  v5 = a3;
  v6 = self;
  sub_1AB7090A8((uint64_t)a3);

}

- (void)setViewController:(id)a3 forColumn:(int64_t)a4
{
  id v7;
  _TtC12GameCenterUI35BaseDoubleColumnSplitViewController *v8;

  v7 = a3;
  v8 = self;
  sub_1AB70913C(a3, a4);

}

- (void)showDetailViewController:(id)a3 sender:(id)a4
{
  id v6;
  _TtC12GameCenterUI35BaseDoubleColumnSplitViewController *v7;
  id v8;
  _TtC12GameCenterUI35BaseDoubleColumnSplitViewController *v9;
  _OWORD v10[2];

  if (a4)
  {
    v6 = a3;
    v7 = self;
    swift_unknownObjectRetain();
    sub_1AB7DB758();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v8 = a3;
    v9 = self;
  }
  sub_1AB709260((uint64_t)a3);

  sub_1AB46D6B8((uint64_t)v10);
}

- (int64_t)splitViewController:(id)a3 topColumnForCollapsingToProposedTopColumn:(int64_t)a4
{
  id v6;
  _TtC12GameCenterUI35BaseDoubleColumnSplitViewController *v7;
  int64_t v8;

  v6 = a3;
  v7 = self;
  v8 = sub_1AB70811C((uint64_t)v7, a4);

  return v8;
}

- (int64_t)splitViewController:(id)a3 displayModeForExpandingToProposedDisplayMode:(int64_t)a4
{
  id v6;
  _TtC12GameCenterUI35BaseDoubleColumnSplitViewController *v7;

  v6 = a3;
  v7 = self;
  sub_1AB70824C((uint64_t)v7, a4);

  return a4;
}

- (_TtC12GameCenterUI35BaseDoubleColumnSplitViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1AB7DAF90();
  v5 = a4;
  BaseDoubleColumnSplitViewController.init(nibName:bundle:)();
}

- (_TtC12GameCenterUI35BaseDoubleColumnSplitViewController)initWithStyle:(int64_t)a3
{
  BaseDoubleColumnSplitViewController.init(style:)();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI35BaseDoubleColumnSplitViewController____lazy_storage___backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI35BaseDoubleColumnSplitViewController_secondaryContainerViewController));
  sub_1AB708AB0(*(void **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC12GameCenterUI35BaseDoubleColumnSplitViewController_cachedSecondarySource), *(_QWORD *)((char *)&self->super.super.super._responderFlags+ OBJC_IVAR____TtC12GameCenterUI35BaseDoubleColumnSplitViewController_cachedSecondarySource), *((_BYTE *)&self->super.super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC12GameCenterUI35BaseDoubleColumnSplitViewController_cachedSecondarySource));
}

@end
