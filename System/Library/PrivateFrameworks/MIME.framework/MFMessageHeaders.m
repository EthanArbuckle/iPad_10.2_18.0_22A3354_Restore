@implementation MFMessageHeaders

+ (id)basicHeaders
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[11];

  v8[10] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D1E568];
  v8[0] = *MEMORY[0x1E0D1E5E0];
  v8[1] = v2;
  v3 = *MEMORY[0x1E0D1E5F0];
  v8[2] = *MEMORY[0x1E0D1E560];
  v8[3] = v3;
  v4 = *MEMORY[0x1E0D1E5D8];
  v8[4] = *MEMORY[0x1E0D1E600];
  v8[5] = v4;
  v5 = *MEMORY[0x1E0D1E5F8];
  v8[6] = *MEMORY[0x1E0D1E520];
  v8[7] = v5;
  v6 = *MEMORY[0x1E0D1E500];
  v8[8] = *MEMORY[0x1E0D1E5D0];
  v8[9] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 10);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)isStructuredHeaderKey:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = !objc_msgSend(v3, "caseInsensitiveCompare:", *MEMORY[0x1E0D1E600])
    || !objc_msgSend(v3, "caseInsensitiveCompare:", *MEMORY[0x1E0D1E568])
    || !objc_msgSend(v3, "caseInsensitiveCompare:", *MEMORY[0x1E0D1E5E0])
    || !objc_msgSend(v3, "caseInsensitiveCompare:", *MEMORY[0x1E0D1E5F0])
    || !objc_msgSend(v3, "caseInsensitiveCompare:", *MEMORY[0x1E0D1E5D8])
    || !objc_msgSend(v3, "caseInsensitiveCompare:", *MEMORY[0x1E0D1E520])
    || !objc_msgSend(v3, "caseInsensitiveCompare:", *MEMORY[0x1E0D1E518])
    || objc_msgSend(v3, "caseInsensitiveCompare:", *MEMORY[0x1E0D1E5D0]) == 0;

  return v4;
}

+ (BOOL)shouldDecodeHeaderForKey:(id)a3
{
  return objc_msgSend(a1, "isStructuredHeaderKey:", a3) ^ 1;
}

- (MFMessageHeaders)initWithHeaderData:(id)a3 encoding:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  MFMessageHeaders *v7;
  MFMessageHeaders *v8;
  objc_super v10;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MFMessageHeaders;
  v7 = -[MFMessageHeaders init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[MFMessageHeaders setPreferredEncoding:](v7, "setPreferredEncoding:", v4);
    -[MFMessageHeaders setData:](v8, "setData:", v6);
  }

  return v8;
}

- (MFMessageHeaders)init
{
  return -[MFMessageHeaders initWithHeaderData:encoding:](self, "initWithHeaderData:encoding:", 0, 1536);
}

- (MFMessageHeaders)initWithASCIIHeaderString:(id)a3
{
  void *v4;
  MFMessageHeaders *v5;

  objc_msgSend(a3, "dataUsingEncoding:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MFMessageHeaders initWithHeaderData:encoding:](self, "initWithHeaderData:encoding:", v4, 1536);

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[MFMessageHeaders initWithHeaderData:encoding:]([MFMessageHeaders alloc], "initWithHeaderData:encoding:", self->_data, self->_preferredEncoding);
}

- (id)mutableCopy
{
  return -[MFMessageHeaders initWithHeaderData:encoding:]([MFMutableMessageHeaders alloc], "initWithHeaderData:encoding:", self->_data, self->_preferredEncoding);
}

- (id)headerData
{
  return self->_data;
}

- (id)headersRequiringSMTPUTF8Support
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = (void *)objc_opt_new();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__MFMessageHeaders_headersRequiringSMTPUTF8Support__block_invoke;
  v7[3] = &unk_1E5AA1450;
  v4 = v3;
  v8 = v4;
  -[MFMessageHeaders enumerateKeysAndBytesUsingBlock:](self, "enumerateKeysAndBytesUsingBlock:", v7);
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __51__MFMessageHeaders_headersRequiringSMTPUTF8Support__block_invoke(uint64_t a1, void *a2, char *a3, uint64_t a4)
{
  char *v7;
  int v8;
  id v9;

  v9 = a2;
  v7 = &a3[a4];
  while (a3 < v7)
  {
    v8 = *a3++;
    if (v8 < 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
      break;
    }
  }

}

- (unsigned)preferredEncoding
{
  return self->_preferredEncoding;
}

- (void)setPreferredEncoding:(unsigned int)a3
{
  self->_preferredEncoding = a3;
}

- (id)allHeaderKeys
{
  return -[MFMessageHeaders _decodeHeaderKeysFromData:](self, "_decodeHeaderKeysFromData:", self->_data);
}

- (void)enumerateKeysAndBytesUsingBlock:(id)a3
{
  void (**v4)(id, void *, char *, _QWORD);
  char *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];

  v4 = (void (**)(id, void *, char *, _QWORD))a3;
  v5 = -[NSData bytes](self->_data, "bytes");
  -[NSData length](self->_data, "length");
  memset(v8, 170, sizeof(v8));
  while (ECGetNextHeaderFromDataInRange())
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", &v5[v8[2]], v8[3], 1, 0);
    objc_msgSend(v6, "lowercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v4[2](v4, v7, &v5[v8[0]], v8[1]);
  }

}

- (id)headersDictionary
{
  unsigned int v3;
  id v4;
  _QWORD v6[5];
  unsigned int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  v3 = -[MFMessageHeaders _contentTypeEncoding](self, "_contentTypeEncoding");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__MFMessageHeaders_headersDictionary__block_invoke;
  v6[3] = &unk_1E5AA1478;
  v7 = v3;
  v6[4] = &v8;
  -[MFMessageHeaders enumerateKeysAndBytesUsingBlock:](self, "enumerateKeysAndBytesUsingBlock:", v6);
  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __37__MFMessageHeaders_headersDictionary__block_invoke(uint64_t a1, void *a2, UInt8 *a3, size_t a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v7 = _MFCreateStringFromHeaderBytes(*(_DWORD *)(a1 + 40), a3, a4);
  if (objc_msgSend(v14, "length") && objc_msgSend(v7, "length"))
  {
    v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

      v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "addObject:", v7);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:");
    }

  }
}

- (void)_setCapitalizedKey:(id)a3 forKey:(id)a4
{
  id v5;
  const __CFDictionary *Mutable;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  _MFLockGlobalLock();
  Mutable = (const __CFDictionary *)_capitalizedKeyCache;
  if (!_capitalizedKeyCache)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
    _capitalizedKeyCache = (uint64_t)Mutable;
  }
  if (!CFDictionaryGetValue(Mutable, v5))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", v8);
    CFDictionarySetValue((CFMutableDictionaryRef)_capitalizedKeyCache, v5, v7);

  }
  _MFUnlockGlobalLock();

}

- (id)_capitalizedKeyForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = v4;
  if (_capitalizedKeyCache)
  {
    _MFLockGlobalLock();
    CFDictionaryGetValue((CFDictionaryRef)_capitalizedKeyCache, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _MFUnlockGlobalLock();
    if (!v5)
      goto LABEL_7;
  }
  else
  {
    v6 = 0;
    if (!v4)
      goto LABEL_7;
  }
  if (!v6)
  {
    objc_msgSend(v5, "capitalizedString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMessageHeaders _setCapitalizedKey:forKey:](self, "_setCapitalizedKey:forKey:", v6, v5);
  }
LABEL_7:

  return v6;
}

- (unsigned)_contentTypeEncoding
{
  id v2;
  void *v3;
  id v4;
  id v5;
  BOOL v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  const __CFString *v11;
  __CFString *v12;
  unsigned int v13;
  id v15;
  id v16;
  id v17;

  v2 = -[MFMessageHeaders copyFirstNonDecodedHeaderForKey:](self, "copyFirstNonDecodedHeaderForKey:", *MEMORY[0x1E0D1E558]);
  v3 = v2;
  if (v2)
  {
    v4 = objc_retainAutorelease(v2);
    v5 = _MFCreateStringFromHeaderBytes(0xFFFFFFFF, (UInt8 *)objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"));
    if (v5)
    {
      v16 = 0;
      v17 = 0;
      v15 = 0;
      v6 = +[MFMimePart parseContentTypeHeader:type:subtype:info:](MFMimePart, "parseContentTypeHeader:type:subtype:info:", v5, &v17, &v16, &v15);
      v7 = v17;
      v8 = v16;
      v9 = v15;
      v10 = v9;
      if (v6)
      {
        objc_msgSend(v9, "objectForKey:", CFSTR("charset"));
        v11 = (const __CFString *)objc_claimAutoreleasedReturnValue();
        v12 = (__CFString *)v11;
        if (v11)
          v13 = MFEncodingForCharset(v11);
        else
          v13 = -1;

      }
      else
      {
        v13 = -1;
      }

    }
    else
    {
      v13 = -1;
    }

  }
  else
  {
    v13 = -1;
  }

  return v13;
}

- (id)copyDecodedStringFromHeaderData:(id)a3 withRange:(_NSRange)a4
{
  size_t length;
  NSUInteger location;
  id v8;
  NSObject *v9;
  char isKindOfClass;
  void *v11;
  NSObject *v12;
  void *v13;
  unsigned int preferredEncoding;
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  NSUInteger v21;
  __int16 v22;
  size_t v23;
  uint8_t v24[24];
  uint64_t v25;

  length = a4.length;
  location = a4.location;
  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    MFLogGeneral();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      -[MFMessageHeaders copyDecodedStringFromHeaderData:withRange:].cold.1(isKindOfClass & 1, v24, (uint64_t)v8, v9);
    }

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MessageHeaders.m"), 305, CFSTR("MFMessageHeaders::copyDecodedStringFromHeaderData invalid data, [data:%p] [data.isNSData:%i]"), v8, objc_opt_isKindOfClass() & 1);

  }
  if (location + length > objc_msgSend(v8, "length"))
  {
    MFLogGeneral();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134218496;
      v19 = objc_msgSend(v8, "length");
      v20 = 2048;
      v21 = location;
      v22 = 2048;
      v23 = length;
      _os_log_fault_impl(&dword_1ABB13000, v12, OS_LOG_TYPE_FAULT, "_MFCreateStringFromHeaderBytes buffer overflow preempt, [data.length:%lu] [range.location:%lu/length:%lu]", buf, 0x20u);
    }

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MessageHeaders.m"), 312, CFSTR("_MFCreateStringFromHeaderBytes buffer overflow preempt, [data.length:%lu] [range.location:%lu/length:%lu]"), objc_msgSend(v8, "length"), location, length);

  }
  preferredEncoding = self->_preferredEncoding;
  if (preferredEncoding == -1)
  {
    preferredEncoding = -[MFMessageHeaders _contentTypeEncoding](self, "_contentTypeEncoding");
    self->_preferredEncoding = preferredEncoding;
  }
  v15 = objc_retainAutorelease(v8);
  v16 = _MFCreateStringFromHeaderBytes(preferredEncoding, (UInt8 *)(objc_msgSend(v15, "bytes") + location), length);
  if (!v16)
  {
    if (self->_preferredEncoding == -1)
      v16 = 0;
    else
      v16 = _MFCreateStringFromHeaderBytes(0xFFFFFFFF, (UInt8 *)(objc_msgSend(objc_retainAutorelease(v15), "bytes") + location), length);
  }

  return v16;
}

- (id)_copyHeaderValueForKey:(id)a3 offset:(unint64_t *)a4 decoded:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;

  v5 = a5;
  v8 = a3;
  -[NSData length](self->_data, "length");
  if (ECGetNextHeaderFromDataInRange())
  {
    if (v5)
    {
      v9 = -[MFMessageHeaders copyDecodedStringFromHeaderData:withRange:](self, "copyDecodedStringFromHeaderData:withRange:", self->_data, 0, 0);
    }
    else
    {
      -[NSData subdataWithRange:](self->_data, "subdataWithRange:", 0, 0);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;
    *a4 = 0;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_headerValueForKey:(id)a3 offset:(unint64_t *)a4
{
  return -[MFMessageHeaders _copyHeaderValueForKey:offset:decoded:](self, "_copyHeaderValueForKey:offset:decoded:", a3, a4, 1);
}

- (id)_copyHeaderValueForKey:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v9;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = 0;
  v9 = 0;
  while (1)
  {
    v7 = -[MFMessageHeaders _copyHeaderValueForKey:offset:decoded:](self, "_copyHeaderValueForKey:offset:decoded:", v4, &v9, 1);

    if (!v7)
      break;
    v6 = v7;
    objc_msgSend(v5, "addObject:", v7);
  }

  return v5;
}

- (BOOL)hasHeaderForKey:(id)a3
{
  id v4;

  v4 = a3;
  -[NSData length](self->_data, "length");
  LOBYTE(self) = ECGetNextHeaderFromDataInRange();

  return (char)self;
}

- (id)copyHeadersForKey:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = -[MFMessageHeaders _copyHeaderValueForKey:](self, "_copyHeaderValueForKey:", a3);
  v4 = v3;
  if (v3 && !objc_msgSend(v3, "count"))
    v5 = 0;
  else
    v5 = v4;

  return v5;
}

- (id)headersForKey:(id)a3
{
  return -[MFMessageHeaders copyHeadersForKey:](self, "copyHeadersForKey:", a3);
}

+ (id)copyAddressListFromEncodedData:(id)a3 encoding:(unsigned int)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  UInt8 *v7;
  int v8;
  uint64_t v9;
  unint64_t v10;
  UInt8 *v11;
  unsigned int v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  unsigned __int8 *v18;
  UInt8 *v19;
  unint64_t v20;
  unsigned int v21;
  uint64_t v22;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v31;
  id v32;

  v4 = a3;
  v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = objc_msgSend(v4, "length", v4);
  v31 = objc_retainAutorelease(v4);
  v6 = objc_msgSend(v31, "bytes");
  v7 = (UInt8 *)v6;
  if (v5 >= 1)
  {
    v8 = 0;
    v9 = 0;
    v10 = v6 + v5;
    v11 = (UInt8 *)v6;
    while (1)
    {
      if (v11 == v7)
      {
        v12 = *v7;
        if (v12 > 0x20 || ((1 << v12) & 0x100000600) == 0)
          goto LABEL_10;
        ++v7;
      }
      v12 = *v11;
LABEL_10:
      if (v12 == 34)
      {
        v8 ^= 1u;
LABEL_42:
        if ((unint64_t)++v11 >= v10)
          break;
      }
      else
      {
        LODWORD(v14) = (v12 == 41) & ~v8;
        if (v9)
          v14 = v14;
        else
          v14 = 0;
        v15 = v14 << 63 >> 63;
        if ((v12 != 40) | v8 & 1)
          v16 = v15;
        else
          v16 = 1;
        v9 += v16;
        v17 = (v12 == 44) & ~(_BYTE)v8;
        if (v9)
          v17 = 0;
        if ((v17 & 1) == 0 && v11 + 1 != (UInt8 *)v10)
          goto LABEL_42;
        if (v12 == 44)
          v18 = v11;
        else
          v18 = v11 + 1;
        v19 = v18;
        if (v18 > v7)
        {
          v19 = v18;
          v20 = (unint64_t)v18;
          while (1)
          {
            v21 = *(unsigned __int8 *)--v20;
            v22 = (1 << v21) & 0x100000600;
            if (v21 > 0x20 || v22 == 0)
              break;
            v19 = (UInt8 *)v20;
            if (v20 <= (unint64_t)v7)
            {
              v19 = v7;
              break;
            }
          }
        }
        if (v19 - v7 >= 1)
        {
          v24 = _MFCreateStringFromHeaderBytes(a4, v7, v19 - v7);
          objc_msgSend(v24, "emailAddressValue");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "stringValue");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v26;
          if (v26)
          {
            v28 = v26;
          }
          else
          {
            objc_msgSend(v24, "stringValue");
            v28 = (id)objc_claimAutoreleasedReturnValue();
          }
          v29 = v28;

          if (objc_msgSend(v29, "length"))
            objc_msgSend(v32, "addObject:", v29);

        }
        v7 = v18 + 1;
        v11 = v18 + 1;
        if ((unint64_t)(v18 + 1) >= v10)
          break;
      }
    }
  }

  return v32;
}

+ (id)addressListFromEncodedString:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(a1, "copyAddressListFromEncodedData:encoding:", v4, 134217984);

  return v5;
}

+ (id)encodedDataForAddressList:(id)a3 splittingAtLength:(unint64_t)a4 firstLineBuffer:(unint64_t)a5
{
  id v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __CFString *v12;
  __int128 v13;
  uint64_t v14;
  const char *CStringPtr;
  MFMutableData *v16;
  unint64_t v17;
  CFMutableStringRef Mutable;
  uint64_t v19;
  unsigned __int8 v20;
  unsigned int v21;
  int v22;
  unsigned __int8 v23;
  int64_t v24;
  UniChar *v25;
  uint64_t v26;
  UniChar v27;
  uint64_t v30;
  uint64_t v32;
  char v33;
  int v34;
  uint64_t v35;
  int64_t v36;
  UniChar *v37;
  uint64_t v38;
  UniChar v39;
  uint64_t v40;
  int64_t v41;
  UniChar *v42;
  uint64_t v43;
  UniChar v44;
  void *v46;
  uint64_t v47;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  int v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  int64_t v59;
  UniChar *v60;
  uint64_t v61;
  UniChar v62;
  uint64_t v63;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  UniChar v71;
  uint64_t v72;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  int64_t v77;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  UniChar v85;
  uint64_t v86;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  int64_t v91;
  void *v92;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  id obj;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  MFMutableData *v101;
  unint64_t v102;
  __CFString *theString;
  UniChar buffer[8];
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  CFStringRef v112[2];
  __int128 v113;
  __int128 v114;
  int64_t v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  UniChar v120;
  UniChar chars;
  _BYTE v122[128];
  uint64_t v123;
  CFRange v124;
  CFRange v125;
  CFRange v126;
  CFRange v127;
  CFRange v128;
  CFRange v129;
  CFRange v130;
  CFRange v131;
  CFRange v132;

  v123 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v101 = objc_alloc_init(MFMutableData);
  v8 = a4 - a5;
  v96 = a4;
  v118 = 0u;
  v119 = 0u;
  if (!a4)
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  v102 = v8;
  v116 = 0uLL;
  v117 = 0uLL;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v116, v122, 16);
  if (v9)
  {
    v98 = *(_QWORD *)v117;
    do
    {
      v99 = v9;
      for (i = 0; i != v99; ++i)
      {
        if (*(_QWORD *)v117 != v98)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * i);
        v100 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6C8]), "initWithStyle:", 1);
        objc_msgSend(v100, "setShouldIncludeDisplayName:", 1);
        objc_msgSend(v100, "stringFromEmailAddressConvertible:", v11);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v115 = 0xAAAAAAAAAAAAAAAALL;
        *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v113 = v13;
        v114 = v13;
        v111 = v13;
        *(_OWORD *)v112 = v13;
        v109 = v13;
        v110 = v13;
        v107 = v13;
        v108 = v13;
        v105 = v13;
        v106 = v13;
        *(_OWORD *)buffer = v13;
        theString = v12;
        v14 = -[__CFString length](v12, "length");
        v112[0] = v12;
        *((_QWORD *)&v113 + 1) = 0;
        *(_QWORD *)&v114 = v14;
        v112[1] = (CFStringRef)CFStringGetCharactersPtr(v12);
        if (v112[1])
          CStringPtr = 0;
        else
          CStringPtr = CFStringGetCStringPtr(v12, 0x600u);
        *(_QWORD *)&v113 = CStringPtr;
        *((_QWORD *)&v114 + 1) = 0;
        v115 = 0;
        v16 = objc_alloc_init(MFMutableData);
        v17 = -[__CFString length](theString, "length");
        Mutable = CFStringCreateMutable(0, v17);
        chars = -21846;
        if (!v17)
        {
LABEL_49:
          v21 = 0;
          goto LABEL_50;
        }
        v19 = 0;
        v20 = 0;
        v21 = 0;
        v22 = 0;
        v23 = 0;
        while (1)
        {
          v24 = v114;
          if ((uint64_t)v114 > v19)
            break;
          chars = 0;
LABEL_48:
          v19 = ++v21;
          if (v17 <= v21)
            goto LABEL_49;
        }
        v25 = (UniChar *)v112[1];
        if (v112[1])
        {
          v26 = *((_QWORD *)&v113 + 1) + v19;
LABEL_16:
          v27 = v25[v26];
          goto LABEL_20;
        }
        if (!(_QWORD)v113)
        {
          v30 = *((_QWORD *)&v114 + 1);
          if (v115 <= v19 || *((_QWORD *)&v114 + 1) > v19)
          {
            v32 = v19 - 4;
            if (v21 < 4)
              v32 = 0;
            if (v32 + 64 < (uint64_t)v114)
              v24 = v32 + 64;
            *((_QWORD *)&v114 + 1) = v32;
            v115 = v24;
            v124.location = *((_QWORD *)&v113 + 1) + v32;
            v124.length = v24 - v32;
            CFStringGetCharacters(v112[0], v124, buffer);
            v30 = *((_QWORD *)&v114 + 1);
          }
          v26 = v19 - v30;
          v25 = buffer;
          goto LABEL_16;
        }
        v27 = *(char *)(v113 + *((_QWORD *)&v113 + 1) + v19);
LABEL_20:
        chars = v27;
        if (v27 == 92 && v17 > v21 + 1)
        {
          ++v21;
          goto LABEL_48;
        }
        if (v27 == 34 && v22 == 0)
        {
          v22 = 0;
          v20 ^= 1u;
          goto LABEL_48;
        }
        if (!((v27 != 40) | v20 & 1))
        {
          v20 = 0;
          ++v22;
          goto LABEL_48;
        }
        if (!((v27 != 41) | v20 & 1))
        {
          v20 = 0;
          --v22;
          goto LABEL_48;
        }
        if (v27 != 60 || ((v20 ^ 1) & 1) == 0 || v22)
        {
          v23 |= (v27 == 44) & (v20 ^ 1);
          goto LABEL_48;
        }
        if (!v21)
          goto LABEL_202;
        v57 = v21;
        while (2)
        {
          v58 = (v57 - 1);
          v59 = v114;
          if ((uint64_t)v114 > v58)
          {
            v60 = (UniChar *)v112[1];
            if (v112[1])
            {
              v61 = *((_QWORD *)&v113 + 1) + v58;
              goto LABEL_127;
            }
            if ((_QWORD)v113)
            {
              v62 = *(char *)(v113 + *((_QWORD *)&v113 + 1) + v58);
            }
            else
            {
              v63 = *((_QWORD *)&v114 + 1);
              if (v115 <= v58 || *((_QWORD *)&v114 + 1) > v58)
              {
                v65 = v58 - 4;
                if (v57 < 5)
                  v65 = 0;
                if (v65 + 64 < (uint64_t)v114)
                  v59 = v65 + 64;
                *((_QWORD *)&v114 + 1) = v65;
                v115 = v59;
                v129.location = *((_QWORD *)&v113 + 1) + v65;
                v129.length = v59 - v65;
                CFStringGetCharacters(v112[0], v129, buffer);
                v63 = *((_QWORD *)&v114 + 1);
              }
              v61 = v58 - v63;
              v60 = buffer;
LABEL_127:
              v62 = v60[v61];
            }
            if (v62 != 9 && v62 != 32)
              break;
            --v57;
            if (!v58)
              goto LABEL_202;
            continue;
          }
          break;
        }
        if ((_DWORD)v57)
        {
          v66 = 0;
          v67 = 0;
          v68 = 64;
          while (1)
          {
            v69 = (unint64_t)v67 >= 4 ? 4 : v67;
            v70 = v114;
            if ((uint64_t)v114 <= v67)
              break;
            if (v112[1])
            {
              v71 = *((_WORD *)&v112[1]->isa + v67 + *((_QWORD *)&v113 + 1));
            }
            else if ((_QWORD)v113)
            {
              v71 = *(char *)(v113 + *((_QWORD *)&v113 + 1) + v67);
            }
            else
            {
              v72 = *((_QWORD *)&v114 + 1);
              if (v115 <= v67 || *((_QWORD *)&v114 + 1) > v67)
              {
                v94 = v66;
                v74 = v69 + v66;
                v75 = v68 - v69;
                v76 = v67 - v69;
                v77 = v76 + 64;
                if (v76 + 64 >= (uint64_t)v114)
                  v77 = v114;
                *((_QWORD *)&v114 + 1) = v76;
                v115 = v77;
                if ((uint64_t)v114 >= v75)
                  v70 = v75;
                v130.length = v70 + v74;
                v130.location = v76 + *((_QWORD *)&v113 + 1);
                CFStringGetCharacters(v112[0], v130, buffer);
                v72 = *((_QWORD *)&v114 + 1);
                v66 = v94;
              }
              v71 = buffer[v67 - v72];
            }
            if (v71 != 32 && v71 != 9)
              break;
            ++v67;
            --v66;
            ++v68;
            if (v57 == v67)
              goto LABEL_202;
          }
          if ((v23 & 1) != 0)
            CFStringAppend(Mutable, CFSTR("\"));
          v79 = 0;
          v80 = 0;
          if (v57 <= 1)
            v81 = 1;
          else
            v81 = v57;
          v95 = v81;
          v82 = 64;
          do
          {
            if ((unint64_t)v80 >= 4)
              v83 = 4;
            else
              v83 = v80;
            v120 = -21846;
            v84 = v114;
            if ((uint64_t)v114 <= v80)
            {
              v120 = 0;
            }
            else
            {
              if (v112[1])
              {
                v85 = *((_WORD *)&v112[1]->isa + v80 + *((_QWORD *)&v113 + 1));
              }
              else if ((_QWORD)v113)
              {
                v85 = *(char *)(v113 + *((_QWORD *)&v113 + 1) + v80);
              }
              else
              {
                v86 = *((_QWORD *)&v114 + 1);
                if (v115 <= v80 || *((_QWORD *)&v114 + 1) > v80)
                {
                  v88 = v83 + v79;
                  v89 = v82 - v83;
                  v90 = v80 - v83;
                  v91 = v90 + 64;
                  if (v90 + 64 >= (uint64_t)v114)
                    v91 = v114;
                  *((_QWORD *)&v114 + 1) = v90;
                  v115 = v91;
                  if ((uint64_t)v114 >= v89)
                    v84 = v89;
                  v131.length = v84 + v88;
                  v131.location = v90 + *((_QWORD *)&v113 + 1);
                  CFStringGetCharacters(v112[0], v131, buffer);
                  v86 = *((_QWORD *)&v114 + 1);
                }
                v85 = buffer[v80 - v86];
              }
              v120 = v85;
              if ((v23 & (v85 == 34)) == 1)
                CFStringAppend(Mutable, CFSTR("\\"));
            }
            CFStringAppendCharacters(Mutable, &v120, 1);
            ++v80;
            --v79;
            ++v82;
          }
          while (v95 != v80);
          if ((v23 & 1) != 0)
            CFStringAppend(Mutable, CFSTR("\"));
          -[__CFString mf_encodedHeaderDataWithEncodingHint:](Mutable, "mf_encodedHeaderDataWithEncodingHint:", 0xFFFFFFFFLL);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          -[MFMutableData appendData:](v16, "appendData:", v92);

        }
LABEL_202:
        -[NSMutableData mf_appendCString:](v16, "mf_appendCString:", " ");
        v132.length = CFStringGetLength(Mutable);
        v132.location = 0;
        CFStringDelete(Mutable, v132);
LABEL_50:
        if (v17 > v21)
        {
          v33 = 0;
          v34 = 0;
          v35 = v21;
          while (1)
          {
            v36 = v114;
            if ((uint64_t)v114 <= v35)
            {
              chars = 0;
              goto LABEL_57;
            }
            v37 = (UniChar *)v112[1];
            if (v112[1])
              break;
            if (!(_QWORD)v113)
            {
              v47 = *((_QWORD *)&v114 + 1);
              if (v115 <= v35 || *((_QWORD *)&v114 + 1) > v35)
              {
                v49 = v35 - 4;
                if (v21 < 4)
                  v49 = 0;
                if (v49 + 64 < (uint64_t)v114)
                  v36 = v49 + 64;
                *((_QWORD *)&v114 + 1) = v49;
                v115 = v36;
                v126.location = *((_QWORD *)&v113 + 1) + v49;
                v126.length = v36 - v49;
                CFStringGetCharacters(v112[0], v126, buffer);
                v47 = *((_QWORD *)&v114 + 1);
              }
              v38 = v35 - v47;
              v37 = buffer;
              goto LABEL_55;
            }
            v39 = *(char *)(v113 + *((_QWORD *)&v113 + 1) + v35);
LABEL_62:
            chars = v39;
            if (v39 == 92)
            {
              v40 = v21 + 1;
              if (v17 > v40)
              {
                v41 = v114;
                if ((uint64_t)v114 <= v40)
                {
                  v44 = 0;
                }
                else
                {
                  v42 = (UniChar *)v112[1];
                  if (v112[1])
                  {
                    v43 = *((_QWORD *)&v113 + 1) + v40;
                    goto LABEL_67;
                  }
                  if ((_QWORD)v113)
                  {
                    v44 = *(char *)(v113 + *((_QWORD *)&v113 + 1) + v40);
                  }
                  else
                  {
                    if (v115 <= v40 || (v51 = *((_QWORD *)&v114 + 1), *((uint64_t *)&v114 + 1) > v40))
                    {
                      v52 = v40 - 4;
                      if (v40 < 4)
                        v52 = 0;
                      if (v52 + 64 < (uint64_t)v114)
                        v41 = v52 + 64;
                      *((_QWORD *)&v114 + 1) = v52;
                      v115 = v41;
                      v128.location = *((_QWORD *)&v113 + 1) + v52;
                      v128.length = v41 - v52;
                      CFStringGetCharacters(v112[0], v128, buffer);
                      v51 = *((_QWORD *)&v114 + 1);
                    }
                    v43 = v40 - v51;
                    v42 = buffer;
LABEL_67:
                    v44 = v42[v43];
                  }
                }
                chars = v44;
                ++v21;
              }
            }
            else if (v39 == 34 && v34 == 0)
            {
              v34 = 0;
              v33 ^= 1u;
            }
            else
            {
              if (!((v39 != 40) | v33 & 1))
              {
                if (v34 < 1)
                  -[__CFString dataUsingEncoding:allowLossyConversion:](Mutable, "dataUsingEncoding:allowLossyConversion:", 4, 0);
                else
                  -[__CFString mf_encodedHeaderDataWithEncodingHint:](Mutable, "mf_encodedHeaderDataWithEncodingHint:", 0xFFFFFFFFLL);
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                -[MFMutableData appendData:](v16, "appendData:", v50);

                v127.length = CFStringGetLength(Mutable);
                v127.location = 0;
                CFStringDelete(Mutable, v127);
                -[NSMutableData mf_appendCString:](v16, "mf_appendCString:", "(");
                v33 = 0;
                ++v34;
                goto LABEL_58;
              }
              if (!((v39 != 41) | v33 & 1) && v34 >= 1)
              {
                -[__CFString mf_encodedHeaderDataWithEncodingHint:](Mutable, "mf_encodedHeaderDataWithEncodingHint:", 0xFFFFFFFFLL);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                -[MFMutableData appendData:](v16, "appendData:", v46);

                v125.length = CFStringGetLength(Mutable);
                v125.location = 0;
                CFStringDelete(Mutable, v125);
                v33 = 0;
                --v34;
              }
            }
LABEL_57:
            CFStringAppendCharacters(Mutable, &chars, 1);
LABEL_58:
            v35 = ++v21;
            if (v17 <= v21)
              goto LABEL_104;
          }
          v38 = *((_QWORD *)&v113 + 1) + v35;
LABEL_55:
          v39 = v37[v38];
          goto LABEL_62;
        }
        v34 = 0;
        v33 = 0;
LABEL_104:
        if (CFStringGetLength(Mutable))
        {
          if (v34 < 1)
            -[__CFString dataUsingEncoding:allowLossyConversion:](Mutable, "dataUsingEncoding:allowLossyConversion:", 4, 0);
          else
            -[__CFString mf_encodedHeaderDataWithEncodingHint:](Mutable, "mf_encodedHeaderDataWithEncodingHint:", 0xFFFFFFFFLL);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          -[MFMutableData appendData:](v16, "appendData:", v53);

        }
        if ((v33 & 1) != 0)
          -[NSMutableData mf_appendCString:](v16, "mf_appendCString:", "\");
        v54 = v34 + 1;
        while (--v54 >= 1)
          -[NSMutableData mf_appendCString:](v16, "mf_appendCString:", ")");
        CFRelease(Mutable);

        v55 = -[MFMutableData length](v16, "length");
        if (-[MFMutableData length](v101, "length"))
        {
          if (v55 <= v102)
          {
            -[MFMutableData appendBytes:length:](v101, "appendBytes:length:", ", ", 2);
          }
          else
          {
            -[MFMutableData appendBytes:length:](v101, "appendBytes:length:", ",\n ", 3);
            v102 = v96;
          }
        }
        -[MFMutableData appendData:](v101, "appendData:", v16);
        v56 = v102 - v55;
        if (v102 < v55)
          v56 = 0;
        v102 = v56;

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v116, v122, 16);
    }
    while (v9);
  }

  return v101;
}

- (id)_copyAddressListForKey:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v8;

  v4 = a3;
  if (self->_preferredEncoding == -1)
    self->_preferredEncoding = -[MFMessageHeaders _contentTypeEncoding](self, "_contentTypeEncoding");
  v8 = 0;
  v5 = -[MFMessageHeaders _copyHeaderValueForKey:offset:decoded:](self, "_copyHeaderValueForKey:offset:decoded:", v4, &v8, 0);
  v6 = (void *)objc_msgSend((id)objc_opt_class(), "copyAddressListFromEncodedData:encoding:", v5, self->_preferredEncoding);

  return v6;
}

- (id)copyAddressListForSender
{
  return -[MFMessageHeaders _copyAddressListForKey:](self, "_copyAddressListForKey:", *MEMORY[0x1E0D1E568]);
}

- (id)firstSenderAddress
{
  id v2;
  void *v3;

  v2 = -[MFMessageHeaders _copyAddressListForKey:](self, "_copyAddressListForKey:", *MEMORY[0x1E0D1E568]);
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)copyAddressListForTo
{
  return -[MFMessageHeaders _copyAddressListForKey:](self, "_copyAddressListForKey:", *MEMORY[0x1E0D1E600]);
}

- (id)copyAddressListForCc
{
  return -[MFMessageHeaders _copyAddressListForKey:](self, "_copyAddressListForKey:", *MEMORY[0x1E0D1E520]);
}

- (id)copyAddressListForBcc
{
  return -[MFMessageHeaders _copyAddressListForKey:](self, "_copyAddressListForKey:", *MEMORY[0x1E0D1E518]);
}

- (id)copyAddressListForResentFrom
{
  return -[MFMessageHeaders _copyAddressListForKey:](self, "_copyAddressListForKey:", *MEMORY[0x1E0D1E5E0]);
}

- (id)copyAddressListForReplyTo
{
  return -[MFMessageHeaders _copyAddressListForKey:](self, "_copyAddressListForKey:", *MEMORY[0x1E0D1E5D0]);
}

- (id)_commaSeparatedValuesForKey:(id)a3 includeAngleBracket:(BOOL)a4
{
  __CFString *v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  const char *CStringPtr;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  UniChar v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int64_t v27;
  id v28;
  _BOOL4 v29;
  UniChar buffer[8];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  CFStringRef theString[2];
  __int128 v39;
  __int128 v40;
  int64_t v41;
  CFRange v42;

  v29 = a4;
  v28 = a3;
  v5 = -[MFMessageHeaders copyFirstHeaderForKey:](self, "copyFirstHeaderForKey:", v28);
  v41 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v39 = v6;
  v40 = v6;
  v37 = v6;
  *(_OWORD *)theString = v6;
  v35 = v6;
  v36 = v6;
  v33 = v6;
  v34 = v6;
  v31 = v6;
  v32 = v6;
  *(_OWORD *)buffer = v6;
  v7 = -[__CFString length](v5, "length");
  v8 = v7;
  if (v7)
  {
    theString[0] = v5;
    *((_QWORD *)&v39 + 1) = 0;
    *(_QWORD *)&v40 = v7;
    theString[1] = (CFStringRef)CFStringGetCharactersPtr(v5);
    if (theString[1])
      CStringPtr = 0;
    else
      CStringPtr = CFStringGetCStringPtr(v5, 0x600u);
    v12 = 0;
    v10 = 0;
    v13 = 0;
    *((_QWORD *)&v40 + 1) = 0;
    v41 = 0;
    v14 = 64;
    *(_QWORD *)&v39 = CStringPtr;
    v15 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      if ((unint64_t)v13 >= 4)
        v16 = 4;
      else
        v16 = v13;
      if (v13 < 0 || (v17 = v40, (uint64_t)v40 <= v13))
      {
        v18 = 0;
      }
      else if (theString[1])
      {
        v18 = *((_WORD *)&theString[1]->isa + v13 + *((_QWORD *)&v39 + 1));
      }
      else if ((_QWORD)v39)
      {
        v18 = *(char *)(v39 + *((_QWORD *)&v39 + 1) + v13);
      }
      else
      {
        if (v41 <= v13 || (v22 = *((_QWORD *)&v40 + 1), *((uint64_t *)&v40 + 1) > v13))
        {
          v23 = -v16;
          v24 = v16 + v12;
          v25 = v14 - v16;
          v26 = v13 + v23;
          v27 = v26 + 64;
          if (v26 + 64 >= (uint64_t)v40)
            v27 = v40;
          *((_QWORD *)&v40 + 1) = v26;
          v41 = v27;
          if ((uint64_t)v40 >= v25)
            v17 = v25;
          v42.length = v17 + v24;
          v42.location = v26 + *((_QWORD *)&v39 + 1);
          CFStringGetCharacters(theString[0], v42, buffer);
          v22 = *((_QWORD *)&v40 + 1);
        }
        v18 = buffer[v13 - v22];
      }
      if (v15 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v18 == 60)
          v15 = v13;
        else
          v15 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_27;
      }
      if (v18 == 62)
        break;
LABEL_27:
      ++v13;
      --v12;
      ++v14;
      if (v8 == v13)
        goto LABEL_5;
    }
    if (v29)
    {
      v19 = v13 - v15 + 1;
      if (!v10)
        goto LABEL_25;
    }
    else
    {
      v20 = ~v15++;
      v19 = v20 + v13;
      if (!v10)
      {
LABEL_25:
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    -[__CFString substringWithRange:](v5, "substringWithRange:", v15, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v21);

    v15 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_27;
  }
  v10 = 0;
LABEL_5:

  return v10;
}

- (id)references
{
  return -[MFMessageHeaders _commaSeparatedValuesForKey:includeAngleBracket:](self, "_commaSeparatedValuesForKey:includeAngleBracket:", *MEMORY[0x1E0D1E5C0], 1);
}

- (NSArray)listUnsubscribeCommands
{
  return (NSArray *)-[MFMessageHeaders _commaSeparatedValuesForKey:includeAngleBracket:](self, "_commaSeparatedValuesForKey:includeAngleBracket:", *MEMORY[0x1E0D1E598], 0);
}

- (NSString)listUnsubscribePostContent
{
  return (NSString *)-[MFMessageHeaders firstHeaderForKey:](self, "firstHeaderForKey:", *MEMORY[0x1E0D1E5A0]);
}

- (id)firstHeaderForKey:(id)a3
{
  uint64_t v4;

  v4 = 0;
  -[MFMessageHeaders _headerValueForKey:offset:](self, "_headerValueForKey:offset:", a3, &v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)firstAddressForKey:(id)a3
{
  -[MFMessageHeaders firstHeaderForKey:](self, "firstHeaderForKey:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)copyFirstHeaderForKey:(id)a3
{
  uint64_t v4;

  v4 = 0;
  return -[MFMessageHeaders _copyHeaderValueForKey:offset:decoded:](self, "_copyHeaderValueForKey:offset:decoded:", a3, &v4, 1);
}

- (id)copyFirstNonDecodedHeaderForKey:(id)a3
{
  id v4;
  id v5;
  uint64_t v7;

  v4 = a3;
  v7 = 0;
  v5 = -[MFMessageHeaders _copyHeaderValueForKey:offset:decoded:](self, "_copyHeaderValueForKey:offset:decoded:", v4, &v7, 0);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      __assert_rtn("-[MFMessageHeaders copyFirstNonDecodedHeaderForKey:]", "MessageHeaders.m", 621, "!result || [result isKindOfClass:[NSData class]]");
  }

  return v5;
}

- (id)copyFirstStringValueForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = -[MFMessageHeaders copyFirstHeaderForKey:](self, "copyFirstHeaderForKey:", a3);
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v4, -[MFMessageHeaders preferredEncoding](self, "preferredEncoding"));

  }
  return v5;
}

- (id)_decodeHeaderKeysFromData:(id)a3
{
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__MFMessageHeaders__decodeHeaderKeysFromData___block_invoke;
  v7[3] = &unk_1E5AA1450;
  v5 = v4;
  v8 = v5;
  -[MFMessageHeaders enumerateKeysAndBytesUsingBlock:](self, "enumerateKeysAndBytesUsingBlock:", v7);

  return v5;
}

void __46__MFMessageHeaders__decodeHeaderKeysFromData___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "lowercaseString");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:");

}

- (NSData)encodedHeaders
{
  return self->_data;
}

- (void)appendHeaderData:(id)a3 andRecipients:(id)a4
{
  uint64_t v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  char v23;
  char v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  unint64_t v50;
  void *v51;
  unsigned int v52;
  MFMessageHeaders *v53;
  int v54;
  id v55;
  id v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v56 = a3;
  v57 = a4;
  -[MFMessageHeaders allHeaderKeys](self, "allHeaderKeys");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "count");
  v43 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v44 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v45 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v39 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (v50)
  {
    v6 = 0;
    v52 = 0;
    v48 = *MEMORY[0x1E0D1E518];
    v47 = *MEMORY[0x1E0D1E600];
    v42 = *MEMORY[0x1E0D1E520];
    v46 = *MEMORY[0x1E0D1E5F0];
    v41 = *MEMORY[0x1E0D1E5D8];
    v40 = *MEMORY[0x1E0D1E568];
    v38 = *MEMORY[0x1E0D1E5E0];
    v37 = *MEMORY[0x1E0D1E5D0];
    v53 = self;
    while (1)
    {
      objc_msgSend(v49, "objectAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", v48);
      v9 = (objc_msgSend(v7, "isEqualToString:", v47) & 1) != 0 ? 1 : objc_msgSend(v7, "isEqualToString:", v42);
      if ((objc_msgSend(v7, "isEqualToString:", v46) & 1) != 0)
        break;
      v10 = objc_msgSend(v7, "isEqualToString:", v41);
      if (((v8 | v9 | v10) & 1) != 0)
        goto LABEL_12;
      if ((objc_msgSend(v7, "isEqualToString:", v40) & 1) != 0 || (objc_msgSend(v7, "isEqualToString:", v38) & 1) != 0)
      {
        v10 = 0;
LABEL_12:
        v54 = 1;
        if ((v8 & 1) == 0)
          goto LABEL_13;
        goto LABEL_14;
      }
      v54 = objc_msgSend(v7, "isEqualToString:", v37);
      v10 = 0;
      if ((v8 & 1) == 0)
      {
LABEL_13:
        if ((objc_msgSend(v7, "isEqualToString:", CFSTR("from ")) & 1) != 0)
          goto LABEL_41;
      }
LABEL_14:
      -[MFMessageHeaders _capitalizedKeyForKey:](self, "_capitalizedKeyForKey:", v7);
      v55 = (id)objc_claimAutoreleasedReturnValue();
      v51 = v7;
      -[MFMessageHeaders headersForKey:](self, "headersForKey:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");
      if (v12)
      {
        v13 = 0;
        v14 = v9 | v10 | v8;
        v15 = v44;
        if (!v10)
          v15 = v45;
        if (v9)
          v16 = v43;
        else
          v16 = v15;
        while (1)
        {
          objc_msgSend(v11, "objectAtIndex:", v13);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            break;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v22 = v17;
            v20 = v22;
            if (v54)
              __assert_rtn("-[MFMessageHeaders appendHeaderData:andRecipients:]", "MessageHeaders.m", 1046, "0 && \"We have already decoded this, so we can't actually grab the address here.\");
            if (v22)
              v23 = v8;
            else
              v23 = 1;
            if ((v23 & 1) != 0)
            {
              v18 = 0;
            }
            else
            {
              objc_msgSend(v22, "mf_encodedHeaderDataWithEncodingHint:", 0xFFFFFFFFLL);
              v18 = (id)objc_claimAutoreleasedReturnValue();
            }
LABEL_33:

LABEL_34:
            if (v18)
              v24 = v8;
            else
              v24 = 1;
            if ((v24 & 1) == 0)
            {
              objc_msgSend(v56, "mf_appendCString:", objc_msgSend(objc_retainAutorelease(v55), "ef_lossyDefaultCStringBytes"));
              objc_msgSend(v56, "appendBytes:length:", ": ", 2);
              objc_msgSend(v56, "appendData:", v18);
              objc_msgSend(v56, "appendBytes:length:", "\n", 1);
            }
            goto LABEL_39;
          }
          v18 = 0;
LABEL_39:

          if (v12 == ++v13)
            goto LABEL_40;
        }
        v18 = v17;
        if (v14)
        {
          v19 = v16;
          if (v16)
          {
            v20 = v19;
            v21 = (void *)objc_msgSend((id)objc_opt_class(), "copyAddressListFromEncodedData:encoding:", v18, 134217984);
            objc_msgSend(v20, "addObjectsFromArray:", v21);

            goto LABEL_33;
          }
        }
        goto LABEL_34;
      }
LABEL_40:

      v7 = v51;
      self = v53;
LABEL_41:

      v6 = ++v52;
      if (v50 <= v52)
        goto LABEL_45;
    }
    v10 = 1;
    goto LABEL_12;
  }
LABEL_45:
  objc_msgSend(v56, "appendBytes:length:", "\n", 1);
  if (objc_msgSend(v44, "count"))
  {
    objc_msgSend(v44, "allObjects");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addObjectsFromArray:", v25);
  }
  else
  {
    if (!objc_msgSend(v43, "count"))
      goto LABEL_50;
    objc_msgSend(v43, "allObjects");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addObjectsFromArray:", v25);
  }

LABEL_50:
  if (objc_msgSend(v45, "count"))
  {
    objc_msgSend(v45, "allObjects");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addObjectsFromArray:", v26);

  }
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v27 = v39;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
  if (v28)
  {
    v29 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v59 != v29)
          objc_enumerationMutation(v27);
        v31 = *(id *)(*((_QWORD *)&v58 + 1) + 8 * i);
        objc_msgSend(v31, "emailAddressValue");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "simpleAddress");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v33;
        if (v33)
        {
          v35 = v33;
        }
        else
        {
          objc_msgSend(v31, "stringValue");
          v35 = (id)objc_claimAutoreleasedReturnValue();
        }
        v36 = v35;

        objc_msgSend(v57, "addObject:", v36);
      }
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
    }
    while (v28);
  }

}

+ (id)uniqueHeaderKeyStringForString:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  v4 = (void *)*MEMORY[0x1E0D1E568];
  if (!objc_msgSend(v3, "caseInsensitiveCompare:", *MEMORY[0x1E0D1E568])
    || (v4 = (void *)*MEMORY[0x1E0D1E5F8], v5 = v3, !objc_msgSend(v3, "caseInsensitiveCompare:", *MEMORY[0x1E0D1E5F8])))
  {
    v5 = v4;

  }
  return v5;
}

- (id)messageIDListForKey:(id)a3
{
  -[MFMessageHeaders headersForKey:](self, "headersForKey:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)firstMessageIDForKey:(id)a3
{
  -[MFMessageHeaders firstHeaderForKey:](self, "firstHeaderForKey:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p> %s\n"), objc_opt_class(), self, -[NSData bytes](self->_data, "bytes"));
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

- (void)copyDecodedStringFromHeaderData:(uint64_t)a3 withRange:(os_log_t)log .cold.1(char a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218240;
  *(_QWORD *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a1 & 1;
  _os_log_fault_impl(&dword_1ABB13000, log, OS_LOG_TYPE_FAULT, "MFMessageHeaders::copyDecodedStringFromHeaderData invalid data, [data:%p] [data.isNSData:%i]", buf, 0x12u);
}

@end
