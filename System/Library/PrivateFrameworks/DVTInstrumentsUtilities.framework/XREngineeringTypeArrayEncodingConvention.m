@implementation XREngineeringTypeArrayEncodingConvention

- (NSArray)fixedTypes
{
  return self->_fixedTypes;
}

- (void)setFixedTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)remainderType
{
  return self->_remainderType;
}

- (void)setRemainderType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remainderType, 0);
  objc_storeStrong((id *)&self->_fixedTypes, 0);
}

@end
