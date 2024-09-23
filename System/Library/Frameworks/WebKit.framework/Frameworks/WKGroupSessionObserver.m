@implementation WKGroupSessionObserver

- (id)newSessionCallback
{
  return sub_235498F90((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___WKGroupSessionObserver_newSessionCallback, (uint64_t)sub_235498A38, (uint64_t)&block_descriptor);
}

- (void)setNewSessionCallback:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_23549A634;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___WKGroupSessionObserver_newSessionCallback);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_23549A0F0(v7);
}

- (WKGroupSessionObserver)init
{
  return (WKGroupSessionObserver *)GroupSessionObserver.init()();
}

- (void)dealloc
{
  WKGroupSessionObserver *v3;
  WKGroupSessionObserver *v4;
  objc_super v5;

  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___WKGroupSessionObserver_incomingSessionsTask))
  {
    v3 = self;
    swift_retain();
    sub_2354A3B1C();
    swift_release();
  }
  else
  {
    v4 = self;
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for GroupSessionObserver();
  -[WKGroupSessionObserver dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  sub_23549A0F0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WKGroupSessionObserver_newSessionCallback));
  swift_release();
}

@end
