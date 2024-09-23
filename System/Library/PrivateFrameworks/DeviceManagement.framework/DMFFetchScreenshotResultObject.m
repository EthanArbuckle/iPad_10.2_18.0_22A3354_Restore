@implementation DMFFetchScreenshotResultObject

- (DMFFetchScreenshotResultObject)initWithData:(id)a3
{
  id v4;
  DMFFetchScreenshotResultObject *v5;
  uint64_t v6;
  NSData *screenshotData;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMFFetchScreenshotResultObject;
  v5 = -[CATTaskResultObject init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    screenshotData = v5->_screenshotData;
    v5->_screenshotData = (NSData *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchScreenshotResultObject)initWithCoder:(id)a3
{
  id v4;
  DMFFetchScreenshotResultObject *v5;
  void *v6;
  uint64_t v7;
  NSData *screenshotData;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DMFFetchScreenshotResultObject;
  v5 = -[CATTaskResultObject initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("screenshotData"));
    v7 = objc_claimAutoreleasedReturnValue();
    screenshotData = v5->_screenshotData;
    v5->_screenshotData = (NSData *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DMFFetchScreenshotResultObject;
  v4 = a3;
  -[CATTaskResultObject encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[DMFFetchScreenshotResultObject screenshotData](self, "screenshotData", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("screenshotData"));

}

- (NSData)screenshotData
{
  return self->_screenshotData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenshotData, 0);
}

@end
