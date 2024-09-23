@implementation _MTLFunctionLogDebugLocation

- (_MTLFunctionLogDebugLocation)initWithDebugLocation:(id)a3
{
  _MTLFunctionLogDebugLocation *v4;
  MTLDebugLocation *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_MTLFunctionLogDebugLocation;
  v4 = -[_MTLFunctionLogDebugLocation init](&v8, sel_init);
  v5 = (MTLDebugLocation *)a3;
  v4->_debugLocation = v5;
  v6 = -[MTLDebugSubProgram filename](-[MTLDebugLocation scope](v5, "scope"), "filename");
  if (v6)
    v4->_URL = (NSURL *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", v6);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MTLFunctionLogDebugLocation;
  -[_MTLFunctionLogDebugLocation dealloc](&v3, sel_dealloc);
}

- (NSString)functionName
{
  return -[MTLDebugSubProgram name](-[MTLDebugLocation scope](self->_debugLocation, "scope"), "name");
}

- (unint64_t)line
{
  return -[MTLDebugLocation line](self->_debugLocation, "line");
}

- (unint64_t)column
{
  return -[MTLDebugLocation column](self->_debugLocation, "column");
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@() - %@:%u:%u"), -[MTLDebugSubProgram name](-[MTLDebugLocation scope](self->_debugLocation, "scope"), "name"), -[NSURL path](self->_URL, "path"), -[MTLDebugLocation line](self->_debugLocation, "line"), -[MTLDebugLocation column](self->_debugLocation, "column"));
}

- (NSURL)URL
{
  return self->_URL;
}

@end
