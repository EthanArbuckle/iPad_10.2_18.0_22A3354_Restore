@implementation MedicationsHistoryViewController

- (void)viewDidLoad
{
  id v2;
  id v3;
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for MedicationsHistoryViewController();
  v2 = v6.receiver;
  -[MedicationsHistoryViewController viewDidLoad](&v6, sel_viewDidLoad);
  v3 = objc_msgSend(v2, sel_view, v6.receiver, v6.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend((id)objc_opt_self(), sel_systemBlueColor);
    objc_msgSend(v4, sel_setBackgroundColor_, v5);

  }
  else
  {
    __break(1u);
  }
}

- (_TtC19HealthMedicationsUI32MedicationsHistoryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _TtC19HealthMedicationsUI32MedicationsHistoryViewController *v9;
  objc_super v11;

  if (a3)
  {
    sub_1BC2B4460();
    v6 = a4;
    v7 = (void *)sub_1BC2B4430();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for MedicationsHistoryViewController();
  v9 = -[MedicationsHistoryViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, v7, a4);

  return v9;
}

- (_TtC19HealthMedicationsUI32MedicationsHistoryViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MedicationsHistoryViewController();
  return -[MedicationsHistoryViewController initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
