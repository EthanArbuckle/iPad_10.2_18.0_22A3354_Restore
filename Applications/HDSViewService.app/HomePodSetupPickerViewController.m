@implementation HomePodSetupPickerViewController

- (void)viewDidLoad
{
  _TtC14HDSViewService32HomePodSetupPickerViewController *v2;

  v2 = self;
  sub_100059D48();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  uint64_t Strong;
  uint64_t v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for HomePodSetupPickerViewController(0);
  v4 = (char *)v7.receiver;
  -[HomePodSetupPickerViewController viewDidAppear:](&v7, "viewDidAppear:", v3);
  Strong = swift_unknownObjectWeakLoadStrong(&v4[OBJC_IVAR____TtC14HDSViewService32HomePodSetupPickerViewController_presenter]);
  if (Strong)
  {
    v6 = Strong;
    sub_10006EB30();

    swift_unknownObjectRelease(v6);
  }
  else
  {

  }
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return *(_QWORD *)(*(_QWORD *)&self->PRXPickerContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService32HomePodSetupPickerViewController_options]
                   + 16);
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  id v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSString v15;
  _QWORD v16[3];
  uint64_t v17;
  uint64_t v18;

  if (a4 < 0)
  {
    __break(1u);
  }
  else
  {
    v5 = self;
    v6 = *(_QWORD *)((char *)self + OBJC_IVAR____TtC14HDSViewService32HomePodSetupPickerViewController_options);
    if (*(_QWORD *)(v6 + 16) > (unint64_t)a4)
    {
      sub_100035D68(v6 + 40 * a4 + 32, (uint64_t)v16);
      v8 = v17;
      v9 = v18;
      sub_10000DC94(v16, v17);
      v10 = *(void (**)(uint64_t, uint64_t))(v9 + 16);
      v11 = a3;
      v12 = v5;
      v10(v8, v9);
      v14 = v13;
      sub_10000CDB8(v16);

      v15 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v14);
      return v15;
    }
  }
  __break(1u);
  return self;
}

- (_TtC14HDSViewService32HomePodSetupPickerViewController)initWithContentView:(id)a3
{
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  uint64_t v7;
  objc_super v9;

  v5 = &self->PRXPickerContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService32HomePodSetupPickerViewController_presenter];
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5, 0);
  *(_QWORD *)&self->PRXPickerContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService32HomePodSetupPickerViewController_options] = _swiftEmptyArrayStorage;
  v6 = &self->PRXPickerContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService32HomePodSetupPickerViewController_viewModel];
  v7 = type metadata accessor for HomePodSetupViewModel(0);
  (*(void (**)(unsigned __int8 *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for HomePodSetupPickerViewController(0);
  return -[HomePodSetupPickerViewController initWithContentView:](&v9, "initWithContentView:", a3);
}

- (void).cxx_destruct
{
  sub_1000113B8((uint64_t)&self->PRXPickerContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService32HomePodSetupPickerViewController_presenter]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->PRXPickerContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService32HomePodSetupPickerViewController_options]);
  sub_10000DC40((uint64_t)&self->PRXPickerContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService32HomePodSetupPickerViewController_viewModel], (uint64_t *)&unk_1000D6EC0);
}

@end
