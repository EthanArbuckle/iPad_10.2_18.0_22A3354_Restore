@implementation PushNotificationDataManager

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC7NewsUI227PushNotificationDataManager *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI227PushNotificationDataManager_userInfo);
  v5 = self;
  objc_msgSend(v4, sel_removeObserver_, v5);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  -[PushNotificationDataManager dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI227PushNotificationDataManager_pushNotificationService);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7NewsUI227PushNotificationDataManager_subscriptionController));
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtC7NewsUI227PushNotificationDataManager)init
{
  _TtC7NewsUI227PushNotificationDataManager *result;

  result = (_TtC7NewsUI227PushNotificationDataManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)userInfoDidChangeSportsTopicNotificationsEnabledState:(id)a3 fromCloud:(BOOL)a4
{
  id v6;
  _TtC7NewsUI227PushNotificationDataManager *v7;

  v6 = a3;
  v7 = self;
  PushNotificationDataManager.userInfoDidChangeSportsTopicNotificationsEnabledState(_:fromCloud:)(v6, a4);

}

@end
