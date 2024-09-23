@implementation CRKFetchActiveInstructorsRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchActiveInstructorsRequest)initWithCoder:(id)a3
{
  id v4;
  CRKFetchActiveInstructorsRequest *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRKFetchActiveInstructorsRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("includeImages"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(&v5->super._handlesNotifications + 1) = objc_msgSend(v6, "BOOLValue");

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
  objc_msgSend(v4, "numberWithBool:", -[CRKFetchActiveInstructorsRequest includeImages](self, "includeImages"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("includeImages"));

}

- (BOOL)includeImages
{
  return *(&self->super._handlesNotifications + 1);
}

- (void)setIncludeImages:(BOOL)a3
{
  *(&self->super._handlesNotifications + 1) = a3;
}

@end
