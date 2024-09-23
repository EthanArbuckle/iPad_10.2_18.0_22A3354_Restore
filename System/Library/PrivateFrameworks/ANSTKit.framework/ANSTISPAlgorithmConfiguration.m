@implementation ANSTISPAlgorithmConfiguration

- (ANSTISPAlgorithmConfiguration)init
{
  return (ANSTISPAlgorithmConfiguration *)objc_msgSend_initWithVersion_(self, a2, 0x10000);
}

- (ANSTISPAlgorithmConfiguration)initWithVersion:(unint64_t)a3
{
  ANSTISPAlgorithmConfiguration *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ANSTISPAlgorithmConfiguration;
  result = -[ANSTConfiguration initWithVersion:](&v4, sel_initWithVersion_, a3);
  if (result)
  {
    result->_enableObjectTracking = 1;
    result->_enableSegmentation = 1;
    result->_networkResolution = 0;
    result->_runningFrameRate = 0;
  }
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
  __CFString *v13;
  __CFString *v14;
  int64_t networkResolution;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  const char *v20;
  void *v21;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = objc_msgSend_version(self, a2, v2);
  ANSTISPAlgorithmVersionToNSString(v5);
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
  if (self->_enableObjectTracking)
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  if (self->_enableSegmentation)
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  networkResolution = self->_networkResolution;
  v16 = v14;
  v17 = v13;
  ANSTISPAlgorithmResolutionToNSString(networkResolution);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  ANSTISPAlgorithmRunningFrameRateToNSString(self->_runningFrameRate);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v4, v20, (uint64_t)CFSTR("ANSTISPAlgorithmConfiguration [version %@, QoS %@, enableOD %@, enableSeg %@, networkResolution %@, runningFrameRate %@]"), v6, v11, v17, v16, v18, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (BOOL)enableObjectTracking
{
  return self->_enableObjectTracking;
}

- (void)setEnableObjectTracking:(BOOL)a3
{
  self->_enableObjectTracking = a3;
}

- (BOOL)enableSegmentation
{
  return self->_enableSegmentation;
}

- (void)setEnableSegmentation:(BOOL)a3
{
  self->_enableSegmentation = a3;
}

- (int64_t)networkResolution
{
  return self->_networkResolution;
}

- (void)setNetworkResolution:(int64_t)a3
{
  self->_networkResolution = a3;
}

- (int64_t)runningFrameRate
{
  return self->_runningFrameRate;
}

- (void)setRunningFrameRate:(int64_t)a3
{
  self->_runningFrameRate = a3;
}

@end
