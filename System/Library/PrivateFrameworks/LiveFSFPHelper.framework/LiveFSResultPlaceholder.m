@implementation LiveFSResultPlaceholder

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)filename
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFilename:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSNumber)modTime
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setModTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDictionary)xattrs
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setXattrs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xattrs, 0);
  objc_storeStrong((id *)&self->_modTime, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
