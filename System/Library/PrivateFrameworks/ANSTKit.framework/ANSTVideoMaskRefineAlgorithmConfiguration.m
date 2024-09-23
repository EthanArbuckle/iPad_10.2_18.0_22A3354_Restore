@implementation ANSTVideoMaskRefineAlgorithmConfiguration

- (ANSTVideoMaskRefineAlgorithmConfiguration)init
{
  return (ANSTVideoMaskRefineAlgorithmConfiguration *)objc_msgSend_initWithVersion_(self, a2, 0x10000);
}

- (ANSTVideoMaskRefineAlgorithmConfiguration)initWithVersion:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ANSTVideoMaskRefineAlgorithmConfiguration;
  return -[ANSTConfiguration initWithVersion:](&v4, sel_initWithVersion_, a3);
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
  const char *v10;
  int v11;
  NSObject *v12;
  const char *v13;
  void *v14;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = objc_msgSend_version(self, a2, v2);
  ANSTVideoMaskRefineAlgorithmVersionToNSString(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_qualityOfService(self, v7, v8);
  v11 = v9;
  if (v9 > 20)
  {
    switch(v9)
    {
      case 21:
        objc_msgSend_stringWithFormat_(v4, v10, (uint64_t)CFSTR("ANSTVideoMaskRefineAlgorithmConfiguration [version %@, QoS %@]"), v6, CFSTR("DEFAULT"));
        goto LABEL_17;
      case 33:
        objc_msgSend_stringWithFormat_(v4, v10, (uint64_t)CFSTR("ANSTVideoMaskRefineAlgorithmConfiguration [version %@, QoS %@]"), v6, CFSTR("USER_INTERACTIVE"));
        goto LABEL_17;
      case 25:
        objc_msgSend_stringWithFormat_(v4, v10, (uint64_t)CFSTR("ANSTVideoMaskRefineAlgorithmConfiguration [version %@, QoS %@]"), v6, CFSTR("USER_INITIATED"));
        goto LABEL_17;
    }
  }
  else
  {
    switch(v9)
    {
      case 0:
        objc_msgSend_stringWithFormat_(v4, v10, (uint64_t)CFSTR("ANSTVideoMaskRefineAlgorithmConfiguration [version %@, QoS %@]"), v6, CFSTR("UNSPECIFIED"));
        goto LABEL_17;
      case 9:
        objc_msgSend_stringWithFormat_(v4, v10, (uint64_t)CFSTR("ANSTVideoMaskRefineAlgorithmConfiguration [version %@, QoS %@]"), v6, CFSTR("BACKGROUND"));
        goto LABEL_17;
      case 17:
        objc_msgSend_stringWithFormat_(v4, v10, (uint64_t)CFSTR("ANSTVideoMaskRefineAlgorithmConfiguration [version %@, QoS %@]"), v6, CFSTR("UTILITY"));
        goto LABEL_17;
    }
  }
  _ANSTLoggingGetOSLogForCategoryANSTKit();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    sub_2359100E8(v11, v12);

  objc_msgSend_stringWithFormat_(v4, v13, (uint64_t)CFSTR("ANSTVideoMaskRefineAlgorithmConfiguration [version %@, QoS %@]"), v6, CFSTR("UNEXPECTED_ENUM_VALUE"));
LABEL_17:
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
