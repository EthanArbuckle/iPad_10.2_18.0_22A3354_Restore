@implementation HMDCoreDataCloudKitSetupActivity

- (HMDCoreDataCloudKitSetupActivity)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  HMDCoreDataCloudKitSetupActivity *v6;
  uint64_t v7;
  NSString *activityType;
  void *v9;
  uint64_t v10;
  NSUUID *identifier;
  uint64_t v12;
  NSUUID *storeIdentifier;
  uint64_t v14;
  NSUUID *parentActivityIdentifier;
  uint64_t v16;
  NSDate *startDate;
  uint64_t v18;
  NSDate *endDate;
  uint64_t v20;
  NSString *phase;
  uint64_t v22;
  NSError *error;
  HMDCoreDataCloudKitSetupActivity *result;
  HMDCoreDataCloudKitSetupActivity *v25;
  SEL v26;
  objc_super v27;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v27.receiver = self;
    v27.super_class = (Class)HMDCoreDataCloudKitSetupActivity;
    v6 = -[HMDCoreDataCloudKitSetupActivity init](&v27, sel_init);
    if (v6)
    {
      objc_msgSend(v5, "hmf_stringForKey:", CFSTR("activityType"));
      v7 = objc_claimAutoreleasedReturnValue();
      activityType = v6->_activityType;
      v6->_activityType = (NSString *)v7;

      objc_msgSend(v5, "hmf_numberForKey:", CFSTR("eventType"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_eventType = objc_msgSend(v9, "integerValue");

      objc_msgSend(v5, "hmf_UUIDForKey:", CFSTR("identifier"));
      v10 = objc_claimAutoreleasedReturnValue();
      identifier = v6->_identifier;
      v6->_identifier = (NSUUID *)v10;

      objc_msgSend(v5, "hmf_UUIDForKey:", CFSTR("storeIdentifier"));
      v12 = objc_claimAutoreleasedReturnValue();
      storeIdentifier = v6->_storeIdentifier;
      v6->_storeIdentifier = (NSUUID *)v12;

      objc_msgSend(v5, "hmf_UUIDForKey:", CFSTR("parentActivityIdentifier"));
      v14 = objc_claimAutoreleasedReturnValue();
      parentActivityIdentifier = v6->_parentActivityIdentifier;
      v6->_parentActivityIdentifier = (NSUUID *)v14;

      objc_msgSend(v5, "hmf_dateForKey:", CFSTR("startDate"));
      v16 = objc_claimAutoreleasedReturnValue();
      startDate = v6->_startDate;
      v6->_startDate = (NSDate *)v16;

      objc_msgSend(v5, "hmf_dateForKey:", CFSTR("endDate"));
      v18 = objc_claimAutoreleasedReturnValue();
      endDate = v6->_endDate;
      v6->_endDate = (NSDate *)v18;

      objc_msgSend(v5, "hmf_stringForKey:", CFSTR("phase"));
      v20 = objc_claimAutoreleasedReturnValue();
      phase = v6->_phase;
      v6->_phase = (NSString *)v20;

      v6->_succeeded = objc_msgSend(v5, "hmf_BOOLForKey:", CFSTR("succeeded"));
      objc_msgSend(v5, "hmf_errorForKey:", CFSTR("error"));
      v22 = objc_claimAutoreleasedReturnValue();
      error = v6->_error;
      v6->_error = (NSError *)v22;

    }
    return v6;
  }
  else
  {
    v25 = (HMDCoreDataCloudKitSetupActivity *)_HMFPreconditionFailure();
    -[HMDCoreDataCloudKitSetupActivity dealloc](v25, v26);
  }
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)HMDCoreDataCloudKitSetupActivity;
  -[HMDCoreDataCloudKitSetupActivity dealloc](&v2, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDCoreDataCloudKitSetupActivity activityType](self, "activityType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCoreDataCloudKitSetupActivity phase](self, "phase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("activityType: %@ phase: %@ succeeded: %{BOOL}d"), v4, v5, -[HMDCoreDataCloudKitSetupActivity succeeded](self, "succeeded"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)activityType
{
  return self->_activityType;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSUUID)parentActivityIdentifier
{
  return self->_parentActivityIdentifier;
}

- (NSUUID)storeIdentifier
{
  return self->_storeIdentifier;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSString)phase
{
  return self->_phase;
}

- (BOOL)succeeded
{
  return self->_succeeded;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_phase, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_parentActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
}

@end
