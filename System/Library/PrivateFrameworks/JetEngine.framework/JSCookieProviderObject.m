@implementation JSCookieProviderObject

- (id)cookieForUrlWithName:(id)a3 :(id)a4
{
  void *v7;
  id v8;
  id v9;
  _TtC9JetEngine22JSCookieProviderObject *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _TtC9JetEngine22JSCookieProviderObject *v15;
  void *v16;
  id result;

  v7 = (void *)objc_opt_self();
  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = objc_msgSend(v7, sel_currentContext);
  if (v11)
  {
    v12 = v11;
    v13 = v8;
    v14 = v9;
    v15 = v10;
    v16 = (void *)sub_19CD04A08((uint64_t)v12, (uint64_t)v13, (uint64_t)v14, (uint64_t)v15);

    return v16;
  }
  else
  {
    result = (id)sub_19CFE0340();
    __break(1u);
  }
  return result;
}

- (_TtC9JetEngine22JSCookieProviderObject)init
{
  _TtC9JetEngine22JSCookieProviderObject *result;

  result = (_TtC9JetEngine22JSCookieProviderObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC9JetEngine22JSCookieProviderObject_accountProvider);
}

@end
