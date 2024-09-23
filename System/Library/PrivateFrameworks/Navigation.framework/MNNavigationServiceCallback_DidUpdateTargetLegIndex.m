@implementation MNNavigationServiceCallback_DidUpdateTargetLegIndex

- (int64_t)targetLegIndex
{
  return *(int64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC10Navigation51MNNavigationServiceCallback_DidUpdateTargetLegIndex_targetLegIndex);
}

- (_TtC10Navigation51MNNavigationServiceCallback_DidUpdateTargetLegIndex)initWithTargetLegIndex:(int64_t)a3
{
  return (_TtC10Navigation51MNNavigationServiceCallback_DidUpdateTargetLegIndex *)sub_1B0ADAA04((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC10Navigation51MNNavigationServiceCallback_DidUpdateTargetLegIndex_targetLegIndex, type metadata accessor for MNNavigationServiceCallback_DidUpdateTargetLegIndex);
}

- (unint64_t)type
{
  return 11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC10Navigation51MNNavigationServiceCallback_DidUpdateTargetLegIndex)initWithCoder:(id)a3
{
  id v4;
  _TtC10Navigation51MNNavigationServiceCallback_DidUpdateTargetLegIndex *v5;
  void *v6;
  objc_class *v7;
  _TtC10Navigation51MNNavigationServiceCallback_DidUpdateTargetLegIndex *v8;
  objc_super v10;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_1B0BCAA14();
  v7 = (objc_class *)objc_msgSend(v4, sel_decodeIntegerForKey_, v6);

  *(Class *)((char *)&v5->super.super.isa
           + OBJC_IVAR____TtC10Navigation51MNNavigationServiceCallback_DidUpdateTargetLegIndex_targetLegIndex) = v7;

  v10.receiver = v5;
  v10.super_class = (Class)type metadata accessor for MNNavigationServiceCallback_DidUpdateTargetLegIndex();
  v8 = -[MNNavigationServiceCallbackParameters initWithCoder:](&v10, sel_initWithCoder_, v4);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  sub_1B0ADAB80(self, (uint64_t)a2, a3, type metadata accessor for MNNavigationServiceCallback_DidUpdateTargetLegIndex, &OBJC_IVAR____TtC10Navigation51MNNavigationServiceCallback_DidUpdateTargetLegIndex_targetLegIndex);
}

- (_TtC10Navigation51MNNavigationServiceCallback_DidUpdateTargetLegIndex)init
{
  _TtC10Navigation51MNNavigationServiceCallback_DidUpdateTargetLegIndex *result;

  result = (_TtC10Navigation51MNNavigationServiceCallback_DidUpdateTargetLegIndex *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
