@implementation AMDClientRequestEvent

- (id)getAMSRequest
{
  AMDAMSEngagementEvent *v3;
  NSString *v4;
  BOOL v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  BOOL v9;
  NSString *v10;
  BOOL v11;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  NSString *v16;
  NSString *v17;
  NSString *v18;
  NSString *v19;
  NSString *v20;
  NSString *v21;
  NSString *v22;
  NSString *v23;
  NSDictionary *v24;
  NSDictionary *v25;
  NSString *v26;
  NSString *v27;
  NSString *v28;
  AMDAMSEngagementEvent *v29;
  id location;
  id v31[2];
  AMDClientRequestEvent *v32;

  v32 = self;
  v31[1] = (id)a2;
  v31[0] = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v27 = -[AMDClientRequestEvent domain](v32, "domain");
  objc_msgSend(v31[0], "setValue:forKey:");

  v28 = -[AMDClientRequestEvent accountDSID](v32, "accountDSID");
  if (v28)
  {
    v26 = -[AMDClientRequestEvent accountDSID](v32, "accountDSID");
    objc_msgSend(v31[0], "setValue:forKey:");

  }
  v25 = -[AMDClientRequestEvent customDescriptor](v32, "customDescriptor");

  if (v25)
  {
    v24 = -[AMDClientRequestEvent customDescriptor](v32, "customDescriptor");
    objc_msgSend(v31[0], "setValue:forKey:");

  }
  v23 = -[AMDClientRequestEvent featureName](v32, "featureName");

  if (v23)
  {
    v22 = -[AMDClientRequestEvent featureName](v32, "featureName");
    objc_msgSend(v31[0], "setValue:forKey:");

  }
  v21 = -[AMDClientRequestEvent schemaVersion](v32, "schemaVersion");

  if (v21)
  {
    v20 = -[AMDClientRequestEvent schemaVersion](v32, "schemaVersion");
    objc_msgSend(v31[0], "setValue:forKey:");

  }
  v19 = -[AMDClientRequestEvent storefrontId](v32, "storefrontId");

  if (v19)
  {
    v18 = -[AMDClientRequestEvent storefrontId](v32, "storefrontId");
    objc_msgSend(v31[0], "setValue:forKey:");

  }
  v17 = -[AMDClientRequestEvent useCaseId](v32, "useCaseId");

  if (v17)
  {
    v16 = -[AMDClientRequestEvent useCaseId](v32, "useCaseId");
    objc_msgSend(v31[0], "setValue:forKey:");

  }
  v15 = -[AMDClientRequestEvent modelId](v32, "modelId");

  if (v15)
  {
    v14 = -[AMDClientRequestEvent modelId](v32, "modelId");
    objc_msgSend(v31[0], "setValue:forKey:");

  }
  v13 = -[AMDClientRequestEvent treatmentId](v32, "treatmentId");

  if (v13)
  {
    v12 = -[AMDClientRequestEvent treatmentId](v32, "treatmentId");
    objc_msgSend(v31[0], "setValue:forKey:");

  }
  location = 0;
  v10 = -[AMDClientRequestEvent request](v32, "request");
  v11 = -[NSString isEqualToString:](v10, "isEqualToString:", CFSTR("clearUserData"));

  if (v11)
  {
    objc_storeStrong(&location, CFSTR("amd.clearUserData"));
  }
  else
  {
    v8 = -[AMDClientRequestEvent request](v32, "request");
    v9 = -[NSString isEqualToString:](v8, "isEqualToString:", CFSTR("customAgg"));

    if (v9)
    {
      objc_storeStrong(&location, CFSTR("amd.fetchAggregatedData"));
    }
    else
    {
      v6 = -[AMDClientRequestEvent request](v32, "request");
      v7 = -[NSString isEqualToString:](v6, "isEqualToString:", CFSTR("fetchInapp"));

      if (v7)
      {
        objc_storeStrong(&location, CFSTR("amd.getSegment"));
      }
      else
      {
        v4 = -[AMDClientRequestEvent request](v32, "request");
        v5 = -[NSString isEqualToString:](v4, "isEqualToString:", CFSTR("fetchModelPath"));

        if (v5)
          objc_storeStrong(&location, CFSTR("amd.getModelPath"));
      }
    }
  }
  objc_msgSend(v31[0], "setValue:forKey:", location, CFSTR("action"));
  v29 = objc_alloc_init(AMDAMSEngagementEvent);
  -[AMDAMSEngagementEvent setEngagementData:](v29, "setEngagementData:", v31[0]);
  v3 = v29;
  objc_storeStrong((id *)&v29, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(v31, 0);
  return v3;
}

- (NSString)accountDSID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)domain
{
  return self->_domain;
}

+ (AMDClientNotificationObserver)observer
{
  return (AMDClientNotificationObserver *)(id)_notificationObserver;
}

+ (void)setObserver:(id)a3
{
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&_notificationObserver, location[0]);
  objc_storeStrong(location, 0);
}

- (void)internalInitializer:(id)a3 WithFeatureName:(id)a4 withAccountDSID:(id)a5 andAccountStoreFrontId:(id)a6 inDomain:(id)a7 withCustomDescriptor:(id)a8 withModelId:(id)a9 withTreatmentId:(id)a10 withUseCaseId:(id)a11 andSchemaVersion:(id)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id location[2];
  AMDClientRequestEvent *v27;

  v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v25 = 0;
  objc_storeStrong(&v25, a4);
  v24 = 0;
  objc_storeStrong(&v24, a5);
  v23 = 0;
  objc_storeStrong(&v23, a6);
  v22 = 0;
  objc_storeStrong(&v22, a7);
  v21 = 0;
  objc_storeStrong(&v21, a8);
  v20 = 0;
  objc_storeStrong(&v20, a9);
  v19 = 0;
  objc_storeStrong(&v19, a10);
  v18 = 0;
  objc_storeStrong(&v18, a11);
  v17 = 0;
  objc_storeStrong(&v17, a12);
  -[AMDClientRequestEvent setRequest:](v27, "setRequest:", location[0]);
  -[AMDClientRequestEvent setDomain:](v27, "setDomain:", v22);
  -[AMDClientRequestEvent setAccountDSID:](v27, "setAccountDSID:", v24);
  -[AMDClientRequestEvent setStorefrontId:](v27, "setStorefrontId:", v23);
  -[AMDClientRequestEvent setFeatureName:](v27, "setFeatureName:", v25);
  -[AMDClientRequestEvent setCustomDescriptor:](v27, "setCustomDescriptor:", v21);
  -[AMDClientRequestEvent setSchemaVersion:](v27, "setSchemaVersion:", v17);
  -[AMDClientRequestEvent setModelId:](v27, "setModelId:", v20);
  -[AMDClientRequestEvent setTreatmentId:](v27, "setTreatmentId:", v19);
  -[AMDClientRequestEvent setUseCaseId:](v27, "setUseCaseId:", v18);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
}

- (id)initClearUserDataFor:(id)a3 inDomain:(id)a4
{
  AMDClientRequestEvent *v4;
  id obj;
  id *v7;
  id *v8;
  id *v9;
  id v10;
  AMDClientRequestEvent *v11;
  objc_super v12;
  id v13;
  id location[2];
  AMDClientRequestEvent *v15;

  obj = a4;
  v9 = (id *)&v15;
  v15 = self;
  location[1] = (id)a2;
  v8 = location;
  v10 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = &v13;
  v13 = 0;
  objc_storeStrong(&v13, obj);
  v4 = v15;
  v15 = 0;
  v12.receiver = v4;
  v12.super_class = (Class)AMDClientRequestEvent;
  v15 = -[AMDClientRequestEvent init](&v12, sel_init);
  objc_storeStrong((id *)&v15, v15);
  -[AMDClientRequestEvent internalInitializer:WithFeatureName:withAccountDSID:andAccountStoreFrontId:inDomain:withCustomDescriptor:withModelId:withTreatmentId:withUseCaseId:andSchemaVersion:](v15, "internalInitializer:WithFeatureName:withAccountDSID:andAccountStoreFrontId:inDomain:withCustomDescriptor:withModelId:withTreatmentId:withUseCaseId:andSchemaVersion:", CFSTR("clearUserData"), 0, location[0], 0, v13, 0, 0, 0, 0);
  v11 = v15;
  objc_storeStrong(v7, v10);
  objc_storeStrong(v8, v10);
  objc_storeStrong(v9, v10);
  return v11;
}

- (AMDClientRequestEvent)initWithFeatureName:(id)a3 withAccountDSID:(id)a4 andAccountStoreFrontId:(id)a5 inDomain:(id)a6 withCustomDescriptor:(id)a7 andSchemaVersion:(id)a8
{
  AMDFeatureDescriptor *v8;
  AMDFeatureDescriptor *v9;
  id v10;
  objc_super v17;
  id v18;
  id v19;
  id v20;
  int v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id location[2];
  id v28;
  AMDClientRequestEvent *v29;

  v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v26 = 0;
  objc_storeStrong(&v26, a4);
  v25 = 0;
  objc_storeStrong(&v25, a5);
  v24 = 0;
  objc_storeStrong(&v24, a6);
  v23 = 0;
  objc_storeStrong(&v23, a7);
  v22 = 0;
  objc_storeStrong(&v22, a8);
  if (v24 && location[0])
  {
    v20 = (id)objc_msgSend(v23, "objectForKey:", AMD_CUSTOM_AGG_VERSION);
    if (v20)
      objc_storeStrong(&v20, v20);
    else
      objc_storeStrong(&v20, (id)AMD_CUSTOM_AGG_VERSION_1);
    if (!v23 || (objc_msgSend(v20, "isEqualToString:", AMD_CUSTOM_AGG_VERSION_SQLITE_0) & 1) != 0)
      goto LABEL_14;
    v8 = [AMDFeatureDescriptor alloc];
    v19 = -[AMDFeatureDescriptor initWithDictionary:withUserId:featureName:](v8, "initWithDictionary:withUserId:featureName:", v23);
    v9 = [AMDFeatureDescriptor alloc];
    v18 = -[AMDFeatureDescriptor initWithDictionaryV2:withUserId:featureName:withDomain:](v9, "initWithDictionaryV2:withUserId:featureName:withDomain:", v23, CFSTR("111111111"), location[0], v24);
    if (v19 || v18)
    {
      v21 = 0;
    }
    else
    {
      v29 = 0;
      v21 = 1;
    }
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v19, 0);
    if (!v21)
    {
LABEL_14:
      v10 = v28;
      v28 = 0;
      v17.receiver = v10;
      v17.super_class = (Class)AMDClientRequestEvent;
      v28 = -[AMDClientRequestEvent init](&v17, sel_init);
      objc_storeStrong(&v28, v28);
      objc_msgSend(v28, "internalInitializer:WithFeatureName:withAccountDSID:andAccountStoreFrontId:inDomain:withCustomDescriptor:withModelId:withTreatmentId:withUseCaseId:andSchemaVersion:", CFSTR("customAgg"), location[0], v26, v25, v24, v23, 0, 0, 0, v22);
      v29 = (AMDClientRequestEvent *)v28;
      v21 = 1;
    }
    objc_storeStrong(&v20, 0);
  }
  else
  {
    v29 = 0;
    v21 = 1;
  }
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v28, 0);
  return v29;
}

- (id)initAppSegmentQueryForAccountDSID:(id)a3
{
  AMDClientRequestEvent *v3;
  id *v5;
  id *v6;
  id obj;
  AMDClientRequestEvent *v8;
  objc_super v9;
  id location[2];
  AMDClientRequestEvent *v11;

  v6 = (id *)&v11;
  v11 = self;
  location[1] = (id)a2;
  v5 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v11;
  v11 = 0;
  v9.receiver = v3;
  v9.super_class = (Class)AMDClientRequestEvent;
  v11 = -[AMDClientRequestEvent init](&v9, sel_init);
  objc_storeStrong((id *)&v11, v11);
  -[AMDClientRequestEvent internalInitializer:WithFeatureName:withAccountDSID:andAccountStoreFrontId:inDomain:withCustomDescriptor:withModelId:withTreatmentId:withUseCaseId:andSchemaVersion:](v11, "internalInitializer:WithFeatureName:withAccountDSID:andAccountStoreFrontId:inDomain:withCustomDescriptor:withModelId:withTreatmentId:withUseCaseId:andSchemaVersion:", CFSTR("fetchInapp"), CFSTR("inAppSegments"), location[0], 0, CFSTR("apps"), 0, 0, 0, 0);
  v8 = v11;
  objc_storeStrong(v5, obj);
  objc_storeStrong(v6, obj);
  return v8;
}

- (id)initModelPathRequestForUsecaseId:(id)a3 andModelId:(id)a4 withTreatmentId:(id)a5 inDomain:(id)a6
{
  AMDClientRequestEvent *v6;
  id obj;
  id v9;
  id v10;
  id *v11;
  id *v12;
  id *v13;
  id *v14;
  id *v15;
  id v16;
  AMDClientRequestEvent *v17;
  objc_super v18;
  id v19;
  id v20;
  id v21;
  id location[2];
  AMDClientRequestEvent *v23;

  obj = a4;
  v9 = a5;
  v10 = a6;
  v15 = (id *)&v23;
  v23 = self;
  location[1] = (id)a2;
  v14 = location;
  v16 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = &v21;
  v21 = 0;
  objc_storeStrong(&v21, obj);
  v12 = &v20;
  v20 = 0;
  objc_storeStrong(&v20, v9);
  v11 = &v19;
  v19 = 0;
  objc_storeStrong(&v19, v10);
  v6 = v23;
  v23 = 0;
  v18.receiver = v6;
  v18.super_class = (Class)AMDClientRequestEvent;
  v23 = -[AMDClientRequestEvent init](&v18, sel_init);
  objc_storeStrong((id *)&v23, v23);
  -[AMDClientRequestEvent internalInitializer:WithFeatureName:withAccountDSID:andAccountStoreFrontId:inDomain:withCustomDescriptor:withModelId:withTreatmentId:withUseCaseId:andSchemaVersion:](v23, "internalInitializer:WithFeatureName:withAccountDSID:andAccountStoreFrontId:inDomain:withCustomDescriptor:withModelId:withTreatmentId:withUseCaseId:andSchemaVersion:", CFSTR("fetchModelPath"), 0, 0, 0, v19, v21, v20, location[0], 0);
  v17 = v23;
  objc_storeStrong(v11, v16);
  objc_storeStrong(v12, v16);
  objc_storeStrong(v13, v16);
  objc_storeStrong(v14, v16);
  objc_storeStrong(v15, v16);
  return v17;
}

- (id)initPIRResponseForKeywordArray:(id)a3 withDataArray:(id)a4 withMissingKeywords:(id)a5 requestError:(id)a6 andCallHandle:(id)a7
{
  AMDClientRequestEvent *v7;
  AMDClientRequestEvent *v9;
  id v10;
  id v15;
  id v16;
  id v17;
  objc_super v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id location[2];
  AMDClientRequestEvent *v24;

  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v22 = 0;
  objc_storeStrong(&v22, a4);
  v21 = 0;
  objc_storeStrong(&v21, a5);
  v20 = 0;
  objc_storeStrong(&v20, a6);
  v19 = 0;
  objc_storeStrong(&v19, a7);
  v7 = v24;
  v24 = 0;
  v18.receiver = v7;
  v18.super_class = (Class)AMDClientRequestEvent;
  v24 = -[AMDClientRequestEvent init](&v18, sel_init);
  objc_storeStrong((id *)&v24, v24);
  -[AMDClientRequestEvent setRequest:](v24, "setRequest:", 0x1EA4B7C68);
  v15 = +[AMDMiscHelpers convertDataArrayToBase64StringArray:](AMDMiscHelpers, "convertDataArrayToBase64StringArray:", location[0]);
  -[AMDClientRequestEvent setPIRKeywordArray:](v24, "setPIRKeywordArray:");

  v16 = +[AMDMiscHelpers convertDataArrayToBase64StringArray:](AMDMiscHelpers, "convertDataArrayToBase64StringArray:", v21);
  -[AMDClientRequestEvent setPIRMissingKeywordArray:](v24, "setPIRMissingKeywordArray:");

  v17 = +[AMDMiscHelpers convertDataArrayToBase64StringArray:](AMDMiscHelpers, "convertDataArrayToBase64StringArray:", v22);
  -[AMDClientRequestEvent setPIRDataArray:](v24, "setPIRDataArray:");

  -[AMDClientRequestEvent setCipherMLCallHandle:](v24, "setCipherMLCallHandle:", v19);
  if (v20)
  {
    v10 = (id)objc_msgSend(v20, "localizedDescription");
    -[AMDClientRequestEvent setCipherMLRequestError:](v24, "setCipherMLRequestError:");

  }
  v9 = v24;
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v24, 0);
  return v9;
}

- (id)initPECResponseForSimilarityScores:(id)a3 requestError:(id)a4 andCallHandle:(id)a5
{
  AMDClientRequestEvent *v5;
  AMDClientRequestEvent *v7;
  id v8;
  objc_super v11;
  id v12;
  id v13;
  id location[2];
  AMDClientRequestEvent *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v12 = 0;
  objc_storeStrong(&v12, a5);
  v5 = v15;
  v15 = 0;
  v11.receiver = v5;
  v11.super_class = (Class)AMDClientRequestEvent;
  v15 = -[AMDClientRequestEvent init](&v11, sel_init);
  objc_storeStrong((id *)&v15, v15);
  -[AMDClientRequestEvent setRequest:](v15, "setRequest:", 0x1EA4B7C48);
  -[AMDClientRequestEvent setPECSimilarityScoresArray:](v15, "setPECSimilarityScoresArray:", location[0]);
  -[AMDClientRequestEvent setCipherMLCallHandle:](v15, "setCipherMLCallHandle:", v12);
  if (v13)
  {
    v8 = (id)objc_msgSend(v13, "localizedDescription");
    -[AMDClientRequestEvent setCipherMLRequestError:](v15, "setCipherMLRequestError:");

  }
  v7 = v15;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v15, 0);
  return v7;
}

- (id)getAMSRequestForCipherML
{
  id v3;
  NSString *v4;
  AMDAMSEngagementEvent *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSArray *v10;
  NSArray *v11;
  NSArray *v12;
  NSArray *v13;
  NSArray *v14;
  NSArray *v15;
  NSArray *v16;
  NSArray *v17;
  NSString *v18;
  NSString *v19;
  AMDAMSEngagementEvent *v20;
  id v21[2];
  AMDClientRequestEvent *v22;

  v22 = self;
  v21[1] = (id)a2;
  v21[0] = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v19 = -[AMDClientRequestEvent accountDSID](v22, "accountDSID");

  if (v19)
  {
    v18 = -[AMDClientRequestEvent accountDSID](v22, "accountDSID");
    objc_msgSend(v21[0], "setValue:forKey:");

  }
  v17 = -[AMDClientRequestEvent PIRDataArray](v22, "PIRDataArray");

  if (v17)
  {
    v16 = -[AMDClientRequestEvent PIRDataArray](v22, "PIRDataArray");
    objc_msgSend(v21[0], "setValue:forKey:");

  }
  v15 = -[AMDClientRequestEvent PIRKeywordArray](v22, "PIRKeywordArray");

  if (v15)
  {
    v14 = -[AMDClientRequestEvent PIRKeywordArray](v22, "PIRKeywordArray");
    objc_msgSend(v21[0], "setValue:forKey:");

  }
  v13 = -[AMDClientRequestEvent PIRMissingKeywordArray](v22, "PIRMissingKeywordArray");

  if (v13)
  {
    v12 = -[AMDClientRequestEvent PIRMissingKeywordArray](v22, "PIRMissingKeywordArray");
    objc_msgSend(v21[0], "setValue:forKey:");

  }
  v11 = -[AMDClientRequestEvent PECSimilarityScoresArray](v22, "PECSimilarityScoresArray");

  if (v11)
  {
    v10 = -[AMDClientRequestEvent PECSimilarityScoresArray](v22, "PECSimilarityScoresArray");
    objc_msgSend(v21[0], "setValue:forKey:");

  }
  v9 = -[AMDClientRequestEvent CipherMLCallHandle](v22, "CipherMLCallHandle");

  if (v9)
  {
    v8 = -[AMDClientRequestEvent CipherMLCallHandle](v22, "CipherMLCallHandle");
    objc_msgSend(v21[0], "setValue:forKey:");

  }
  v7 = -[AMDClientRequestEvent CipherMLRequestError](v22, "CipherMLRequestError");

  if (v7)
  {
    v6 = -[AMDClientRequestEvent CipherMLCallHandle](v22, "CipherMLCallHandle");
    objc_msgSend(v21[0], "setValue:forKey:");

  }
  v4 = -[AMDClientRequestEvent request](v22, "request", v21[0]);
  objc_msgSend(v3, "setValue:forKey:");

  objc_msgSend(v21[0], "setValue:forKey:", CFSTR("amd.enqueueCipherMLEvent"), CFSTR("action"));
  v20 = objc_alloc_init(AMDAMSEngagementEvent);
  -[AMDAMSEngagementEvent setEngagementData:](v20, "setEngagementData:", v21[0]);
  v5 = v20;
  objc_storeStrong((id *)&v20, 0);
  objc_storeStrong(v21, 0);
  return v5;
}

- (void)setAccountDSID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSDictionary)customDescriptor
{
  return self->_customDescriptor;
}

- (void)setCustomDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_customDescriptor, a3);
}

- (void)setDomain:(id)a3
{
  objc_storeStrong((id *)&self->_domain, a3);
}

- (NSString)featureName
{
  return self->_featureName;
}

- (void)setFeatureName:(id)a3
{
  objc_storeStrong((id *)&self->_featureName, a3);
}

- (NSString)modelId
{
  return self->_modelId;
}

- (void)setModelId:(id)a3
{
  objc_storeStrong((id *)&self->_modelId, a3);
}

- (NSString)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (NSString)schemaVersion
{
  return self->_schemaVersion;
}

- (void)setSchemaVersion:(id)a3
{
  objc_storeStrong((id *)&self->_schemaVersion, a3);
}

- (NSString)storefrontId
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setStorefrontId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSString)treatmentId
{
  return self->_treatmentId;
}

- (void)setTreatmentId:(id)a3
{
  objc_storeStrong((id *)&self->_treatmentId, a3);
}

- (NSString)useCaseId
{
  return self->_useCaseId;
}

- (void)setUseCaseId:(id)a3
{
  objc_storeStrong((id *)&self->_useCaseId, a3);
}

- (NSString)CipherMLCallHandle
{
  return self->_CipherMLCallHandle;
}

- (void)setCipherMLCallHandle:(id)a3
{
  objc_storeStrong((id *)&self->_CipherMLCallHandle, a3);
}

- (NSString)CipherMLRequestError
{
  return self->_CipherMLRequestError;
}

- (void)setCipherMLRequestError:(id)a3
{
  objc_storeStrong((id *)&self->_CipherMLRequestError, a3);
}

- (NSArray)PECSimilarityScoresArray
{
  return self->_PECSimilarityScoresArray;
}

- (void)setPECSimilarityScoresArray:(id)a3
{
  objc_storeStrong((id *)&self->_PECSimilarityScoresArray, a3);
}

- (NSArray)PIRDataArray
{
  return self->_PIRDataArray;
}

- (void)setPIRDataArray:(id)a3
{
  objc_storeStrong((id *)&self->_PIRDataArray, a3);
}

- (NSArray)PIRKeywordArray
{
  return self->_PIRKeywordArray;
}

- (void)setPIRKeywordArray:(id)a3
{
  objc_storeStrong((id *)&self->_PIRKeywordArray, a3);
}

- (NSArray)PIRMissingKeywordArray
{
  return self->_PIRMissingKeywordArray;
}

- (void)setPIRMissingKeywordArray:(id)a3
{
  objc_storeStrong((id *)&self->_PIRMissingKeywordArray, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_PIRMissingKeywordArray, 0);
  objc_storeStrong((id *)&self->_PIRKeywordArray, 0);
  objc_storeStrong((id *)&self->_PIRDataArray, 0);
  objc_storeStrong((id *)&self->_PECSimilarityScoresArray, 0);
  objc_storeStrong((id *)&self->_CipherMLRequestError, 0);
  objc_storeStrong((id *)&self->_CipherMLCallHandle, 0);
  objc_storeStrong((id *)&self->_useCaseId, 0);
  objc_storeStrong((id *)&self->_treatmentId, 0);
  objc_storeStrong((id *)&self->_storefrontId, 0);
  objc_storeStrong((id *)&self->_schemaVersion, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_modelId, 0);
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_customDescriptor, 0);
  objc_storeStrong((id *)&self->_accountDSID, 0);
}

@end
