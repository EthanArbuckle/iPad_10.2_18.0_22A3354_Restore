@implementation AAUILegacyContactsViewFactory

+ (id)createWithViewModel:(id)a3
{
  id v3;
  id v6;

  swift_getObjCClassMetadata();
  v3 = a3;
  swift_getObjCClassMetadata();
  v6 = sub_1DB60B73C(a3);

  return v6;
}

+ (id)createViewModelWithAccountManager:(id)a3
{
  id v3;
  id v6;

  swift_getObjCClassMetadata();
  v3 = a3;
  swift_getObjCClassMetadata();
  v6 = sub_1DB60BD0C(a3);

  return v6;
}

+ (id)createViewModelWithAccountManager:(id)a3 highlightRowIdentifier:(id)a4
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  id v12;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = a4;
  v8 = sub_1DB62FCE0();
  v9 = v6;
  swift_getObjCClassMetadata();
  v12 = sub_1DB60C134(a3, v8, v9);
  swift_bridgeObjectRelease();

  return v12;
}

- (AAUILegacyContactsViewFactory)init
{
  return (AAUILegacyContactsViewFactory *)LegacyContactsViewFactory.init()();
}

@end
