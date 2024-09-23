@implementation EventStoreManager

- (_TtC20ProductPageExtension17EventStoreManager)init
{
  objc_class *ObjectType;
  uint64_t v4;
  id v5;
  _TtC20ProductPageExtension17EventStoreManager *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = OBJC_IVAR____TtC20ProductPageExtension17EventStoreManager_eventStore;
  v5 = objc_allocWithZone((Class)EKEventStore);
  v6 = self;
  *(Class *)((char *)&self->super.isa + v4) = (Class)objc_msgSend(v5, "init");

  v8.receiver = v6;
  v8.super_class = ObjectType;
  return -[EventStoreManager init](&v8, "init");
}

- (void).cxx_destruct
{

}

@end
