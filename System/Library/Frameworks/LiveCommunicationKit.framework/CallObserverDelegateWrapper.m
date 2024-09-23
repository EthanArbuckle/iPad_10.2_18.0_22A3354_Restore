@implementation CallObserverDelegateWrapper

- (_TtC20LiveCommunicationKit27CallObserverDelegateWrapper)init
{
  _QWORD *v2;
  objc_super v4;

  v2 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC20LiveCommunicationKit27CallObserverDelegateWrapper_onCallChanged);
  *v2 = nullsub_1;
  v2[1] = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CallObserverDelegateWrapper();
  return -[CallObserverDelegateWrapper init](&v4, sel_init);
}

- (void).cxx_destruct
{
  swift_release();
}

- (void)callObserver:(id)a3 callChanged:(id)a4
{
  void (*v6)(id);
  id v7;
  id v8;
  _TtC20LiveCommunicationKit27CallObserverDelegateWrapper *v9;

  v6 = *(void (**)(id))((char *)&self->super.isa
                                 + OBJC_IVAR____TtC20LiveCommunicationKit27CallObserverDelegateWrapper_onCallChanged);
  v7 = a3;
  v8 = a4;
  v9 = self;
  swift_retain();
  v6(v8);

  swift_release();
}

@end
