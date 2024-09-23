@implementation HMBShareInvitation

- (HMBShareInvitation)initWithURL:(id)a3 token:(id)a4 context:(id)a5 cloudZoneID:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  HMBShareInvitation *v16;

  v10 = (void *)MEMORY[0x1E0C99D68];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v10, "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HMBShareInvitation initWithURL:token:context:cloudZoneID:dateCreated:](self, "initWithURL:token:context:cloudZoneID:dateCreated:", v14, v13, v12, v11, v15);

  return v16;
}

- (HMBShareInvitation)initWithURL:(id)a3 token:(id)a4 context:(id)a5 cloudZoneID:(id)a6 dateCreated:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HMBShareInvitation *v17;
  HMBShareInvitation *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HMBShareInvitation;
  v17 = -[HMBShareInvitation init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_shareURL, a3);
    objc_storeStrong((id *)&v18->_token, a4);
    objc_storeStrong((id *)&v18->_context, a5);
    objc_storeStrong((id *)&v18->_cloudZoneID, a6);
    objc_storeStrong((id *)&v18->_dateCreated, a7);
  }

  return v18;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  _QWORD v20[6];

  v20[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBShareInvitation shareURL](self, "shareURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Share URL"), v19);
  v20[0] = v4;
  v5 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBShareInvitation token](self, "token");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("Token"), v6);
  v20[1] = v7;
  v8 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBShareInvitation context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("Context"), v9);
  v20[2] = v10;
  v11 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBShareInvitation cloudZoneID](self, "cloudZoneID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithName:value:", CFSTR("Cloud Zone ID"), v12);
  v20[3] = v13;
  v14 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBShareInvitation dateCreated](self, "dateCreated");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithName:value:", CFSTR("Date Created"), v15);
  v20[4] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMBShareInvitation shareURL](self, "shareURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shareURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8))
    {
      -[HMBShareInvitation token](self, "token");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "token");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqual:", v10))
      {
        -[HMBShareInvitation context](self, "context");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "context");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqual:", v12))
        {
          -[HMBShareInvitation cloudZoneID](self, "cloudZoneID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "cloudZoneID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "isEqual:"))
          {
            -[HMBShareInvitation dateCreated](self, "dateCreated");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "dateCreated");
            v18 = v13;
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v17, "isEqualToDate:", v14);

            v13 = v18;
          }
          else
          {
            v15 = 0;
          }

        }
        else
        {
          v15 = 0;
        }

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;

  -[HMBShareInvitation shareURL](self, "shareURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[HMBShareInvitation token](self, "token");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  -[HMBShareInvitation context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  -[HMBShareInvitation cloudZoneID](self, "cloudZoneID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  -[HMBShareInvitation dateCreated](self, "dateCreated");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash");

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[HMBShareInvitation shareURL](self, "shareURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMBUI.u"));

  -[HMBShareInvitation token](self, "token");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMBUI.t"));

  -[HMBShareInvitation context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("HMBUI.c"));

  -[HMBShareInvitation cloudZoneID](self, "cloudZoneID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("HMBUI.czi"));

  -[HMBShareInvitation dateCreated](self, "dateCreated");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("HMBUI.dc"));

}

- (HMBShareInvitation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  HMBShareInvitation *v11;
  HMBShareInvitation *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMBUI.u"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMBUI.t"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMBUI.c"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMBUI.czi"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMBUI.dc"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v5 && v6 && v7 && v8 && v9)
  {
    v11 = -[HMBShareInvitation initWithURL:token:context:cloudZoneID:dateCreated:](self, "initWithURL:token:context:cloudZoneID:dateCreated:", v5, v6, v7, v8, v9);
    v12 = v11;
  }
  else
  {
    v13 = (void *)MEMORY[0x1D17B6230]();
    v11 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138544642;
      v18 = v15;
      v19 = 2112;
      v20 = v5;
      v21 = 2112;
      v22 = v6;
      v23 = 2112;
      v24 = v7;
      v25 = 2112;
      v26 = v8;
      v27 = 2112;
      v28 = v10;
      _os_log_impl(&dword_1CCD48000, v14, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded shareURL: %@ token: %@ context: %@ cloudZoneID: %@ dateCreated: %@", (uint8_t *)&v17, 0x3Eu);

    }
    objc_autoreleasePoolPop(v13);
    v12 = 0;
  }

  return v12;
}

- (HMBShareInvitationContext)context
{
  return self->_context;
}

- (HMBCloudZoneID)cloudZoneID
{
  return self->_cloudZoneID;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (CKDeviceToDeviceShareInvitationToken)token
{
  return self->_token;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_cloudZoneID, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
