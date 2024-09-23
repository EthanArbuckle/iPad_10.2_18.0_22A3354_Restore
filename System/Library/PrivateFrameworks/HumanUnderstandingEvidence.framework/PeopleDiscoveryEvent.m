@implementation PeopleDiscoveryEvent

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  id v9;

  v5 = a3;
  v6 = sub_1C1266584();
  v8 = v7;

  swift_getObjCClassMetadata();
  v9 = static PeopleDiscoveryEvent.event(with:dataVersion:)(v6, v8, a4);
  sub_1C1264870(v6, v8);
  return v9;
}

- (id)serialize
{
  return sub_1C1263D84(self, (uint64_t)a2, (void (*)(void))PeopleDiscoveryEvent.serialize());
}

- (id)json
{
  return sub_1C1263D84(self, (uint64_t)a2, (void (*)(void))PeopleDiscoveryEvent.json());
}

- (_TtC26HumanUnderstandingEvidence20PeopleDiscoveryEvent)init
{
  PeopleDiscoveryEvent.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
