@implementation AdIgnorableViewFactory

- (id)createView
{
  type metadata accessor for AdIgnorableView();
  return objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

- (_TtC12NewsArticles22AdIgnorableViewFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[AdIgnorableViewFactory init](&v3, sel_init);
}

@end
