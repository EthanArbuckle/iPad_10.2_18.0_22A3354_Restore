@implementation DEDBugSessionConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[DEDBugSessionConfiguration finishingMove](self, "finishingMove"), CFSTR("finishingMove"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[DEDBugSessionConfiguration notifyingMove](self, "notifyingMove"), CFSTR("notifyingMove"));
  objc_msgSend(v4, "encodeBool:forKey:", -[DEDBugSessionConfiguration allowsCellularUpload](self, "allowsCellularUpload"), CFSTR("allowsCellularUpload"));
  -[DEDBugSessionConfiguration requestedCapabilitiesString](self, "requestedCapabilitiesString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("capabilities"));

  -[DEDBugSessionConfiguration seedingDeviceToken](self, "seedingDeviceToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("seedingDeviceToken"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[DEDBugSessionConfiguration seedingSubmissionType](self, "seedingSubmissionType"), CFSTR("seedingSubmissionType"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[DEDBugSessionConfiguration seedingSubmissionID](self, "seedingSubmissionID"), CFSTR("seedingSubmissionID"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[DEDBugSessionConfiguration seedingEnvironment](self, "seedingEnvironment"), CFSTR("seedingEnvironment"));
  -[DEDBugSessionConfiguration seedingHost](self, "seedingHost");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("seedingHost"));

  -[DEDBugSessionConfiguration radarProblemID](self, "radarProblemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("radarProblemID"));

  -[DEDBugSessionConfiguration radarAuthToken](self, "radarAuthToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("radarAuthToken"));

  -[DEDBugSessionConfiguration cloudkitContainer](self, "cloudkitContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("cloudkitContainer"));

  objc_msgSend(v4, "encodeBool:forKey:", -[DEDBugSessionConfiguration cloudkitUseDevelopmentEnvironment](self, "cloudkitUseDevelopmentEnvironment"), CFSTR("cloudkitUseDevelopmentEnvironment"));
  -[DEDBugSessionConfiguration cloudkitData](self, "cloudkitData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("cloudkitData"));

  -[DEDBugSessionConfiguration notifierConfiguration](self, "notifierConfiguration");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("notifierConfiguration"));

}

- (DEDBugSessionConfiguration)init
{
  DEDBugSessionConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DEDBugSessionConfiguration;
  result = -[DEDBugSessionConfiguration init](&v3, sel_init);
  if (result)
    result->_bugSessionStartTimeout = 20.0;
  return result;
}

- (DEDBugSessionConfiguration)initWithCoder:(id)a3
{
  id v4;
  DEDBugSessionConfiguration *v5;
  DEDBugSessionConfiguration *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSSet *requestedCapabilities;
  uint64_t v11;
  NSString *seedingDeviceToken;
  uint64_t v13;
  NSString *seedingHost;
  uint64_t v15;
  NSNumber *radarProblemID;
  uint64_t v17;
  NSString *radarAuthToken;
  uint64_t v19;
  NSString *cloudkitContainer;
  void *v21;
  uint64_t v22;
  NSDictionary *cloudkitData;
  uint64_t v24;
  DEDNotifierConfiguration *notifierConfiguration;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)DEDBugSessionConfiguration;
  v5 = -[DEDBugSessionConfiguration init](&v27, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_bugSessionStartTimeout = 20.0;
    v5->_finishingMove = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("finishingMove"));
    v6->_notifyingMove = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("notifyingMove"));
    v6->_allowsCellularUpload = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowsCellularUpload"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("capabilities"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 && !objc_msgSend(v7, "isEqualToString:", &stru_24D1E6AF0))
    {
      +[DEDCapability decodeCapabilitiesString:](DEDCapability, "decodeCapabilitiesString:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[DEDCapability defaultCapabilities](DEDCapability, "defaultCapabilities");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    requestedCapabilities = v6->_requestedCapabilities;
    v6->_requestedCapabilities = (NSSet *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("seedingDeviceToken"));
    v11 = objc_claimAutoreleasedReturnValue();
    seedingDeviceToken = v6->_seedingDeviceToken;
    v6->_seedingDeviceToken = (NSString *)v11;

    v6->_seedingSubmissionType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("seedingSubmissionType"));
    v6->_seedingSubmissionID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("seedingSubmissionID"));
    v6->_seedingEnvironment = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("seedingEnvironment"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("seedingHost"));
    v13 = objc_claimAutoreleasedReturnValue();
    seedingHost = v6->_seedingHost;
    v6->_seedingHost = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("radarProblemID"));
    v15 = objc_claimAutoreleasedReturnValue();
    radarProblemID = v6->_radarProblemID;
    v6->_radarProblemID = (NSNumber *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("radarAuthToken"));
    v17 = objc_claimAutoreleasedReturnValue();
    radarAuthToken = v6->_radarAuthToken;
    v6->_radarAuthToken = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cloudkitContainer"));
    v19 = objc_claimAutoreleasedReturnValue();
    cloudkitContainer = v6->_cloudkitContainer;
    v6->_cloudkitContainer = (NSString *)v19;

    v6->_cloudkitUseDevelopmentEnvironment = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cloudkitUseDevelopmentEnvironment"));
    objc_msgSend((id)objc_opt_class(), "archivedClasses");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("cloudkitData"));
    v22 = objc_claimAutoreleasedReturnValue();
    cloudkitData = v6->_cloudkitData;
    v6->_cloudkitData = (NSDictionary *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("notifierConfiguration"));
    v24 = objc_claimAutoreleasedReturnValue();
    notifierConfiguration = v6->_notifierConfiguration;
    v6->_notifierConfiguration = (DEDNotifierConfiguration *)v24;

  }
  return v6;
}

- (NSString)requestedCapabilitiesString
{
  NSSet *requestedCapabilities;
  NSSet *v4;
  NSSet *v5;

  requestedCapabilities = self->_requestedCapabilities;
  if (!requestedCapabilities)
  {
    +[DEDCapability defaultCapabilities](DEDCapability, "defaultCapabilities");
    v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v5 = self->_requestedCapabilities;
    self->_requestedCapabilities = v4;

    requestedCapabilities = self->_requestedCapabilities;
  }
  return (NSString *)+[DEDCapability encodeCapabilitySet:](DEDCapability, "encodeCapabilitySet:", requestedCapabilities);
}

- (void)requestCapabilitiesSet:(id)a3
{
  NSSet *v4;
  NSSet *requestedCapabilities;

  objc_msgSend(a3, "setByAddingObject:", CFSTR("classic"));
  v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
  requestedCapabilities = self->_requestedCapabilities;
  self->_requestedCapabilities = v4;

}

- (void)requestCapabilities:(id)a3
{
  id v4;
  NSSet *v5;
  id v6;
  void *v7;
  void *v8;
  id *v9;
  id v10;
  NSSet *requestedCapabilities;
  id *v12;
  uint64_t v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObject:", CFSTR("classic"));
  v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
  v12 = (id *)&v13;
  v6 = v4;
  v7 = v6;
  if (v6)
  {
    v8 = v6;
    do
    {
      -[NSSet addObject:](v5, "addObject:", v7);
      v9 = v12++;
      v10 = *v9;

      v8 = v10;
    }
    while (v10);
  }
  requestedCapabilities = self->_requestedCapabilities;
  self->_requestedCapabilities = v5;

}

- (id)requestedCapabilities
{
  NSSet *requestedCapabilities;
  NSSet *v4;
  NSSet *v5;

  requestedCapabilities = self->_requestedCapabilities;
  if (!requestedCapabilities)
  {
    +[DEDCapability defaultCapabilities](DEDCapability, "defaultCapabilities");
    v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v5 = self->_requestedCapabilities;
    self->_requestedCapabilities = v4;

    requestedCapabilities = self->_requestedCapabilities;
  }
  return (id)-[NSSet copy](requestedCapabilities, "copy");
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;
  void *v4;

  -[DEDBugSessionConfiguration secureArchive](self, "secureArchive", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDBugSessionConfiguration secureUnarchiveWithData:](DEDBugSessionConfiguration, "secureUnarchiveWithData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  DEDBugSessionConfiguration *v4;
  BOOL v5;

  v4 = (DEDBugSessionConfiguration *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[DEDBugSessionConfiguration isEqualToConfiguration:](self, "isEqualToConfiguration:", v4);
  }

  return v5;
}

- (BOOL)isEqualToConfiguration:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  int64_t v8;
  int64_t v9;
  int v10;
  char v11;
  void *v13;
  int v14;
  int64_t v15;
  int64_t v16;
  int64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  int v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  void *v65;

  v7 = a3;
  if (!v7
    || (v8 = -[DEDBugSessionConfiguration finishingMove](self, "finishingMove"), v8 != objc_msgSend(v7, "finishingMove"))
    || (v9 = -[DEDBugSessionConfiguration notifyingMove](self, "notifyingMove"), v9 != objc_msgSend(v7, "notifyingMove"))
    || (v10 = -[DEDBugSessionConfiguration allowsCellularUpload](self, "allowsCellularUpload"),
        v10 != objc_msgSend(v7, "allowsCellularUpload")))
  {
    v11 = 0;
    goto LABEL_6;
  }
  -[DEDBugSessionConfiguration seedingDeviceToken](self, "seedingDeviceToken");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 || (objc_msgSend(v7, "seedingDeviceToken"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[DEDBugSessionConfiguration seedingDeviceToken](self, "seedingDeviceToken");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "seedingDeviceToken");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqualToString:", v5) & 1) == 0)
    {

      v11 = 0;
      goto LABEL_22;
    }
    v14 = 1;
  }
  else
  {
    v14 = 0;
  }
  v15 = -[DEDBugSessionConfiguration seedingSubmissionID](self, "seedingSubmissionID");
  if (v15 == objc_msgSend(v7, "seedingSubmissionID"))
  {
    v16 = -[DEDBugSessionConfiguration seedingSubmissionType](self, "seedingSubmissionType");
    if (v16 == objc_msgSend(v7, "seedingSubmissionType"))
    {
      v17 = -[DEDBugSessionConfiguration seedingEnvironment](self, "seedingEnvironment");
      if (v17 == objc_msgSend(v7, "seedingEnvironment"))
      {
        -[DEDBugSessionConfiguration seedingHost](self, "seedingHost");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18 || (objc_msgSend(v7, "seedingHost"), (v60 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[DEDBugSessionConfiguration seedingHost](self, "seedingHost");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "seedingHost");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v19, "isEqualToString:"))
          {
            v11 = 0;
            goto LABEL_87;
          }
          v58 = v19;
          v64 = 1;
        }
        else
        {
          v60 = 0;
          v64 = 0;
        }
        -[DEDBugSessionConfiguration radarProblemID](self, "radarProblemID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20 || (objc_msgSend(v7, "radarProblemID"), (v54 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[DEDBugSessionConfiguration radarProblemID](self, "radarProblemID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "radarProblemID");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = v21;
          if (!objc_msgSend(v21, "isEqualToNumber:"))
          {
            v11 = 0;
LABEL_82:

LABEL_83:
            if (!v20)

            if (!v64)
            {
LABEL_88:
              if (!v18)

              if (!v14)
                goto LABEL_22;
              goto LABEL_21;
            }
            v19 = v58;
LABEL_87:

            goto LABEL_88;
          }
          v57 = 1;
        }
        else
        {
          v54 = 0;
          v57 = 0;
        }
        -[DEDBugSessionConfiguration radarAuthToken](self, "radarAuthToken");
        v59 = objc_claimAutoreleasedReturnValue();
        if (v59 || (objc_msgSend(v7, "radarAuthToken"), (v50 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[DEDBugSessionConfiguration radarAuthToken](self, "radarAuthToken");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "radarAuthToken");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = v22;
          if (!objc_msgSend(v22, "isEqualToString:"))
          {
            v11 = 0;
LABEL_78:

            goto LABEL_79;
          }
          v23 = 1;
        }
        else
        {
          v50 = 0;
          v23 = 0;
        }
        v51 = v20;
        -[DEDBugSessionConfiguration cloudkitContainer](self, "cloudkitContainer");
        v53 = objc_claimAutoreleasedReturnValue();
        v52 = v23;
        if (v53 || (objc_msgSend(v7, "cloudkitContainer"), (v48 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[DEDBugSessionConfiguration cloudkitContainer](self, "cloudkitContainer");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "cloudkitContainer");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v24, "isEqualToString:", v20) & 1) == 0)
          {

            v25 = (void *)v53;
            if (!v53)
              v25 = v48;

            v11 = 0;
            v20 = v51;
            if ((v52 & 1) != 0)
              goto LABEL_78;
            goto LABEL_79;
          }
          v46 = v20;
          v47 = v24;
          v49 = 1;
        }
        else
        {
          v48 = 0;
          v49 = 0;
        }
        v26 = -[DEDBugSessionConfiguration cloudkitUseDevelopmentEnvironment](self, "cloudkitUseDevelopmentEnvironment");
        if (v26 != objc_msgSend(v7, "cloudkitUseDevelopmentEnvironment"))
        {
          v11 = 0;
          v27 = v52;
          if ((v49 & 1) == 0)
            goto LABEL_75;
          goto LABEL_74;
        }
        -[DEDBugSessionConfiguration cloudkitData](self, "cloudkitData");
        v27 = v52;
        v45 = objc_claimAutoreleasedReturnValue();
        if (v45 || (objc_msgSend(v7, "cloudkitData"), (v40 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[DEDBugSessionConfiguration cloudkitData](self, "cloudkitData");
          v28 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "cloudkitData");
          v29 = objc_claimAutoreleasedReturnValue();
          v44 = (void *)v28;
          v30 = (void *)v28;
          v20 = (void *)v29;
          if (!objc_msgSend(v30, "isEqualToDictionary:", v29))
          {
            v11 = 0;
            goto LABEL_68;
          }
          v41 = 1;
        }
        else
        {
          v40 = 0;
          v41 = 0;
        }
        -[DEDBugSessionConfiguration requestedCapabilitiesString](self, "requestedCapabilitiesString");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "requestedCapabilitiesString");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v31;
        if (objc_msgSend(v31, "isEqualToString:"))
        {
          v39 = v20;
          v63 = v18;
          -[DEDBugSessionConfiguration notifierConfiguration](self, "notifierConfiguration");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (v32
            || (objc_msgSend(v7, "notifierConfiguration"), (v38 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            -[DEDBugSessionConfiguration notifierConfiguration](self, "notifierConfiguration");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "notifierConfiguration");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v33, "isEqual:", v34);

            if (v32)
            {

LABEL_66:
              if ((v41 & 1) != 0)
              {
                v18 = v63;
                v27 = v52;
                v20 = v39;
                goto LABEL_68;
              }
              v18 = v63;
LABEL_70:
              v27 = v52;
LABEL_71:
              v35 = (void *)v45;
              if (!v45)
              {

                v35 = 0;
              }

              if (!v49)
              {
LABEL_75:
                v36 = (void *)v53;
                v20 = v51;
                if (!v53)
                {

                  v36 = 0;
                }

                if (v27)
                  goto LABEL_78;
LABEL_79:
                v37 = (void *)v59;
                if (!v59)
                {

                  v37 = 0;
                }

                if (!v57)
                  goto LABEL_83;
                goto LABEL_82;
              }
LABEL_74:

              goto LABEL_75;
            }
          }
          else
          {
            v38 = 0;
            v11 = 1;
          }

          goto LABEL_66;
        }

        v11 = 0;
        if ((v41 & 1) == 0)
          goto LABEL_70;
        v27 = v52;
LABEL_68:

        goto LABEL_71;
      }
    }
  }
  v11 = 0;
  if ((v14 & 1) != 0)
  {
LABEL_21:

  }
LABEL_22:
  if (!v13)
  {

    v13 = 0;
  }

LABEL_6:
  return v11;
}

+ (id)archivedClasses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v2 = (void *)MEMORY[0x24BDBCEF0];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEDNotifierConfiguration archivedClasses](DEDNotifierConfiguration, "archivedClasses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unionSet:", v9);

  return v8;
}

- (id)secureArchive
{
  void *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v13;

  v13 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v13);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v13;
  if (v3)
  {
    +[DEDUtils sharedLog](DEDUtils, "sharedLog");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[DEDBugSessionConfiguration secureArchive].cold.1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

    v11 = 0;
  }
  else
  {
    v11 = v2;
  }

  return v11;
}

+ (id)secureUnarchiveWithData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v17;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD1620];
    +[DEDBugSessionConfiguration archivedClasses](DEDBugSessionConfiguration, "archivedClasses");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v4, "unarchivedObjectOfClasses:fromData:error:", v5, v3, &v17);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v17;

    if (v7)
    {
      +[DEDUtils sharedLog](DEDUtils, "sharedLog");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        +[DEDBugSessionConfiguration secureUnarchiveWithData:].cold.2((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);

      v15 = 0;
    }
    else
    {
      v15 = v6;
    }

  }
  else
  {
    +[DEDUtils sharedLog](DEDUtils, "sharedLog");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[DEDBugSessionConfiguration secureUnarchiveWithData:].cold.1(v7);
    v15 = 0;
  }

  return v15;
}

- (int64_t)finishingMove
{
  return self->_finishingMove;
}

- (void)setFinishingMove:(int64_t)a3
{
  self->_finishingMove = a3;
}

- (int64_t)notifyingMove
{
  return self->_notifyingMove;
}

- (void)setNotifyingMove:(int64_t)a3
{
  self->_notifyingMove = a3;
}

- (BOOL)allowsCellularUpload
{
  return self->_allowsCellularUpload;
}

- (void)setAllowsCellularUpload:(BOOL)a3
{
  self->_allowsCellularUpload = a3;
}

- (double)bugSessionStartTimeout
{
  return self->_bugSessionStartTimeout;
}

- (void)setBugSessionStartTimeout:(double)a3
{
  self->_bugSessionStartTimeout = a3;
}

- (NSString)seedingDeviceToken
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSeedingDeviceToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (int64_t)seedingSubmissionID
{
  return self->_seedingSubmissionID;
}

- (void)setSeedingSubmissionID:(int64_t)a3
{
  self->_seedingSubmissionID = a3;
}

- (int64_t)seedingSubmissionType
{
  return self->_seedingSubmissionType;
}

- (void)setSeedingSubmissionType:(int64_t)a3
{
  self->_seedingSubmissionType = a3;
}

- (int64_t)seedingEnvironment
{
  return self->_seedingEnvironment;
}

- (void)setSeedingEnvironment:(int64_t)a3
{
  self->_seedingEnvironment = a3;
}

- (NSString)seedingHost
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setSeedingHost:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSNumber)radarProblemID
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setRadarProblemID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSString)radarAuthToken
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setRadarAuthToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSString)cloudkitContainer
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setCloudkitContainer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (BOOL)cloudkitUseDevelopmentEnvironment
{
  return self->_cloudkitUseDevelopmentEnvironment;
}

- (void)setCloudkitUseDevelopmentEnvironment:(BOOL)a3
{
  self->_cloudkitUseDevelopmentEnvironment = a3;
}

- (NSDictionary)cloudkitData
{
  return (NSDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setCloudkitData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (DEDNotifierConfiguration)notifierConfiguration
{
  return (DEDNotifierConfiguration *)objc_getProperty(self, a2, 120, 1);
}

- (void)setNotifierConfiguration:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifierConfiguration, 0);
  objc_storeStrong((id *)&self->_cloudkitData, 0);
  objc_storeStrong((id *)&self->_cloudkitContainer, 0);
  objc_storeStrong((id *)&self->_radarAuthToken, 0);
  objc_storeStrong((id *)&self->_radarProblemID, 0);
  objc_storeStrong((id *)&self->_seedingHost, 0);
  objc_storeStrong((id *)&self->_seedingDeviceToken, 0);
  objc_storeStrong((id *)&self->_requestedCapabilities, 0);
}

- (void)secureArchive
{
  OUTLINED_FUNCTION_2(&dword_21469E000, a2, a3, "failed to archive config with error: [%{public}@]", a5, a6, a7, a8, 2u);
}

+ (void)secureUnarchiveWithData:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21469E000, log, OS_LOG_TYPE_ERROR, "failed to unarchive config data with error: given data is nil", v1, 2u);
}

+ (void)secureUnarchiveWithData:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_21469E000, a2, a3, "failed to unarchive config data with error: [%{public}@]", a5, a6, a7, a8, 2u);
}

@end
