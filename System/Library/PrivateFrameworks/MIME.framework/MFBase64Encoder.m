@implementation MFBase64Encoder

- (MFBase64Encoder)initWithConsumers:(id)a3
{
  MFBase64Encoder *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MFBase64Encoder;
  result = -[MFBaseFilterDataConsumer initWithConsumers:](&v4, sel_initWithConsumers_, a3);
  if (result)
  {
    result->_padChar = 61;
    result->_table = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
  }
  return result;
}

- (int64_t)appendData:(id)a3
{
  uint64_t v3;
  id v4;
  id v5;
  char *v6;
  unint64_t v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  unint64_t v14;
  int v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  int64_t v19;
  unsigned __int8 *v20;
  unsigned __int8 *v21;
  _BYTE *v22;
  int v23;
  uint64_t v24;
  int v25;
  unint64_t v26;
  int v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  unint64_t v34;
  unint64_t v35;
  int64_t v36;
  id v37;
  objc_super v38;
  objc_super v39;
  _BYTE __b[32768];
  uint64_t v41;

  v3 = MEMORY[0x1E0C80A78](self, a2, a3);
  v41 = *MEMORY[0x1E0C80C00];
  v5 = objc_retainAutorelease(v4);
  v37 = v5;
  v6 = (char *)objc_msgSend(v5, "bytes");
  v7 = objc_msgSend(v5, "length");
  memset(__b, 170, sizeof(__b));
  v8 = *(_QWORD *)(v3 + 32);
  if (v8)
  {
    if (3 - v8 >= v7)
      v9 = v7;
    else
      v9 = 3 - v8;
    memmove((void *)(v3 + 40 + v8), v6, v9);
    v10 = *(_QWORD *)(v3 + 32) + v9;
    *(_QWORD *)(v3 + 32) = v10;
    v7 -= v9;
    if (v10 == 3)
    {
      v11 = *(unsigned __int8 *)(v3 + 40);
      v12 = *(unsigned __int8 *)(v3 + 41);
      v13 = *(_QWORD *)(v3 + 24);
      v14 = *(_QWORD *)(v3 + 56);
      v15 = *(unsigned __int8 *)(v3 + 42);
      __b[0] = *(_BYTE *)(v13 + (v11 >> 2));
      __b[1] = *(_BYTE *)(v13 + (((unint64_t)(v12 | (v11 << 8)) >> 4) & 0x3F));
      __b[2] = *(_BYTE *)(v13 + (((unint64_t)(v15 | (v12 << 8)) >> 6) & 0x3F));
      __b[3] = *(_BYTE *)(v13 + (v15 & 0x3F));
      if (v14 && (v16 = *(_QWORD *)(v3 + 48) + 4, *(_QWORD *)(v3 + 48) = v16, v17 = v16 - v14, v16 >= v14))
      {
        *(_QWORD *)(v3 + 48) = v17;
        memmove(&__b[v17 + 1], &__b[v17], v16 - v14);
        __b[-v17 + 4] = 10;
        v18 = 5;
      }
      else
      {
        v18 = 4;
      }
      *(_QWORD *)(v3 + 32) = 0;
    }
    else
    {
      v18 = 0;
    }
  }
  else
  {
    v18 = 0;
    v9 = 0;
  }
  v36 = v7;
  if (v7)
  {
    v35 = v7 % 3;
    v19 = v7 + v9 - v7 % 3;
    v34 = v7 + v9;
    if (v9 < v19)
    {
      v20 = (unsigned __int8 *)&v6[v19];
      v21 = (unsigned __int8 *)&v6[v9];
      do
      {
        v22 = &__b[v18];
        v23 = *v21;
        v24 = *(_QWORD *)(v3 + 24);
        v25 = v21[1];
        v26 = *(_QWORD *)(v3 + 56);
        v27 = v21[2];
        *v22 = *(_BYTE *)(v24 + (v23 >> 2));
        v22[1] = *(_BYTE *)(v24 + (((unint64_t)(v25 | (v23 << 8)) >> 4) & 0x3F));
        v22[2] = *(_BYTE *)(v24 + (((unint64_t)(v27 | (v25 << 8)) >> 6) & 0x3F));
        v22[3] = *(_BYTE *)(v24 + (v27 & 0x3F));
        if (v26)
        {
          v28 = *(_QWORD *)(v3 + 48) + 4;
          *(_QWORD *)(v3 + 48) = v28;
          v29 = v28 - v26;
          if (v28 >= v26)
          {
            *(_QWORD *)(v3 + 48) = v29;
            memmove(&v22[v29 + 1], &v22[v29], v28 - v26);
            v22[-v29 + 4] = 10;
            v30 = 5;
          }
          else
          {
            v30 = 4;
          }
          v5 = v37;
        }
        else
        {
          v30 = 4;
        }
        v18 += v30;
        if (v18 >> 3 >= 0xFFF)
        {
          v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", __b, v18, 0);
          v39.receiver = (id)v3;
          v39.super_class = (Class)MFBase64Encoder;
          -[MFBaseFilterDataConsumer appendData:](&v39, sel_appendData_, v31);

          v18 = 0;
        }
        v21 += 3;
      }
      while (v21 < v20);
    }
    *(_QWORD *)(v3 + 32) = v35;
    if (v35)
    {
      *(_WORD *)(v3 + 40) = 0;
      *(_BYTE *)(v3 + 42) = 0;
      memmove((void *)(v3 + 40), &v6[v34 - *(_QWORD *)(v3 + 32)], *(_QWORD *)(v3 + 32));
    }
  }
  if (v18)
  {
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", __b, v18, 0);
    v38.receiver = (id)v3;
    v38.super_class = (Class)MFBase64Encoder;
    -[MFBaseFilterDataConsumer appendData:](&v38, sel_appendData_, v32);

  }
  return v36;
}

- (void)done
{
  unint64_t left;
  const char *table;
  unint64_t v5;
  unint64_t lineBreak;
  uint64_t v7;
  unsigned __int8 *leftovers;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unsigned __int8 *v13;
  char v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  BOOL v20;
  void *v21;
  objc_super v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  memset(v23, 170, 11);
  left = self->_left;
  if (!left)
    return;
  if (left != 1)
  {
    if (left != 2)
    {
      v11 = 0;
      goto LABEL_20;
    }
    table = self->_table;
    LOBYTE(v23[0]) = table[(unint64_t)self->_leftovers[0] >> 2];
    if (self->_lineBreak)
    {
      v5 = self->_line + 1;
      self->_line = v5;
      lineBreak = self->_lineBreak;
      if (!(v5 % lineBreak))
      {
        BYTE1(v23[0]) = 10;
        v7 = 2;
        goto LABEL_13;
      }
    }
    else
    {
      lineBreak = 0;
    }
    v7 = 1;
LABEL_13:
    leftovers = &self->_leftovers[1];
    v10 = v7 + 1;
    *(_BYTE *)((unint64_t)v23 | v7) = table[((unint64_t)(self->_leftovers[1] | (self->_leftovers[0] << 8)) >> 4) & 0x3F];
    if (lineBreak)
    {
      v12 = self->_line + 1;
      self->_line = v12;
      if (!(v12 % self->_lineBreak))
      {
        *(_BYTE *)((unint64_t)v23 | v10) = 10;
        v10 = v7 + 2;
      }
    }
    v13 = &self->_leftovers[2];
    v14 = 6;
    goto LABEL_19;
  }
  table = self->_table;
  leftovers = self->_leftovers;
  LOBYTE(v23[0]) = table[(unint64_t)self->_leftovers[0] >> 2];
  if (self->_lineBreak && (v9 = self->_line + 1, self->_line = v9, !(v9 % self->_lineBreak)))
  {
    BYTE1(v23[0]) = 10;
    v10 = 2;
  }
  else
  {
    v10 = 1;
  }
  v13 = &self->_leftovers[1];
  v14 = 4;
LABEL_19:
  v15 = table[((*v13 | ((unint64_t)*leftovers << 8)) >> v14) & 0x3F];
  v11 = v10 + 1;
  *(_BYTE *)((unint64_t)v23 | v10) = v15;
LABEL_20:
  if (self->_padChar && (v16 = self->_left - 3, self->_left != 3))
  {
    v18 = self->_lineBreak;
    do
    {
      v17 = v11 + 1;
      *((_BYTE *)v23 + v11) = self->_padChar;
      if (v18)
      {
        v19 = self->_line + 1;
        self->_line = v19;
        v18 = self->_lineBreak;
        if (!(v19 % v18))
        {
          *((_BYTE *)v23 + v17) = 10;
          v17 = v11 + 2;
        }
      }
      v11 = v17;
      v20 = __CFADD__(v16++, 1);
    }
    while (!v20);
  }
  else
  {
    v17 = v11;
  }
  if (v17)
  {
    if (!self->_lineBreak
      || *((_BYTE *)v23 + v17 - 1) == 10
      || (*((_BYTE *)v23 + v17) = 10, v20 = __CFADD__(v17, 1), ++v17, !v20))
    {
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v23, v17, 0);
      v22.receiver = self;
      v22.super_class = (Class)MFBase64Encoder;
      -[MFBaseFilterDataConsumer appendData:](&v22, sel_appendData_, v21);

    }
  }
}

- (void)setAllowSlash:(BOOL)a3
{
  const char *v3;

  v3 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+,";
  if (a3)
    v3 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
  self->_table = v3;
}

- (BOOL)allowSlash
{
  return self->_table == "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
}

- (void)setStandardLineBreak
{
  -[MFBase64Encoder setLineBreak:](self, "setLineBreak:", 76);
}

- (unint64_t)lineBreak
{
  return self->_lineBreak;
}

- (void)setLineBreak:(unint64_t)a3
{
  self->_lineBreak = a3;
}

- (char)padChar
{
  return self->_padChar;
}

- (void)setPadChar:(char)a3
{
  self->_padChar = a3;
}

@end
