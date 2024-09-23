@implementation UnifiedTabBadgingManager

- (_TtC19AppStoreKitInternal24UnifiedTabBadgingManager)init
{
  return (_TtC19AppStoreKitInternal24UnifiedTabBadgingManager *)UnifiedTabBadgingManager.init()();
}

- (void)service:(id)a3 didAddBadges:(id)a4
{
  sub_1D891262C(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id, uint64_t))UnifiedTabBadgingManager.service(_:didAddBadges:));
}

- (void)service:(id)a3 didRemoveBadges:(id)a4
{
  sub_1D891262C(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id, uint64_t))UnifiedTabBadgingManager.service(_:didRemoveBadges:));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19AppStoreKitInternal24UnifiedTabBadgingManager_appStoreBadgingService));
  sub_1D83634B4(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC19AppStoreKitInternal24UnifiedTabBadgingManager_rootActionHandler));
}

@end
