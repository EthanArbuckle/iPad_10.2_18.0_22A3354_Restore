@implementation AAUIRecoveryContactsViewFactory

+ (id)createWithViewModel:(id)a3
{
  id v3;
  id v6;

  swift_getObjCClassMetadata();
  v3 = a3;
  swift_getObjCClassMetadata();
  v6 = sub_1DB56F240(a3);

  return v6;
}

+ (id)createViewModelWithAccountManager:(id)a3
{
  id v3;
  id v6;

  swift_getObjCClassMetadata();
  v3 = a3;
  swift_getObjCClassMetadata();
  v6 = sub_1DB56F810(a3);

  return v6;
}

- (AAUIRecoveryContactsViewFactory)init
{
  return (AAUIRecoveryContactsViewFactory *)RecoveryContactsViewFactory.init()();
}

@end
