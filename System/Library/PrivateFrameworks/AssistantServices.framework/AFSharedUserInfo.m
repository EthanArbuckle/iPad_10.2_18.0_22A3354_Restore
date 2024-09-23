@implementation AFSharedUserInfo

- (AFSharedUserInfo)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFSharedUserInfoMutation *);
  AFSharedUserInfo *v5;
  AFSharedUserInfo *v6;
  _AFSharedUserInfoMutation *v7;
  void *v8;
  uint64_t v9;
  NSString *sharedUserId;
  void *v11;
  uint64_t v12;
  NSString *loggableSharedUserId;
  void *v14;
  uint64_t v15;
  AFCompanionDeviceInfo *companionDeviceInfo;
  void *v17;
  uint64_t v18;
  NSString *homeUserId;
  void *v20;
  uint64_t v21;
  NSString *iCloudAltDSID;
  objc_super v24;

  v4 = (void (**)(id, _AFSharedUserInfoMutation *))a3;
  v24.receiver = self;
  v24.super_class = (Class)AFSharedUserInfo;
  v5 = -[AFSharedUserInfo init](&v24, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFSharedUserInfoMutation initWithBase:]([_AFSharedUserInfoMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFSharedUserInfoMutation isDirty](v7, "isDirty"))
    {
      -[_AFSharedUserInfoMutation getSharedUserId](v7, "getSharedUserId");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      sharedUserId = v6->_sharedUserId;
      v6->_sharedUserId = (NSString *)v9;

      -[_AFSharedUserInfoMutation getLoggableSharedUserId](v7, "getLoggableSharedUserId");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      loggableSharedUserId = v6->_loggableSharedUserId;
      v6->_loggableSharedUserId = (NSString *)v12;

      -[_AFSharedUserInfoMutation getCompanionDeviceInfo](v7, "getCompanionDeviceInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "copy");
      companionDeviceInfo = v6->_companionDeviceInfo;
      v6->_companionDeviceInfo = (AFCompanionDeviceInfo *)v15;

      v6->_personalRequestsEnabled = -[_AFSharedUserInfoMutation getPersonalRequestsEnabled](v7, "getPersonalRequestsEnabled");
      v6->_companionLinkReady = -[_AFSharedUserInfoMutation getCompanionLinkReady](v7, "getCompanionLinkReady");
      -[_AFSharedUserInfoMutation getHomeUserId](v7, "getHomeUserId");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "copy");
      homeUserId = v6->_homeUserId;
      v6->_homeUserId = (NSString *)v18;

      -[_AFSharedUserInfoMutation getICloudAltDSID](v7, "getICloudAltDSID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "copy");
      iCloudAltDSID = v6->_iCloudAltDSID;
      v6->_iCloudAltDSID = (NSString *)v21;

    }
  }

  return v6;
}

- (AFSharedUserInfo)init
{
  return -[AFSharedUserInfo initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFSharedUserInfo)initWithSharedUserId:(id)a3 loggableSharedUserId:(id)a4 companionDeviceInfo:(id)a5 personalRequestsEnabled:(BOOL)a6 companionLinkReady:(BOOL)a7 homeUserId:(id)a8 iCloudAltDSID:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  AFSharedUserInfo *v25;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  BOOL v33;
  BOOL v34;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a8;
  v19 = a9;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __150__AFSharedUserInfo_initWithSharedUserId_loggableSharedUserId_companionDeviceInfo_personalRequestsEnabled_companionLinkReady_homeUserId_iCloudAltDSID___block_invoke;
  v27[3] = &unk_1E3A32278;
  v28 = v15;
  v29 = v16;
  v33 = a6;
  v34 = a7;
  v30 = v17;
  v31 = v18;
  v32 = v19;
  v20 = v19;
  v21 = v18;
  v22 = v17;
  v23 = v16;
  v24 = v15;
  v25 = -[AFSharedUserInfo initWithBuilder:](self, "initWithBuilder:", v27);

  return v25;
}

- (id)description
{
  return -[AFSharedUserInfo _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  objc_super v11;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v11.receiver = self;
  v11.super_class = (Class)AFSharedUserInfo;
  -[AFSharedUserInfo description](&v11, sel_description);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = CFSTR("YES");
  if (self->_personalRequestsEnabled)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (!self->_companionLinkReady)
    v7 = CFSTR("NO");
  v9 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {sharedUserId = %@, loggableSharedUserId = %@, companionDeviceInfo = %@, personalRequestsEnabled = %@, companionLinkReady = %@, homeUserId = %@, iCloudAltDSID = %@}"), v5, *(_OWORD *)&self->_sharedUserId, self->_companionDeviceInfo, v8, v7, self->_homeUserId, self->_iCloudAltDSID);

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;

  v3 = -[NSString hash](self->_sharedUserId, "hash");
  v4 = -[NSString hash](self->_loggableSharedUserId, "hash") ^ v3;
  v5 = v4 ^ -[AFCompanionDeviceInfo hash](self->_companionDeviceInfo, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_personalRequestsEnabled);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_companionLinkReady);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  v10 = v7 ^ v9 ^ -[NSString hash](self->_homeUserId, "hash");
  v11 = v10 ^ -[NSString hash](self->_iCloudAltDSID, "hash");

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  AFSharedUserInfo *v4;
  AFSharedUserInfo *v5;
  _BOOL4 personalRequestsEnabled;
  _BOOL4 companionLinkReady;
  NSString *v8;
  NSString *sharedUserId;
  NSString *v10;
  NSString *loggableSharedUserId;
  AFCompanionDeviceInfo *v12;
  AFCompanionDeviceInfo *companionDeviceInfo;
  NSString *v14;
  NSString *homeUserId;
  NSString *v16;
  NSString *iCloudAltDSID;
  BOOL v18;

  v4 = (AFSharedUserInfo *)a3;
  if (self == v4)
  {
    v18 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      personalRequestsEnabled = self->_personalRequestsEnabled;
      if (personalRequestsEnabled == -[AFSharedUserInfo personalRequestsEnabled](v5, "personalRequestsEnabled")
        && (companionLinkReady = self->_companionLinkReady,
            companionLinkReady == -[AFSharedUserInfo companionLinkReady](v5, "companionLinkReady")))
      {
        -[AFSharedUserInfo sharedUserId](v5, "sharedUserId");
        v8 = (NSString *)objc_claimAutoreleasedReturnValue();
        sharedUserId = self->_sharedUserId;
        if (sharedUserId == v8 || -[NSString isEqual:](sharedUserId, "isEqual:", v8))
        {
          -[AFSharedUserInfo loggableSharedUserId](v5, "loggableSharedUserId");
          v10 = (NSString *)objc_claimAutoreleasedReturnValue();
          loggableSharedUserId = self->_loggableSharedUserId;
          if (loggableSharedUserId == v10 || -[NSString isEqual:](loggableSharedUserId, "isEqual:", v10))
          {
            -[AFSharedUserInfo companionDeviceInfo](v5, "companionDeviceInfo");
            v12 = (AFCompanionDeviceInfo *)objc_claimAutoreleasedReturnValue();
            companionDeviceInfo = self->_companionDeviceInfo;
            if (companionDeviceInfo == v12 || -[AFCompanionDeviceInfo isEqual:](companionDeviceInfo, "isEqual:", v12))
            {
              -[AFSharedUserInfo homeUserId](v5, "homeUserId");
              v14 = (NSString *)objc_claimAutoreleasedReturnValue();
              homeUserId = self->_homeUserId;
              if (homeUserId == v14 || -[NSString isEqual:](homeUserId, "isEqual:", v14))
              {
                -[AFSharedUserInfo iCloudAltDSID](v5, "iCloudAltDSID");
                v16 = (NSString *)objc_claimAutoreleasedReturnValue();
                iCloudAltDSID = self->_iCloudAltDSID;
                v18 = iCloudAltDSID == v16 || -[NSString isEqual:](iCloudAltDSID, "isEqual:", v16);

              }
              else
              {
                v18 = 0;
              }

            }
            else
            {
              v18 = 0;
            }

          }
          else
          {
            v18 = 0;
          }

        }
        else
        {
          v18 = 0;
        }

      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      v18 = 0;
    }
  }

  return v18;
}

- (AFSharedUserInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  AFSharedUserInfo *v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSharedUserInfo::sharedUserId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSharedUserInfo::loggableSharedUserId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSharedUserInfo::companionDeviceInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSharedUserInfo::personalRequestsEnabled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSharedUserInfo::companionLinkReady"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSharedUserInfo::homeUserId"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSharedUserInfo::iCloudAltDSID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[AFSharedUserInfo initWithSharedUserId:loggableSharedUserId:companionDeviceInfo:personalRequestsEnabled:companionLinkReady:homeUserId:iCloudAltDSID:](self, "initWithSharedUserId:loggableSharedUserId:companionDeviceInfo:personalRequestsEnabled:companionLinkReady:homeUserId:iCloudAltDSID:", v5, v6, v7, v9, v11, v12, v13);
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *sharedUserId;
  void *v5;
  void *v6;
  id v7;

  sharedUserId = self->_sharedUserId;
  v7 = a3;
  objc_msgSend(v7, "encodeObject:forKey:", sharedUserId, CFSTR("AFSharedUserInfo::sharedUserId"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_loggableSharedUserId, CFSTR("AFSharedUserInfo::loggableSharedUserId"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_companionDeviceInfo, CFSTR("AFSharedUserInfo::companionDeviceInfo"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_personalRequestsEnabled);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("AFSharedUserInfo::personalRequestsEnabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_companionLinkReady);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("AFSharedUserInfo::companionLinkReady"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_homeUserId, CFSTR("AFSharedUserInfo::homeUserId"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_iCloudAltDSID, CFSTR("AFSharedUserInfo::iCloudAltDSID"));

}

- (NSString)sharedUserId
{
  return self->_sharedUserId;
}

- (NSString)loggableSharedUserId
{
  return self->_loggableSharedUserId;
}

- (AFCompanionDeviceInfo)companionDeviceInfo
{
  return self->_companionDeviceInfo;
}

- (BOOL)personalRequestsEnabled
{
  return self->_personalRequestsEnabled;
}

- (BOOL)companionLinkReady
{
  return self->_companionLinkReady;
}

- (NSString)homeUserId
{
  return self->_homeUserId;
}

- (NSString)iCloudAltDSID
{
  return self->_iCloudAltDSID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iCloudAltDSID, 0);
  objc_storeStrong((id *)&self->_homeUserId, 0);
  objc_storeStrong((id *)&self->_companionDeviceInfo, 0);
  objc_storeStrong((id *)&self->_loggableSharedUserId, 0);
  objc_storeStrong((id *)&self->_sharedUserId, 0);
}

void __150__AFSharedUserInfo_initWithSharedUserId_loggableSharedUserId_companionDeviceInfo_personalRequestsEnabled_companionLinkReady_homeUserId_iCloudAltDSID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setSharedUserId:", v3);
  objc_msgSend(v4, "setLoggableSharedUserId:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setCompanionDeviceInfo:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "setPersonalRequestsEnabled:", *(unsigned __int8 *)(a1 + 72));
  objc_msgSend(v4, "setCompanionLinkReady:", *(unsigned __int8 *)(a1 + 73));
  objc_msgSend(v4, "setHomeUserId:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v4, "setICloudAltDSID:", *(_QWORD *)(a1 + 64));

}

+ (id)newWithBuilder:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBuilder:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _AFSharedUserInfoMutation *);
  _AFSharedUserInfoMutation *v5;
  AFSharedUserInfo *v6;
  void *v7;
  uint64_t v8;
  NSString *sharedUserId;
  void *v10;
  uint64_t v11;
  NSString *loggableSharedUserId;
  void *v13;
  uint64_t v14;
  AFCompanionDeviceInfo *companionDeviceInfo;
  void *v16;
  uint64_t v17;
  NSString *homeUserId;
  void *v19;
  uint64_t v20;
  NSString *iCloudAltDSID;

  v4 = (void (**)(id, _AFSharedUserInfoMutation *))a3;
  if (v4)
  {
    v5 = -[_AFSharedUserInfoMutation initWithBase:]([_AFSharedUserInfoMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFSharedUserInfoMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFSharedUserInfo);
      -[_AFSharedUserInfoMutation getSharedUserId](v5, "getSharedUserId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      sharedUserId = v6->_sharedUserId;
      v6->_sharedUserId = (NSString *)v8;

      -[_AFSharedUserInfoMutation getLoggableSharedUserId](v5, "getLoggableSharedUserId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      loggableSharedUserId = v6->_loggableSharedUserId;
      v6->_loggableSharedUserId = (NSString *)v11;

      -[_AFSharedUserInfoMutation getCompanionDeviceInfo](v5, "getCompanionDeviceInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copy");
      companionDeviceInfo = v6->_companionDeviceInfo;
      v6->_companionDeviceInfo = (AFCompanionDeviceInfo *)v14;

      v6->_personalRequestsEnabled = -[_AFSharedUserInfoMutation getPersonalRequestsEnabled](v5, "getPersonalRequestsEnabled");
      v6->_companionLinkReady = -[_AFSharedUserInfoMutation getCompanionLinkReady](v5, "getCompanionLinkReady");
      -[_AFSharedUserInfoMutation getHomeUserId](v5, "getHomeUserId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "copy");
      homeUserId = v6->_homeUserId;
      v6->_homeUserId = (NSString *)v17;

      -[_AFSharedUserInfoMutation getICloudAltDSID](v5, "getICloudAltDSID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "copy");
      iCloudAltDSID = v6->_iCloudAltDSID;
      v6->_iCloudAltDSID = (NSString *)v20;

    }
    else
    {
      v6 = (AFSharedUserInfo *)-[AFSharedUserInfo copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFSharedUserInfo *)-[AFSharedUserInfo copy](self, "copy");
  }

  return v6;
}

@end
