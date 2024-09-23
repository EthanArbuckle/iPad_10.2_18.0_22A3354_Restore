@implementation HMDCameraClipsQuotaServerNotification

- (HMDCameraClipsQuotaServerNotification)initWithContainerIdentifier:(id)a3 reason:(int64_t)a4 requestID:(id)a5 userDSID:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  HMDCameraClipsQuotaServerNotification *v15;
  HMDCameraClipsQuotaServerNotification *v16;
  HMDCameraClipsQuotaServerNotification *v18;
  SEL v19;
  id v20;
  objc_super v21;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (!v11)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!a4)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v12)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  v14 = v13;
  if (!v13)
  {
LABEL_11:
    v18 = (HMDCameraClipsQuotaServerNotification *)_HMFPreconditionFailure();
    return -[HMDCameraClipsQuotaServerNotification initWithDictionaryRepresentation:](v18, v19, v20);
  }
  v21.receiver = self;
  v21.super_class = (Class)HMDCameraClipsQuotaServerNotification;
  v15 = -[HMDCameraClipsQuotaServerNotification init](&v21, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_containerIdentifier, a3);
    v16->_reason = a4;
    objc_storeStrong((id *)&v16->_requestID, a5);
    objc_storeStrong((id *)&v16->_userDSID, a6);
  }

  return v16;
}

- (HMDCameraClipsQuotaServerNotification)initWithDictionaryRepresentation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  HMDCameraClipsQuotaServerNotification *v10;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("hk"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("c"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("f"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("r"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("u"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = 0;
  if (v5 && v6 && v7 && v8)
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("allCamerasDisabled")))
    {
      self = -[HMDCameraClipsQuotaServerNotification initWithContainerIdentifier:reason:requestID:userDSID:](self, "initWithContainerIdentifier:reason:requestID:userDSID:", v5, 1, v7, v9);
      v10 = self;
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (NSDictionary)dictionaryRepresentation
{
  const __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  _QWORD v11[4];
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (-[HMDCameraClipsQuotaServerNotification reason](self, "reason") == 1)
    v3 = CFSTR("allCamerasDisabled");
  else
    v3 = 0;
  v12 = CFSTR("hk");
  v10[0] = CFSTR("c");
  -[HMDCameraClipsQuotaServerNotification containerIdentifier](self, "containerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v11[1] = v3;
  v10[1] = CFSTR("f");
  v10[2] = CFSTR("r");
  -[HMDCameraClipsQuotaServerNotification requestID](self, "requestID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  v10[3] = CFSTR("u");
  -[HMDCameraClipsQuotaServerNotification userDSID](self, "userDSID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v8;
}

- (NSString)containerIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)reason
{
  return self->_reason;
}

- (NSString)requestID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)userDSID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDSID, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
}

@end
