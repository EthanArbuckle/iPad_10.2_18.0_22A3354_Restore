@implementation FamilyDisclosureController

- (void)presentModalRUIController:(RUINavigationController *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  RUINavigationController *v15;
  _TtC14FamilyCircleUIP33_894AE38325ED3BE878E6154E185909E026FamilyDisclosureController *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253D2DF60);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_20E07D85C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_254A01140;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_254A01148;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_20E032A2C((uint64_t)v9, (uint64_t)&unk_254A01150, (uint64_t)v14);
  swift_release();
}

- (void)replaceModalRUIController:(RUINavigationController *)a3 byController:(RUINavigationController *)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  RUINavigationController *v17;
  RUINavigationController *v18;
  _TtC14FamilyCircleUIP33_894AE38325ED3BE878E6154E185909E026FamilyDisclosureController *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253D2DF60);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_20E07D85C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_254A01120;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_254A01128;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_20E032A2C((uint64_t)v11, (uint64_t)&unk_254A01130, (uint64_t)v16);
  swift_release();
}

- (void)dismissModalRUIController:(RUINavigationController *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  RUINavigationController *v15;
  _TtC14FamilyCircleUIP33_894AE38325ED3BE878E6154E185909E026FamilyDisclosureController *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253D2DF60);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_20E07D85C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_254A01110;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2549F6A10;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_20E032A2C((uint64_t)v9, (uint64_t)&unk_2549F7C60, (uint64_t)v14);
  swift_release();
}

- (_TtC14FamilyCircleUIP33_894AE38325ED3BE878E6154E185909E026FamilyDisclosureController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _TtC14FamilyCircleUIP33_894AE38325ED3BE878E6154E185909E026FamilyDisclosureController *v9;
  objc_super v11;

  if (a3)
  {
    sub_20E07D5D4();
    v6 = a4;
    v7 = (void *)sub_20E07D5A4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for FamilyDisclosureController();
  v9 = -[FamilyDisclosureController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, v7, a4);

  return v9;
}

- (_TtC14FamilyCircleUIP33_894AE38325ED3BE878E6154E185909E026FamilyDisclosureController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FamilyDisclosureController();
  return -[FamilyDisclosureController initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
