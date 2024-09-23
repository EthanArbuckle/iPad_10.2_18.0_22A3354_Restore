@implementation MTLDebugSubProgram

- (NSString)filename
{
  return (NSString *)-[MTLDebugInstrumentationData stringForID:](self->_data, "stringForID:", self->_debugSubProgram->var0);
}

- (NSString)name
{
  return (NSString *)-[MTLDebugInstrumentationData stringForID:](self->_data, "stringForID:", self->_debugSubProgram->var1);
}

- (unsigned)line
{
  return self->_debugSubProgram->var2;
}

- (void)releaseInternal
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MTLDebugSubProgram;
  -[MTLDebugSubProgram release](&v2, sel_release);
}

@end
