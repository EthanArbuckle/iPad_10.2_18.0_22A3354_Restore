@implementation HMDExtendedTypeReader

- (HMDExtendedTypeReader)initWithReader:(id)a3
{
  id v5;
  HMDExtendedTypeReader *v6;
  HMDExtendedTypeReader *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDExtendedTypeReader;
  v6 = -[HMDExtendedTypeReader init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_reader, a3);

  return v7;
}

- (_HMDStructuredDataToken)nextTokenAfterToken:(const _HMDStructuredDataToken *)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  __CFString *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  _QWORD *v12;
  _QWORD *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __CFString *v22;
  id v23;
  uint64_t v24;
  HMDExtendedTypeReader *v25;
  uint64_t v26;
  int64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  _HMDStructuredDataToken result;

  v4 = -[HMDExtendedTypeReader _bufferPeekAtOffset:]((uint64_t)self, 0);
  if (*(_QWORD *)v4 != 3)
    goto LABEL_19;
  v5 = -[HMDExtendedTypeReader _bufferPeekAtOffset:]((uint64_t)self, 1uLL);
  if (*(_QWORD *)v5 != 5)
    goto LABEL_19;
  v6 = *(id *)(v5 + 8);
  if (objc_msgSend(v6, "characterAtIndex:", 0) != 36)
    goto LABEL_18;
  v7 = CFSTR("$null");
  v8 = objc_msgSend(v6, "isEqualToString:", CFSTR("$null"));
  if ((v8 & 1) == 0)
  {
    v7 = CFSTR("$base64");
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("$base64")) & 1) != 0)
    {
      v10 = 0;
      v11 = 0;
      v9 = 1;
      goto LABEL_12;
    }
    v7 = CFSTR("$date");
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("$date")) & 1) != 0)
    {
      v9 = 0;
      v11 = 0;
      v10 = 1;
      goto LABEL_12;
    }
    v7 = CFSTR("$uuid");
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("$uuid")) & 1) != 0)
    {
      v9 = 0;
      v10 = 0;
      v11 = 1;
      goto LABEL_12;
    }
LABEL_18:

    goto LABEL_19;
  }
  v9 = 0;
  v10 = 0;
  v11 = 0;
LABEL_12:

  v12 = (_QWORD *)-[HMDExtendedTypeReader _bufferPeekAtOffset:]((uint64_t)self, 2uLL);
  if (*v12 == 8)
  {
    v13 = v12;
    if (*(_QWORD *)-[HMDExtendedTypeReader _bufferPeekAtOffset:]((uint64_t)self, 3uLL) == 4)
    {
      v14 = (id)v13[1];
      v22 = v7;
      if (!self)
      {
        v23 = 0;
        v24 = 0;
        goto LABEL_31;
      }
      if (v8)
      {
        if (!objc_msgSend(v14, "length"))
        {
          v23 = 0;
          v24 = 6;
LABEL_31:

          v25 = self;
          v26 = 4;
          goto LABEL_20;
        }
      }
      else if (v9)
      {
        v29 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v14, 0);
        if (v29)
        {
          v23 = (id)v29;
          v24 = 10;
          goto LABEL_31;
        }
      }
      else if (v10)
      {
        HMDExtendedTypeDateFormatter();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "dateFromString:", v14);
        v23 = (id)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          v24 = 11;
          goto LABEL_31;
        }
      }
      else if (v11)
      {
        v31 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v14);
        if (v31)
        {
          v23 = (id)v31;
          v24 = 12;
          goto LABEL_31;
        }
      }
      v24 = HMDStructuredDataErrorWithReason(CFSTR("Invalid extended value: %@"), v15, v16, v17, v18, v19, v20, v21, (uint64_t)v22);
      v23 = v32;
      goto LABEL_31;
    }
  }
LABEL_19:
  v24 = *(_QWORD *)v4;
  v23 = *(id *)(v4 + 8);
  v25 = self;
  v26 = 1;
LABEL_20:
  -[HMDExtendedTypeReader _bufferConsumeTokens:]((uint64_t)v25, v26);
  v27 = v24;
  v28 = v23;
  result.value = v28;
  result.type = v27;
  return result;
}

- (void).cxx_destruct
{
  _HMDStructuredDataToken *buffer;
  uint64_t i;

  buffer = self->_buffer;
  for (i = 56; i != -8; i -= 16)

  objc_storeStrong((id *)&self->_reader, 0);
}

- (uint64_t)_bufferPeekAtOffset:(uint64_t)result
{
  uint64_t v3;
  _QWORD *v4;
  unint64_t i;
  uint64_t *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  if (result)
  {
    v3 = result;
    v4 = (_QWORD *)(result + 104);
    for (i = *(_QWORD *)(result + 104); i <= a2; i = *(_QWORD *)(v3 + 104))
    {
      *v4 = i + 1;
      v6 = (uint64_t *)(v3 + 32 + 16 * ((*(_DWORD *)(v3 + 96) + (_BYTE)i) & 3));
      v7 = objc_msgSend(*(id *)(v3 + 24), "readToken");
      v8 = (void *)v6[1];
      *v6 = v7;
      v6[1] = v9;

      v4 = (_QWORD *)(v3 + 104);
    }
    return v3 + 32 + 16 * ((*(_DWORD *)(v3 + 96) + (_BYTE)a2) & 3);
  }
  return result;
}

- (void)_bufferConsumeTokens:(uint64_t)a1
{
  _QWORD *v4;
  void *v5;

  if (a1)
  {
    do
    {
      v4 = (_QWORD *)(a1 + 32 + 16 * (*(_QWORD *)(a1 + 96) & 3));
      v5 = (void *)v4[1];
      *v4 = 0;
      v4[1] = 0;

      *(_QWORD *)(a1 + 96) = (*(_DWORD *)(a1 + 96) + 1) & 3;
      --*(_QWORD *)(a1 + 104);
      --a2;
    }
    while (a2);
  }
}

@end
