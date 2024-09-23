@implementation DefaultObjcUnarchiver

- (id)decodeObjectOfClasses:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  objc_super v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "setByAddingObject:", +[ObjcArchivableWrapperClassProducer classForNSXPCListenerEndpoint](_TtC12AppleIDSetup34ObjcArchivableWrapperClassProducer, "classForNSXPCListenerEndpoint"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11.receiver = self;
  v11.super_class = (Class)_TtC12AppleIDSetup21DefaultObjcUnarchiver;
  -[DefaultObjcUnarchiver decodeObjectOfClasses:forKey:](&v11, sel_decodeObjectOfClasses_forKey_, v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)decodeObjectForKey:(id)a3
{
  _TtC12AppleIDSetup21DefaultObjcUnarchiver *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD v12[3];
  uint64_t v13;

  sub_2365B005C();
  v4 = self;
  sub_2365AE9D0((uint64_t)v12);

  swift_bridgeObjectRelease();
  v5 = v13;
  if (!v13)
    return 0;
  v6 = __swift_project_boxed_opaque_existential_1(v12, v13);
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v9);
  v10 = (void *)sub_2365B08C0();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v10;
}

- (id)initForReadingFromData:(id)a3 error:(id *)a4
{
  id v4;
  id result;

  v4 = a3;
  sub_2365AF948();

  result = (id)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC12AppleIDSetup21DefaultObjcUnarchiver)init
{
  _TtC12AppleIDSetup21DefaultObjcUnarchiver *result;

  result = (_TtC12AppleIDSetup21DefaultObjcUnarchiver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)initForReadingWithData:(id)a3
{
  id v3;
  id result;

  v3 = a3;
  sub_2365AF948();

  result = (id)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12AppleIDSetup21DefaultObjcUnarchiver_decoder);
}

@end
