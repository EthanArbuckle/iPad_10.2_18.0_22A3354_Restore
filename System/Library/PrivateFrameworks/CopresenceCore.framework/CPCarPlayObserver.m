@implementation CPCarPlayObserver

- (void)dealloc
{
  void *v2;
  _TtC14CopresenceCore17CPCarPlayObserver *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14CopresenceCore17CPCarPlayObserver_sessionStatus);
  v3 = self;
  objc_msgSend(v2, sel_removeSessionObserver_, v3);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for CPCarPlayObserver();
  -[CPCarPlayObserver dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{

  outlined destroy of weak ActivitySessionManagerProtocol?((uint64_t)self + OBJC_IVAR____TtC14CopresenceCore17CPCarPlayObserver_delegate);
}

- (_TtC14CopresenceCore17CPCarPlayObserver)init
{
  _TtC14CopresenceCore17CPCarPlayObserver *result;

  result = (_TtC14CopresenceCore17CPCarPlayObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)sessionDidConnect:(id)a3
{
  id v4;
  _TtC14CopresenceCore17CPCarPlayObserver *v5;

  v4 = a3;
  v5 = self;
  CPCarPlayObserver.sessionDidConnect(_:)(v4);

}

- (void)sessionDidDisconnect:(id)a3
{
  id v4;
  _TtC14CopresenceCore17CPCarPlayObserver *v5;

  v4 = a3;
  v5 = self;
  CPCarPlayObserver.sessionDidDisconnect(_:)(v4);

}

- (void)startedConnectionAttemptOnTransport:(unint64_t)a3
{
  _TtC14CopresenceCore17CPCarPlayObserver *v4;

  v4 = self;
  CPCarPlayObserver.startedConnectionAttempt(on:)(a3);

}

- (void)cancelledConnectionAttemptOnTransport:(unint64_t)a3
{
  _TtC14CopresenceCore17CPCarPlayObserver *v4;

  v4 = self;
  CPCarPlayObserver.cancelledConnectionAttempt(on:)(a3);

}

@end
