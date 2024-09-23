@implementation _NUImageExportResult

- (NSData)destinationData
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDestinationData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationData, 0);
}

@end
