@implementation ASPasskeyConfigurationSubscriberApplicator

- (_TtC26AuthenticationServicesCore42ASPasskeyConfigurationSubscriberApplicator)init
{
  id v3;
  _TtC26AuthenticationServicesCore42ASPasskeyConfigurationSubscriberApplicator *v4;
  objc_super v6;

  v3 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ASPasskeyConfigurationSubscriberAdapter()), sel_init);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ASPasskeyConfigurationSubscriberApplicator();
  v4 = -[RMConfigurationMultipleApplicator initWithAdapter:inPlaceUpdates:](&v6, sel_initWithAdapter_inPlaceUpdates_, v3, 1);

  return v4;
}

+ (id)supportedConfigurationTypes
{
  void *v2;

  sub_20E6C737C((uint64_t)&unk_24C980458);
  swift_arrayDestroy();
  v2 = (void *)sub_20E6EA3A0();
  swift_bridgeObjectRelease();
  return v2;
}

- (_TtC26AuthenticationServicesCore42ASPasskeyConfigurationSubscriberApplicator)initWithAdapter:(id)a3 inPlaceUpdates:(BOOL)a4
{
  _TtC26AuthenticationServicesCore42ASPasskeyConfigurationSubscriberApplicator *result;

  swift_unknownObjectRetain();
  result = (_TtC26AuthenticationServicesCore42ASPasskeyConfigurationSubscriberApplicator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
