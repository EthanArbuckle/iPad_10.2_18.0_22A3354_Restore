@implementation AirTagRolePickerViewController

- (void)viewDidLoad
{
  _TtC18SharingViewService30AirTagRolePickerViewController *v2;

  v2 = self;
  sub_10007F2DC();

}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  id v5;
  _TtC18SharingViewService30AirTagRolePickerViewController *v6;
  int64_t v7;

  v5 = a3;
  v6 = self;
  v7 = sub_10007F904();

  return v7;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  id v7;
  _TtC18SharingViewService30AirTagRolePickerViewController *v8;
  uint64_t v9;
  uint64_t v10;
  NSString v11;

  v7 = a3;
  v8 = self;
  sub_10007FAC4(a4);
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

- (_TtC18SharingViewService30AirTagRolePickerViewController)initWithContentView:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(self);
  swift_unknownObjectWeakInit(&self->PRXPickerContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService30AirTagRolePickerViewController_mainController], 0);
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[AirTagRolePickerViewController initWithContentView:](&v7, "initWithContentView:", a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy(&self->PRXPickerContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService30AirTagRolePickerViewController_mainController], a2);
}

@end
