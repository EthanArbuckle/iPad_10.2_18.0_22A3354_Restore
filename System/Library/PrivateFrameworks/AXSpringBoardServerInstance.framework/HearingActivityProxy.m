@implementation HearingActivityProxy

- (void)startWithCompletionHandler:(id)a3
{
  _TtC27AXSpringBoardServerInstance20HearingActivityProxy *v3;
  uint64_t v4;
  void *v5;

  v5 = _Block_copy(a3);
  v3 = self;
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v5;
  *(_QWORD *)(v4 + 24) = self;
  sub_21ACAEFE4((uint64_t)&unk_255114F58, v4);
}

- (void)finishWithCompletionHandler:(id)a3
{
  _TtC27AXSpringBoardServerInstance20HearingActivityProxy *v3;
  uint64_t v4;
  void *v5;

  v5 = _Block_copy(a3);
  v3 = self;
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v5;
  *(_QWORD *)(v4 + 24) = self;
  sub_21ACAEFE4((uint64_t)&unk_255114F70, v4);
}

- (_TtC27AXSpringBoardServerInstance20HearingActivityProxy)init
{
  return (_TtC27AXSpringBoardServerInstance20HearingActivityProxy *)HearingActivityProxy.init()();
}

@end
