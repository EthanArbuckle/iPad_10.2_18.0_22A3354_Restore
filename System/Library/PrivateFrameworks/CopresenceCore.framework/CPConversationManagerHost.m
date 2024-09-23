@implementation CPConversationManagerHost

- (CPConversationManagerHost)initWithDataSource:(id)a3
{
  objc_class *ObjectType;
  id v5;
  char *v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v5 = objc_allocWithZone((Class)CPFeatureFlags);
  swift_unknownObjectRetain();
  v6 = specialized ConversationManagerHost.init(dataSource:featureFlags:)((uint64_t)a3, objc_msgSend(v5, sel_init), (char *)objc_allocWithZone(ObjectType));
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (CPConversationManagerHost *)v6;
}

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  CPConversationManagerHost *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CPConversationManagerHost_listener);
  v5 = self;
  objc_msgSend(v4, sel_invalidate);
  objc_msgSend(*(id *)((char *)&v5->super.isa + OBJC_IVAR___CPConversationManagerHost_listenerDeprecated), sel_invalidate);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  -[CPConversationManagerHost dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of UUID?((uint64_t)self + OBJC_IVAR___CPConversationManagerHost____lazy_storage___protectedStorage, (uint64_t *)&demangling cache variable for type metadata for ProtectedStorage?);
}

- (CPConversationManagerHost)init
{
  CPConversationManagerHost *result;

  result = (CPConversationManagerHost *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)conversationManager:(id)a3 conversationChanged:(id)a4
{
  id v7;
  CPConversationManagerHost *v8;

  swift_unknownObjectRetain();
  v7 = a4;
  v8 = self;
  specialized ConversationManagerHost.conversationManager(_:conversationChanged:)((void (*)(_QWORD *, uint64_t, uint64_t))a3);
  swift_unknownObjectRelease();

}

- (void)conversationManager:(id)a3 sharePlayAllowedChanged:(BOOL)a4
{
  _BOOL4 v4;
  CPConversationManagerHost *v6;

  v4 = a4;
  swift_unknownObjectRetain();
  v6 = self;
  specialized ConversationManagerHost.conversationManager(_:sharePlayAllowedChanged:)(v4);
  swift_unknownObjectRelease();

}

- (void)conversationManager:(id)a3 requestedEndpointWithIdentifier:(id)a4 activitySession:(id)a5 completion:(id)a6
{
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  CPConversationManagerHost *v14;

  v8 = _Block_copy(a6);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = v10;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v8;
  swift_unknownObjectRetain();
  v13 = a5;
  v14 = self;
  specialized ConversationManagerHost.conversationManager(_:requestedEndpointWithIdentifier:activitySession:completion:)(v9, v11, v13, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSXPCListenerEndpoint?) -> (), v12);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  CPConversationManagerHost *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = specialized ConversationManagerHost.listener(_:shouldAcceptNewConnection:)(v7);

  return v9 & 1;
}

@end
