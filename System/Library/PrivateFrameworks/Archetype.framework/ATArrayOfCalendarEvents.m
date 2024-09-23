@implementation ATArrayOfCalendarEvents

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_256432AA1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_256432AA1 = a3;
}

- (_TtC9Archetype23ATArrayOfCalendarEvents)initWithCalendarEvents:(id)a3
{
  return (_TtC9Archetype23ATArrayOfCalendarEvents *)sub_236A467A4((char *)self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))type metadata accessor for ATCalendarEvent, &OBJC_IVAR____TtC9Archetype23ATArrayOfCalendarEvents_calendarEvents, type metadata accessor for ATArrayOfCalendarEvents);
}

- (id)copyWithZone:(void *)a3
{
  return sub_236A468A8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC9Archetype23ATArrayOfCalendarEvents_calendarEvents, type metadata accessor for ATArrayOfCalendarEvents);
}

- (void)encodeWithCoder:(id)a3
{
  sub_236A469E8(self, (uint64_t)a2, a3, (uint64_t)&OBJC_IVAR____TtC9Archetype23ATArrayOfCalendarEvents_calendarEvents, (void (*)(void))type metadata accessor for ATCalendarEvent);
}

- (_TtC9Archetype23ATArrayOfCalendarEvents)initWithCoder:(id)a3
{
  return (_TtC9Archetype23ATArrayOfCalendarEvents *)sub_236A46C94(self, (uint64_t)a2, a3, (void (*)(void))type metadata accessor for ATCalendarEvent, 0x7261646E656C6163, 0xEE0073746E657645, (SEL *)&selRef_initWithCalendarEvents_);
}

- (NSString)description
{
  return (NSString *)sub_236A46D64(self, (uint64_t)a2, (void (*)(void))sub_236A44AD0);
}

- (_TtC9Archetype23ATArrayOfCalendarEvents)init
{
  _TtC9Archetype23ATArrayOfCalendarEvents *result;

  result = (_TtC9Archetype23ATArrayOfCalendarEvents *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
