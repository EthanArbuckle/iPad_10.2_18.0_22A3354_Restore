@implementation URLHandler

- (_TtC12NewsArticles10URLHandler)init
{
  objc_class *ObjectType;
  objc_class *v4;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (objc_class *)MEMORY[0x1E0DEE9D8];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12NewsArticles10URLHandler_closures) = (Class)MEMORY[0x1E0DEE9D8];
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12NewsArticles10URLHandler_newWindowClosures) = v4;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return -[URLHandler init](&v6, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)openURL:(id)a3
{
  sub_1BA07AB74(self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC12NewsArticles10URLHandler_closures);
}

- (void)openNewWindowWithURL:(id)a3
{
  sub_1BA07AB74(self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC12NewsArticles10URLHandler_newWindowClosures);
}

@end
