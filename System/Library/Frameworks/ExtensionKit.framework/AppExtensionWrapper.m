@implementation AppExtensionWrapper

- (BOOL)shouldAcceptConnection:(id)a3
{
  id v5;
  _TtC12ExtensionKit19AppExtensionWrapper *v6;
  char v7;
  _QWORD v9[3];
  uint64_t v10;

  sub_20AE8C338((uint64_t)&self->super._strongDelegate + OBJC_IVAR____TtC12ExtensionKit19AppExtensionWrapper_configurationScene, (uint64_t)v9);
  if (v10)
  {
    __swift_project_boxed_opaque_existential_1(v9, v10);
    v5 = a3;
    v6 = self;
    v7 = sub_20AE9CF80();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);

  }
  else
  {
    sub_20AE8C380((uint64_t)v9);
    v7 = 0;
  }
  return v7 & 1;
}

- (_TtC12ExtensionKit19AppExtensionWrapper)init
{
  _TtC12ExtensionKit19AppExtensionWrapper *result;

  result = (_TtC12ExtensionKit19AppExtensionWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_20AE8C3C0((uint64_t)self + OBJC_IVAR____TtC12ExtensionKit19AppExtensionWrapper_configurationScene);
}

@end
