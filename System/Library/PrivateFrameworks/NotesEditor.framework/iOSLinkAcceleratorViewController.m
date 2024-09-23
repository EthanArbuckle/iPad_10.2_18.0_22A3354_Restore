@implementation iOSLinkAcceleratorViewController

- (void)dealloc
{
  void *v3;
  _TtC11NotesEditor32iOSLinkAcceleratorViewController *v4;
  id v5;
  objc_super v6;

  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC11NotesEditor32iOSLinkAcceleratorViewController_kvoToken);
  v4 = self;
  if (v3)
  {
    v5 = v3;
    sub_1DD9D05A4();

  }
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for iOSLinkAcceleratorViewController();
  -[iOSLinkAcceleratorViewController dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor32iOSLinkAcceleratorViewController_collectionViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor32iOSLinkAcceleratorViewController_kvoToken));
}

- (void)viewDidLoad
{
  _TtC11NotesEditor32iOSLinkAcceleratorViewController *v2;

  v2 = self;
  sub_1DD9236FC();

}

- (_TtC11NotesEditor32iOSLinkAcceleratorViewController)init
{
  return (_TtC11NotesEditor32iOSLinkAcceleratorViewController *)iOSLinkAcceleratorViewController.init()();
}

- (_TtC11NotesEditor32iOSLinkAcceleratorViewController)initWithCoder:(id)a3
{
  return (_TtC11NotesEditor32iOSLinkAcceleratorViewController *)sub_1DD92414C(a3);
}

@end
