@implementation EspressoProfilingANEcompilerAnalytics

- (NSArray)compiler_analytics_file_names
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCompiler_analytics_file_names:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compiler_analytics_file_names, 0);
}

@end
