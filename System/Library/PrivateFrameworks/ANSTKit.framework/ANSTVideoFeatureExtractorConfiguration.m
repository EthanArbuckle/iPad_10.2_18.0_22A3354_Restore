@implementation ANSTVideoFeatureExtractorConfiguration

- (ANSTVideoFeatureExtractorConfiguration)init
{
  return (ANSTVideoFeatureExtractorConfiguration *)objc_msgSend_initWithVersion_(self, a2, 0x10000);
}

- (ANSTVideoFeatureExtractorConfiguration)initWithVersion:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ANSTVideoFeatureExtractorConfiguration;
  return -[ANSTConfiguration initWithVersion:](&v4, sel_initWithVersion_, a3);
}

- (id)description
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_msgSend_version(self, a2, v2);
  ANSTVideoFeatureExtractorVersionToNSString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("ANSTVideoFeatureExtractorConfiguration [version %@]"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
