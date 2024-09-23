@implementation AAUIIdentityViewFactory

+ (id)createIdentityCardFromContact:(id)a3 buttonAction:(id)a4
{
  id v4;
  void *v7;
  _QWORD *v8;
  id v10;

  swift_getObjCClassMetadata();
  v4 = a3;
  v7 = _Block_copy(a4);
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = v7;
  swift_getObjCClassMetadata();
  v10 = static IdentityViewFactory.createIdentityCard(contact:buttonAction:)(a3, sub_1DB5DF404, v8);
  swift_release();

  return v10;
}

+ (id)createAppleAccountHeaderViewFromContact:(id)a3 account:(id)a4 showAccountDetails:(BOOL)a5 showEditButton:(BOOL)a6
{
  id v6;
  id v7;
  char v9;
  char v10;
  id v13;

  swift_getObjCClassMetadata();
  v6 = a3;
  v7 = a4;
  v9 = sub_1DB62EFFC();
  v10 = sub_1DB62EFFC();
  swift_getObjCClassMetadata();
  v13 = static IdentityViewFactory.createAppleAccountHeaderView(contact:account:showAccountDetails:showEditButton:)(a3, a4, v9 & 1, v10 & 1);

  return v13;
}

+ (id)createEditableAppleAccountHeaderView:(id)a3 account:(id)a4 showAccountDetails:(BOOL)a5 showEditButton:(BOOL)a6
{
  id v6;
  id v7;
  char v9;
  char v10;
  void *v13;

  swift_getObjCClassMetadata();
  v6 = a3;
  v7 = a4;
  v9 = sub_1DB62EFFC();
  v10 = sub_1DB62EFFC();
  swift_getObjCClassMetadata();
  v13 = (void *)static IdentityViewFactory.createEditableAppleAccountHeaderView(contact:account:showAccountDetails:showEditButton:)(a3, a4, v9 & 1, v10 & 1);

  return v13;
}

- (AAUIIdentityViewFactory)init
{
  return (AAUIIdentityViewFactory *)IdentityViewFactory.init()();
}

@end
