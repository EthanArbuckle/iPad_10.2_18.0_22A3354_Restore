@implementation BWColorLookupCacheEntry

- (BWColorLookupCacheEntry)initWithForegroundColorLookupTable:(id)a3 backgroundColorLookupTable:(id)a4
{
  BWColorLookupCacheEntry *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BWColorLookupCacheEntry;
  v6 = -[BWColorLookupCacheEntry init](&v8, sel_init);
  if (v6)
  {
    v6->_foregroundColorLookupTable = (NSData *)a3;
    v6->_backgroundColorLookupTable = (NSData *)a4;
  }
  return v6;
}

- (NSData)foregroundColorLookupTable
{
  return self->_foregroundColorLookupTable;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWColorLookupCacheEntry;
  -[BWColorLookupCacheEntry dealloc](&v3, sel_dealloc);
}

- (NSData)backgroundColorLookupTable
{
  return self->_backgroundColorLookupTable;
}

@end
