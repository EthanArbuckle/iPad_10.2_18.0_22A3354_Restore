@implementation DEPDeviceUploadSubmitDeviceRequestPayload

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DEPDeviceUploadSubmitDeviceRequestPayload)initWithOrgId:(id)a3 orgName:(id)a4 requestType:(id)a5 submitter:(id)a6 approver:(id)a7 soldToId:(id)a8
{
  id v15;
  id v16;
  id v17;
  DEPDeviceUploadSubmitDeviceRequestPayload *v18;
  DEPDeviceUploadSubmitDeviceRequestPayload *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)DEPDeviceUploadSubmitDeviceRequestPayload;
  v18 = -[DEPDeviceUploadSubmitDeviceRequestPayload init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_orgId, a3);
    objc_storeStrong((id *)&v19->_orgName, a4);
    objc_storeStrong((id *)&v19->_requestType, a5);
    objc_storeStrong((id *)&v19->_submitter, a6);
    objc_storeStrong((id *)&v19->_approver, a7);
    objc_storeStrong((id *)&v19->_soldToId, a8);
  }

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *orgId;
  id v5;

  orgId = self->_orgId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", orgId, CFSTR("orgId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_orgName, CFSTR("orgName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_requestType, CFSTR("requestType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_submitter, CFSTR("submitter"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_soldToId, CFSTR("soldToId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_approver, CFSTR("approver"));

}

- (DEPDeviceUploadSubmitDeviceRequestPayload)initWithCoder:(id)a3
{
  id v4;
  DEPDeviceUploadSubmitDeviceRequestPayload *v5;
  uint64_t v6;
  NSString *orgId;
  uint64_t v8;
  NSString *orgName;
  uint64_t v10;
  DEPDeviceUploadRequestType *requestType;
  uint64_t v12;
  DEPDeviceUploadUser *submitter;
  uint64_t v14;
  DEPDeviceUploadUser *approver;
  uint64_t v16;
  NSString *soldToId;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)DEPDeviceUploadSubmitDeviceRequestPayload;
  v5 = -[DEPDeviceUploadSubmitDeviceRequestPayload init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("orgId"));
    v6 = objc_claimAutoreleasedReturnValue();
    orgId = v5->_orgId;
    v5->_orgId = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("orgName"));
    v8 = objc_claimAutoreleasedReturnValue();
    orgName = v5->_orgName;
    v5->_orgName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestType"));
    v10 = objc_claimAutoreleasedReturnValue();
    requestType = v5->_requestType;
    v5->_requestType = (DEPDeviceUploadRequestType *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("submitter"));
    v12 = objc_claimAutoreleasedReturnValue();
    submitter = v5->_submitter;
    v5->_submitter = (DEPDeviceUploadUser *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("approver"));
    v14 = objc_claimAutoreleasedReturnValue();
    approver = v5->_approver;
    v5->_approver = (DEPDeviceUploadUser *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("soldToId"));
    v16 = objc_claimAutoreleasedReturnValue();
    soldToId = v5->_soldToId;
    v5->_soldToId = (NSString *)v16;

  }
  return v5;
}

- (NSString)orgId
{
  return self->_orgId;
}

- (NSString)orgName
{
  return self->_orgName;
}

- (DEPDeviceUploadRequestType)requestType
{
  return self->_requestType;
}

- (DEPDeviceUploadUser)submitter
{
  return self->_submitter;
}

- (DEPDeviceUploadUser)approver
{
  return self->_approver;
}

- (NSString)soldToId
{
  return self->_soldToId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_soldToId, 0);
  objc_storeStrong((id *)&self->_approver, 0);
  objc_storeStrong((id *)&self->_submitter, 0);
  objc_storeStrong((id *)&self->_requestType, 0);
  objc_storeStrong((id *)&self->_orgName, 0);
  objc_storeStrong((id *)&self->_orgId, 0);
}

@end
