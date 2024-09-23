@implementation NWURLSessionResponseConsumerResumeInfo

- (void)encodeWithCoder:(id)a3
{
  NSString *tempFileName;

  if (self)
  {
    objc_msgSend(a3, "encodeObject:forKey:", self->_fileURL, CFSTR("fileURL"));
    tempFileName = self->_tempFileName;
  }
  else
  {
    objc_msgSend(a3, "encodeObject:forKey:", 0, CFSTR("fileURL"));
    tempFileName = 0;
  }
  objc_msgSend(a3, "encodeObject:forKey:", tempFileName, CFSTR("tempFileName"));

}

- (NWURLSessionResponseConsumerResumeInfo)initWithCoder:(id)a3
{
  id v4;
  NWURLSessionResponseConsumerResumeInfo *v5;
  uint64_t v6;
  NSURL *fileURL;
  uint64_t v8;
  NSString *tempFileName;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NWURLSessionResponseConsumerResumeInfo;
  v5 = -[NWURLSessionResponseConsumerResumeInfo init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fileURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    fileURL = v5->_fileURL;
    v5->_fileURL = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tempFileName"));
    v8 = objc_claimAutoreleasedReturnValue();
    tempFileName = v5->_tempFileName;
    v5->_tempFileName = (NSString *)v8;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tempFileName, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
