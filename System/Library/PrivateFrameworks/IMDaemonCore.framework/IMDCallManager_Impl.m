@implementation IMDCallManager_Impl

- (IMDCallManager_Impl)initWithServiceSession:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  char *v10;

  v4 = (void *)objc_opt_self();
  v5 = a3;
  v6 = objc_msgSend(v4, sel_sharedInstance);
  v7 = objc_msgSend(v6, sel_conversationManager);

  v8 = objc_msgSend((id)objc_opt_self(), sel_sharedFeatureFlags);
  v9 = objc_allocWithZone((Class)type metadata accessor for CallManager());
  v10 = sub_1D1600304(v5, v7, v8);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (IMDCallManager_Impl *)v10;
}

- (void)dealloc
{
  IMDCallManager_Impl *v3;
  IMDCallManager_Impl *v4;
  objc_super v5;

  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___IMDCallManager_Impl_newChatListenerTask))
  {
    v3 = self;
    swift_retain();
    sub_1D166DCC4();
    swift_release();
  }
  else
  {
    v4 = self;
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CallManager();
  -[IMDCallManager_Impl dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{

  swift_release();
}

- (IMDCallManager_Impl)init
{
  IMDCallManager_Impl *result;

  result = (IMDCallManager_Impl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)conversationManager:(id)a3 addedActiveConversation:(id)a4
{
  id v6;
  id v7;
  IMDCallManager_Impl *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1D160763C(v7, "Received notification that conversation was added: %@", (uint64_t)&unk_1E92303B0, (uint64_t)&unk_1EFC62028);

}

- (void)conversationManager:(id)a3 conversationUpdatedMessagesGroupUUID:(id)a4
{
  id v6;
  id v7;
  IMDCallManager_Impl *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1D160763C(v7, "Received notification that conversation messagesGroupUUID was added: %@", (uint64_t)&unk_1E9230338, (uint64_t)&unk_1EFC61F90);

}

@end
