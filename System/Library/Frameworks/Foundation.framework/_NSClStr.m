@implementation _NSClStr

- (unsigned)characterAtIndex:(unint64_t)a3
{
  if (self->length <= a3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], CFSTR("Index out of bounds"), 0));
  return self->characters[a3];
}

- (unint64_t)length
{
  return self->length;
}

- (const)_fastCharacterContents
{
  return self->characters;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _NSClStr *v4;

  v4 = self;
  return self;
}

- (_NSClStr)initWithString:(id)a3
{
  _NSClStr *v4;
  uint64_t v5;
  unsigned __int16 *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("nil argument"), 0));
  }
  v8.receiver = self;
  v8.super_class = (Class)_NSClStr;
  v4 = -[NSString init](&v8, sel_init);
  v5 = objc_msgSend(a3, "length");
  v4->length = v5;
  v6 = (unsigned __int16 *)malloc_type_malloc(2 * v5, 0x1000040BDFB0063uLL);
  v4->characters = v6;
  objc_msgSend(a3, "getCharacters:range:", v6, 0, v4->length);
  return v4;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  memset_s(self->characters, 2 * self->length, 0, 2 * self->length);
  free(self->characters);
  v3.receiver = self;
  v3.super_class = (Class)_NSClStr;
  -[_NSClStr dealloc](&v3, sel_dealloc);
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  NSUInteger length;
  BOOL v5;
  NSUInteger v6;

  length = self->length;
  v5 = length >= a4.length;
  v6 = length - a4.length;
  if (!v5 || a4.location > v6)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], CFSTR("Range out of bounds"), 0));
  memcpy(a3, &self->characters[a4.location], 2 * a4.length);
}

- (_NSClStr)initWithCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4
{
  _NSClStr *v6;
  unsigned __int16 *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NULL argument"), 0));
  }
  v9.receiver = self;
  v9.super_class = (Class)_NSClStr;
  v6 = -[NSString init](&v9, sel_init);
  v6->length = a4;
  v7 = (unsigned __int16 *)malloc_type_malloc(2 * a4, 0x1000040BDFB0063uLL);
  v6->characters = v7;
  memcpy(v7, a3, 2 * v6->length);
  return v6;
}

- (_NSClStr)initWithUTF8String:(const char *)a3
{
  size_t v5;
  rsize_t v6;
  UniChar *v7;
  UniChar *v8;
  __CFString *MutableWithExternalCharactersNoCopy;
  const __CFString *v10;
  _NSClStr *v11;
  void *v13;
  uint64_t v14;
  const __CFString *v15;

  if (!a3)
  {

    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99778];
    v15 = CFSTR("NULL argument");
    goto LABEL_9;
  }
  v5 = strlen(a3);
  v6 = 2 * v5;
  v7 = (UniChar *)malloc_type_malloc(2 * v5, 0x1000040BDFB0063uLL);
  if (!v7)
  {

LABEL_8:
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99778];
    v15 = CFSTR("Invalid argument");
LABEL_9:
    objc_exception_throw((id)objc_msgSend(v13, "exceptionWithName:reason:userInfo:", v14, v15, 0));
  }
  v8 = v7;
  MutableWithExternalCharactersNoCopy = CFStringCreateMutableWithExternalCharactersNoCopy(0, v7, 0, v5, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  if (!MutableWithExternalCharactersNoCopy)
  {

    free(v8);
    goto LABEL_8;
  }
  v10 = MutableWithExternalCharactersNoCopy;
  CFStringAppendCString(MutableWithExternalCharactersNoCopy, a3, 0x8000100u);
  v11 = -[_NSClStr initWithCharacters:length:](self, "initWithCharacters:length:", v8, CFStringGetLength(v10));
  CFRelease(v10);
  memset_s(v8, v6, 0, v6);
  free(v8);
  return v11;
}

@end
