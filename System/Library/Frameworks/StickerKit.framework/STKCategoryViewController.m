@implementation STKCategoryViewController

- (void)viewDidLoad
{
  STKCategoryViewController *v2;

  v2 = self;
  CategoryViewController.viewDidLoad()();

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)transitionerForConnectingHostingController:(id)a3
{
  void *v3;
  _QWORD v5[6];

  v5[4] = sub_23462E1F4;
  v5[5] = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 1107296256;
  v5[2] = sub_2346524EC;
  v5[3] = &block_descriptor_33;
  v3 = _Block_copy(v5);
  swift_release();
  return v3;
}

- (void)dealloc
{
  objc_class *ObjectType;
  uint64_t v4;
  STKCategoryViewController *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = qword_256171D98;
  v5 = self;
  if (v4 != -1)
    swift_once();
  v6 = sub_234716224();
  __swift_project_value_buffer(v6, (uint64_t)qword_25617AE40);
  v7 = sub_23471620C();
  v8 = sub_234717AE4();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_23459E000, v7, v8, "deinit", v9, 2u);
    MEMORY[0x2349449B8](v9, -1, -1);
  }

  v10.receiver = v5;
  v10.super_class = ObjectType;
  -[STKCategoryViewController dealloc](&v10, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR___STKCategoryViewController__sceneHostingController;
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256176750);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

- (STKCategoryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_class *ObjectType;
  void *v8;
  id v9;
  void *v10;
  STKCategoryViewController *v11;
  objc_super v13;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_234717754();
    a3 = v8;
  }
  sub_2345B0BE8(0, (unint64_t *)&unk_256176570);
  v9 = a4;
  sub_234717B74();
  if (a3)
  {
    v10 = (void *)sub_234717730();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  v13.receiver = self;
  v13.super_class = ObjectType;
  v11 = -[STKCategoryViewController initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, v10, v9);

  return v11;
}

- (STKCategoryViewController)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  id v6;
  STKCategoryViewController *v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  sub_2345B0BE8(0, (unint64_t *)&unk_256176570);
  v6 = a3;
  sub_234717B74();
  v9.receiver = self;
  v9.super_class = ObjectType;
  v7 = -[STKCategoryViewController initWithCoder:](&v9, sel_initWithCoder_, v6);

  return v7;
}

@end
