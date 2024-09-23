@implementation ULServiceStatus

- (ULServiceStatus)initWithServiceState:(unint64_t)a3 serviceSuspendReasons:(id)a4 serviceDescriptor:(id)a5 currentLocationOfInterestUuid:(id)a6 currentLocationOfInterestType:(id)a7 error:(id)a8 serviceQualityInfo:(id)a9 metaInfo:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  ULServiceStatus *v23;
  ULServiceStatus *v24;
  ULServiceStatus *v25;
  objc_super v27;

  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v27.receiver = self;
  v27.super_class = (Class)ULServiceStatus;
  v23 = -[ULServiceStatus init](&v27, sel_init);
  v24 = v23;
  if (v23)
  {
    -[ULServiceStatus setServiceState:](v23, "setServiceState:", a3);
    -[ULServiceStatus setServiceSuspendReasons:](v24, "setServiceSuspendReasons:", v16);
    -[ULServiceStatus setServiceDescriptor:](v24, "setServiceDescriptor:", v17);
    -[ULServiceStatus setCurrentLocationOfInterestUuid:](v24, "setCurrentLocationOfInterestUuid:", v18);
    -[ULServiceStatus setCurrentLocationOfInterestType:](v24, "setCurrentLocationOfInterestType:", v19);
    -[ULServiceStatus setError:](v24, "setError:", v20);
    -[ULServiceStatus setServiceQualityInfo:](v24, "setServiceQualityInfo:", v21);
    -[ULServiceStatus setMetaInfo:](v24, "setMetaInfo:", v22);
    v25 = v24;
  }

  return v24;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v4 = objc_alloc((Class)objc_opt_class());
  v5 = -[ULServiceStatus serviceState](self, "serviceState");
  -[ULServiceStatus serviceSuspendReasons](self, "serviceSuspendReasons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULServiceStatus serviceDescriptor](self, "serviceDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULServiceStatus currentLocationOfInterestUuid](self, "currentLocationOfInterestUuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULServiceStatus currentLocationOfInterestType](self, "currentLocationOfInterestType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULServiceStatus error](self, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULServiceStatus serviceQualityInfo](self, "serviceQualityInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULServiceStatus metaInfo](self, "metaInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v4, "initWithServiceState:serviceSuspendReasons:serviceDescriptor:currentLocationOfInterestUuid:currentLocationOfInterestType:error:serviceQualityInfo:metaInfo:", v5, v6, v7, v8, v9, v10, v11, v12);

  objc_msgSend(v13, "setServiceState:", -[ULServiceStatus serviceState](self, "serviceState"));
  -[ULServiceStatus serviceSuspendReasons](self, "serviceSuspendReasons");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copyWithZone:", a3);
  objc_msgSend(v13, "setServiceSuspendReasons:", v15);

  -[ULServiceStatus serviceDescriptor](self, "serviceDescriptor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copyWithZone:", a3);
  objc_msgSend(v13, "setServiceDescriptor:", v17);

  -[ULServiceStatus currentLocationOfInterestUuid](self, "currentLocationOfInterestUuid");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copyWithZone:", a3);
  objc_msgSend(v13, "setCurrentLocationOfInterestUuid:", v19);

  -[ULServiceStatus currentLocationOfInterestType](self, "currentLocationOfInterestType");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "copyWithZone:", a3);
  objc_msgSend(v13, "setCurrentLocationOfInterestType:", v21);

  -[ULServiceStatus error](self, "error");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "copyWithZone:", a3);
  objc_msgSend(v13, "setError:", v23);

  -[ULServiceStatus serviceQualityInfo](self, "serviceQualityInfo");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "copyWithZone:", a3);
  objc_msgSend(v13, "setServiceQualityInfo:", v25);

  -[ULServiceStatus metaInfo](self, "metaInfo");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v26, "copyWithZone:", a3);
  objc_msgSend(v13, "setMetaInfo:", v27);

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t serviceState;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x24BDD16E0];
  serviceState = self->_serviceState;
  v7 = a3;
  objc_msgSend(v4, "numberWithUnsignedInteger:", serviceState);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("serviceState"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_serviceSuspendReasons, CFSTR("serviceSuspendReasons"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_serviceDescriptor, CFSTR("serviceDescriptor"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_currentLocationOfInterestUuid, CFSTR("currentLocationOfInterestUuid"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_currentLocationOfInterestType, CFSTR("currentLocationOfInterestType"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_error, CFSTR("error"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_serviceQualityInfo, CFSTR("serviceQualityInfo"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_metaInfo, CFSTR("metaInfo"));

}

- (ULServiceStatus)initWithCoder:(id)a3
{
  id v4;
  ULServiceStatus *v5;
  ULServiceStatus *v6;
  ULServiceStatus *v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *serviceSuspendReasons;
  void *v11;
  uint64_t v12;
  ULServiceDescriptor *serviceDescriptor;
  void *v14;
  uint64_t v15;
  NSUUID *currentLocationOfInterestUuid;
  void *v17;
  uint64_t v18;
  ULLocationType *currentLocationOfInterestType;
  void *v20;
  uint64_t v21;
  NSError *error;
  void *v23;
  uint64_t v24;
  ULServiceQualityInfo *serviceQualityInfo;
  void *v26;
  uint64_t v27;
  ULServiceMetaInfo *metaInfo;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)ULServiceStatus;
  v5 = -[ULServiceStatus init](&v30, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceState"));
    v6 = (ULServiceStatus *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = -[ULServiceStatus unsignedIntegerValue](v6, "unsignedIntegerValue");

      v5->_serviceState = v8;
      objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("serviceSuspendReasons"));
      v7 = (ULServiceStatus *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_opt_self();
        v9 = objc_claimAutoreleasedReturnValue();

        serviceSuspendReasons = v5->_serviceSuspendReasons;
        v5->_serviceSuspendReasons = (NSArray *)v9;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceDescriptor"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v12 = objc_claimAutoreleasedReturnValue();

        serviceDescriptor = v5->_serviceDescriptor;
        v5->_serviceDescriptor = (ULServiceDescriptor *)v12;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentLocationOfInterestUuid"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v15 = objc_claimAutoreleasedReturnValue();

        currentLocationOfInterestUuid = v5->_currentLocationOfInterestUuid;
        v5->_currentLocationOfInterestUuid = (NSUUID *)v15;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentLocationOfInterestType"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v18 = objc_claimAutoreleasedReturnValue();

        currentLocationOfInterestType = v5->_currentLocationOfInterestType;
        v5->_currentLocationOfInterestType = (ULLocationType *)v18;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v21 = objc_claimAutoreleasedReturnValue();

        error = v5->_error;
        v5->_error = (NSError *)v21;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serviceQualityInfo"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v24 = objc_claimAutoreleasedReturnValue();

        serviceQualityInfo = v5->_serviceQualityInfo;
        v5->_serviceQualityInfo = (ULServiceQualityInfo *)v24;

        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metaInfo"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v27 = objc_claimAutoreleasedReturnValue();

        metaInfo = v5->_metaInfo;
        v5->_metaInfo = (ULServiceMetaInfo *)v27;

        v7 = v5;
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: "), v5);

  v7 = -[ULServiceStatus serviceState](self, "serviceState");
  v8 = CFSTR("Suspended");
  if (v7 != 1)
    v8 = CFSTR("Unknown");
  if (!v7)
    v8 = CFSTR("Running");
  objc_msgSend(v6, "appendFormat:", CFSTR(", serviceState: %@"), v8);
  objc_msgSend(v6, "appendFormat:", CFSTR(", serviceSuspendReasons: %@"), self->_serviceSuspendReasons);
  objc_msgSend(v6, "appendFormat:", CFSTR(", serviceDescriptor: %@"), self->_serviceDescriptor);
  objc_msgSend(v6, "appendFormat:", CFSTR(", currentLocationOfInterestUuid: %@"), self->_currentLocationOfInterestUuid);
  -[ULServiceStatus currentLocationOfInterestType](self, "currentLocationOfInterestType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[ULServiceStatus currentLocationOfInterestType](self, "currentLocationOfInterestType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ULLocationTypeToString(objc_msgSend(v10, "locationType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(", currentLocationOfInterestType: %@"), v11);

  }
  else
  {
    objc_msgSend(v6, "appendFormat:", CFSTR(", currentLocationOfInterestType: %@"), CFSTR("Unknown"));
  }

  objc_msgSend(v6, "appendFormat:", CFSTR(", error: %@"), self->_error);
  objc_msgSend(v6, "appendFormat:", CFSTR(", serviceQualityInfo: %@"), self->_serviceQualityInfo);
  objc_msgSend(v6, "appendFormat:", CFSTR(", metaInfo: %@"), self->_metaInfo);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  BOOL v37;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[ULServiceStatus serviceState](self, "serviceState");
    if (v6 == objc_msgSend(v5, "serviceState"))
    {
      -[ULServiceStatus serviceSuspendReasons](self, "serviceSuspendReasons");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "serviceSuspendReasons");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqual:", v8))
      {

      }
      else
      {
        -[ULServiceStatus serviceSuspendReasons](self, "serviceSuspendReasons");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "serviceSuspendReasons");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10 != v11)
          goto LABEL_22;
      }
      -[ULServiceStatus serviceDescriptor](self, "serviceDescriptor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "serviceDescriptor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "isEqual:", v13))
      {

      }
      else
      {
        -[ULServiceStatus serviceDescriptor](self, "serviceDescriptor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "serviceDescriptor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14 != v15)
          goto LABEL_22;
      }
      -[ULServiceStatus currentLocationOfInterestUuid](self, "currentLocationOfInterestUuid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "currentLocationOfInterestUuid");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "isEqual:", v17))
      {

      }
      else
      {
        -[ULServiceStatus currentLocationOfInterestUuid](self, "currentLocationOfInterestUuid");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "currentLocationOfInterestUuid");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18 != v19)
          goto LABEL_22;
      }
      -[ULServiceStatus currentLocationOfInterestType](self, "currentLocationOfInterestType");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "currentLocationOfInterestType");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "isEqual:", v21))
      {

      }
      else
      {
        -[ULServiceStatus currentLocationOfInterestType](self, "currentLocationOfInterestType");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "currentLocationOfInterestType");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22 != v23)
          goto LABEL_22;
      }
      -[ULServiceStatus error](self, "error");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "error");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v24, "isEqual:", v25))
      {

      }
      else
      {
        -[ULServiceStatus error](self, "error");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "error");
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26 != v27)
          goto LABEL_22;
      }
      -[ULServiceStatus serviceQualityInfo](self, "serviceQualityInfo");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "serviceQualityInfo");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v28, "isEqual:", v29))
      {

        goto LABEL_25;
      }
      -[ULServiceStatus serviceQualityInfo](self, "serviceQualityInfo");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "serviceQualityInfo");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30 == v31)
      {
LABEL_25:
        -[ULServiceStatus metaInfo](self, "metaInfo");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "metaInfo");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v33, "isEqual:", v34))
        {

          v9 = 1;
        }
        else
        {
          -[ULServiceStatus metaInfo](self, "metaInfo");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "metaInfo");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v35 != v36;

          v9 = !v37;
        }
        goto LABEL_23;
      }
    }
LABEL_22:
    v9 = 0;
LABEL_23:

    goto LABEL_24;
  }
  v9 = 0;
LABEL_24:

  return v9 & 1;
}

- (unint64_t)hash
{
  unint64_t serviceState;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;

  serviceState = self->_serviceState;
  v4 = -[NSArray hash](self->_serviceSuspendReasons, "hash") ^ serviceState;
  v5 = -[ULServiceDescriptor hash](self->_serviceDescriptor, "hash");
  v6 = v4 ^ v5 ^ -[NSUUID hash](self->_currentLocationOfInterestUuid, "hash");
  v7 = -[ULLocationType hash](self->_currentLocationOfInterestType, "hash");
  v8 = v7 ^ -[NSError hash](self->_error, "hash");
  v9 = v6 ^ v8 ^ -[ULServiceQualityInfo hash](self->_serviceQualityInfo, "hash");
  return v9 ^ -[ULServiceMetaInfo hash](self->_metaInfo, "hash");
}

- (ULServiceStatus)init
{
  __assert_rtn("-[ULServiceStatus init]", "ULConnectionDelegateTypes.m", 619, "NO");
}

+ (ULServiceStatus)new
{
  __assert_rtn("+[ULServiceStatus new]", "ULConnectionDelegateTypes.m", 624, "NO");
}

- (unint64_t)serviceState
{
  return self->_serviceState;
}

- (void)setServiceState:(unint64_t)a3
{
  self->_serviceState = a3;
}

- (NSArray)serviceSuspendReasons
{
  return self->_serviceSuspendReasons;
}

- (void)setServiceSuspendReasons:(id)a3
{
  objc_storeStrong((id *)&self->_serviceSuspendReasons, a3);
}

- (ULServiceDescriptor)serviceDescriptor
{
  return self->_serviceDescriptor;
}

- (void)setServiceDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_serviceDescriptor, a3);
}

- (NSUUID)currentLocationOfInterestUuid
{
  return self->_currentLocationOfInterestUuid;
}

- (void)setCurrentLocationOfInterestUuid:(id)a3
{
  objc_storeStrong((id *)&self->_currentLocationOfInterestUuid, a3);
}

- (ULLocationType)currentLocationOfInterestType
{
  return self->_currentLocationOfInterestType;
}

- (void)setCurrentLocationOfInterestType:(id)a3
{
  objc_storeStrong((id *)&self->_currentLocationOfInterestType, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (ULServiceQualityInfo)serviceQualityInfo
{
  return self->_serviceQualityInfo;
}

- (void)setServiceQualityInfo:(id)a3
{
  objc_storeStrong((id *)&self->_serviceQualityInfo, a3);
}

- (ULServiceMetaInfo)metaInfo
{
  return self->_metaInfo;
}

- (void)setMetaInfo:(id)a3
{
  objc_storeStrong((id *)&self->_metaInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metaInfo, 0);
  objc_storeStrong((id *)&self->_serviceQualityInfo, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_currentLocationOfInterestType, 0);
  objc_storeStrong((id *)&self->_currentLocationOfInterestUuid, 0);
  objc_storeStrong((id *)&self->_serviceDescriptor, 0);
  objc_storeStrong((id *)&self->_serviceSuspendReasons, 0);
}

@end
