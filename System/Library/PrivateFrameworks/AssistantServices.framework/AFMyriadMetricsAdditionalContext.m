@implementation AFMyriadMetricsAdditionalContext

- (AFMyriadMetricsAdditionalContext)initWithRawGoodnessScore:(unsigned __int8)a3 goodnessScore:(unsigned __int8)a4 deviceClass:(unsigned __int8)a5 deviceProductType:(unsigned __int8)a6
{
  AFMyriadMetricsAdditionalContext *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AFMyriadMetricsAdditionalContext;
  result = -[AFMyriadMetricsAdditionalContext init](&v11, sel_init);
  if (result)
  {
    result->_rawGoodnessScore = a3;
    result->_goodnessScore = a4;
    result->_deviceClass = a5;
    result->_deviceProductType = a6;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("raw Goodness = %d, boosted goodness = %d  class = %d, product type = %d"), -[AFMyriadMetricsAdditionalContext rawGoodnessScore](self, "rawGoodnessScore"), -[AFMyriadMetricsAdditionalContext goodnessScore](self, "goodnessScore"), -[AFMyriadMetricsAdditionalContext deviceClass](self, "deviceClass"), -[AFMyriadMetricsAdditionalContext deviceProductType](self, "deviceProductType"));
}

- (unsigned)rawGoodnessScore
{
  return self->_rawGoodnessScore;
}

- (unsigned)goodnessScore
{
  return self->_goodnessScore;
}

- (unsigned)deviceClass
{
  return self->_deviceClass;
}

- (unsigned)deviceProductType
{
  return self->_deviceProductType;
}

@end
