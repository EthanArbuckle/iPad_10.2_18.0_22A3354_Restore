@implementation ActivityAwardsQueryListener

- (void)achievementStore:(id)a3 didUpdateAchievements:(id)a4
{
  sub_1D2A9BBD8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, "[ActivityAwardsQueryListener] ActivityAwardsQueryListener.achievementStore(_:didUpdate:) %ld achievements", (uint64_t)&unk_1E941F008, (uint64_t)&unk_1EFC9B0A0);
}

- (_TtC22ActivityAwardsServices27ActivityAwardsQueryListener)init
{
  _TtC22ActivityAwardsServices27ActivityAwardsQueryListener *result;

  result = (_TtC22ActivityAwardsServices27ActivityAwardsQueryListener *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22ActivityAwardsServices27ActivityAwardsQueryListener_endpoint));
  swift_unknownObjectRelease();
}

- (void)achievementStore:(id)a3 didAddAchievements:(id)a4
{
  sub_1D2A9BBD8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, "[ActivityAwardsQueryListener] ActivityAwardsQueryListener.achievementStore(_:didAdd:) %ld achievements", (uint64_t)&unk_1E941F030, (uint64_t)&unk_1EFC9B0B0);
}

- (void)achievementStore:(id)a3 didRemoveAchievements:(id)a4
{
  sub_1D2A9BBD8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, "[ActivityAwardsQueryListener] ActivityAwardsQueryListener.achievementStore(_:didRemove:) %ld achievements", (uint64_t)&unk_1E941EFE0, (uint64_t)&unk_1EFC9B088);
}

@end
