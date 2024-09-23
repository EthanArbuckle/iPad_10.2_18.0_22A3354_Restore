@implementation IMessageHandlesForPeopleRecommendations

- (IMessageHandlesForPeopleRecommendations)initWithProvider:(id)a3
{
  objc_super v4;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMessageHandlesForPeopleRecommendations_provider) = (Class)a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for IMessageHandleForPeopleRecommendations();
  swift_unknownObjectRetain();
  return -[IMessageHandlesForPeopleRecommendations init](&v4, sel_init);
}

- (void)getRecommendationsWith:(id)a3 completion:(id)a4
{
  void *v5;
  unint64_t v6;
  IMessageHandlesForPeopleRecommendations *v7;

  v5 = _Block_copy(a4);
  sub_20DE9432C(0, &qword_2549FCF08);
  v6 = sub_20E07D73C();
  _Block_copy(v5);
  v7 = self;
  sub_20DFF317C(v6, v7, (void (**)(_QWORD, _QWORD, _QWORD))v5);
  _Block_release(v5);
  _Block_release(v5);

  swift_bridgeObjectRelease();
}

- (IMessageHandlesForPeopleRecommendations)init
{
  IMessageHandlesForPeopleRecommendations *result;

  result = (IMessageHandlesForPeopleRecommendations *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end
