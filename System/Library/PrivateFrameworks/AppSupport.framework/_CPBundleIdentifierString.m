@implementation _CPBundleIdentifierString

- (id)_initWithExecutablePath:(id)a3
{
  _CPBundleIdentifierString *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_CPBundleIdentifierString;
  v4 = -[_CPBundleIdentifierString init](&v6, sel_init);
  if (v4)
    v4->_executablePath = (NSString *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_CPBundleIdentifierString;
  -[_CPBundleIdentifierString dealloc](&v3, sel_dealloc);
}

- (void)_loadBundleIdentifierOrProcessName
{
  id v3;
  CFURLRef v4;
  const __CFURL *v5;
  __CFBundle *v6;
  __CFBundle *v7;

  objc_sync_enter(self);
  if (!self->_bundleIdentifierOrProcessName)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    self->_isProcessName = 0;
    v4 = CFURLCreateWithFileSystemPath(0, (CFStringRef)self->_executablePath, kCFURLPOSIXPathStyle, 0);
    if (v4)
    {
      v5 = (const __CFURL *)_CFBundleCopyBundleURLForExecutableURL();
      if (v5)
      {
        v6 = CFBundleCreate(0, v5);
        v7 = v6;
        if (v6)
        {
          self->_bundleIdentifierOrProcessName = (NSString *)(id)CFBundleGetIdentifier(v6);
          CFRelease(v7);
        }
        CFRelease(v5);
      }
      CFRelease(v4);
    }
    if (!self->_bundleIdentifierOrProcessName)
    {
      self->_bundleIdentifierOrProcessName = -[NSString lastPathComponent](self->_executablePath, "lastPathComponent");
      self->_isProcessName = 1;
    }

  }
  objc_sync_exit(self);
}

- (BOOL)_isProcessName
{
  -[_CPBundleIdentifierString _loadBundleIdentifierOrProcessName](self, "_loadBundleIdentifierOrProcessName");
  return self->_isProcessName;
}

- (unint64_t)length
{
  -[_CPBundleIdentifierString _loadBundleIdentifierOrProcessName](self, "_loadBundleIdentifierOrProcessName");
  return -[NSString length](self->_bundleIdentifierOrProcessName, "length");
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  -[_CPBundleIdentifierString _loadBundleIdentifierOrProcessName](self, "_loadBundleIdentifierOrProcessName");
  return -[NSString characterAtIndex:](self->_bundleIdentifierOrProcessName, "characterAtIndex:", a3);
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;

  length = a4.length;
  location = a4.location;
  -[_CPBundleIdentifierString _loadBundleIdentifierOrProcessName](self, "_loadBundleIdentifierOrProcessName");
  -[NSString getCharacters:range:](self->_bundleIdentifierOrProcessName, "getCharacters:range:", a3, location, length);
}

@end
