@implementation ICAudioRecordingManager

+ (ICAttachment)currentAttachment
{
  if (qword_1ED23AD88 != -1)
    swift_once();
  return (ICAttachment *)AudioRecordingCoordinator.currentAttachment.getter();
}

+ (void)cancelCurrentAudioRecordingSessionWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED23A600);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = a1;
  v10 = sub_1BDBFDBC0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EF50F3A8;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EF50EF98;
  v12[5] = v11;
  sub_1BDBA8D44((uint64_t)v7, (uint64_t)&unk_1EF50EFA0, (uint64_t)v12);
  swift_release();
}

- (ICAudioRecordingManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[ICAudioRecordingManager init](&v3, sel_init);
}

@end
