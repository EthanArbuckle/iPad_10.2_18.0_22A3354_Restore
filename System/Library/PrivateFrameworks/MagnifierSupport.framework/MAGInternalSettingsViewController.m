@implementation MAGInternalSettingsViewController

- (id)specifiers
{
  _TtC16MagnifierSupport33MAGInternalSettingsViewController *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = sub_22756ECC4();

  if (v3)
  {
    v4 = (void *)sub_22758E3C4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
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
  _TtC16MagnifierSupport33MAGInternalSettingsViewController *v15;
  uint64_t v16;

  v6 = sub_22758CAD4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8, v9, v10, v11);
  v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22758CA80();
  v14 = a3;
  v15 = self;
  sub_22756F4D8(v14);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
}

- (_TtC16MagnifierSupport33MAGInternalSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_class *ObjectType;
  id v8;
  id v9;
  _TtC16MagnifierSupport33MAGInternalSettingsViewController *v10;
  objc_super v12;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_22758E1E4();
    v8 = a4;
    a3 = (id)sub_22758E1B4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = a4;
  }
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = -[MAGInternalSettingsViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, a3, a4);

  return v10;
}

- (_TtC16MagnifierSupport33MAGInternalSettingsViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[MAGInternalSettingsViewController initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
