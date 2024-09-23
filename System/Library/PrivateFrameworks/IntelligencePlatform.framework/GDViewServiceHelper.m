@implementation GDViewServiceHelper

+ (id)personViewWithAccessAssertion:(id)a3 database:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  GDPersonView *v8;
  const char *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = [GDPersonView alloc];
  v10 = (void *)objc_msgSend_initWithAccessAssertion_database_(v8, v9, (uint64_t)v7, v6);

  return v10;
}

+ (id)visualIdentifierViewWithAccessAssertion:(id)a3 database:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  GDVisualIdentifierView *v8;
  const char *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = [GDVisualIdentifierView alloc];
  v10 = (void *)objc_msgSend_initWithAccessAssertion_database_(v8, v9, (uint64_t)v7, v6);

  return v10;
}

+ (id)donationViewWithAccessAssertion:(id)a3 database:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  GDDonationView *v8;
  const char *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = [GDDonationView alloc];
  v10 = (void *)objc_msgSend_initWithAccessAssertion_database_(v8, v9, (uint64_t)v7, v6);

  return v10;
}

+ (id)pageRankViewWithAccessAssertion:(id)a3 database:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  GDPageRankView *v8;
  const char *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = [GDPageRankView alloc];
  v10 = (void *)objc_msgSend_initWithAccessAssertion_database_(v8, v9, (uint64_t)v7, v6);

  return v10;
}

+ (id)featureViewWithAccessAssertion:(id)a3 database:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  GDFeatureView *v8;
  const char *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = [GDFeatureView alloc];
  v10 = (void *)objc_msgSend_initWithAccessAssertion_database_(v8, v9, (uint64_t)v7, v6);

  return v10;
}

+ (id)firstPartyLongTermTopicViewWithAccessAssertion:(id)a3 database:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  GDTopicView *v8;
  const char *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = [GDTopicView alloc];
  v10 = (void *)objc_msgSend_initWithAccessAssertion_database_(v8, v9, (uint64_t)v7, v6);

  return v10;
}

+ (id)firstPartyShortTermTopicViewWithAccessAssertion:(id)a3 database:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  GDTopicView *v8;
  const char *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = [GDTopicView alloc];
  v10 = (void *)objc_msgSend_initWithAccessAssertion_database_(v8, v9, (uint64_t)v7, v6);

  return v10;
}

+ (id)remoteViewAccessRequester
{
  return (id)objc_opt_new();
}

@end
