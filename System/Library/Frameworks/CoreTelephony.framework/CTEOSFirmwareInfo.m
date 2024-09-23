@implementation CTEOSFirmwareInfo

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTEOSFirmwareInfo currentVersion](self, "currentVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", CurrentVersion=%@"), v4);

  -[CTEOSFirmwareInfo userProfiles](self, "userProfiles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", UserProfiles=%@"), v5);

  -[CTEOSFirmwareInfo updateCsn](self, "updateCsn");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", UpdateCsn=%@"), v6);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTEOSFirmwareInfo currentVersion](self, "currentVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setCurrentVersion:", v7);

  -[CTEOSFirmwareInfo userProfiles](self, "userProfiles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setUserProfiles:", v9);

  -[CTEOSFirmwareInfo updateCsn](self, "updateCsn");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setUpdateCsn:", v11);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CTEOSFirmwareInfo currentVersion](self, "currentVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kCurrentVersionKey"));

  -[CTEOSFirmwareInfo userProfiles](self, "userProfiles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kUserProfilesKey"));

  -[CTEOSFirmwareInfo updateCsn](self, "updateCsn");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kUpdateCsnKey"));

}

- (CTEOSFirmwareInfo)initWithCoder:(id)a3
{
  id v4;
  CTEOSFirmwareInfo *v5;
  uint64_t v6;
  NSData *currentVersion;
  uint64_t v8;
  NSNumber *userProfiles;
  uint64_t v10;
  NSData *updateCsn;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTEOSFirmwareInfo;
  v5 = -[CTEOSFirmwareInfo init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCurrentVersionKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    currentVersion = v5->_currentVersion;
    v5->_currentVersion = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kUserProfilesKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    userProfiles = v5->_userProfiles;
    v5->_userProfiles = (NSNumber *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kUpdateCsnKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    updateCsn = v5->_updateCsn;
    v5->_updateCsn = (NSData *)v10;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)currentVersion
{
  return self->_currentVersion;
}

- (void)setCurrentVersion:(id)a3
{
  objc_storeStrong((id *)&self->_currentVersion, a3);
}

- (NSNumber)userProfiles
{
  return self->_userProfiles;
}

- (void)setUserProfiles:(id)a3
{
  objc_storeStrong((id *)&self->_userProfiles, a3);
}

- (NSData)updateCsn
{
  return self->_updateCsn;
}

- (void)setUpdateCsn:(id)a3
{
  objc_storeStrong((id *)&self->_updateCsn, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateCsn, 0);
  objc_storeStrong((id *)&self->_userProfiles, 0);
  objc_storeStrong((id *)&self->_currentVersion, 0);
}

@end
