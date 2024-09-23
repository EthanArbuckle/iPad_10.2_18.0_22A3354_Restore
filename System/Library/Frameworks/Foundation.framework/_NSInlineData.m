@implementation _NSInlineData

- (BOOL)_isCompact
{
  return 1;
}

- (unint64_t)length
{
  return self->_length;
}

- (_NSInlineData)initWithBytes:(const void *)a3 length:(unint64_t)a4
{
  uint64_t v4;
  void *IndexedIvars;

  if (*MEMORY[0x1E0C9AA80])
    ((void (*)(_NSInlineData *, uint64_t, _QWORD))*MEMORY[0x1E0C9AA80])(self, v4, *MEMORY[0x1E0C9AA10]);
  self->_length = a4;
  IndexedIvars = object_getIndexedIvars(self);
  memmove(IndexedIvars, a3, a4);
  return self;
}

+ (id)_allocWithExtraBytes:(unint64_t)a3
{
  return NSAllocateObject((Class)_NSInlineData, a3, 0);
}

- (BOOL)_providesConcreteBacking
{
  return 1;
}

- (id)_createDispatchData
{
  return (id)_NSDataCreateDispatchDataFromData(self, 0);
}

- (_NSInlineData)initWithCoder:(id)a3
{
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];

  v5 = CFSTR("NSDebugDescription");
  v6[0] = CFSTR("Decoding instances of _NSInlineData is not supported");
  objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 4864, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1)));
  return 0;
}

@end
