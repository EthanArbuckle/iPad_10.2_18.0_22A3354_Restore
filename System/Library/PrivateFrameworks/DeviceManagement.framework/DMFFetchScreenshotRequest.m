@implementation DMFFetchScreenshotRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchScreenshotRequest)initWithCoder:(id)a3
{
  id v4;
  DMFFetchScreenshotRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *sessionToken;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DMFFetchScreenshotRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maxWidth"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_maxWidth = objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("maxHeight"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_maxHeight = objc_msgSend(v7, "unsignedIntegerValue");

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("sessionToken"));
    v9 = objc_claimAutoreleasedReturnValue();
    sessionToken = v5->_sessionToken;
    v5->_sessionToken = (NSString *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("usesPixels"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_usesPixels = objc_msgSend(v11, "BOOLValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DMFFetchScreenshotRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[DMFFetchScreenshotRequest maxWidth](self, "maxWidth", v9.receiver, v9.super_class));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("maxWidth"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[DMFFetchScreenshotRequest maxHeight](self, "maxHeight"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("maxHeight"));

  -[DMFFetchScreenshotRequest sessionToken](self, "sessionToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("sessionToken"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[DMFFetchScreenshotRequest usesPixels](self, "usesPixels"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("usesPixels"));

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

- (BOOL)usesPixels
{
  return self->_usesPixels;
}

- (void)setUsesPixels:(BOOL)a3
{
  self->_usesPixels = a3;
}

- (NSString)sessionToken
{
  return self->_sessionToken;
}

- (void)setSessionToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionToken, 0);
}

@end
