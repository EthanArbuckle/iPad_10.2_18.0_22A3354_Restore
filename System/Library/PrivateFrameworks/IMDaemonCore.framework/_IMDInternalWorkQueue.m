@implementation _IMDInternalWorkQueue

+ (void)enqueueWorkBlock:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = _Block_copy(a3);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  _s12IMDaemonCore20IMDInternalWorkQueueC07enqueueD5BlockyyyyYbcFZ_0((uint64_t)sub_1D164F0CC, v4);
  swift_release();
}

- (_IMDInternalWorkQueue)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IMDInternalWorkQueue();
  return -[_IMDInternalWorkQueue init](&v3, sel_init);
}

@end
