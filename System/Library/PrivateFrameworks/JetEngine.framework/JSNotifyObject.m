@implementation JSNotifyObject

- (_TtC9JetEngine14JSNotifyObject)init
{
  objc_class *ObjectType;
  _TtC9JetEngine14JSNotifyObject *v4;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC9JetEngine14JSNotifyObject_observersByName) = (Class)sub_19CD07C74(MEMORY[0x1E0DEE9D8]);

  v6.receiver = v4;
  v6.super_class = ObjectType;
  return -[JSNotifyObject init](&v6, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (void)register:(id)a3 :(id)a4
{
  void *v7;
  id v8;
  id v9;
  _TtC9JetEngine14JSNotifyObject *v10;
  id v11;
  void *v12;
  id v13;
  _TtC9JetEngine14JSNotifyObject *v14;
  id v15;

  v7 = (void *)objc_opt_self();
  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = objc_msgSend(v7, sel_currentContext);
  if (v11)
  {
    v12 = v11;
    v15 = v8;
    v13 = v9;
    v14 = v10;

  }
  else
  {
    sub_19CFE0340();
    __break(1u);
  }
}

- (void)unregister:(id)a3 :(id)a4
{
  id v6;
  id v7;
  _TtC9JetEngine14JSNotifyObject *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_19CF7FDF0(v6, (uint64_t)v7);

}

- (void)post:(id)a3
{
  id v4;
  _TtC9JetEngine14JSNotifyObject *v5;

  v4 = a3;
  v5 = self;
  sub_19CF7F278(v4);

}

@end
