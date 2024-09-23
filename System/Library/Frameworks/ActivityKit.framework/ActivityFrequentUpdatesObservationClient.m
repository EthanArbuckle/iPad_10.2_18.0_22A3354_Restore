@implementation ActivityFrequentUpdatesObservationClient

- (_TtC11ActivityKit40ActivityFrequentUpdatesObservationClient)init
{
  uint64_t v2;
  _TtC11ActivityKit40ActivityFrequentUpdatesObservationClient *v3;
  void *v4;
  id v5;
  objc_super v7;

  v2 = qword_2542383A0;
  v3 = self;
  if (v2 != -1)
    swift_once();
  v4 = (void *)qword_2542382C0;
  *(Class *)((char *)&v3->super.isa + OBJC_IVAR____TtC11ActivityKit40ActivityFrequentUpdatesObservationClient_singleton) = (Class)qword_2542382C0;
  v5 = v4;

  v7.receiver = v3;
  v7.super_class = (Class)type metadata accessor for ActivityFrequentUpdatesObservationClient();
  return -[ActivityFrequentUpdatesObservationClient init](&v7, sel_init);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11ActivityKit40ActivityFrequentUpdatesObservationClient_singleton));
}

@end
