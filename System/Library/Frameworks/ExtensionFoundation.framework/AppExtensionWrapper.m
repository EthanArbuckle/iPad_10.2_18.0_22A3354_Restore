@implementation AppExtensionWrapper

- (void)handleConnection:(id)a3
{
  void (*v5)(id);
  _TtC19ExtensionFoundation19AppExtensionWrapper *v6;

  v5 = *(void (**)(id))((char *)&self->super.super.isa
                                 + OBJC_IVAR____TtC19ExtensionFoundation19AppExtensionWrapper__handleConnection);
  swift_unknownObjectRetain();
  v6 = self;
  v5(a3);
  swift_unknownObjectRelease();

}

- (BOOL)shouldAcceptConnection:(id)a3
{
  uint64_t (*v4)(id);
  id v5;
  _TtC19ExtensionFoundation19AppExtensionWrapper *v6;
  char v7;

  v4 = *(uint64_t (**)(id))((char *)&self->super.super.isa
                                    + OBJC_IVAR____TtC19ExtensionFoundation19AppExtensionWrapper__accept);
  v5 = a3;
  v6 = self;
  v7 = v4(v5);

  return v7 & 1;
}

- (_TtC19ExtensionFoundation19AppExtensionWrapper)init
{
  _TtC19ExtensionFoundation19AppExtensionWrapper *result;

  result = (_TtC19ExtensionFoundation19AppExtensionWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end
