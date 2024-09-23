@implementation JSMediaTokenServiceObject

- (id)refreshToken
{
  _TtC19AppStoreKitInternal25JSMediaTokenServiceObject *v3;
  void *v4;
  void *v5;

  swift_getObjectType();
  sub_1D832F5B8(0, (unint64_t *)&qword_1EDA3AFB0);
  v3 = self;
  v4 = (void *)sub_1D892B870();
  v5 = (void *)sub_1D892B87C();

  return v5;
}

- (id)overrideToken:(id)a3
{
  id v5;
  _TtC19AppStoreKitInternal25JSMediaTokenServiceObject *v6;
  void *v7;
  void *v8;

  swift_getObjectType();
  sub_1D832F5B8(0, (unint64_t *)&qword_1EDA3AFB0);
  v5 = a3;
  v6 = self;
  v7 = (void *)sub_1D892B870();
  v8 = (void *)sub_1D892B87C();

  return v8;
}

- (NSString)tokenString
{
  _TtC19AppStoreKitInternal25JSMediaTokenServiceObject *v3;
  uint64_t v4;
  void *v5;

  sub_1D8929CD4();
  v3 = self;
  sub_1D8929CC8();
  if (qword_1EDA3AAF0 != -1)
    swift_once();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA452E8);
  __swift_project_value_buffer(v4, (uint64_t)qword_1EDA3AAD0);
  sub_1D8929830();
  swift_release();

  v5 = (void *)sub_1D892AD90();
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (void)resetToken
{
  _TtC19AppStoreKitInternal25JSMediaTokenServiceObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v7[5];

  sub_1D8929CD4();
  v3 = self;
  sub_1D8929CC8();
  if (qword_1EDA3AAF0 != -1)
    swift_once();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDA452E8);
  v5 = __swift_project_value_buffer(v4, (uint64_t)qword_1EDA3AAD0);
  v7[3] = v4;
  v7[4] = sub_1D8502C2C();
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v7);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(boxed_opaque_existential_0, v5, v4);
  sub_1D8929CA4();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  objc_msgSend(*(id *)((char *)&v3->super.isa + OBJC_IVAR____TtC19AppStoreKitInternal25JSMediaTokenServiceObject_tokenService), sel_invalidateMediaToken);

}

- (_TtC19AppStoreKitInternal25JSMediaTokenServiceObject)init
{
  _TtC19AppStoreKitInternal25JSMediaTokenServiceObject *result;

  result = (_TtC19AppStoreKitInternal25JSMediaTokenServiceObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end
