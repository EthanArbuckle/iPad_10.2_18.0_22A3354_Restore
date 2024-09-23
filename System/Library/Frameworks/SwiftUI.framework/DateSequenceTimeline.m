@implementation DateSequenceTimeline

- (id)unconfiguredEntriesForDateInterval:(id)a3 previousEntry:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _TtC7SwiftUI20DateSequenceTimeline *v11;
  id v12;
  uint64_t v13;
  Class isa;
  uint64_t v16;

  v6 = type metadata accessor for DateInterval();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static DateInterval._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = self;
  v12 = a4;
  v13 = specialized DateSequenceTimeline.unconfiguredEntries(for:previousEntry:)();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  if (!v13)
    return 0;
  type metadata accessor for BLSAlwaysOnTimelineUnconfiguredEntry();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (int64_t)requestedFidelityForStartEntryInDateInterval:(id)a3 withPreviousEntry:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  _TtC7SwiftUI20DateSequenceTimeline *v12;
  int64_t v13;
  uint64_t v15;

  v6 = type metadata accessor for DateInterval();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (uint64_t *)((char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  static DateInterval._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = a4;
  v12 = self;
  v13 = DateSequenceTimeline.requestedFidelityForStartEntry(in:withPreviousEntry:)(v10, a4);

  (*(void (**)(_QWORD *, uint64_t))(v7 + 8))(v10, v6);
  return v13;
}

- (_TtC7SwiftUI20DateSequenceTimeline)initWithIdentifier:(id)a3 configure:(id)a4
{
  _TtC7SwiftUI20DateSequenceTimeline *result;

  _Block_copy(a4);
  swift_unknownObjectRetain();
  result = (_TtC7SwiftUI20DateSequenceTimeline *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7SwiftUI20DateSequenceTimeline_schedule);
}

@end
