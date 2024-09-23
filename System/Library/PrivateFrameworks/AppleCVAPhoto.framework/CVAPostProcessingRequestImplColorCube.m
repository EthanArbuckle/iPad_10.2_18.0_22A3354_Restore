@implementation CVAPostProcessingRequestImplColorCube

- (NSData)backgroundColorCube
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBackgroundColorCube:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSData)foregroundColorCube
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (void)setForegroundColorCube:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSData)singleColorCube
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSingleColorCube:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)isMono
{
  return self->_isMono;
}

- (void)setIsMono:(BOOL)a3
{
  self->_isMono = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_singleColorCube, 0);
  objc_storeStrong((id *)&self->_foregroundColorCube, 0);
  objc_storeStrong((id *)&self->_backgroundColorCube, 0);
}

@end
