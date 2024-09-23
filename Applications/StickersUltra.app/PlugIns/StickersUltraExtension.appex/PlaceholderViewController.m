@implementation PlaceholderViewController

- (void)viewDidLoad
{
  _TtC22StickersUltraExtension25PlaceholderViewController *v2;

  v2 = self;
  sub_100062720();

}

- (_TtC22StickersUltraExtension25PlaceholderViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC22StickersUltraExtension25PlaceholderViewController *)sub_100062D20(v5, v7, a4);
}

- (_TtC22StickersUltraExtension25PlaceholderViewController)initWithCoder:(id)a3
{
  return (_TtC22StickersUltraExtension25PlaceholderViewController *)sub_100062EB4(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension25PlaceholderViewController_textView));
  swift_bridgeObjectRelease(*(_QWORD *)&self->textView[OBJC_IVAR____TtC22StickersUltraExtension25PlaceholderViewController_name]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension25PlaceholderViewController_backgroundColor));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC22StickersUltraExtension25PlaceholderViewController_delegate));
}

@end
