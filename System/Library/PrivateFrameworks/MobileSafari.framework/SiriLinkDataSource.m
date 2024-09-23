@implementation SiriLinkDataSource

- (_TtC12MobileSafari18SiriLinkDataSource)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12MobileSafari18SiriLinkDataSource____lazy_storage___connection) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[SiriLinkDataSource init](&v5, sel_init);
}

- (void).cxx_destruct
{
  sub_18B913BBC((uint64_t)self + OBJC_IVAR____TtC12MobileSafari18SiriLinkDataSource_applicationProxy);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12MobileSafari18SiriLinkDataSource____lazy_storage___connection));
}

@end
