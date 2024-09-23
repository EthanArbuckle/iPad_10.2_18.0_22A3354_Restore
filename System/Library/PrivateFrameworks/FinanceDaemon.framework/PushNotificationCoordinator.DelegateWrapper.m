@implementation PushNotificationCoordinator.DelegateWrapper

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _TtCC13FinanceDaemon27PushNotificationCoordinatorP33_78F3D932150F9D772EA7172189F2498315DelegateWrapper *v11;

  if (a4)
  {
    v6 = a3;
    v11 = self;
    v7 = a4;
    v8 = sub_1CF5249BC();
    v10 = v9;

    sub_1CF40A04C(v8, v10);
  }
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forInfo:(id)a5
{
  id v8;
  id v9;
  _TtCC13FinanceDaemon27PushNotificationCoordinatorP33_78F3D932150F9D772EA7172189F2498315DelegateWrapper *v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  id v16;
  _TtCC13FinanceDaemon27PushNotificationCoordinatorP33_78F3D932150F9D772EA7172189F2498315DelegateWrapper *v17;

  if (a4)
  {
    v8 = a3;
    v9 = a5;
    v10 = self;
    v11 = a4;
    v12 = sub_1CF5249BC();
    v14 = v13;

  }
  else
  {
    v15 = a3;
    v16 = a5;
    v17 = self;
    v12 = 0;
    v14 = 0xF000000000000000;
  }
  sub_1CF4E44C0(v12, v14, a5);
  sub_1CF46F050(v12, v14);

}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6;
  id v7;
  _TtCC13FinanceDaemon27PushNotificationCoordinatorP33_78F3D932150F9D772EA7172189F2498315DelegateWrapper *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1CF4E4790(a4);

}

- (_TtCC13FinanceDaemon27PushNotificationCoordinatorP33_78F3D932150F9D772EA7172189F2498315DelegateWrapper)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)&self->delegate[OBJC_IVAR____TtCC13FinanceDaemon27PushNotificationCoordinatorP33_78F3D932150F9D772EA7172189F2498315DelegateWrapper_delegate] = 0;
  swift_unknownObjectWeakInit();
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[PushNotificationCoordinator.DelegateWrapper init](&v5, sel_init);
}

- (void).cxx_destruct
{
  sub_1CF4E4A4C((uint64_t)self+ OBJC_IVAR____TtCC13FinanceDaemon27PushNotificationCoordinatorP33_78F3D932150F9D772EA7172189F2498315DelegateWrapper_delegate);
}

@end
