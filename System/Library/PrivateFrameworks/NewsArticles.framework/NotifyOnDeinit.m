@implementation NotifyOnDeinit

- (void)dealloc
{
  objc_class *ObjectType;
  void (*v4)(uint64_t);
  _TtC12NewsArticlesP33_C03E0B959E775327989EE4DDE248085F14NotifyOnDeinit *v5;
  uint64_t v6;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(void (**)(uint64_t))((char *)&self->super.isa
                                      + OBJC_IVAR____TtC12NewsArticlesP33_C03E0B959E775327989EE4DDE248085F14NotifyOnDeinit_onDeinit);
  v5 = self;
  v6 = swift_retain();
  v4(v6);
  swift_release();
  v7.receiver = v5;
  v7.super_class = ObjectType;
  -[NotifyOnDeinit dealloc](&v7, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_release();
}

- (_TtC12NewsArticlesP33_C03E0B959E775327989EE4DDE248085F14NotifyOnDeinit)init
{
  _TtC12NewsArticlesP33_C03E0B959E775327989EE4DDE248085F14NotifyOnDeinit *result;

  result = (_TtC12NewsArticlesP33_C03E0B959E775327989EE4DDE248085F14NotifyOnDeinit *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
