@implementation _NUExportResult

- (NSURL)destinationURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDestinationURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NUImageGeometry)geometry
{
  return (NUImageGeometry *)objc_getProperty(self, a2, 24, 1);
}

- (void)setGeometry:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geometry, 0);
  objc_storeStrong((id *)&self->_destinationURL, 0);
}

@end
