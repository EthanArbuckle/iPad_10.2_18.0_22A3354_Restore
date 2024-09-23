@implementation ICModelAvailabilityManager

+ (ICModelAvailabilityManager)sharedInstance
{
  if (qword_1F03FEB88 != -1)
    swift_once();
  swift_beginAccess();
  return (ICModelAvailabilityManager *)(id)qword_1F03FEC50;
}

+ (void)setSharedInstance:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_1F03FEB88;
  v4 = a3;
  if (v3 != -1)
    swift_once();
  swift_beginAccess();
  v5 = (void *)qword_1F03FEC50;
  qword_1F03FEC50 = (uint64_t)v4;

}

- (BOOL)supportsCallTranscription
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  ICModelAvailabilityManager *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v3 = sub_1DDAEB838();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78]();
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICModelAvailabilityManager_callTranscriptionSupportedLocales);
  v8 = self;
  swift_bridgeObjectRetain();
  sub_1DDAEB808();
  v9 = sub_1DDAEB7D8();
  v11 = v10;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  LOBYTE(v6) = sub_1DDADF040(v9, v11, v7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (BOOL)supportsGreymatter
{
  ICModelAvailabilityManager *v2;
  BOOL v4;

  v2 = self;
  sub_1DDAEBA9C();

  return v4;
}

- (BOOL)supportsGeneralASR
{
  uint64_t v2;
  ICModelAvailabilityManager *v3;
  BOOL v4;
  BOOL v6;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___ICModelAvailabilityManager__generalASRAvailable);
  v3 = self;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 20));
  sub_1DDADFAB4((_BYTE *)(v2 + 16), &v6);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 20));
  v4 = v6;

  swift_release();
  return v4;
}

- (void)determineASRAvailability:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  ICModelAvailabilityManager *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03FEC38);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_1DDAEBA18();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1F03FF0A0;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1F03FF0B0;
  v12[5] = v11;
  v13 = self;
  sub_1DDAE0750((uint64_t)v7, (uint64_t)&unk_1F03FF0C0, (uint64_t)v12);
  swift_release();
}

- (ICModelAvailabilityManager)init
{
  return (ICModelAvailabilityManager *)ICModelAvailabilityManager.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_release();
}

@end
