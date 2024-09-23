@implementation DigitalPresentmentSession

- (_TtC7CoreIDV25DigitalPresentmentSession)init
{
  return (_TtC7CoreIDV25DigitalPresentmentSession *)DigitalPresentmentSession.init()();
}

- (void)checkCanRequestDocument:(DIIdentityDocumentDescriptor *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545D99E0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_20A1A8F1C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2545D9A48;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2545D9A50;
  v14[5] = v13;
  swift_unknownObjectRetain();
  swift_retain();
  sub_20A176094((uint64_t)v9, (uint64_t)a0_4, (uint64_t)v14);
  swift_release();
}

- (void)requestDocument:(DIIdentityRequest *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  DIIdentityRequest *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2545D99E0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_20A1A8F1C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = aT;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2545D9A30;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_20A176094((uint64_t)v9, (uint64_t)aP_1, (uint64_t)v14);
  swift_release();
}

- (void)cancelRequest
{
  swift_retain();
  sub_20A166D18();
  swift_release();
}

@end
