@implementation AFSiriDebugUIRequest

- (AFSiriDebugUIRequest)initWithMessage:(id)a3 makeAppFrontmost:(BOOL)a4
{
  id v6;
  AFSiriDebugUIRequest *v7;
  uint64_t v8;
  NSString *message;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AFSiriDebugUIRequest;
  v7 = -[AFSiriRequest init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    message = v7->_message;
    v7->_message = (NSString *)v8;

    v7->_frontmost = a4;
  }

  return v7;
}

- (id)message
{
  return self->_message;
}

- (id)createResponse
{
  return -[AFSiriResponse _initWithRequest:]([AFSiriRequestSucceededResponse alloc], "_initWithRequest:", self);
}

- (BOOL)_makeAppFrontmost
{
  return self->_frontmost;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AFSiriDebugUIRequest;
  v4 = a3;
  -[AFSiriRequest encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_message, CFSTR("Message"), v6.receiver, v6.super_class);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_frontmost);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("Frontmost"));

}

- (AFSiriDebugUIRequest)initWithCoder:(id)a3
{
  id v4;
  AFSiriDebugUIRequest *v5;
  void *v6;
  uint64_t v7;
  NSString *message;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AFSiriDebugUIRequest;
  v5 = -[AFSiriRequest initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Message"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    message = v5->_message;
    v5->_message = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Frontmost"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_frontmost = objc_msgSend(v9, "BOOLValue");

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
