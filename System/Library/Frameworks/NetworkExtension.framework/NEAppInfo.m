@implementation NEAppInfo

- (void)encodeWithCoder:(id)a3
{
  NSData *cdHash;
  id v5;

  v5 = a3;
  if (self)
  {
    objc_msgSend(v5, "encodeInt:forKey:", self->_pid, CFSTR("Pid"));
    objc_msgSend(v5, "encodeObject:forKey:", self->_uuid, CFSTR("UUID"));
    objc_msgSend(v5, "encodeObject:forKey:", self->_bundleID, CFSTR("BundleID"));
    objc_msgSend(v5, "encodeObject:forKey:", self->_appVersion, CFSTR("AppVersion"));
    cdHash = self->_cdHash;
  }
  else
  {
    objc_msgSend(v5, "encodeInt:forKey:", 0, CFSTR("Pid"));
    objc_msgSend(v5, "encodeObject:forKey:", 0, CFSTR("UUID"));
    objc_msgSend(v5, "encodeObject:forKey:", 0, CFSTR("BundleID"));
    objc_msgSend(v5, "encodeObject:forKey:", 0, CFSTR("AppVersion"));
    cdHash = 0;
  }
  objc_msgSend(v5, "encodeObject:forKey:", cdHash, CFSTR("CDHash"));

}

- (NEAppInfo)initWithCoder:(id)a3
{
  id v4;
  NEAppInfo *v5;
  void *v6;
  SEL v7;
  void *v8;
  SEL v9;
  void *v10;
  SEL v11;
  void *v12;
  SEL v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NEAppInfo;
  v5 = -[NEAppInfo init](&v15, sel_init);
  if (v5)
  {
    v5->_pid = objc_msgSend(v4, "decodeIntForKey:", CFSTR("Pid"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_nonatomic_copy(v5, v7, v6, 16);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BundleID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_nonatomic_copy(v5, v9, v8, 24);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AppVersion"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_nonatomic_copy(v5, v11, v10, 32);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CDHash"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_nonatomic_copy(v5, v13, v12, 40);

  }
  return v5;
}

- (id)description
{
  id v3;
  uint64_t pid;
  NSUUID *v5;
  NSString *v6;
  NSString *v7;
  NSData *v8;
  _BOOL8 v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self)
  {
    pid = self->_pid;
    v5 = self->_uuid;
    v6 = self->_bundleID;
    v7 = self->_appVersion;
    v8 = self->_cdHash;
    v9 = self->_cdHash != 0;
  }
  else
  {
    v8 = 0;
    v6 = 0;
    pid = 0;
    v5 = 0;
    v7 = 0;
    v9 = 0;
  }
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("\nNEAppInfo:\n\tPid:\t\t%d\n\tUUID:\t\t%@\n\tBundle ID:\t%@\n\tApp Version:\t%@\n\tCDHash:\t\t%@\n\tComplete:\t%d\n"), pid, v5, v6, v7, v8, v9);

  return v10;
}

- (id)debugDescription
{
  id v3;
  uint64_t pid;
  NSUUID *v5;
  NSString *v6;
  NSString *v7;
  NSData *v8;
  _BOOL8 v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (self)
  {
    pid = self->_pid;
    v5 = self->_uuid;
    v6 = self->_bundleID;
    v7 = self->_appVersion;
    v8 = self->_cdHash;
    v9 = self->_cdHash != 0;
  }
  else
  {
    v8 = 0;
    v6 = 0;
    pid = 0;
    v5 = 0;
    v7 = 0;
    v9 = 0;
  }
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("\nNEAppInfo:\n\tPid:\t\t%d\n\tUUID:\t\t%@\n\tBundle ID:\t%@\n\tApp Version:\t%@\n\tCDHash:\t\t%@\n\tComplete:\t%d\n"), pid, v5, v6, v7, v8, v9);

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v4;
  const char *v5;
  void *v6;
  int pid;
  NSUUID *uuid;
  NSString *bundleID;
  NSString *appVersion;
  NSData *cdHash;

  v4 = (_DWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v4;
  if (self)
  {
    pid = self->_pid;
    if (!v4)
      goto LABEL_4;
    goto LABEL_3;
  }
  pid = 0;
  if (v4)
LABEL_3:
    v4[2] = pid;
LABEL_4:
  if (self)
  {
    uuid = self->_uuid;
    if (!v4)
      goto LABEL_7;
    goto LABEL_6;
  }
  uuid = 0;
  if (v4)
LABEL_6:
    objc_setProperty_nonatomic_copy(v4, v5, uuid, 16);
LABEL_7:
  if (self)
  {
    bundleID = self->_bundleID;
    if (!v6)
      goto LABEL_10;
    goto LABEL_9;
  }
  bundleID = 0;
  if (v6)
LABEL_9:
    objc_setProperty_nonatomic_copy(v6, v5, bundleID, 24);
LABEL_10:
  if (self)
  {
    appVersion = self->_appVersion;
    if (!v6)
      goto LABEL_13;
    goto LABEL_12;
  }
  appVersion = 0;
  if (v6)
LABEL_12:
    objc_setProperty_nonatomic_copy(v6, v5, appVersion, 32);
LABEL_13:
  if (!self)
  {
    cdHash = 0;
    if (!v6)
      return v6;
    goto LABEL_15;
  }
  cdHash = self->_cdHash;
  if (v6)
LABEL_15:
    objc_setProperty_nonatomic_copy(v6, v5, cdHash, 40);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cdHash, 0);
  objc_storeStrong((id *)&self->_appVersion, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
