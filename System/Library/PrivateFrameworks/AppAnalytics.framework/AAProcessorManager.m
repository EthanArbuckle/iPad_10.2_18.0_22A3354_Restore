@implementation AAProcessorManager

- (AAProcessorManager)init
{
  AAProcessorManager *result;

  result = (AAProcessorManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

- (void)addEventProcessor:(id)a3
{
  sub_1A5F25D7C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))BridgedProcessorManager.add(eventProcessor:));
}

- (void)removeEventProcessor:(id)a3
{
  sub_1A5F25D7C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))BridgedProcessorManager.remove(eventProcessor:));
}

- (void)resumeBackgroundProcessingForIdentifier:(id)a3 completion:(id)a4
{
  void *v4;

  v4 = _Block_copy(a4);
  _Block_release(v4);
}

- (void)flushWithCallbackQueue:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  AAProcessorManager *v9;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_1A5EBC084;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_1A5ECF738((uint64_t)v8, (uint64_t)v6, v7);
  sub_1A5ED0004((uint64_t)v6);

}

@end
