@implementation IDSKTOptInOutRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSKTOptInOutRequest)initWithCoder:(id)a3
{
  id v4;
  IDSKTOptInOutRequest *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  double v9;
  uint64_t v10;
  NSDictionary *applicationsToOptInStatusData;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IDSKTOptInOutRequest;
  v5 = -[IDSKTOptInOutRequest init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    objc_msgSend_decodeDictionaryWithKeysOfClass_objectsOfClass_forKey_(v4, v8, v6, v9, v7, CFSTR("ReqAppToOptInStatusDataKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    applicationsToOptInStatusData = v5->_applicationsToOptInStatusData;
    v5->_applicationsToOptInStatusData = (NSDictionary *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double v3;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_applicationsToOptInStatusData, v3, CFSTR("ReqAppToOptInStatusDataKey"));
}

- (id)description
{
  double v2;

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("<IDSKTOptInOutRequest: %p, applicationsToOptInStatusData: %@>"), v2, self, self->_applicationsToOptInStatusData);
}

- (NSDictionary)applicationsToOptInStatusData
{
  return self->_applicationsToOptInStatusData;
}

- (void)setApplicationsToOptInStatusData:(id)a3
{
  objc_storeStrong((id *)&self->_applicationsToOptInStatusData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationsToOptInStatusData, 0);
}

@end
