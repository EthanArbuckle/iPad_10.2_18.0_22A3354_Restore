@implementation AAUIReviewCustodianListViewFactory

+ (id)createWithAccountManager:(id)a3 repairHelper:(id)a4
{
  id v4;
  id v5;
  id v9;

  swift_getObjCClassMetadata();
  v4 = a3;
  v5 = a4;
  swift_getObjCClassMetadata();
  v9 = (id)static ReviewCustodianListViewFactory.create(accountManager:repairHelper:)(a3, a4);

  return v9;
}

- (AAUIReviewCustodianListViewFactory)init
{
  return (AAUIReviewCustodianListViewFactory *)ReviewCustodianListViewFactory.init()();
}

@end
