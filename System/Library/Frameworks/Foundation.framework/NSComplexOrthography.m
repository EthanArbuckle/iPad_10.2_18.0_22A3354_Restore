@implementation NSComplexOrthography

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    objc_msgSend(a1, "setVersion:", 1);
}

- (NSComplexOrthography)initWithDominantScript:(id)a3 languageMap:(id)a4
{
  id v7;
  void *v8;
  uint64_t v11;
  NSString *v12;
  objc_super v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v11 = objc_opt_class();
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid script=nil in -[%@ %s]"), v11, sel_getName(a2));

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v12, 0));
  }
  v13.receiver = self;
  v13.super_class = (Class)NSComplexOrthography;
  v7 = -[NSComplexOrthography init](&v13, sel_init);
  if (v7)
  {
    *((_QWORD *)v7 + 1) = objc_msgSend(a3, "copy");
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", a4);
    *((_QWORD *)v7 + 2) = v8;
    *((_DWORD *)v7 + 6) = NSOrthographyFlagsForDominantScriptAndLanguageMap(*((_QWORD *)v7 + 1), v8);
  }
  return (NSComplexOrthography *)v7;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSComplexOrthography;
  -[NSComplexOrthography dealloc](&v3, sel_dealloc);
}

- (id)dominantScript
{
  return self->_dominantScript;
}

- (id)languageMap
{
  return self->_languageMap;
}

- (unsigned)orthographyFlags
{
  return self->_orthographyFlags;
}

@end
