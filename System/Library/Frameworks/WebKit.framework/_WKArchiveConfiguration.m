@implementation _WKArchiveConfiguration

- (void)dealloc
{
  objc_super v3;

  self->_directory = 0;
  self->_suggestedFileName = 0;

  self->_exclusionRules = 0;
  v3.receiver = self;
  v3.super_class = (Class)_WKArchiveConfiguration;
  -[_WKArchiveConfiguration dealloc](&v3, sel_dealloc);
}

- (NSURL)directory
{
  return self->_directory;
}

- (void)setDirectory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)suggestedFileName
{
  return self->_suggestedFileName;
}

- (void)setSuggestedFileName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)exclusionRules
{
  return self->_exclusionRules;
}

- (void)setExclusionRules:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

@end
