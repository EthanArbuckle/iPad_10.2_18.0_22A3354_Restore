@implementation JSDebugObject

- (_TtC9JetEngine13JSDebugObject)init
{
  objc_class *ObjectType;
  _TtC9JetEngine13JSDebugObject *v4;
  uint64_t v5;
  uint64_t *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  v5 = sub_19CD34938(0, 0, 256);
  v6 = (uint64_t *)((char *)v4 + OBJC_IVAR____TtC9JetEngine13JSDebugObject_newPoints);
  *v6 = v5;
  v6[1] = 0;
  *((_BYTE *)&v4->super.isa + OBJC_IVAR____TtC9JetEngine13JSDebugObject_isDebugPointsEnabled) = 0;
  sub_19CFDE9C0();
  swift_allocObject();
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC9JetEngine13JSDebugObject_encoder) = (Class)sub_19CFDE9B4();

  v8.receiver = v4;
  v8.super_class = ObjectType;
  return -[JSDebugObject init](&v8, sel_init);
}

- (id)pollPoints
{
  _TtC9JetEngine13JSDebugObject *v2;
  void *v3;

  v2 = self;
  sub_19CFD9634();

  v3 = (void *)sub_19CFDF854();
  swift_bridgeObjectRelease();
  return v3;
}

- (void)enable
{
  _TtC9JetEngine13JSDebugObject *v2;

  v2 = self;
  sub_19CFD9750();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
}

@end
