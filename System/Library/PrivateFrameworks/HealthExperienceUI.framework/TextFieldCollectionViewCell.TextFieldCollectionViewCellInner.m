@implementation TextFieldCollectionViewCell.TextFieldCollectionViewCellInner

- (BOOL)respondsToSelector:(SEL)a3
{
  uint64_t v5;
  void *v6;
  _TtCC18HealthExperienceUI27TextFieldCollectionViewCellP33_CA6334EB88576D7E5F1F357E76DAEE2F32TextFieldCollectionViewCellInner *v7;
  unsigned __int8 v8;
  objc_super v10;

  v5 = MEMORY[0x1AF41CA2C]((char *)self+ OBJC_IVAR____TtCC18HealthExperienceUI27TextFieldCollectionViewCellP33_CA6334EB88576D7E5F1F357E76DAEE2F32TextFieldCollectionViewCellInner_target, a2);
  if (v5)
  {
    v6 = (void *)v5;
    v7 = self;
    v8 = objc_msgSend(v6, sel_respondsToSelector_, a3);
    swift_unknownObjectRelease();

    return v8;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)type metadata accessor for TextFieldCollectionViewCell.TextFieldCollectionViewCellInner();
    return -[TextFieldCollectionViewCell.TextFieldCollectionViewCellInner respondsToSelector:](&v10, sel_respondsToSelector_, a3);
  }
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  void *v3;
  _QWORD v5[4];

  v3 = (void *)MEMORY[0x1AF41CA2C]((char *)self+ OBJC_IVAR____TtCC18HealthExperienceUI27TextFieldCollectionViewCellP33_CA6334EB88576D7E5F1F357E76DAEE2F32TextFieldCollectionViewCellInner_target, a2, a3);
  if (v3)
  {
    v5[3] = swift_getObjectType();
    v5[0] = v3;
    v3 = (void *)sub_1A9A96BA4();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  }
  return v3;
}

- (_TtCC18HealthExperienceUI27TextFieldCollectionViewCellP33_CA6334EB88576D7E5F1F357E76DAEE2F32TextFieldCollectionViewCellInner)init
{
  _TtCC18HealthExperienceUI27TextFieldCollectionViewCellP33_CA6334EB88576D7E5F1F357E76DAEE2F32TextFieldCollectionViewCellInner *result;

  result = (_TtCC18HealthExperienceUI27TextFieldCollectionViewCellP33_CA6334EB88576D7E5F1F357E76DAEE2F32TextFieldCollectionViewCellInner *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A961AEDC((uint64_t)self+ OBJC_IVAR____TtCC18HealthExperienceUI27TextFieldCollectionViewCellP33_CA6334EB88576D7E5F1F357E76DAEE2F32TextFieldCollectionViewCellInner_target);
}

@end
