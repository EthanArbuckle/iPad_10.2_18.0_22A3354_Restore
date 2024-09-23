@implementation _MPCQueueControllerBehaviorPodcastsIdentifierComponents

- (NSString)contentItemID
{
  return (NSString *)sub_210D065AC((uint64_t)self, (uint64_t)a2, sub_210D064B4);
}

- (void)setContentItemID:(id)a3
{
  sub_210D06534(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_210D064E8);
}

- (NSString)sectionID
{
  return (NSString *)sub_210D065AC((uint64_t)self, (uint64_t)a2, sub_210D06500);
}

- (void)setSectionID:(id)a3
{
  sub_210D06534(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_210D06594);
}

- (NSString)itemID
{
  return (NSString *)sub_210D065AC((uint64_t)self, (uint64_t)a2, sub_210D065E4);
}

- (void)setItemID:(id)a3
{
  sub_210D06534(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_210D06618);
}

- (BOOL)isPlaceholder
{
  return sub_210D06660() & 1;
}

- (void)setIsPlaceholder:(BOOL)a3
{
  sub_210D06694(a3);
}

- (unsigned)behaviorFlags
{
  return 0;
}

- (_MPCQueueControllerBehaviorPodcastsIdentifierComponents)init
{
  sub_210D067C8();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
