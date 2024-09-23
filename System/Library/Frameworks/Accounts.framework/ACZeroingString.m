@implementation ACZeroingString

- (ACZeroingString)initWithCoder:(id)a3
{
  id v4;
  ACZeroingString *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  ACZeroingString *v12;
  unsigned __int16 *v13;
  unsigned __int16 *v14;
  ACZeroingString *v15;
  uint64_t v16;
  id v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ACZeroingString;
  v5 = -[ACZeroingString init](&v19, sel_init);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AC.bytes"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("AC.length"));
      if (v7 < 0)
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Failed to allocate backing character buffer"), 0);
        v18 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v18);
      }
      v8 = v7;
      v9 = 2 * v7;
      if (2 * v7 > (unint64_t)objc_msgSend(v6, "length"))
      {
        _ACLogSystem();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[ACZeroingString initWithCoder:].cold.1(v10);
LABEL_16:

        v15 = 0;
        goto LABEL_17;
      }
      v13 = (unsigned __int16 *)malloc_type_malloc(v9, 0x138CB77AuLL);
      v5->_characters = v13;
      if (!v13)
      {
        _ACLogSystem();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[ACZeroingString initWithCoder:].cold.2(v9, v10, v16);
        goto LABEL_16;
      }
      v14 = v13;
      v5->_length = v8;
      v12 = objc_retainAutorelease(v6);
      memcpy(v14, (const void *)-[ACZeroingString bytes](v12, "bytes"), v9);
    }
    else
    {
      _ACLogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[ACZeroingString initWithCoder:].cold.3((uint64_t)v4, v11);

      v12 = v5;
      v5 = 0;
    }

  }
  v5 = v5;
  v15 = v5;
LABEL_17:

  return v15;
}

- (ACZeroingString)initWithString:(id)a3
{
  id v5;
  ACZeroingString *v6;
  uint64_t v7;
  unsigned __int16 *v8;
  void *v10;
  id v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACZeroingString.m"), 78, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("string"));

  }
  v12.receiver = self;
  v12.super_class = (Class)ACZeroingString;
  v6 = -[ACZeroingString init](&v12, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "length");
    v6->_length = v7;
    if (v7 < 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Failed to allocate backing character buffer"), 0);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v11);
    }
    v8 = (unsigned __int16 *)malloc_type_malloc(2 * v7, 0x36F200F0uLL);
    v6->_characters = v8;
    objc_msgSend(v5, "getCharacters:range:", v8, 0, v6->_length);
  }

  return v6;
}

- (unint64_t)length
{
  return self->_length;
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  id v4;

  if (self->_length < a4.location + a4.length)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], CFSTR("Range out of bounds"), 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }
  memcpy(a3, &self->_characters[a4.location], 2 * a4.length);
}

- (BOOL)_allowsDirectEncoding
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  objc_super v3;

  memset_s(self->_characters, 2 * self->_length, 0, 2 * self->_length);
  free(self->_characters);
  v3.receiver = self;
  v3.super_class = (Class)ACZeroingString;
  -[ACZeroingString dealloc](&v3, sel_dealloc);
}

uint64_t __35__ACZeroingString_encodeWithCoder___block_invoke(uint64_t a1)
{
  memset_s(*(void **)(a1 + 32), *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 40));
  return ACDeallocateMemoryPages(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (id)replacementObjectForCoder:(id)a3
{
  id v4;
  char isKindOfClass;
  ACZeroingString *v6;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v6 = self;
  }
  else
  {
    -[ACZeroingString _compatibleCopy](self, "_compatibleCopy");
    v6 = (ACZeroingString *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  unint64_t length;
  void *v6;
  NSUInteger v7;
  vm_address_t v8;
  void *v9;
  unsigned __int16 *characters;
  size_t v11;
  dispatch_data_t v12;
  NSUInteger v13;
  id v14;
  _QWORD v15[6];

  v4 = a3;
  length = self->_length;
  if ((length & 0x8000000000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Failed to allocate backing character buffer"), 0);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v14);
  }
  v6 = v4;
  v7 = 2 * length;
  v8 = ACAllocateMemoryPages(2 * length);
  v9 = (void *)v8;
  characters = self->_characters;
  if (length >= 0x40000)
  {
    if (((NSPageSize() - 1) & ((unint64_t)characters | v8)) != 0)
    {
      v8 = (vm_address_t)v9;
      v11 = 2 * length;
    }
    else
    {
      v13 = NSRoundDownToMultipleOfPageSize(v7);
      NSCopyMemoryPages(characters, v9, v13);
      characters = (unsigned __int16 *)((char *)characters + v13);
      v8 = (vm_address_t)v9 + v13;
      v11 = v7 - v13;
      if (v7 == v13)
        goto LABEL_7;
    }
    goto LABEL_6;
  }
  v11 = 2 * length;
  if (v7)
LABEL_6:
    memmove((void *)v8, characters, v11);
LABEL_7:
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __35__ACZeroingString_encodeWithCoder___block_invoke;
  v15[3] = &__block_descriptor_48_e5_v8__0l;
  v15[4] = v9;
  v15[5] = v7;
  v12 = dispatch_data_create(v9, v7, 0, v15);
  objc_msgSend(v6, "encodeObject:forKey:", v12, CFSTR("AC.bytes"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_length, CFSTR("AC.length"));

}

- (ACZeroingString)initWithBytes:(const void *)a3 length:(unint64_t)a4 encoding:(unint64_t)a5
{
  ACZeroingString *v10;
  CFStringEncoding v11;
  const __CFString *v12;
  const __CFString *v13;
  CFIndex Length;
  BOOL v15;
  CFIndex v16;
  CFIndex v17;
  size_t v18;
  UniChar *v19;
  unsigned __int16 *v20;
  ACZeroingString *v21;
  ACZeroingString *v22;
  id v24;
  void *v25;
  void *v26;
  objc_super v27;
  CFRange v28;

  if (!a4)
  {
    objc_msgSend((id)objc_opt_class(), "_emptyString");
    v21 = (ACZeroingString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  if (a3)
  {
    if (a5)
      goto LABEL_4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACZeroingString.m"), 114, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bytes"));

    if (a5)
      goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACZeroingString.m"), 115, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("encoding"));

LABEL_4:
  v27.receiver = self;
  v27.super_class = (Class)ACZeroingString;
  v10 = -[ACZeroingString init](&v27, sel_init);
  if (v10)
  {
    v11 = CFStringConvertNSStringEncodingToEncoding(a5);
    if (CFStringIsEncodingAvailable(v11))
    {
      v12 = CFStringCreateWithBytesNoCopy(0, (const UInt8 *)a3, a4, v11, 1u, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
      if (v12)
      {
        v13 = v12;
        Length = CFStringGetLength(v12);
        v15 = Length < 0;
        if (Length >= 0)
          v16 = Length;
        else
          v16 = -Length;
        if (!(2 * v16))
          v15 = 0;
        if ((v16 & 0x8000000000000000) == 0 && !v15)
        {
          v17 = Length;
          v18 = Length >= 0 ? 2 * v16 : -2 * v16;
          v19 = (UniChar *)malloc_type_malloc(v18, 0xCCE6701AuLL);
          if (v19)
          {
            v20 = v19;
            v28.location = 0;
            v28.length = v17;
            CFStringGetCharacters(v13, v28, v19);
            v10->_length = v17;
            CFRelease(v13);
            v10->_characters = v20;
            goto LABEL_19;
          }
        }
        CFRelease(v13);
      }
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Failed to allocate backing character buffer"), 0);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v24);
  }
LABEL_19:
  v21 = v10;
  self = v21;
LABEL_21:
  v22 = v21;

  return v22;
}

+ (id)_emptyString
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithString:", &stru_1E4894AE8);
}

- (ACZeroingString)initWithCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4
{
  ACZeroingString *v7;
  ACZeroingString *v8;
  size_t v9;
  unsigned __int16 *v10;
  ACZeroingString *v11;
  ACZeroingString *v12;
  void *v15;
  id v16;
  objc_super v17;

  if (a4)
  {
    if (!a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACZeroingString.m"), 96, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("characters"));

    }
    v17.receiver = self;
    v17.super_class = (Class)ACZeroingString;
    v7 = -[ACZeroingString init](&v17, sel_init);
    v8 = v7;
    if (v7)
    {
      v7->_length = a4;
      if ((a4 & 0x8000000000000000) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Failed to allocate backing character buffer"), 0);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v16);
      }
      v9 = 2 * a4;
      v10 = (unsigned __int16 *)malloc_type_malloc(v9, 0x93FA923DuLL);
      v8->_characters = v10;
      memcpy(v10, a3, v9);
    }
    v11 = v8;
    self = v11;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_emptyString");
    v11 = (ACZeroingString *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  return v12;
}

- (ACZeroingString)initWithUTF8String:(const char *)a3
{
  void *v7;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACZeroingString.m"), 124, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cString"));

  }
  return -[ACZeroingString initWithBytes:length:encoding:](self, "initWithBytes:length:encoding:", a3, strlen(a3), 4);
}

- (Class)classForKeyedArchiver
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  unint64_t length;
  _QWORD *v6;
  size_t v7;
  void *v8;
  id v10;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  length = self->_length;
  if ((length & 0x8000000000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Failed to allocate backing character buffer"), 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v10);
  }
  v6 = (_QWORD *)v4;
  v7 = 2 * length;
  v8 = malloc_type_malloc(2 * length, 0xB5A1222AuLL);
  v6[1] = v8;
  v6[2] = self->_length;
  memcpy(v8, self->_characters, v7);
  return v6;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  id v4;

  if (self->_length <= a3)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], CFSTR("Index out of bounds"), 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }
  return self->_characters[a3];
}

- (id)_compatibleCopy
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "_newZStringWithCharacters:length:", self->_characters, self->_length);
}

- (unsigned)characters
{
  return self->_characters;
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A2BCD000, log, OS_LOG_TYPE_ERROR, "\"ACZeroingString length mismatch\", v1, 2u);
}

- (void)initWithCoder:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = a1;
  OUTLINED_FUNCTION_0_2(&dword_1A2BCD000, a2, a3, "\"ACZeroingString malloc failed to return %lu\", (uint8_t *)&v3);
}

- (void)initWithCoder:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_0_2(&dword_1A2BCD000, a2, v5, "\"ACZeroingString is being used with a decoder of type %@, which is not allowed.\", (uint8_t *)&v6);

}

@end
