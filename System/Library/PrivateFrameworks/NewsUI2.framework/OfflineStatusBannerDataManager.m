@implementation OfflineStatusBannerDataManager

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC7NewsUI230OfflineStatusBannerDataManager *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC7NewsUI230OfflineStatusBannerDataManager_bundleSubscriptionManager);
  v5 = self;
  objc_msgSend(v4, sel_removeObserver_, v5);
  objc_msgSend(*(id *)((char *)&v5->super.isa + OBJC_IVAR____TtC7NewsUI230OfflineStatusBannerDataManager_appConfigManager), sel_removeAppConfigObserver_, v5);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  -[OfflineStatusBannerDataManager dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI230OfflineStatusBannerDataManager_offlineFeatures);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  v3 = (char *)self + OBJC_IVAR____TtC7NewsUI230OfflineStatusBannerDataManager_feedModeState;
  v4 = sub_1D6E23F78();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (void)triggerAction
{
  _TtC7NewsUI230OfflineStatusBannerDataManager *v2;

  v2 = self;
  MEMORY[0x1D8288AD0]();

}

- (_TtC7NewsUI230OfflineStatusBannerDataManager)init
{
  _TtC7NewsUI230OfflineStatusBannerDataManager *result;

  result = (_TtC7NewsUI230OfflineStatusBannerDataManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)bundleSubscriptionDidSubscribe:(void *)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a1;
  MEMORY[0x1D8288AD0]();

}

- (void)configurationManager:(id)a3 appConfigurationDidChange:(id)a4
{
  _TtC7NewsUI230OfflineStatusBannerDataManager *v5;

  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v5 = self;
  MEMORY[0x1D8288AD0]();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

}

@end
