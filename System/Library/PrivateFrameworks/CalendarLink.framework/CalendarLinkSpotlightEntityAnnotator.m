@implementation CalendarLinkSpotlightEntityAnnotator

+ (void)associateEventEntityWithIdentifier:(id)a3 occurrenceDate:(id)a4 with:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540EB940);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_21C9EBDD8();
  v12 = v11;
  if (a4)
  {
    sub_21C9EB6D0();
    v13 = sub_21C9EB6DC();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v9, 0, 1, v13);
  }
  else
  {
    v14 = sub_21C9EB6DC();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v9, 1, 1, v14);
  }
  v15 = a5;
  sub_21C9A79D0(v10, v12, (uint64_t)v9, v15);

  swift_bridgeObjectRelease();
  sub_21C9A7C24((uint64_t)v9);
}

- (CalendarLinkSpotlightEntityAnnotator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CalendarLinkSpotlightEntityAnnotator();
  return -[CalendarLinkSpotlightEntityAnnotator init](&v3, sel_init);
}

@end
