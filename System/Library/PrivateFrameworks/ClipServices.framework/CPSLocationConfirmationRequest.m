@implementation CPSLocationConfirmationRequest

- (CPSLocationConfirmationRequest)initWithRequestState:(int64_t)a3 clipBundleID:(id)a4 applicationName:(id)a5 deviceLocation:(id)a6 expectedRegion:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  CPSLocationConfirmationRequest *v17;
  CPSLocationConfirmationRequest *v18;
  CPSLocationConfirmationRequest *v19;
  objc_super v21;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)CPSLocationConfirmationRequest;
  v17 = -[CPSLocationConfirmationRequest init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_requestState = a3;
    objc_storeStrong((id *)&v17->_clipBundleID, a4);
    objc_storeStrong((id *)&v18->_applicationName, a5);
    objc_storeStrong((id *)&v18->_deviceLocation, a6);
    objc_storeStrong((id *)&v18->_expectedRegion, a7);
    v19 = v18;
  }

  return v18;
}

- (CPSLocationConfirmationRequest)initWithCoder:(id)a3
{
  id v4;
  CPSLocationConfirmationRequest *v5;
  uint64_t v6;
  NSString *clipBundleID;
  uint64_t v8;
  NSString *applicationName;
  uint64_t v10;
  CLLocation *deviceLocation;
  uint64_t v12;
  CLRegion *expectedRegion;
  CPSLocationConfirmationRequest *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CPSLocationConfirmationRequest;
  v5 = -[CPSLocationConfirmationRequest init](&v16, sel_init);
  if (v5)
  {
    v5->_requestState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("codeType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clipBundleID"));
    v6 = objc_claimAutoreleasedReturnValue();
    clipBundleID = v5->_clipBundleID;
    v5->_clipBundleID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationName"));
    v8 = objc_claimAutoreleasedReturnValue();
    applicationName = v5->_applicationName;
    v5->_applicationName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceLocation"));
    v10 = objc_claimAutoreleasedReturnValue();
    deviceLocation = v5->_deviceLocation;
    v5->_deviceLocation = (CLLocation *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expectedRegion"));
    v12 = objc_claimAutoreleasedReturnValue();
    expectedRegion = v5->_expectedRegion;
    v5->_expectedRegion = (CLRegion *)v12;

    v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t requestState;
  id v5;

  requestState = self->_requestState;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", requestState, CFSTR("codeType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clipBundleID, CFSTR("clipBundleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_applicationName, CFSTR("applicationName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceLocation, CFSTR("deviceLocation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expectedRegion, CFSTR("expectedRegion"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v4[1] = self->_requestState;
  v5 = -[NSString copy](self->_clipBundleID, "copy");
  v6 = (void *)v4[4];
  v4[4] = v5;

  v7 = -[NSString copy](self->_applicationName, "copy");
  v8 = (void *)v4[5];
  v4[5] = v7;

  v9 = -[CLLocation copy](self->_deviceLocation, "copy");
  v10 = (void *)v4[2];
  v4[2] = v9;

  v11 = -[CLRegion copy](self->_expectedRegion, "copy");
  v12 = (void *)v4[3];
  v4[3] = v11;

  return v4;
}

- (int64_t)requestState
{
  return self->_requestState;
}

- (CLLocation)deviceLocation
{
  return self->_deviceLocation;
}

- (CLRegion)expectedRegion
{
  return self->_expectedRegion;
}

- (NSString)clipBundleID
{
  return self->_clipBundleID;
}

- (NSString)applicationName
{
  return self->_applicationName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationName, 0);
  objc_storeStrong((id *)&self->_clipBundleID, 0);
  objc_storeStrong((id *)&self->_expectedRegion, 0);
  objc_storeStrong((id *)&self->_deviceLocation, 0);
}

@end
