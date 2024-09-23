@implementation ICTextElementLocator

- (ICTextElementLocator)initWithTextView:(id)a3
{
  objc_class *ObjectType;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  v6.receiver = self;
  v6.super_class = ObjectType;
  return -[ICTextElementLocator init](&v6, sel_init);
}

- (void)enumerateTextElementsUsingBlock:(id)a3
{
  void *v4;
  ICTextElementLocator *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1DD9C45AC((uint64_t)v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (ICTextElementLocator)init
{
  ICTextElementLocator *result;

  result = (ICTextElementLocator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

@end
