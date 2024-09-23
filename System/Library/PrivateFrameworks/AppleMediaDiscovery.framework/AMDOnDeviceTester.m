@implementation AMDOnDeviceTester

- (AMDOnDeviceTester)init
{
  id v3;
  AMDOnDeviceTester *v4;
  objc_super v5;
  SEL v6;
  AMDOnDeviceTester *v7;

  v6 = a2;
  v7 = 0;
  v5.receiver = self;
  v5.super_class = (Class)AMDOnDeviceTester;
  v7 = -[AMDOnDeviceTester init](&v5, sel_init);
  objc_storeStrong((id *)&v7, v7);
  v3 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
  -[AMDOnDeviceTester setContainer:](v7, "setContainer:");

  v4 = v7;
  objc_storeStrong((id *)&v7, 0);
  return v4;
}

+ (id)getEnvironments
{
  return &unk_1EA4D1BC0;
}

+ (BOOL)initEnv:(id)a3 withDomain:(id)a4 userId:(id)a5 andStoreFrontId:(id)a6
{
  id v6;
  id v11;
  id v12;
  id v13;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v12 = 0;
  objc_storeStrong(&v12, a5);
  v11 = 0;
  objc_storeStrong(&v11, a6);
  NSLog(CFSTR("AMDDemoSupport Initializing..."));
  v6 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer");
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  return 1;
}

+ (void)initPersistentContainer
{
  id v2;

  v2 = +[AMDCoreDataPersistentContainer sharedContainer](AMDCoreDataPersistentContainer, "sharedContainer", a2, a1);
}

- (void)testAddEvent:(id *)a3
{
  id v3;

  NSLog(CFSTR(">> Running: Add Event"));
  v3 = +[AMDTestDataCommon getSampleEvent](AMDTestDataCommon, "getSampleEvent");
  +[AMDAppEvent saveEvent:error:](AMDAppEvent, "saveEvent:error:");

  if (*a3)
    __assert_rtn("-[AMDOnDeviceTester testAddEvent:]", "AMDOnDeviceTester.m", 81, "!*error");
}

- (void)testFeatureDescriptor:(id *)a3
{
  AMDFeatureDescriptor *v3;
  id v4;
  id location;
  id v6;
  id *v7;
  SEL v8;
  AMDOnDeviceTester *v9;

  v9 = self;
  v8 = a2;
  v7 = a3;
  NSLog(CFSTR(">> Running: Non-agg FeatureDescriptor"));
  v3 = objc_alloc_init(AMDFeatureDescriptor);
  v4 = +[AMDTestDataCommon getNonAggregationDescriptor](AMDTestDataCommon, "getNonAggregationDescriptor");
  v6 = -[AMDFeatureDescriptor initWithDictionary:withUserId:featureName:](v3, "initWithDictionary:withUserId:featureName:");

  location = (id)objc_msgSend(v6, "getFeature:", v7);
  if (*v7)
    __assert_rtn("-[AMDOnDeviceTester testFeatureDescriptor:]", "AMDOnDeviceTester.m", 91, "!*error");
  if (!location)
    __assert_rtn("-[AMDOnDeviceTester testFeatureDescriptor:]", "AMDOnDeviceTester.m", 92, "f");
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v6, 0);
}

- (void)testAggregation:(id *)a3
{
  id v3;
  id v4;
  id v5;
  id location;
  id v7;
  id *v8;
  SEL v9;
  AMDOnDeviceTester *v10;

  v10 = self;
  v9 = a2;
  v8 = a3;
  NSLog(CFSTR(">> Running: Aggregation FeatureDescriptor"));
  v7 = objc_alloc_init(AMDFeatureDescriptor);
  v3 = v7;
  v4 = +[AMDTestDataCommon getAggregationDescriptorDict](AMDTestDataCommon, "getAggregationDescriptorDict");
  v5 = (id)objc_msgSend(v3, "initWithDictionary:withUserId:featureName:");
  if (!v5)
    __assert_rtn("-[AMDOnDeviceTester testAggregation:]", "AMDOnDeviceTester.m", 100, "[fd initWithDictionary:[AMDTestDataCommon getAggregationDescriptorDict] withUserId:@\"111111111\" featureName:@\"foo\"]");

  location = (id)objc_msgSend(v7, "getFeature:", v8);
  if (*v8)
    __assert_rtn("-[AMDOnDeviceTester testAggregation:]", "AMDOnDeviceTester.m", 103, "!*error");
  if (!location)
    __assert_rtn("-[AMDOnDeviceTester testAggregation:]", "AMDOnDeviceTester.m", 104, "f");
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v7, 0);
}

+ (void)saveDescriptors:(id)a3 forDomain:(int64_t)a4 error:(id *)a5
{
  id v5;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = +[AMDDescriptor refreshDescriptors:forDomain:error:](AMDDescriptor, "refreshDescriptors:forDomain:error:", location[0], a4, a5);
  objc_storeStrong(location, 0);
}

+ (void)refreshOnDeviceTasteProfile:(id)a3 withUserId:(id)a4 andStoreFrontId:(unsigned int)a5 error:(id *)a6
{
  id v6;
  id v10;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v6 = +[AMDTasteProfile refreshAggregationTasteProfileForDomain:forUser:andStoreFrontId:error:](AMDTasteProfile, "refreshAggregationTasteProfileForDomain:forUser:andStoreFrontId:error:", location[0], v10, a5, a6);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

+ (id)deleteEvents:(id *)a3
{
  return +[AMDAppEvent deleteAllEvents:](AMDAppEvent, "deleteAllEvents:", a3);
}

+ (id)fetchEvents:(id *)a3
{
  return +[AMDAppEvent fetchEvents:](AMDAppEvent, "fetchEvents:", a3);
}

+ (void)saveEvent:(id)a3 error:(id *)a4
{
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  +[AMDAppEvent saveEvent:error:](AMDAppEvent, "saveEvent:error:", location[0], a4);
  objc_storeStrong(location, 0);
}

+ (id)fetchTasteProfile:(id *)a3
{
  return +[AMDTasteProfile fetchTasteProfile:](AMDTasteProfile, "fetchTasteProfile:", a3);
}

+ (id)getAppSegments:(id *)a3
{
  return +[AMDAppSegment getSegmentsDictForAllTreatments:](AMDAppSegment, "getSegmentsDictForAllTreatments:", a3);
}

+ (id)fetchModelUrls:(id *)a3
{
  return +[AMDModel fetchAll:](AMDModel, "fetchAll:", a3);
}

- (void)testOnDeviceTasteProfile:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  id location[3];
  __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  NSLog(CFSTR(">> Running: On-device Taste Profile"));
  v8 = CFSTR("test_feature_name");
  v6 = +[AMDTestDataCommon getAggregationDescriptorDict](AMDTestDataCommon, "getAggregationDescriptorDict");
  v9[0] = v6;
  v5 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8);
  +[AMDOnDeviceTester saveDescriptors:forDomain:error:](AMDOnDeviceTester, "saveDescriptors:forDomain:error:");

  if (*a4)
    __assert_rtn("-[AMDOnDeviceTester testOnDeviceTasteProfile:error:]", "AMDOnDeviceTester.m", 159, "!*error");
  +[AMDOnDeviceTester refreshOnDeviceTasteProfile:withUserId:andStoreFrontId:error:](AMDOnDeviceTester, "refreshOnDeviceTasteProfile:withUserId:andStoreFrontId:error:", CFSTR("apps"), location[0], 143441, a4);
  if (*a4)
    __assert_rtn("-[AMDOnDeviceTester testOnDeviceTasteProfile:error:]", "AMDOnDeviceTester.m", 166, "!*error");
  objc_storeStrong(location, 0);
}

- (void)testClient:(id *)a3
{
  AMDClientRequestEvent *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  AMDClient *v11;
  AMDClient *v12;
  id location;
  id v14;
  id v15;
  id v16[4];

  v16[3] = self;
  v16[2] = (id)a2;
  v16[1] = a3;
  NSLog(CFSTR(">> Running: Client API"));
  v16[0] = -[AMDClientRequestEvent initWithFeatureName:withAccountDSID:andAccountStoreFrontId:inDomain:withCustomDescriptor:andSchemaVersion:]([AMDClientRequestEvent alloc], "initWithFeatureName:withAccountDSID:andAccountStoreFrontId:inDomain:withCustomDescriptor:andSchemaVersion:", CFSTR("testFeatureList"), 0, 0, CFSTR("apps"), 0);
  if (!v16[0])
    __assert_rtn("-[AMDOnDeviceTester testClient:]", "AMDOnDeviceTester.m", 177, "requestEvent");
  v12 = [AMDClient alloc];
  v15 = -[AMDClient getFeatureStub:](v12, "getFeatureStub:", v16[0]);

  if (!v15)
    __assert_rtn("-[AMDOnDeviceTester testClient:]", "AMDOnDeviceTester.m", 179, "response");
  v14 = (id)objc_msgSend(v15, "objectForKey:", CFSTR("status"));
  if (!v14)
    __assert_rtn("-[AMDOnDeviceTester testClient:]", "AMDOnDeviceTester.m", 182, "status");
  if (((objc_msgSend(v14, "isEqual:", CFSTR("OK")) ^ 1) & 1) != 0)
    __assert_rtn("-[AMDOnDeviceTester testClient:]", "AMDOnDeviceTester.m", 183, "[status isEqual:AMD_CLIENT_STATUS_OK]");
  location = (id)objc_msgSend(v15, "objectForKey:", CFSTR("data"));
  if (!location)
    __assert_rtn("-[AMDOnDeviceTester testClient:]", "AMDOnDeviceTester.m", 186, "data");
  objc_opt_class();
  if (((objc_opt_isKindOfClass() ^ 1) & 1) != 0)
    __assert_rtn("-[AMDOnDeviceTester testClient:]", "AMDOnDeviceTester.m", 187, "[data isKindOfClass:NSArray.class]");
  v3 = -[AMDClientRequestEvent initWithFeatureName:withAccountDSID:andAccountStoreFrontId:inDomain:withCustomDescriptor:andSchemaVersion:]([AMDClientRequestEvent alloc], "initWithFeatureName:withAccountDSID:andAccountStoreFrontId:inDomain:withCustomDescriptor:andSchemaVersion:", CFSTR("testFeatureDict"), 0, 0, CFSTR("apps"), 0);
  v4 = v16[0];
  v16[0] = v3;

  if (!v16[0])
    __assert_rtn("-[AMDOnDeviceTester testClient:]", "AMDOnDeviceTester.m", 195, "requestEvent");
  v11 = [AMDClient alloc];
  v5 = -[AMDClient getFeatureStub:](v11, "getFeatureStub:", v16[0]);
  v6 = v15;
  v15 = v5;

  if (!v15)
    __assert_rtn("-[AMDOnDeviceTester testClient:]", "AMDOnDeviceTester.m", 197, "response");
  v7 = (id)objc_msgSend(v15, "objectForKey:", CFSTR("status"));
  v8 = v14;
  v14 = v7;

  if (!v14)
    __assert_rtn("-[AMDOnDeviceTester testClient:]", "AMDOnDeviceTester.m", 200, "status");
  if (((objc_msgSend(v14, "isEqual:", CFSTR("OK")) ^ 1) & 1) != 0)
    __assert_rtn("-[AMDOnDeviceTester testClient:]", "AMDOnDeviceTester.m", 201, "[status isEqual:AMD_CLIENT_STATUS_OK]");
  v9 = (id)objc_msgSend(v15, "objectForKey:", CFSTR("data"));
  v10 = location;
  location = v9;

  if (!location)
    __assert_rtn("-[AMDOnDeviceTester testClient:]", "AMDOnDeviceTester.m", 204, "data");
  objc_opt_class();
  if (((objc_opt_isKindOfClass() ^ 1) & 1) != 0)
    __assert_rtn("-[AMDOnDeviceTester testClient:]", "AMDOnDeviceTester.m", 205, "[data isKindOfClass:NSDictionary.class]");
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(v16, 0);
}

- (void)testSaveConfigAndDownloadModel:(id *)a3
{
  id v3;
  id location;
  id *v5;
  SEL v6;
  AMDOnDeviceTester *v7;

  v7 = self;
  v6 = a2;
  v5 = a3;
  NSLog(CFSTR(">> Running: Save config and download model"));
  location = +[AMDTestDataCommon getSaveConfigDownloadModelPayload](AMDTestDataCommon, "getSaveConfigDownloadModelPayload");
  if (!location)
    __assert_rtn("-[AMDOnDeviceTester testSaveConfigAndDownloadModel:]", "AMDOnDeviceTester.m", 211, "payload");
  v3 = +[AMDJSRequestHandler handlePayload:error:](AMDJSRequestHandler, "handlePayload:error:", location, v5);
  if (*v5)
    __assert_rtn("-[AMDOnDeviceTester testSaveConfigAndDownloadModel:]", "AMDOnDeviceTester.m", 213, "!*error");
  objc_storeStrong(&location, 0);
}

- (void)testRunInference:(id *)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id location;
  id v13;
  id *v14;
  SEL v15;
  AMDOnDeviceTester *v16;

  v16 = self;
  v15 = a2;
  v14 = a3;
  NSLog(CFSTR(">> Running: Inference"));
  NSLog(CFSTR("--- Inference: get config and models"));
  v11 = +[AMDTestDataCommon getSaveConfigDownloadModelPayload](AMDTestDataCommon, "getSaveConfigDownloadModelPayload");
  v3 = +[AMDJSRequestHandler handlePayload:error:](AMDJSRequestHandler, "handlePayload:error:");

  if (*v14)
    __assert_rtn("-[AMDOnDeviceTester testRunInference:]", "AMDOnDeviceTester.m", 220, "!*error");
  NSLog(CFSTR("--- Inference: refresh server side TP"));
  v10 = +[AMDTestDataCommon getRefreshServerTasteProfilePayload](AMDTestDataCommon, "getRefreshServerTasteProfilePayload");
  v4 = +[AMDJSRequestHandler handlePayload:error:](AMDJSRequestHandler, "handlePayload:error:");

  if (*v14)
    __assert_rtn("-[AMDOnDeviceTester testRunInference:]", "AMDOnDeviceTester.m", 224, "!*error");
  NSLog(CFSTR("--- Inference: compute results"));
  v9 = +[AMDTestDataCommon getInferencePayload](AMDTestDataCommon, "getInferencePayload");
  v13 = +[AMDJSRequestHandler handlePayload:error:](AMDJSRequestHandler, "handlePayload:error:");

  if (*v14)
    __assert_rtn("-[AMDOnDeviceTester testRunInference:]", "AMDOnDeviceTester.m", 228, "!*error");
  NSLog(CFSTR("--- Inference: verify results"));
  if (!v13)
    __assert_rtn("-[AMDOnDeviceTester testRunInference:]", "AMDOnDeviceTester.m", 231, "inferenceResults");
  v7 = (id)objc_msgSend(v13, "objectForKey:", CFSTR("response"));
  location = (id)objc_msgSend(v7, "objectForKey:", CFSTR("mgyml"));

  v8 = (id)objc_msgSend(location, "objectForKey:", CFSTR("contentIds"));
  if (objc_msgSend(v8, "count") != 64)
    __assert_rtn("-[AMDOnDeviceTester testRunInference:]", "AMDOnDeviceTester.m", 233, "[[inferenceResponse objectForKey:@\"contentIds\"] count] == 64");

  v6 = (id)objc_msgSend(location, "objectForKey:", CFSTR("scores"));
  if (objc_msgSend(v6, "count") != 64)
    __assert_rtn("-[AMDOnDeviceTester testRunInference:]", "AMDOnDeviceTester.m", 234, "[[inferenceResponse objectForKey:@\"scores\"] count] == 64");

  v5 = (id)objc_msgSend(location, "objectForKey:", CFSTR("metrics"));
  if (objc_msgSend(v5, "count") != 3)
    __assert_rtn("-[AMDOnDeviceTester testRunInference:]", "AMDOnDeviceTester.m", 235, "[[inferenceResponse objectForKey:@\"metrics\"] count] == 3");

  objc_storeStrong(&location, 0);
  objc_storeStrong(&v13, 0);
}

- (AMDCoreDataPersistentContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
  objc_storeStrong((id *)&self->_container, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
}

@end
