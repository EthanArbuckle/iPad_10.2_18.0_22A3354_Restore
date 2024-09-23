@implementation INExtensionContextSlotResolutionResult

- (INExtensionContextSlotResolutionResult)initWithResult:(int64_t)a3 data:(id)a4
{
  id v7;
  INExtensionContextSlotResolutionResult *v8;
  INExtensionContextSlotResolutionResult *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)INExtensionContextSlotResolutionResult;
  v8 = -[INExtensionContextSlotResolutionResult init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_result = a3;
    objc_storeStrong((id *)&v8->_data, a4);
  }

  return v9;
}

- (INExtensionContextSlotResolutionResult)initWithCoder:(id)a3
{
  id v4;
  INExtensionContextSlotResolutionResult *v5;
  uint64_t v6;
  NSData *data;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)INExtensionContextSlotResolutionResult;
  v5 = -[INExtensionContextSlotResolutionResult init](&v9, sel_init);
  if (v5)
  {
    v5->_result = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("result"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
    v6 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t result;
  id v5;

  result = self->_result;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", result, CFSTR("result"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_data, CFSTR("data"));

}

- (int64_t)result
{
  return self->_result;
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
