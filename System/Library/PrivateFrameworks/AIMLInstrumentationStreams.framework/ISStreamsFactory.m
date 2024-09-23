@implementation ISStreamsFactory

+ (void)constructWithFilter:(ISEventFilter *)a3 startTime:(double)a4 endTime:(double)a5 maxEvents:(int64_t)a6 lastN:(int64_t)a7 completionHandler:(id)a8
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  ISEventFilter *v24;
  uint64_t v25;

  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553A8430);
  MEMORY[0x24BDAC7A8](v15, v16);
  v18 = (char *)&v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = _Block_copy(a8);
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = a3;
  *(double *)(v20 + 24) = a4;
  *(double *)(v20 + 32) = a5;
  *(_QWORD *)(v20 + 40) = a6;
  *(_QWORD *)(v20 + 48) = a7;
  *(_QWORD *)(v20 + 56) = v19;
  *(_QWORD *)(v20 + 64) = a1;
  v21 = sub_21DC71C3C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v18, 1, 1, v21);
  v22 = (_QWORD *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_2553A8CA8;
  v22[5] = v20;
  v23 = (_QWORD *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_2553A8CB0;
  v23[5] = v22;
  v24 = a3;
  sub_21DC23A8C((uint64_t)v18, (uint64_t)&unk_2553A8CB8, (uint64_t)v23);
  swift_release();
}

+ (void)constructWithFilter:(ISEventFilter *)a3 startTime:(double)a4 endTime:(double)a5 maxEvents:(int64_t)a6 lastN:(int64_t)a7 storageURL:(NSURL *)a8 completionHandler:(id)a9
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  ISEventFilter *v26;
  NSURL *v27;
  uint64_t v28;

  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553A8430);
  MEMORY[0x24BDAC7A8](v17, v18);
  v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = _Block_copy(a9);
  v22 = swift_allocObject();
  *(_QWORD *)(v22 + 16) = a3;
  *(double *)(v22 + 24) = a4;
  *(double *)(v22 + 32) = a5;
  *(_QWORD *)(v22 + 40) = a6;
  *(_QWORD *)(v22 + 48) = a7;
  *(_QWORD *)(v22 + 56) = a8;
  *(_QWORD *)(v22 + 64) = v21;
  *(_QWORD *)(v22 + 72) = a1;
  v23 = sub_21DC71C3C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v20, 1, 1, v23);
  v24 = (_QWORD *)swift_allocObject();
  v24[2] = 0;
  v24[3] = 0;
  v24[4] = &unk_2553A8C88;
  v24[5] = v22;
  v25 = (_QWORD *)swift_allocObject();
  v25[2] = 0;
  v25[3] = 0;
  v25[4] = &unk_2553A8C90;
  v25[5] = v24;
  v26 = a3;
  v27 = a8;
  sub_21DC23A8C((uint64_t)v20, (uint64_t)&unk_2553A8C98, (uint64_t)v25);
  swift_release();
}

+ (void)constructWithFilter:(ISEventFilter *)a3 startTimeRelativeToNow:(double)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  ISEventFilter *v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553A8430);
  MEMORY[0x24BDAC7A8](v9, v10);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = a3;
  *(double *)(v14 + 24) = a4;
  *(_QWORD *)(v14 + 32) = v13;
  *(_QWORD *)(v14 + 40) = a1;
  v15 = sub_21DC71C3C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_2553A8C68;
  v16[5] = v14;
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_2553A8C70;
  v17[5] = v16;
  v18 = a3;
  sub_21DC23A8C((uint64_t)v12, (uint64_t)&unk_2553A8C78, (uint64_t)v17);
  swift_release();
}

+ (void)constructWithFilter:(ISEventFilter *)a3 startTimeRelativeToNow:(double)a4 storageURL:(NSURL *)a5 completionHandler:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  ISEventFilter *v20;
  NSURL *v21;
  uint64_t v22;

  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553A8430);
  MEMORY[0x24BDAC7A8](v11, v12);
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = _Block_copy(a6);
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = a3;
  *(double *)(v16 + 24) = a4;
  *(_QWORD *)(v16 + 32) = a5;
  *(_QWORD *)(v16 + 40) = v15;
  *(_QWORD *)(v16 + 48) = a1;
  v17 = sub_21DC71C3C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v14, 1, 1, v17);
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_2553A8C38;
  v18[5] = v16;
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_2553A8448;
  v19[5] = v18;
  v20 = a3;
  v21 = a5;
  sub_21DC23A8C((uint64_t)v14, (uint64_t)&unk_2553A8450, (uint64_t)v19);
  swift_release();
}

- (ISStreamsFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for InstrumentationStreamsFactoryBridge();
  return -[ISStreamsFactory init](&v3, sel_init);
}

@end
