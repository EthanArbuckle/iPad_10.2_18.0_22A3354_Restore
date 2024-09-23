@implementation CRKFetchScreenshotRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchScreenshotRequest)initWithCoder:(id)a3
{
  id v4;
  CRKFetchScreenshotRequest *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKFetchScreenshotRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maxWidth"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_maxWidth = objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maxHeight"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_maxHeight = objc_msgSend(v7, "unsignedIntegerValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRKFetchScreenshotRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CRKFetchScreenshotRequest maxWidth](self, "maxWidth", v7.receiver, v7.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("maxWidth"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CRKFetchScreenshotRequest maxHeight](self, "maxHeight"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("maxHeight"));

}

- (unint64_t)maxWidth
{
  return self->_maxWidth;
}

- (void)setMaxWidth:(unint64_t)a3
{
  self->_maxWidth = a3;
}

- (unint64_t)maxHeight
{
  return self->_maxHeight;
}

- (void)setMaxHeight:(unint64_t)a3
{
  self->_maxHeight = a3;
}

@end
