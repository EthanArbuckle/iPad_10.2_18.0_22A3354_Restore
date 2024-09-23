@implementation MBRestoreFailure

- (MBRestoreFailure)initWithIdentifier:(id)a3 dataclass:(id)a4 assetType:(id)a5 displayName:(id)a6 error:(id)a7
{
  MBRestoreFailure *v12;
  uint64_t v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MBRestoreFailure;
  v12 = -[MBRestoreFailure init](&v15, sel_init);
  if (v12)
  {
    v12->_identifier = (NSString *)objc_msgSend(a3, "copy");
    v12->_dataclass = (NSString *)objc_msgSend(a4, "copy");
    v12->_assetType = (NSString *)objc_msgSend(a5, "copy");
    v12->_displayName = (NSString *)objc_msgSend(a6, "copy");
    v13 = objc_msgSend(a7, "copy");
    v12->_icon = 0;
    v12->_error = (NSError *)v13;
  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MBRestoreFailure)initWithCoder:(id)a3
{
  MBRestoreFailure *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MBRestoreFailure;
  v4 = -[MBRestoreFailure init](&v6, sel_init);
  if (v4)
  {
    v4->_identifier = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v4->_displayName = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
    v4->_dataclass = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dataclass"));
    v4->_assetType = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetType"));
    v4->_icon = (NSData *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("icon"));
    v4->_error = (NSError *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_displayName, CFSTR("displayName"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_dataclass, CFSTR("dataclass"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_assetType, CFSTR("assetType"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_icon, CFSTR("icon"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_error, CFSTR("error"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  MBRestoreFailure *v4;

  v4 = objc_alloc_init(MBRestoreFailure);
  -[MBRestoreFailure setIdentifier:](v4, "setIdentifier:", self->_identifier);
  -[MBRestoreFailure setDisplayName:](v4, "setDisplayName:", self->_displayName);
  -[MBRestoreFailure setDataclass:](v4, "setDataclass:", self->_dataclass);
  -[MBRestoreFailure setAssetType:](v4, "setAssetType:", self->_assetType);
  -[MBRestoreFailure setIcon:](v4, "setIcon:", self->_icon);
  -[MBRestoreFailure setError:](v4, "setError:", self->_error);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MBRestoreFailure;
  -[MBRestoreFailure dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  id v4;
  const __CFString *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)MBRestoreFailure;
  v4 = -[MBRestoreFailure description](&v7, sel_description);
  if (self->_icon)
    v5 = CFSTR("has icon");
  else
    v5 = CFSTR("no icon");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("{ %@, identifier = %@, dataclass = %@, assetType = %@, error = %@, %@ }"), v4, self->_identifier, self->_dataclass, self->_assetType, self->_error, v5);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)dataclass
{
  return self->_dataclass;
}

- (void)setDataclass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)assetType
{
  return self->_assetType;
}

- (void)setAssetType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSData)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

@end
