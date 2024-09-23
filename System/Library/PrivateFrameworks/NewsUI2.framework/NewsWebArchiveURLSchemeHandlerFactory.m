@implementation NewsWebArchiveURLSchemeHandlerFactory

- (id)createURLSchemeHandlerWithTask:(id)a3
{
  objc_class *v5;
  char *v6;
  _TtC7NewsUI237NewsWebArchiveURLSchemeHandlerFactory *v7;
  _TtC7NewsUI237NewsWebArchiveURLSchemeHandlerFactory *v8;
  objc_super v10;
  _BYTE v11[40];

  sub_1D5E96490((uint64_t)self + OBJC_IVAR____TtC7NewsUI237NewsWebArchiveURLSchemeHandlerFactory_webArchiveService, (uint64_t)v11);
  v5 = (objc_class *)type metadata accessor for NewsWebArchiveURLSchemeHandler();
  v6 = (char *)objc_allocWithZone(v5);
  *(_QWORD *)&v6[OBJC_IVAR____TtC7NewsUI230NewsWebArchiveURLSchemeHandler_task] = a3;
  sub_1D5E96490((uint64_t)v11, (uint64_t)&v6[OBJC_IVAR____TtC7NewsUI230NewsWebArchiveURLSchemeHandler_webArchiveService]);
  v10.receiver = v6;
  v10.super_class = v5;
  swift_unknownObjectRetain_n();
  v7 = self;
  v8 = -[NewsWebArchiveURLSchemeHandlerFactory init](&v10, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  swift_unknownObjectRelease();

  return v8;
}

- (_TtC7NewsUI237NewsWebArchiveURLSchemeHandlerFactory)init
{
  _TtC7NewsUI237NewsWebArchiveURLSchemeHandlerFactory *result;

  result = (_TtC7NewsUI237NewsWebArchiveURLSchemeHandlerFactory *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI237NewsWebArchiveURLSchemeHandlerFactory_webArchiveService);
}

@end
