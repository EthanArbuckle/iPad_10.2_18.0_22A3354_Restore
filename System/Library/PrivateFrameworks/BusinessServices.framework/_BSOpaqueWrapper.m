@implementation _BSOpaqueWrapper

- (id)wrappedThing
{
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa + OBJC_IVAR____BSOpaqueWrapper_wrappedThing), *(_QWORD *)&self->wrappedThing[OBJC_IVAR____BSOpaqueWrapper_wrappedThing + 16]);
  return (id)sub_21CAF83DC();
}

- (id)init:(id)a3
{
  _BSOpaqueWrapper *v4;
  objc_super v6;
  _BYTE v7[32];

  swift_unknownObjectRetain();
  sub_21CAF8328();
  swift_unknownObjectRelease();
  sub_21CAE3554((uint64_t)v7, (uint64_t)self + OBJC_IVAR____BSOpaqueWrapper_wrappedThing);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for OpaqueWrapper();
  v4 = -[_BSOpaqueWrapper init](&v6, sel_init);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v7);
  return v4;
}

- (_BSOpaqueWrapper)init
{
  _BSOpaqueWrapper *result;

  result = (_BSOpaqueWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____BSOpaqueWrapper_wrappedThing);
}

@end
