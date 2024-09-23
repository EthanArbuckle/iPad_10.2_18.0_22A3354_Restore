@implementation __NSCFMemoryURLCredentialStorage

- (__NSCFMemoryURLCredentialStorage)init
{
  const __CFDictionary *v3;
  _QWORD *v4;
  __NSCFMemoryURLCredentialStorage *v5;
  objc_super v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = CFSTR("kCFURLStorageSessionIsPrivate");
  v9[0] = *MEMORY[0x1E0C9AE50];
  v3 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v4 = _CFURLCredentialStorageCreateWithProperties((const __CFAllocator *)*MEMORY[0x1E0C9AE00], 0, v3);
  v7.receiver = self;
  v7.super_class = (Class)__NSCFMemoryURLCredentialStorage;
  v5 = -[NSURLCredentialStorage _initWithCFURLCredentialStorage:](&v7, sel__initWithCFURLCredentialStorage_, v4);
  if (v4)
    CFRelease(v4);
  return v5;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)__NSCFMemoryURLCredentialStorage;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Ephemeral %@"), -[__NSCFMemoryURLCredentialStorage description](&v3, sel_description));
}

@end
