@implementation JSLocalizerFactoryObject

- (id)localizerForLanguage:(id)a3
{
  uint64_t ObjectType;
  void *v6;
  id v7;
  _TtC9JetEngine24JSLocalizerFactoryObject *v8;
  id v9;
  void *v10;
  id v11;
  _TtC9JetEngine24JSLocalizerFactoryObject *v12;
  void *v13;
  id result;

  ObjectType = swift_getObjectType();
  v6 = (void *)objc_opt_self();
  v7 = a3;
  v8 = self;
  v9 = objc_msgSend(v6, sel_currentContext);
  if (v9)
  {
    v10 = v9;
    v11 = v7;
    v12 = v8;
    v13 = (void *)sub_19CE02E64((uint64_t)v10, v11, v12, ObjectType);

    return v13;
  }
  else
  {
    result = (id)sub_19CFE0340();
    __break(1u);
  }
  return result;
}

- (_TtC9JetEngine24JSLocalizerFactoryObject)init
{
  _TtC9JetEngine24JSLocalizerFactoryObject *result;

  result = (_TtC9JetEngine24JSLocalizerFactoryObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC9JetEngine24JSLocalizerFactoryObject_localizerFactory);
}

@end
