@implementation AVInfoTabViewController

- (AVPlayerItem)playerItem
{
  return (AVPlayerItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                 + OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_playerItem));
}

- (void)setPlayerItem:(id)a3
{
  _TtC5AVKit23AVInfoTabViewController *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1AC51BCA4(a3);

}

- (NSArray)actions
{
  void *v2;

  sub_1AC519B80(0, (unint64_t *)&qword_1EEC831B8);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1AC5DD738();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setActions:(id)a3
{
  unint64_t v4;
  _TtC5AVKit23AVInfoTabViewController *v5;

  sub_1AC519B80(0, (unint64_t *)&qword_1EEC831B8);
  v4 = sub_1AC5DD744();
  v5 = self;
  sub_1AC51A1D0(v4);

}

- (_TtC5AVKit23AVInfoTabViewController)initWithPlayerItem:(id)a3 actions:(id)a4
{
  uint64_t v5;

  sub_1AC519B80(0, (unint64_t *)&qword_1EEC831B8);
  v5 = sub_1AC5DD744();
  return (_TtC5AVKit23AVInfoTabViewController *)sub_1AC51A340(a3, v5);
}

- (_TtC5AVKit23AVInfoTabViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC5AVKit23AVInfoTabViewController *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_playerItem) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_hostingController) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_itemsKVOToken) = 0;
  v4 = a3;

  result = (_TtC5AVKit23AVInfoTabViewController *)sub_1AC5DD858();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  id v2;
  id v3;
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AVInfoTabViewController();
  v2 = v6.receiver;
  -[AVInfoTabViewController viewDidLoad](&v6, sel_viewDidLoad);
  v3 = objc_msgSend(v2, sel_view, v6.receiver, v6.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
    objc_msgSend(v4, sel_setBackgroundColor_, v5);

    sub_1AC51AA90();
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidLayoutSubviews
{
  _TtC5AVKit23AVInfoTabViewController *v2;

  v2 = self;
  sub_1AC51A734();

}

- (void)dealloc
{
  _TtC5AVKit23AVInfoTabViewController *v2;

  v2 = self;
  sub_1AC51A94C();
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  sub_1AC516980((uint64_t)self + OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_metadata);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_hostingController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5AVKit23AVInfoTabViewController_itemsKVOToken));
}

- (id)avkit_infoPanelKindIdentifier
{
  void *v2;

  sub_1AC5DD714();
  v2 = (void *)sub_1AC5DD6F0();
  swift_bridgeObjectRelease();
  return v2;
}

- (_TtC5AVKit23AVInfoTabViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC5AVKit23AVInfoTabViewController *result;

  v4 = a4;
  result = (_TtC5AVKit23AVInfoTabViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
