@implementation NEByteParser

- (id)copyWithZone:(_NSZone *)a3
{
  const char *v4;
  NEByteParser *v5;
  id Property;

  v5 = +[NEByteParser allocWithZone:](NEByteParser, "allocWithZone:", a3);
  if (self)
    Property = objc_getProperty(self, v4, 16, 1);
  else
    Property = 0;
  return -[NEByteParser initWithData:](v5, Property);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

- (_QWORD)initWithData:(_QWORD *)a1
{
  id v4;
  id v5;
  uint64_t v6;
  objc_super v8;

  v4 = a2;
  if (a1)
  {
    v8.receiver = a1;
    v8.super_class = (Class)NEByteParser;
    v5 = objc_msgSendSuper2(&v8, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong((id *)v5 + 2, a2);
      v6 = objc_msgSend(objc_retainAutorelease(v4), "bytes");
      a1[1] = 0;
      a1[3] = v6;
      a1[4] = v6;
    }
  }

  return a1;
}

- (BOOL)copyBytes:(void *)a3 to:
{
  const char *v6;
  unint64_t v7;
  NSObject *v8;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = &a2[*(_QWORD *)(a1 + 8)];
  v7 = objc_msgSend(objc_getProperty((id)a1, a2, 16, 1), "length");
  if ((unint64_t)v6 > v7)
  {
    ne_log_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 8);
      v11 = 134218240;
      v12 = a2;
      v13 = 2048;
      v14 = v10;
      _os_log_error_impl(&dword_19BD16000, v8, OS_LOG_TYPE_ERROR, "Failed to advance by %lu bytes from offset %lu", (uint8_t *)&v11, 0x16u);
    }

  }
  else if (a3)
  {
    memcpy(a3, *(const void **)(a1 + 32), (size_t)a2);
  }
  return (unint64_t)v6 <= v7;
}

- (_QWORD)parseDomainName
{
  _QWORD *v2;
  id v3;
  uint64_t v4;
  const char *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v10;
  _BYTE v11[1009];
  uint64_t v12;

  v2 = self;
  v12 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    v3 = objc_getProperty(self, a2, 16, 1);
    bzero(v11, 0x3F1uLL);
    v4 = v2[3];
    v10 = v2[4];
    if (_NE_DNSMessageExtractDomainNameString(v4, objc_msgSend(v3, "length"), v2[4], (uint64_t)v11, (uint64_t)&v10)|| (v6 = v2[4], v7 = v10 - v6, v10 <= v6)|| (v8 = v2[1] + v7, v8 > objc_msgSend(objc_getProperty(v2, v5, 16, 1), "length")))
    {
      v2 = 0;
    }
    else
    {
      v2[1] += v7;
      v2[4] = v10;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v11, 4);
      v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v2;
}

- (uint64_t)parse16Bits:(uint64_t)result
{
  uint64_t v3;
  _BOOL4 v4;
  unsigned __int16 v5;

  if (result)
  {
    v3 = result;
    v5 = 0;
    v4 = -[NEByteParser copyBytes:to:](result, (const char *)2, &v5);
    if (v4)
    {
      *(_QWORD *)(v3 + 32) += 2;
      *(_QWORD *)(v3 + 8) += 2;
    }
    *a2 = v4;
    return bswap32(v5) >> 16;
  }
  return result;
}

- (uint64_t)parse32Bits:(uint64_t)result
{
  uint64_t v3;
  _BOOL4 v4;
  unsigned int v5;

  if (result)
  {
    v3 = result;
    v5 = 0;
    v4 = -[NEByteParser copyBytes:to:](result, (const char *)4, &v5);
    if (v4)
    {
      *(_QWORD *)(v3 + 32) += 4;
      *(_QWORD *)(v3 + 8) += 4;
    }
    *a2 = v4;
    return bswap32(v5);
  }
  return result;
}

- (uint64_t)parseBytes:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;
  _BOOL4 v5;

  if (result)
  {
    v3 = result;
    v4 = *(_QWORD *)(result + 32);
    v5 = -[NEByteParser copyBytes:to:](result, a2, 0);
    result = 0;
    if (v5)
    {
      *(_QWORD *)(v3 + 32) += a2;
      *(_QWORD *)(v3 + 8) += a2;
      return v4;
    }
  }
  return result;
}

- (id)parseAddressWithFamily:(uint64_t)a1
{
  size_t v4;
  uint64_t v5;
  const void *v6;
  void *v7;
  char *v8;
  char *v9;

  if (!a1)
    goto LABEL_11;
  if (a2 == 2)
  {
    v4 = 16;
    v5 = 4;
  }
  else
  {
    if (a2 != 30)
      goto LABEL_11;
    v4 = 46;
    v5 = 16;
  }
  v6 = *(const void **)(a1 + 32);
  v7 = 0;
  if (!-[NEByteParser copyBytes:to:](a1, (const char *)v5, 0))
    return v7;
  *(_QWORD *)(a1 + 32) += v5;
  *(_QWORD *)(a1 + 8) += v5;
  if (!v6 || (v8 = (char *)malloc_type_malloc(v4, 0x100004077774924uLL)) == 0)
  {
LABEL_11:
    v7 = 0;
    return v7;
  }
  v9 = v8;
  if (inet_ntop(a2, v6, v8, v4))
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", v9, 4);
  else
    v7 = 0;
  free(v9);
  return v7;
}

@end
