@implementation ATXDateRelevantContext

- (NSDate)startDate
{
  return (NSDate *)(id)sub_1C9E45784();
}

- (NSDate)endDate
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED84F028);
  MEMORY[0x1E0C80A78](v3, v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C9DEA354((uint64_t)self + OBJC_IVAR___ATXDateRelevantContext_endDate, (uint64_t)v6);
  v7 = sub_1C9E457CC();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
  {
    v9 = (void *)sub_1C9E45784();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
  }
  return (NSDate *)v9;
}

- (ATXDateRelevantContext)initWithStartDate:(id)a3 endDate:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  objc_class *v16;
  ATXDateRelevantContext *v17;
  objc_super v19;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED84F028);
  MEMORY[0x1E0C80A78](v6, v7);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1C9E457CC();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10, v12);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C9E457A8();
  if (a4)
  {
    sub_1C9E457A8();
    v15 = 0;
  }
  else
  {
    v15 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, v15, 1, v10);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))((char *)self + OBJC_IVAR___ATXDateRelevantContext_startDate, v14, v10);
  sub_1C9DEA354((uint64_t)v9, (uint64_t)self + OBJC_IVAR___ATXDateRelevantContext_endDate);
  v16 = (objc_class *)type metadata accessor for DateRelevantContext();
  v19.receiver = self;
  v19.super_class = v16;
  v17 = -[ATXDateRelevantContext init](&v19, sel_init);
  sub_1C9DFD8C8((uint64_t)v9);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  return v17;
}

- (ATXDateRelevantContext)init
{
  ATXDateRelevantContext *result;

  result = (ATXDateRelevantContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___ATXDateRelevantContext_startDate;
  v4 = sub_1C9E457CC();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_1C9DFD8C8((uint64_t)self + OBJC_IVAR___ATXDateRelevantContext_endDate);
}

@end
