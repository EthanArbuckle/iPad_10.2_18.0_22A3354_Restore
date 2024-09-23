@implementation CATTaskRequest

+ (Class)allowlistedClassForResultObject
{
  return 0;
}

+ (Class)whitelistedClassForResultObject
{
  return 0;
}

- (CATTaskRequest)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CATTaskRequest;
  return -[CATTaskRequest init](&v3, sel_init);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CATTaskRequest)initWithCoder:(id)a3
{
  id v4;
  CATTaskRequest *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CATTaskRequest;
  v5 = -[CATTaskRequest init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("handlesNotifications"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_handlesNotifications = objc_msgSend(v6, "BOOLValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithBool:", -[CATTaskRequest handlesNotifications](self, "handlesNotifications"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("handlesNotifications"));

}

- (BOOL)handlesNotifications
{
  return self->_handlesNotifications;
}

- (void)setHandlesNotifications:(BOOL)a3
{
  self->_handlesNotifications = a3;
}

@end
