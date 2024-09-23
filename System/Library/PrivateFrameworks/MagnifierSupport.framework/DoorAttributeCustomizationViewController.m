@implementation DoorAttributeCustomizationViewController

- (void)viewDidLoad
{
  _TtC16MagnifierSupport40DoorAttributeCustomizationViewController *v2;

  v2 = self;
  sub_227331680();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC16MagnifierSupport40DoorAttributeCustomizationViewController *v4;

  v4 = self;
  sub_2273327A4(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  v4 = (char *)v9.receiver;
  -[DoorAttributeCustomizationViewController viewWillDisappear:](&v9, sel_viewWillDisappear_, v3);
  v5 = &v4[OBJC_IVAR____TtC16MagnifierSupport40DoorAttributeCustomizationViewController_delegate];
  swift_beginAccess();
  v6 = *((_QWORD *)v5 + 3);
  if (v6)
  {
    v7 = *(void **)(*__swift_project_boxed_opaque_existential_1(v5, v6)
                  + OBJC_IVAR____TtC16MagnifierSupport35DoorDetectionSettingsViewController_tableView);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2558D50E0);
    sub_22758CAD4();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_227593AB0;
    MEMORY[0x2276B0AB0](0, 5);
    v8 = sub_22758E3C4();
    swift_bridgeObjectRelease();
    objc_msgSend(v7, sel_reloadRowsAtIndexPaths_withRowAnimation_, v8, 5);

    v4 = (char *)v8;
  }

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC16MagnifierSupport40DoorAttributeCustomizationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_22758E1E4();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC16MagnifierSupport40DoorAttributeCustomizationViewController *)sub_227332A90(v5, v7, a4);
}

- (_TtC16MagnifierSupport40DoorAttributeCustomizationViewController)initWithCoder:(id)a3
{
  return (_TtC16MagnifierSupport40DoorAttributeCustomizationViewController *)sub_227332C78(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport40DoorAttributeCustomizationViewController_tableView));
  swift_bridgeObjectRelease();
  sub_22731A1A4((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport40DoorAttributeCustomizationViewController_delegate, (uint64_t *)&unk_2558D5FA0);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  char *v5;

  if (a4)
    return 0;
  v5 = (char *)self + OBJC_IVAR____TtC16MagnifierSupport40DoorAttributeCustomizationViewController_doorAttributes;
  swift_beginAccess();
  return *(_QWORD *)(*(_QWORD *)v5 + 16);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  _TtC16MagnifierSupport40DoorAttributeCustomizationViewController *v15;
  id v16;
  uint64_t v18;

  v6 = sub_22758CAD4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8, v9, v10, v11);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758CA80();
  v14 = a3;
  v15 = self;
  v16 = sub_227332EB8(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
  return v16;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v4;
  uint64_t v5;

  if (a4 || (sub_227334894(), !v5))
  {
    v4 = 0;
  }
  else
  {
    v4 = (void *)sub_22758E1B4();
    swift_bridgeObjectRelease();
  }
  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  _TtC16MagnifierSupport40DoorAttributeCustomizationViewController *v15;
  uint64_t v16;

  v6 = sub_22758CAD4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8, v9, v10, v11);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758CA80();
  v14 = a3;
  v15 = self;
  sub_22733324C(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
}

@end
