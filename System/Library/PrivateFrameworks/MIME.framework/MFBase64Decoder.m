@implementation MFBase64Decoder

- (MFBase64Decoder)initWithConsumers:(id)a3
{
  MFBase64Decoder *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MFBase64Decoder;
  result = -[MFBaseFilterDataConsumer initWithConsumers:](&v4, sel_initWithConsumers_, a3);
  if (result)
    result->_table = (const char *)&Decode64Table;
  return result;
}

- (unint64_t)_decodeBytes:(const char *)a3 end:(const char *)a4 into:(char *)a5 length:(unint64_t)a6 startingAt:(unint64_t)a7 outEncodedOffset:(unint64_t *)a8
{
  unint64_t equalCount;
  unint64_t validBytes;
  unsigned int decodedBits;
  const char *table;
  int64_t v17;
  const char *v18;
  int v19;
  void *v20;
  char *v21;
  unint64_t *v25;
  objc_super v26;

  equalCount = self->_equalCount;
  validBytes = self->_validBytes;
  decodedBits = self->_decodedBits;
  if (a3 >= a4)
  {
    v18 = a3;
    goto LABEL_20;
  }
  v25 = a8;
  table = self->_table;
  v17 = a4 - a3;
  v18 = a3;
  do
  {
    v19 = table[*(unsigned __int8 *)v18];
    if (table[*(unsigned __int8 *)v18] < 0)
    {
      if ((~v19 & 0xFB) == 0)
      {
LABEL_9:
        equalCount = 0;
        goto LABEL_10;
      }
      if (v19 == 252 && validBytes != 0 && ++equalCount == 4 - validBytes)
        goto LABEL_19;
    }
    else
    {
      decodedBits = v19 + (decodedBits << 6);
      if ((++validBytes & 3) != 0)
        goto LABEL_9;
      if (a7 + 2 >= a6)
      {
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a5, a7);
        v26.receiver = self;
        v26.super_class = (Class)MFBase64Decoder;
        -[MFBaseFilterDataConsumer appendData:](&v26, sel_appendData_, v20);

        a7 = 0;
      }
      equalCount = 0;
      v21 = &a5[a7];
      *(_WORD *)(v21 + 1) = bswap32(decodedBits) >> 16;
      *v21 = BYTE2(decodedBits);
      a7 += 3;
      decodedBits = 0;
    }
LABEL_10:
    ++v18;
    --v17;
  }
  while (v17);
  v18 = a4;
LABEL_19:
  a8 = v25;
LABEL_20:
  self->_equalCount = equalCount;
  self->_validBytes = validBytes & 3;
  self->_decodedBits = decodedBits;
  if (a8)
    *a8 = v18 - a3;
  return a7;
}

- (int64_t)appendData:(id)a3
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  char v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  _BOOL4 v11;
  unint64_t v12;
  _BOOL4 v13;
  int v14;
  int v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  void *v20;
  unint64_t i;
  unint64_t v22;
  size_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v36;
  id v37;
  char v38;
  uint64_t v39;
  objc_super v40;
  uint64_t v41;
  objc_super v42;
  objc_super v43;
  _BYTE __b[16384];
  uint64_t v45;

  v39 = MEMORY[0x1E0C80A78](self, a2, a3);
  v45 = *MEMORY[0x1E0C80C00];
  v36 = v3;
  v4 = objc_msgSend(v36, "length");
  v37 = objc_retainAutorelease(v36);
  v5 = objc_msgSend(v37, "bytes");
  memset(__b, 170, sizeof(__b));
  v6 = objc_msgSend((id)v39, "convertCommas");
  if (!v4)
    goto LABEL_66;
  v7 = 0;
  v8 = 0;
  v38 = v6;
  do
  {
    v9 = (void *)v39;
    v10 = *(_QWORD *)(v39 + 40);
    if (v10 && *(_QWORD *)(v39 + 48) == 4 - v10)
    {
      v11 = 0;
      v12 = v4 - v7;
      goto LABEL_34;
    }
    if (v4 == v7)
    {
      v12 = 0;
      v13 = 1;
      goto LABEL_33;
    }
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = v5 + v7;
    v13 = 1;
    do
    {
      v18 = *(unsigned __int8 *)(v17 + v16);
      if ((*(char *)(v17 + v16) & 0x80000000) == 0
        && ((_DWORD)v18 == 44 ? (v19 = v6) : (v19 = 0),
            (v19 & 1) != 0 || ((1 << (v18 & 7)) & _IsValidBase64Chr_table[v18 >> 3]) != 0))
      {
        v13 = v14 == 0;
      }
      else
      {
        if (*(unsigned __int8 *)(v17 + v16) <= 0xCu)
        {
          if ((_DWORD)v18 != 9)
          {
            if ((_DWORD)v18 == 10)
            {
LABEL_23:
              v15 = 1;
              goto LABEL_31;
            }
LABEL_30:
            v13 = 0;
            goto LABEL_31;
          }
        }
        else
        {
          if ((_DWORD)v18 == 13)
            goto LABEL_23;
          if ((_DWORD)v18 == 33)
          {
            if (v14)
              v13 = 0;
            v14 = 1;
            goto LABEL_31;
          }
          if ((_DWORD)v18 != 32)
            goto LABEL_30;
        }
        if (!v14)
          goto LABEL_31;
      }
      if (v15)
      {
        v12 = v16 - 1;
        goto LABEL_33;
      }
LABEL_31:
      ++v16;
    }
    while (v4 - v7 != v16);
    v12 = 0;
LABEL_33:
    v11 = v13;
    if (!v11)
    {
LABEL_34:
      if (v12)
      {
        if (*(_QWORD *)(v39 + 24))
        {
          v43.receiver = (id)v39;
          v43.super_class = (Class)MFBase64Decoder;
          -[MFBaseFilterDataConsumer appendData:](&v43, sel_appendData_);
          v20 = *(void **)(v39 + 24);
          *(_QWORD *)(v39 + 24) = 0;

        }
        for (i = 0; i < v12; i += v23)
        {
          v22 = 0x4000 - v8;
          if (v8 > 0x4000)
            v22 = 0x4000;
          if (v22 >= v4 - (i + v7))
            v23 = v4 - (i + v7);
          else
            v23 = v22;
          memmove(&__b[v8], (const void *)(v5 + i + v7), v23);
          v8 += v23;
          v24 = v8 - 0x4000;
          if (v8 >= 0x4000)
          {
            v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", __b, 0x4000);
            v42.receiver = (id)v39;
            v42.super_class = (Class)MFBase64Decoder;
            -[MFBaseFilterDataConsumer appendData:](&v42, sel_appendData_, v25);

            v8 = v24;
          }
        }
        goto LABEL_53;
      }
    }
    if (!v12)
      v11 = 0;
    v26 = *(void **)(v39 + 24);
    if (!v11)
    {
      if (objc_msgSend(v26, "length") + v4 - v7 <= 0x4000)
        goto LABEL_60;
      v28 = *(void **)(v39 + 24);
      if (v28)
      {
        v8 = objc_msgSend((id)v39, "_decodeBytes:end:into:length:startingAt:outEncodedOffset:", objc_msgSend(v28, "bytes"), objc_msgSend(*(id *)(v39 + 24), "bytes") + objc_msgSend(*(id *)(v39 + 24), "length"), __b, 0x4000, v8, 0);
        v29 = *(void **)(v39 + 24);
        *(_QWORD *)(v39 + 24) = 0;

      }
      if (v4 - v7 <= 0x4000)
      {
LABEL_60:
        v30 = v39;
      }
      else
      {
        v41 = 0;
        v30 = v39;
        v8 = objc_msgSend((id)v39, "_decodeBytes:end:into:length:startingAt:outEncodedOffset:");
      }
      v31 = *(void **)(v30 + 24);
      if (v31)
      {
        objc_msgSend(v31, "appendBytes:length:", v5 + v7, v4 - v7);
      }
      else
      {
        v32 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithBytes:length:", v5 + v7, v4 - v7);
        v33 = *(void **)(v39 + 24);
        *(_QWORD *)(v39 + 24) = v32;

      }
      break;
    }
    if (v26)
    {
      v8 = objc_msgSend((id)v39, "_decodeBytes:end:into:length:startingAt:outEncodedOffset:", objc_msgSend(v26, "bytes"), objc_msgSend(*(id *)(v39 + 24), "bytes") + objc_msgSend(*(id *)(v39 + 24), "length"), __b, 0x4000, v8, 0);
      v27 = *(void **)(v39 + 24);
      *(_QWORD *)(v39 + 24) = 0;

      v9 = (void *)v39;
    }
    v8 = objc_msgSend(v9, "_decodeBytes:end:into:length:startingAt:outEncodedOffset:", v5 + v7, v5 + v7 + v12, __b, 0x4000, v8, 0);
LABEL_53:
    v7 += v12;
    v6 = v38;
  }
  while (v7 < v4);
  if (v8)
  {
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", __b, v8);
    v40.receiver = (id)v39;
    v40.super_class = (Class)MFBase64Decoder;
    -[MFBaseFilterDataConsumer appendData:](&v40, sel_appendData_, v34);

  }
LABEL_66:

  return v4;
}

- (void)done
{
  NSMutableData *leftovers;
  unint64_t v4;
  NSMutableData *v5;
  unint64_t validBytes;
  unsigned int decodedBits;
  unint64_t v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  objc_super v12;
  _BYTE __b[8192];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  memset(__b, 170, sizeof(__b));
  leftovers = self->_leftovers;
  if (leftovers)
  {
    v4 = -[MFBase64Decoder _decodeBytes:end:into:length:startingAt:outEncodedOffset:](self, "_decodeBytes:end:into:length:startingAt:outEncodedOffset:", -[NSMutableData bytes](leftovers, "bytes"), -[NSMutableData bytes](self->_leftovers, "bytes") + -[NSMutableData length](self->_leftovers, "length"), __b, 0x2000, 0, 0);
    v5 = self->_leftovers;
    self->_leftovers = 0;

  }
  else
  {
    v4 = 0;
  }
  if (self->_bound)
  {
    validBytes = self->_validBytes;
    if (self->_equalCount != 4 - validBytes)
      goto LABEL_13;
  }
  else
  {
    validBytes = self->_validBytes;
  }
  if (validBytes == 2)
  {
    v9 = self->_decodedBits >> 4;
    v10 = 1;
    v8 = v4;
  }
  else
  {
    if (validBytes != 3)
      goto LABEL_13;
    decodedBits = self->_decodedBits;
    v8 = v4 + 1;
    __b[v4] = decodedBits >> 10;
    v9 = decodedBits >> 2;
    v10 = 2;
  }
  v4 += v10;
  __b[v8] = v9;
  self->_validBytes = 1;
  self->_validBytes = 1 - self->_equalCount;
LABEL_13:
  if (v4)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", __b, v4);
    v12.receiver = self;
    v12.super_class = (Class)MFBase64Decoder;
    -[MFBaseFilterDataConsumer appendData:](&v12, sel_appendData_, v11);

  }
}

- (void)setConvertCommas:(BOOL)a3
{
  const char *v3;

  v3 = (const char *)&Decode64Table;
  if (a3)
    v3 = (const char *)&Decode64AltTable;
  self->_table = v3;
}

- (BOOL)convertCommas
{
  return self->_table == Decode64AltTable;
}

+ (BOOL)isValidBase64:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  unsigned __int8 *v7;
  unint64_t v8;
  _BOOL4 v9;
  int v10;
  BOOL v11;
  BOOL v12;

  v3 = objc_retainAutorelease(a3);
  v4 = objc_msgSend(v3, "bytes");
  v5 = objc_msgSend(v3, "length");
  if (v5 >= 1)
  {
    v6 = 0;
    v7 = (unsigned __int8 *)v4;
    while (1)
    {
      v8 = *v7;
      if ((_DWORD)v8 == 61)
      {
        ++v6;
        v9 = 1;
      }
      else
      {
        if (v6)
        {
          v12 = 0;
          goto LABEL_20;
        }
        if ((v8 & 0x80) != 0)
          v10 = 0;
        else
          v10 = (_IsValidBase64Chr_table[v8 >> 3] >> (v8 & 7)) & 1;
        v6 = 0;
        v9 = v10 != 0;
      }
      ++v7;
      if (!v9 || (unint64_t)v7 >= v4 + v5)
        goto LABEL_14;
    }
  }
  v6 = 0;
  v9 = 1;
  LOBYTE(v7) = v4;
LABEL_14:
  v11 = (((_BYTE)v7 - (_BYTE)v4) & 3) == 0;
  if (v6 > 2)
    v11 = 0;
  v12 = v9 && v11;
LABEL_20:

  return v12;
}

- (unint64_t)unconverted
{
  return self->_validBytes;
}

- (BOOL)isBound
{
  return self->_bound;
}

- (void)setIsBound:(BOOL)a3
{
  self->_bound = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leftovers, 0);
}

@end
