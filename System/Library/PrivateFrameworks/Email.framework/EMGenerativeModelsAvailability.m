@implementation EMGenerativeModelsAvailability

+ (BOOL)isAvailable
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t, uint64_t);
  int v11;
  int v12;
  void (*v13)(char *, uint64_t);
  uint64_t v15;

  v2 = sub_1B9A6FEE8();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v15 - v7;
  if (qword_1ED0E5698 != -1)
    swift_once();
  v9 = qword_1ED0E5690 + OBJC_IVAR____TtC5Email30EMGenerativeModelsAvailability_availabilityState;
  swift_beginAccess();
  v10 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v10(v8, v9, v2);
  v10(v6, (uint64_t)v8, v2);
  v11 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v6, v2);
  v12 = *MEMORY[0x1E0D26080];
  v13 = *(void (**)(char *, uint64_t))(v3 + 8);
  if (v11 != *MEMORY[0x1E0D26080])
    v13(v6, v2);
  v13(v8, v2);
  return v11 == v12;
}

+ (BOOL)isRestricted
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t, uint64_t);
  void (*v11)(char *, uint64_t);
  uint64_t v13;

  v2 = sub_1B9A6FEE8();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v13 - v7;
  if (qword_1ED0E5698 != -1)
    swift_once();
  v9 = qword_1ED0E5690 + OBJC_IVAR____TtC5Email30EMGenerativeModelsAvailability_availabilityState;
  swift_beginAccess();
  v10 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v10(v8, v9, v2);
  v10(v6, (uint64_t)v8, v2);
  LOBYTE(v9) = (*(unsigned int (**)(char *, uint64_t))(v3 + 88))(v6, v2) == *MEMORY[0x1E0D25F68];
  v11 = *(void (**)(char *, uint64_t))(v3 + 8);
  v11(v6, v2);
  v11(v8, v2);
  return v9;
}

- (_TtC5Email30EMGenerativeModelsAvailability)init
{
  return (_TtC5Email30EMGenerativeModelsAvailability *)sub_1B9A6BF70();
}

- (void)dealloc
{
  _TtC5Email30EMGenerativeModelsAvailability *v3;
  _TtC5Email30EMGenerativeModelsAvailability *v4;
  objc_super v5;

  if (*(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC5Email30EMGenerativeModelsAvailability_availabilityNotification))
  {
    v3 = self;
    swift_retain();
    sub_1B9A6FF18();
    swift_release();
  }
  else
  {
    v4 = self;
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for EMGenerativeModelsAvailability();
  -[EMGenerativeModelsAvailability dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v3 = (char *)self + OBJC_IVAR____TtC5Email30EMGenerativeModelsAvailability_availability;
  v4 = sub_1B9A6FF3C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC5Email30EMGenerativeModelsAvailability_availabilityState;
  v6 = sub_1B9A6FEE8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_release();
}

@end
