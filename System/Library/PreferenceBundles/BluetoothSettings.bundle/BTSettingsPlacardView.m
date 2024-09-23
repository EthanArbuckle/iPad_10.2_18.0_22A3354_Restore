@implementation BTSettingsPlacardView

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  id v9;
  _TtC17BluetoothSettings21BTSettingsPlacardView *v10;
  _BYTE v11[16];
  _TtC17BluetoothSettings21BTSettingsPlacardView *v12;
  uint64_t v13[5];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E08330);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = self;
  v9 = a3;
  v10 = self;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E08338);
  sub_22F73DB58(&qword_255E08340, &qword_255E08338, MEMORY[0x24BE855C8]);
  sub_22F73EA30();
  sub_22F73EA3C();
  v13[3] = v5;
  v13[4] = sub_22F73DB58(&qword_255E08348, &qword_255E08330, MEMORY[0x24BDEFEA0]);
  __swift_allocate_boxed_opaque_existential_1(v13);
  sub_22F73EA24();
  (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
  MEMORY[0x2348A26EC](v13);
  -[BTSettingsPlacardView setSelectionStyle:](v10, sel_setSelectionStyle_, 0);

}

- (_TtC17BluetoothSettings21BTSettingsPlacardView)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  if (a4)
  {
    v7 = sub_22F73EAA8();
    v9 = v8;
  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  v10 = a5;
  return (_TtC17BluetoothSettings21BTSettingsPlacardView *)sub_22F73D048(a3, v7, v9, a5);
}

- (_TtC17BluetoothSettings21BTSettingsPlacardView)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  objc_class *ObjectType;
  _TtC17BluetoothSettings21BTSettingsPlacardView *v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a4)
  {
    sub_22F73EAA8();
    a4 = (id)sub_22F73EA84();
    swift_bridgeObjectRelease();
  }
  v10.receiver = self;
  v10.super_class = ObjectType;
  v8 = -[BTSettingsPlacardView initWithStyle:reuseIdentifier:](&v10, sel_initWithStyle_reuseIdentifier_, a3, a4);

  return v8;
}

- (_TtC17BluetoothSettings21BTSettingsPlacardView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[BTSettingsPlacardView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
