@implementation B389RolePickerViewController

- (UIPickerView)rolePickerView
{
  return (UIPickerView *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC18SharingViewService28B389RolePickerViewController_rolePickerView);
}

- (void)setRolePickerView:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC18SharingViewService28B389RolePickerViewController_rolePickerView, a3);
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC18SharingViewService28B389RolePickerViewController *v4;

  v4 = self;
  sub_100093E20(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v4;

  v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for B389RolePickerViewController();
  -[B389RolePickerViewController viewDidDisappear:](&v4, "viewDidDisappear:", v3);
}

- (void)dismissPressed:(id)a3
{
  id v4;
  uint64_t v5;
  _TtC18SharingViewService28B389RolePickerViewController *v6;

  v4 = a3;
  v6 = self;
  sub_100094F90((uint64_t)v6, v5);

}

- (void)continuePressed:(id)a3
{
  id v4;
  _TtC18SharingViewService28B389RolePickerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1000950D0();

}

- (_TtC18SharingViewService28B389RolePickerViewController)initWithMainController:(id)a3
{
  objc_super v6;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC18SharingViewService28B389RolePickerViewController_rolePickerView, 0);
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC18SharingViewService28B389RolePickerViewController_rolesLoaded) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for B389RolePickerViewController();
  return -[SVSBaseViewController initWithMainController:](&v6, "initWithMainController:", a3);
}

- (_TtC18SharingViewService28B389RolePickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString v9;
  id v10;
  _TtC18SharingViewService28B389RolePickerViewController *v11;
  objc_super v13;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC18SharingViewService28B389RolePickerViewController_rolePickerView, 0);
    *((_BYTE *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC18SharingViewService28B389RolePickerViewController_rolesLoaded) = 0;
    v8 = a4;
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC18SharingViewService28B389RolePickerViewController_rolePickerView, 0);
    *((_BYTE *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC18SharingViewService28B389RolePickerViewController_rolesLoaded) = 0;
    v10 = a4;
    v9 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for B389RolePickerViewController();
  v11 = -[B389RolePickerViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", v9, a4);

  return v11;
}

- (_TtC18SharingViewService28B389RolePickerViewController)initWithCoder:(id)a3
{
  objc_super v6;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC18SharingViewService28B389RolePickerViewController_rolePickerView, 0);
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC18SharingViewService28B389RolePickerViewController_rolesLoaded) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for B389RolePickerViewController();
  return -[B389RolePickerViewController initWithCoder:](&v6, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC18SharingViewService28B389RolePickerViewController_rolePickerView, a2);
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  id v5;
  _TtC18SharingViewService28B389RolePickerViewController *v6;
  char *v7;

  v5 = a3;
  v6 = self;
  v7 = sub_10009518C();

  return (int64_t)v7;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  id v7;
  _TtC18SharingViewService28B389RolePickerViewController *v8;
  uint64_t v9;
  uint64_t v10;
  NSString v11;

  v7 = a3;
  v8 = self;
  sub_100095364(a4);
  v10 = v9;

  if (v10)
  {
    v11 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v10);
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (double)pickerView:rowHeightForComponent:
{
  void *v0;
  double v1;
  double v2;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody));
  objc_msgSend(v0, "pointSize");
  v2 = v1 + 11.0;

  return v2;
}

@end
