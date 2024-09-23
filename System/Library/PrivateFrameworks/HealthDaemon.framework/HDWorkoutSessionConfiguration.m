@implementation HDWorkoutSessionConfiguration

- (HDWorkoutSessionConfiguration)initWithSessionIdentifier:(id)a3 workoutConfiguration:(id)a4 sessionType:(int64_t)a5 client:(id)a6 processBundleIdentifier:(id)a7 applicationIdentifier:(id)a8 requiresCoreLocationAssertion:(BOOL)a9 supportsAppRelaunchForRecovery:(BOOL)a10 supports3rdPartyAOT:(BOOL)a11 enableWorkoutChangeDetection:(BOOL)a12 activityConfigurations:(id)a13
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  HDWorkoutSessionConfiguration *v24;
  uint64_t v25;
  NSUUID *sessionIdentifier;
  uint64_t v27;
  HKWorkoutConfiguration *workoutConfiguration;
  uint64_t v29;
  NSString *clientProcessBundleIdentifier;
  uint64_t v31;
  NSString *clientApplicationIdentifier;
  uint64_t v33;
  NSArray *activityConfigurations;
  id v36;
  objc_super v37;

  v36 = a3;
  v19 = a4;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a13;
  v37.receiver = self;
  v37.super_class = (Class)HDWorkoutSessionConfiguration;
  v24 = -[HDWorkoutSessionConfiguration init](&v37, sel_init);
  if (v24)
  {
    v25 = objc_msgSend(v36, "copy");
    sessionIdentifier = v24->_sessionIdentifier;
    v24->_sessionIdentifier = (NSUUID *)v25;

    v27 = objc_msgSend(v19, "copy");
    workoutConfiguration = v24->_workoutConfiguration;
    v24->_workoutConfiguration = (HKWorkoutConfiguration *)v27;

    v24->_sessionType = a5;
    objc_storeStrong((id *)&v24->_client, a6);
    v29 = objc_msgSend(v21, "copy");
    clientProcessBundleIdentifier = v24->_clientProcessBundleIdentifier;
    v24->_clientProcessBundleIdentifier = (NSString *)v29;

    v31 = objc_msgSend(v22, "copy");
    clientApplicationIdentifier = v24->_clientApplicationIdentifier;
    v24->_clientApplicationIdentifier = (NSString *)v31;

    v24->_requiresCoreLocationAssertion = a9;
    v24->_supportsAppRelaunchForRecovery = a10;
    v24->_supports3rdPartyAOT = a11;
    v24->_enableWorkoutChangeDetection = a12;
    v33 = objc_msgSend(v23, "copy");
    activityConfigurations = v24->_activityConfigurations;
    v24->_activityConfigurations = (NSArray *)v33;

  }
  return v24;
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (HKWorkoutConfiguration)workoutConfiguration
{
  return self->_workoutConfiguration;
}

- (int64_t)sessionType
{
  return self->_sessionType;
}

- (HDHealthStoreClient)client
{
  return self->_client;
}

- (NSString)clientProcessBundleIdentifier
{
  return self->_clientProcessBundleIdentifier;
}

- (NSString)clientApplicationIdentifier
{
  return self->_clientApplicationIdentifier;
}

- (BOOL)requiresCoreLocationAssertion
{
  return self->_requiresCoreLocationAssertion;
}

- (BOOL)supportsAppRelaunchForRecovery
{
  return self->_supportsAppRelaunchForRecovery;
}

- (BOOL)supports3rdPartyAOT
{
  return self->_supports3rdPartyAOT;
}

- (BOOL)enableWorkoutChangeDetection
{
  return self->_enableWorkoutChangeDetection;
}

- (NSArray)activityConfigurations
{
  return self->_activityConfigurations;
}

- (void)setActivityConfigurations:(id)a3
{
  objc_storeStrong((id *)&self->_activityConfigurations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityConfigurations, 0);
  objc_storeStrong((id *)&self->_clientApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_clientProcessBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_workoutConfiguration, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end
