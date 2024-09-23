@implementation CRKFetchScreenshotResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchScreenshotResultObject)initWithCoder:(id)a3
{
  id v4;
  CRKFetchScreenshotResultObject *v5;
  void *v6;
  uint64_t v7;
  NSData *screenshotData;
  void *v9;
  uint64_t v10;
  NSString *studentIdentifier;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRKFetchScreenshotResultObject;
  v5 = -[CATTaskResultObject initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("screenshotData"));
    v7 = objc_claimAutoreleasedReturnValue();
    screenshotData = v5->_screenshotData;
    v5->_screenshotData = (NSData *)v7;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("studentIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    studentIdentifier = v5->_studentIdentifier;
    v5->_studentIdentifier = (NSString *)v10;

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
  v7.super_class = (Class)CRKFetchScreenshotResultObject;
  v4 = a3;
  -[CATTaskResultObject encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[CRKFetchScreenshotResultObject screenshotData](self, "screenshotData", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("screenshotData"));

  -[CRKFetchScreenshotResultObject studentIdentifier](self, "studentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("studentIdentifier"));

}

- (NSData)screenshotData
{
  return self->_screenshotData;
}

- (void)setScreenshotData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)studentIdentifier
{
  return self->_studentIdentifier;
}

- (void)setStudentIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_studentIdentifier, 0);
  objc_storeStrong((id *)&self->_screenshotData, 0);
}

@end
