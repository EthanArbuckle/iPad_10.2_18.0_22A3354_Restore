@implementation AMSODIAssessment

- (AMSODIAssessment)initWithStringValue:(id)a3
{
  id v4;
  AMSODIAssessment *v5;
  uint64_t v6;
  NSString *stringValue;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSODIAssessment;
  v5 = -[AMSODIAssessment init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    stringValue = v5->_stringValue;
    v5->_stringValue = (NSString *)v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AMSODIAssessment *v5;
  uint64_t v6;
  NSString *stringValue;

  v5 = objc_alloc_init(AMSODIAssessment);
  v6 = -[NSString copyWithZone:](self->_stringValue, "copyWithZone:", a3);
  stringValue = v5->_stringValue;
  v5->_stringValue = (NSString *)v6;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSODIAssessment stringValue](self, "stringValue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("stringValue"));

}

- (AMSODIAssessment)initWithCoder:(id)a3
{
  id v4;
  AMSODIAssessment *v5;
  uint64_t v6;
  NSString *stringValue;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSODIAssessment;
  v5 = -[AMSODIAssessment init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stringValue"));
    v6 = objc_claimAutoreleasedReturnValue();
    stringValue = v5->_stringValue;
    v5->_stringValue = (NSString *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
}

@end
