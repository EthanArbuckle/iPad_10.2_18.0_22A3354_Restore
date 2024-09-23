@implementation GTCaptureArchiveFilenameOverride

- (void)encodeWithCoder:(id)a3
{
  NSString *originalFilename;
  id v5;

  originalFilename = self->_originalFilename;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", originalFilename, CFSTR("originalFilename"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_overrideFilename, CFSTR("overrideFilename"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_exportToolVersion, CFSTR("exportToolVersion"));

}

- (GTCaptureArchiveFilenameOverride)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  GTCaptureArchiveFilenameOverride *v6;
  id v7;
  uint64_t v8;
  NSString *originalFilename;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSString *overrideFilename;
  GTCaptureArchiveFilenameOverride *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GTCaptureArchiveFilenameOverride;
  v6 = -[GTCaptureArchiveFilenameOverride init](&v16, "init");
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v5), CFSTR("originalFilename"));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    originalFilename = v6->_originalFilename;
    v6->_originalFilename = (NSString *)v8;

    v11 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v10), CFSTR("overrideFilename"));
    v12 = objc_claimAutoreleasedReturnValue(v11);
    overrideFilename = v6->_overrideFilename;
    v6->_overrideFilename = (NSString *)v12;

    v6->_exportToolVersion = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("exportToolVersion"));
    v14 = v6;
  }

  return v6;
}

- (NSString)originalFilename
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setOriginalFilename:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)overrideFilename
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOverrideFilename:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (unint64_t)exportToolVersion
{
  return self->_exportToolVersion;
}

- (void)setExportToolVersion:(unint64_t)a3
{
  self->_exportToolVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideFilename, 0);
  objc_storeStrong((id *)&self->_originalFilename, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
