@implementation CMVO2MaxRetrocomputeStatePublisher

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC5HeartP33_1983BB941A89CE37AE5E37B88EF7D39A34CMVO2MaxRetrocomputeStatePublisher *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC5HeartP33_1983BB941A89CE37AE5E37B88EF7D39A34CMVO2MaxRetrocomputeStatePublisher_manager);
  v5 = self;
  objc_msgSend(v4, sel_stopRetrocomputeStatusUpdates);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  -[CMVO2MaxRetrocomputeStatePublisher dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5HeartP33_1983BB941A89CE37AE5E37B88EF7D39A34CMVO2MaxRetrocomputeStatePublisher_manager));
  swift_release();
}

- (void)vo2MaxRetrocomputeManager:(id)a3 didUpdateState:(id)a4
{
  id v6;
  id v7;
  _TtC5HeartP33_1983BB941A89CE37AE5E37B88EF7D39A34CMVO2MaxRetrocomputeStatePublisher *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_2313A2B7C(v7);

}

- (void)vo2MaxRetrocomputeManager:(id)a3 updateFailedWithError:(id)a4
{
  id v6;
  _TtC5HeartP33_1983BB941A89CE37AE5E37B88EF7D39A34CMVO2MaxRetrocomputeStatePublisher *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_2313A2E5C(v8);

}

- (_TtC5HeartP33_1983BB941A89CE37AE5E37B88EF7D39A34CMVO2MaxRetrocomputeStatePublisher)init
{
  _TtC5HeartP33_1983BB941A89CE37AE5E37B88EF7D39A34CMVO2MaxRetrocomputeStatePublisher *result;

  result = (_TtC5HeartP33_1983BB941A89CE37AE5E37B88EF7D39A34CMVO2MaxRetrocomputeStatePublisher *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
