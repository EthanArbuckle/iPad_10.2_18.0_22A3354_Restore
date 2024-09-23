@implementation ProxyEventProcessor

- (void)flushWithCallbackQueue:(id)a3 completion:(id)a4
{
  uint64_t (*v5)(void);
  uint64_t v6;
  id v7;

  v5 = (uint64_t (*)(void))_Block_copy(a4);
  if (v5)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v5 = sub_1A5EBC084;
  }
  else
  {
    v6 = 0;
  }
  v7 = a3;
  swift_retain();
  sub_1A5F567F0((uint64_t)v7, v5, v6);
  sub_1A5ED0004((uint64_t)v5);

  swift_release();
}

@end
