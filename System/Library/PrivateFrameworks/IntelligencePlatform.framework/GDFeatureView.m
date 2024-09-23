@implementation GDFeatureView

- (GDFeatureView)initWithAccessAssertion:(id)a3 database:(id)a4
{
  id v7;
  id v8;
  GDFeatureView *v9;
  GDFeatureView *v10;
  GDSQLFeatureRetriever *v11;
  const char *v12;
  uint64_t v13;
  GDSQLFeatureRetriever *featureRetriever;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)GDFeatureView;
  v9 = -[GDFeatureView init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accessAssertion, a3);
    objc_storeStrong((id *)&v10->_db, a4);
    v11 = [GDSQLFeatureRetriever alloc];
    v13 = objc_msgSend_initWithDatabase_(v11, v12, (uint64_t)v10->_db);
    featureRetriever = v10->_featureRetriever;
    v10->_featureRetriever = (GDSQLFeatureRetriever *)v13;

  }
  return v10;
}

- (id)featureForKey:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  const char *v8;
  void *v9;

  v6 = a3;
  objc_msgSend_sendEventForProductionLazyWithEventName_eventPayloadBuilder_(GDAnalytics, v7, (uint64_t)CFSTR("ViewEngine.Serving.Query"), &unk_1E5DC8D20);
  objc_msgSend_featureForKey_error_(self->_featureRetriever, v8, (uint64_t)v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)featureKeysWithError:(id *)a3
{
  const char *v5;

  objc_msgSend_sendEventForProductionLazyWithEventName_eventPayloadBuilder_(GDAnalytics, a2, (uint64_t)CFSTR("ViewEngine.Serving.Query"), &unk_1E5DC8D40);
  return (id)objc_msgSend_featureKeysWithError_(self->_featureRetriever, v5, (uint64_t)a3);
}

- (id)expectedFeatureKeysWithError:(id *)a3
{
  void *v4;
  const char *v5;
  void *v6;

  objc_msgSend_sendEventForProductionLazyWithEventName_eventPayloadBuilder_(GDAnalytics, a2, (uint64_t)CFSTR("ViewEngine.Serving.Query"), &unk_1E5DC8D80);
  v4 = (void *)objc_opt_new();
  objc_msgSend_featureKeysWithError_(v4, v5, (uint64_t)a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureRetriever, 0);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_accessAssertion, 0);
}

@end
