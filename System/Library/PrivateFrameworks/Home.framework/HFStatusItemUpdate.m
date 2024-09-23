@implementation HFStatusItemUpdate

- (NSString)title
{
  HFStatusItemUpdate *v3;
  void *v4;

  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_1DD63DF6C();
  swift_release();
  swift_release();

  v4 = (void *)sub_1DD63E11C();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (void)setTitle:(id)a3
{
  HFStatusItemUpdate *v4;

  sub_1DD63E14C();
  swift_getKeyPath();
  swift_getKeyPath();
  v4 = self;
  sub_1DD63DF78();
}

- (NSString)secondaryText
{
  HFStatusItemUpdate *v3;
  void *v4;
  uint64_t v6;

  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_1DD63DF6C();
  swift_release();
  swift_release();

  if (!v6)
    return (NSString *)0;
  v4 = (void *)sub_1DD63E11C();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (void)setSecondaryText:(id)a3
{
  HFStatusItemUpdate *v4;

  if (a3)
    sub_1DD63E14C();
  swift_getKeyPath();
  swift_getKeyPath();
  v4 = self;
  sub_1DD63DF78();
}

- (HFIconDescriptor)iconDescriptor
{
  return (HFIconDescriptor *)sub_1DD3FDA64(self);
}

- (void)setIconDescriptor:(id)a3
{
  HFStatusItemUpdate *v4;

  swift_getKeyPath();
  swift_getKeyPath();
  swift_unknownObjectRetain_n();
  v4 = self;
  sub_1DD63DF78();
  sub_1DD3FD4AC();
  swift_unknownObjectRelease();

}

- (HFNumberRange)currentValue
{
  return (HFNumberRange *)sub_1DD3FDA64(self);
}

- (void)setCurrentValue:(id)a3
{
  sub_1DD3FDB6C(self, (uint64_t)a2, a3);
}

- (HFNumberRange)possibleValues
{
  return (HFNumberRange *)sub_1DD3FDA64(self);
}

- (void)setPossibleValues:(id)a3
{
  sub_1DD3FDB6C(self, (uint64_t)a2, a3);
}

- (HFStatusItemUpdate)initWithTitle:(id)a3 secondaryText:(id)a4 iconDescriptor:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  HFStatusItemUpdate *v12;

  v7 = sub_1DD63E14C();
  v9 = v8;
  if (a4)
  {
    a4 = (id)sub_1DD63E14C();
    v11 = v10;
  }
  else
  {
    v11 = 0;
  }
  swift_unknownObjectRetain();
  v12 = (HFStatusItemUpdate *)sub_1DD3FEE34(v7, v9, (uint64_t)a4, v11, (uint64_t)a5);
  swift_unknownObjectRelease();
  return v12;
}

- (HFStatusItemUpdate)initWithTitle:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_1DD63E14C();
  return (HFStatusItemUpdate *)StatusItemUpdate.init(title:)(v3, v4);
}

- (NSString)description
{
  HFStatusItemUpdate *v2;
  void *v3;

  v2 = self;
  sub_1DD3FE744();

  v3 = (void *)sub_1DD63E11C();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (HFStatusItemUpdate)init
{
  HFStatusItemUpdate *result;

  result = (HFStatusItemUpdate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t);

  v3 = (char *)self + OBJC_IVAR___HFStatusItemUpdate__title;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03E4CE8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR___HFStatusItemUpdate__secondaryText;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03E4D00);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR___HFStatusItemUpdate__iconDescriptor;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03E4D18);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  v9 = (char *)self + OBJC_IVAR___HFStatusItemUpdate__currentValue;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03E4D30);
  v11 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8);
  v11(v9, v10);
  v11((char *)self + OBJC_IVAR___HFStatusItemUpdate__possibleValues, v10);
}

@end
