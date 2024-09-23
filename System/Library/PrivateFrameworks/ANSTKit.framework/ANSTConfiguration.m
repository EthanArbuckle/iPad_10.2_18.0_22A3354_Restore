@implementation ANSTConfiguration

+ (id)new
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___ANSTConfiguration;
  return objc_msgSendSuper2(&v3, "new");
}

- (ANSTConfiguration)init
{
  ANSTConfiguration *result;

  result = (ANSTConfiguration *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTConfiguration)initWithVersion:(unint64_t)a3
{
  ANSTConfiguration *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ANSTConfiguration;
  result = -[ANSTConfiguration init](&v5, sel_init);
  if (result)
  {
    result->_version = a3;
    result->_networkEngineType = 0;
    result->_qualityOfService = 21;
  }
  return result;
}

- (unint64_t)version
{
  return self->_version;
}

- (int64_t)networkEngineType
{
  return self->_networkEngineType;
}

- (void)setNetworkEngineType:(int64_t)a3
{
  self->_networkEngineType = a3;
}

- (unsigned)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(unsigned int)a3
{
  self->_qualityOfService = a3;
}

@end
