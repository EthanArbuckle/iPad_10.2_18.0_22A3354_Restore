@implementation ICQueryResultsControllerObjC

- (NSManagedObjectContext)managedObjectContext
{
  return (NSManagedObjectContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                           + OBJC_IVAR___ICQueryResultsControllerObjC_managedObjectContext));
}

- (ICQueryObjC)query
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___ICQueryResultsControllerObjC_query);
  swift_beginAccess();
  return (ICQueryObjC *)*v2;
}

- (void)setQuery:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___ICQueryResultsControllerObjC_query);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (id)fetchRequest
{
  ICQueryResultsControllerObjC *v2;
  id v3;

  v2 = self;
  v3 = ICQueryResultsController.fetchRequest.getter();

  return v3;
}

- (ICQueryResultsControllerObjC)initWithManagedObjectContext:(id)a3 query:(id)a4
{
  objc_class *ObjectType;
  id v8;
  id v9;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICQueryResultsControllerObjC_managedObjectContext) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICQueryResultsControllerObjC_query) = (Class)a4;
  v11.receiver = self;
  v11.super_class = ObjectType;
  v8 = a3;
  v9 = a4;
  return -[ICQueryResultsControllerObjC init](&v11, sel_init);
}

- (id)performFetch
{
  ICQueryResultsControllerObjC *v2;
  void *v3;

  v2 = self;
  ICQueryResultsController.performFetch()();

  sub_1BD942914(0, (unint64_t *)&qword_1EF50FF20);
  sub_1BDB4CBD8();
  v3 = (void *)sub_1BDBFDD04();
  swift_bridgeObjectRelease();
  return v3;
}

- (ICQueryResultsControllerObjC)init
{
  ICQueryResultsControllerObjC *result;

  result = (ICQueryResultsControllerObjC *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
