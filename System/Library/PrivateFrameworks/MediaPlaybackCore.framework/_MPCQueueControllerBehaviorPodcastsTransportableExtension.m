@implementation _MPCQueueControllerBehaviorPodcastsTransportableExtension

- (id)allKnownSessionTypes
{
  _MPCQueueControllerBehaviorPodcastsTransportableExtension *v2;
  void *v3;

  v2 = self;
  sub_210BDC660();

  type metadata accessor for MPPlaybackSessionType(0);
  v3 = (void *)sub_210E92CBC();
  swift_bridgeObjectRelease();
  return v3;
}

- (_MPCQueueControllerBehaviorPodcastsTransportableExtension)init
{
  return (_MPCQueueControllerBehaviorPodcastsTransportableExtension *)QueueControllerBehaviorPodcastsTransportableExtension.init()();
}

+ (NSString)defaultSessionType
{
  return (NSString *)sub_210CEAF6C((uint64_t)a1, (uint64_t)a2, (void (*)(void))static QueueControllerBehaviorPodcastsTransportableExtension.defaultSessionType.getter);
}

+ (NSString)fallbackSessionType
{
  return (NSString *)sub_210CEAF6C((uint64_t)a1, (uint64_t)a2, (void (*)(void))static QueueControllerBehaviorPodcastsTransportableExtension.fallbackSessionType.getter);
}

- (MPCQueueControllerSessionTypesInvalidatable)sessionTypesInvalidatable
{
  return (MPCQueueControllerSessionTypesInvalidatable *)(id)sub_210CEAFC8();
}

- (void)setSessionTypesInvalidatable:(id)a3
{
  _MPCQueueControllerBehaviorPodcastsTransportableExtension *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_210CEB058((uint64_t)a3);

}

- (BOOL)isSupportedSessionType:(id)a3 reason:(id *)a4
{
  id v6;
  _MPCQueueControllerBehaviorPodcastsTransportableExtension *v7;
  char v8;

  v6 = a3;
  v7 = self;
  sub_210CEB10C((uint64_t)v6, a4);
  LOBYTE(a4) = v8;

  return a4 & 1;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end
