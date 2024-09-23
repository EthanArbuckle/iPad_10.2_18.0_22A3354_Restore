@implementation ErrorControllerImplementation

- (void)resolveError:(id)a3 forItem:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  swift_unknownObjectRetain();
  swift_retain();
  sub_210CE6B4C((uint64_t)v9, (uint64_t)a4, (uint64_t)self, (void (**)(_QWORD, _QWORD))v8);
  _Block_release(v8);
  swift_unknownObjectRelease();
  swift_release();

}

- (void)reportCriticalError:(id)a3 forItem:(id)a4
{
  a3;
  swift_unknownObjectRetain();
  swift_retain();
  sub_210CE6F00();
}

- (void)resetWithReason:(id)a3
{
  a3;
  swift_retain();
  sub_210CE7000();
}

@end
