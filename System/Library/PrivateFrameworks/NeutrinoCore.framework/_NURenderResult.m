@implementation _NURenderResult

- (NURenderStatistics)statistics
{
  return (NURenderStatistics *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStatistics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statistics, 0);
}

@end
