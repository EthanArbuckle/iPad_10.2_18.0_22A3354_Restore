@implementation _WKTextManipulationConfiguration

- (void)dealloc
{
  objc_super v3;

  self->_exclusionRules = 0;
  v3.receiver = self;
  v3.super_class = (Class)_WKTextManipulationConfiguration;
  -[_WKTextManipulationConfiguration dealloc](&v3, sel_dealloc);
}

- (NSArray)exclusionRules
{
  return self->_exclusionRules;
}

- (void)setExclusionRules:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)includeSubframes
{
  return self->_includeSubframes;
}

- (void)setIncludeSubframes:(BOOL)a3
{
  self->_includeSubframes = a3;
}

@end
