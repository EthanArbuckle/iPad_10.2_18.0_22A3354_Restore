@implementation ConcreteManagedConfigurationPrimitives

- (_TtC10ChronoCore38ConcreteManagedConfigurationPrimitives)init
{
  objc_class *ObjectType;
  _TtC10ChronoCore38ConcreteManagedConfigurationPrimitives *v4;
  void *v5;
  _TtC10ChronoCore38ConcreteManagedConfigurationPrimitives *v6;
  _TtC10ChronoCore38ConcreteManagedConfigurationPrimitives *result;
  _TtC10ChronoCore38ConcreteManagedConfigurationPrimitives *v8;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)&self->delegate[OBJC_IVAR____TtC10ChronoCore38ConcreteManagedConfigurationPrimitives_delegate] = 0;
  swift_unknownObjectWeakInit();
  v9.receiver = self;
  v9.super_class = ObjectType;
  v4 = -[ConcreteManagedConfigurationPrimitives init](&v9, sel_init);
  v5 = (void *)objc_opt_self();
  v6 = v4;
  result = (_TtC10ChronoCore38ConcreteManagedConfigurationPrimitives *)objc_msgSend(v5, sel_sharedConnection);
  if (result)
  {
    v8 = result;
    -[ConcreteManagedConfigurationPrimitives registerObserver:](result, sel_registerObserver_, v6);

    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void).cxx_destruct
{
  sub_1D272E144((uint64_t)self + OBJC_IVAR____TtC10ChronoCore38ConcreteManagedConfigurationPrimitives_delegate);
}

- (void)profileConnectionDidReceiveRestrictionChangedNotification:(id)a3 userInfo:(id)a4
{
  id v6;
  _TtC10ChronoCore38ConcreteManagedConfigurationPrimitives *v7;

  if (a4)
    sub_1D29C58E0();
  v6 = a3;
  v7 = self;
  sub_1D28A15CC();

  swift_bridgeObjectRelease();
}

@end
