@implementation DIAttributeDocumentScanRequirements

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DIAttributeDocumentScanRequirements;
  v4 = a3;
  -[DIAttributeImageCaptureRequirements encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  os_unfair_lock_lock(&self->super._lock);
  objc_msgSend(v4, "encodeObject:forKey:", self->_countryCode, CFSTR("countryCode"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_type, CFSTR("type"));

  os_unfair_lock_unlock(&self->super._lock);
}

- (DIAttributeDocumentScanRequirements)initWithCoder:(id)a3
{
  id v4;
  DIAttributeDocumentScanRequirements *v5;
  uint64_t v6;
  NSString *countryCode;
  uint64_t v8;
  NSString *type;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DIAttributeDocumentScanRequirements;
  v5 = -[DIAttributeImageCaptureRequirements initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("countryCode"));
    v6 = objc_claimAutoreleasedReturnValue();
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v8 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (NSString *)v8;

  }
  return v5;
}

- (DIAttributeDocumentScanRequirements)initWithDocumentScanRequirements:(id)a3
{
  id v4;
  DIAttributeDocumentScanRequirements *v5;
  uint64_t v6;
  NSString *countryCode;
  uint64_t v8;
  NSString *type;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DIAttributeDocumentScanRequirements;
  v5 = -[DIAttributeImageCaptureRequirements initWithImageCaptureRequirements:](&v11, sel_initWithImageCaptureRequirements_, v4);
  if (v5)
  {
    objc_msgSend(v4, "countryCode");
    v6 = objc_claimAutoreleasedReturnValue();
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v6;

    objc_msgSend(v4, "type");
    v8 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (NSString *)v8;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)DIAttributeDocumentScanRequirements;
  -[DIAttributeImageCaptureRequirements description](&v6, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v4);

  os_unfair_lock_lock(&self->super._lock);
  objc_msgSend(v3, "appendFormat:", CFSTR("countryCode: '%@'; "), self->_countryCode);
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), self->_type);
  os_unfair_lock_unlock(&self->super._lock);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[DIAttributeDocumentScanRequirements initWithDocumentScanRequirements:](+[DIAttributeDocumentScanRequirements allocWithZone:](DIAttributeDocumentScanRequirements, "allocWithZone:", a3), "initWithDocumentScanRequirements:", self);
}

- (NSString)countryCode
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  v4 = self->_countryCode;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setCountryCode:(id)a3
{
  NSString *v4;
  NSString *countryCode;
  NSString *v6;

  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->super._lock);
  if (self->_countryCode != v6)
  {
    v4 = (NSString *)-[NSString copyWithZone:](v6, "copyWithZone:", 0);
    countryCode = self->_countryCode;
    self->_countryCode = v4;

  }
  os_unfair_lock_unlock(&self->super._lock);

}

- (NSString)type
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  v4 = self->_type;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setType:(id)a3
{
  NSString *v4;
  NSString *type;
  NSString *v6;

  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->super._lock);
  if (self->_type != v6)
  {
    v4 = (NSString *)-[NSString copyWithZone:](v6, "copyWithZone:", 0);
    type = self->_type;
    self->_type = v4;

  }
  os_unfair_lock_unlock(&self->super._lock);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
}

@end
