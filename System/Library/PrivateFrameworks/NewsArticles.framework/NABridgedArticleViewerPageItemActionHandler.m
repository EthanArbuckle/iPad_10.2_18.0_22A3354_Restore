@implementation NABridgedArticleViewerPageItemActionHandler

- (NABridgedArticleViewerPageItemActionHandler)initWithDelegate:(id)a3
{
  objc_class *ObjectType;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  v6.receiver = self;
  v6.super_class = ObjectType;
  return -[NABridgedArticleViewerPageItemActionHandler init](&v6, sel_init);
}

- (NABridgedArticleViewerPageItemActionHandler)init
{
  NABridgedArticleViewerPageItemActionHandler *result;

  result = (NABridgedArticleViewerPageItemActionHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B9E30DEC((uint64_t)self + OBJC_IVAR___NABridgedArticleViewerPageItemActionHandler_delegate);
}

@end
