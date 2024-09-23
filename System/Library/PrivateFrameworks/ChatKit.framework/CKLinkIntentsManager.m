@implementation CKLinkIntentsManager

- (CKLinkIntentsManager)init
{
  objc_super v4;

  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for LinkIntentsManager();
  return -[CKLinkIntentsManager init](&v4, sel_init);
}

+ (CKLinkIntentsManager)sharedManager
{
  if (qword_1EE0F4680 != -1)
    swift_once();
  return (CKLinkIntentsManager *)(id)qword_1EE0F4950;
}

- (void)registerMessagesNavigator:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (void)registerChatController:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (void)registerDependencyWithDetailsController:(id)a3
{
  id v5;
  CKLinkIntentsManager *v6;
  id v7;
  _BYTE v8[40];

  sub_18E765D08();
  v5 = a3;
  v6 = self;
  sub_18E765CFC();
  sub_18E7691F4();
  *(_QWORD *)(swift_allocObject() + 16) = v5;
  sub_18E755550();
  v7 = v5;
  sub_18E765CF0();
  swift_release();
  swift_release();
  sub_18E75558C((uint64_t)v8);

}

- (void)purgeDependencies
{
  CKLinkIntentsManager *v3;
  _BYTE v4[40];

  sub_18E765D08();
  v3 = self;
  sub_18E765CFC();
  sub_18E7691F4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE0F4738);
  sub_18E765CF0();
  swift_release();
  sub_18E75558C((uint64_t)v4);

}

- (void).cxx_destruct
{
  sub_18E522F74((uint64_t)self + OBJC_IVAR___CKLinkIntentsManager_messagesNavigator);
  swift_unknownObjectWeakDestroy();
}

@end
