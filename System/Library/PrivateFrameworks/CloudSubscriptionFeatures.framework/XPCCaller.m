@implementation XPCCaller

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25CloudSubscriptionFeatures9XPCCaller____lazy_storage___connection));
}

- (_TtC25CloudSubscriptionFeatures9XPCCaller)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC25CloudSubscriptionFeatures9XPCCaller____lazy_storage___connection) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[XPCCaller init](&v5, sel_init);
}

@end
