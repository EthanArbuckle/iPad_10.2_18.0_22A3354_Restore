@implementation FormatViewController

- (void)dealloc
{
  objc_class *ObjectType;
  _TtC8NewsFeed20FormatViewController *v4;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  swift_retain();
  sub_1BB86F4D8();
  swift_release();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  -[FormatViewController dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  sub_1BA8FD860((uint64_t)self + OBJC_IVAR____TtC8NewsFeed20FormatViewController_pluggableDelegate);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed20FormatViewController_blueprintViewController));
  swift_release();
  swift_unknownObjectRelease();
  sub_1BA8FD860((uint64_t)self + OBJC_IVAR____TtC8NewsFeed20FormatViewController_selectionProvider);
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed20FormatViewController____lazy_storage___maskLayer));
}

- (_TtC8NewsFeed20FormatViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BB653140();
}

- (_TtC8NewsFeed20FormatViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8NewsFeed20FormatViewController *result;

  v4 = a4;
  result = (_TtC8NewsFeed20FormatViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC8NewsFeed20FormatViewController *v2;

  v2 = self;
  FormatViewController.viewDidLoad()();

}

- (void)viewWillLayoutSubviews
{
  _TtC8NewsFeed20FormatViewController *v2;

  v2 = self;
  FormatViewController.viewWillLayoutSubviews()();

}

- (void)viewDidLayoutSubviews
{
  id v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = v4.receiver;
  -[FormatViewController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
  sub_1BB8707BC();
  v3 = (void *)sub_1BB870438();
  swift_release();
  objc_msgSend(v3, sel_layoutIfNeeded);

  sub_1BB86DEB8();
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC8NewsFeed20FormatViewController *v4;

  v4 = self;
  FormatViewController.viewWillAppear(_:)(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[FormatViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
  sub_1BB86F4FC();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[FormatViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
  sub_1BB86FD3C();
  sub_1BB86F4E4();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC8NewsFeed20FormatViewController *v6;
  _TtC8NewsFeed20FormatViewController *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  FormatViewController.traitCollectionDidChange(_:)(v8);

}

- (void)startTraversingWithDirection:(int64_t)a3
{
  _TtC8NewsFeed20FormatViewController *v3;

  v3 = self;
  sub_1BB8707C8();

}

@end
