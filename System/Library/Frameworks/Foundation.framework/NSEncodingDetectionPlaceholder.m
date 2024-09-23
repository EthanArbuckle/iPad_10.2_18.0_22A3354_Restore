@implementation NSEncodingDetectionPlaceholder

- (unint64_t)nsEncoding
{
  return self->nsEncoding;
}

- (unsigned)cfEncoding
{
  return self->cfEncoding;
}

- (NSString)string
{
  return self->string;
}

- (char)bytes
{
  return self->bytesStart;
}

- (unint64_t)bytesLength
{
  return self->bytesLength;
}

- (void)dealloc
{
  char *bytes;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];

  bytes = self->bytes;
  if (bytes)
  {
    free(bytes);
    self->bytes = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)NSEncodingDetectionPlaceholder;
  -[NSEncodingDetectionPlaceholder dealloc](&v4, sel_dealloc);
}

+ (id)placeholderForDetector:(id)a3
{
  uint64_t v4;
  unsigned int v5;
  id v6;
  size_t v8;
  _QWORD *p_isa;
  unsigned __int16 *v10;
  unsigned __int16 *v11;
  unsigned __int16 *v12;
  unsigned int v13;
  unint64_t v14;
  uint64_t v15;
  int v16;
  NSEncodingDetectionPlaceholder *v17;
  _QWORD *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  if (qword_1ECD09AE8 != -1)
    dispatch_once(&qword_1ECD09AE8, &__block_literal_global);
  v4 = objc_msgSend(a3, "nsEncoding");
  v5 = objc_msgSend(a3, "cfEncoding");
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_89);
  v6 = (id)objc_msgSend((id)qword_1ECD09AF0, "objectForKey:", v5);
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_89);
  if (v6)
    return v6;
  v8 = objc_msgSend(CFSTR("#<^_NSEDR_^#<"), "lengthOfBytesUsingEncoding:", v4);
  p_isa = (_QWORD *)v8;
  if (v8)
  {
    v19[0] = 0;
    if (v5 - 2080 > 2)
    {
      v11 = (unsigned __int16 *)malloc_type_malloc(v8, 0x100004077774924uLL);
      if (objc_msgSend(CFSTR("#<^_NSEDR_^#<"), "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v11, p_isa, v19, v4, 0, 0, objc_msgSend(CFSTR("#<^_NSEDR_^#<"), "length"), 0))
      {
        HIDWORD(v14) = v5 - 256;
        LODWORD(v14) = v5 - 256;
        v13 = v14 >> 26;
        if (v13 <= 7)
        {
          if (((1 << v13) & 0x31) != 0)
          {
            v16 = *v11;
            if (v16 != 65534 && v16 != 65279)
              goto LABEL_10;
            v12 = v11 + 1;
            v15 = v19[0] - 2;
          }
          else if (((1 << v13) & 0xC8) != 0)
          {
            if (*(_DWORD *)v11 != 65534 && *(_DWORD *)v11 != 65279)
              goto LABEL_10;
            v12 = v11 + 2;
            v15 = v19[0] - 4;
          }
          else
          {
            if (v13 != 2)
              goto LABEL_10;
            v15 = v19[0] - 3;
            if (v19[0] < 3uLL
              || *(unsigned __int8 *)v11 != 239
              || *((unsigned __int8 *)v11 + 1) != 187
              || *((unsigned __int8 *)v11 + 2) != 191)
            {
              goto LABEL_10;
            }
            v12 = (unsigned __int16 *)((char *)v11 + 3);
          }
          v19[0] = v15;
          goto LABEL_25;
        }
LABEL_10:
        v12 = v11;
LABEL_25:
        p_isa = 0;
        if (v11 && v12)
        {
          v17 = objc_alloc_init(NSEncodingDetectionPlaceholder);
          p_isa = &v17->super.isa;
          if (v17)
          {
            v17->nsEncoding = v4;
            v17->cfEncoding = v5;
            v17->string = (NSString *)CFSTR("#<^_NSEDR_^#<");
            p_isa[4] = v11;
            p_isa[5] = v19[0];
            p_isa[6] = v12;
            v18 = p_isa;
            os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_89);
            objc_msgSend((id)qword_1ECD09AF0, "setObject:forKey:", p_isa, v5);
            os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_89);
          }
        }
        return p_isa;
      }
    }
    else
    {
      v10 = (unsigned __int16 *)malloc_type_malloc(v8 + 3, 0xDC9280E4uLL);
      if (!v10)
        return 0;
      v11 = v10;
      *v10 = 10267;
      *((_BYTE *)v10 + 2) = 66;
      if (objc_msgSend(CFSTR("#<^_NSEDR_^#<"), "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", (char *)v10 + 3, p_isa, v19, v4, 0, 0, objc_msgSend(CFSTR("#<^_NSEDR_^#<"), "length"), 0))
      {
        v19[0] += 3;
        goto LABEL_10;
      }
    }
    free(v11);
    return 0;
  }
  return p_isa;
}

NSMapTable *__57__NSEncodingDetectionPlaceholder_placeholderForDetector___block_invoke()
{
  NSMapTable *result;

  result = -[NSMapTable initWithKeyOptions:valueOptions:capacity:]([NSMapTable alloc], "initWithKeyOptions:valueOptions:capacity:", 1282, 0, 16);
  qword_1ECD09AF0 = (uint64_t)result;
  return result;
}

- (id)debugDescription
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSEncodingDetectionPlaceholder;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ string:\"%@\" nsEncoding:%lu cfEncoding:%u bytes:%p bytesLength:%lu bytesStart:%p"), -[NSEncodingDetectionPlaceholder debugDescription](&v3, sel_debugDescription), self->string, self->nsEncoding, self->cfEncoding, self->bytes, self->bytesLength, self->bytesStart);
}

@end
