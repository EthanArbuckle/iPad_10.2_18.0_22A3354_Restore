@implementation EspressoProfilingLayerInfo

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)debug_name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDebug_name:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (int)selected_runtime_engine
{
  return self->_selected_runtime_engine;
}

- (void)setSelected_runtime_engine:(int)a3
{
  self->_selected_runtime_engine = a3;
}

- (EspressoProfilingLayerSupportInfo)main_engine_support
{
  return (EspressoProfilingLayerSupportInfo *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMain_engine_support:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSDictionary)per_platform_support
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPer_platform_support:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSArray)runtimes
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRuntimes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (double)average_runtime
{
  return self->_average_runtime;
}

- (void)setAverage_runtime:(double)a3
{
  self->_average_runtime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runtimes, 0);
  objc_storeStrong((id *)&self->_per_platform_support, 0);
  objc_storeStrong((id *)&self->_main_engine_support, 0);
  objc_storeStrong((id *)&self->_debug_name, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
