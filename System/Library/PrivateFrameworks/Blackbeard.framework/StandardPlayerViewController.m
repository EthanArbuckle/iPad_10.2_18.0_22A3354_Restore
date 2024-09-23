@implementation StandardPlayerViewController

- (_TtC20FitnessPlayerService28StandardPlayerViewController)initWithCoder:(id)a3
{
  _TtC20FitnessPlayerService28StandardPlayerViewController *result;

  result = (_TtC20FitnessPlayerService28StandardPlayerViewController *)sub_23732087C();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC20FitnessPlayerService28StandardPlayerViewController *v7;
  uint64_t v8;
  _TtC20FitnessPlayerService28StandardPlayerViewController *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  objc_super v13;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256792790);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13.receiver = self;
  v13.super_class = ObjectType;
  v7 = self;
  -[StandardPlayerViewController viewDidLoad](&v13, sel_viewDidLoad);
  v8 = sub_237320264();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v6, 1, 1, v8);
  sub_237320228();
  v9 = v7;
  v10 = sub_23732021C();
  v11 = (_QWORD *)swift_allocObject();
  v12 = MEMORY[0x24BEE6930];
  v11[2] = v10;
  v11[3] = v12;
  v11[4] = v9;
  sub_23700D0E8((uint64_t)v6, (uint64_t)&unk_2567A4378, (uint64_t)v11);

  swift_release();
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC20FitnessPlayerService28StandardPlayerViewController *v9;
  uint64_t v10;
  _TtC20FitnessPlayerService28StandardPlayerViewController *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  objc_super v15;

  v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256792790);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15.receiver = self;
  v15.super_class = ObjectType;
  v9 = self;
  -[StandardPlayerViewController viewDidAppear:](&v15, sel_viewDidAppear_, v3);
  v10 = sub_237320264();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v8, 1, 1, v10);
  sub_237320228();
  v11 = v9;
  v12 = sub_23732021C();
  v13 = (_QWORD *)swift_allocObject();
  v14 = MEMORY[0x24BEE6930];
  v13[2] = v12;
  v13[3] = v14;
  v13[4] = v11;
  sub_23700D0E8((uint64_t)v8, (uint64_t)&unk_2567A4370, (uint64_t)v13);

  swift_release();
}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC20FitnessPlayerService28StandardPlayerViewController *v4;

  v4 = self;
  StandardPlayerViewController.viewDidDisappear(_:)(a3);

}

- (_TtC20FitnessPlayerService28StandardPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC20FitnessPlayerService28StandardPlayerViewController *result;

  v4 = a4;
  result = (_TtC20FitnessPlayerService28StandardPlayerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC20FitnessPlayerService28StandardPlayerViewController)initWithPlayerLayerView:(id)a3
{
  id v3;
  _TtC20FitnessPlayerService28StandardPlayerViewController *result;

  v3 = a3;
  result = (_TtC20FitnessPlayerService28StandardPlayerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
