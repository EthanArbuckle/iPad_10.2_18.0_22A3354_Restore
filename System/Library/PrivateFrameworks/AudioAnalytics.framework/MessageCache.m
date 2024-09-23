@implementation MessageCache

- (void)createSessionWith:(int64_t)a3
{
  sub_21DBB967C((uint64_t)self, (uint64_t)a2, a3, (void (*)(uint64_t))sub_21DBB87B0);
}

- (void)getServiceNameFor:(int64_t)a3 completion:(id)a4
{
  _QWORD *v4;
  void (*v5)(_QWORD *, _QWORD, uint64_t);

  v4 = _Block_copy(a4);
  v5 = (void (*)(_QWORD *, _QWORD, uint64_t))v4[2];
  swift_retain();
  v5(v4, 0, 0xFFFFLL);
  _Block_release(v4);
  swift_release();
}

- (void)validateFor:(int64_t)a3 completion:(id)a4
{
  void (**v4)(void *, _QWORD, void *);
  void *v5;

  v4 = (void (**)(void *, _QWORD, void *))_Block_copy(a4);
  swift_retain();
  sub_21DBCC2E0(MEMORY[0x24BEE4AF8]);
  v5 = (void *)sub_21DBD238C();
  v4[2](v4, 0, v5);
  swift_bridgeObjectRelease();

  _Block_release(v4);
  swift_release();
}

- (void)setWithConfiguration:(id)a3 for:(int64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v6 = sub_21DBD23A4();
  v7 = *(_QWORD *)self->caches;
  v8 = *(_QWORD *)(v7 + 16);
  if (v8)
  {
    v9 = (_QWORD *)(v7 + 32);
    swift_retain();
    swift_bridgeObjectRetain();
    do
    {
      __swift_project_boxed_opaque_existential_1(v9, v9[3]);
      sub_21DBCCF14(v6, a4);
      v9 += 5;
      --v8;
    }
    while (v8);
    swift_release();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
}

- (void)setWithServiceType:(unsigned __int16)a3 for:(int64_t)a4
{
  uint64_t v5;

  v5 = a3;
  swift_retain();
  sub_21DBB8C9C(v5, a4);
  swift_release();
}

- (void)startSessionFor:(int64_t)a3
{
  sub_21DBB9378((uint64_t)self, (uint64_t)a2, a3, sub_21DBCC664);
}

- (void)sendWithMessage:(id)a3 with:(unsigned int)a4 and:(unsigned __int16)a5 for:(int64_t)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v10 = sub_21DBD23A4();
  v11 = *(_QWORD *)self->caches;
  v12 = *(_QWORD *)(v11 + 16);
  if (v12)
  {
    v13 = (_QWORD *)(v11 + 32);
    swift_retain();
    swift_bridgeObjectRetain();
    do
    {
      __swift_project_boxed_opaque_existential_1(v13, v13[3]);
      sub_21DBCD1D0(v10, a6, a4, a5);
      v13 += 5;
      --v12;
    }
    while (v12);
    swift_release();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
}

- (void)stopSessionFor:(int64_t)a3
{
  sub_21DBB9378((uint64_t)self, (uint64_t)a2, a3, sub_21DBCC9F8);
}

- (void)destroySessionFor:(int64_t)a3
{
  sub_21DBB967C((uint64_t)self, (uint64_t)a2, a3, (void (*)(uint64_t))sub_21DBB9538);
}

- (void)requestMessageFor:(int64_t)a3 category:(unsigned int)a4 type:(unsigned __int16)a5 reply:(id)a6
{
  void (**v6)(void *, _QWORD, void *);
  void *v7;

  v6 = (void (**)(void *, _QWORD, void *))_Block_copy(a6);
  swift_retain();
  sub_21DBCC2E0(MEMORY[0x24BEE4AF8]);
  v7 = (void *)sub_21DBD238C();
  v6[2](v6, 0, v7);
  swift_bridgeObjectRelease();

  _Block_release(v6);
  swift_release();
}

- (void)getTailspinSessionIDFor:(int64_t)a3 reply:(id)a4
{
  _QWORD *v4;
  void (*v5)(_QWORD *, _QWORD, _QWORD, _QWORD);

  v4 = _Block_copy(a4);
  v5 = (void (*)(_QWORD *, _QWORD, _QWORD, _QWORD))v4[2];
  swift_retain();
  v5(v4, 0, 0, 0);
  _Block_release(v4);
  swift_release();
}

@end
