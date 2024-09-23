@implementation ATCalendarEvent

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_256432AA0;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_256432AA0 = a3;
}

- (_TtC9Archetype15ATCalendarEvent)initWithEventTitle:(id)a3
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  objc_super v8;

  v4 = sub_236A48E98();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC9Archetype15ATCalendarEvent_eventTitle);
  *v5 = v4;
  v5[1] = v6;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ATCalendarEvent();
  return -[ATCalendarEvent init](&v8, sel_init);
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v3;
  uint64_t v4;
  objc_class *v5;
  char *v6;
  char *v7;
  objc_super v9;

  v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9Archetype15ATCalendarEvent_eventTitle);
  v3 = *(_QWORD *)&self->eventTitle[OBJC_IVAR____TtC9Archetype15ATCalendarEvent_eventTitle];
  v5 = (objc_class *)type metadata accessor for ATCalendarEvent();
  v6 = (char *)objc_allocWithZone(v5);
  v7 = &v6[OBJC_IVAR____TtC9Archetype15ATCalendarEvent_eventTitle];
  *(_QWORD *)v7 = v4;
  *((_QWORD *)v7 + 1) = v3;
  v9.receiver = v6;
  v9.super_class = v5;
  swift_bridgeObjectRetain();
  return -[ATCalendarEvent init](&v9, sel_init);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC9Archetype15ATCalendarEvent *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_236A48E80();
  v7 = (id)sub_236A48E80();
  objc_msgSend(v4, sel_encodeObject_forKey_, v6, v7);

}

- (_TtC9Archetype15ATCalendarEvent)initWithCoder:(id)a3
{
  return (_TtC9Archetype15ATCalendarEvent *)ATCalendarEvent.init(coder:)(a3);
}

- (NSString)description
{
  return (NSString *)sub_236A46D64(self, (uint64_t)a2, (void (*)(void))sub_236A446D4);
}

- (_TtC9Archetype15ATCalendarEvent)init
{
  _TtC9Archetype15ATCalendarEvent *result;

  result = (_TtC9Archetype15ATCalendarEvent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
