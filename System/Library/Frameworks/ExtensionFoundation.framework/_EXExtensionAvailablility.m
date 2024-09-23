@implementation _EXExtensionAvailablility

- (int64_t)enabledCount
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____EXExtensionAvailablility_enabledCount);
}

- (void)setEnabledCount:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXExtensionAvailablility_enabledCount) = (Class)a3;
}

- (int64_t)disabledCount
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____EXExtensionAvailablility_disabledCount);
}

- (void)setDisabledCount:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXExtensionAvailablility_disabledCount) = (Class)a3;
}

- (int64_t)unelectedCount
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____EXExtensionAvailablility_unelectedCount);
}

- (void)setUnelectedCount:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXExtensionAvailablility_unelectedCount) = (Class)a3;
}

- (_EXExtensionAvailablility)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXExtensionAvailablility_enabledCount) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXExtensionAvailablility_disabledCount) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXExtensionAvailablility_unelectedCount) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for _EXExtensionAvailablility();
  return -[_EXExtensionAvailablility init](&v3, sel_init);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _EXExtensionAvailablility *v5;

  v4 = a3;
  v5 = self;
  sub_190C82300(v4);

}

- (_EXExtensionAvailablility)initWithCoder:(id)a3
{
  id v3;
  _EXExtensionAvailablility *v4;

  v3 = a3;
  v4 = (_EXExtensionAvailablility *)sub_190C862C4(v3);

  return v4;
}

+ (id)addChangeObserver:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v7[4];

  v3 = _Block_copy(a3);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  sub_190C82E60((uint64_t)sub_190C8660C, v4, v7);
  swift_release();
  __swift_project_boxed_opaque_existential_2Tm(v7, v7[3]);
  v5 = (void *)sub_190CA8BC0();
  __swift_destroy_boxed_opaque_existential_2Tm((uint64_t)v7);
  return v5;
}

+ (void)removeChangeObserver:(id)a3
{
  _BYTE v3[32];
  _BYTE v4[32];

  swift_unknownObjectRetain();
  sub_190CA8908();
  swift_unknownObjectRelease();
  sub_190C30128((uint64_t)v4, (uint64_t)v3);
  type metadata accessor for _EXExtensionAvailablilityObserver();
  if (swift_dynamicCast())
  {
    sub_190C82A70();
    swift_release();
    __swift_destroy_boxed_opaque_existential_2Tm((uint64_t)v4);
  }
  else
  {
    sub_190CA8ADC();
    __break(1u);
  }
}

@end
