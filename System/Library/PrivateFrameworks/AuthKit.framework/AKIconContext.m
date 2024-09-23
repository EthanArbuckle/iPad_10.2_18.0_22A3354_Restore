@implementation AKIconContext

- (AKIconContext)init
{
  AKIconContext *v2;
  AKIconContext *v3;
  NSData *data;
  NSNumber *scale;
  NSString *appName;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AKIconContext;
  v2 = -[AKIconContext init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    data = v2->_data;
    v2->_data = 0;

    scale = v3->_scale;
    v3->_scale = 0;

    appName = v3->_appName;
    v3->_maskingStyle = 0;
    v3->_appName = 0;

  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKIconContext)initWithCoder:(id)a3
{
  id v4;
  AKIconContext *v5;
  uint64_t v6;
  NSData *data;
  uint64_t v8;
  NSNumber *scale;
  uint64_t v10;
  NSString *appName;

  v4 = a3;
  v5 = -[AKIconContext init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_data"));
    v6 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_scale"));
    v8 = objc_claimAutoreleasedReturnValue();
    scale = v5->_scale;
    v5->_scale = (NSNumber *)v8;

    v5->_maskingStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_maskingStyle"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_appName"));
    v10 = objc_claimAutoreleasedReturnValue();
    appName = v5->_appName;
    v5->_appName = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *data;
  id v5;

  data = self->_data;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", data, CFSTR("_data"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_scale, CFSTR("_scale"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_maskingStyle, CFSTR("_maskingStyle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appName, CFSTR("_appName"));

}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (NSNumber)scale
{
  return self->_scale;
}

- (void)setScale:(id)a3
{
  objc_storeStrong((id *)&self->_scale, a3);
}

- (unint64_t)maskingStyle
{
  return self->_maskingStyle;
}

- (void)setMaskingStyle:(unint64_t)a3
{
  self->_maskingStyle = a3;
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
  objc_storeStrong((id *)&self->_appName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_scale, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
