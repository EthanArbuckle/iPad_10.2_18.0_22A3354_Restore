@implementation CHSEquivalentBundleIdentifierResolver

- (CHSEquivalentBundleIdentifierResolver)init
{
  objc_super v4;

  type metadata accessor for ConcreteCategoriesPrimitives();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___CHSEquivalentBundleIdentifierResolver_categoriesPrimitives) = (Class)swift_allocObject();
  v4.receiver = self;
  v4.super_class = (Class)CHSEquivalentBundleIdentifierResolver;
  return -[CHSEquivalentBundleIdentifierResolver init](&v4, sel_init);
}

- (CHSEquivalentBundleIdentifierResolver)initWithCategoriesPrimitives:(id)a3
{
  CHSEquivalentBundleIdentifierResolver *v5;

  swift_unknownObjectRetain();
  v5 = -[CHSEquivalentBundleIdentifierResolver init](self, sel_init);
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR___CHSEquivalentBundleIdentifierResolver_categoriesPrimitives) = (Class)a3;
  swift_unknownObjectRelease();
  return v5;
}

+ (id)defaultResolver
{
  id v2;

  type metadata accessor for ConcreteCategoriesPrimitives();
  v2 = objc_msgSend(objc_allocWithZone((Class)CHSEquivalentBundleIdentifierResolver), sel_initWithCategoriesPrimitives_, swift_allocObject());
  swift_release();
  return v2;
}

- (id)equivalentBundleIdentifiersForBundleIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CHSEquivalentBundleIdentifierResolver *v7;
  void *v8;

  v4 = sub_18FBCD0DC();
  v6 = v5;
  v7 = self;
  sub_18FBB3DD8(v4, v6);

  swift_bridgeObjectRelease();
  v8 = (void *)sub_18FBCD310();
  swift_bridgeObjectRelease();
  return v8;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end
