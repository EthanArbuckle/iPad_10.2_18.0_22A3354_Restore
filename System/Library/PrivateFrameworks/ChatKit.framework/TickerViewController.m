@implementation TickerViewController

- (_TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E20TickerViewController)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E20TickerViewController_tickCounter) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TickerViewController();
  return -[TickerViewController initWithNibName:bundle:](&v3, sel_initWithNibName_bundle_, 0, 0);
}

- (_TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E20TickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;
  _TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E20TickerViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E20TickerViewController_tickCounter) = 0;
  v5 = a4;

  result = (_TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E20TickerViewController *)sub_18E769320();
  __break(1u);
  return result;
}

- (_TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E20TickerViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E20TickerViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E20TickerViewController_tickCounter) = 0;
  v4 = a3;

  result = (_TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E20TickerViewController *)sub_18E769320();
  __break(1u);
  return result;
}

- (void)loadView
{
  id v3;
  _TtC7ChatKitP33_1CDF9E619B3482BCE1E7C40D34D4226E20TickerViewController *v4;
  id v5;

  v3 = objc_allocWithZone((Class)type metadata accessor for CKDebugTickHUDView());
  v4 = self;
  v5 = objc_msgSend(v3, sel_init);
  -[TickerViewController setView:](v4, sel_setView_, v5);

}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for TickerViewController();
  -[TickerViewController viewDidLoad](&v2, sel_viewDidLoad);
}

@end
