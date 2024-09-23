@implementation CPActivityAuthorizationManager

- (TUNeighborhoodActivityConduit)neighborhoodActivityConduit
{
  CPActivityAuthorizationManager *v2;
  id v3;

  v2 = self;
  v3 = ActivityAuthorizationManager.neighborhoodActivityConduit.getter();

  return (TUNeighborhoodActivityConduit *)v3;
}

- (void)setNeighborhoodActivityConduit:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___CPActivityAuthorizationManager____lazy_storage___neighborhoodActivityConduit);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___CPActivityAuthorizationManager____lazy_storage___neighborhoodActivityConduit) = (Class)a3;
  v3 = a3;

}

- (CPActivityAuthorizationManager)initWithDataSource:(id)a3 queue:(id)a4 appPolicyManager:(id)a5
{
  objc_class *ObjectType;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  CPActivityAuthorizationManager *v18;

  ObjectType = (objc_class *)swift_getObjectType();
  v9 = one-time initialization token for shared;
  swift_unknownObjectRetain();
  v10 = a4;
  v11 = a5;
  if (v9 != -1)
    swift_once();
  swift_beginAccess();
  v12 = one-time initialization token for shared;
  v13 = (id)static IMUserNotificationCenter.shared;
  if (v12 != -1)
    swift_once();
  v14 = (void *)static CPAudioRoutePolicyManager.shared;
  v15 = objc_allocWithZone((Class)CPFeatureFlags);
  v16 = v14;
  v17 = objc_msgSend(v15, sel_init);
  v18 = (CPActivityAuthorizationManager *)specialized ActivityAuthorizationManager.init(dataSource:notificationCenter:queue:appPolicyManager:audioRoutePolicyManager:featureFlags:)(a3, (uint64_t)v13, v10, v11, v16, v17, (char *)objc_allocWithZone(ObjectType));
  swift_unknownObjectRelease();

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v18;
}

- (CPActivityAuthorizationManager)initWithDataSource:(id)a3 queue:(id)a4
{
  objc_class *ObjectType;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  CPActivityAuthorizationManager *v17;

  ObjectType = (objc_class *)swift_getObjectType();
  v7 = one-time initialization token for shared;
  swift_unknownObjectRetain();
  v8 = a4;
  if (v7 != -1)
    swift_once();
  swift_beginAccess();
  v9 = one-time initialization token for shared;
  v10 = (id)static IMUserNotificationCenter.shared;
  if (v9 != -1)
    swift_once();
  v11 = one-time initialization token for shared;
  v12 = (id)static CPApplicationPolicyManager.shared;
  if (v11 != -1)
    swift_once();
  v13 = (void *)static CPAudioRoutePolicyManager.shared;
  v14 = objc_allocWithZone((Class)CPFeatureFlags);
  v15 = v13;
  v16 = objc_msgSend(v14, sel_init);
  v17 = (CPActivityAuthorizationManager *)specialized ActivityAuthorizationManager.init(dataSource:notificationCenter:queue:appPolicyManager:audioRoutePolicyManager:featureFlags:)(a3, (uint64_t)v10, v8, v12, v15, v16, (char *)objc_allocWithZone(ObjectType));
  swift_unknownObjectRelease();

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v17;
}

- (void)requestAuthorizationForApplicationWithBundleIdentifier:(id)a3 preparing:(BOOL)a4 overrides:(id)a5 currentScreenShareAttributes:(id)a6 completionHandler:(id)a7
{
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  CPActivityAuthorizationManager *v16;

  v11 = _Block_copy(a7);
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v14 = v13;
  _Block_copy(v11);
  v15 = a5;
  swift_unknownObjectRetain();
  v16 = self;
  specialized ActivityAuthorizationManager.requestAuthorizationForApplication(withBundleIdentifier:preparing:overrides:currentScreenShareAttributes:completionHandler:)(v12, v14, a4, a5, (uint64_t)a6, v16, (void (**)(_QWORD, _QWORD, _QWORD))v11);
  _Block_release(v11);
  _Block_release(v11);

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)requestAuthorizationForApplicationLaunchWithActivity:(id)a3 completionHandler:(id)a4
{
  void *v6;
  id v7;
  CPActivityAuthorizationManager *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  specialized ActivityAuthorizationManager.requestAuthorizationForApplicationLaunch(withActivity:completionHandler:)(v7, (uint64_t)v8, (void (**)(_QWORD, _QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

}

+ (id)notificationDisplayInformationForAudioPolicyManager:(id)a3 activity:(id)a4 conversation:(id)a5
{
  id v8;
  id v9;
  Class isa;

  swift_unknownObjectRetain();
  v8 = a4;
  v9 = a5;
  specialized static ActivityAuthorizationManager.notificationDisplayInformation(audioRoutePolicyManager:activity:conversation:)(a3, v8, v9);
  swift_unknownObjectRelease();

  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (void)setAuthorization:(BOOL)a3 forBundleIdentifier:(id)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  CPActivityAuthorizationManager *v9;
  Swift::String v10;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = v7;
  v9 = self;
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  ActivityAuthorizationManager.setAuthorization(_:for:)(a3, v10);

  swift_bridgeObjectRelease();
}

- (CPActivityAuthorizationManager)init
{
  CPActivityAuthorizationManager *result;

  result = (CPActivityAuthorizationManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined destroy of weak ActivitySessionManagerProtocol?((uint64_t)self + OBJC_IVAR___CPActivityAuthorizationManager_dataSource);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR___CPActivityAuthorizationManager_notificationCenter);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___CPActivityAuthorizationManager____lazy_storage___neighborhoodActivityConduit));

  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)conversationManager:(id)a3 conversationChanged:(id)a4
{
  id v6;
  CPActivityAuthorizationManager *v7;

  swift_unknownObjectRetain();
  v6 = a4;
  v7 = self;
  specialized ActivityAuthorizationManager.conversationManager(_:conversationChanged:)(v6);
  swift_unknownObjectRelease();

}

@end
