@implementation AMSPromiseSerialQueue

- (AMSPromiseSerialQueue)init
{
  return (AMSPromiseSerialQueue *)PromiseSerialQueue.init()();
}

- (void)dealloc
{
  AMSPromiseSerialQueue *v2;

  v2 = self;
  PromiseSerialQueue.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();
  v3 = (char *)self + OBJC_IVAR___AMSPromiseSerialQueue_actionContinuation;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECEA9D38);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (id)runBinaryPromiseBlock:(id)a3
{
  return sub_18C979DA0(self, (int)a2, a3, (uint64_t)&unk_1E252B0B0, (uint64_t)sub_18C97A300, (uint64_t (*)(uint64_t, uint64_t))sub_18C97998C);
}

- (id)runPromiseBlock:(id)a3
{
  return sub_18C979DA0(self, (int)a2, a3, (uint64_t)&unk_1E252B088, (uint64_t)sub_18C97A2D8, (uint64_t (*)(uint64_t, uint64_t))sub_18C979BD0);
}

@end
