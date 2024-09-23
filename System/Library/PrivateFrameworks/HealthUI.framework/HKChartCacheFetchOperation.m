@implementation HKChartCacheFetchOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSCopying)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

@end
