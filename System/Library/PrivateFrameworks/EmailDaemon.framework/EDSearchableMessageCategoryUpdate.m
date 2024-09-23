@implementation EDSearchableMessageCategoryUpdate

- (EDSearchableMessageCategoryUpdate)initWithCategory:(id)a3
{
  id *v3;
  id v4;
  objc_super v6;

  v3 = (id *)((char *)&self->super.isa + OBJC_IVAR___EDSearchableMessageCategoryUpdate__underlying);
  v3[3] = &type metadata for SearchableMessageCategoryUpdate;
  *v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)EDSearchableMessageCategoryUpdate;
  v4 = a3;
  return -[EDSearchableMessageCategoryUpdate init](&v6, sel_init);
}

- (void)addToAttributes:(id)a3
{
  id v4;
  EDSearchableMessageCategoryUpdate *v5;

  v4 = a3;
  v5 = self;
  sub_1D310BFC4(v4);

}

- (EDSearchableMessageCategoryUpdate)init
{
  EDSearchableMessageCategoryUpdate *result;

  result = (EDSearchableMessageCategoryUpdate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___EDSearchableMessageCategoryUpdate__underlying);
}

@end
