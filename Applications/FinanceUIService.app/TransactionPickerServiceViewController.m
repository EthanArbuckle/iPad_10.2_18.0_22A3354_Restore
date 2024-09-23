@implementation TransactionPickerServiceViewController

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TransactionPickerServiceViewController(0);
  v2 = v3.receiver;
  -[TransactionPickerServiceViewController viewDidLoad](&v3, "viewDidLoad");
  sub_10000371C();

}

+ (id)_remoteViewControllerInterface
{
  return (id)static TransactionPickerExportedInterfaces.remoteProtocol()(a1, a2);
}

+ (id)_exportedInterface
{
  return (id)static TransactionPickerExportedInterfaces.serviceProtocol()(a1, a2);
}

- (_TtC16FinanceUIService38TransactionPickerServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC16FinanceUIService38TransactionPickerServiceViewController *)sub_100004544(v5, v7, a4);
}

- (_TtC16FinanceUIService38TransactionPickerServiceViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC16FinanceUIService38TransactionPickerServiceViewController *v5;
  _TtC16FinanceUIService38TransactionPickerServiceViewController *v6;
  objc_super v8;

  v4 = a3;
  v5 = self;
  Logger.init(subsystem:category:)(0xD000000000000014, 0x800000010000D570, 0xD000000000000010, 0x800000010000CF00);
  *(Class *)((char *)&v5->super.super.super.isa
           + OBJC_IVAR____TtC16FinanceUIService38TransactionPickerServiceViewController_hostingController) = 0;

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for TransactionPickerServiceViewController(0);
  v6 = -[TransactionPickerServiceViewController initWithCoder:](&v8, "initWithCoder:", v4);

  return v6;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC16FinanceUIService38TransactionPickerServiceViewController_logger;
  v4 = type metadata accessor for Logger(0, a2);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16FinanceUIService38TransactionPickerServiceViewController_hostingController));
}

@end
