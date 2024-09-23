@implementation BundleSubscriptionDetectionManager

- (void)dealloc
{
  objc_class *ObjectType;
  uint64_t v4;
  _TtC16NewsSubscription34BundleSubscriptionDetectionManager *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = qword_1ED5BBF70;
  v5 = self;
  if (v4 != -1)
    swift_once();
  v6 = sub_1BA436AD8();
  __swift_project_value_buffer(v6, (uint64_t)qword_1ED5C85E0);
  v7 = sub_1BA436AC0();
  v8 = sub_1BA437F30();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1BA2EF000, v7, v8, "De-initializing BundleSubscriptionManager!", v9, 2u);
    MEMORY[0x1BCCDC430](v9, -1, -1);
  }

  v10.receiver = v5;
  v10.super_class = ObjectType;
  -[BundleSubscriptionDetectionManager dealloc](&v10, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription34BundleSubscriptionDetectionManager_postPurchaseOnboardingManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription34BundleSubscriptionDetectionManager_router);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16NewsSubscription34BundleSubscriptionDetectionManager_userInfo));
}

- (_TtC16NewsSubscription34BundleSubscriptionDetectionManager)init
{
  _TtC16NewsSubscription34BundleSubscriptionDetectionManager *result;

  result = (_TtC16NewsSubscription34BundleSubscriptionDetectionManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)bundleSubscriptionDidSubscribe:(id)a3 hideBundleDetectionUI:(BOOL)a4
{
  id v6;
  _TtC16NewsSubscription34BundleSubscriptionDetectionManager *v7;

  v6 = a3;
  v7 = self;
  sub_1BA42DFFC(a4);

}

- (void)bundleSubscriptionDidExpire:(id)a3
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  _TtC16NewsSubscription34BundleSubscriptionDetectionManager *v8;

  swift_getObjectType();
  v5 = qword_1EF28B340;
  v6 = a3;
  v8 = self;
  if (v5 != -1)
    swift_once();
  sub_1BA2F2D28(&qword_1EF28F7F8, v7, (uint64_t (*)(uint64_t))type metadata accessor for BundleSubscriptionDetectionManager, (uint64_t)&unk_1BA448C44);
  sub_1BA436244();
  objc_msgSend(*(id *)((char *)&v8->super.isa + OBJC_IVAR____TtC16NewsSubscription34BundleSubscriptionDetectionManager_userInfo), sel_setPostPurchaseOnboardingLastShownDate_, 0);

}

@end
