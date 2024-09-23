@implementation DUCalendarEvent

- (BOOL)isAllDay
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC21DocumentUnderstanding15DUCalendarEvent_isAllDay;
  swift_beginAccess();
  return *v2;
}

- (void)setIsAllDay:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC21DocumentUnderstanding15DUCalendarEvent_isAllDay;
  swift_beginAccess();
  *v4 = a3;
}

- (NSDateComponents)startDateComponents
{
  return (NSDateComponents *)@objc DUCalendarEvent.startDateComponents.getter((uint64_t)self, (uint64_t)a2, &demangling cache variable for type metadata for DateComponents?, &OBJC_IVAR____TtC21DocumentUnderstanding15DUCalendarEvent_startDateComponents, (uint64_t (*)(_QWORD))MEMORY[0x24BDCBDE0], MEMORY[0x24BDCBCA0]);
}

- (void)setStartDateComponents:(id)a3
{
  @objc DUCalendarEvent.startDateComponents.setter(self, (uint64_t)a2, (uint64_t)a3, &demangling cache variable for type metadata for DateComponents?, (void (*)(uint64_t))MEMORY[0x24BDCBCC0], (uint64_t (*)(_QWORD))MEMORY[0x24BDCBDE0], &OBJC_IVAR____TtC21DocumentUnderstanding15DUCalendarEvent_startDateComponents);
}

- (NSTimeZone)startTimezone
{
  return (NSTimeZone *)@objc DUCalendarEvent.startDateComponents.getter((uint64_t)self, (uint64_t)a2, &demangling cache variable for type metadata for TimeZone?, &OBJC_IVAR____TtC21DocumentUnderstanding15DUCalendarEvent_startTimezone, (uint64_t (*)(_QWORD))MEMORY[0x24BDCF510], MEMORY[0x24BDCF4D8]);
}

- (void)setStartTimezone:(id)a3
{
  @objc DUCalendarEvent.startDateComponents.setter(self, (uint64_t)a2, (uint64_t)a3, &demangling cache variable for type metadata for TimeZone?, (void (*)(uint64_t))MEMORY[0x24BDCF4F0], (uint64_t (*)(_QWORD))MEMORY[0x24BDCF510], &OBJC_IVAR____TtC21DocumentUnderstanding15DUCalendarEvent_startTimezone);
}

- (NSDateComponents)endDateComponents
{
  return (NSDateComponents *)@objc DUCalendarEvent.startDateComponents.getter((uint64_t)self, (uint64_t)a2, &demangling cache variable for type metadata for DateComponents?, &OBJC_IVAR____TtC21DocumentUnderstanding15DUCalendarEvent_endDateComponents, (uint64_t (*)(_QWORD))MEMORY[0x24BDCBDE0], MEMORY[0x24BDCBCA0]);
}

- (void)setEndDateComponents:(id)a3
{
  @objc DUCalendarEvent.startDateComponents.setter(self, (uint64_t)a2, (uint64_t)a3, &demangling cache variable for type metadata for DateComponents?, (void (*)(uint64_t))MEMORY[0x24BDCBCC0], (uint64_t (*)(_QWORD))MEMORY[0x24BDCBDE0], &OBJC_IVAR____TtC21DocumentUnderstanding15DUCalendarEvent_endDateComponents);
}

- (NSTimeZone)endTimezone
{
  return (NSTimeZone *)@objc DUCalendarEvent.startDateComponents.getter((uint64_t)self, (uint64_t)a2, &demangling cache variable for type metadata for TimeZone?, &OBJC_IVAR____TtC21DocumentUnderstanding15DUCalendarEvent_endTimezone, (uint64_t (*)(_QWORD))MEMORY[0x24BDCF510], MEMORY[0x24BDCF4D8]);
}

- (void)setEndTimezone:(id)a3
{
  @objc DUCalendarEvent.startDateComponents.setter(self, (uint64_t)a2, (uint64_t)a3, &demangling cache variable for type metadata for TimeZone?, (void (*)(uint64_t))MEMORY[0x24BDCF4F0], (uint64_t (*)(_QWORD))MEMORY[0x24BDCF510], &OBJC_IVAR____TtC21DocumentUnderstanding15DUCalendarEvent_endTimezone);
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void (*v7)(void);
  _TtC21DocumentUnderstanding15DUCalendarEvent *v8;
  char *v9;
  _QWORD v11[2];

  v4 = type metadata accessor for DocumentUnderstanding_ClientInterface_CalendarEvent(0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(void (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.isa) + 0xF8);
  v8 = self;
  v7();
  v9 = specialized DUCalendarEvent.__allocating_init<A>(proto:)((uint64_t)v6);

  v11[1] = v9;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DUCalendarEvent?);
  return (id)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  _TtC21DocumentUnderstanding15DUCalendarEvent *v6;
  void *v7;
  id v8;
  uint64_t v9;

  type metadata accessor for DUCalendarEvent();
  lazy protocol witness table accessor for type DUCategoryResult and conformance DUCategoryResult(&lazy protocol witness table cache variable for type DUCalendarEvent and conformance DUCalendarEvent, 255, (uint64_t (*)(uint64_t))type metadata accessor for DUCalendarEvent, (uint64_t)&protocol conformance descriptor for DUCalendarEvent);
  v5 = a3;
  v6 = self;
  v7 = (void *)DUProtobufEncodableProtocol.serializedData()();
  if (v7)
  {
    v8 = v7;
    v9 = MEMORY[0x22E2AF8EC](0xD000000000000016, 0x80000002284DABA0);
    objc_msgSend(v5, sel_encodeObject_forKey_, v8, v9);

    v5 = v8;
    v6 = (_TtC21DocumentUnderstanding15DUCalendarEvent *)v9;
  }

}

- (_TtC21DocumentUnderstanding15DUCalendarEvent)initWithCoder:(id)a3
{
  return (_TtC21DocumentUnderstanding15DUCalendarEvent *)DUCalendarEvent.init(coder:)(a3);
}

- (_TtC21DocumentUnderstanding15DUCalendarEvent)init
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t, uint64_t, uint64_t);
  char *v6;
  uint64_t v7;
  void (*v8)(char *, uint64_t, uint64_t, uint64_t);
  objc_super v10;

  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC21DocumentUnderstanding15DUCalendarEvent_isAllDay) = 0;
  v3 = (char *)self + OBJC_IVAR____TtC21DocumentUnderstanding15DUCalendarEvent_startDateComponents;
  v4 = type metadata accessor for DateComponents();
  v5 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56);
  v5(v3, 1, 1, v4);
  v6 = (char *)self + OBJC_IVAR____TtC21DocumentUnderstanding15DUCalendarEvent_startTimezone;
  v7 = type metadata accessor for TimeZone();
  v8 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56);
  v8(v6, 1, 1, v7);
  v5((char *)self + OBJC_IVAR____TtC21DocumentUnderstanding15DUCalendarEvent_endDateComponents, 1, 1, v4);
  v8((char *)self + OBJC_IVAR____TtC21DocumentUnderstanding15DUCalendarEvent_endTimezone, 1, 1, v7);
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for DUCalendarEvent();
  return -[DUCalendarEvent init](&v10, sel_init);
}

- (void).cxx_destruct
{
  outlined destroy of DocumentUnderstanding_ClientInterface_CalendarEvent?((uint64_t)self + OBJC_IVAR____TtC21DocumentUnderstanding15DUCalendarEvent_startDateComponents, &demangling cache variable for type metadata for DateComponents?);
  outlined destroy of DocumentUnderstanding_ClientInterface_CalendarEvent?((uint64_t)self + OBJC_IVAR____TtC21DocumentUnderstanding15DUCalendarEvent_startTimezone, &demangling cache variable for type metadata for TimeZone?);
  outlined destroy of DocumentUnderstanding_ClientInterface_CalendarEvent?((uint64_t)self + OBJC_IVAR____TtC21DocumentUnderstanding15DUCalendarEvent_endDateComponents, &demangling cache variable for type metadata for DateComponents?);
  outlined destroy of DocumentUnderstanding_ClientInterface_CalendarEvent?((uint64_t)self + OBJC_IVAR____TtC21DocumentUnderstanding15DUCalendarEvent_endTimezone, &demangling cache variable for type metadata for TimeZone?);
}

@end
