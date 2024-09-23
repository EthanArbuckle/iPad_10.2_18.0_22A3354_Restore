@implementation NSURLDirectoryEnumerator

- (id)nextObject
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  int v6;
  CFTypeRef cf;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  cf = 0;
  v9[0] = 0;
  if (self->shouldContinue)
  {
    v3 = MEMORY[0x186DA73AC](self->_enumerator, v9, &cf);
    if ((unint64_t)(v3 - 1) < 2)
    {
      self->isPostOrderDirectory = 0;
    }
    else if (v3 == 3)
    {
      self->isPostOrderDirectory = 0;
      if (self->_errorHandler)
      {
        v4 = (void *)objc_msgSend((id)cf, "userInfo");
        if (!objc_msgSend(v4, "objectForKey:", CFSTR("NSURL")))
        {
          v5 = objc_msgSend(v4, "objectForKey:", CFSTR("NSFilePath"));
          if (v5)
            objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v5, 1);
        }
        v6 = (*((uint64_t (**)(void))self->_errorHandler + 2))();
        self->shouldContinue = v6;
        if (v6)
          v9[0] = -[NSURLDirectoryEnumerator nextObject](self, "nextObject");
      }
      if (cf)
        CFRelease(cf);
    }
    else if (v3 == 4)
    {
      self->isPostOrderDirectory = 1;
    }
  }
  return (id)v9[0];
}

uint64_t __88__NSURLDirectoryEnumerator_initWithURL_includingPropertiesForKeys_options_errorHandler___block_invoke()
{
  return 1;
}

- (NSURLDirectoryEnumerator)initWithURL:(id)a3 includingPropertiesForKeys:(id)a4 options:(unint64_t)a5 errorHandler:(id)a6
{
  unint64_t v10;
  __CFURLEnumerator *v11;
  id v12;

  if (!a4 && !a5)
    a4 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *MEMORY[0x1E0C9B520]);
  v10 = (a5 & 1 | (2 * ((a5 >> 2) & 1)) & 0xFFFFFFFFFFFFFFF7 | (8 * ((a5 >> 1) & 1))) ^ 1;
  if ((a5 & 8) != 0)
    v10 |= 0x30uLL;
  v11 = (__CFURLEnumerator *)MEMORY[0x186DA7394](*MEMORY[0x1E0C9AE30], a3, a5 & 0x80000000 | (((a5 >> 4) & 1) << 6) | v10, a4);
  self->_enumerator = v11;
  if (v11)
  {
    if (a6)
      v12 = a6;
    else
      v12 = &__block_literal_global_181;
    -[NSURLDirectoryEnumerator setErrorHandler:](self, "setErrorHandler:", v12);
    self->shouldContinue = 1;
  }
  else
  {

    return 0;
  }
  return self;
}

- (void)setErrorHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void)dealloc
{
  __CFURLEnumerator *enumerator;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  enumerator = self->_enumerator;
  if (enumerator)
    CFRelease(enumerator);

  v4.receiver = self;
  v4.super_class = (Class)NSURLDirectoryEnumerator;
  -[NSURLDirectoryEnumerator dealloc](&v4, sel_dealloc);
}

- (void)skipDescendants
{
  JUMPOUT(0x186DA73B8);
}

- (unint64_t)level
{
  JUMPOUT(0x186DA73A0);
}

- (id)fileAttributes
{
  return 0;
}

- (id)directoryAttributes
{
  return 0;
}

- (BOOL)isEnumeratingDirectoryPostOrder
{
  return self->isPostOrderDirectory;
}

- (id)errorHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

@end
