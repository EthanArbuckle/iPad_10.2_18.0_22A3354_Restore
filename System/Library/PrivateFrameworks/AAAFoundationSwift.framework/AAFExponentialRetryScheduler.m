@implementation AAFExponentialRetryScheduler

- (AAFExponentialRetryScheduler)initWithMaxRetries:(int64_t)a3
{
  return -[AAFExponentialRetryScheduler initWithMaxRetries:power:](self, sel_initWithMaxRetries_power_, a3, 2.0);
}

- (AAFExponentialRetryScheduler)initWithMaxRetries:(int64_t)a3 power:(double)a4
{
  id v6;
  AAFExponentialRetryScheduler *v7;
  _OWORD v9[2];
  uint64_t v10;

  v10 = 0;
  memset(v9, 0, sizeof(v9));
  v6 = objc_allocWithZone((Class)swift_getObjectType());
  v7 = (AAFExponentialRetryScheduler *)ExponentialRetryScheduler.init(maxRetries:power:schedulerDelay:)(a3, (uint64_t)v9, a4);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v7;
}

- (void)scheduleTask:(AAFExponentialRetryScheduler *)self shouldRetry:(SEL)a2 completionHandler:(id)a3
{
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  AAFExponentialRetryScheduler *v20;
  uint64_t v21;

  v5 = v4;
  v6 = v3;
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED4FD9D0);
  MEMORY[0x1E0C80A78](v9, v10);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a3);
  v14 = _Block_copy(v6);
  v15 = _Block_copy(v5);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = v13;
  v16[3] = v14;
  v16[4] = v15;
  v16[5] = self;
  v17 = sub_1B408FFCC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v12, 1, 1, v17);
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1EF089AA0;
  v18[5] = v16;
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_1EF089AB0;
  v19[5] = v18;
  v20 = self;
  sub_1B40803C4((uint64_t)v12, (uint64_t)&unk_1EF089AC0, (uint64_t)v19);
  swift_release();
}

- (AAFExponentialRetryScheduler)init
{
  AAFExponentialRetryScheduler *result;

  result = (AAFExponentialRetryScheduler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___AAFExponentialRetryScheduler_schedulerDelay);
}

@end
