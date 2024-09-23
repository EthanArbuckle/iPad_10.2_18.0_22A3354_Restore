@implementation AUDAccessory

- (AUDAccessory)initWithUID:(id)a3
{
  AUDAccessory *v3;
  objc_super v6;

  v3 = self;
  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)AUDAccessory;
    v3 = -[AUDAccessory init](&v6, sel_init);
    if (v3)
    {
      v3->_uid = (NSString *)objc_msgSend(a3, "copy");
      v3->_fwVersion = 0;
    }
  }
  return v3;
}

- (void)dealloc
{
  NSString *uid;
  NSString *fwVersion;
  objc_super v5;

  uid = self->_uid;
  if (uid)

  fwVersion = self->_fwVersion;
  if (fwVersion)

  v5.receiver = self;
  v5.super_class = (Class)AUDAccessory;
  -[AUDAccessory dealloc](&v5, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AUDAccessory)initWithCoder:(id)a3
{
  AUDAccessory *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AUDAccessory;
  v4 = -[AUDAccessory init](&v6, sel_init);
  if (v4)
  {
    v4->_uid = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AUDAccessory_UID"));
    v4->_fwVersion = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AUDAccessory_FWVersion"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_uid, CFSTR("AUDAccessory_UID"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_fwVersion, CFSTR("AUDAccessory_FWVersion"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;

  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithUID:", (id)-[NSString copyWithZone:](-[AUDAccessory uid](self, "uid"), "copyWithZone:", a3));
  if (v5)
    objc_msgSend(v5, "setFwVersion:", (id)-[NSString copyWithZone:](-[AUDAccessory fwVersion](self, "fwVersion"), "copyWithZone:", a3));
  return v5;
}

- (NSString)uid
{
  return self->_uid;
}

- (NSString)fwVersion
{
  return self->_fwVersion;
}

- (void)setFwVersion:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
