@implementation LabsTipViewController

- (void)viewDidLoad
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for LabsTipViewController();
  v2 = v8.receiver;
  -[LabsTipViewController viewDidLoad](&v8, sel_viewDidLoad);
  v3 = objc_msgSend(v2, sel_view, v8.receiver, v8.super_class);
  if (v3)
  {
    v4 = v3;
    v5 = sub_23117F1FC();
    objc_msgSend(v4, sel_addSubview_, v5);

    sub_23117F790(v2, 22.0);
    v6 = (void *)objc_opt_self();
    sub_231178AD0(0, &qword_255EBA000);
    v7 = (void *)sub_2312641EC();
    swift_bridgeObjectRelease();
    objc_msgSend(v6, sel_activateConstraints_, v7);

  }
  else
  {
    __break(1u);
  }
}

- (_TtC13HealthRecords21LabsTipViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_23126409C();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC13HealthRecords21LabsTipViewController *)sub_23117FB40(v5, v7, a4);
}

- (_TtC13HealthRecords21LabsTipViewController)initWithCoder:(id)a3
{
  return (_TtC13HealthRecords21LabsTipViewController *)sub_23117FD18(a3);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_231180624((uint64_t)self + OBJC_IVAR____TtC13HealthRecords21LabsTipViewController_context);
  sub_2311786C0((uint64_t)self + OBJC_IVAR____TtC13HealthRecords21LabsTipViewController_feedItemData, &qword_255EB8078, (void (*)(uint64_t))MEMORY[0x24BE49328]);
  v3 = (char *)self + OBJC_IVAR____TtC13HealthRecords21LabsTipViewController_headerType;
  v4 = sub_23126346C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13HealthRecords21LabsTipViewController____lazy_storage___tipsView));
}

@end
