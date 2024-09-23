@implementation DebugJournalCodableViewController

- (_TtC7NewsAds33DebugJournalCodableViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC7NewsAds33DebugJournalCodableViewController *result;

  v5 = OBJC_IVAR____TtC7NewsAds33DebugJournalCodableViewController_textView;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3E50]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC7NewsAds33DebugJournalCodableViewController *)sub_1BA2C257C();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC7NewsAds33DebugJournalCodableViewController *v2;

  v2 = self;
  sub_1BA24D7A4();

}

- (void)viewDidLayoutSubviews
{
  char *v2;
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)swift_getObjectType();
  v2 = (char *)v14.receiver;
  -[DebugJournalCodableViewController viewDidLayoutSubviews](&v14, sel_viewDidLayoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC7NewsAds33DebugJournalCodableViewController_textView];
  v4 = objc_msgSend(v2, sel_view, v14.receiver, v14.super_class);
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, sel_bounds);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    objc_msgSend(v3, sel_setFrame_, v7, v9, v11, v13);
  }
  else
  {
    __break(1u);
  }
}

- (_TtC7NewsAds33DebugJournalCodableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7NewsAds33DebugJournalCodableViewController *result;

  v4 = a4;
  result = (_TtC7NewsAds33DebugJournalCodableViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsAds33DebugJournalCodableViewController_codable);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsAds33DebugJournalCodableViewController_textView));
}

@end
