@implementation IFObjectHasher

- (id)combine:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "hash"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[IFObjectHasher combineContentsOfPropertyListObject:](self, "combineContentsOfPropertyListObject:", v5);

  return self;
}

- (id)combineContentsOfPropertyListObject:(id)a3
{
  IFCombinePropertyListObject(&self->_hasher, (const __CFString *)a3);
  return self;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0x400000002;
  strcpy((char *)self + 16, "uespemosmodnarodarenegylsetybdet");
  *((_BYTE *)self + 49) = 0;
  *((_WORD *)self + 25) = 0;
  *((_DWORD *)self + 13) = 0;
  return self;
}

- (unint64_t)finalize
{
  unint64_t v2;
  unint64_t value;
  unint64_t v4;
  int c;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int d;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;

  if (self->_finalized)
    return self->_hash;
  value = self->_hasher._buffer.value;
  v4 = self->_hasher._v3 ^ value;
  self->_hasher._v3 = v4;
  c = self->_hasher._c;
  if (c <= 0)
  {
    v6 = self->_hasher._v1;
    v8 = self->_hasher._v2;
    v7 = self->_hasher._v0;
  }
  else
  {
    v7 = self->_hasher._v0;
    v6 = self->_hasher._v1;
    v8 = self->_hasher._v2;
    do
    {
      v9 = v7 + v6;
      v10 = v9 ^ __ROR8__(v6, 51);
      v11 = v8 + v4;
      v12 = __ROR8__(v4, 48);
      v7 = (v11 ^ v12) + __ROR8__(v9, 32);
      v4 = v7 ^ __ROR8__(v11 ^ v12, 43);
      v13 = v11 + v10;
      v6 = v13 ^ __ROR8__(v10, 47);
      v8 = __ROR8__(v13, 32);
      --c;
    }
    while (c);
    self->_hasher._v1 = v6;
    self->_hasher._v3 = v4;
  }
  v14 = v7 ^ value;
  self->_hasher._v0 = v14;
  v15 = v8 ^ 0xFF;
  self->_hasher._v2 = v8 ^ 0xFF;
  d = self->_hasher._d;
  if (d >= 1)
  {
    do
    {
      v17 = v14 + v6;
      v18 = v17 ^ __ROR8__(v6, 51);
      v19 = v15 + v4;
      v20 = __ROR8__(v4, 48);
      v14 = (v19 ^ v20) + __ROR8__(v17, 32);
      v4 = v14 ^ __ROR8__(v19 ^ v20, 43);
      v21 = v19 + v18;
      v6 = v21 ^ __ROR8__(v18, 47);
      v15 = __ROR8__(v21, 32);
      --d;
    }
    while (d);
    self->_hasher._v0 = v14;
    self->_hasher._v1 = v6;
    self->_hasher._v2 = v15;
    self->_hasher._v3 = v4;
  }
  v2 = v6 ^ v4 ^ v14 ^ v15;
  self->_hash = v2;
  self->_finalized = 1;
  return v2;
}

- (id)combineBool:(BOOL)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[IFObjectHasher combineContentsOfPropertyListObject:](self, "combineContentsOfPropertyListObject:", v4);

  return self;
}

- (id)combineInteger:(unint64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[IFObjectHasher combineContentsOfPropertyListObject:](self, "combineContentsOfPropertyListObject:", v4);

  return self;
}

- (id)combineBytes:(void *)a3 size:(unint64_t)a4
{
  char *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if ((uint64_t)a4 >= 1)
  {
    v4 = (char *)a3 + a4;
    v5 = *((_QWORD *)self + 6);
    do
    {
      v6 = v4 - (_BYTE *)a3;
      if (v4 - (_BYTE *)a3 >= 8)
        v6 = 8;
      if (v6 > 7)
      {
        v7 = *(_QWORD *)a3;
      }
      else
      {
        v7 = 0;
        switch(v6)
        {
          case 1uLL:
            goto LABEL_13;
          case 2uLL:
            goto LABEL_12;
          case 3uLL:
            goto LABEL_11;
          case 4uLL:
            goto LABEL_10;
          case 5uLL:
            goto LABEL_9;
          case 6uLL:
            goto LABEL_8;
          case 7uLL:
            v7 = (unint64_t)*((unsigned __int8 *)a3 + 6) << 48;
LABEL_8:
            v7 |= (unint64_t)*((unsigned __int8 *)a3 + 5) << 40;
LABEL_9:
            v7 |= (unint64_t)*((unsigned __int8 *)a3 + 4) << 32;
LABEL_10:
            v7 |= (unint64_t)*((unsigned __int8 *)a3 + 3) << 24;
LABEL_11:
            v7 |= (unint64_t)*((unsigned __int8 *)a3 + 2) << 16;
LABEL_12:
            v7 |= (unint64_t)*((unsigned __int8 *)a3 + 1) << 8;
LABEL_13:
            v7 |= *(unsigned __int8 *)a3;
            break;
          default:
            break;
        }
      }
      v8 = HIBYTE(v5) & 7;
      v9 = 8 * v8;
      v10 = v8 + v6;
      if (v8 + v6 <= 7)
      {
        v5 = ((v7 << v9) | v5) + (v6 << 56);
        *((_QWORD *)self + 6) = v5;
      }
      else
      {
        v11 = (v7 << v9) | v5 & 0xFFFFFFFFFFFFFFLL;
        v12 = HIBYTE(v5) + v6;
        v13 = v7 >> -v9;
        if (v10 == 8)
          v13 = 0;
        v5 = v13 | (v12 << 56);
        v14 = *((_QWORD *)self + 5) ^ v11;
        *((_QWORD *)self + 5) = v14;
        *((_QWORD *)self + 6) = v5;
        v15 = *((_DWORD *)self + 2);
        v16 = *((_QWORD *)self + 2);
        if (v15 >= 1)
        {
          v17 = *((_QWORD *)self + 3);
          v18 = *((_QWORD *)self + 4);
          do
          {
            v19 = v16 + v17;
            v20 = v19 ^ __ROR8__(v17, 51);
            v21 = v18 + v14;
            v22 = __ROR8__(v14, 48);
            v16 = (v21 ^ v22) + __ROR8__(v19, 32);
            v14 = v16 ^ __ROR8__(v21 ^ v22, 43);
            v23 = v21 + v20;
            v17 = v23 ^ __ROR8__(v20, 47);
            v18 = __ROR8__(v23, 32);
            --v15;
          }
          while (v15);
          *((_QWORD *)self + 4) = v18;
          *((_QWORD *)self + 5) = v14;
          *((_QWORD *)self + 3) = v17;
        }
        *((_QWORD *)self + 2) = v16 ^ v11;
      }
      a3 = (char *)a3 + 8;
    }
    while (a3 < v4);
  }
  return self;
}

@end
