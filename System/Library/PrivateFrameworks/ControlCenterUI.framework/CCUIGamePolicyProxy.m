@implementation CCUIGamePolicyProxy

- (_TtC15ControlCenterUIP33_5C556405AB7AB4F2600F1BC1CA1813A619CCUIGamePolicyProxy)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC15ControlCenterUIP33_5C556405AB7AB4F2600F1BC1CA1813A619CCUIGamePolicyProxy__connection) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CCUIGamePolicyProxy();
  return -[CCUIGamePolicyProxy init](&v3, sel_init);
}

- (void)dealloc
{
  void *v2;
  _TtC15ControlCenterUIP33_5C556405AB7AB4F2600F1BC1CA1813A619CCUIGamePolicyProxy *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC15ControlCenterUIP33_5C556405AB7AB4F2600F1BC1CA1813A619CCUIGamePolicyProxy__connection);
  v3 = self;
  objc_msgSend(v2, sel_invalidate);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for CCUIGamePolicyProxy();
  -[CCUIGamePolicyProxy dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ControlCenterUIP33_5C556405AB7AB4F2600F1BC1CA1813A619CCUIGamePolicyProxy__connection));
}

@end
