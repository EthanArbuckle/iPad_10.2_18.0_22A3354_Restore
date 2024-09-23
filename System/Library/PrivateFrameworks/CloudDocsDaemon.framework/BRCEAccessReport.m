@implementation BRCEAccessReport

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t st_mode;
  id v5;

  st_mode = self->st_mode;
  v5 = a3;
  objc_msgSend(v5, "encodeInt32:forKey:", st_mode, CFSTR("st_mode"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->st_uid, CFSTR("st_uid"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->st_gid, CFSTR("st_gid"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->st_flags, CFSTR("st_flags"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->protection_class, CFSTR("protection_class"));
  objc_msgSend(v5, "encodeBool:forKey:", self->has_acls, CFSTR("has_acls"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->incidents, CFSTR("incidents"));

}

- (BRCEAccessReport)initWithCoder:(id)a3
{
  id v4;
  BRCEAccessReport *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BRCEAccessReport;
  v5 = -[BRCEAccessReport init](&v7, sel_init);
  if (v5)
  {
    v5->st_mode = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("st_mode"));
    v5->st_uid = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("st_uid"));
    v5->st_gid = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("st_gid"));
    v5->st_flags = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("st_flags"));
    v5->protection_class = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("protection_class"));
    v5->has_acls = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("has_acls"));
    v5->incidents = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("incidents"));
  }

  return v5;
}

- (unsigned)st_mode
{
  return self->st_mode;
}

- (void)setSt_mode:(unsigned __int16)a3
{
  self->st_mode = a3;
}

- (unsigned)st_uid
{
  return self->st_uid;
}

- (void)setSt_uid:(unsigned int)a3
{
  self->st_uid = a3;
}

- (unsigned)st_gid
{
  return self->st_gid;
}

- (void)setSt_gid:(unsigned int)a3
{
  self->st_gid = a3;
}

- (unsigned)st_flags
{
  return self->st_flags;
}

- (void)setSt_flags:(unsigned int)a3
{
  self->st_flags = a3;
}

- (unsigned)protection_class
{
  return self->protection_class;
}

- (void)setProtection_class:(unsigned int)a3
{
  self->protection_class = a3;
}

- (BOOL)has_acls
{
  return self->has_acls;
}

- (void)setHas_acls:(BOOL)a3
{
  self->has_acls = a3;
}

- (unint64_t)incidents
{
  return self->incidents;
}

- (void)setIncidents:(unint64_t)a3
{
  self->incidents = a3;
}

@end
