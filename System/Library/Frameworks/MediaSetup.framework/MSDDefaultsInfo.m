@implementation MSDDefaultsInfo

- (MSDDefaultsInfo)initWithService:(id)a3 homeID:(id)a4 homeUserID:(id)a5
{
  id v9;
  id v10;
  id v11;
  MSDDefaultsInfo *v12;
  id *p_isa;
  MSDDefaultsInfo *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MSDDefaultsInfo;
  v12 = -[MSDDefaultsInfo init](&v16, sel_init);
  p_isa = (id *)&v12->super.isa;
  if (!v12)
    goto LABEL_5;
  v14 = 0;
  if (v9 && v11)
  {
    objc_storeStrong((id *)&v12->_service, a3);
    objc_storeStrong(p_isa + 5, a4);
    objc_storeStrong(p_isa + 6, a5);
LABEL_5:
    v14 = p_isa;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_homeID, CFSTR("homeID"));
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_homeUserID, CFSTR("homeUserID"));
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_recordName, CFSTR("recordName"));
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_recordType, CFSTR("recordType"));
  objc_msgSend(v3, "na_safeSetObject:forKey:", self->_recordZoneName, CFSTR("recordZoneName"));
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<MSDefaultsInfo: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (self->_service)
    objc_msgSend(v4, "appendFormat:", CFSTR("MediaService = %@>\n"), self->_service);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  MediaService *service;
  id v5;

  service = self->_service;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", service, CFSTR("kMediaServiceEncodeKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_homeID, CFSTR("kHomeIDEncodeKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_homeUserID, CFSTR("kHomeUserIDEncodeKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recordName, CFSTR("kRecordNameEncodeKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recordType, CFSTR("kRecordTypeEncodeKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recordZoneName, CFSTR("kRecordZoneNameEncodeKey"));

}

- (MSDDefaultsInfo)initWithCoder:(id)a3
{
  id v4;
  MediaService *v5;
  MediaService *service;
  NSUUID *v7;
  NSUUID *homeID;
  NSUUID *v9;
  NSUUID *homeUserID;
  MSDDefaultsInfo *v11;
  uint64_t v12;
  NSString *recordName;
  uint64_t v14;
  NSString *recordType;
  uint64_t v16;
  NSString *recordZoneName;
  MSDDefaultsInfo *v18;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kMediaServiceEncodeKey"));
  v5 = (MediaService *)objc_claimAutoreleasedReturnValue();
  service = self->_service;
  self->_service = v5;

  if (!self->_service)
    goto LABEL_6;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kHomeIDEncodeKey"));
  v7 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  homeID = self->_homeID;
  self->_homeID = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kHomeUserIDEncodeKey"));
  v9 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  homeUserID = self->_homeUserID;
  self->_homeUserID = v9;

  if (self->_homeUserID)
  {
    v11 = -[MSDDefaultsInfo initWithService:homeID:homeUserID:](self, "initWithService:homeID:homeUserID:", self->_service, self->_homeID);
    if (v11)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kRecordNameEncodeKey"));
      v12 = objc_claimAutoreleasedReturnValue();
      recordName = v11->_recordName;
      v11->_recordName = (NSString *)v12;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kRecordTypeEncodeKey"));
      v14 = objc_claimAutoreleasedReturnValue();
      recordType = v11->_recordType;
      v11->_recordType = (NSString *)v14;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kRecordZoneNameEncodeKey"));
      v16 = objc_claimAutoreleasedReturnValue();
      recordZoneName = v11->_recordZoneName;
      v11->_recordZoneName = (NSString *)v16;

    }
    self = v11;
    v18 = self;
  }
  else
  {
LABEL_6:
    v18 = 0;
  }

  return v18;
}

- (NSString)recordName
{
  return self->_recordName;
}

- (void)setRecordName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)recordZoneName
{
  return self->_recordZoneName;
}

- (void)setRecordZoneName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)recordType
{
  return self->_recordType;
}

- (void)setRecordType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (MediaService)service
{
  return self->_service;
}

- (NSUUID)homeID
{
  return self->_homeID;
}

- (NSUUID)homeUserID
{
  return self->_homeUserID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeUserID, 0);
  objc_storeStrong((id *)&self->_homeID, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_recordType, 0);
  objc_storeStrong((id *)&self->_recordZoneName, 0);
  objc_storeStrong((id *)&self->_recordName, 0);
}

@end
