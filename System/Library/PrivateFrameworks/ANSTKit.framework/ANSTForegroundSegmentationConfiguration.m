@implementation ANSTForegroundSegmentationConfiguration

- (ANSTForegroundSegmentationConfiguration)init
{
  return (ANSTForegroundSegmentationConfiguration *)objc_msgSend_initWithVersion_(self, a2, 0x20000);
}

- (ANSTForegroundSegmentationConfiguration)initWithVersion:(unint64_t)a3
{
  ANSTForegroundSegmentationConfiguration *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ANSTForegroundSegmentationConfiguration;
  result = -[ANSTConfiguration initWithVersion:](&v4, sel_initWithVersion_, a3);
  if (result)
    result->_networkResolution = 0;
  return result;
}

- (id)description
{
  uint64_t v2;
  void *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  int v9;
  int v10;
  const __CFString *v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  void *v15;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = objc_msgSend_version(self, a2, v2);
  ANSTForegroundSegmentationVersionToNSString(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_qualityOfService(self, v7, v8);
  v10 = v9;
  if (v9 > 20)
  {
    switch(v9)
    {
      case 21:
        v11 = CFSTR("DEFAULT");
        goto LABEL_17;
      case 33:
        v11 = CFSTR("USER_INTERACTIVE");
        goto LABEL_17;
      case 25:
        v11 = CFSTR("USER_INITIATED");
        goto LABEL_17;
    }
  }
  else
  {
    switch(v9)
    {
      case 0:
        v11 = CFSTR("UNSPECIFIED");
        goto LABEL_17;
      case 9:
        v11 = CFSTR("BACKGROUND");
        goto LABEL_17;
      case 17:
        v11 = CFSTR("UTILITY");
        goto LABEL_17;
    }
  }
  _ANSTLoggingGetOSLogForCategoryANSTKit();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    sub_235911054(v10, v12);

  v11 = CFSTR("UNEXPECTED_ENUM_VALUE");
LABEL_17:
  ANSTForegroundSegmentationResolutionToNSString(self->_networkResolution);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v14, (uint64_t)CFSTR("ANSTForegroundSegmentationConfiguration [version %@, QoS %@, networkResolution %@]"), v6, v11, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (int64_t)networkResolution
{
  return self->_networkResolution;
}

- (void)setNetworkResolution:(int64_t)a3
{
  self->_networkResolution = a3;
}

@end
