@implementation NSSimpleOrthography

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    objc_msgSend(a1, "setVersion:", 1);
}

+ (id)orthographyWithFlags:(unsigned int)a3
{
  return (id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithFlags:", *(_QWORD *)&a3);
}

- (NSSimpleOrthography)initWithFlags:(unsigned int)a3
{
  NSSimpleOrthography *result;
  uint64_t v7;
  NSString *v8;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v7 = objc_opt_class();
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid orthographyFlags=0 in -[%@ %s]"), v7, sel_getName(a2));

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v8, 0));
  }
  v9.receiver = self;
  v9.super_class = (Class)NSSimpleOrthography;
  result = -[NSSimpleOrthography init](&v9, sel_init);
  if (result)
    result->_orthographyFlags = a3;
  return result;
}

- (NSSimpleOrthography)initWithDominantScript:(id)a3 languageMap:(id)a4
{
  uint64_t v7;
  NSString *v8;

  if (!a3)
  {
    v7 = objc_opt_class();
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Invalid script=nil in -[%@ %s]"), v7, sel_getName(a2));

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v8, 0));
  }
  return -[NSSimpleOrthography initWithFlags:](self, "initWithFlags:", NSOrthographyFlagsForDominantScriptAndLanguageMap((uint64_t)a3, a4));
}

- (Class)classForCoder
{
  return (Class)NSSimpleOrthography;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = -[NSSimpleOrthography orthographyFlags](self, "orthographyFlags");
  v5 = v4;
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
    objc_msgSend(a3, "encodeInt32:forKey:", v4, CFSTR("NSOrthographyFlags"));
  else
    objc_msgSend(a3, "encodeValuesOfObjCTypes:", "I", &v5);
}

- (NSSimpleOrthography)initWithCoder:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  NSString *v10;
  unsigned int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
  {
    v6 = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("NSOrthographyFlags"));
    v11 = v6;
    return -[NSSimpleOrthography initWithFlags:](self, "initWithFlags:", v6);
  }
  v7 = objc_msgSend(a3, "versionForClassName:", CFSTR("NSSimpleOrthography"));
  if (v7 == 1)
  {
    objc_msgSend(a3, "decodeValuesOfObjCTypes:", "I", &v11);
    v6 = v11;
    return -[NSSimpleOrthography initWithFlags:](self, "initWithFlags:", v6);
  }
  v9 = v7;
  v10 = _NSFullMethodName((objc_class *)self, a2);
  NSLog((NSString *)CFSTR("%@: class version %ld cannot read instances archived with version %ld"), v10, 1, v9);
  -[NSSimpleOrthography dealloc](self, "dealloc");
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)dominantScript
{
  uint64_t v2;

  v2 = -[NSSimpleOrthography orthographyFlags](self, "orthographyFlags") >> 27;
  if (!(_DWORD)v2)
    return 0;
  if (v2 == 1)
    return CFSTR("Zyyy");
  return (id)objc_msgSend(&unk_1E0FCEA58, "objectAtIndex:");
}

- (id)languageMap
{
  return NSOrthographyLanguageMapForFlags(-[NSSimpleOrthography orthographyFlags](self, "orthographyFlags"));
}

- (unsigned)orthographyFlags
{
  return self->_orthographyFlags;
}

- (id)languagesForScript:(id)a3
{
  id result;

  result = (id)NSOrthographyDominantLanguageForFlagsAndScriptIndex(-[NSSimpleOrthography orthographyFlags](self, "orthographyFlags"), objc_msgSend(&unk_1E0FCE8F0, "indexOfObject:", a3));
  if (result)
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", result);
  return result;
}

- (id)dominantLanguageForScript:(id)a3
{
  return (id)NSOrthographyDominantLanguageForFlagsAndScriptIndex(-[NSSimpleOrthography orthographyFlags](self, "orthographyFlags"), objc_msgSend(&unk_1E0FCE8F0, "indexOfObject:", a3));
}

- (id)dominantLanguage
{
  unsigned int v2;

  v2 = -[NSSimpleOrthography orthographyFlags](self, "orthographyFlags");
  return (id)NSOrthographyDominantLanguageForFlagsAndScriptIndex(v2, v2 >> 27);
}

- (id)allScripts
{
  return NSOrthographyAllScriptsForFlags(-[NSSimpleOrthography orthographyFlags](self, "orthographyFlags"));
}

- (id)allLanguages
{
  return NSOrthographyAllLanguagesForFlags(-[NSSimpleOrthography orthographyFlags](self, "orthographyFlags"));
}

@end
