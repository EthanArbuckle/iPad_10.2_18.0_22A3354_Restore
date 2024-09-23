@implementation IMActionCalendar

- (NSString)startTime
{
  return (NSString *)sub_19E325D9C();
}

- (NSString)endTime
{
  return (NSString *)sub_19E325D9C();
}

- (NSString)title
{
  return (NSString *)sub_19E325D9C();
}

- (NSString)calDescription
{
  return (NSString *)sub_19E329DD0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___IMActionCalendar_calDescription);
}

- (NSString)fallbackUrl
{
  return (NSString *)sub_19E329DD0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___IMActionCalendar_fallbackUrl);
}

- (IMActionCalendar)initWithStartTime:(id)a3 endTime:(id)a4 title:(id)a5 calDescription:(id)a6 fallbackUrl:(id)a7
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t *v25;
  id *v26;
  uint64_t *v27;
  objc_super v29;

  v10 = sub_19E36F888();
  v12 = v11;
  v13 = sub_19E36F888();
  v15 = v14;
  v16 = sub_19E36F888();
  v18 = v17;
  if (!a6)
  {
    v20 = 0;
    if (a7)
      goto LABEL_3;
LABEL_5:
    v21 = 0;
    v22 = 0;
    goto LABEL_6;
  }
  a6 = (id)sub_19E36F888();
  v20 = v19;
  if (!a7)
    goto LABEL_5;
LABEL_3:
  v21 = sub_19E36F888();
LABEL_6:
  v23 = (uint64_t *)((char *)self + OBJC_IVAR___IMActionCalendar_startTime);
  *v23 = v10;
  v23[1] = v12;
  v24 = (uint64_t *)((char *)self + OBJC_IVAR___IMActionCalendar_endTime);
  *v24 = v13;
  v24[1] = v15;
  v25 = (uint64_t *)((char *)self + OBJC_IVAR___IMActionCalendar_title);
  *v25 = v16;
  v25[1] = v18;
  v26 = (id *)((char *)&self->super.isa + OBJC_IVAR___IMActionCalendar_calDescription);
  *v26 = a6;
  v26[1] = v20;
  v27 = (uint64_t *)((char *)self + OBJC_IVAR___IMActionCalendar_fallbackUrl);
  *v27 = v21;
  v27[1] = v22;
  v29.receiver = self;
  v29.super_class = (Class)IMActionCalendar;
  return -[IMActionCalendar init](&v29, sel_init);
}

- (IMActionCalendar)initWithDictionary:(id)a3
{
  uint64_t v3;

  v3 = sub_19E36F828();
  return (IMActionCalendar *)IMActionCalendar.init(dictionary:)(v3);
}

- (id)dictionaryRepresentation
{
  IMActionCalendar *v2;
  void *v3;

  v2 = self;
  sub_19E32A374();

  v3 = (void *)sub_19E36F81C();
  swift_bridgeObjectRelease();
  return v3;
}

- (IMActionCalendar)init
{
  IMActionCalendar *result;

  result = (IMActionCalendar *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
