@implementation NSFileAccessIntent

- (NSURL)URL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)writingOptions
{
  return self->_options;
}

- (BOOL)isRead
{
  return self->_isRead;
}

+ (NSFileAccessIntent)writingIntentWithURL:(NSURL *)url options:(NSFileCoordinatorWritingOptions)options
{
  uint64_t v6;

  objc_opt_class();
  v6 = objc_opt_new();
  *(_QWORD *)(v6 + 8) = url;
  *(_QWORD *)(v6 + 16) = options;
  *(_BYTE *)(v6 + 24) = 0;
  return (NSFileAccessIntent *)(id)v6;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSFileAccessIntent;
  -[NSFileAccessIntent dealloc](&v3, sel_dealloc);
}

+ (NSFileAccessIntent)readingIntentWithURL:(NSURL *)url options:(NSFileCoordinatorReadingOptions)options
{
  uint64_t v6;

  objc_opt_class();
  v6 = objc_opt_new();
  *(_QWORD *)(v6 + 8) = url;
  *(_QWORD *)(v6 + 16) = options;
  *(_BYTE *)(v6 + 24) = 1;
  return (NSFileAccessIntent *)(id)v6;
}

- (unint64_t)readingOptions
{
  return self->_options;
}

- (id)description
{
  id v3;
  const __CFString *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSFileAccessIntent;
  v3 = -[NSFileAccessIntent description](&v6, sel_description);
  if (self->_isRead)
    v4 = CFSTR("Reading");
  else
    v4 = CFSTR("Writing");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@ %@ with options: 0x%lx"), v3, v4, self->_url, self->_options);
}

- (void)setURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

@end
