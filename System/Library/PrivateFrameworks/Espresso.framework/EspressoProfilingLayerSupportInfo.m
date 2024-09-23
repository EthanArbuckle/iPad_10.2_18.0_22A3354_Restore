@implementation EspressoProfilingLayerSupportInfo

- (NSArray)error_public
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setError_public:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSArray)error_private
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setError_private:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)supported
{
  return self->_supported;
}

- (void)setSupported:(BOOL)a3
{
  self->_supported = a3;
}

- (BOOL)exists
{
  return self->_exists;
}

- (void)setExists:(BOOL)a3
{
  self->_exists = a3;
}

- (BOOL)has_perf_warning
{
  return self->_has_perf_warning;
}

- (void)setHas_perf_warning:(BOOL)a3
{
  self->_has_perf_warning = a3;
}

- (BOOL)internal_layer
{
  return self->_internal_layer;
}

- (void)setInternal_layer:(BOOL)a3
{
  self->_internal_layer = a3;
}

- (NSString)type
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_error_private, 0);
  objc_storeStrong((id *)&self->_error_public, 0);
}

@end
