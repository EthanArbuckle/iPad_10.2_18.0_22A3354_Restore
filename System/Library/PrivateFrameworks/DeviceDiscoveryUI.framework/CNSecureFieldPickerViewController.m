@implementation CNSecureFieldPickerViewController

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 0;
}

- (_TtC17DeviceDiscoveryUI33CNSecureFieldPickerViewController)initWithContacts:(id)a3
{
  void *v4;
  _TtC17DeviceDiscoveryUI33CNSecureFieldPickerViewController *v5;
  objc_super v7;

  sub_23A3C9498(0, (unint64_t *)&qword_25697B4C0);
  sub_23A447320();
  v4 = (void *)sub_23A447314();
  swift_bridgeObjectRelease();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CNSecureFieldPickerViewController();
  v5 = -[CNContactCardFieldPicker initWithContacts:](&v7, sel_initWithContacts_, v4);

  return v5;
}

- (_TtC17DeviceDiscoveryUI33CNSecureFieldPickerViewController)initWithContact:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CNSecureFieldPickerViewController();
  return -[CNContactCardFieldPicker initWithContact:](&v5, sel_initWithContact_, a3);
}

- (_TtC17DeviceDiscoveryUI33CNSecureFieldPickerViewController)initWithNameDrop:(id)a3 fieldSelections:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CNSecureFieldPickerViewController();
  return -[CNContactCardFieldPicker initWithNameDrop:fieldSelections:](&v7, sel_initWithNameDrop_fieldSelections_, a3, a4);
}

- (_TtC17DeviceDiscoveryUI33CNSecureFieldPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _TtC17DeviceDiscoveryUI33CNSecureFieldPickerViewController *v9;
  objc_super v11;

  if (a3)
  {
    sub_23A447284();
    v6 = a4;
    v7 = (void *)sub_23A447254();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for CNSecureFieldPickerViewController();
  v9 = -[CNSecureFieldPickerViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, v7, a4);

  return v9;
}

- (_TtC17DeviceDiscoveryUI33CNSecureFieldPickerViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CNSecureFieldPickerViewController();
  return -[CNSecureFieldPickerViewController initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
