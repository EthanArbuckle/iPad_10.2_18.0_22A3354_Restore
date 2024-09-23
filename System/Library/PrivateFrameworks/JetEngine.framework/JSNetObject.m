@implementation JSNetObject

- (id)fetch:(id)a3
{
  void *v5;
  id v6;
  _TtC9JetEngineP33_E3DD9B86F26A226B87DD24EC834542AC11JSNetObject *v7;
  id v8;
  void *v9;
  id v10;
  _TtC9JetEngineP33_E3DD9B86F26A226B87DD24EC834542AC11JSNetObject *v11;
  void *v12;
  id result;

  v5 = (void *)objc_opt_self();
  v6 = a3;
  v7 = self;
  v8 = objc_msgSend(v5, sel_currentContext);
  if (v8)
  {
    v9 = v8;
    v10 = v6;
    v11 = v7;
    v12 = (void *)sub_19CD2DA48((uint64_t)v9, (uint64_t)v10, (uint64_t)v11);

    return v12;
  }
  else
  {
    result = (id)sub_19CFE0340();
    __break(1u);
  }
  return result;
}

- (_TtC9JetEngineP33_E3DD9B86F26A226B87DD24EC834542AC11JSNetObject)init
{
  _TtC9JetEngineP33_E3DD9B86F26A226B87DD24EC834542AC11JSNetObject *result;

  result = (_TtC9JetEngineP33_E3DD9B86F26A226B87DD24EC834542AC11JSNetObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC9JetEngineP33_E3DD9B86F26A226B87DD24EC834542AC11JSNetObject_guts);
}

@end
