@implementation MFQuotedPrintableDecoder

- (int64_t)appendData:(id)a3
{
  uint64_t v3;
  id v4;
  uint64_t v6;
  _BYTE *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char v16;
  uint64_t v17;
  unint64_t v18;
  __darwin_ct_rune_t v19;
  char v21;
  void *v22;
  int64_t v23;
  id v24;
  objc_super v25;
  objc_super v26;
  objc_super v27;
  objc_super v28;
  objc_super v29;
  _BYTE __b[16384];
  uint64_t v31;

  v3 = MEMORY[0x1E0C80A78](self, a2, a3);
  v31 = *MEMORY[0x1E0C80C00];
  v24 = v4;
  v23 = objc_msgSend(v24, "length");
  memset(__b, 170, sizeof(__b));
  if (*(_BYTE *)(v3 + 33))
  {
    v29.receiver = (id)v3;
    v29.super_class = (Class)MFQuotedPrintableDecoder;
    -[MFBaseFilterDataConsumer appendData:](&v29, sel_appendData_, v24);
    goto LABEL_3;
  }
  if (v23)
  {
    v6 = objc_msgSend(objc_retainAutorelease(v24), "bytes");
    if (v23 >= 1)
    {
      v7 = (_BYTE *)v6;
      v8 = 0;
      v9 = v6 + v23;
      v10 = v6 + v23 - 1;
      while (1)
      {
        if (*(_BYTE *)(v3 + 33))
        {
          if (v8)
          {
            v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", __b, v8, 0);
            v28.receiver = (id)v3;
            v28.super_class = (Class)MFQuotedPrintableDecoder;
            -[MFBaseFilterDataConsumer appendData:](&v28, sel_appendData_, v11);

          }
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v7, v9 - (_QWORD)v7, 0);
          v27.receiver = (id)v3;
          v27.super_class = (Class)MFQuotedPrintableDecoder;
          -[MFBaseFilterDataConsumer appendData:](&v27, sel_appendData_, v12);
          v7 = (_BYTE *)v10;
          goto LABEL_40;
        }
        v13 = *(_QWORD *)(v3 + 24);
        v14 = *v7;
        if (!v13)
        {
          if ((_DWORD)v14 == 61)
          {
            *(_QWORD *)(v3 + 24) = 2;
            *(_BYTE *)(v3 + 17) = 0;
            goto LABEL_38;
          }
          if ((_DWORD)v14 == 10 && *(_BYTE *)(v3 + 32) == 0)
          {
            __b[v8++] = 13;
            LOBYTE(v14) = *v7;
          }
          __b[v8] = v14;
LABEL_33:
          ++v8;
          goto LABEL_38;
        }
        if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v14 + 60) & 0x10000) != 0)
        {
          *(_QWORD *)(v3 + 24) = v13 - 1;
          v19 = *v7;
          if (v13 != 1)
          {
            *(_BYTE *)(v3 + 17) = v19;
            goto LABEL_38;
          }
          v21 = __maskrune(v19, 0xFuLL);
          __b[v8] = v21 | (16 * __maskrune(*(unsigned __int8 *)(v3 + 17), 0xFuLL));
          goto LABEL_33;
        }
        if (v13 == 2 && (_DWORD)v14 == 10)
        {
          *(_QWORD *)(v3 + 24) = 0;
          goto LABEL_38;
        }
        if (v13 == 2)
          break;
        v18 = v8 + 1;
        __b[v8] = 61;
        if (v13 == 1)
        {
          v16 = *(_BYTE *)(v3 + 17);
          v17 = 2;
LABEL_36:
          __b[v18] = v16;
          v18 = v8 + v17;
        }
        __b[v18] = *v7;
        v8 = v18 + 1;
        *(_QWORD *)(v3 + 24) = 0;
        *(_BYTE *)(v3 + 33) = 1;
LABEL_38:
        if (v8 >= 0x3FFE)
        {
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", __b, v8, 0);
          v26.receiver = (id)v3;
          v26.super_class = (Class)MFQuotedPrintableDecoder;
          -[MFBaseFilterDataConsumer appendData:](&v26, sel_appendData_, v12);
LABEL_40:

          v8 = 0;
        }
        if ((unint64_t)++v7 >= v9)
        {
          if (v8)
          {
            v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", __b, v8, 0);
            v25.receiver = (id)v3;
            v25.super_class = (Class)MFQuotedPrintableDecoder;
            -[MFBaseFilterDataConsumer appendData:](&v25, sel_appendData_, v22);

          }
          goto LABEL_3;
        }
      }
      if ((_DWORD)v14 == 32)
        goto LABEL_38;
      v16 = 61;
      v17 = 1;
      v18 = v8;
      goto LABEL_36;
    }
  }
LABEL_3:

  return v23;
}

- (void)done
{
  uint64_t v2;
  uint64_t v4;
  void *v5;
  objc_super v6;
  _BYTE v7[16384];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)&self->_lastEncoded;
  if (v2)
  {
    memset(&v7[1], 170, 0x3FFFuLL);
    v7[0] = 61;
    if (v2 == 1)
    {
      v7[1] = *(&self->super._serialAppend + 1);
      v4 = 2;
    }
    else
    {
      v4 = 1;
    }
    *(_QWORD *)&self->_lastEncoded = 0;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v7, v4, 0);
    v6.receiver = self;
    v6.super_class = (Class)MFQuotedPrintableDecoder;
    -[MFBaseFilterDataConsumer appendData:](&v6, sel_appendData_, v5);

  }
}

- (BOOL)forTextPart
{
  return self->_required;
}

- (void)setForTextPart:(BOOL)a3
{
  LOBYTE(self->_required) = a3;
}

@end
