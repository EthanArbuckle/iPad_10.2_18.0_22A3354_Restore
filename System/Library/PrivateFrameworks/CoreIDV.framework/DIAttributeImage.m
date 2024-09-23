@implementation DIAttributeImage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DIAttributeImage;
  v4 = a3;
  -[DIAttribute encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  os_unfair_lock_lock(&self->super._lock);
  objc_msgSend(v4, "encodeObject:forKey:", self->_encoding, CFSTR("encoding"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_format, CFSTR("format"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_height, CFSTR("height"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_width, CFSTR("width"));

  os_unfair_lock_unlock(&self->super._lock);
}

- (DIAttributeImage)initWithCoder:(id)a3
{
  id v4;
  DIAttributeImage *v5;
  uint64_t v6;
  NSString *encoding;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DIAttributeImage;
  v5 = -[DIAttribute initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("encoding"));
    v6 = objc_claimAutoreleasedReturnValue();
    encoding = v5->_encoding;
    v5->_encoding = (NSString *)v6;

    v5->_format = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("format"));
    v5->_height = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("height"));
    v5->_width = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("width"));
  }

  return v5;
}

- (DIAttributeImage)init
{
  DIAttributeImage *v2;
  DIAttributeImage *v3;
  NSString *encoding;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DIAttributeImage;
  v2 = -[DIAttribute init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[DIAttribute setAttributeType:](v2, "setAttributeType:", 3);
    encoding = v3->_encoding;
    v3->_encoding = (NSString *)CFSTR("unknown");

    v3->_format = 0;
    v3->_height = 0;
    v3->_width = 0;
  }
  return v3;
}

- (void)setCurrentValue:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DIAttributeImage;
  -[DIAttribute setCurrentValue:](&v3, sel_setCurrentValue_, a3);
}

- (void)setEncoding:(id)a3
{
  NSString *v4;
  NSString *encoding;
  NSString *v6;

  v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->super._lock);
  if (self->_encoding != v6)
  {
    v4 = (NSString *)-[NSString copyWithZone:](v6, "copyWithZone:", 0);
    encoding = self->_encoding;
    self->_encoding = v4;

  }
  os_unfair_lock_unlock(&self->super._lock);

}

- (void)setFormat:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  self->_format = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setHeight:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  self->_height = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)setWidth:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  self->_width = a3;
  os_unfair_lock_unlock(p_lock);
}

- (NSData)getCurrentValue
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DIAttributeImage;
  -[DIAttribute getCurrentValue](&v3, sel_getCurrentValue);
  return (NSData *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)defaultValue
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DIAttributeImage;
  -[DIAttribute defaultValue](&v3, sel_defaultValue);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)encoding
{
  os_unfair_lock_s *p_lock;
  NSString *v4;

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  v4 = self->_encoding;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (unint64_t)format
{
  os_unfair_lock_s *p_lock;
  unint64_t format;

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  format = self->_format;
  os_unfair_lock_unlock(p_lock);
  return format;
}

- (unint64_t)height
{
  os_unfair_lock_s *p_lock;
  unint64_t height;

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  height = self->_height;
  os_unfair_lock_unlock(p_lock);
  return height;
}

- (unint64_t)width
{
  os_unfair_lock_s *p_lock;
  unint64_t width;

  p_lock = &self->super._lock;
  os_unfair_lock_lock(&self->super._lock);
  width = self->_width;
  os_unfair_lock_unlock(p_lock);
  return width;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", &stru_24C2D5A40);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)DIAttributeImage;
  -[DIAttribute description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v4);

  os_unfair_lock_lock(&self->super._lock);
  objc_msgSend(v3, "appendFormat:", CFSTR("encoding: '%@'; "), self->_encoding);
  os_unfair_lock_unlock(&self->super._lock);
  -[DIAttributeImage getCurrentValue](self, "getCurrentValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("currentValue: '%@'; "), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encoding, 0);
}

@end
