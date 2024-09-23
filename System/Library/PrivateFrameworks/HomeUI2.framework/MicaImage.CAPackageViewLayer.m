@implementation MicaImage.CAPackageViewLayer

- (void)layoutSublayers
{
  _TtCV7HomeUI29MicaImageP33_268EDE8465BB49740E8AD9859354D22018CAPackageViewLayer *v2;

  v2 = self;
  sub_23EB26600();

}

- (_TtCV7HomeUI29MicaImageP33_268EDE8465BB49740E8AD9859354D22018CAPackageViewLayer)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtCV7HomeUI29MicaImageP33_268EDE8465BB49740E8AD9859354D22018CAPackageViewLayer_packageLayer) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[MicaImage.CAPackageViewLayer init](&v5, sel_init);
}

- (_TtCV7HomeUI29MicaImageP33_268EDE8465BB49740E8AD9859354D22018CAPackageViewLayer)initWithLayer:(id)a3
{
  objc_class *ObjectType;
  uint64_t v5;
  _TtCV7HomeUI29MicaImageP33_268EDE8465BB49740E8AD9859354D22018CAPackageViewLayer *v6;
  objc_super v8;
  _QWORD v9[4];

  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectRetain();
  sub_23EB6CC38();
  swift_unknownObjectRelease();
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtCV7HomeUI29MicaImageP33_268EDE8465BB49740E8AD9859354D22018CAPackageViewLayer_packageLayer) = 0;
  __swift_project_boxed_opaque_existential_0(v9, v9[3]);
  v5 = sub_23EB6CCB0();
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = -[MicaImage.CAPackageViewLayer initWithLayer:](&v8, sel_initWithLayer_, v5);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
  return v6;
}

- (_TtCV7HomeUI29MicaImageP33_268EDE8465BB49740E8AD9859354D22018CAPackageViewLayer)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtCV7HomeUI29MicaImageP33_268EDE8465BB49740E8AD9859354D22018CAPackageViewLayer_packageLayer) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[MicaImage.CAPackageViewLayer initWithCoder:](&v7, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtCV7HomeUI29MicaImageP33_268EDE8465BB49740E8AD9859354D22018CAPackageViewLayer_packageLayer));
}

@end
