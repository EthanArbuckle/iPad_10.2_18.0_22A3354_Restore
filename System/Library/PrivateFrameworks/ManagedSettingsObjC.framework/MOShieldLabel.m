@implementation MOShieldLabel

- (MOShieldLabel)initWithText:(id)a3 colorData:(id)a4
{
  id v5;
  id v6;
  MOShieldLabel *v7;
  uint64_t v8;
  NSString *text;
  uint64_t v10;
  NSData *colorData;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MOShieldLabel;
  v5 = a4;
  v6 = a3;
  v7 = -[MOShieldLabel init](&v13, sel_init);
  v8 = objc_msgSend(v6, "copy", v13.receiver, v13.super_class);

  text = v7->_text;
  v7->_text = (NSString *)v8;

  v10 = objc_msgSend(v5, "copy");
  colorData = v7->_colorData;
  v7->_colorData = (NSData *)v10;

  return v7;
}

- (MOShieldLabel)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MOShieldLabel *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Text"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ColorData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[MOShieldLabel initWithText:colorData:](self, "initWithText:colorData:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *text;
  id v5;

  text = self->_text;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", text, CFSTR("Text"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_colorData, CFSTR("ColorData"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)text
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSData)colorData
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorData, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
