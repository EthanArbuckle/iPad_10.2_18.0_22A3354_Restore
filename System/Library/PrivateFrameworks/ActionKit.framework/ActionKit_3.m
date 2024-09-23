BIGNUM *BN_new(void)
{
  BIGNUM *v0;
  BIGNUM *v1;

  v0 = (BIGNUM *)malloc_type_calloc(1uLL, 0x18uLL, 0x1010040113C0ABBuLL);
  v1 = v0;
  if (v0)
    v0->flags = 1;
  else
    ERR_put_error(3, 4095, 65, "/Library/Caches/com.apple.xbs/Sources/Shortcuts/ShortcutsActions/ActionKit/External/libressl/libressl/crypto/bn/bn_lib.c", 77);
  return v1;
}

void BN_init(BIGNUM *a1)
{
  a1->d = 0;
  *(_QWORD *)&a1->top = 0;
  *(_QWORD *)&a1->neg = 0;
}

void BN_clear(BIGNUM *a)
{
  unint64_t *d;

  d = a->d;
  if (d)
    explicit_bzero(d, 8 * a->dmax);
  a->top = 0;
  a->neg = 0;
}

void BN_free(BIGNUM *a)
{
  int flags;

  if (a)
  {
    flags = a->flags;
    if ((flags & 2) == 0)
    {
      freezero(a->d, 8 * a->dmax);
      flags = a->flags;
    }
    if ((flags & 1) != 0)
      freezero(a, 0x18uLL);
    else
      explicit_bzero(a, 0x18uLL);
  }
}

uint64_t BN_get_flags(uint64_t a1, unsigned int a2)
{
  return *(_DWORD *)(a1 + 20) & a2;
}

uint64_t BN_set_flags(uint64_t result, int a2)
{
  *(_DWORD *)(result + 20) |= a2;
  return result;
}

__n128 BN_with_flags(__n128 *a1, __n128 *a2, int a3)
{
  __n128 result;
  unsigned int v4;

  result = *a2;
  v4 = a1[1].n128_u32[1] & 1 | a3 | a2[1].n128_u32[1] & 0xFFFFFFFC | 2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  a1[1].n128_u32[1] = v4;
  return result;
}

const BIGNUM *BN_value_one(void)
{
  return (const BIGNUM *)&bn_value_one;
}

uint64_t bn_word_clz(unint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  BOOL v4;
  int v5;
  int v6;

  v1 = 0;
  v2 = 64;
  v3 = 64;
  do
  {
    v3 += (v1 & (v2 >> 1)) - ((v2 >> 1) & ~v1);
    if (a1 >> v3)
      v1 = -1;
    else
      v1 = 0;
    v4 = v2 > 3;
    v2 >>= 1;
  }
  while (v4);
  v5 = v1 - v3;
  if (a1)
    v6 = 64;
  else
    v6 = 65;
  return (v6 + v5);
}

int BN_num_bits_word(unint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  BOOL v4;

  v1 = 0;
  v2 = 64;
  v3 = 64;
  do
  {
    v3 += (v1 & (v2 >> 1)) - ((v2 >> 1) & ~v1);
    if (a1 >> v3)
      v1 = -1;
    else
      v1 = 0;
    v4 = v2 > 3;
    v2 >>= 1;
  }
  while (v4);
  return v3 - v1 - (a1 == 0);
}

int BN_num_bits(const BIGNUM *a)
{
  int top;
  uint64_t v2;
  unint64_t *d;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  BOOL v11;

  top = a->top;
  if (top < 1)
    return 0;
  v2 = 0;
  d = a->d;
  v4 = a->top;
  do
  {
    v5 = *d++;
    v2 |= v5;
    --v4;
  }
  while (v4);
  if (!v2)
    return 0;
  v6 = 0;
  v7 = top - 1;
  v8 = a->d[v7];
  v9 = 64;
  v10 = 64;
  do
  {
    v10 += (v6 & (v9 >> 1)) - ((v9 >> 1) & ~v6);
    if (v8 >> v10)
      v6 = -1;
    else
      v6 = 0;
    v11 = v9 > 3;
    v9 >>= 1;
  }
  while (v11);
  return v10 - v6 - (v8 == 0) + (v7 << 6);
}

BOOL BN_is_zero(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;

  v1 = *(unsigned int *)(a1 + 8);
  if ((int)v1 < 1)
    return 1;
  v2 = 0;
  v3 = *(uint64_t **)a1;
  do
  {
    v4 = *v3++;
    v2 |= v4;
    --v1;
  }
  while (v1);
  return v2 == 0;
}

uint64_t *bn_correct_top(uint64_t *result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *((unsigned int *)result + 2);
  if ((int)v1 >= 1)
  {
    v2 = *result;
    do
    {
      v3 = v1 - 1;
      if (*(_QWORD *)(v2 + 8 * (v1 - 1)))
        break;
      *((_DWORD *)result + 2) = --v1;
    }
    while ((unint64_t)(v3 + 1) > 1);
  }
  return result;
}

uint64_t bn_expand(uint64_t a1, unsigned int a2)
{
  if (a2 <= 0x7FFFFFC0)
    return bn_wexpand(a1, (a2 + 63) >> 6);
  else
    return 0;
}

uint64_t bn_wexpand(uint64_t a1, size_t count)
{
  unsigned int v2;
  unint64_t v4;
  int v5;
  int v6;
  char *v8;

  if ((count & 0x80000000) != 0)
    return 0;
  v2 = count;
  v4 = *(int *)(a1 + 12);
  if ((int)v4 >= (int)v2)
    return 1;
  if (v2 < 0x800000)
  {
    if ((*(_BYTE *)(a1 + 20) & 2) != 0)
    {
      v5 = 105;
      v6 = 221;
      goto LABEL_12;
    }
    v8 = recallocarray(*(char **)a1, v4, v2, 8uLL);
    if (!v8)
    {
      v5 = 65;
      v6 = 227;
      goto LABEL_12;
    }
    *(_QWORD *)a1 = v8;
    *(_DWORD *)(a1 + 12) = v2;
    return 1;
  }
  v5 = 114;
  v6 = 217;
LABEL_12:
  ERR_put_error(3, 4095, v5, "/Library/Caches/com.apple.xbs/Sources/Shortcuts/ShortcutsActions/ActionKit/External/libressl/libressl/crypto/bn/bn_lib.c", v6);
  return 0;
}

BIGNUM *__cdecl BN_dup(const BIGNUM *a)
{
  BIGNUM *v2;
  BIGNUM *v3;

  if (!a)
    return 0;
  v2 = BN_new();
  v3 = v2;
  if (v2 && !BN_copy(v2, a))
  {
    BN_free(v3);
    return 0;
  }
  return v3;
}

BOOL bn_copy(BIGNUM *a1, const BIGNUM *a2)
{
  return BN_copy(a1, a2) != 0;
}

BIGNUM *__cdecl BN_copy(BIGNUM *a, const BIGNUM *b)
{
  BIGNUM *v2;
  int top;
  unint64_t *d;
  unint64_t *v6;
  unsigned int v7;
  unint64_t v8;
  int neg;
  int v10;

  v2 = a;
  if (a != b)
  {
    if (bn_wexpand((uint64_t)a, b->top))
    {
      top = b->top;
      if (top >= 1)
      {
        d = b->d;
        v6 = v2->d;
        v7 = top + 1;
        do
        {
          v8 = *d++;
          *v6++ = v8;
          --v7;
        }
        while (v7 > 1);
      }
      neg = b->neg;
      v10 = v2->flags | b->flags & 4;
      v2->top = top;
      v2->neg = neg;
      v2->flags = v10;
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

void BN_swap(BIGNUM *a, BIGNUM *b)
{
  int flags;
  unint64_t *d;
  int v4;
  int neg;
  uint64_t v6;
  uint64_t v7;

  flags = b->flags;
  d = a->d;
  neg = a->neg;
  v4 = a->flags;
  a->d = b->d;
  v6 = *(_QWORD *)&b->top;
  b->d = d;
  v7 = *(_QWORD *)&a->top;
  *(_QWORD *)&a->top = v6;
  a->neg = b->neg;
  *(_QWORD *)&b->top = v7;
  a->flags = flags & 2 | v4 & 1;
  b->neg = neg;
  b->flags = v4 & 2 | flags & 1;
}

unint64_t BN_get_word(const BIGNUM *a)
{
  int top;

  top = a->top;
  if (top > 1)
    return -1;
  if (top == 1)
    return *a->d;
  return 0;
}

int BN_set_word(BIGNUM *a, unint64_t w)
{
  int result;

  result = bn_wexpand((uint64_t)a, 1uLL);
  if (result)
  {
    a->neg = 0;
    *a->d = w;
    a->top = w != 0;
    return 1;
  }
  return result;
}

int BN_ucmp(const BIGNUM *a, const BIGNUM *b)
{
  uint64_t top;
  int v3;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  top = a->top;
  v3 = b->top;
  if ((int)top < v3)
    return -1;
  if ((int)top > v3)
    return 1;
  v5 = top - 1;
  do
  {
    if ((int)v5 + 1 < 1)
      return 0;
    v6 = a->d[v5];
    v7 = b->d[v5--];
  }
  while (v6 == v7);
  if (v6 > v7)
    return 1;
  else
    return -1;
}

int BN_cmp(const BIGNUM *a, const BIGNUM *b)
{
  int neg;
  int v3;
  uint64_t top;
  int v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  uint64_t v11;
  int v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;

  if (a && b)
  {
    neg = a->neg;
    v3 = b->neg - neg;
    if (!v3)
    {
      if (neg)
      {
        top = b->top;
        v5 = a->top;
        if ((int)top >= v5)
        {
          if ((int)top <= v5)
          {
            v6 = top - 1;
            while ((int)v6 + 1 >= 1)
            {
              v7 = b->d[v6];
              v8 = a->d[v6--];
              v9 = v7 > v8;
              if (v7 != v8)
                goto LABEL_22;
            }
            return 0;
          }
          return 1;
        }
      }
      else
      {
        v11 = a->top;
        v12 = b->top;
        if ((int)v11 >= v12)
        {
          if ((int)v11 <= v12)
          {
            v13 = v11 - 1;
            while ((int)v13 + 1 >= 1)
            {
              v14 = a->d[v13];
              v15 = b->d[v13--];
              v9 = v14 > v15;
              if (v14 != v15)
              {
LABEL_22:
                if (v9)
                  return 1;
                else
                  return -1;
              }
            }
            return 0;
          }
          return 1;
        }
      }
      return -1;
    }
  }
  else if (a)
  {
    return -1;
  }
  else
  {
    return b != 0;
  }
  return v3;
}

int BN_set_bit(BIGNUM *a, int n)
{
  char v2;
  signed int v4;
  int result;
  uint64_t top;

  if (n < 0)
    return 0;
  v2 = n;
  v4 = n >> 6;
  if (a->top <= (signed int)(n >> 6))
  {
    result = bn_wexpand((uint64_t)a, (v4 + 1));
    if (!result)
      return result;
    top = a->top;
    if (v4 >= (int)top)
      bzero(&a->d[top], 8 * (v4 - top) + 8);
    a->top = v4 + 1;
  }
  result = 1;
  a->d[v4] |= 1 << (v2 & 0x3F);
  return result;
}

int BN_clear_bit(BIGNUM *a, int n)
{
  uint64_t top;
  int v3;
  unint64_t *d;
  uint64_t v5;

  if (n < 0)
    return 0;
  top = a->top;
  if ((int)top <= (int)(n >> 6))
    return 0;
  v3 = 1;
  d = a->d;
  a->d[n >> 6] &= ~(1 << n);
  if ((int)top >= 1)
  {
    do
    {
      v5 = top - 1;
      if (d[(top - 1)])
        break;
      a->top = --top;
    }
    while ((unint64_t)(v5 + 1) > 1);
    return 1;
  }
  return v3;
}

int BN_is_bit_set(const BIGNUM *a, int n)
{
  uint64_t v2;

  if (n < 0 || a->top <= (signed int)(n >> 6))
    LODWORD(v2) = 0;
  else
    return (a->d[n >> 6] >> n) & 1;
  return v2;
}

int BN_mask_bits(BIGNUM *a, int n)
{
  unsigned int v2;
  unint64_t *d;
  uint64_t v5;
  unint64_t v6;

  if (n < 0)
    return 0;
  v2 = n >> 6;
  if ((signed int)(n >> 6) >= a->top)
    return 0;
  if ((n & 0x3F) != 0)
  {
    a->d[v2++] &= ~(-1 << (n & 0x3F));
    a->top = v2;
    goto LABEL_7;
  }
  a->top = v2;
  if (n >= 0x40)
  {
LABEL_7:
    d = a->d;
    v5 = v2 - 1;
    do
    {
      if (d[v5])
        break;
      a->top = v5;
      v6 = v5-- + 1;
    }
    while (v6 > 1);
  }
  return 1;
}

void BN_set_negative(BIGNUM *b, int n)
{
  uint64_t top;
  uint64_t v3;
  unint64_t *d;
  uint64_t v5;
  uint64_t v6;

  top = b->top;
  if ((int)top < 1)
  {
    LOBYTE(v6) = -2;
  }
  else
  {
    v3 = 0;
    d = b->d;
    do
    {
      v5 = *d++;
      v3 |= v5;
      --top;
    }
    while (top);
    v6 = ~(v3 == 0);
  }
  b->neg = v6 & (n != 0);
}

uint64_t BN_consttime_swap(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  unint64_t v4;
  int v5;
  int v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;

  if (a2 == a3)
    BN_consttime_swap_cold_1();
  if ((result & (result - 1)) != 0)
    BN_consttime_swap_cold_2();
  v4 = ((unint64_t)(result - 1) >> 63) - 1;
  v5 = *(_DWORD *)(a2 + 8);
  v6 = (*(_DWORD *)(a3 + 8) ^ v5) & v4;
  *(_DWORD *)(a2 + 8) = v6 ^ v5;
  *(_DWORD *)(a3 + 8) ^= v6;
  switch(a4)
  {
    case 1:
      v7 = *(_QWORD **)a2;
      v8 = *(_QWORD **)a3;
      goto LABEL_27;
    case 2:
      v7 = *(_QWORD **)a2;
      v8 = *(_QWORD **)a3;
      goto LABEL_26;
    case 3:
      v7 = *(_QWORD **)a2;
      v8 = *(_QWORD **)a3;
      goto LABEL_25;
    case 4:
      v7 = *(_QWORD **)a2;
      v8 = *(_QWORD **)a3;
      goto LABEL_24;
    case 5:
      v7 = *(_QWORD **)a2;
      v8 = *(_QWORD **)a3;
      goto LABEL_23;
    case 6:
      v7 = *(_QWORD **)a2;
      v8 = *(_QWORD **)a3;
      goto LABEL_22;
    case 7:
      v7 = *(_QWORD **)a2;
      v8 = *(_QWORD **)a3;
      goto LABEL_21;
    case 8:
      v7 = *(_QWORD **)a2;
      v8 = *(_QWORD **)a3;
      goto LABEL_20;
    case 9:
      v7 = *(_QWORD **)a2;
      v8 = *(_QWORD **)a3;
      goto LABEL_19;
    case 10:
      v7 = *(_QWORD **)a2;
      v8 = *(_QWORD **)a3;
      goto LABEL_18;
    default:
      v7 = *(_QWORD **)a2;
      v8 = *(_QWORD **)a3;
      if (a4 >= 11)
      {
        v9 = 10;
        do
        {
          v10 = v7[v9];
          v11 = (v8[v9] ^ v10) & v4;
          v7[v9] = v11 ^ v10;
          v8[v9++] ^= v11;
        }
        while (a4 != v9);
      }
LABEL_18:
      v12 = v7[9];
      v13 = (v8[9] ^ v12) & v4;
      v7[9] = v13 ^ v12;
      v8[9] ^= v13;
LABEL_19:
      v14 = v7[8];
      v15 = (v8[8] ^ v14) & v4;
      v7[8] = v15 ^ v14;
      v8[8] ^= v15;
LABEL_20:
      v16 = v7[7];
      v17 = (v8[7] ^ v16) & v4;
      v7[7] = v17 ^ v16;
      v8[7] ^= v17;
LABEL_21:
      v18 = v7[6];
      v19 = (v8[6] ^ v18) & v4;
      v7[6] = v19 ^ v18;
      v8[6] ^= v19;
LABEL_22:
      v20 = v7[5];
      v21 = (v8[5] ^ v20) & v4;
      v7[5] = v21 ^ v20;
      v8[5] ^= v21;
LABEL_23:
      v22 = v7[4];
      v23 = (v8[4] ^ v22) & v4;
      v7[4] = v23 ^ v22;
      v8[4] ^= v23;
LABEL_24:
      v24 = v7[3];
      v25 = (v8[3] ^ v24) & v4;
      v7[3] = v25 ^ v24;
      v8[3] ^= v25;
LABEL_25:
      v26 = v7[2];
      v27 = (v8[2] ^ v26) & v4;
      v7[2] = v27 ^ v26;
      v8[2] ^= v27;
LABEL_26:
      v28 = v7[1];
      v29 = (v8[1] ^ v28) & v4;
      v7[1] = v29 ^ v28;
      v8[1] ^= v29;
LABEL_27:
      v30 = (*v8 ^ *v7) & v4;
      *v7 ^= v30;
      *v8 ^= v30;
      return result;
  }
}

uint64_t BN_swap_ct(uint64_t a1, uint64_t a2, uint64_t a3, size_t count)
{
  size_t v4;
  uint64_t result;
  int v9;
  int v10;
  unint64_t v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  _QWORD *v18;
  _QWORD *v19;
  unint64_t v20;

  if (a2 == a3)
    return 1;
  v4 = count;
  if (count >> 31)
    return 0;
  result = bn_wexpand(a2, count);
  if ((_DWORD)result)
  {
    result = bn_wexpand(a3, v4);
    if ((_DWORD)result)
    {
      v9 = *(_DWORD *)(a2 + 8);
      if (v9 > (int)v4 || (v10 = *(_DWORD *)(a3 + 8), v10 > (int)v4))
      {
        ERR_put_error(3, 4095, 106, "/Library/Caches/com.apple.xbs/Sources/Shortcuts/ShortcutsActions/ActionKit/External/libressl/libressl/crypto/bn/bn_lib.c", 565);
        return 0;
      }
      v11 = (((a1 - 1) & (unint64_t)~a1) >> 63) - 1;
      v12 = (v10 ^ v9) & v11;
      *(_DWORD *)(a2 + 8) = v12 ^ v9;
      *(_DWORD *)(a3 + 8) ^= v12;
      v13 = *(_DWORD *)(a2 + 16);
      v14 = *(_DWORD *)(a2 + 20);
      v15 = (*(_DWORD *)(a3 + 16) ^ v13) & v11;
      v16 = v11 & (*(_DWORD *)(a3 + 20) ^ v14) & 4;
      *(_DWORD *)(a2 + 16) = v15 ^ v13;
      *(_DWORD *)(a2 + 20) = v16 ^ v14;
      v17 = v16 ^ *(_DWORD *)(a3 + 20);
      *(_DWORD *)(a3 + 16) ^= v15;
      *(_DWORD *)(a3 + 20) = v17;
      if ((_DWORD)v4)
      {
        v18 = *(_QWORD **)a2;
        v19 = *(_QWORD **)a3;
        result = 1;
        do
        {
          v20 = (*v19 ^ *v18) & v11;
          *v18++ ^= v20;
          *v19++ ^= v20;
          --v4;
        }
        while (v4);
      }
      else
      {
        return 1;
      }
    }
  }
  return result;
}

uint64_t BN_zero(uint64_t result)
{
  *(_DWORD *)(result + 16) = 0;
  *(_DWORD *)(result + 8) = 0;
  return result;
}

uint64_t BN_one(uint64_t a1)
{
  uint64_t v2;

  v2 = 1;
  if (!bn_wexpand(a1, 1uLL))
    return 0;
  *(_DWORD *)(a1 + 16) = 0;
  **(_QWORD **)a1 = 1;
  *(_DWORD *)(a1 + 8) = 1;
  return v2;
}

uint64_t BN_abs_is_word(uint64_t a1, uint64_t a2)
{
  int v2;
  _BOOL4 v4;

  v2 = *(_DWORD *)(a1 + 8);
  if (v2 == 1 && **(_QWORD **)a1 == a2)
    return 1;
  v4 = v2 == 0;
  return !a2 && v4;
}

BOOL BN_is_one(uint64_t a1)
{
  return *(_DWORD *)(a1 + 8) == 1 && **(_QWORD **)a1 == 1 && *(_DWORD *)(a1 + 16) == 0;
}

BOOL BN_is_word(uint64_t a1, uint64_t a2)
{
  int v2;

  v2 = *(_DWORD *)(a1 + 8);
  if (v2 == 1 && **(_QWORD **)a1 == a2)
  {
    if (!a2)
      return 1;
    return *(_DWORD *)(a1 + 16) == 0;
  }
  else
  {
    return !a2 && v2 == 0;
  }
}

uint64_t BN_is_odd(uint64_t a1)
{
  if (*(int *)(a1 + 8) < 1)
    return 0;
  else
    return **(_DWORD **)a1 & 1;
}

BOOL BN_is_negative(uint64_t a1)
{
  return *(_DWORD *)(a1 + 16) != 0;
}

char *BN_options(void)
{
  if ((BN_options_init & 1) == 0)
  {
    BN_options_init = 1;
    snprintf(BN_options_data, 0x10uLL, "bn(%d,%d)", 64, 64);
  }
  return BN_options_data;
}

uint64_t BN_security_bits(int a1, int a2)
{
  uint64_t result;

  if (a1 <= 15359)
  {
    if (a1 <= 7679)
    {
      if (a1 <= 3071)
      {
        if (a1 <= 2047)
        {
          if (a1 < 1024)
            return 0;
          result = 80;
        }
        else
        {
          result = 112;
        }
      }
      else
      {
        result = 128;
      }
    }
    else
    {
      result = 192;
    }
  }
  else
  {
    result = 256;
  }
  if (a2 == -1)
    return result;
  if (a2 < 160)
    return 0;
  if ((int)(a2 >> 1) >= (int)result)
    return result;
  else
    return a2 >> 1;
}

void *BN_GENCB_new()
{
  return malloc_type_calloc(1uLL, 0x18uLL, 0x1080040C4643742uLL);
}

void BN_GENCB_free(void *a1)
{
  if (a1)
    free(a1);
}

uint64_t BN_GENCB_set_old(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)result = 1;
  *(_QWORD *)(result + 8) = a3;
  *(_QWORD *)(result + 16) = a2;
  return result;
}

uint64_t BN_GENCB_set(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)result = 2;
  *(_QWORD *)(result + 8) = a3;
  *(_QWORD *)(result + 16) = a2;
  return result;
}

uint64_t BN_GENCB_get_arg(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

void BN_consttime_swap_cold_1()
{
  __assert_rtn("BN_consttime_swap", "bn_lib.c", 508, "a != b");
}

void BN_consttime_swap_cold_2()
{
  __assert_rtn("BN_consttime_swap", "bn_lib.c", 509, "(condition & (condition - 1)) == 0");
}

int EVP_VerifyFinal(EVP_MD_CTX *ctx, const unsigned __int8 *sigbuf, unsigned int siglen, EVP_PKEY *pkey)
{
  uint64_t *v6;
  uint64_t *v7;
  int v8;
  EVP_MD_CTX v10;
  __int128 v11;
  unsigned int s;
  unsigned __int8 md[64];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  s = 0;
  v11 = 0u;
  memset(&v10, 0, sizeof(v10));
  EVP_MD_CTX_init(&v10);
  if (EVP_MD_CTX_copy_ex(&v10, ctx) && EVP_DigestFinal_ex(&v10, md, &s))
  {
    EVP_MD_CTX_cleanup(&v10);
    v6 = (uint64_t *)EVP_PKEY_CTX_new((uint64_t)pkey, 0);
    v7 = v6;
    if (v6 && (int)EVP_PKEY_verify_init(v6) >= 1)
    {
      v8 = -1;
      if ((int)EVP_PKEY_CTX_ctrl(v7, -1, 248) >= 1)
        v8 = EVP_PKEY_verify(v7);
    }
    else
    {
      v8 = -1;
    }
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }
  EVP_PKEY_CTX_free((EVP_PKEY **)v7);
  return v8;
}

void ASN1_add_oid_module(void)
{
  CONF_module_add("oid_section", (conf_init_func *)oid_module_init, (conf_finish_func *)oid_module_finish);
}

uint64_t oid_module_init(const CONF_IMODULE *a1, const CONF *a2)
{
  const char *value;
  STACK *section;
  const STACK *v5;
  int v6;
  uint64_t v7;
  char *v8;
  const char *v9;
  char *v10;
  char *v11;
  char *v12;
  unsigned __int8 v13;
  const char *v14;
  unsigned __int8 v15;
  int v16;
  int v17;
  size_t v18;
  char *v19;
  size_t v20;
  uint64_t v21;
  int v22;
  int v23;
  uint64_t v24;
  char *v25;
  const char *v26;
  int v28;
  int v29;

  value = CONF_imodule_get_value(a1);
  section = NCONF_get_section(a2, value);
  if (!section)
  {
    v28 = 172;
    v29 = 84;
    goto LABEL_32;
  }
  v5 = section;
  if (sk_num(section) < 1)
    return 1;
  v6 = 0;
  v7 = MEMORY[0x24BDAC740];
LABEL_4:
  v8 = sk_value(v5, v6);
  v9 = (const char *)*((_QWORD *)v8 + 1);
  v10 = (char *)*((_QWORD *)v8 + 2);
  v11 = strrchr(v10, 44);
  if (v11)
  {
    v12 = v11;
    v14 = v11 + 1;
    v13 = v11[1];
    if (!v13)
      goto LABEL_31;
    if (v11[1] < 0)
      goto LABEL_9;
    while ((*(_DWORD *)(v7 + 4 * v13 + 60) & 0x4000) != 0)
    {
      while (1)
      {
        v15 = *++v14;
        v13 = v15;
        if ((v15 & 0x80) == 0)
          break;
LABEL_9:
        if (!__maskrune(v13, 0x4000uLL))
          goto LABEL_12;
      }
    }
LABEL_12:
    v16 = OBJ_create(v14, v9, 0);
    if (!v16)
      goto LABEL_31;
    v17 = v16;
    v18 = v12 - v10;
    do
    {
      v19 = v10;
      v20 = v18;
      v21 = *v10;
      if (*v10 < 0)
        v22 = __maskrune(v21, 0x4000uLL);
      else
        v22 = *(_DWORD *)(v7 + 4 * v21 + 60) & 0x4000;
      ++v10;
      v18 = v20 - 1;
    }
    while (v22);
    while (1)
    {
      v23 = *--v12;
      v24 = v23;
      if (v23 < 0)
      {
        if (!__maskrune(v24, 0x4000uLL))
        {
LABEL_26:
          v25 = (char *)malloc_type_malloc(v20 + 1, 0xADD47970uLL);
          if (!v25)
            goto LABEL_31;
          v26 = v25;
          memcpy(v25, v19, v20);
          v26[v20] = 0;
          OBJ_nid2obj(v17)->ln = v26;
LABEL_28:
          if (++v6 >= sk_num(v5))
            return 1;
          goto LABEL_4;
        }
      }
      else if ((*(_DWORD *)(v7 + 4 * v24 + 60) & 0x4000) == 0)
      {
        goto LABEL_26;
      }
      --v20;
      if (v12 == v19)
        goto LABEL_31;
    }
  }
  if (OBJ_create(v10, v9, v9))
    goto LABEL_28;
LABEL_31:
  v28 = 171;
  v29 = 90;
LABEL_32:
  ERR_put_error(13, 4095, v28, "/Library/Caches/com.apple.xbs/Sources/Shortcuts/ShortcutsActions/ActionKit/External/libressl/libressl/crypto/asn1/asn_moid.c", v29);
  return 0;
}

ASN1_VALUE *cms_DigestedData_create(const EVP_MD *a1)
{
  ASN1_VALUE *v2;
  ASN1_VALUE *v3;
  ASN1_VALUE *v4;
  ASN1_OBJECT *v5;
  X509_ALGOR *v6;

  v2 = CMS_ContentInfo_new();
  if (v2)
  {
    v3 = ASN1_item_new(&CMS_DigestedData_it);
    if (v3)
    {
      v4 = v3;
      *(_QWORD *)v2 = OBJ_nid2obj(25);
      *((_QWORD *)v2 + 1) = v4;
      *(_QWORD *)v4 = 0;
      v5 = OBJ_nid2obj(21);
      v6 = (X509_ALGOR *)*((_QWORD *)v4 + 1);
      **((_QWORD **)v4 + 2) = v5;
      X509_ALGOR_set_md(v6, a1);
    }
    else
    {
      CMS_ContentInfo_free(v2);
      return 0;
    }
  }
  return v2;
}

BIO *cms_DigestedData_init_bio(uint64_t a1)
{
  return cms_DigestAlgorithm_init_bio(*(X509_ALGOR **)(*(_QWORD *)(a1 + 8) + 8));
}

BOOL cms_DigestedData_do_final(uint64_t a1, BIO *a2, int a3)
{
  EVP_MD_CTX *v6;
  EVP_MD_CTX *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  _BOOL8 v12;
  unsigned int s;
  unsigned __int8 md[64];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = (EVP_MD_CTX *)EVP_MD_CTX_new();
  v7 = v6;
  s = 0;
  if (v6)
  {
    v8 = *(_QWORD *)(a1 + 8);
    if (!cms_DigestAlgorithm_find_ctx(v6, a2, *(X509_ALGOR **)(v8 + 8))
      || EVP_DigestFinal_ex(v7, md, &s) < 1)
    {
      goto LABEL_10;
    }
    if (!a3)
    {
      v12 = ASN1_STRING_set(*(ASN1_STRING **)(v8 + 24), md, s) != 0;
      goto LABEL_11;
    }
    v9 = *(_QWORD *)(v8 + 24);
    if (s == *(_DWORD *)v9)
    {
      if (!memcmp(md, *(const void **)(v9 + 8), s))
      {
        v12 = 1;
        goto LABEL_11;
      }
      v10 = 158;
      v11 = 137;
    }
    else
    {
      v10 = 121;
      v11 = 132;
    }
  }
  else
  {
    v10 = 65;
    v11 = 118;
  }
  ERR_put_error(46, 4095, v10, "/Library/Caches/com.apple.xbs/Sources/Shortcuts/ShortcutsActions/ActionKit/External/libressl/libressl/crypto/cms/cms_dd.c", v11);
LABEL_10:
  v12 = 0;
LABEL_11:
  EVP_MD_CTX_free(v7);
  return v12;
}

_QWORD *CBS_init(_QWORD *result, uint64_t a2, uint64_t a3)
{
  *result = a2;
  result[1] = a3;
  result[2] = a3;
  return result;
}

_QWORD *CBS_dup(_QWORD *result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = result[2];
  a2[1] = v2;
  a2[2] = v2;
  v3 = result[1];
  *a2 = *result;
  a2[1] = v3;
  return result;
}

uint64_t CBS_data(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t CBS_len(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

uint64_t CBS_offset(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8) - *(_QWORD *)(a1 + 16);
}

uint64_t CBS_skip(_QWORD *a1, unint64_t a2)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;

  v2 = a1[2];
  v3 = v2 >= a2;
  v4 = v2 - a2;
  if (!v3)
    return 0;
  *a1 += a2;
  a1[2] = v4;
  return 1;
}

uint64_t CBS_stow(uint64_t a1, void **a2, _QWORD *a3)
{
  size_t v6;
  uint64_t result;

  free(*a2);
  *a2 = 0;
  *a3 = 0;
  v6 = *(_QWORD *)(a1 + 16);
  if (v6)
  {
    result = (uint64_t)malloc_type_malloc(v6, 0x62F484EBuLL);
    *a2 = (void *)result;
    if (!result)
      return result;
    memcpy((void *)result, *(const void **)a1, *(_QWORD *)(a1 + 16));
    *a3 = *(_QWORD *)(a1 + 16);
  }
  return 1;
}

BOOL CBS_strdup(uint64_t a1, void **a2)
{
  void *v4;
  size_t v5;
  void *v6;
  _BOOL8 result;
  char *v8;

  free(*a2);
  *a2 = 0;
  v4 = *(void **)a1;
  v5 = *(_QWORD *)(a1 + 16);
  v6 = memchr(v4, 0, v5);
  result = 0;
  if (!v6)
  {
    v8 = strndup((const char *)v4, v5);
    *a2 = v8;
    return v8 != 0;
  }
  return result;
}

BOOL CBS_contains_zero_byte(uint64_t a1)
{
  return memchr(*(void **)a1, 0, *(_QWORD *)(a1 + 16)) != 0;
}

uint64_t CBS_write_bytes(uint64_t a1, void *__dst, size_t a3, _QWORD *a4)
{
  size_t v5;

  v5 = *(_QWORD *)(a1 + 16);
  if (v5 > a3)
    return 0;
  memmove(__dst, *(const void **)a1, v5);
  if (a4)
    *a4 = *(_QWORD *)(a1 + 16);
  return 1;
}

BOOL CBS_mem_equal(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  return *(_QWORD *)(a1 + 16) == a3 && timingsafe_memcmp(*(unsigned __int8 **)a1, a2, a3) == 0;
}

uint64_t CBS_get_u8(_QWORD *a1, _BYTE *a2)
{
  uint64_t v2;
  _BYTE *v3;

  v2 = a1[2];
  if (!v2)
    return 0;
  v3 = (_BYTE *)(*a1)++;
  a1[2] = v2 - 1;
  *a2 = *v3;
  return 1;
}

uint64_t CBS_get_u16(unsigned __int16 **a1, _WORD *a2)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;
  unsigned __int16 *v6;

  v2 = (unint64_t)a1[2];
  v3 = v2 >= 2;
  v4 = v2 - 2;
  if (!v3)
    return 0;
  v6 = (*a1)++;
  a1[2] = (unsigned __int16 *)v4;
  *a2 = bswap32(*v6) >> 16;
  return 1;
}

uint64_t CBS_get_u24(uint64_t *a1, int *a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v5;
  int v6;
  uint64_t v7;

  v2 = a1[2];
  v3 = v2 - 3;
  if (v2 < 3)
    return 0;
  v5 = 0;
  v6 = 0;
  v7 = *a1;
  *a1 += 3;
  a1[2] = v3;
  do
    v6 = *(unsigned __int8 *)(v7 + v5++) | (v6 << 8);
  while (v5 != 3);
  *a2 = v6;
  return 1;
}

uint64_t CBS_get_u32(uint64_t *a1, int *a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v5;
  int v6;
  uint64_t v7;

  v2 = a1[2];
  v3 = v2 - 4;
  if (v2 < 4)
    return 0;
  v5 = 0;
  v6 = 0;
  v7 = *a1;
  *a1 += 4;
  a1[2] = v3;
  do
    v6 = *(unsigned __int8 *)(v7 + v5++) | (v6 << 8);
  while (v5 != 4);
  *a2 = v6;
  return 1;
}

uint64_t CBS_get_u64(uint64_t *a1, uint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = a1[2];
  v3 = v2 - 8;
  if (v2 < 8)
    return 0;
  v5 = 0;
  LODWORD(v6) = 0;
  v7 = *a1;
  v8 = *a1 + 4;
  *a1 = v8;
  a1[2] = v2 - 4;
  do
    v6 = *(unsigned __int8 *)(v7 + v5++) | ((_DWORD)v6 << 8);
  while (v5 != 4);
  v9 = 0;
  LODWORD(v10) = 0;
  *a1 = v7 + 8;
  a1[2] = v3;
  do
    v10 = *(unsigned __int8 *)(v8 + v9++) | ((_DWORD)v10 << 8);
  while (v9 != 4);
  *a2 = v10 | (v6 << 32);
  return 1;
}

uint64_t CBS_get_last_u8(_QWORD *a1, _BYTE *a2)
{
  uint64_t v2;

  v2 = a1[2];
  if (!v2)
    return 0;
  *a2 = *(_BYTE *)(v2 + *a1 - 1);
  --a1[2];
  return 1;
}

uint64_t CBS_get_bytes(uint64_t *a1, _QWORD *a2, unint64_t a3)
{
  unint64_t v3;
  BOOL v4;
  unint64_t v5;
  uint64_t v7;

  v3 = a1[2];
  v4 = v3 >= a3;
  v5 = v3 - a3;
  if (!v4)
    return 0;
  v7 = *a1;
  *a1 += a3;
  a1[2] = v5;
  *a2 = v7;
  a2[1] = a3;
  a2[2] = a3;
  return 1;
}

uint64_t CBS_get_u8_length_prefixed(unsigned __int8 **a1, unint64_t *a2)
{
  return cbs_get_length_prefixed(a1, a2, 1uLL);
}

uint64_t cbs_get_length_prefixed(unsigned __int8 **a1, unint64_t *a2, unint64_t a3)
{
  unint64_t v3;
  BOOL v4;
  unint64_t v5;
  unsigned __int8 *v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int v9;
  uint64_t result;

  v3 = (unint64_t)a1[2];
  v4 = v3 >= a3;
  v5 = v3 - a3;
  if (!v4)
    return 0;
  v6 = *a1;
  v7 = (unint64_t)&(*a1)[a3];
  *a1 = (unsigned __int8 *)v7;
  a1[2] = (unsigned __int8 *)v5;
  if (a3)
  {
    LODWORD(v8) = 0;
    do
    {
      v9 = *v6++;
      v8 = v9 | ((_DWORD)v8 << 8);
      --a3;
    }
    while (a3);
    if (v5 < v8)
      return 0;
  }
  else
  {
    v8 = 0;
  }
  *a1 = (unsigned __int8 *)(v7 + v8);
  a1[2] = (unsigned __int8 *)(v5 - v8);
  *a2 = v7;
  a2[1] = v8;
  result = 1;
  a2[2] = v8;
  return result;
}

uint64_t CBS_get_u16_length_prefixed(unsigned __int8 **a1, unint64_t *a2)
{
  return cbs_get_length_prefixed(a1, a2, 2uLL);
}

uint64_t CBS_get_u24_length_prefixed(unsigned __int8 **a1, unint64_t *a2)
{
  return cbs_get_length_prefixed(a1, a2, 3uLL);
}

uint64_t CBS_peek_u8(uint64_t a1, _BYTE *a2)
{
  if (!*(_QWORD *)(a1 + 16))
    return 0;
  *a2 = **(_BYTE **)a1;
  return 1;
}

uint64_t CBS_peek_u16(unsigned __int16 **a1, _WORD *a2)
{
  if ((unint64_t)a1[2] < 2)
    return 0;
  *a2 = bswap32(**a1) >> 16;
  return 1;
}

uint64_t CBS_peek_u24(_QWORD *a1, int *a2)
{
  uint64_t v3;
  int v4;

  if (a1[2] < 3uLL)
    return 0;
  v3 = 0;
  v4 = 0;
  do
    v4 = *(unsigned __int8 *)(*a1 + v3++) | (v4 << 8);
  while (v3 != 3);
  *a2 = v4;
  return 1;
}

uint64_t CBS_peek_u32(_QWORD *a1, int *a2)
{
  uint64_t v3;
  int v4;

  if (a1[2] < 4uLL)
    return 0;
  v3 = 0;
  v4 = 0;
  do
    v4 = *(unsigned __int8 *)(*a1 + v3++) | (v4 << 8);
  while (v3 != 4);
  *a2 = v4;
  return 1;
}

uint64_t CBS_peek_last_u8(_QWORD *a1, _BYTE *a2)
{
  uint64_t v2;

  v2 = a1[2];
  if (!v2)
    return 0;
  *a2 = *(_BYTE *)(v2 + *a1 - 1);
  return 1;
}

uint64_t CBS_get_any_asn1_element(unsigned __int8 **a1, _QWORD *a2, _DWORD *a3, uint64_t *a4)
{
  return cbs_get_any_asn1_element_internal(a1, a2, a3, a4, 1);
}

uint64_t cbs_get_any_asn1_element_internal(unsigned __int8 **a1, _QWORD *a2, _DWORD *a3, uint64_t *a4, int a5)
{
  unint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unsigned __int8 *v11;
  unsigned __int8 *v12;
  unint64_t v13;
  unsigned __int8 *v14;
  unint64_t v15;
  BOOL v16;
  unsigned int v17;
  unint64_t v18;
  int v19;

  v5 = (unint64_t)a1[2];
  if (v5 < 2)
    return 0;
  v6 = (uint64_t)*a1;
  v7 = **a1;
  if ((~v7 & 0x1F) == 0)
    return 0;
  v8 = *(unsigned __int8 *)(v6 + 1);
  if (a3)
    *a3 = v7;
  if ((v8 & 0x80) == 0)
  {
    v9 = v8 + 2;
    if (!a4)
      goto LABEL_9;
    v10 = 2;
    goto LABEL_8;
  }
  v13 = v8 & 0x7F;
  if ((_DWORD)v13 == 127)
    return 0;
  v14 = (unsigned __int8 *)(v6 + 2);
  if ((_DWORD)v13)
  {
    v15 = v5 - 2;
    v16 = (v13 - 5) >= 0xFFFFFFFC && v15 >= v13;
    if (!v16)
      return 0;
    v17 = 0;
    v18 = v13;
    do
    {
      v19 = *v14++;
      v17 = v19 | (v17 << 8);
      --v18;
    }
    while (v18);
    if (v17 < 0x80 || !(v17 >> (8 * v13 - 8)))
      return 0;
    v10 = v13 + 2;
    v9 = v10 + v17;
    if (!a4)
    {
LABEL_9:
      v11 = a1[2];
      v16 = (unint64_t)v11 >= v9;
      v12 = &v11[-v9];
      if (!v16)
        return 0;
      *a1 = (unsigned __int8 *)(v6 + v9);
      a1[2] = v12;
      if (a2)
        goto LABEL_12;
      return 1;
    }
LABEL_8:
    *a4 = v10;
    goto LABEL_9;
  }
  if (!a5 && (v7 & 0x20) != 0)
  {
    if (a4)
    {
      *a4 = 2;
      v5 = (unint64_t)a1[2];
      if (v5 < 2)
        return 0;
    }
    *a1 = v14;
    a1[2] = (unsigned __int8 *)(v5 - 2);
    if (a2)
    {
      v9 = 2;
LABEL_12:
      *a2 = v6;
      a2[1] = v9;
      v13 = 1;
      a2[2] = v9;
      return v13;
    }
    return 1;
  }
  return v13;
}

uint64_t CBS_get_asn1(unsigned __int8 **a1, _QWORD *a2, int a3)
{
  return cbs_get_asn1(a1, a2, a3, 1);
}

uint64_t cbs_get_asn1(unsigned __int8 **a1, _QWORD *a2, int a3, int a4)
{
  _QWORD *v7;
  int any_asn1_element_internal;
  uint64_t result;
  BOOL v10;
  _QWORD *v11;
  unint64_t v12;
  BOOL v13;
  unint64_t v14;
  _QWORD v15[3];
  int v16;
  unint64_t v17;

  v17 = 0;
  v16 = 0;
  memset(v15, 0, sizeof(v15));
  if (a2)
    v7 = a2;
  else
    v7 = v15;
  any_asn1_element_internal = cbs_get_any_asn1_element_internal(a1, v7, &v16, (uint64_t *)&v17, 1);
  result = 0;
  if (any_asn1_element_internal)
    v10 = v16 == a3;
  else
    v10 = 0;
  if (v10)
  {
    if (a4)
    {
      v11 = v15;
      if (a2)
        v11 = a2;
      v12 = v11[2];
      v13 = v12 >= v17;
      v14 = v12 - v17;
      if (!v13)
        return 0;
      *v7 += v17;
      v11[2] = v14;
    }
    return 1;
  }
  return result;
}

uint64_t CBS_get_asn1_element(unsigned __int8 **a1, _QWORD *a2, int a3)
{
  return cbs_get_asn1(a1, a2, a3, 0);
}

BOOL CBS_peek_asn1_tag(unsigned __int8 **a1, int a2)
{
  return (~a2 & 0x1F) != 0 && a1[2] != 0 && **a1 == a2;
}

uint64_t CBS_get_asn1_uint64(unsigned __int8 **a1, unint64_t *a2)
{
  uint64_t result;
  unint64_t v4;
  unsigned __int8 *v5;
  unint64_t v6;
  unsigned __int8 v7;
  _QWORD v8[2];
  unint64_t v9;

  v8[0] = 0;
  v8[1] = 0;
  v9 = 0;
  result = cbs_get_asn1(a1, v8, 2, 1);
  if ((_DWORD)result)
  {
    *a2 = 0;
    v4 = v9;
    if (v9)
    {
      v5 = (unsigned __int8 *)v8[0];
      if ((*(char *)v8[0] & 0x80000000) == 0 && (v9 < 2 || *(_BYTE *)v8[0] || *(char *)(v8[0] + 1) < 0))
      {
        v6 = 0;
        while (!HIBYTE(v6))
        {
          *a2 = v6 << 8;
          v7 = *v5++;
          *a2 = v7 | (v6 << 8);
          v6 = v7 | (v6 << 8);
          if (!--v4)
            return 1;
        }
      }
    }
    return 0;
  }
  return result;
}

uint64_t CBS_get_optional_asn1(unsigned __int8 **a1, _QWORD *a2, int *a3, int a4)
{
  BOOL v5;
  int v6;
  uint64_t result;

  v5 = (~a4 & 0x1F) == 0 || a1[2] == 0;
  if (v5 || **a1 != a4)
  {
    v6 = 0;
    goto LABEL_9;
  }
  v6 = 1;
  result = cbs_get_asn1(a1, a2, a4, 1);
  if ((_DWORD)result)
  {
LABEL_9:
    *a3 = v6;
    return 1;
  }
  return result;
}

uint64_t CBS_get_optional_asn1_octet_string(unsigned __int8 **a1, _QWORD *a2, int *a3, int a4)
{
  uint64_t result;
  int v7;
  int asn1;
  int v9;
  unsigned __int8 *v10[2];
  uint64_t v11;

  v10[0] = 0;
  v10[1] = 0;
  v11 = 0;
  v9 = 0;
  result = CBS_get_optional_asn1(a1, v10, &v9, a4);
  if ((_DWORD)result)
  {
    v7 = v9;
    if (!v9)
    {
      *a2 = 0;
      a2[1] = 0;
      a2[2] = 0;
      if (!a3)
        return 1;
      goto LABEL_6;
    }
    asn1 = cbs_get_asn1(v10, a2, 4, 1);
    result = 0;
    if (asn1 && !v11)
    {
      if (!a3)
        return 1;
LABEL_6:
      *a3 = v7;
      return 1;
    }
  }
  return result;
}

uint64_t CBS_get_optional_asn1_uint64(unsigned __int8 **a1, unint64_t *a2, int a3, unint64_t a4)
{
  uint64_t result;
  int asn1_uint64;
  int v8;
  unsigned __int8 *v9[2];
  uint64_t v10;

  v9[0] = 0;
  v9[1] = 0;
  v10 = 0;
  v8 = 0;
  result = CBS_get_optional_asn1(a1, v9, &v8, a3);
  if ((_DWORD)result)
  {
    if (v8)
    {
      asn1_uint64 = CBS_get_asn1_uint64(v9, a2);
      result = 0;
      if (!asn1_uint64 || v10)
        return result;
    }
    else
    {
      *a2 = a4;
    }
    return 1;
  }
  return result;
}

uint64_t CBS_get_optional_asn1_BOOL(unsigned __int8 **a1, int *a2, int a3, int a4)
{
  uint64_t result;
  int asn1;
  int v8;
  _QWORD v9[2];
  uint64_t v10;
  unsigned __int8 *v11[2];
  uint64_t v12;

  v11[0] = 0;
  v11[1] = 0;
  v12 = 0;
  v9[0] = 0;
  v9[1] = 0;
  v10 = 0;
  v8 = 0;
  result = CBS_get_optional_asn1(a1, v11, &v8, a3);
  if ((_DWORD)result)
  {
    if (!v8)
    {
LABEL_9:
      *a2 = a4;
      return 1;
    }
    asn1 = cbs_get_asn1(v11, v9, 1, 1);
    result = 0;
    if (asn1 && v10 == 1 && !v12)
    {
      a4 = *(unsigned __int8 *)v9[0];
      if (*(_BYTE *)v9[0])
      {
        if (a4 != 255)
          return 0;
        a4 = 1;
      }
      goto LABEL_9;
    }
  }
  return result;
}

uint64_t CBB_init(uint64_t a1, size_t a2)
{
  size_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  if (a2)
    v3 = a2;
  else
    v3 = 64;
  v4 = malloc_type_calloc(1uLL, v3, 0x80F5FDA0uLL);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = 1;
  v7 = malloc_type_calloc(1uLL, 0x20uLL, 0x1010040A6225C5AuLL);
  if (!v7)
  {
    free(v5);
    return 0;
  }
  *v7 = v5;
  v7[1] = 0;
  v7[2] = v3;
  *((_BYTE *)v7 + 24) = 1;
  *(_QWORD *)a1 = v7;
  *(_BYTE *)(a1 + 26) = 1;
  return v6;
}

uint64_t CBB_init_fixed(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  _QWORD *v7;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  v6 = 1;
  v7 = malloc_type_calloc(1uLL, 0x20uLL, 0x1010040A6225C5AuLL);
  if (!v7)
    return 0;
  *v7 = a2;
  v7[1] = 0;
  v7[2] = a3;
  *(_QWORD *)a1 = v7;
  *(_BYTE *)(a1 + 26) = 1;
  *((_BYTE *)v7 + 24) = 0;
  return v6;
}

void CBB_cleanup(uint64_t *a1)
{
  uint64_t v2;

  v2 = *a1;
  if (v2)
  {
    if (*(_BYTE *)(v2 + 24))
    {
      freezero(*(void **)v2, *(_QWORD *)(v2 + 16));
      v2 = *a1;
    }
    free((void *)v2);
  }
  *a1 = 0;
  a1[2] = 0;
}

uint64_t CBB_finish(uint64_t *a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t result;
  _QWORD *v7;

  if (!*((_BYTE *)a1 + 26))
    return 0;
  result = CBB_flush((uint64_t)a1);
  if (!(_DWORD)result)
    return result;
  v7 = (_QWORD *)*a1;
  if (*(_BYTE *)(*a1 + 24))
  {
    result = 0;
    if (!a2 || !a3)
      return result;
  }
  else if (!a2)
  {
    goto LABEL_11;
  }
  if (*a2)
    return 0;
  *a2 = *v7;
  v7 = (_QWORD *)*a1;
LABEL_11:
  if (a3)
    *a3 = v7[1];
  *v7 = 0;
  CBB_cleanup(a1);
  return 1;
}

uint64_t CBB_flush(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  unint64_t v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  size_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  unint64_t v14;

  v1 = *(char **)a1;
  if (*(_QWORD *)a1)
  {
    if (!*(_QWORD *)(a1 + 16))
      return 1;
    v3 = *(unsigned __int8 *)(a1 + 24);
    if (!*(_BYTE *)(a1 + 24))
      return 1;
    v5 = (uint64_t *)(a1 + 8);
    v4 = *(_QWORD *)(a1 + 8);
    if (!CBB_flush())
      return 0;
    v6 = v4 + v3;
    v7 = *v5;
    if (v4 + v3 < (unint64_t)*v5)
      return 0;
    v8 = *(char **)a1;
    v9 = *(_QWORD *)(*(_QWORD *)a1 + 8);
    v10 = v9 - v6;
    if (v9 < v6)
      return 0;
    LODWORD(v11) = *(unsigned __int8 *)(a1 + 24);
    if (!*(_BYTE *)(a1 + 25))
    {
LABEL_21:
      if ((_DWORD)v11)
      {
        v14 = v11 - 1;
        do
        {
          *(_BYTE *)(**(_QWORD **)a1 + *(_QWORD *)(a1 + 8) + v14) = v10;
          v10 >>= 8;
          --v14;
        }
        while (v14 < *(unsigned __int8 *)(a1 + 24));
      }
      if (v10)
        return 0;
      **(_QWORD **)(a1 + 16) = 0;
      *v5 = 0;
      *(_QWORD *)(a1 + 16) = 0;
      *(_WORD *)(a1 + 24) = 0;
      return 1;
    }
    v1 = 0;
    if ((_DWORD)v11 == 1 && v10 <= 0xFFFFFFFE)
    {
      if (v10 >> 24)
      {
        v11 = 4;
      }
      else if (v10 >> 16)
      {
        v11 = 3;
      }
      else if (v10 <= 0xFF)
      {
        if (v10 <= 0x7F)
        {
          LODWORD(v11) = 0;
          v12 = v10;
          v10 = 0;
          goto LABEL_20;
        }
        v11 = 1;
      }
      else
      {
        v11 = 2;
      }
      if (cbb_buffer_add(v8, 0, v11))
      {
        v12 = v11 | 0x80;
        memmove((void *)(**(_QWORD **)a1 + v6 + v11), (const void *)(**(_QWORD **)a1 + v6), v10);
        v8 = *(char **)a1;
        v7 = *(_QWORD *)(a1 + 8);
LABEL_20:
        v13 = *(_QWORD *)v8;
        *(_QWORD *)(a1 + 8) = v7 + 1;
        *(_BYTE *)(v13 + v7) = v12;
        *(_BYTE *)(a1 + 24) = v11;
        goto LABEL_21;
      }
      return 0;
    }
  }
  return (uint64_t)v1;
}

char *cbb_buffer_add(char *result, _QWORD *a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v7;
  size_t v9;

  if (!result)
    return result;
  v3 = result;
  v4 = *((_QWORD *)result + 1);
  v5 = v4 + a3;
  if (__CFADD__(v4, a3))
    return 0;
  v7 = *((_QWORD *)result + 2);
  if (v5 <= v7)
  {
LABEL_15:
    if (a2)
      *a2 = *v3 + v3[1];
    v3[1] = v5;
    return (char *)1;
  }
  if (!result[24])
    return 0;
  if (2 * v7 < v5 || v7 < 0)
    v9 = v4 + a3;
  else
    v9 = 2 * v7;
  result = recallocarray(*(char **)result, v7, v9, 1uLL);
  if (result)
  {
    *v3 = result;
    v3[2] = v9;
    goto LABEL_15;
  }
  return result;
}

uint64_t CBB_discard_child(uint64_t result)
{
  _QWORD *v1;

  v1 = *(_QWORD **)(result + 16);
  if (v1)
  {
    *(_QWORD *)(*(_QWORD *)result + 8) = *(_QWORD *)(result + 8);
    *v1 = 0;
    *(_WORD *)(result + 24) = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
  }
  return result;
}

uint64_t CBB_add_u8_length_prefixed(uint64_t a1, _OWORD *a2)
{
  return cbb_add_length_prefixed(a1, a2, 1uLL);
}

uint64_t cbb_add_length_prefixed(uint64_t a1, _OWORD *a2, size_t a3)
{
  uint64_t result;
  char *v7;
  void *v8;

  result = CBB_flush(a1);
  if ((_DWORD)result)
  {
    v8 = 0;
    v7 = *(char **)a1;
    *(_QWORD *)(a1 + 8) = *(_QWORD *)(*(_QWORD *)a1 + 8);
    result = (uint64_t)cbb_buffer_add(v7, &v8, a3);
    if ((_DWORD)result)
    {
      bzero(v8, a3);
      *a2 = 0u;
      a2[1] = 0u;
      *(_QWORD *)a2 = *(_QWORD *)a1;
      *(_QWORD *)(a1 + 16) = a2;
      *(_BYTE *)(a1 + 24) = a3;
      *(_BYTE *)(a1 + 25) = 0;
      return 1;
    }
  }
  return result;
}

uint64_t CBB_add_u16_length_prefixed(uint64_t a1, _OWORD *a2)
{
  return cbb_add_length_prefixed(a1, a2, 2uLL);
}

uint64_t CBB_add_u24_length_prefixed(uint64_t a1, _OWORD *a2)
{
  return cbb_add_length_prefixed(a1, a2, 3uLL);
}

uint64_t CBB_add_asn1(uint64_t a1, _OWORD *a2, unsigned int a3)
{
  uint64_t result;

  result = 0;
  if (a3 <= 0xFF && (a3 & 0x1F) != 0x1F)
  {
    result = CBB_flush(a1);
    if ((_DWORD)result)
    {
      result = cbb_add_u((char **)a1, a3, 1uLL);
      if ((_DWORD)result)
      {
        *(_QWORD *)(a1 + 8) = *(_QWORD *)(*(_QWORD *)a1 + 8);
        result = cbb_add_u((char **)a1, 0, 1uLL);
        if ((_DWORD)result)
        {
          *a2 = 0u;
          a2[1] = 0u;
          *(_QWORD *)a2 = *(_QWORD *)a1;
          *(_QWORD *)(a1 + 16) = a2;
          *(_WORD *)(a1 + 24) = 257;
          return 1;
        }
      }
    }
  }
  return result;
}

uint64_t CBB_add_u8(char **a1, unint64_t a2)
{
  if (a2 <= 0xFF)
    return cbb_add_u(a1, a2, 1uLL);
  else
    return 0;
}

uint64_t CBB_add_bytes(char **a1, const void *a2, size_t a3)
{
  uint64_t result;
  void *__dst;

  result = CBB_flush((uint64_t)a1);
  if ((_DWORD)result)
  {
    __dst = 0;
    result = (uint64_t)cbb_buffer_add(*a1, &__dst, a3);
    if ((_DWORD)result)
    {
      memcpy(__dst, a2, a3);
      return 1;
    }
  }
  return result;
}

uint64_t CBB_add_space(char **a1, void **a2, size_t a3)
{
  uint64_t result;

  result = CBB_flush((uint64_t)a1);
  if ((_DWORD)result)
  {
    result = (uint64_t)cbb_buffer_add(*a1, a2, a3);
    if ((_DWORD)result)
    {
      bzero(*a2, a3);
      return 1;
    }
  }
  return result;
}

uint64_t cbb_add_u(char **a1, unsigned int a2, unint64_t a3)
{
  uint64_t result;
  unint64_t v7;
  uint64_t v8;

  result = CBB_flush((uint64_t)a1);
  if ((_DWORD)result)
  {
    v8 = 0;
    result = (uint64_t)cbb_buffer_add(*a1, &v8, a3);
    if ((_DWORD)result)
    {
      if (a3)
      {
        v7 = a3 - 1;
        do
        {
          *(_BYTE *)(v8 + v7) = a2;
          a2 >>= 8;
          --v7;
        }
        while (v7 < a3);
      }
      return 1;
    }
  }
  return result;
}

uint64_t CBB_add_u16(char **a1, unint64_t a2)
{
  if (a2 >> 16)
    return 0;
  else
    return cbb_add_u(a1, a2, 2uLL);
}

uint64_t CBB_add_u24(char **a1, unint64_t a2)
{
  if (a2 >> 24)
    return 0;
  else
    return cbb_add_u(a1, a2, 3uLL);
}

uint64_t CBB_add_u32(char **a1, unint64_t a2)
{
  if (HIDWORD(a2))
    return 0;
  else
    return cbb_add_u(a1, a2, 4uLL);
}

uint64_t CBB_add_u64(char **a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t result;

  v2 = a2;
  result = cbb_add_u(a1, HIDWORD(a2), 4uLL);
  if ((_DWORD)result)
    return cbb_add_u(a1, v2, 4uLL);
  return result;
}

uint64_t CBB_add_asn1_uint64(uint64_t a1, unint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  char v6;
  _OWORD v7[2];

  memset(v7, 0, sizeof(v7));
  result = CBB_add_asn1(a1, v7, 2u);
  if (!(_DWORD)result)
    return result;
  v5 = 0;
  v6 = 1;
  do
  {
    while ((v6 & 1) == 0)
    {
LABEL_7:
      result = cbb_add_u((char **)v7, (a2 >> (56 - 8 * v5)), 1uLL);
      if (!(_DWORD)result)
        return result;
      v6 = 0;
      if (++v5 == 8)
        return CBB_flush(a1);
    }
    if ((a2 >> (56 - 8 * v5)))
    {
      if (((a2 >> (56 - 8 * v5)) & 0x80) != 0)
      {
        result = cbb_add_u((char **)v7, 0, 1uLL);
        if (!(_DWORD)result)
          return result;
      }
      goto LABEL_7;
    }
    ++v5;
    v6 = 1;
  }
  while (v5 != 8);
  result = cbb_add_u((char **)v7, 0, 1uLL);
  if (!(_DWORD)result)
    return result;
  return CBB_flush(a1);
}

void sub_22D4B3ED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *FileProviderLibrary()
{
  void *v0;
  void *v2;
  void *v3;

  if (!FileProviderLibraryCore_frameworkLibrary)
    FileProviderLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = (void *)FileProviderLibraryCore_frameworkLibrary;
  if (!FileProviderLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *FileProviderLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFFileStorageServiceResult.m"), 17, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void WFFileStorageServiceResultAllowFPSandboxExtensionToConsumer(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = a1;
  objc_msgSend(getFPItemManagerClass(), "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __WFFileStorageServiceResultAllowFPSandboxExtensionToConsumer_block_invoke;
  v11[3] = &unk_24F8AFF70;
  v12 = v5;
  v13 = v6;
  v9 = v5;
  v10 = v6;
  objc_msgSend(v8, "fetchItemForURL:completionHandler:", v7, v11);

}

id getFPItemManagerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getFPItemManagerClass_softClass;
  v7 = getFPItemManagerClass_softClass;
  if (!getFPItemManagerClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getFPItemManagerClass_block_invoke;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getFPItemManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D4B4388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getFPItemManagerClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  FileProviderLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("FPItemManager");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getFPItemManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getFPItemManagerClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFFileStorageServiceResult.m"), 18, CFSTR("Unable to find class %s"), "FPItemManager");

    __break(1u);
  }
}

id UITextCheckerFunction()
{
  return (id)classUITextChecker;
}

Class initUITextChecker()
{
  Class result;

  if (UIKitLibrary_sOnce != -1)
    dispatch_once(&UIKitLibrary_sOnce, &__block_literal_global_157);
  result = objc_getClass("UITextChecker");
  classUITextChecker = (uint64_t)result;
  getUITextCheckerClass = (uint64_t (*)())UITextCheckerFunction;
  return result;
}

void sub_22D4B5C88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getUIColorClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!UIKitLibraryCore_frameworkLibrary)
    UIKitLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!UIKitLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *UIKitLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFFileLabelColorPickerParameter.m"), 19, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("UIColor");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getUIColorClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFFileLabelColorPickerParameter.m"), 20, CFSTR("Unable to find class %s"), "UIColor");

LABEL_8:
    __break(1u);
  }
  getUIColorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_22D4B7890(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t PocketAPITweetID(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%llu"), a1);
}

void sub_22D4B81AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

Class __getRadiosPreferencesClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!AppSupportLibraryCore_frameworkLibrary)
    AppSupportLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!AppSupportLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *AppSupportLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFRadiosPreferencesSettingsClient.m"), 18, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("RadiosPreferences");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getRadiosPreferencesClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFRadiosPreferencesSettingsClient.m"), 19, CFSTR("Unable to find class %s"), "RadiosPreferences");

LABEL_8:
    __break(1u);
  }
  getRadiosPreferencesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_22D4B96A4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22D4B9944(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22D4B9AF0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22D4BA6A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id WFEnforceClass(void *a1, uint64_t a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  if (v3 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    getWFGeneralLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      v8 = 136315906;
      v9 = "WFEnforceClass";
      v10 = 2114;
      v11 = v3;
      v12 = 2114;
      v13 = (id)objc_opt_class();
      v14 = 2114;
      v15 = a2;
      v6 = v13;
      _os_log_impl(&dword_22D353000, v5, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v8, 0x2Au);

    }
    v4 = 0;
  }
  else
  {
    v4 = v3;
  }

  return v4;
}

id VCTitleCaseString(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  char v37;
  void *v38;
  void *v39;

  v1 = a1;
  if (!VCTitleCaseString_shortWords)
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", CFSTR("a"), CFSTR("an"), CFSTR("and"), CFSTR("as"), CFSTR("at"), CFSTR("but"), CFSTR("by"), CFSTR("en"), CFSTR("for"), CFSTR("if"), CFSTR("in"), CFSTR("of"), CFSTR("on"), CFSTR("or"), CFSTR("the"), CFSTR("to"), CFSTR("v"),
           CFSTR("via"),
           CFSTR("vs"),
           0);
    v3 = (void *)VCTitleCaseString_shortWords;
    VCTitleCaseString_shortWords = v2;

  }
  if (!VCTitleCaseString_wordStartCharacterSet)
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "uppercaseLetterCharacterSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "mutableCopy");
    v6 = (void *)VCTitleCaseString_wordStartCharacterSet;
    VCTitleCaseString_wordStartCharacterSet = v5;

    v7 = (void *)VCTitleCaseString_wordStartCharacterSet;
    objc_msgSend(MEMORY[0x24BDD14A8], "lowercaseLetterCharacterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "formUnionWithCharacterSet:", v8);

  }
  if (!VCTitleCaseString_wordMiddleCharacterSet)
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "uppercaseLetterCharacterSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "mutableCopy");
    v11 = (void *)VCTitleCaseString_wordMiddleCharacterSet;
    VCTitleCaseString_wordMiddleCharacterSet = v10;

    v12 = (void *)VCTitleCaseString_wordMiddleCharacterSet;
    objc_msgSend(MEMORY[0x24BDD14A8], "lowercaseLetterCharacterSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "formUnionWithCharacterSet:", v13);

    objc_msgSend((id)VCTitleCaseString_wordMiddleCharacterSet, "addCharactersInString:", CFSTR(".&'’"));
  }
  if (!VCTitleCaseString_wordEndCharacterSet)
    objc_storeStrong((id *)&VCTitleCaseString_wordEndCharacterSet, (id)VCTitleCaseString_wordStartCharacterSet);
  if (!VCTitleCaseString_wordIgnoreCharacterSet)
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "uppercaseLetterCharacterSet");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "mutableCopy");
    v16 = (void *)VCTitleCaseString_wordIgnoreCharacterSet;
    VCTitleCaseString_wordIgnoreCharacterSet = v15;

    objc_msgSend((id)VCTitleCaseString_wordIgnoreCharacterSet, "addCharactersInString:", CFSTR("."));
  }
  v38 = (void *)objc_msgSend(v1, "mutableCopy");
  objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 1;
  objc_msgSend(v17, "setCaseSensitive:", 1);
  v19 = 0;
  v20 = 0;
  v21 = 0;
  v22 = 0;
LABEL_12:
  v39 = v20;
  while ((objc_msgSend(v17, "isAtEnd") & 1) == 0)
  {
    objc_msgSend(v17, "scanUpToCharactersFromSet:intoString:", VCTitleCaseString_wordStartCharacterSet, 0);
    v23 = objc_msgSend(v17, "scanLocation");
    if (v23 < objc_msgSend(v1, "length"))
    {
      v22 = objc_msgSend(v17, "scanLocation");
      if ((objc_msgSend((id)VCTitleCaseString_wordStartCharacterSet, "characterIsMember:", objc_msgSend(v1, "characterAtIndex:", objc_msgSend(v17, "scanLocation"))) & 1) == 0)
      {
        do
        {
          objc_msgSend(v17, "setScanLocation:", objc_msgSend(v17, "scanLocation") + 1);
          v22 = objc_msgSend(v17, "scanLocation");
        }
        while (!objc_msgSend((id)VCTitleCaseString_wordStartCharacterSet, "characterIsMember:", objc_msgSend(v1, "characterAtIndex:", objc_msgSend(v17, "scanLocation"))));
      }
      objc_msgSend(v1, "substringWithRange:", v22, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "scanString:intoString:", v24, 0);

      v25 = objc_msgSend(v1, "length");
      v26 = 1;
      if (v25 > objc_msgSend(v17, "scanLocation"))
      {
        if (objc_msgSend((id)VCTitleCaseString_wordMiddleCharacterSet, "characterIsMember:", objc_msgSend(v1, "characterAtIndex:", objc_msgSend(v17, "scanLocation"))))
        {
          objc_msgSend(v17, "scanCharactersFromSet:intoString:", VCTitleCaseString_wordMiddleCharacterSet, 0);
          v26 = objc_msgSend(v17, "scanLocation") - v22;
        }
        else
        {
          v26 = 1;
        }
      }
      v27 = objc_msgSend(v1, "characterAtIndex:", v22 + v26 - 1);
      v37 = v18;
      if ((objc_msgSend((id)VCTitleCaseString_wordEndCharacterSet, "characterIsMember:", v27) & 1) != 0)
      {
        v21 = v26;
      }
      else
      {
        do
        {
          objc_msgSend(v17, "setScanLocation:", objc_msgSend(v17, "scanLocation") - 1);
          v21 = v26 - 1;
          v28 = objc_msgSend(v1, "characterAtIndex:", v22 - 2 + v26--);
        }
        while (!objc_msgSend((id)VCTitleCaseString_wordEndCharacterSet, "characterIsMember:", v28));
      }
      objc_msgSend(v1, "substringWithRange:", v22, v21);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v29, "lowercaseString");
      v30 = objc_claimAutoreleasedReturnValue();

      v31 = objc_msgSend(v1, "rangeOfCharacterFromSet:options:range:", VCTitleCaseString_wordIgnoreCharacterSet, 2, v22 + 1, v21 - 1);
      v18 = 0;
      v19 = (void *)v30;
      v20 = v29;
      if (v31 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (objc_msgSend(v29, "rangeOfString:", CFSTR("&")) == 0x7FFFFFFFFFFFFFFFLL)
        {
          if ((v37 & 1) == 0 && objc_msgSend((id)VCTitleCaseString_shortWords, "containsObject:", v30))
          {
            objc_msgSend(v38, "replaceCharactersInRange:withString:", v22, v21, v30);
LABEL_32:
            v18 = 0;
            v19 = (void *)v30;
            v20 = v29;
            goto LABEL_12;
          }
          objc_msgSend(v29, "capitalizedString");
          v32 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v29, "uppercaseString");
          v32 = objc_claimAutoreleasedReturnValue();
        }
        v33 = (void *)v32;
        objc_msgSend(v38, "replaceCharactersInRange:withString:", v22, v21, v32);

        goto LABEL_32;
      }
      goto LABEL_12;
    }
  }
  if (v19 && objc_msgSend((id)VCTitleCaseString_shortWords, "containsObject:", v19))
  {
    objc_msgSend(v19, "capitalizedString");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "replaceCharactersInRange:withString:", v22, v21, v34);

  }
  v35 = (void *)objc_msgSend(v38, "copy");

  return v35;
}

void sub_22D4BC528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getUIImagePickerControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!UIKitLibraryCore_frameworkLibrary_908)
    UIKitLibraryCore_frameworkLibrary_908 = _sl_dlopen();
  if (!UIKitLibraryCore_frameworkLibrary_908)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *UIKitLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFTakeVideoAction.m"), 15, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("UIImagePickerController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getUIImagePickerControllerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFTakeVideoAction.m"), 16, CFSTR("Unable to find class %s"), "UIImagePickerController");

LABEL_8:
    __break(1u);
  }
  getUIImagePickerControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_22D4BE3E8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

Class __getSBSStatusBarStyleOverridesAssertionClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!SpringBoardServicesLibraryCore_frameworkLibrary)
    SpringBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!SpringBoardServicesLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *SpringBoardServicesLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFRecordingStatusManager.m"), 16, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("SBSStatusBarStyleOverridesAssertion");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getSBSStatusBarStyleOverridesAssertionClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFRecordingStatusManager.m"), 17, CFSTR("Unable to find class %s"), "SBSStatusBarStyleOverridesAssertion");

LABEL_8:
    __break(1u);
  }
  getSBSStatusBarStyleOverridesAssertionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_22D4BE85C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_22D4BEB34(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

Class __getCAMCaptureCapabilitiesClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!CameraUILibraryCore_frameworkLibrary)
    CameraUILibraryCore_frameworkLibrary = _sl_dlopen();
  if (!CameraUILibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CameraUILibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFCameraCaptureCapabilities.m"), 21, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("CAMCaptureCapabilities");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCAMCaptureCapabilitiesClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFCameraCaptureCapabilities.m"), 22, CFSTR("Unable to find class %s"), "CAMCaptureCapabilities");

LABEL_8:
    __break(1u);
  }
  getCAMCaptureCapabilitiesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_22D4E139C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCLLocationClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!CoreLocationLibraryCore_frameworkLibrary)
    CoreLocationLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!CoreLocationLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CoreLocationLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFWeatherData.m"), 17, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("CLLocation");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCLLocationClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFWeatherData.m"), 18, CFSTR("Unable to find class %s"), "CLLocation");

LABEL_8:
    __break(1u);
  }
  getCLLocationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_22D4E4CBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMPAVEndpointRouteClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!MediaPlayerLibraryCore_frameworkLibrary)
    MediaPlayerLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!MediaPlayerLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *MediaPlayerLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFHandOffPlaybackAction.m"), 18, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("MPAVEndpointRoute");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMPAVEndpointRouteClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFHandOffPlaybackAction.m"), 19, CFSTR("Unable to find class %s"), "MPAVEndpointRoute");

LABEL_8:
    __break(1u);
  }
  getMPAVEndpointRouteClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getCBClientClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCBClientClass_softClass;
  v7 = getCBClientClass_softClass;
  if (!getCBClientClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getCBClientClass_block_invoke;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getCBClientClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D4E7144(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCBClientClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!CoreBrightnessLibraryCore_frameworkLibrary)
    CoreBrightnessLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!CoreBrightnessLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CoreBrightnessLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFNightShiftSettingsClient.m"), 19, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("CBClient");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCBClientClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFNightShiftSettingsClient.m"), 20, CFSTR("Unable to find class %s"), "CBClient");

LABEL_8:
    __break(1u);
  }
  getCBClientClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_22D4E76C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getHKDisplayTypeControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!HealthUILibraryCore_frameworkLibrary)
    HealthUILibraryCore_frameworkLibrary = _sl_dlopen();
  if (!HealthUILibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *HealthUILibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFQuantityTypePickerParameter.m"), 21, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("HKDisplayTypeController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getHKDisplayTypeControllerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFQuantityTypePickerParameter.m"), 22, CFSTR("Unable to find class %s"), "HKDisplayTypeController");

LABEL_8:
    __break(1u);
  }
  getHKDisplayTypeControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_22D4E8B84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D4E9220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D4E9880(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void *ShazamKitLibrary()
{
  void *v0;
  void *v2;
  void *v3;

  if (!ShazamKitLibraryCore_frameworkLibrary)
    ShazamKitLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = (void *)ShazamKitLibraryCore_frameworkLibrary;
  if (!ShazamKitLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *ShazamKitLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFShazamMediaAction.m"), 21, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void __getSHManagedSessionClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  ShazamKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("SHManagedSession");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSHManagedSessionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getSHManagedSessionClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFShazamMediaAction.m"), 22, CFSTR("Unable to find class %s"), "SHManagedSession");

    __break(1u);
  }
}

void sub_22D4EA31C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D4EAA38(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 64));
  _Unwind_Resume(a1);
}

void sub_22D4EB7C4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2893(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2894(uint64_t a1)
{

}

id getMPCPlayerPathClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getMPCPlayerPathClass_softClass;
  v7 = getMPCPlayerPathClass_softClass;
  if (!getMPCPlayerPathClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getMPCPlayerPathClass_block_invoke;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getMPCPlayerPathClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D4EC3B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getMPCPlayerPathClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  MediaPlaybackCoreLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MPCPlayerPath");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMPCPlayerPathClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMPCPlayerPathClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFMediaPlaybackController.m"), 40, CFSTR("Unable to find class %s"), "MPCPlayerPath");

    __break(1u);
  }
}

void MediaPlaybackCoreLibrary()
{
  void *v0;
  void *v1;
  void *v2;

  if (!MediaPlaybackCoreLibraryCore_frameworkLibrary)
    MediaPlaybackCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!MediaPlaybackCoreLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *MediaPlaybackCoreLibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("WFMediaPlaybackController.m"), 38, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

id getMPCPlayerRequestClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getMPCPlayerRequestClass_softClass;
  v7 = getMPCPlayerRequestClass_softClass;
  if (!getMPCPlayerRequestClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getMPCPlayerRequestClass_block_invoke;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getMPCPlayerRequestClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D4EC630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getMPCPlayerChangeRequestClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getMPCPlayerChangeRequestClass_softClass;
  v7 = getMPCPlayerChangeRequestClass_softClass;
  if (!getMPCPlayerChangeRequestClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getMPCPlayerChangeRequestClass_block_invoke;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getMPCPlayerChangeRequestClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D4EC798(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getMPCPlayerChangeRequestClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  MediaPlaybackCoreLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MPCPlayerChangeRequest");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMPCPlayerChangeRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMPCPlayerChangeRequestClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFMediaPlaybackController.m"), 41, CFSTR("Unable to find class %s"), "MPCPlayerChangeRequest");

    __break(1u);
  }
}

void __getMPCPlayerRequestClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  MediaPlaybackCoreLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MPCPlayerRequest");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMPCPlayerRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMPCPlayerRequestClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFMediaPlaybackController.m"), 39, CFSTR("Unable to find class %s"), "MPCPlayerRequest");

    __break(1u);
  }
}

id getMPModelSongClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getMPModelSongClass_softClass;
  v7 = getMPModelSongClass_softClass;
  if (!getMPModelSongClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getMPModelSongClass_block_invoke;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getMPModelSongClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D4EC9D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getMPModelLibraryRequestClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  MediaPlayerLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MPModelLibraryRequest");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMPModelLibraryRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMPModelLibraryRequestClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFMediaPlaybackController.m"), 49, CFSTR("Unable to find class %s"), "MPModelLibraryRequest");

    __break(1u);
  }
}

id getMPPropertySetClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getMPPropertySetClass_softClass;
  v7 = getMPPropertySetClass_softClass;
  if (!getMPPropertySetClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getMPPropertySetClass_block_invoke;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getMPPropertySetClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D4ECB54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getMPPropertySetClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  MediaPlayerLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MPPropertySet");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMPPropertySetClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMPPropertySetClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFMediaPlaybackController.m"), 23, CFSTR("Unable to find class %s"), "MPPropertySet");

    __break(1u);
  }
}

void *MediaPlayerLibrary()
{
  void *v0;
  void *v2;
  void *v3;

  if (!MediaPlayerLibraryCore_frameworkLibrary_2918)
    MediaPlayerLibraryCore_frameworkLibrary_2918 = _sl_dlopen();
  v0 = (void *)MediaPlayerLibraryCore_frameworkLibrary_2918;
  if (!MediaPlayerLibraryCore_frameworkLibrary_2918)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *MediaPlayerLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFMediaPlaybackController.m"), 20, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void __getMPModelSongClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  MediaPlayerLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MPModelSong");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMPModelSongClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMPModelSongClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFMediaPlaybackController.m"), 25, CFSTR("Unable to find class %s"), "MPModelSong");

    __break(1u);
  }
}

id getMPIdentifierSetClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getMPIdentifierSetClass_softClass;
  v7 = getMPIdentifierSetClass_softClass;
  if (!getMPIdentifierSetClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getMPIdentifierSetClass_block_invoke;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getMPIdentifierSetClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D4ED03C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getMPIdentifierSetClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  MediaPlayerLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MPIdentifierSet");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMPIdentifierSetClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMPIdentifierSetClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFMediaPlaybackController.m"), 26, CFSTR("Unable to find class %s"), "MPIdentifierSet");

    __break(1u);
  }
}

id getMPMediaLibraryClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getMPMediaLibraryClass_softClass;
  v7 = getMPMediaLibraryClass_softClass;
  if (!getMPMediaLibraryClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getMPMediaLibraryClass_block_invoke;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getMPMediaLibraryClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D4ED268(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getMPMediaLibraryClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  MediaPlayerLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MPMediaLibrary");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMPMediaLibraryClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMPMediaLibraryClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFMediaPlaybackController.m"), 21, CFSTR("Unable to find class %s"), "MPMediaLibrary");

    __break(1u);
  }
}

void sub_22D4ED7E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D4EDBEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getMPMediaItemClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  MediaPlayerLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MPMediaItem");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMPMediaItemClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMPMediaItemClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFMediaPlaybackController.m"), 22, CFSTR("Unable to find class %s"), "MPMediaItem");

    __break(1u);
  }
}

void sub_22D4EEABC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D4EECE0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22D4EEDA0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22D4EEEA8(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_22D4EEEB4()
{
  void *v0;

  objc_sync_exit(v0);
  JUMPOUT(0x22D4EEEC0);
}

void sub_22D4EF0DC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22D4EF13C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22D4EF2C0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id WFMediaRouteDescriptorIsMissingRouteUIDError()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  WFLocalizedString(CFSTR("Invalid Output Device"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedString(CFSTR("The device you specified can not be used for media playback."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BEC4270];
  v4 = *MEMORY[0x24BDD0FC8];
  v8[0] = *MEMORY[0x24BDD0FD8];
  v8[1] = v4;
  v9[0] = v0;
  v9[1] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, 5, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void sub_22D4F0F3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getRTRoutineManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!CoreRoutineLibraryCore_frameworkLibrary)
    CoreRoutineLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!CoreRoutineLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CoreRoutineLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFGetParkedCarLocationAction.m"), 19, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("RTRoutineManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getRTRoutineManagerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFGetParkedCarLocationAction.m"), 22, CFSTR("Unable to find class %s"), "RTRoutineManager");

LABEL_8:
    __break(1u);
  }
  getRTRoutineManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_22D4F149C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

Class __getCNContactStoreClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!ContactsLibraryCore_frameworkLibrary)
    ContactsLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!ContactsLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *ContactsLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFContactAccessResource.m"), 15, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("CNContactStore");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCNContactStoreClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFContactAccessResource.m"), 16, CFSTR("Unable to find class %s"), "CNContactStore");

LABEL_8:
    __break(1u);
  }
  getCNContactStoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_22D4F2ECC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *SpringBoardServicesLibrary()
{
  void *v0;
  void *v2;
  void *v3;

  if (!SpringBoardServicesLibraryCore_frameworkLibrary_3863)
    SpringBoardServicesLibraryCore_frameworkLibrary_3863 = _sl_dlopen();
  v0 = (void *)SpringBoardServicesLibraryCore_frameworkLibrary_3863;
  if (!SpringBoardServicesLibraryCore_frameworkLibrary_3863)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *SpringBoardServicesLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFSplitScreenAppAction.m"), 25, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void getSBSOpenApplicationOptionKeyLayoutRole()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getSBSOpenApplicationOptionKeyLayoutRoleSymbolLoc_ptr;
  v8 = getSBSOpenApplicationOptionKeyLayoutRoleSymbolLoc_ptr;
  if (!getSBSOpenApplicationOptionKeyLayoutRoleSymbolLoc_ptr)
  {
    v1 = SpringBoardServicesLibrary();
    v0 = (id *)dlsym(v1, "SBSOpenApplicationOptionKeyLayoutRole");
    v6[3] = (uint64_t)v0;
    getSBSOpenApplicationOptionKeyLayoutRoleSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getSBSOpenApplicationOptionKeyLayoutRole(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFSplitScreenAppAction.m"), 27, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_22D4F31DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id WFMapsAppNamesByIdentifier()
{
  _QWORD v1[6];
  _QWORD v2[7];

  v2[6] = *MEMORY[0x24BDAC8D0];
  v1[0] = CFSTR("com.apple.Maps");
  v1[1] = CFSTR("azdev.citymapper");
  v2[0] = CFSTR("Maps");
  v2[1] = CFSTR("Citymapper");
  v1[2] = CFSTR("com.google.Maps");
  v1[3] = CFSTR("com.samvermette.Transit");
  v2[2] = CFSTR("Google Maps");
  v2[3] = CFSTR("Transit");
  v1[4] = CFSTR("com.waze.iphone");
  v1[5] = CFSTR("com.baidu.map");
  v2[4] = CFSTR("Waze");
  v2[5] = CFSTR("Baidu Maps");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v2, v1, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

id WFLocalizedMapsAppNameForAppName(void *a1)
{
  id v1;
  __CFString *v2;
  id v3;
  void *v4;

  v1 = a1;
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("Maps")))
  {
    v2 = CFSTR("Maps");
LABEL_13:
    WFLocalizedString(v2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("Citymapper")))
  {
    v2 = CFSTR("Citymapper");
    goto LABEL_13;
  }
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("Google Maps")))
  {
    v2 = CFSTR("Google Maps");
    goto LABEL_13;
  }
  if (!objc_msgSend(v1, "isEqualToString:", CFSTR("Transit")))
  {
    if (objc_msgSend(v1, "isEqualToString:", CFSTR("Waze")))
    {
      v2 = CFSTR("Waze");
    }
    else
    {
      if (!objc_msgSend(v1, "isEqualToString:", CFSTR("Baidu Maps")))
      {
        v3 = v1;
        goto LABEL_14;
      }
      v2 = CFSTR("Baidu Maps");
    }
    goto LABEL_13;
  }
  WFLocalizedStringWithKey(CFSTR("Transit (App Name)"), CFSTR("Transit"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:
  v4 = v3;

  return v4;
}

id WFMapsAppIdentifierForAppName(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  WFMapsAppNamesByIdentifier();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeysForObject:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_22D4F60EC()
{
  objc_end_catch();
  JUMPOUT(0x22D4F60F4);
}

void sub_22D4F6904(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

CFStringRef TMURLDecode(CFStringRef originalString)
{
  return (id)CFURLCreateStringByReplacingPercentEscapes(0, originalString, &stru_24F8BBA48);
}

__CFString *TMURLEncode(void *a1)
{
  id v1;
  const __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = (const __CFString *)v1;
  }
  else
  {
    objc_msgSend(v1, "stringValue");
    v2 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  v3 = (__CFString *)v2;
  v4 = (__CFString *)CFURLCreateStringByAddingPercentEscapes(0, v2, 0, CFSTR("!*'();:@&=+$,/?%#[]%"), 0x8000100u);

  return v4;
}

id type metadata for some(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  __CFString *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id obj;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v1, "componentsSeparatedByString:", CFSTR("&"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v3)
  {
    v4 = v3;
    v17 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v19 != v17)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "componentsSeparatedByString:", CFSTR("="));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "count") == 2)
        {
          objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
          v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
          TMURLDecode(v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
          TMURLDecode(v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v2, "objectForKeyedSubscript:", v8);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v11, "addObject:", v10);
            }
            else
            {
              objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", v11, v10, 0);
              v12 = v4;
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v2, "setObject:forKey:", v13, v8);

              v4 = v12;
            }
          }
          else
          {
            objc_msgSend(v2, "setObject:forKey:", v10, v8);
          }

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v4);
  }
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id TMDictionaryToQueryString(void *a1)
{
  id v1;
  void *v2;
  void (**v3)(void *, uint64_t, _QWORD);
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v20;
  uint64_t v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD aBlock[4];
  id v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __TMDictionaryToQueryString_block_invoke;
  aBlock[3] = &unk_24F8B0D78;
  v20 = v2;
  v32 = v20;
  v3 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(aBlock);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v1, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
    do
    {
      v9 = 0;
      v21 = v7;
      do
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v9);
        objc_msgSend(v1, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = v8;
          v25 = 0u;
          v26 = 0u;
          v23 = 0u;
          v24 = 0u;
          v13 = v11;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v24;
            do
            {
              for (i = 0; i != v15; ++i)
              {
                if (*(_QWORD *)v24 != v16)
                  objc_enumerationMutation(v13);
                v3[2](v3, v10, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i));
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
            }
            while (v15);
          }

          v8 = v12;
          v7 = v21;
        }
        else
        {
          ((void (**)(void *, uint64_t, void *))v3)[2](v3, v10, v11);
        }

        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
    }
    while (v7);
  }

  objc_msgSend(v20, "componentsJoinedByString:", CFSTR("&"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

void WFPlaylistsMatchingDescriptor(void *a1)
{
  id v1;
  void *v2;
  id MPMediaPropertyPredicateClass;
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;

  v1 = a1;
  objc_msgSend(v1, "playlistName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v15 = 0;
LABEL_18:

    v25 = v15;
    return;
  }
  MPMediaPropertyPredicateClass = getMPMediaPropertyPredicateClass();
  objc_msgSend(v1, "playlistName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v29 = (uint64_t)&v28;
  v30 = 0x2020000000;
  v5 = (_QWORD *)getMPMediaPlaylistPropertyNameSymbolLoc_ptr;
  v31 = (void *)getMPMediaPlaylistPropertyNameSymbolLoc_ptr;
  if (!getMPMediaPlaylistPropertyNameSymbolLoc_ptr)
  {
    v6 = MediaPlayerLibrary_4941();
    v5 = dlsym(v6, "MPMediaPlaylistPropertyName");
    *(_QWORD *)(v29 + 24) = v5;
    getMPMediaPlaylistPropertyNameSymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v28, 8);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMPMediaPlaylistPropertyName(void)");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, CFSTR("WFPlaylistSubstitutableState.m"), 16, CFSTR("%s"), dlerror(), v28);
    goto LABEL_21;
  }
  objc_msgSend(MPMediaPropertyPredicateClass, "predicateWithValue:forProperty:", v4, *v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = 0;
  v34 = &v33;
  v35 = 0x2050000000;
  v8 = (void *)getMPMediaQueryClass_softClass;
  v36 = getMPMediaQueryClass_softClass;
  if (!getMPMediaQueryClass_softClass)
  {
    v28 = MEMORY[0x24BDAC760];
    v29 = 3221225472;
    v30 = (uint64_t)__getMPMediaQueryClass_block_invoke;
    v31 = &unk_24F8BB430;
    v32 = &v33;
    __getMPMediaQueryClass_block_invoke((uint64_t)&v28);
    v8 = (void *)v34[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v33, 8);
  v10 = [v9 alloc];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithFilterPredicates:", v11);

  objc_msgSend(v12, "setGroupingType:", 6);
  objc_msgSend(v12, "collections");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (!v14)
  {
    v15 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v12, "collections");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "persistentIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
LABEL_17:

    goto LABEL_18;
  }
  v17 = getMPMediaPropertyPredicateClass();
  objc_msgSend(v1, "persistentIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v29 = (uint64_t)&v28;
  v30 = 0x2020000000;
  v19 = (_QWORD *)getMPMediaPlaylistPropertyPersistentIDSymbolLoc_ptr;
  v31 = (void *)getMPMediaPlaylistPropertyPersistentIDSymbolLoc_ptr;
  if (!getMPMediaPlaylistPropertyPersistentIDSymbolLoc_ptr)
  {
    v20 = MediaPlayerLibrary_4941();
    v19 = dlsym(v20, "MPMediaPlaylistPropertyPersistentID");
    *(_QWORD *)(v29 + 24) = v19;
    getMPMediaPlaylistPropertyPersistentIDSymbolLoc_ptr = (uint64_t)v19;
  }
  _Block_object_dispose(&v28, 8);
  if (v19)
  {
    objc_msgSend(v17, "predicateWithValue:forProperty:", v18, *v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "addFilterPredicate:", v21);
    objc_msgSend(v12, "collections");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count");

    if (v23)
    {
      objc_msgSend(v12, "collections");
      v24 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v24;
    }

    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMPMediaPlaylistPropertyPersistentID(void)");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, CFSTR("WFPlaylistSubstitutableState.m"), 17, CFSTR("%s"), dlerror(), v28);
LABEL_21:

  __break(1u);
}

void sub_22D4FA780(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getMPMediaPropertyPredicateClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getMPMediaPropertyPredicateClass_softClass;
  v7 = getMPMediaPropertyPredicateClass_softClass;
  if (!getMPMediaPropertyPredicateClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getMPMediaPropertyPredicateClass_block_invoke;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getMPMediaPropertyPredicateClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D4FA848(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *MediaPlayerLibrary_4941()
{
  void *v0;
  void *v2;
  void *v3;

  if (!MediaPlayerLibraryCore_frameworkLibrary_4947)
    MediaPlayerLibraryCore_frameworkLibrary_4947 = _sl_dlopen();
  v0 = (void *)MediaPlayerLibraryCore_frameworkLibrary_4947;
  if (!MediaPlayerLibraryCore_frameworkLibrary_4947)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *MediaPlayerLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFPlaylistSubstitutableState.m"), 13, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void __getMPMediaQueryClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  MediaPlayerLibrary_4941();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MPMediaQuery");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMPMediaQueryClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMPMediaQueryClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFPlaylistSubstitutableState.m"), 15, CFSTR("Unable to find class %s"), "MPMediaQuery");

    __break(1u);
  }
}

void __getMPMediaPropertyPredicateClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  MediaPlayerLibrary_4941();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MPMediaPropertyPredicate");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMPMediaPropertyPredicateClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMPMediaPropertyPredicateClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFPlaylistSubstitutableState.m"), 14, CFSTR("Unable to find class %s"), "MPMediaPropertyPredicate");

    __break(1u);
  }
}

void sub_22D4FB398(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getkCLErrorDomainSymbolLoc_block_invoke(_QWORD *a1)
{
  void *v2;
  void *result;
  void *v4;

  if (!CoreLocationLibraryCore_frameworkLibrary_5021)
    CoreLocationLibraryCore_frameworkLibrary_5021 = _sl_dlopen();
  v2 = (void *)CoreLocationLibraryCore_frameworkLibrary_5021;
  if (!CoreLocationLibraryCore_frameworkLibrary_5021)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CoreLocationLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFGetCurrentLocationAction.m"), 18, CFSTR("%s"), 0);

    __break(1u);
    free(v4);
  }
  result = dlsym(v2, "kCLErrorDomain");
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  getkCLErrorDomainSymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  return result;
}

void sub_22D4FB8F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *CalculateLibrary()
{
  void *v0;
  void *v2;
  void *v3;

  if (!CalculateLibraryCore_frameworkLibrary)
    CalculateLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = (void *)CalculateLibraryCore_frameworkLibrary;
  if (!CalculateLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CalculateLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFCalculateExpressionAction.m"), 16, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void __getCalculateClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  CalculateLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("Calculate");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCalculateClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCalculateClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFCalculateExpressionAction.m"), 17, CFSTR("Unable to find class %s"), "Calculate");

    __break(1u);
  }
}

void sub_22D4FC8D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *LowPowerModeLibrary()
{
  void *v0;
  void *v2;
  void *v3;

  if (!LowPowerModeLibraryCore_frameworkLibrary)
    LowPowerModeLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = (void *)LowPowerModeLibraryCore_frameworkLibrary;
  if (!LowPowerModeLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *LowPowerModeLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFLowPowerModeSettingsClient.m"), 23, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void sub_22D4FCB10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D4FE210(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x200], 8);
  _Unwind_Resume(a1);
}

void __getCTTelephonyNetworkInfoClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  CoreTelephonyLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("CTTelephonyNetworkInfo");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCTTelephonyNetworkInfoClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCTTelephonyNetworkInfoClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFGetNetworkDetailsAction.m"), 25, CFSTR("Unable to find class %s"), "CTTelephonyNetworkInfo");

    __break(1u);
  }
}

void __getCoreTelephonyClientClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  CoreTelephonyLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("CoreTelephonyClient");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCoreTelephonyClientClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCoreTelephonyClientClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFGetNetworkDetailsAction.m"), 26, CFSTR("Unable to find class %s"), "CoreTelephonyClient");

    __break(1u);
  }
}

id getCTServiceDescriptorClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCTServiceDescriptorClass_softClass;
  v7 = getCTServiceDescriptorClass_softClass;
  if (!getCTServiceDescriptorClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getCTServiceDescriptorClass_block_invoke;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getCTServiceDescriptorClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D4FEBD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *CoreTelephonyLibrary()
{
  void *v0;
  void *v2;
  void *v3;

  if (!CoreTelephonyLibraryCore_frameworkLibrary)
    CoreTelephonyLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = (void *)CoreTelephonyLibraryCore_frameworkLibrary;
  if (!CoreTelephonyLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CoreTelephonyLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFGetNetworkDetailsAction.m"), 24, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void __getCTServiceDescriptorClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  CoreTelephonyLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("CTServiceDescriptor");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCTServiceDescriptorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCTServiceDescriptorClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFGetNetworkDetailsAction.m"), 27, CFSTR("Unable to find class %s"), "CTServiceDescriptor");

    __break(1u);
  }
}

void sub_22D4FF7AC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

xmlParserInputPtr enxmlExternalEntityLoader(uint64_t a1, uint64_t a2, xmlParserCtxt *a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  xmlParserInputPtr v14;

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCString:encoding:", a1, 4);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v6);
  v8 = v7;
  if (!v7)
  {
    v14 = 0;
LABEL_13:
    if (defaultExternalEntityLoader)
      v14 = (xmlParserInputPtr)defaultExternalEntityLoader(a1, a2, a3);
    goto LABEL_15;
  }
  objc_msgSend(v7, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "lastPathComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      +[ENSDKResourceLoader pathToResourceNamed:extension:](ENSDKResourceLoader, "pathToResourceNamed:extension:", v11, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
        v14 = xmlNewInputFromFile(a3, (const char *)objc_msgSend(objc_retainAutorelease(v12), "fileSystemRepresentation"));
      else
        v14 = 0;

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  if (!v14)
    goto LABEL_13;
LABEL_15:

  return v14;
}

uint64_t waitsocket(int a1, uint64_t a2)
{
  char v4;
  timeval *v5;
  timeval *v6;
  timeval v8[8];
  timeval v9;

  v9.tv_sec = 0;
  *(_QWORD *)&v9.tv_usec = 500000;
  memset(v8, 0, sizeof(v8));
  if (__darwin_check_fd_set_overflow(a1, v8, 0))
    *(_DWORD *)((char *)&v8[0].tv_sec + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << a1;
  v4 = libssh2_session_block_directions(a2);
  if ((v4 & 1) != 0)
    v5 = v8;
  else
    v5 = 0;
  if ((v4 & 2) != 0)
    v6 = v8;
  else
    v6 = 0;
  return select(a1 + 1, (fd_set *)v5, (fd_set *)v6, 0, &v9);
}

void sub_22D5018A8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5530(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5531(uint64_t a1)
{

}

void sub_22D502420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSSReadingListClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!SafariServicesLibraryCore_frameworkLibrary)
    SafariServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!SafariServicesLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *SafariServicesLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFAddToReadingListAction.m"), 22, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("SSReadingList");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getSSReadingListClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFAddToReadingListAction.m"), 23, CFSTR("Unable to find class %s"), "SSReadingList");

LABEL_8:
    __break(1u);
  }
  getSSReadingListClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_22D5035FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *AccessibilityUtilitiesLibrary()
{
  void *v0;
  void *v2;
  void *v3;

  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary)
    AccessibilityUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = (void *)AccessibilityUtilitiesLibraryCore_frameworkLibrary;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *AccessibilityUtilitiesLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFSpeechSynthesisVoice.m"), 24, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

id getAVSpeechSynthesisVoiceClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getAVSpeechSynthesisVoiceClass_softClass;
  v7 = getAVSpeechSynthesisVoiceClass_softClass;
  if (!getAVSpeechSynthesisVoiceClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getAVSpeechSynthesisVoiceClass_block_invoke;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getAVSpeechSynthesisVoiceClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D5037FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAVSpeechSynthesisVoiceClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!AVFoundationLibraryCore_frameworkLibrary)
    AVFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!AVFoundationLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *AVFoundationLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFSpeechSynthesisVoice.m"), 37, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("AVSpeechSynthesisVoice");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAVSpeechSynthesisVoiceClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFSpeechSynthesisVoice.m"), 38, CFSTR("Unable to find class %s"), "AVSpeechSynthesisVoice");

LABEL_8:
    __break(1u);
  }
  getAVSpeechSynthesisVoiceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getAXAlternativeVoicesClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getAXAlternativeVoicesClass_softClass;
  v7 = getAXAlternativeVoicesClass_softClass;
  if (!getAXAlternativeVoicesClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getAXAlternativeVoicesClass_block_invoke;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getAXAlternativeVoicesClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D503A50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getAXAlternativeVoicesClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  AccessibilityUtilitiesLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AXAlternativeVoices");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAXAlternativeVoicesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAXAlternativeVoicesClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFSpeechSynthesisVoice.m"), 25, CFSTR("Unable to find class %s"), "AXAlternativeVoices");

    __break(1u);
  }
}

void sub_22D503EA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getAXSettingsClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  AccessibilityUtilitiesLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AXSettings");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAXSettingsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAXSettingsClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFSpeechSynthesisVoice.m"), 41, CFSTR("Unable to find class %s"), "AXSettings");

    __break(1u);
  }
}

_BYTE *NewBase64Decode(char *__s, size_t a2, _QWORD *a3)
{
  size_t v4;
  _BYTE *result;
  uint64_t v7;
  size_t v8;
  unint64_t v9;
  int v10;
  unsigned __int8 v11;
  unsigned __int8 v12;
  BOOL v13;
  unint64_t v14;
  char v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  char v18;

  v4 = a2;
  if (a2 == -1)
    v4 = strlen(__s);
  result = malloc_type_malloc(3 * ((v4 + 3) >> 2), 0x91BD1AE5uLL);
  v7 = 0;
  if (v4)
  {
    v8 = 0;
    do
    {
      v9 = 0;
      do
      {
        v10 = base64DecodeLookup[__s[v8]];
        if (v10 != 65)
        {
          *(&v15 + v9++) = v10;
          if (v9 == 4)
          {
            ++v8;
            goto LABEL_12;
          }
        }
        ++v8;
      }
      while (v8 < v4);
      if (v9 <= 1)
        goto LABEL_16;
LABEL_12:
      v11 = v16;
      result[v7] = (v16 >> 4) | (4 * v15);
      if (v9 < 3)
      {
        v9 = 2;
      }
      else
      {
        v12 = v17;
        result[v7 + 1] = (v17 >> 2) | (16 * v11);
        if (v9 != 3)
          result[v7 + 2] = v18 | (v12 << 6);
      }
LABEL_16:
      v13 = v9 != 0;
      v14 = v9 - 1;
      if (!v13)
        v14 = 0;
      v7 += v14;
    }
    while (v8 < v4);
  }
  if (a3)
    *a3 = v7;
  return result;
}

_BYTE *NewBase64Encode(uint64_t a1, unint64_t a2, int a3, _QWORD *a4)
{
  unint64_t v8;
  uint64_t v9;
  _BYTE *result;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _BYTE *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  _BYTE *v21;
  char v22;
  _BYTE *v23;
  char *v24;

  v8 = a2 / 3;
  if (a2 % 3)
    ++v8;
  v9 = (v8 >> 3) & 0x7FFFFFFFFFFFFFFLL;
  if (!a3)
    v9 = 0;
  result = malloc_type_malloc((v9 + 4 * v8) | 1, 0xD08157FDuLL);
  if (result)
  {
    v11 = 0;
    v12 = 0;
    if (a3)
      v13 = 48;
    else
      v13 = a2;
    v14 = a1 + 1;
    v15 = v13;
    while (1)
    {
      v16 = v15 >= a2 ? a2 : v15;
      if (v11 + 2 >= v16)
      {
        v18 = v11;
      }
      else
      {
        do
        {
          v17 = &result[v12 + 1];
          *(v17 - 1) = base64EncodeLookup[(unint64_t)*(unsigned __int8 *)(a1 + v11) >> 2];
          *v17 = base64EncodeLookup[((unint64_t)*(unsigned __int8 *)(a1 + 1 + v11) >> 4) & 0xFFFFFFFFFFFFFFCFLL | (16 * (*(_BYTE *)(a1 + v11) & 3))];
          v17[1] = base64EncodeLookup[((unint64_t)*(unsigned __int8 *)(v14 + v11 + 1) >> 6) & 0xFFFFFFFFFFFFFFC3 | (4 * (*(_BYTE *)(v14 + v11) & 0xF))];
          v18 = v11 + 3;
          v12 += 4;
          v17[2] = base64EncodeLookup[*(_BYTE *)(v14 + v11 + 1) & 0x3F];
          v19 = v11 + 5;
          v11 += 3;
        }
        while (v19 < v16);
      }
      if (v15 >= a2)
        break;
      *(_WORD *)&result[v12] = 2573;
      v12 += 2;
      v15 = v16 + v13;
      v11 = v18;
    }
    v20 = v18 + 1;
    if (v18 + 1 >= a2)
    {
      if (v18 >= a2)
        goto LABEL_24;
      v23 = &result[v12];
      *v23 = base64EncodeLookup[(unint64_t)*(unsigned __int8 *)(a1 + v18) >> 2];
      v23[1] = base64EncodeLookup[16 * (*(_BYTE *)(a1 + v18) & 3)];
      v22 = 61;
    }
    else
    {
      v21 = &result[v12];
      *v21 = base64EncodeLookup[(unint64_t)*(unsigned __int8 *)(a1 + v18) >> 2];
      v21[1] = base64EncodeLookup[((unint64_t)*(unsigned __int8 *)(a1 + v20) >> 4) & 0xFFFFFFFFFFFFFFCFLL | (16 * (*(_BYTE *)(a1 + v18) & 3))];
      v22 = base64EncodeLookup[4 * (*(_BYTE *)(a1 + v20) & 0xF)];
    }
    v24 = &result[v12];
    v24[2] = v22;
    v12 += 4;
    v24[3] = 61;
LABEL_24:
    result[v12] = 0;
    if (a4)
      *a4 = v12;
  }
  return result;
}

void sub_22D506854(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_22D506C48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getANAnnouncementContentClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  AnnounceLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("ANAnnouncementContent");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getANAnnouncementContentClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getANAnnouncementContentClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFAnnounceWrapper.m"), 26, CFSTR("Unable to find class %s"), "ANAnnouncementContent");

    __break(1u);
  }
}

id getANAnnouncementDestinationClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getANAnnouncementDestinationClass_softClass;
  v7 = getANAnnouncementDestinationClass_softClass;
  if (!getANAnnouncementDestinationClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getANAnnouncementDestinationClass_block_invoke;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getANAnnouncementDestinationClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D506DE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getANAnnouncementRequestClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  AnnounceLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("ANAnnouncementRequest");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getANAnnouncementRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getANAnnouncementRequestClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFAnnounceWrapper.m"), 24, CFSTR("Unable to find class %s"), "ANAnnouncementRequest");

    __break(1u);
  }
}

void AnnounceLibrary()
{
  void *v0;
  void *v1;
  void *v2;

  if (!AnnounceLibraryCore_frameworkLibrary)
    AnnounceLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!AnnounceLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *AnnounceLibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("WFAnnounceWrapper.m"), 22, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

void __getANAnnouncementDestinationClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  AnnounceLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("ANAnnouncementDestination");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getANAnnouncementDestinationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getANAnnouncementDestinationClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFAnnounceWrapper.m"), 27, CFSTR("Unable to find class %s"), "ANAnnouncementDestination");

    __break(1u);
  }
}

void __getANAnnounceClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  AnnounceLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("ANAnnounce");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getANAnnounceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getANAnnounceClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFAnnounceWrapper.m"), 23, CFSTR("Unable to find class %s"), "ANAnnounce");

    __break(1u);
  }
}

void sub_22D507200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getAFPreferencesClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getAFPreferencesClass_softClass;
  v7 = getAFPreferencesClass_softClass;
  if (!getAFPreferencesClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getAFPreferencesClass_block_invoke;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getAFPreferencesClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D507370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAFPreferencesClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!AssistantServicesLibraryCore_frameworkLibrary)
    AssistantServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!AssistantServicesLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *AssistantServicesLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFAnnounceWrapper.m"), 28, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("AFPreferences");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAFPreferencesClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFAnnounceWrapper.m"), 29, CFSTR("Unable to find class %s"), "AFPreferences");

LABEL_8:
    __break(1u);
  }
  getAFPreferencesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getHFUtilitiesClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!HomeLibraryCore_frameworkLibrary)
    HomeLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!HomeLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *HomeLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFAnnounceWrapper.m"), 20, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("HFUtilities");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getHFUtilitiesClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFAnnounceWrapper.m"), 21, CFSTR("Unable to find class %s"), "HFUtilities");

LABEL_8:
    __break(1u);
  }
  getHFUtilitiesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_22D50849C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void __getCNMutableContactClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  ContactsLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("CNMutableContact");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCNMutableContactClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCNMutableContactClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFAddNewContactAction.m"), 19, CFSTR("Unable to find class %s"), "CNMutableContact");

    __break(1u);
  }
}

id getCNLabeledValueClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCNLabeledValueClass_softClass;
  v7 = getCNLabeledValueClass_softClass;
  if (!getCNLabeledValueClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getCNLabeledValueClass_block_invoke;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getCNLabeledValueClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D50889C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getCNLabeledValueClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  ContactsLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("CNLabeledValue");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCNLabeledValueClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCNLabeledValueClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFAddNewContactAction.m"), 21, CFSTR("Unable to find class %s"), "CNLabeledValue");

    __break(1u);
  }
}

void ContactsLibrary()
{
  void *v0;
  void *v1;
  void *v2;

  if (!ContactsLibraryCore_frameworkLibrary_6394)
    ContactsLibraryCore_frameworkLibrary_6394 = _sl_dlopen();
  if (!ContactsLibraryCore_frameworkLibrary_6394)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *ContactsLibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("WFAddNewContactAction.m"), 17, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

void sub_22D508BE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getCNPhoneNumberClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  ContactsLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("CNPhoneNumber");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCNPhoneNumberClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCNPhoneNumberClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFAddNewContactAction.m"), 22, CFSTR("Unable to find class %s"), "CNPhoneNumber");

    __break(1u);
  }
}

void sub_22D50A648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAFPreferencesClass_block_invoke_6721(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!AssistantServicesLibraryCore_frameworkLibrary_6722)
    AssistantServicesLibraryCore_frameworkLibrary_6722 = _sl_dlopen();
  if (!AssistantServicesLibraryCore_frameworkLibrary_6722)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *AssistantServicesLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFSpeechRecognitionAccessResource.m"), 18, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("AFPreferences");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAFPreferencesClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFSpeechRecognitionAccessResource.m"), 19, CFSTR("Unable to find class %s"), "AFPreferences");

LABEL_8:
    __break(1u);
  }
  getAFPreferencesClass_softClass_6720 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_22D50CEB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id WFDiskCacheKeyArgs(void *a1, id *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id *v8;
  id v9;
  void *v10;
  id *v12;

  v3 = a1;
  v12 = a2;
  v4 = (void *)objc_opt_new();
  v5 = v3;
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    do
    {
      objc_msgSend(v4, "addObject:", v7);
      v8 = v12++;
      v9 = *v8;

      v7 = v9;
    }
    while (v9);
  }
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("_"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __Block_byref_object_copy__7106(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7107(uint64_t a1)
{

}

id WFDiskCacheKey(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
  if (a1)
  {
    WFDiskCacheKeyArgs(a1, &a9);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

void sub_22D513238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  id *v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v9);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__7752(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void __Block_byref_object_dispose__7753(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

void sub_22D518B88(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void sub_22D518DE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id getPHAssetClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getPHAssetClass_softClass;
  v7 = getPHAssetClass_softClass;
  if (!getPHAssetClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getPHAssetClass_block_invoke;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getPHAssetClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D51DC08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D51DDDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9498(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9499(uint64_t a1)
{

}

void sub_22D51DF50(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void __getPHAssetCollectionChangeRequestClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  PhotosLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("PHAssetCollectionChangeRequest");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPHAssetCollectionChangeRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getPHAssetCollectionChangeRequestClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFRemovePhotoFromAlbumAction.m"), 19, CFSTR("Unable to find class %s"), "PHAssetCollectionChangeRequest");

    __break(1u);
  }
}

void PhotosLibrary()
{
  void *v0;
  void *v1;
  void *v2;

  if (!PhotosLibraryCore_frameworkLibrary)
    PhotosLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!PhotosLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *PhotosLibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("WFRemovePhotoFromAlbumAction.m"), 16, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

void __getPHAssetClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  PhotosLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("PHAsset");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPHAssetClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getPHAssetClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFRemovePhotoFromAlbumAction.m"), 17, CFSTR("Unable to find class %s"), "PHAsset");

    __break(1u);
  }
}

__CFString *MIMETypeForExtension(CFStringRef inTag)
{
  const __CFString *PreferredIdentifierForTag;
  const __CFString *v2;
  CFStringRef v3;
  __CFString *v4;

  PreferredIdentifierForTag = UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x24BDC1658], inTag, 0);
  if (PreferredIdentifierForTag
    && (v2 = PreferredIdentifierForTag,
        v3 = UTTypeCopyPreferredTagWithClass(PreferredIdentifierForTag, (CFStringRef)*MEMORY[0x24BDC1660]),
        CFRelease(v2),
        v3))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFRelease(v3);
  }
  else
  {
    v4 = CFSTR("application/octet-stream");
  }
  return v4;
}

id getMPCAssistantMutableRemoteControlDestinationClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getMPCAssistantMutableRemoteControlDestinationClass_softClass;
  v7 = getMPCAssistantMutableRemoteControlDestinationClass_softClass;
  if (!getMPCAssistantMutableRemoteControlDestinationClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getMPCAssistantMutableRemoteControlDestinationClass_block_invoke;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getMPCAssistantMutableRemoteControlDestinationClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D520394(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMPCAssistantMutableRemoteControlDestinationClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!MediaPlaybackCoreLibraryCore_frameworkLibrary_9684)
    MediaPlaybackCoreLibraryCore_frameworkLibrary_9684 = _sl_dlopen();
  if (!MediaPlaybackCoreLibraryCore_frameworkLibrary_9684)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *MediaPlaybackCoreLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFMediaPlaybackController+MPCAssistant.m"), 16, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("MPCAssistantMutableRemoteControlDestination");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMPCAssistantMutableRemoteControlDestinationClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFMediaPlaybackController+MPCAssistant.m"), 17, CFSTR("Unable to find class %s"), "MPCAssistantMutableRemoteControlDestination");

LABEL_8:
    __break(1u);
  }
  getMPCAssistantMutableRemoteControlDestinationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                            + 24);
  return result;
}

void sub_22D521B68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getUIVideoEditorControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!UIKitLibraryCore_frameworkLibrary_9930)
    UIKitLibraryCore_frameworkLibrary_9930 = _sl_dlopen();
  if (!UIKitLibraryCore_frameworkLibrary_9930)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *UIKitLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFTrimVideoAction.m"), 16, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("UIVideoEditorController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getUIVideoEditorControllerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFTrimVideoAction.m"), 17, CFSTR("Unable to find class %s"), "UIVideoEditorController");

LABEL_8:
    __break(1u);
  }
  getUIVideoEditorControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_22D522080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void TranslationLibrary()
{
  void *v0;
  void *v1;
  void *v2;

  if (!TranslationLibraryCore_frameworkLibrary)
    TranslationLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!TranslationLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *TranslationLibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("WFTranslateTextAction.m"), 18, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

void sub_22D522660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id get_LTTranslatorClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)get_LTTranslatorClass_softClass;
  v7 = get_LTTranslatorClass_softClass;
  if (!get_LTTranslatorClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __get_LTTranslatorClass_block_invoke;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __get_LTTranslatorClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D522718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10027(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10028(uint64_t a1)
{

}

void sub_22D5256CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getRTRoutineManagerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getRTRoutineManagerClass_softClass_10389;
  v7 = getRTRoutineManagerClass_softClass_10389;
  if (!getRTRoutineManagerClass_softClass_10389)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getRTRoutineManagerClass_block_invoke_10390;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getRTRoutineManagerClass_block_invoke_10390((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D525C74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getRTRoutineManagerClass_block_invoke_10390(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!CoreRoutineLibraryCore_frameworkLibrary_10391)
    CoreRoutineLibraryCore_frameworkLibrary_10391 = _sl_dlopen();
  if (!CoreRoutineLibraryCore_frameworkLibrary_10391)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CoreRoutineLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFSetParkedCarAction.m"), 26, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("RTRoutineManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getRTRoutineManagerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFSetParkedCarAction.m"), 31, CFSTR("Unable to find class %s"), "RTRoutineManager");

LABEL_8:
    __break(1u);
  }
  getRTRoutineManagerClass_softClass_10389 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCLLocationClass_block_invoke_10420(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!CoreLocationLibraryCore_frameworkLibrary_10421)
    CoreLocationLibraryCore_frameworkLibrary_10421 = _sl_dlopen();
  if (!CoreLocationLibraryCore_frameworkLibrary_10421)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CoreLocationLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFSetParkedCarAction.m"), 27, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("CLLocation");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCLLocationClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFSetParkedCarAction.m"), 34, CFSTR("Unable to find class %s"), "CLLocation");

LABEL_8:
    __break(1u);
  }
  getCLLocationClass_softClass_10419 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_22D5285B0(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t))(v2 + 16))(v2);
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

id UIDidTakeScreenshotActionFunction()
{
  return (id)classUIDidTakeScreenshotAction;
}

Class initUIDidTakeScreenshotAction()
{
  Class result;

  if (UIKitLibrary_sOnce_10539 != -1)
    dispatch_once(&UIKitLibrary_sOnce_10539, &__block_literal_global_204);
  result = objc_getClass("UIDidTakeScreenshotAction");
  classUIDidTakeScreenshotAction = (uint64_t)result;
  getUIDidTakeScreenshotActionClass = (uint64_t (*)())UIDidTakeScreenshotActionFunction;
  return result;
}

void release_surface_data(__IOSurface *a1)
{
  if (a1)
  {
    IOSurfaceUnlock(a1, 1u, 0);
    CFRelease(a1);
  }
}

uint64_t (*initSBFlashColor(uint64_t a1, float a2, float a3, float a4))()
{
  uint64_t (*result)();

  if (SpringBoardServicesLibrary_sOnce != -1)
    dispatch_once(&SpringBoardServicesLibrary_sOnce, &__block_literal_global_10556);
  result = (uint64_t (*)())dlsym((void *)SpringBoardServicesLibrary_sLib, "SBFlashColor");
  softLinkSBFlashColor = result;
  if (result)
    return (uint64_t (*)())((uint64_t (*)(uint64_t, float, float, float))result)(a1, a2, a3, a4);
  return result;
}

uint64_t (*initSBSSpringBoardServerPort())()
{
  uint64_t (*result)();

  if (SpringBoardServicesLibrary_sOnce != -1)
    dispatch_once(&SpringBoardServicesLibrary_sOnce, &__block_literal_global_10556);
  result = (uint64_t (*)())dlsym((void *)SpringBoardServicesLibrary_sLib, "SBSSpringBoardServerPort");
  softLinkSBSSpringBoardServerPort = result;
  if (result)
    return (uint64_t (*)())result();
  return result;
}

void sub_22D52A68C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getHKDisplayTypeControllerClass_block_invoke_10749(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!HealthUILibraryCore_frameworkLibrary_10750)
    HealthUILibraryCore_frameworkLibrary_10750 = _sl_dlopen();
  if (!HealthUILibraryCore_frameworkLibrary_10750)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *HealthUILibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFHKSampleContentItem.m"), 19, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("HKDisplayTypeController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getHKDisplayTypeControllerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFHKSampleContentItem.m"), 20, CFSTR("Unable to find class %s"), "HKDisplayTypeController");

LABEL_8:
    __break(1u);
  }
  getHKDisplayTypeControllerClass_softClass_10748 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_22D52B318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10794(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10795(uint64_t a1)
{

}

void sub_22D52C000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D52C308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D52C644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D52C890(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

id getMPMediaQueryClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getMPMediaQueryClass_softClass_10949;
  v7 = getMPMediaQueryClass_softClass_10949;
  if (!getMPMediaQueryClass_softClass_10949)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getMPMediaQueryClass_block_invoke_10950;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getMPMediaQueryClass_block_invoke_10950((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D52D544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getMPMediaQueryClass_block_invoke_10950(uint64_t a1)
{
  void *v2;
  void *v3;

  MediaPlayerLibrary_10951();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MPMediaQuery");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMPMediaQueryClass_softClass_10949 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMPMediaQueryClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFPlayMusicAction.m"), 32, CFSTR("Unable to find class %s"), "MPMediaQuery");

    __break(1u);
  }
}

void *MediaPlayerLibrary_10951()
{
  void *v0;
  void *v2;
  void *v3;

  if (!MediaPlayerLibraryCore_frameworkLibrary_10958)
    MediaPlayerLibraryCore_frameworkLibrary_10958 = _sl_dlopen();
  v0 = (void *)MediaPlayerLibraryCore_frameworkLibrary_10958;
  if (!MediaPlayerLibraryCore_frameworkLibrary_10958)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *MediaPlayerLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFPlayMusicAction.m"), 28, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void __getMPMusicPlayerControllerClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  MediaPlayerLibrary_10951();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MPMusicPlayerController");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMPMusicPlayerControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMPMusicPlayerControllerClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFPlayMusicAction.m"), 29, CFSTR("Unable to find class %s"), "MPMusicPlayerController");

    __break(1u);
  }
}

id getMPCAssistantCommandClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getMPCAssistantCommandClass_softClass;
  v7 = getMPCAssistantCommandClass_softClass;
  if (!getMPCAssistantCommandClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getMPCAssistantCommandClass_block_invoke;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getMPCAssistantCommandClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D52DCB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getMPCAssistantCommandClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  MediaPlaybackCoreLibrary_10966();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MPCAssistantCommand");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMPCAssistantCommandClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMPCAssistantCommandClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFPlayMusicAction.m"), 40, CFSTR("Unable to find class %s"), "MPCAssistantCommand");

    __break(1u);
  }
}

void MediaPlaybackCoreLibrary_10966()
{
  void *v0;
  void *v1;
  void *v2;

  if (!MediaPlaybackCoreLibraryCore_frameworkLibrary_10968)
    MediaPlaybackCoreLibraryCore_frameworkLibrary_10968 = _sl_dlopen();
  if (!MediaPlaybackCoreLibraryCore_frameworkLibrary_10968)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *MediaPlaybackCoreLibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("WFPlayMusicAction.m"), 39, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

void __getMPCAssistantStoreTracklistPlaybackQueueClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  MediaPlaybackCoreLibrary_10966();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MPCAssistantStoreTracklistPlaybackQueue");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMPCAssistantStoreTracklistPlaybackQueueClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMPCAssistantStoreTracklistPlaybackQueueClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFPlayMusicAction.m"), 41, CFSTR("Unable to find class %s"), "MPCAssistantStoreTracklistPlaybackQueue");

    __break(1u);
  }
}

void __getMPCAssistantQueryPlaybackQueueClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  MediaPlaybackCoreLibrary_10966();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MPCAssistantQueryPlaybackQueue");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMPCAssistantQueryPlaybackQueueClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMPCAssistantQueryPlaybackQueueClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFPlayMusicAction.m"), 42, CFSTR("Unable to find class %s"), "MPCAssistantQueryPlaybackQueue");

    __break(1u);
  }
}

void __getMPMediaPropertyPredicateClass_block_invoke_10977(uint64_t a1)
{
  void *v2;
  void *v3;

  MediaPlayerLibrary_10951();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MPMediaPropertyPredicate");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMPMediaPropertyPredicateClass_softClass_10976 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMPMediaPropertyPredicateClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFPlayMusicAction.m"), 34, CFSTR("Unable to find class %s"), "MPMediaPropertyPredicate");

    __break(1u);
  }
}

void __getMPPlaybackArchiveClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  MediaPlayerLibrary_10951();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MPPlaybackArchive");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMPPlaybackArchiveClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMPPlaybackArchiveClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFPlayMusicAction.m"), 31, CFSTR("Unable to find class %s"), "MPPlaybackArchive");

    __break(1u);
  }
}

void sub_22D52E850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getMPMediaItemCollectionClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  MediaPlayerLibrary_10951();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MPMediaItemCollection");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMPMediaItemCollectionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMPMediaItemCollectionClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFPlayMusicAction.m"), 30, CFSTR("Unable to find class %s"), "MPMediaItemCollection");

    __break(1u);
  }
}

void sub_22D52ED30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAVSystemControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!CelestialLibraryCore_frameworkLibrary)
    CelestialLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!CelestialLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CelestialLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFDevice+SystemSettings.m"), 23, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("AVSystemController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAVSystemControllerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFDevice+SystemSettings.m"), 24, CFSTR("Unable to find class %s"), "AVSystemController");

LABEL_8:
    __break(1u);
  }
  getAVSystemControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id WFPinboardGetSecretForUsername(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a1;
  WFKeychainWithIdentifier(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v5, 4);
  else
    v6 = 0;

  return v6;
}

WFKeychain *WFKeychainWithIdentifier(uint64_t a1)
{
  void *v1;
  WFKeychain *v2;
  WFKeychain *v3;

  objc_msgSend(CFSTR("is.workflow.my.app.pinboard.%@"), "stringByAppendingString:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = [WFKeychain alloc];
  v3 = -[WFKeychain initWithService:accessGroup:](v2, "initWithService:accessGroup:", v1, *MEMORY[0x24BE19960]);

  return v3;
}

uint64_t WFPinboardStoreSecretForUsername(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = a2;
  v6 = a1;
  WFKeychainWithIdentifier(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataUsingEncoding:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "setData:forKey:", v8, v6);
  return v9;
}

id WFRemoveNull(void *a1)
{
  id v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  void *v12;
  _QWORD v13[4];
  void *v14;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __WFRemoveNull_block_invoke;
    v13[3] = &unk_24F8B6280;
    v14 = v2;
    v3 = v2;
    objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v13);
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = v14;
LABEL_5:

    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x24BDAC760];
    v9 = 3221225472;
    v10 = __WFRemoveNull_block_invoke_2;
    v11 = &unk_24F8B2560;
    v12 = v6;
    v3 = v6;
    objc_msgSend(v1, "enumerateObjectsUsingBlock:", &v8);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v3, v8, v9, v10, v11);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = v12;
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = 0;
  else
    v4 = v1;
LABEL_6:

  return v4;
}

void WFConfigureRequestBodyWithFile(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  if (a2)
  {
    v3 = a2;
    v4 = a1;
    objc_msgSend(v3, "inputStream");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "fileSize");
    objc_msgSend(v3, "wfType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "MIMEType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    WFConfigureRequestBody(v4, (uint64_t)v8, v5, v7, 0);

  }
}

void WFConfigureRequestBody(void *a1, uint64_t a2, uint64_t a3, void *a4, int a5)
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a1;
  v9 = a4;
  objc_msgSend(v13, "setHTTPBodyStream:", a2);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lld"), a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
  {
    objc_msgSend(v13, "setValue:forHTTPHeaderField:", v10, CFSTR("Content-Length"));
    objc_msgSend(v13, "setValue:forHTTPHeaderField:", v9, CFSTR("Content-Type"));
  }
  else
  {
    objc_msgSend(v13, "valueForHTTPHeaderField:", CFSTR("Content-Length"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      objc_msgSend(v13, "addValue:forHTTPHeaderField:", v10, CFSTR("Content-Length"));
    objc_msgSend(v13, "valueForHTTPHeaderField:", CFSTR("Content-Type"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      objc_msgSend(v13, "addValue:forHTTPHeaderField:", v9, CFSTR("Content-Type"));
  }

}

id getPDFDocumentClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getPDFDocumentClass_softClass;
  v7 = getPDFDocumentClass_softClass;
  if (!getPDFDocumentClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getPDFDocumentClass_block_invoke;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getPDFDocumentClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D540018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPDFDocumentClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!PDFKitLibraryCore_frameworkLibrary)
    PDFKitLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!PDFKitLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *PDFKitLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFSplitPDFAction.m"), 15, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("PDFDocument");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getPDFDocumentClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFSplitPDFAction.m"), 16, CFSTR("Unable to find class %s"), "PDFDocument");

LABEL_8:
    __break(1u);
  }
  getPDFDocumentClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id WFReadableCharacteristicTypeBiologicalSex()
{
  return WFLocalizedContentPropertyNameMarker(CFSTR("Biological Sex"));
}

id WFReadableCharacteristicTypeBloodType()
{
  return WFLocalizedContentPropertyNameMarker(CFSTR("Blood Type"));
}

id WFReadableCharacteristicTypeDateOfBirth()
{
  return WFLocalizedContentPropertyNameMarker(CFSTR("Date of Birth"));
}

id WFReadableCharacteristicTypeWheelchairUse()
{
  return WFLocalizedContentPropertyNameMarker(CFSTR("Wheelchair Use"));
}

id WFHealthKitAllAvailableUnits()
{
  if (WFHealthKitAllAvailableUnits_onceToken != -1)
    dispatch_once(&WFHealthKitAllAvailableUnits_onceToken, &__block_literal_global_12569);
  return (id)WFHealthKitAllAvailableUnits_units;
}

id WFHealthKitReadableCharacteristicTypeToCharacteristicTypeIdentifierDictionary()
{
  if (WFHealthKitReadableCharacteristicTypeToCharacteristicTypeIdentifierDictionary_onceToken != -1)
    dispatch_once(&WFHealthKitReadableCharacteristicTypeToCharacteristicTypeIdentifierDictionary_onceToken, &__block_literal_global_326);
  return (id)WFHealthKitReadableCharacteristicTypeToCharacteristicTypeIdentifierDictionary_dictionary;
}

id WFHealthKitReadableCharacteristicTypes()
{
  if (WFHealthKitReadableCharacteristicTypes_onceToken != -1)
    dispatch_once(&WFHealthKitReadableCharacteristicTypes_onceToken, &__block_literal_global_327);
  return (id)WFHealthKitReadableCharacteristicTypes_readableTypes;
}

id WFHealthKitReadableSampleTypeToSampleTypeIdentifierDictionary()
{
  if (WFHealthKitReadableSampleTypeToSampleTypeIdentifierDictionary_onceToken != -1)
    dispatch_once(&WFHealthKitReadableSampleTypeToSampleTypeIdentifierDictionary_onceToken, &__block_literal_global_329);
  return (id)WFHealthKitReadableSampleTypeToSampleTypeIdentifierDictionary_dictionary;
}

id WFHealthKitQuantityTypeIdentifiers()
{
  if (WFHealthKitQuantityTypeIdentifiers_onceToken != -1)
    dispatch_once(&WFHealthKitQuantityTypeIdentifiers_onceToken, &__block_literal_global_662);
  return (id)WFHealthKitQuantityTypeIdentifiers_identifiers;
}

id WFHealthKitSymptomsTypeIdentifiers()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v20[40];

  v20[39] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BDD2848];
  v20[0] = *MEMORY[0x24BDD2840];
  v20[1] = v0;
  v1 = *MEMORY[0x24BDD2868];
  v20[2] = *MEMORY[0x24BDD2850];
  v20[3] = v1;
  v2 = *MEMORY[0x24BDD2888];
  v20[4] = *MEMORY[0x24BDD2880];
  v20[5] = v2;
  v3 = *MEMORY[0x24BDD28A0];
  v20[6] = *MEMORY[0x24BDD2898];
  v20[7] = v3;
  v4 = *MEMORY[0x24BDD28B8];
  v20[8] = *MEMORY[0x24BDD28A8];
  v20[9] = v4;
  v5 = *MEMORY[0x24BDD28C8];
  v20[10] = *MEMORY[0x24BDD28C0];
  v20[11] = v5;
  v6 = *MEMORY[0x24BDD28E0];
  v20[12] = *MEMORY[0x24BDD28D0];
  v20[13] = v6;
  v7 = *MEMORY[0x24BDD28F0];
  v20[14] = *MEMORY[0x24BDD28E8];
  v20[15] = v7;
  v8 = *MEMORY[0x24BDD2900];
  v20[16] = *MEMORY[0x24BDD28F8];
  v20[17] = v8;
  v9 = *MEMORY[0x24BDD2928];
  v20[18] = *MEMORY[0x24BDD2910];
  v20[19] = v9;
  v10 = *MEMORY[0x24BDD2968];
  v20[20] = *MEMORY[0x24BDD2938];
  v20[21] = v10;
  v11 = *MEMORY[0x24BDD2988];
  v20[22] = *MEMORY[0x24BDD2970];
  v20[23] = v11;
  v12 = *MEMORY[0x24BDD29A8];
  v20[24] = *MEMORY[0x24BDD2990];
  v20[25] = v12;
  v13 = *MEMORY[0x24BDD29B8];
  v20[26] = *MEMORY[0x24BDD29B0];
  v20[27] = v13;
  v14 = *MEMORY[0x24BDD29F8];
  v20[28] = *MEMORY[0x24BDD29C8];
  v20[29] = v14;
  v15 = *MEMORY[0x24BDD2A10];
  v20[30] = *MEMORY[0x24BDD2A00];
  v20[31] = v15;
  v16 = *MEMORY[0x24BDD2A20];
  v20[32] = *MEMORY[0x24BDD2A18];
  v20[33] = v16;
  v17 = *MEMORY[0x24BDD2A40];
  v20[34] = *MEMORY[0x24BDD2A38];
  v20[35] = v17;
  v18 = *MEMORY[0x24BDD2A58];
  v20[36] = *MEMORY[0x24BDD2A50];
  v20[37] = v18;
  v20[38] = *MEMORY[0x24BDD2A60];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 39);
  return (id)objc_claimAutoreleasedReturnValue();
}

id WFHealthKitSampleTypeIdentifiers()
{
  if (WFHealthKitSampleTypeIdentifiers_onceToken != -1)
    dispatch_once(&WFHealthKitSampleTypeIdentifiers_onceToken, &__block_literal_global_663);
  return (id)WFHealthKitSampleTypeIdentifiers_identifiers;
}

id WFHealthKitReadableSampleTypes()
{
  if (WFHealthKitReadableSampleTypes_onceToken != -1)
    dispatch_once(&WFHealthKitReadableSampleTypes_onceToken, &__block_literal_global_665);
  return (id)WFHealthKitReadableSampleTypes_readableTypes;
}

id WFHealthKitSampleTypeIdentifierToReadableSampleTypeDictionary()
{
  if (WFHealthKitSampleTypeIdentifierToReadableSampleTypeDictionary_onceToken != -1)
    dispatch_once(&WFHealthKitSampleTypeIdentifierToReadableSampleTypeDictionary_onceToken, &__block_literal_global_1024);
  return (id)WFHealthKitSampleTypeIdentifierToReadableSampleTypeDictionary_dictionary;
}

id WFHealthKitLocalizedSampleTypes()
{
  if (WFHealthKitLocalizedSampleTypes_onceToken != -1)
    dispatch_once(&WFHealthKitLocalizedSampleTypes_onceToken, &__block_literal_global_667);
  return (id)WFHealthKitLocalizedSampleTypes_localizedTypes;
}

id WFHealthKitReadableWorkoutActivityTypeToWorkoutActivityTypeDictionary()
{
  if (WFHealthKitReadableWorkoutActivityTypeToWorkoutActivityTypeDictionary_onceToken != -1)
    dispatch_once(&WFHealthKitReadableWorkoutActivityTypeToWorkoutActivityTypeDictionary_onceToken, &__block_literal_global_674);
  return (id)WFHealthKitReadableWorkoutActivityTypeToWorkoutActivityTypeDictionary_dictionary;
}

id WFHealthKitReadableWorkoutActivityTypes()
{
  if (WFHealthKitReadableWorkoutActivityTypes_onceToken != -1)
    dispatch_once(&WFHealthKitReadableWorkoutActivityTypes_onceToken, &__block_literal_global_933);
  return (id)WFHealthKitReadableWorkoutActivityTypes_readableTypes;
}

id WFHealthKitReadableCervicalMucusQualityToEnumDictionary()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  _QWORD v8[6];

  v8[5] = *MEMORY[0x24BDAC8D0];
  WFLocalizedParameterValueMarker(CFSTR("Dry"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v0;
  v8[0] = &unk_24F93A2B0;
  WFLocalizedParameterValueMarker(CFSTR("Sticky"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v1;
  v8[1] = &unk_24F93A2C8;
  WFLocalizedParameterValueMarker(CFSTR("Creamy"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v2;
  v8[2] = &unk_24F93A2E0;
  WFLocalizedParameterValueMarker(CFSTR("Watery"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[3] = v3;
  v8[3] = &unk_24F93A2F8;
  WFLocalizedParameterValueMarker(CFSTR("Egg White"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[4] = v4;
  v8[4] = &unk_24F93A310;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id WFHealthKitReadableAppleStandingHourToEnumDictionary()
{
  void *v0;
  void *v1;
  void *v2;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  WFLocalizedParameterValueMarker(CFSTR("Stood"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  v5[0] = &unk_24F93A328;
  WFLocalizedParameterValueMarker(CFSTR("Idle"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = v1;
  v5[1] = &unk_24F93A2B0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id WFHealthKitReadableMenstrualFlowToEnumDictionary()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x24BDAC8D0];
  WFLocalizedParameterValueMarker(CFSTR("Unspecified"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v0;
  v7[0] = &unk_24F93A2B0;
  WFLocalizedParameterValueMarker(CFSTR("Light"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v1;
  v7[1] = &unk_24F93A2C8;
  WFLocalizedParameterValueMarker(CFSTR("Medium"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = v2;
  v7[2] = &unk_24F93A2E0;
  WFLocalizedParameterValueMarker(CFSTR("Heavy"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[3] = v3;
  v7[3] = &unk_24F93A2F8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id WFHealthKitReadableMenstrualFlowIsStartOfCycleToBoolDictionary()
{
  void *v0;
  void *v1;
  void *v2;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  WFLocalizedParameterValueMarker(CFSTR("Yes"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  v5[0] = MEMORY[0x24BDBD1C8];
  WFLocalizedParameterValueMarker(CFSTR("No"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = v1;
  v5[1] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id WFHealthKitReadableOvulationTestResultToEnumDictionary()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x24BDAC8D0];
  WFLocalizedParameterValueMarker(CFSTR("Negative"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v0;
  v7[0] = &unk_24F93A2B0;
  WFLocalizedParameterValueMarker(CFSTR("Luteinizing Hormone Surge"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v1;
  v7[1] = &unk_24F93A2C8;
  WFLocalizedParameterValueMarker(CFSTR("Estrogen Surge"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = v2;
  v7[2] = &unk_24F93A2F8;
  WFLocalizedParameterValueMarker(CFSTR("Indeterminate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[3] = v3;
  v7[3] = &unk_24F93A2E0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id WFHealthKitReadableSleepAnalysisToEnumDictionary()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[6];
  _QWORD v9[7];

  v9[6] = *MEMORY[0x24BDAC8D0];
  WFLocalizedParameterValueMarker(CFSTR("In Bed"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v0;
  v9[0] = &unk_24F93A328;
  WFLocalizedParameterValueMarker(CFSTR("Asleep"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v1;
  v9[1] = &unk_24F93A2B0;
  WFLocalizedParameterValueMarker(CFSTR("Awake"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v2;
  v9[2] = &unk_24F93A2C8;
  WFLocalizedParameterValueMarker(CFSTR("Core"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v3;
  v9[3] = &unk_24F93A2E0;
  WFLocalizedParameterValueMarker(CFSTR("Deep"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[4] = v4;
  v9[4] = &unk_24F93A2F8;
  WFLocalizedParameterValueMarker(CFSTR("REM"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[5] = v5;
  v9[5] = &unk_24F93A310;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id WFHealthKitReadableAppetiteChangesToEnumDictionary()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x24BDAC8D0];
  WFLocalizedParameterValueMarker(CFSTR("Increased"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v0;
  v7[0] = &unk_24F93A2E0;
  WFLocalizedParameterValueMarker(CFSTR("Decreased"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v1;
  v7[1] = &unk_24F93A2C8;
  WFLocalizedParameterValueMarker(CFSTR("No Change"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = v2;
  v7[2] = &unk_24F93A2B0;
  WFLocalizedParameterValueMarker(CFSTR("Present"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[3] = v3;
  v7[3] = &unk_24F93A328;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id WFHealthKitReadablePresenceToEnumDictionary()
{
  void *v0;
  void *v1;
  void *v2;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  WFLocalizedParameterValueMarker(CFSTR("Present"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  v5[0] = &unk_24F93A328;
  WFLocalizedParameterValueMarker(CFSTR("Not Present"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = v1;
  v5[1] = &unk_24F93A2B0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id WFHealthKitReadableSeverityToEnumDictionary()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  _QWORD v8[6];

  v8[5] = *MEMORY[0x24BDAC8D0];
  WFLocalizedParameterValueMarker(CFSTR("Severe"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v0;
  v8[0] = &unk_24F93A2F8;
  WFLocalizedParameterValueMarker(CFSTR("Moderate"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v1;
  v8[1] = &unk_24F93A2E0;
  WFLocalizedParameterValueMarker(CFSTR("Mild"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v2;
  v8[2] = &unk_24F93A2C8;
  WFLocalizedParameterValueMarker(CFSTR("Present"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[3] = v3;
  v8[3] = &unk_24F93A328;
  WFLocalizedParameterValueMarker(CFSTR("Not Present"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[4] = v4;
  v8[4] = &unk_24F93A2B0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id WFHealthKitReadableSexualActivityToBoolDictionary()
{
  void *v0;
  void *v1;
  void *v2;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  WFLocalizedParameterValueMarker(CFSTR("Protection Used"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  v5[0] = MEMORY[0x24BDBD1C8];
  WFLocalizedParameterValueMarker(CFSTR("Protection Unused"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = v1;
  v5[1] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id WFHealthKitReadableInsulinDeliveryReasonToEnumDictionary()
{
  void *v0;
  void *v1;
  void *v2;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  WFLocalizedParameterValueMarker(CFSTR("Basal"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  v5[0] = &unk_24F93A2B0;
  WFLocalizedParameterValueMarker(CFSTR("Bolus"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = v1;
  v5[1] = &unk_24F93A2C8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id WFHealthKitReadableBloodGlucoseMealTimeToEnumDictionary()
{
  void *v0;
  void *v1;
  void *v2;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  WFLocalizedParameterValueMarker(CFSTR("Before Meal"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  v5[0] = &unk_24F93A2B0;
  WFLocalizedParameterValueMarker(CFSTR("After Meal"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = v1;
  v5[1] = &unk_24F93A2C8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id WFHealthKitReadableVO2MaxTestTypeToEnumDictionary()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  WFLocalizedParameterValueMarker(CFSTR("Max Exercise Test"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v0;
  v6[0] = &unk_24F93A2B0;
  WFLocalizedParameterValueMarker(CFSTR("Sub-Max Exercise Prediction"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  v6[1] = &unk_24F93A2C8;
  WFLocalizedParameterValueMarker(CFSTR("Non-Exercise Prediction"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2] = v2;
  v6[2] = &unk_24F93A2E0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void sub_22D544318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getMPMediaQueryClass_block_invoke_12884(uint64_t a1)
{
  void *v2;
  void *v3;

  MediaPlayerLibrary_12888();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MPMediaQuery");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMPMediaQueryClass_softClass_12883 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMPMediaQueryClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFPlaylistPickerParameter.m"), 21, CFSTR("Unable to find class %s"), "MPMediaQuery");

    __break(1u);
  }
}

void sub_22D54468C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getMPMediaPlaylistClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  MediaPlayerLibrary_12888();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MPMediaPlaylist");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMPMediaPlaylistClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMPMediaPlaylistClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFPlaylistPickerParameter.m"), 22, CFSTR("Unable to find class %s"), "MPMediaPlaylist");

    __break(1u);
  }
}

void *MediaPlayerLibrary_12888()
{
  void *v0;
  void *v2;
  void *v3;

  if (!MediaPlayerLibraryCore_frameworkLibrary_12896)
    MediaPlayerLibraryCore_frameworkLibrary_12896 = _sl_dlopen();
  v0 = (void *)MediaPlayerLibraryCore_frameworkLibrary_12896;
  if (!MediaPlayerLibraryCore_frameworkLibrary_12896)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *MediaPlayerLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFPlaylistPickerParameter.m"), 19, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

id getMPMediaLibraryClass_12905()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getMPMediaLibraryClass_softClass_12906;
  v7 = getMPMediaLibraryClass_softClass_12906;
  if (!getMPMediaLibraryClass_softClass_12906)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getMPMediaLibraryClass_block_invoke_12907;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getMPMediaLibraryClass_block_invoke_12907((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D54490C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getMPMediaLibraryClass_block_invoke_12907(uint64_t a1)
{
  void *v2;
  void *v3;

  MediaPlayerLibrary_12888();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MPMediaLibrary");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMPMediaLibraryClass_softClass_12906 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMPMediaLibraryClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFPlaylistPickerParameter.m"), 20, CFSTR("Unable to find class %s"), "MPMediaLibrary");

    __break(1u);
  }
}

void getMPMediaLibraryDidChangeNotification()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getMPMediaLibraryDidChangeNotificationSymbolLoc_ptr;
  v8 = getMPMediaLibraryDidChangeNotificationSymbolLoc_ptr;
  if (!getMPMediaLibraryDidChangeNotificationSymbolLoc_ptr)
  {
    v1 = MediaPlayerLibrary_12888();
    v0 = (id *)dlsym(v1, "MPMediaLibraryDidChangeNotification");
    v6[3] = (uint64_t)v0;
    getMPMediaLibraryDidChangeNotificationSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMPMediaLibraryDidChangeNotification(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFPlaylistPickerParameter.m"), 23, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_22D544AC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D546934(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getMPAVRoutingControllerErrorDomainSymbolLoc_block_invoke(_QWORD *a1)
{
  void *v2;
  void *result;
  void *v4;

  if (!MediaPlayerLibraryCore_frameworkLibrary_13324)
    MediaPlayerLibraryCore_frameworkLibrary_13324 = _sl_dlopen();
  v2 = (void *)MediaPlayerLibraryCore_frameworkLibrary_13324;
  if (!MediaPlayerLibraryCore_frameworkLibrary_13324)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *MediaPlayerLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFChangePlaybackDestinationAction.m"), 17, CFSTR("%s"), 0);

    __break(1u);
    free(v4);
  }
  result = dlsym(v2, "MPAVRoutingControllerErrorDomain");
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  getMPAVRoutingControllerErrorDomainSymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  return result;
}

void sub_22D547C38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D54A924(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 184), 8);
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13982(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13983(uint64_t a1)
{

}

void sub_22D54B458(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__14136(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14137(uint64_t a1)
{

}

void sub_22D54DBB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D54DD98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D54E064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *NetrbLibrary()
{
  void *v0;
  void *v2;
  void *v3;

  if (!NetrbLibraryCore_frameworkLibrary)
    NetrbLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = (void *)NetrbLibraryCore_frameworkLibrary;
  if (!NetrbLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *NetrbLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFPersonalHotspotSettingsClient.m"), 19, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void sub_22D54E33C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D5503C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__14600(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14601(uint64_t a1)
{

}

void WFConfigureAudioRoutesForUserInterface(void *a1, void *a2)
{
  id v3;
  void (**v4)(_QWORD);
  void *v5;
  uint64_t v6;
  void *v7;
  void (**v8)(_QWORD);

  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v3, "isRunningWithSiriUI")
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v3, "airPlayRouteIDs"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v6))
  {
    objc_msgSend(v3, "airPlayRouteIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v4;
    INCRouteAudioToAirplayOutputDevices();

  }
  else
  {
    v4[2](v4);
  }

}

uint64_t WFStreamClientCallback(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "handleStreamEvent:", a2);
}

id getWFReversibleActionsLogObject()
{
  if (getWFReversibleActionsLogObject_onceToken != -1)
    dispatch_once(&getWFReversibleActionsLogObject_onceToken, &__block_literal_global_16028);
  return (id)getWFReversibleActionsLogObject_log;
}

void __getWFReversibleActionsLogObject_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x24BEC1968], "ReversibleActions");
  v1 = (void *)getWFReversibleActionsLogObject_log;
  getWFReversibleActionsLogObject_log = (uint64_t)v0;

}

void sub_22D55B990(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22D55BA5C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22D55BAE8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22D55BB78(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id generateBaseString(void *a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v9 = (void *)MEMORY[0x24BDBCED8];
  v10 = a5;
  v11 = a4;
  v12 = a2;
  v13 = a1;
  objc_msgSend(v9, "dictionaryWithDictionary:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addEntriesFromDictionary:", v11);

  objc_msgSend(v14, "addEntriesFromDictionary:", v10);
  TMDictionaryToQueryString(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x24BDD17C8];
  TMURLEncode(v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  TMURLEncode(v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@&%@&%@"), v12, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

id sign(void *a1, uint64_t a2, const __CFString *a3)
{
  void *v4;
  const __CFString *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x24BDD17C8];
  if (a3)
    v5 = a3;
  else
    v5 = &stru_24F8BBA48;
  v6 = a1;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@&%@"), a2, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HMACSHA1(v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "base64EncodedStringWithOptions:", 0);
  else
    objc_msgSend(v8, "base64Encoding");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id HMACSHA1(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  const void *v8;
  size_t v9;
  id v10;
  void *v11;

  v3 = a2;
  objc_msgSend(a1, "dataUsingEncoding:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = malloc_type_malloc(0x14uLL, 0xE3B29A8AuLL);
  v7 = objc_retainAutorelease(v5);
  v8 = (const void *)objc_msgSend(v7, "bytes");
  v9 = objc_msgSend(v7, "length");
  v10 = objc_retainAutorelease(v4);
  CCHmac(0, v8, v9, (const void *)objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), v6);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v6, 20, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t UNIXTimestamp(void *a1)
{
  void *v1;
  double v2;

  v1 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "timeIntervalSince1970");
  return objc_msgSend(v1, "stringWithFormat:", CFSTR("%f"), round(v2));
}

void sub_22D55D41C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D55D78C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D55D9F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D55E1D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D55E414(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *AVFoundationLibrary()
{
  void *v0;
  void *v2;
  void *v3;

  if (!AVFoundationLibraryCore_frameworkLibrary_16405)
    AVFoundationLibraryCore_frameworkLibrary_16405 = _sl_dlopen();
  v0 = (void *)AVFoundationLibraryCore_frameworkLibrary_16405;
  if (!AVFoundationLibraryCore_frameworkLibrary_16405)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *AVFoundationLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFSpeechSynthesizer.m"), 30, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void __getAVSpeechUtteranceClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  AVFoundationLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AVSpeechUtterance");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVSpeechUtteranceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAVSpeechUtteranceClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFSpeechSynthesizer.m"), 36, CFSTR("Unable to find class %s"), "AVSpeechUtterance");

    __break(1u);
  }
}

void __getVSSpeechRequestClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  VoiceServicesLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("VSSpeechRequest");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getVSSpeechRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getVSSpeechRequestClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFSpeechSynthesizer.m"), 57, CFSTR("Unable to find class %s"), "VSSpeechRequest");

    __break(1u);
  }
}

void VoiceServicesLibrary()
{
  void *v0;
  void *v1;
  void *v2;

  if (!VoiceServicesLibraryCore_frameworkLibrary)
    VoiceServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!VoiceServicesLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *VoiceServicesLibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("WFSpeechSynthesizer.m"), 55, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

void __getVSSpeechSynthesizerClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  VoiceServicesLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("VSSpeechSynthesizer");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getVSSpeechSynthesizerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getVSSpeechSynthesizerClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFSpeechSynthesizer.m"), 56, CFSTR("Unable to find class %s"), "VSSpeechSynthesizer");

    __break(1u);
  }
}

void __getAVSpeechSynthesizerClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  AVFoundationLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AVSpeechSynthesizer");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVSpeechSynthesizerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAVSpeechSynthesizerClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFSpeechSynthesizer.m"), 35, CFSTR("Unable to find class %s"), "AVSpeechSynthesizer");

    __break(1u);
  }
}

id getWFTextToSpeechLogObject()
{
  if (getWFTextToSpeechLogObject_onceToken != -1)
    dispatch_once(&getWFTextToSpeechLogObject_onceToken, &__block_literal_global_16442);
  return (id)getWFTextToSpeechLogObject_log;
}

void sub_22D55F0FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
}

void __getAVAudioFileClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  AVFoundationLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AVAudioFile");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVAudioFileClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAVAudioFileClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFSpeechSynthesizer.m"), 31, CFSTR("Unable to find class %s"), "AVAudioFile");

    __break(1u);
  }
}

void sub_22D55F344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getAVAudioPCMBufferClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  AVFoundationLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AVAudioPCMBuffer");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVAudioPCMBufferClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAVAudioPCMBufferClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFSpeechSynthesizer.m"), 32, CFSTR("Unable to find class %s"), "AVAudioPCMBuffer");

    __break(1u);
  }
}

void __getWFTextToSpeechLogObject_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x24BEC1968], "TextToSpeech");
  v1 = (void *)getWFTextToSpeechLogObject_log;
  getWFTextToSpeechLogObject_log = (uint64_t)v0;

}

void sub_22D56053C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22D562E84(void *a1, int a2)
{
  void *v2;

  objc_begin_catch(a1);
  if (a2 == 2)
  {
    objc_end_catch();
    JUMPOUT(0x22D562E64);
  }

  objc_exception_rethrow();
}

void sub_22D562EA8(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_22D565AB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__17300(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17301(uint64_t a1)
{

}

void sub_22D566310(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D566A08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getFIUIWorkoutActivityTypeClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getFIUIWorkoutActivityTypeClass_softClass;
  v7 = getFIUIWorkoutActivityTypeClass_softClass;
  if (!getFIUIWorkoutActivityTypeClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getFIUIWorkoutActivityTypeClass_block_invoke;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getFIUIWorkoutActivityTypeClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D566DE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getFIUIWorkoutActivityTypeClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  FitnessUILibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("FIUIWorkoutActivityType");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getFIUIWorkoutActivityTypeClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getFIUIWorkoutActivityTypeClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFFitnessUIHelper.m"), 17, CFSTR("Unable to find class %s"), "FIUIWorkoutActivityType");

    __break(1u);
  }
}

void *FitnessUILibrary()
{
  void *v0;
  void *v2;
  void *v3;

  if (!FitnessUILibraryCore_frameworkLibrary)
    FitnessUILibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = (void *)FitnessUILibraryCore_frameworkLibrary;
  if (!FitnessUILibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *FitnessUILibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFFitnessUIHelper.m"), 16, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void WFAddContentToPlaylist(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[3];

  v28[2] = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2050000000;
  v8 = (void *)getMPMediaLibraryClass_softClass_17526;
  v27 = getMPMediaLibraryClass_softClass_17526;
  v9 = MEMORY[0x24BDAC760];
  if (!getMPMediaLibraryClass_softClass_17526)
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __getMPMediaLibraryClass_block_invoke_17527;
    v23[3] = &unk_24F8BB430;
    v23[4] = &v24;
    __getMPMediaLibraryClass_block_invoke_17527((uint64_t)v23);
    v8 = (void *)v25[3];
  }
  v10 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v24, 8);
  objc_msgSend(v10, "defaultMediaLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_opt_new();
  v28[0] = objc_opt_class();
  v28[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __WFAddContentToPlaylist_block_invoke;
  v18[3] = &unk_24F8B3B70;
  v19 = v12;
  v20 = v5;
  v21 = v11;
  v22 = v7;
  v14 = v11;
  v15 = v5;
  v16 = v12;
  v17 = v7;
  objc_msgSend(v6, "generateCollectionByCoercingToItemClasses:completionHandler:", v13, v18);

}

void sub_22D568108(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getMPMediaLibraryClass_block_invoke_17527(uint64_t a1)
{
  void *v2;
  void *v3;

  MediaPlayerLibrary_17536();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MPMediaLibrary");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMPMediaLibraryClass_softClass_17526 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMPMediaLibraryClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFAddToPlaylistAction.m"), 21, CFSTR("Unable to find class %s"), "MPMediaLibrary");

    __break(1u);
  }
}

void sub_22D568660(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void getMPErrorDomain()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getMPErrorDomainSymbolLoc_ptr;
  v8 = getMPErrorDomainSymbolLoc_ptr;
  if (!getMPErrorDomainSymbolLoc_ptr)
  {
    v1 = MediaPlayerLibrary_17536();
    v0 = (id *)dlsym(v1, "MPErrorDomain");
    v6[3] = (uint64_t)v0;
    getMPErrorDomainSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMPErrorDomain(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFAddToPlaylistAction.m"), 26, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_22D568A48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *MediaPlayerLibrary_17536()
{
  void *v0;
  void *v2;
  void *v3;

  if (!MediaPlayerLibraryCore_frameworkLibrary_17543)
    MediaPlayerLibraryCore_frameworkLibrary_17543 = _sl_dlopen();
  v0 = (void *)MediaPlayerLibraryCore_frameworkLibrary_17543;
  if (!MediaPlayerLibraryCore_frameworkLibrary_17543)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *MediaPlayerLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFAddToPlaylistAction.m"), 20, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void __getMPMediaItemClass_block_invoke_17549(uint64_t a1)
{
  void *v2;
  void *v3;

  MediaPlayerLibrary_17536();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MPMediaItem");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMPMediaItemClass_softClass_17548 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMPMediaItemClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFAddToPlaylistAction.m"), 22, CFSTR("Unable to find class %s"), "MPMediaItem");

    __break(1u);
  }
}

void sub_22D569168(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22D5695F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getMPMediaPropertyPredicateClass_block_invoke_17556(uint64_t a1)
{
  void *v2;
  void *v3;

  MediaPlayerLibrary_17536();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MPMediaPropertyPredicate");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMPMediaPropertyPredicateClass_softClass_17555 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMPMediaPropertyPredicateClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFAddToPlaylistAction.m"), 24, CFSTR("Unable to find class %s"), "MPMediaPropertyPredicate");

    __break(1u);
  }
}

void __getMPMediaQueryClass_block_invoke_17562(uint64_t a1)
{
  void *v2;
  void *v3;

  MediaPlayerLibrary_17536();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MPMediaQuery");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMPMediaQueryClass_softClass_17561 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMPMediaQueryClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFAddToPlaylistAction.m"), 23, CFSTR("Unable to find class %s"), "MPMediaQuery");

    __break(1u);
  }
}

void sub_22D569D64(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

Class __getMPMediaItemClass_block_invoke_17608(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!MediaPlayerLibraryCore_frameworkLibrary_17613)
    MediaPlayerLibraryCore_frameworkLibrary_17613 = _sl_dlopen();
  if (!MediaPlayerLibraryCore_frameworkLibrary_17613)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *MediaPlayerLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFAddMusicToUpNextAction.m"), 17, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("MPMediaItem");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMPMediaItemClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFAddMusicToUpNextAction.m"), 18, CFSTR("Unable to find class %s"), "MPMediaItem");

LABEL_8:
    __break(1u);
  }
  getMPMediaItemClass_softClass_17607 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_22D56A6FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getMPAVRoutingControllerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getMPAVRoutingControllerClass_softClass;
  v7 = getMPAVRoutingControllerClass_softClass;
  if (!getMPAVRoutingControllerClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getMPAVRoutingControllerClass_block_invoke;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getMPAVRoutingControllerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D56AA00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getMPAVRoutingControllerClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  MediaPlayerLibrary_17683();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MPAVRoutingController");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMPAVRoutingControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMPAVRoutingControllerClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFMediaRoutePickerParameter.m"), 21, CFSTR("Unable to find class %s"), "MPAVRoutingController");

    __break(1u);
  }
}

void MediaPlayerLibrary_17683()
{
  void *v0;
  void *v1;
  void *v2;

  if (!MediaPlayerLibraryCore_frameworkLibrary_17688)
    MediaPlayerLibraryCore_frameworkLibrary_17688 = _sl_dlopen();
  if (!MediaPlayerLibraryCore_frameworkLibrary_17688)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *MediaPlayerLibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("WFMediaRoutePickerParameter.m"), 20, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

uint64_t __Block_byref_object_copy__17693(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17694(uint64_t a1)
{

}

void sub_22D56AD34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

WFMediaRouteState *WFGetLocalDeviceMediaRoute()
{
  WFMediaRouteDescriptor *v0;
  WFMediaRouteState *v1;

  v0 = -[WFMediaRouteDescriptor initWithRouteUID:groupUID:routeName:isLocalDevice:]([WFMediaRouteDescriptor alloc], "initWithRouteUID:groupUID:routeName:isLocalDevice:", CFSTR("Speaker"), 0, 0, 1);
  v1 = -[WFVariableSubstitutableParameterState initWithValue:]([WFMediaRouteState alloc], "initWithValue:", v0);

  return v1;
}

void __getMPAVOutputDeviceRouteClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  MediaPlayerLibrary_17683();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MPAVOutputDeviceRoute");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMPAVOutputDeviceRouteClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMPAVOutputDeviceRouteClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFMediaRoutePickerParameter.m"), 22, CFSTR("Unable to find class %s"), "MPAVOutputDeviceRoute");

    __break(1u);
  }
}

void sub_22D56B908(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

Class __getMKMapItemClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!MapKitLibraryCore_frameworkLibrary)
    MapKitLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!MapKitLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *MapKitLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFShowInBlindSquareAction.m"), 13, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("MKMapItem");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMKMapItemClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFShowInBlindSquareAction.m"), 14, CFSTR("Unable to find class %s"), "MKMapItem");

LABEL_8:
    __break(1u);
  }
  getMKMapItemClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getCLPlacemarkClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCLPlacemarkClass_softClass;
  v7 = getCLPlacemarkClass_softClass;
  if (!getCLPlacemarkClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getCLPlacemarkClass_block_invoke;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getCLPlacemarkClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D56BB5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCLLocationClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCLLocationClass_softClass_17945;
  v7 = getCLLocationClass_softClass_17945;
  if (!getCLLocationClass_softClass_17945)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getCLLocationClass_block_invoke_17946;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getCLLocationClass_block_invoke_17946((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D56BDCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getCLLocationClass_block_invoke_17946(uint64_t a1)
{
  void *v2;
  void *v3;

  CoreLocationLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("CLLocation");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCLLocationClass_softClass_17945 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCLLocationClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFShowInBlindSquareAction.m"), 18, CFSTR("Unable to find class %s"), "CLLocation");

    __break(1u);
  }
}

void CoreLocationLibrary()
{
  void *v0;
  void *v1;
  void *v2;

  if (!CoreLocationLibraryCore_frameworkLibrary_17954)
    CoreLocationLibraryCore_frameworkLibrary_17954 = _sl_dlopen();
  if (!CoreLocationLibraryCore_frameworkLibrary_17954)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CoreLocationLibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("WFShowInBlindSquareAction.m"), 16, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

void __getCLPlacemarkClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  CoreLocationLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("CLPlacemark");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCLPlacemarkClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCLPlacemarkClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFShowInBlindSquareAction.m"), 17, CFSTR("Unable to find class %s"), "CLPlacemark");

    __break(1u);
  }
}

void sub_22D56CC84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
  _Block_object_dispose(&a59, 8);
  _Unwind_Resume(a1);
}

void sub_22D56CF60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__18115(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__18116(uint64_t a1)
{

}

id getAVAudioSessionClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getAVAudioSessionClass_softClass;
  v7 = getAVAudioSessionClass_softClass;
  if (!getAVAudioSessionClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getAVAudioSessionClass_block_invoke;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getAVAudioSessionClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D570E7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getAVAudioSessionClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  AVFoundationLibrary_18279();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AVAudioSession");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVAudioSessionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAVAudioSessionClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFSpeakTextAction.m"), 18, CFSTR("Unable to find class %s"), "AVAudioSession");

    __break(1u);
  }
}

void *AVFoundationLibrary_18279()
{
  void *v0;
  void *v2;
  void *v3;

  if (!AVFoundationLibraryCore_frameworkLibrary_18287)
    AVFoundationLibraryCore_frameworkLibrary_18287 = _sl_dlopen();
  v0 = (void *)AVFoundationLibraryCore_frameworkLibrary_18287;
  if (!AVFoundationLibraryCore_frameworkLibrary_18287)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *AVFoundationLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFSpeakTextAction.m"), 16, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void sub_22D571BB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
  _Block_object_dispose(&location, 8);
  _Unwind_Resume(a1);
}

void getAVAudioSessionCategoryPlayback()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getAVAudioSessionCategoryPlaybackSymbolLoc_ptr;
  v8 = getAVAudioSessionCategoryPlaybackSymbolLoc_ptr;
  if (!getAVAudioSessionCategoryPlaybackSymbolLoc_ptr)
  {
    v1 = AVFoundationLibrary_18279();
    v0 = (id *)dlsym(v1, "AVAudioSessionCategoryPlayback");
    v6[3] = (uint64_t)v0;
    getAVAudioSessionCategoryPlaybackSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AVAudioSessionCategory getAVAudioSessionCategoryPlayback(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFSpeakTextAction.m"), 20, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_22D571E24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCTServiceDescriptorClass_18485()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCTServiceDescriptorClass_softClass_18486;
  v7 = getCTServiceDescriptorClass_softClass_18486;
  if (!getCTServiceDescriptorClass_softClass_18486)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getCTServiceDescriptorClass_block_invoke_18487;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getCTServiceDescriptorClass_block_invoke_18487((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D572C28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getCTServiceDescriptorClass_block_invoke_18487(uint64_t a1)
{
  void *v2;
  void *v3;

  CoreTelephonyLibrary_18488();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("CTServiceDescriptor");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCTServiceDescriptorClass_softClass_18486 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCTServiceDescriptorClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFCellularManager.m"), 36, CFSTR("Unable to find class %s"), "CTServiceDescriptor");

    __break(1u);
  }
}

void *CoreTelephonyLibrary_18488()
{
  void *v0;
  void *v2;
  void *v3;

  if (!CoreTelephonyLibraryCore_frameworkLibrary_18496)
    CoreTelephonyLibraryCore_frameworkLibrary_18496 = _sl_dlopen();
  v0 = (void *)CoreTelephonyLibraryCore_frameworkLibrary_18496;
  if (!CoreTelephonyLibraryCore_frameworkLibrary_18496)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CoreTelephonyLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFCellularManager.m"), 34, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void sub_22D573324(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D573AF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCTCellularPlanManagerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCTCellularPlanManagerClass_softClass;
  v7 = getCTCellularPlanManagerClass_softClass;
  if (!getCTCellularPlanManagerClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getCTCellularPlanManagerClass_block_invoke;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getCTCellularPlanManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D574024(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCTCellularPlanManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!CellularPlanManagerLibraryCore_frameworkLibrary)
    CellularPlanManagerLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!CellularPlanManagerLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CellularPlanManagerLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFCellularManager.m"), 40, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("CTCellularPlanManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCTCellularPlanManagerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFCellularManager.m"), 41, CFSTR("Unable to find class %s"), "CTCellularPlanManager");

LABEL_8:
    __break(1u);
  }
  getCTCellularPlanManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __getCoreTelephonyClientClass_block_invoke_18588(uint64_t a1)
{
  void *v2;
  void *v3;

  CoreTelephonyLibrary_18488();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("CoreTelephonyClient");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCoreTelephonyClientClass_softClass_18587 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCoreTelephonyClientClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFCellularManager.m"), 35, CFSTR("Unable to find class %s"), "CoreTelephonyClient");

    __break(1u);
  }
}

void sub_22D576C04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMPAVOutputDeviceRouteClass_block_invoke_18971(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!MediaPlayerLibraryCore_frameworkLibrary_18986)
    MediaPlayerLibraryCore_frameworkLibrary_18986 = _sl_dlopen();
  if (!MediaPlayerLibraryCore_frameworkLibrary_18986)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *MediaPlayerLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFListeningModePickerParameter.m"), 25, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("MPAVOutputDeviceRoute");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMPAVOutputDeviceRouteClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFListeningModePickerParameter.m"), 26, CFSTR("Unable to find class %s"), "MPAVOutputDeviceRoute");

LABEL_8:
    __break(1u);
  }
  getMPAVOutputDeviceRouteClass_softClass_18970 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_22D577720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D577A8C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D577D5C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D577ECC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t WFTextPositionIsTopPosition(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Top Left")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("Top Center")) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("Top Right"));
  }

  return v2;
}

uint64_t WFTextPositionIsBottomPosition(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Bottom Left")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("Bottom Center")) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("Bottom Right"));
  }

  return v2;
}

void __getUIFontClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  UIKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("UIFont");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getUIFontClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getUIFontClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFOverlayTextAction.m"), 22, CFSTR("Unable to find class %s"), "UIFont");

    __break(1u);
  }
}

void *UIKitLibrary()
{
  void *v0;
  void *v2;
  void *v3;

  if (!UIKitLibraryCore_frameworkLibrary_19207)
    UIKitLibraryCore_frameworkLibrary_19207 = _sl_dlopen();
  v0 = (void *)UIKitLibraryCore_frameworkLibrary_19207;
  if (!UIKitLibraryCore_frameworkLibrary_19207)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *UIKitLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFOverlayTextAction.m"), 15, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void __getNSParagraphStyleClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  UIKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("NSParagraphStyle");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getNSParagraphStyleClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getNSParagraphStyleClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFOverlayTextAction.m"), 21, CFSTR("Unable to find class %s"), "NSParagraphStyle");

    __break(1u);
  }
}

void CheckXMLResult(uint64_t a1, void *a2)
{
  id v3;
  xmlErrorPtr LastError;
  id v5;

  v3 = a2;
  if ((a1 & 0x80000000) != 0)
  {
    v5 = v3;
    LastError = xmlGetLastError();
    if (LastError)
    {
      LastError = (xmlErrorPtr)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCString:encoding:", LastError->message, 4);
      xmlResetLastError();
    }
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("ENXMLWriterLibXMLError"), CFSTR("%@ returned result=%i, error=%@"), v5, a1, LastError);

    v3 = v5;
  }

}

uint64_t ENXMLWriter_delegateWriteCallback(void *a1, uint64_t a2, uint64_t a3)
{
  objc_class *v5;
  id *v6;
  void *v7;
  id WeakRetained;

  v5 = (objc_class *)MEMORY[0x24BDBCE50];
  v6 = a1;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithBytes:length:", a2, (int)a3);
  WeakRetained = objc_loadWeakRetained(v6 + 1);
  objc_msgSend(WeakRetained, "xmlWriter:didGenerateData:", v6, v7);

  return a3;
}

uint64_t ENXMLWriter_delegateCloseCallback(id *a1)
{
  id *v1;
  id *v2;
  id WeakRetained;

  v1 = a1 + 1;
  v2 = a1;
  WeakRetained = objc_loadWeakRetained(v1);
  objc_msgSend(WeakRetained, "xmlWriterDidEndWritingDocument:", v2);

  return 0;
}

uint64_t ENXMLWriter_contentsWriteCallback(void *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a1;
  objc_msgSend(v5, "stringWithUTF8String:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v7);

  return a3;
}

void sub_22D579F9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__19488(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__19489(uint64_t a1)
{

}

void sub_22D57C00C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

id getFIUIWorkoutActivityTypeClass_19860()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getFIUIWorkoutActivityTypeClass_softClass_19876;
  v7 = getFIUIWorkoutActivityTypeClass_softClass_19876;
  if (!getFIUIWorkoutActivityTypeClass_softClass_19876)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getFIUIWorkoutActivityTypeClass_block_invoke_19877;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getFIUIWorkoutActivityTypeClass_block_invoke_19877((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D57D384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getFIUIWorkoutActivityTypeClass_block_invoke_19877(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!FitnessUILibraryCore_frameworkLibrary_19878)
    FitnessUILibraryCore_frameworkLibrary_19878 = _sl_dlopen();
  if (!FitnessUILibraryCore_frameworkLibrary_19878)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *FitnessUILibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFFIUIWorkoutActivityTypeSubstitutableState.m"), 15, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("FIUIWorkoutActivityType");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getFIUIWorkoutActivityTypeClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFFIUIWorkoutActivityTypeSubstitutableState.m"), 16, CFSTR("Unable to find class %s"), "FIUIWorkoutActivityType");

LABEL_8:
    __break(1u);
  }
  getFIUIWorkoutActivityTypeClass_softClass_19876 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_22D57DC70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  id *v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v11);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__19925(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void __Block_byref_object_dispose__19926(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

void sub_22D57F368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void kb_callback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, id *a8)
{
  uint64_t v10;
  _DWORD *v11;
  _QWORD *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  id v17;

  LODWORD(v10) = a5;
  v17 = *a8;
  if ((int)v10 >= 1)
  {
    v10 = v10;
    v11 = (_DWORD *)(a7 + 8);
    v12 = (_QWORD *)(a6 + 8);
    do
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", *(v12 - 1), *v12, 4);
      objc_msgSend(v17, "keyboardInteractiveRequest:", v13);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!v14)
        v14 = &stru_24F8BBA48;
      v15 = objc_retainAutorelease(v14);
      *((_QWORD *)v11 - 1) = strdup((const char *)-[__CFString UTF8String](v15, "UTF8String"));
      v16 = objc_retainAutorelease(v15);
      *v11 = strlen((const char *)-[__CFString UTF8String](v16, "UTF8String"));
      v11 += 4;

      v12 += 3;
      --v10;
    }
    while (v10);
  }

}

void disconnect_callback(uint64_t a1, int a2, uint64_t a3, int a4, uint64_t a5, int a6, id *a7)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  id v21;

  v21 = *a7;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 2);
  if (a3)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a3, a4, 4);
    objc_msgSend(v12, "setObject:forKey:", v13, *MEMORY[0x24BDD0FC8]);

  }
  if (a5)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a5, a6, 4);
    objc_msgSend(v12, "setObject:forKey:", v14, CFSTR("language"));

  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("NMSSH"), a2, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "delegate");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    objc_msgSend(v21, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_opt_respondsToSelector();

    if ((v19 & 1) != 0)
    {
      objc_msgSend(v21, "delegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "session:didDisconnectWithError:", v21, v15);

    }
  }
  objc_msgSend(v21, "disconnect");

}

uint64_t IsEvernoteInstalled()
{
  void *v0;
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("en://"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "isApplicationAvailableToOpenURL:error:", v1, 0);

  return v2;
}

void sub_22D581F80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  _Block_object_dispose(&a38, 8);
  _Unwind_Resume(a1);
}

Class __getREMSaveRequestClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!ReminderKitLibraryCore_frameworkLibrary)
    ReminderKitLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!ReminderKitLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *ReminderKitLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFRemoveCalendarItemsAction.m"), 18, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("REMSaveRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getREMSaveRequestClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFRemoveCalendarItemsAction.m"), 19, CFSTR("Unable to find class %s"), "REMSaveRequest");

LABEL_8:
    __break(1u);
  }
  getREMSaveRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getCBClientClass_20376()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCBClientClass_softClass_20377;
  v7 = getCBClientClass_softClass_20377;
  if (!getCBClientClass_softClass_20377)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getCBClientClass_block_invoke_20378;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getCBClientClass_block_invoke_20378((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D5827A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCBClientClass_block_invoke_20378(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!CoreBrightnessLibraryCore_frameworkLibrary_20379)
    CoreBrightnessLibraryCore_frameworkLibrary_20379 = _sl_dlopen();
  if (!CoreBrightnessLibraryCore_frameworkLibrary_20379)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CoreBrightnessLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFTrueToneSettingsClient.m"), 19, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("CBClient");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCBClientClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFTrueToneSettingsClient.m"), 30, CFSTR("Unable to find class %s"), "CBClient");

LABEL_8:
    __break(1u);
  }
  getCBClientClass_softClass_20377 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id ONOXPathFromCSS(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v1 = (void *)MEMORY[0x24BDBCEB8];
  v2 = a1;
  objc_msgSend(v1, "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsSeparatedByString:", CFSTR(","));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __ONOXPathFromCSS_block_invoke;
  v8[3] = &unk_24F8B4520;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(" | "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void sub_22D585210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__20627(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__20628(uint64_t a1)
{

}

uint64_t ONOXMLNodeMatchesTagInNamespace(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5)
  {
    v9 = 1;
    if (v6)
      goto LABEL_3;
LABEL_7:
    v12 = 1;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *(_QWORD *)(a1 + 16));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "compare:options:", v5, 1) == 0;

  if (!v7)
    goto LABEL_7;
LABEL_3:
  v10 = *(_QWORD *)(a1 + 72);
  if (v10 && *(_QWORD *)(v10 + 24))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "compare:options:", v7, 1) == 0;

  }
  else
  {
    v12 = 0;
  }
LABEL_9:

  return v9 & v12;
}

void ONOSetErrorFromXMLErrorPtr(_QWORD *a1, xmlError *a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t code;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    if (a2)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", a2->message, 4);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      code = a2->code;
      v9 = *MEMORY[0x24BDD0FD8];
      v10[0] = v6;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.ono.error"), code, v8);
      *a1 = (id)objc_claimAutoreleasedReturnValue();
      xmlResetError(a2);

    }
  }
}

void sub_22D5860B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__20758(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__20759(uint64_t a1)
{

}

void sub_22D588960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D58A624(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_22D58AA78(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void __getAVMutableMovieClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  AVFoundationLibrary_21462();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AVMutableMovie");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVMutableMovieClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAVMutableMovieClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFImageRotateAction.m"), 23, CFSTR("Unable to find class %s"), "AVMutableMovie");

    __break(1u);
  }
}

void *AVFoundationLibrary_21462()
{
  void *v0;
  void *v2;
  void *v3;

  if (!AVFoundationLibraryCore_frameworkLibrary_21470)
    AVFoundationLibraryCore_frameworkLibrary_21470 = _sl_dlopen();
  v0 = (void *)AVFoundationLibraryCore_frameworkLibrary_21470;
  if (!AVFoundationLibraryCore_frameworkLibrary_21470)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *AVFoundationLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFImageRotateAction.m"), 17, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

id WFImageRotateError(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  if (a1 == 1)
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v9 = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("Cannot rotate Dolby Vision content."));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v7;
    v6 = 1;
    goto LABEL_5;
  }
  if (!a1)
  {
    v2 = (void *)MEMORY[0x24BDD1540];
    v11 = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("Cannot rotate protected media."));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v2;
    v6 = 0;
LABEL_5:
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("WFImageRotateErrorDomain"), v6, v4);
    v1 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

id mutableRequestWithURLString(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x24BDB7458];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "requestWithURL:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id formEncodedDataToDictionary(void *a1)
{
  objc_class *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (objc_class *)MEMORY[0x24BDD17C8];
  v2 = a1;
  v3 = (void *)objc_msgSend([v1 alloc], "initWithData:encoding:", v2, 4);

  type metadata for some(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t errorWithStatusCode(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("Authentication request failed"), a1, 0);
}

id __HTMLEscapedString(void *a1)
{
  void *v1;

  v1 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("&"), CFSTR("&amp;"),
    2,
    0,
    objc_msgSend(v1, "length"));
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\""), CFSTR("&quot;"),
    2,
    0,
    objc_msgSend(v1, "length"));
  return v1;
}

id __obfuscatedEmailAddress(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  signed int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = (void *)objc_opt_new();
  v12[0] = &__block_literal_global_22637;
  v12[1] = &__block_literal_global_77;
  v12[2] = &__block_literal_global_80;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "length"))
  {
    v4 = 0;
    do
    {
      v5 = objc_msgSend(v1, "characterAtIndex:", v4);
      if ((_DWORD)v5 == 64)
      {
        objc_msgSend(v3, "objectAtIndex:", arc4random_uniform(2u));
        v6 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = arc4random_uniform(0x64u);
        if (v7 <= 89)
          v8 = v7 > 44;
        else
          v8 = 2;
        objc_msgSend(v3, "objectAtIndexedSubscript:", v8);
        v6 = objc_claimAutoreleasedReturnValue();
      }
      v9 = (void *)v6;
      (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "appendString:", v10);

      ++v4;
    }
    while (v4 < objc_msgSend(v1, "length"));
  }

  return v2;
}

id ____obfuscatedEmailAddress_block_invoke_3(uint64_t a1, __int16 a2)
{
  __int16 v3;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t ____obfuscatedEmailAddress_block_invoke_2(uint64_t a1, unsigned int a2)
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("&#x%x;"), a2);
}

uint64_t ____obfuscatedEmailAddress_block_invoke(uint64_t a1, unsigned int a2)
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("&#%d;"), a2);
}

void sub_22D594F34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCLLocationClass_22853()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCLLocationClass_softClass_22854;
  v7 = getCLLocationClass_softClass_22854;
  if (!getCLLocationClass_softClass_22854)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getCLLocationClass_block_invoke_22855;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getCLLocationClass_block_invoke_22855((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D595224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getCLLocationClass_block_invoke_22855(uint64_t a1)
{
  void *v2;
  void *v3;

  CoreLocationLibrary_22856();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("CLLocation");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCLLocationClass_softClass_22854 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCLLocationClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFSearchLocalBusinessesAction.m"), 29, CFSTR("Unable to find class %s"), "CLLocation");

    __break(1u);
  }
}

void *CoreLocationLibrary_22856()
{
  void *v0;
  void *v2;
  void *v3;

  if (!CoreLocationLibraryCore_frameworkLibrary_22864)
    CoreLocationLibraryCore_frameworkLibrary_22864 = _sl_dlopen();
  v0 = (void *)CoreLocationLibraryCore_frameworkLibrary_22864;
  if (!CoreLocationLibraryCore_frameworkLibrary_22864)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CoreLocationLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFSearchLocalBusinessesAction.m"), 28, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void __getMKLocalSearchRequestClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  MapKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MKLocalSearchRequest");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMKLocalSearchRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMKLocalSearchRequestClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFSearchLocalBusinessesAction.m"), 24, CFSTR("Unable to find class %s"), "MKLocalSearchRequest");

    __break(1u);
  }
}

void *MapKitLibrary()
{
  void *v0;
  void *v2;
  void *v3;

  if (!MapKitLibraryCore_frameworkLibrary_22903)
    MapKitLibraryCore_frameworkLibrary_22903 = _sl_dlopen();
  v0 = (void *)MapKitLibraryCore_frameworkLibrary_22903;
  if (!MapKitLibraryCore_frameworkLibrary_22903)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *MapKitLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFSearchLocalBusinessesAction.m"), 22, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void __getMKLocalSearchClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  MapKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MKLocalSearch");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMKLocalSearchClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMKLocalSearchClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFSearchLocalBusinessesAction.m"), 23, CFSTR("Unable to find class %s"), "MKLocalSearch");

    __break(1u);
  }
}

void getMKErrorDomain()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getMKErrorDomainSymbolLoc_ptr;
  v8 = getMKErrorDomainSymbolLoc_ptr;
  if (!getMKErrorDomainSymbolLoc_ptr)
  {
    v1 = MapKitLibrary();
    v0 = (id *)dlsym(v1, "MKErrorDomain");
    v6[3] = (uint64_t)v0;
    getMKErrorDomainSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSErrorDomain getMKErrorDomain(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFSearchLocalBusinessesAction.m"), 25, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_22D595A88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D595C80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D595EDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22D5973EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_22D597918(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void __getPHAssetClass_block_invoke_23233(uint64_t a1)
{
  void *v2;
  void *v3;

  PhotosLibrary_23234();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("PHAsset");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPHAssetClass_softClass_23232 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getPHAssetClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFDeletePhotosIntentHandler.m"), 18, CFSTR("Unable to find class %s"), "PHAsset");

    __break(1u);
  }
}

void sub_22D597B9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D597D9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *PhotosLibrary_23234()
{
  void *v0;
  void *v2;
  void *v3;

  if (!PhotosLibraryCore_frameworkLibrary_23242)
    PhotosLibraryCore_frameworkLibrary_23242 = _sl_dlopen();
  v0 = (void *)PhotosLibraryCore_frameworkLibrary_23242;
  if (!PhotosLibraryCore_frameworkLibrary_23242)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *PhotosLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFDeletePhotosIntentHandler.m"), 17, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void __getPHAssetChangeRequestClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  PhotosLibrary_23234();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("PHAssetChangeRequest");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPHAssetChangeRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getPHAssetChangeRequestClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFDeletePhotosIntentHandler.m"), 20, CFSTR("Unable to find class %s"), "PHAssetChangeRequest");

    __break(1u);
  }
}

void sub_22D59973C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

void sub_22D59B2B8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void *SpringBoardServicesLibrary_23689()
{
  void *v0;
  void *v2;
  void *v3;

  if (!SpringBoardServicesLibraryCore_frameworkLibrary_23716)
    SpringBoardServicesLibraryCore_frameworkLibrary_23716 = _sl_dlopen();
  v0 = (void *)SpringBoardServicesLibraryCore_frameworkLibrary_23716;
  if (!SpringBoardServicesLibraryCore_frameworkLibrary_23716)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *SpringBoardServicesLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFOpenAppAction.m"), 28, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void getSBSOpenApplicationOptionKeyLayoutRole_23694()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getSBSOpenApplicationOptionKeyLayoutRoleSymbolLoc_ptr_23711;
  v8 = getSBSOpenApplicationOptionKeyLayoutRoleSymbolLoc_ptr_23711;
  if (!getSBSOpenApplicationOptionKeyLayoutRoleSymbolLoc_ptr_23711)
  {
    v1 = SpringBoardServicesLibrary_23689();
    v0 = (id *)dlsym(v1, "SBSOpenApplicationOptionKeyLayoutRole");
    v6[3] = (uint64_t)v0;
    getSBSOpenApplicationOptionKeyLayoutRoleSymbolLoc_ptr_23711 = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getSBSOpenApplicationOptionKeyLayoutRole(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFOpenAppAction.m"), 30, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_22D59B95C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t WFOpenAppActionIsPDUError(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t IsPDUError;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v1 = a1;
  v2 = v1;
  if (!v1)
    goto LABEL_8;
  objc_msgSend(v1, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE80E48]))
  {

LABEL_6:
    objc_msgSend(v2, "underlyingErrors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      objc_msgSend(v2, "underlyingErrors");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      IsPDUError = WFOpenAppActionIsPDUError();

      goto LABEL_9;
    }
LABEL_8:
    IsPDUError = 0;
    goto LABEL_9;
  }
  v4 = objc_msgSend(v2, "code");

  if (v4 != 8)
    goto LABEL_6;
  IsPDUError = 1;
LABEL_9:

  return IsPDUError;
}

void sub_22D59C720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCWFInterfaceClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!CoreWiFiLibraryCore_frameworkLibrary)
    CoreWiFiLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!CoreWiFiLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CoreWiFiLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFWiFiSettingsClient.m"), 18, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("CWFInterface");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCWFInterfaceClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFWiFiSettingsClient.m"), 19, CFSTR("Unable to find class %s"), "CWFInterface");

LABEL_8:
    __break(1u);
  }
  getCWFInterfaceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_22D59D37C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getAVCaptureDeviceClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  AVFoundationLibrary_23982();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AVCaptureDevice");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVCaptureDeviceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAVCaptureDeviceClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFCameraAccessResource.m"), 20, CFSTR("Unable to find class %s"), "AVCaptureDevice");

    __break(1u);
  }
}

void *AVFoundationLibrary_23982()
{
  void *v0;
  void *v2;
  void *v3;

  if (!AVFoundationLibraryCore_frameworkLibrary_23992)
    AVFoundationLibraryCore_frameworkLibrary_23992 = _sl_dlopen();
  v0 = (void *)AVFoundationLibraryCore_frameworkLibrary_23992;
  if (!AVFoundationLibraryCore_frameworkLibrary_23992)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *AVFoundationLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFCameraAccessResource.m"), 19, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void sub_22D59DA44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a34, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__24026(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__24027(uint64_t a1)
{

}

void sub_22D59DE2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSHMatchedMediaItemClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!ShazamKitLibraryCore_frameworkLibrary_24125)
    ShazamKitLibraryCore_frameworkLibrary_24125 = _sl_dlopen();
  if (!ShazamKitLibraryCore_frameworkLibrary_24125)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *ShazamKitLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFShazamMedia.m"), 17, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("SHMatchedMediaItem");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getSHMatchedMediaItemClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFShazamMedia.m"), 19, CFSTR("Unable to find class %s"), "SHMatchedMediaItem");

LABEL_8:
    __break(1u);
  }
  getSHMatchedMediaItemClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void FATInvalidAbstractInvocation(const char *a1, objc_class *a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x24BDBCE88];
  v5 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a1);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromClass(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("-%@ only defined for abstract class. Define -[%@ %@]!"), v8, v6, v7);

}

void sub_22D59FD20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void __getPHImportSessionClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  PhotosLibrary_24374();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("PHImportSession");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPHImportSessionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getPHImportSessionClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFGetLatestPhotoImportAction.m"), 18, CFSTR("Unable to find class %s"), "PHImportSession");

    __break(1u);
  }
}

void __getPHAssetClass_block_invoke_24373(uint64_t a1)
{
  void *v2;
  void *v3;

  PhotosLibrary_24374();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("PHAsset");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPHAssetClass_softClass_24372 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getPHAssetClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFGetLatestPhotoImportAction.m"), 17, CFSTR("Unable to find class %s"), "PHAsset");

    __break(1u);
  }
}

void PhotosLibrary_24374()
{
  void *v0;
  void *v1;
  void *v2;

  if (!PhotosLibraryCore_frameworkLibrary_24383)
    PhotosLibraryCore_frameworkLibrary_24383 = _sl_dlopen();
  if (!PhotosLibraryCore_frameworkLibrary_24383)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *PhotosLibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("WFGetLatestPhotoImportAction.m"), 16, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

void sub_22D5A0284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCLLocationClass_24490()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCLLocationClass_softClass_24491;
  v7 = getCLLocationClass_softClass_24491;
  if (!getCLLocationClass_softClass_24491)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getCLLocationClass_block_invoke_24492;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getCLLocationClass_block_invoke_24492((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D5A0890(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCLLocationClass_block_invoke_24492(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!CoreLocationLibraryCore_frameworkLibrary_24493)
    CoreLocationLibraryCore_frameworkLibrary_24493 = _sl_dlopen();
  if (!CoreLocationLibraryCore_frameworkLibrary_24493)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CoreLocationLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFParkedCarContentItem.m"), 20, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("CLLocation");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCLLocationClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFParkedCarContentItem.m"), 25, CFSTR("Unable to find class %s"), "CLLocation");

LABEL_8:
    __break(1u);
  }
  getCLLocationClass_softClass_24491 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getRTVehicleEventClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getRTVehicleEventClass_softClass;
  v7 = getRTVehicleEventClass_softClass;
  if (!getRTVehicleEventClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getRTVehicleEventClass_block_invoke;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getRTVehicleEventClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D5A0AE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getRTVehicleEventClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!CoreRoutineLibraryCore_frameworkLibrary_24506)
    CoreRoutineLibraryCore_frameworkLibrary_24506 = _sl_dlopen();
  if (!CoreRoutineLibraryCore_frameworkLibrary_24506)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CoreRoutineLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFParkedCarContentItem.m"), 19, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("RTVehicleEvent");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getRTVehicleEventClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFParkedCarContentItem.m"), 23, CFSTR("Unable to find class %s"), "RTVehicleEvent");

LABEL_8:
    __break(1u);
  }
  getRTVehicleEventClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_22D5A3C84(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

Class __getPRSServiceClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!PosterBoardServicesLibraryCore_frameworkLibrary)
    PosterBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!PosterBoardServicesLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *PosterBoardServicesLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFGetPostersAction.m"), 20, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("PRSService");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getPRSServiceClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFGetPostersAction.m"), 21, CFSTR("Unable to find class %s"), "PRSService");

LABEL_8:
    __break(1u);
  }
  getPRSServiceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_22D5A5810(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

Class __getMPMediaLibraryClass_block_invoke_25378(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!MediaPlayerLibraryCore_frameworkLibrary_25383)
    MediaPlayerLibraryCore_frameworkLibrary_25383 = _sl_dlopen();
  if (!MediaPlayerLibraryCore_frameworkLibrary_25383)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *MediaPlayerLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFAppleMusicAccessResource.m"), 21, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("MPMediaLibrary");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMPMediaLibraryClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFAppleMusicAccessResource.m"), 22, CFSTR("Unable to find class %s"), "MPMediaLibrary");

LABEL_8:
    __break(1u);
  }
  getMPMediaLibraryClass_softClass_25377 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_22D5A6AAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D5A721C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__25564(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__25565(uint64_t a1)
{

}

id WFFormattedCurrencyAccount(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = (objc_class *)MEMORY[0x24BDD16F0];
  v2 = a1;
  v3 = objc_alloc_init(v1);
  objc_msgSend(v3, "setNumberStyle:", 2);
  objc_msgSend(v2, "currencyCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCurrencyCode:", v4);

  objc_msgSend(v2, "amount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringFromNumber:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void commentBlockSAXCallback(id *a1, char *__s)
{
  uint64_t v3;
  id *v4;
  id *v5;
  id WeakRetained;
  id v7;

  if (__s)
  {
    v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", __s, strlen(__s), 4);
    if (v3)
    {
      v4 = a1 + 1;
      v7 = (id)v3;
      v5 = a1;
      WeakRetained = objc_loadWeakRetained(v4);
      objc_msgSend(WeakRetained, "parser:foundComment:", v5, v7);

    }
  }
}

void charactersSAXCallback(id *a1, uint64_t a2, int a3)
{
  uint64_t v4;
  id *v5;
  id *v6;
  id WeakRetained;
  id v8;

  if (a2)
  {
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a2, a3, 4);
    if (v4)
    {
      v5 = a1 + 1;
      v8 = (id)v4;
      v6 = a1;
      WeakRetained = objc_loadWeakRetained(v5);
      objc_msgSend(WeakRetained, "parser:foundCharacters:", v6, v8);

    }
  }
}

void startDocumentSAXCallback(id *a1)
{
  id *v1;
  id *v2;
  id WeakRetained;

  v1 = a1 + 1;
  v2 = a1;
  WeakRetained = objc_loadWeakRetained(v1);
  objc_msgSend(WeakRetained, "parserDidStartDocument:", v2);

}

void endDocumentSAXCallback(id *a1)
{
  id *v1;
  id *v2;
  id WeakRetained;

  v1 = a1 + 1;
  v2 = a1;
  WeakRetained = objc_loadWeakRetained(v1);
  objc_msgSend(WeakRetained, "parserDidEndDocument:", v2);

}

void startElementSAXCallback(id *a1, char *__s, const char **a3)
{
  id v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  void *v10;
  id *v11;
  id *v12;
  id WeakRetained;
  id v14;

  if (__s)
    v14 = (id)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", __s, strlen(__s), 4);
  else
    v14 = 0;
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (a3)
  {
    v6 = *a3;
    if (*a3)
    {
      while (1)
      {
        v7 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v6, strlen(v6), 4);
        v8 = a3[1];
        if (!v8)
          break;
        v9 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v8, strlen(a3[1]), 4);
        a3 += 2;
        if (!v9)
          goto LABEL_13;
        if (v7)
          goto LABEL_9;
LABEL_10:

        v6 = *a3;
        if (!*a3)
          goto LABEL_15;
      }
      a3 += 2;
LABEL_13:
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
        goto LABEL_10;
LABEL_9:
      objc_msgSend(v7, "lowercaseString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v9, v10);

      goto LABEL_10;
    }
  }
LABEL_15:
  v11 = a1 + 1;
  v12 = a1;
  WeakRetained = objc_loadWeakRetained(v11);
  objc_msgSend(WeakRetained, "parser:didStartElement:attributes:", v12, v14, v5);

}

void endElementSAXCallback(void *a1, char *a2)
{
  id WeakRetained;
  id *v4;

  v4 = a1;
  if (a2)
    a2 = (char *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a2, strlen(a2), 4);
  WeakRetained = objc_loadWeakRetained(v4 + 1);
  objc_msgSend(WeakRetained, "parser:didEndElement:", v4, a2);

}

void cdataBlockSAXCallback(id *a1, uint64_t a2, int a3)
{
  uint64_t v4;
  id *v5;
  id *v6;
  id WeakRetained;
  id v8;

  if (a2)
  {
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a2, a3, 4);
    if (v4)
    {
      v5 = a1 + 1;
      v8 = (id)v4;
      v6 = a1;
      WeakRetained = objc_loadWeakRetained(v5);
      objc_msgSend(WeakRetained, "parser:foundCDATA:", v6, v8);

    }
  }
}

xmlEntityPtr getEntitySAXCallback(void *a1, xmlChar *name)
{
  xmlEntityPtr result;
  void *v5;
  void *v6;
  void *v7;

  result = xmlGetPredefinedEntity(name);
  if (!result)
  {
    result = (xmlEntityPtr)objc_msgSend(a1, "lookupEntity:", name);
    if (!result)
    {
      +[ENSession sharedSession](ENSession, "sharedSession");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logger");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Ignoring unknown entity '%s'"), name);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "evernoteLogInfoString:", v7);

      return 0;
    }
  }
  return result;
}

void fatalErrorCallback(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id *v15;
  id WeakRetained;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", a2, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", v10, &a9);
  +[ENSession sharedSession](ENSession, "sharedSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "logger");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ENXMLSaxParser: fatal error %@"), v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "evernoteLogErrorString:", v14);

  v15 = a1;
  WeakRetained = objc_loadWeakRetained(v15 + 1);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v17 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v11, CFSTR("message"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("ENXMLSaxParserErrorDomain"), 1001, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "parser:didFailWithError:", v15, v19);
  }

}

void errorCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", a2, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", v9, &a9);
  +[ENSession sharedSession](ENSession, "sharedSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "logger");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ENXMLSaxParser: %@ (nonfatal)"), v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "evernoteLogInfoString:", v13);

}

const __CFString *WFListeningModeFromRawAVOutputDeviceBluetoothListeningModeValue(void *a1)
{
  id v1;
  void *v2;
  char v3;
  const __CFString *v4;
  void *v5;
  char v6;
  void *v7;
  int v8;

  v1 = a1;
  getAVOutputDeviceBluetoothListeningModeActiveNoiseCancellation();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "isEqualToString:", v2);

  if ((v3 & 1) != 0)
  {
    v4 = CFSTR("ActiveNoiseCancellation");
  }
  else
  {
    getAVOutputDeviceBluetoothListeningModeAudioTransparency();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v1, "isEqualToString:", v5);

    if ((v6 & 1) != 0)
    {
      v4 = CFSTR("Transparency");
    }
    else
    {
      getAVOutputDeviceBluetoothListeningModeAutomatic();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v1, "isEqualToString:", v7);

      if (v8)
        v4 = CFSTR("Adaptive");
      else
        v4 = CFSTR("Normal");
    }
  }

  return v4;
}

void getAVOutputDeviceBluetoothListeningModeActiveNoiseCancellation()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getAVOutputDeviceBluetoothListeningModeActiveNoiseCancellationSymbolLoc_ptr;
  v8 = getAVOutputDeviceBluetoothListeningModeActiveNoiseCancellationSymbolLoc_ptr;
  if (!getAVOutputDeviceBluetoothListeningModeActiveNoiseCancellationSymbolLoc_ptr)
  {
    v1 = AVFoundationLibrary_26604();
    v0 = (id *)dlsym(v1, "AVOutputDeviceBluetoothListeningModeActiveNoiseCancellation");
    v6[3] = (uint64_t)v0;
    getAVOutputDeviceBluetoothListeningModeActiveNoiseCancellationSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getAVOutputDeviceBluetoothListeningModeActiveNoiseCancellation(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFListeningMode.m"), 17, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_22D5AE910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getAVOutputDeviceBluetoothListeningModeAudioTransparency()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getAVOutputDeviceBluetoothListeningModeAudioTransparencySymbolLoc_ptr;
  v8 = getAVOutputDeviceBluetoothListeningModeAudioTransparencySymbolLoc_ptr;
  if (!getAVOutputDeviceBluetoothListeningModeAudioTransparencySymbolLoc_ptr)
  {
    v1 = AVFoundationLibrary_26604();
    v0 = (id *)dlsym(v1, "AVOutputDeviceBluetoothListeningModeAudioTransparency");
    v6[3] = (uint64_t)v0;
    getAVOutputDeviceBluetoothListeningModeAudioTransparencySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getAVOutputDeviceBluetoothListeningModeAudioTransparency(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFListeningMode.m"), 18, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_22D5AEA08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getAVOutputDeviceBluetoothListeningModeAutomatic()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getAVOutputDeviceBluetoothListeningModeAutomaticSymbolLoc_ptr;
  v8 = getAVOutputDeviceBluetoothListeningModeAutomaticSymbolLoc_ptr;
  if (!getAVOutputDeviceBluetoothListeningModeAutomaticSymbolLoc_ptr)
  {
    v1 = AVFoundationLibrary_26604();
    v0 = (id *)dlsym(v1, "AVOutputDeviceBluetoothListeningModeAutomatic");
    v6[3] = (uint64_t)v0;
    getAVOutputDeviceBluetoothListeningModeAutomaticSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getAVOutputDeviceBluetoothListeningModeAutomatic(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFListeningMode.m"), 20, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_22D5AEB00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *AVFoundationLibrary_26604()
{
  void *v0;
  void *v2;
  void *v3;

  if (!AVFoundationLibraryCore_frameworkLibrary_26610)
    AVFoundationLibraryCore_frameworkLibrary_26610 = _sl_dlopen();
  v0 = (void *)AVFoundationLibraryCore_frameworkLibrary_26610;
  if (!AVFoundationLibraryCore_frameworkLibrary_26610)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *AVFoundationLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFListeningMode.m"), 16, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void WFAVOutputDeviceBluetoothListeningModeFromListeningMode(void *a1)
{
  id v1;
  id v2;
  id *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v1 = a1;
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("ActiveNoiseCancellation")))
  {
    getAVOutputDeviceBluetoothListeningModeActiveNoiseCancellation();
    v2 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:
    v5 = v2;

    v6 = v5;
    return;
  }
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("Transparency")))
  {
    getAVOutputDeviceBluetoothListeningModeAudioTransparency();
    v2 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("Adaptive")))
  {
    getAVOutputDeviceBluetoothListeningModeAutomatic();
    v2 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v3 = (id *)getAVOutputDeviceBluetoothListeningModeNormalSymbolLoc_ptr;
  v12 = getAVOutputDeviceBluetoothListeningModeNormalSymbolLoc_ptr;
  if (!getAVOutputDeviceBluetoothListeningModeNormalSymbolLoc_ptr)
  {
    v4 = AVFoundationLibrary_26604();
    v3 = (id *)dlsym(v4, "AVOutputDeviceBluetoothListeningModeNormal");
    v10[3] = (uint64_t)v3;
    getAVOutputDeviceBluetoothListeningModeNormalSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v9, 8);
  if (v3)
  {
    v2 = *v3;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getAVOutputDeviceBluetoothListeningModeNormal(void)");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("WFListeningMode.m"), 19, CFSTR("%s"), dlerror());

  __break(1u);
}

void sub_22D5AED78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id WFAvailableListeningModesForRoute(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "logicalLeaderOutputDevice");
  v1 = (void *)MRAVOutputDeviceCopyAvailableBluetoothListeningMode();
  objc_msgSend(v1, "if_map:", &__block_literal_global_26619);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_22D5AF900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_22D5AFC88(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void __getREMReminderClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  ReminderKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("REMReminder");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getREMReminderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getREMReminderClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFAddNewReminderAction.m"), 25, CFSTR("Unable to find class %s"), "REMReminder");

    __break(1u);
  }
}

void ReminderKitLibrary()
{
  void *v0;
  void *v1;
  void *v2;

  if (!ReminderKitLibraryCore_frameworkLibrary_26679)
    ReminderKitLibraryCore_frameworkLibrary_26679 = _sl_dlopen();
  if (!ReminderKitLibraryCore_frameworkLibrary_26679)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *ReminderKitLibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("WFAddNewReminderAction.m"), 24, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

void __getREMAlarmDateTriggerClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  ReminderKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("REMAlarmDateTrigger");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getREMAlarmDateTriggerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getREMAlarmDateTriggerClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFAddNewReminderAction.m"), 26, CFSTR("Unable to find class %s"), "REMAlarmDateTrigger");

    __break(1u);
  }
}

void sub_22D5B0D18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMKMapItemClass_block_invoke_26711(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!MapKitLibraryCore_frameworkLibrary_26712)
    MapKitLibraryCore_frameworkLibrary_26712 = _sl_dlopen();
  if (!MapKitLibraryCore_frameworkLibrary_26712)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *MapKitLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFAddNewReminderAction.m"), 33, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("MKMapItem");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMKMapItemClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFAddNewReminderAction.m"), 34, CFSTR("Unable to find class %s"), "MKMapItem");

LABEL_8:
    __break(1u);
  }
  getMKMapItemClass_softClass_26710 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __getREMStructuredLocationClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  ReminderKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("REMStructuredLocation");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getREMStructuredLocationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getREMStructuredLocationClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFAddNewReminderAction.m"), 31, CFSTR("Unable to find class %s"), "REMStructuredLocation");

    __break(1u);
  }
}

Class __getCNPostalAddressFormatterClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!ContactsLibraryCore_frameworkLibrary_26728)
    ContactsLibraryCore_frameworkLibrary_26728 = _sl_dlopen();
  if (!ContactsLibraryCore_frameworkLibrary_26728)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *ContactsLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFAddNewReminderAction.m"), 36, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("CNPostalAddressFormatter");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCNPostalAddressFormatterClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFAddNewReminderAction.m"), 37, CFSTR("Unable to find class %s"), "CNPostalAddressFormatter");

LABEL_8:
    __break(1u);
  }
  getCNPostalAddressFormatterClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __getREMAlarmLocationTriggerClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  ReminderKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("REMAlarmLocationTrigger");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getREMAlarmLocationTriggerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getREMAlarmLocationTriggerClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFAddNewReminderAction.m"), 29, CFSTR("Unable to find class %s"), "REMAlarmLocationTrigger");

    __break(1u);
  }
}

void sub_22D5B1888(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id location,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

void __getREMSaveRequestClass_block_invoke_26762(uint64_t a1)
{
  void *v2;
  void *v3;

  ReminderKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("REMSaveRequest");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getREMSaveRequestClass_softClass_26761 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getREMSaveRequestClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFAddNewReminderAction.m"), 27, CFSTR("Unable to find class %s"), "REMSaveRequest");

    __break(1u);
  }
}

void sub_22D5B1A64(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void getAVMetadataObjectTypeQRCode()
{
  id *v0;
  id v1;
  void *v2;
  void *v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getAVMetadataObjectTypeQRCodeSymbolLoc_ptr;
  v8 = getAVMetadataObjectTypeQRCodeSymbolLoc_ptr;
  if (!getAVMetadataObjectTypeQRCodeSymbolLoc_ptr)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __getAVMetadataObjectTypeQRCodeSymbolLoc_block_invoke;
    v4[3] = &unk_24F8BB430;
    v4[4] = &v5;
    __getAVMetadataObjectTypeQRCodeSymbolLoc_block_invoke(v4);
    v0 = (id *)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v1 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString * _Nonnull getAVMetadataObjectTypeQRCode(void)");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFMachineReadableCodeContentItem.m"), 19, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_22D5B214C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getAVMetadataObjectTypeQRCodeSymbolLoc_block_invoke(_QWORD *a1)
{
  void *v2;
  void *result;
  void *v4;

  if (!AVFoundationLibraryCore_frameworkLibrary_26851)
    AVFoundationLibraryCore_frameworkLibrary_26851 = _sl_dlopen();
  v2 = (void *)AVFoundationLibraryCore_frameworkLibrary_26851;
  if (!AVFoundationLibraryCore_frameworkLibrary_26851)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void * _Nonnull AVFoundationLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFMachineReadableCodeContentItem.m"), 18, CFSTR("%s"), 0);

    __break(1u);
    free(v4);
  }
  result = dlsym(v2, "AVMetadataObjectTypeQRCode");
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  getAVMetadataObjectTypeQRCodeSymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  return result;
}

id getPHAssetCollectionClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getPHAssetCollectionClass_softClass;
  v7 = getPHAssetCollectionClass_softClass;
  if (!getPHAssetCollectionClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getPHAssetCollectionClass_block_invoke;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getPHAssetCollectionClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D5B34FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getPHAssetCollectionClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  PhotosLibrary_27222();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("PHAssetCollection");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPHAssetCollectionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getPHAssetCollectionClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFPhotoAlbumPickerParameter.m"), 21, CFSTR("Unable to find class %s"), "PHAssetCollection");

    __break(1u);
  }
}

void PhotosLibrary_27222()
{
  void *v0;
  void *v1;
  void *v2;

  if (!PhotosLibraryCore_frameworkLibrary_27230)
    PhotosLibraryCore_frameworkLibrary_27230 = _sl_dlopen();
  if (!PhotosLibraryCore_frameworkLibrary_27230)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *PhotosLibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("WFPhotoAlbumPickerParameter.m"), 19, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

void sub_22D5B3784(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getPHPhotoLibraryClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  PhotosLibrary_27222();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("PHPhotoLibrary");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPHPhotoLibraryClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getPHPhotoLibraryClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFPhotoAlbumPickerParameter.m"), 22, CFSTR("Unable to find class %s"), "PHPhotoLibrary");

    __break(1u);
  }
}

void sub_22D5B415C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPHAssetCollectionClass_block_invoke_27339(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!PhotosLibraryCore_frameworkLibrary_27340)
    PhotosLibraryCore_frameworkLibrary_27340 = _sl_dlopen();
  if (!PhotosLibraryCore_frameworkLibrary_27340)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *PhotosLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFGetLatestPhotosAction.m"), 14, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("PHAssetCollection");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getPHAssetCollectionClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFGetLatestPhotosAction.m"), 16, CFSTR("Unable to find class %s"), "PHAssetCollection");

LABEL_8:
    __break(1u);
  }
  getPHAssetCollectionClass_softClass_27338 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id WFRFC6749Section5_2ErrorFromResponse(void *a1)
{
  id v1;
  void *v2;
  const __CFString *v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v1 = a1;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("error"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_msgSend(v2, "isEqualToString:", CFSTR("invalid_request")) & 1) != 0)
    {
      v3 = CFSTR("The request is missing a required parameter, includes an unsupported parameter value (other than grant type), repeats a parameter, includes multiple credentials, utilizes more than one mechanism for authenticating the client, or is otherwise malformed.");
      v4 = 100;
    }
    else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("invalid_client")) & 1) != 0)
    {
      v3 = CFSTR("Client authentication failed (e.g., unknown client, no client authentication included, or unsupported authentication method).  The authorization server MAY return an HTTP 401 (Unauthorized) status code to indicate which HTTP authentication schemes are supported.  If the client attempted to authenticate via the \"Authorization\" request header field, the authorization server MUST respond with an HTTP 401 (Unauthorized) status code and include the \"WWW-Authenticate\" response header field matching the authentication scheme used by the client.");
      v4 = 101;
    }
    else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("invalid_grant")) & 1) != 0)
    {
      v3 = CFSTR("The provided authorization grant (e.g., authorization code, resource owner credentials) or refresh token is invalid, expired, revoked, does not match the redirection URI used in the authorization request, or was issued to another client.");
      v4 = 102;
    }
    else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("unauthorized_client")) & 1) != 0)
    {
      v3 = CFSTR("The authenticated client is not authorized to use this authorization grant type.");
      v4 = 103;
    }
    else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("unsupported_grant_type")) & 1) != 0)
    {
      v3 = CFSTR("The authorization grant type is not supported by the authorization server.");
      v4 = 104;
    }
    else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("invalid_scope")) & 1) != 0)
    {
      v3 = CFSTR("The requested scope is invalid, unknown, malformed, or exceeds the scope granted by the resource owner.");
      v4 = 105;
    }
    else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("access_denied")) & 1) != 0)
    {
      v3 = CFSTR("The resource owner or authorization server denied the request.");
      v4 = 106;
    }
    else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("unsupported_response_type")) & 1) != 0)
    {
      v3 = CFSTR("The authorization server does not support obtaining an authorization code using this method.");
      v4 = 107;
    }
    else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("server_error")) & 1) != 0)
    {
      v3 = CFSTR(" The authorization server encountered an unexpected condition that prevented it from fulfilling the request.");
      v4 = 108;
    }
    else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("temporarily_unavailable")) & 1) != 0)
    {
      v3 = CFSTR("The authorization server is currently unable to handle the request due to a temporary overloading or maintenance of the server.");
      v4 = 109;
    }
    else if ((objc_msgSend(v2, "isEqualToString:", CFSTR("invalid_token")) & 1) != 0)
    {
      v3 = CFSTR("The requested token is invalid, unknown, or malformed.");
      v4 = 201;
    }
    else
    {
      v6 = objc_msgSend(v2, "isEqualToString:", CFSTR("mismatching_redirect_uri"));
      if (v6)
        v3 = CFSTR("The requested redirect URI does not match any of the client's valid redirect URIs.");
      else
        v3 = 0;
      if (v6)
        v4 = 202;
      else
        v4 = -1;
    }
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("error_description"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
      v9 = (void *)v7;
    else
      v9 = (void *)v3;
    v10 = v9;

    v11 = (void *)objc_opt_new();
    objc_msgSend(v11, "setValue:forKey:", v10, *MEMORY[0x24BDD0FC8]);
    v12 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("error_uri"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URLWithString:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setValue:forKey:", v14, *MEMORY[0x24BDD0FF0]);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("WFOAuth2ErrorDomain"), v4, v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void sub_22D5B5098(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getTUBundleIdentifierTelephonyUtilitiesFramework()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getTUBundleIdentifierTelephonyUtilitiesFrameworkSymbolLoc_ptr;
  v8 = getTUBundleIdentifierTelephonyUtilitiesFrameworkSymbolLoc_ptr;
  if (!getTUBundleIdentifierTelephonyUtilitiesFrameworkSymbolLoc_ptr)
  {
    v1 = TelephonyUtilitiesLibrary();
    v0 = (id *)dlsym(v1, "TUBundleIdentifierTelephonyUtilitiesFramework");
    v6[3] = (uint64_t)v0;
    getTUBundleIdentifierTelephonyUtilitiesFrameworkSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getTUBundleIdentifierTelephonyUtilitiesFramework(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFSilenceUnknownCallersSettingsClient.m"), 19, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_22D5B5190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getTUCallFilteringPreferencesContactsOnlyKey()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getTUCallFilteringPreferencesContactsOnlyKeySymbolLoc_ptr;
  v8 = getTUCallFilteringPreferencesContactsOnlyKeySymbolLoc_ptr;
  if (!getTUCallFilteringPreferencesContactsOnlyKeySymbolLoc_ptr)
  {
    v1 = TelephonyUtilitiesLibrary();
    v0 = (id *)dlsym(v1, "TUCallFilteringPreferencesContactsOnlyKey");
    v6[3] = (uint64_t)v0;
    getTUCallFilteringPreferencesContactsOnlyKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getTUCallFilteringPreferencesContactsOnlyKey(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFSilenceUnknownCallersSettingsClient.m"), 20, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_22D5B5288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getNPSManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!NanoPreferencesSyncLibraryCore_frameworkLibrary)
    NanoPreferencesSyncLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!NanoPreferencesSyncLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *NanoPreferencesSyncLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFSilenceUnknownCallersSettingsClient.m"), 21, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("NPSManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getNPSManagerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFSilenceUnknownCallersSettingsClient.m"), 22, CFSTR("Unable to find class %s"), "NPSManager");

LABEL_8:
    __break(1u);
  }
  getNPSManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *TelephonyUtilitiesLibrary()
{
  void *v0;
  void *v2;
  void *v3;

  if (!TelephonyUtilitiesLibraryCore_frameworkLibrary)
    TelephonyUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = (void *)TelephonyUtilitiesLibraryCore_frameworkLibrary;
  if (!TelephonyUtilitiesLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *TelephonyUtilitiesLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFSilenceUnknownCallersSettingsClient.m"), 18, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void sub_22D5B5658(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22D5B72FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22D5B8C40(void *a1)
{
  objc_begin_catch(a1);
  objc_end_catch();
  JUMPOUT(0x22D5B8C2CLL);
}

void sub_22D5BA168(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_22D5BAD2C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)&STACK[0x2E8]);
  _Unwind_Resume(a1);
}

id WFContactPropertyIDsFromActionProperties(void *a1)
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "if_compactMap:", &__block_literal_global_28881);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1)
    v1 = (void *)MEMORY[0x24BDBD1A8];
  v3 = v1;

  return v3;
}

id WFCNPropertyKeysFromActionProperties(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  WFContactPropertyIDsFromActionProperties(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "if_compactMap:", &__block_literal_global_125_28884);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x24BDBD1A8];
  v4 = v2;

  return v4;
}

void sub_22D5BD7C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getBBSettingsGatewayClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!BulletinBoardLibraryCore_frameworkLibrary)
    BulletinBoardLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!BulletinBoardLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *BulletinBoardLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFAnnounceNotificationsSettingsClient.m"), 18, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("BBSettingsGateway");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getBBSettingsGatewayClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFAnnounceNotificationsSettingsClient.m"), 19, CFSTR("Unable to find class %s"), "BBSettingsGateway");

LABEL_8:
    __break(1u);
  }
  getBBSettingsGatewayClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id UISCurrentUserInterfaceStyleValueFunction()
{
  return (id)classUISCurrentUserInterfaceStyleValue;
}

Class initUISCurrentUserInterfaceStyleValue()
{
  Class result;

  if (UIKitServicesLibrary_sOnce != -1)
    dispatch_once(&UIKitServicesLibrary_sOnce, &__block_literal_global_29063);
  result = objc_getClass("UISCurrentUserInterfaceStyleValue");
  classUISCurrentUserInterfaceStyleValue = (uint64_t)result;
  getUISCurrentUserInterfaceStyleValueClass = (uint64_t (*)())UISCurrentUserInterfaceStyleValueFunction;
  return result;
}

uint64_t (*initUISUserInterfaceStyleModeValueIsAutomatic(uint64_t a1))()
{
  uint64_t (*result)();

  if (UIKitServicesLibrary_sOnce != -1)
    dispatch_once(&UIKitServicesLibrary_sOnce, &__block_literal_global_29063);
  result = (uint64_t (*)())dlsym((void *)UIKitServicesLibrary_sLib, "UISUserInterfaceStyleModeValueIsAutomatic");
  softLinkUISUserInterfaceStyleModeValueIsAutomatic = result;
  if (result)
    return (uint64_t (*)())((uint64_t (*)(uint64_t))result)(a1);
  return result;
}

id UISUserInterfaceStyleModeFunction()
{
  return (id)classUISUserInterfaceStyleMode;
}

Class initUISUserInterfaceStyleMode()
{
  Class result;

  if (UIKitServicesLibrary_sOnce != -1)
    dispatch_once(&UIKitServicesLibrary_sOnce, &__block_literal_global_29063);
  result = objc_getClass("UISUserInterfaceStyleMode");
  classUISUserInterfaceStyleMode = (uint64_t)result;
  getUISUserInterfaceStyleModeClass = (uint64_t (*)())UISUserInterfaceStyleModeFunction;
  return result;
}

id WFDevicePossiblePlatformsTypeMapping()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x24BDAC8D0];
  v5[0] = &unk_24F93B030;
  WFLocalizedContentPropertyPossibleValueMarker(CFSTR("iOS"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v0;
  v5[1] = &unk_24F93B048;
  WFLocalizedContentPropertyPossibleValueMarker(CFSTR("macOS"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v1;
  v5[2] = &unk_24F93B060;
  WFLocalizedContentPropertyPossibleValueMarker(CFSTR("watchOS"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id WFDevicePossibleIdiomsTypeMapping()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  _QWORD v8[6];

  v8[5] = *MEMORY[0x24BDAC8D0];
  v7[0] = &unk_24F93B030;
  WFLocalizedContentPropertyPossibleValueMarker(CFSTR("iPhone"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v0;
  v7[1] = &unk_24F93B048;
  WFLocalizedContentPropertyPossibleValueMarker(CFSTR("iPad"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v1;
  v7[2] = &unk_24F93B078;
  WFLocalizedContentPropertyPossibleValueMarker(CFSTR("iPod"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v2;
  v7[3] = &unk_24F93B060;
  WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Mac"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v3;
  v7[4] = &unk_24F93B090;
  WFLocalizedContentPropertyPossibleValueMarker(CFSTR("Watch"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[4] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

const __CFString *PocketAPINameForHTTPMethod(int a1)
{
  if ((a1 - 1) > 2)
    return CFSTR("GET");
  else
    return off_24F8B5DF8[a1 - 1];
}

void sub_22D5C3F1C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_22D5C4170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__29992(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__29993(uint64_t a1)
{

}

id getMKMapItemClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getMKMapItemClass_softClass_29997;
  v7 = getMKMapItemClass_softClass_29997;
  if (!getMKMapItemClass_softClass_29997)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getMKMapItemClass_block_invoke_29998;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getMKMapItemClass_block_invoke_29998((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D5C46E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMKMapItemClass_block_invoke_29998(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!MapKitLibraryCore_frameworkLibrary_29999)
    MapKitLibraryCore_frameworkLibrary_29999 = _sl_dlopen();
  if (!MapKitLibraryCore_frameworkLibrary_29999)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *MapKitLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFGetDistanceAction.m"), 19, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("MKMapItem");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMKMapItemClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFGetDistanceAction.m"), 20, CFSTR("Unable to find class %s"), "MKMapItem");

LABEL_8:
    __break(1u);
  }
  getMKMapItemClass_softClass_29997 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getCLLocationClass_30013()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCLLocationClass_softClass_30014;
  v7 = getCLLocationClass_softClass_30014;
  if (!getCLLocationClass_softClass_30014)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getCLLocationClass_block_invoke_30015;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getCLLocationClass_block_invoke_30015((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D5C4BE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCLLocationClass_block_invoke_30015(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!CoreLocationLibraryCore_frameworkLibrary_30016)
    CoreLocationLibraryCore_frameworkLibrary_30016 = _sl_dlopen();
  if (!CoreLocationLibraryCore_frameworkLibrary_30016)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CoreLocationLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFGetDistanceAction.m"), 22, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("CLLocation");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCLLocationClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFGetDistanceAction.m"), 23, CFSTR("Unable to find class %s"), "CLLocation");

LABEL_8:
    __break(1u);
  }
  getCLLocationClass_softClass_30014 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_22D5C9804()
{
  objc_end_catch();
  JUMPOUT(0x22D5C980CLL);
}

void sub_22D5CFA10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D5D1580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy__31118(uint64_t a1, uint64_t a2)
{
  void *result;

  result = _Block_copy(*(const void **)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__31119(uint64_t a1)
{

}

id blogPath(void *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a1;
  fullBlogName(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("blog/%@/%@"), v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id fullBlogName(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;

  v1 = a1;
  if (objc_msgSend(v1, "rangeOfString:", CFSTR(".")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v1, "stringByAppendingString:", CFSTR(".tumblr.com"));
    v2 = objc_claimAutoreleasedReturnValue();

    v1 = (id)v2;
  }
  v3 = v1;

  return v3;
}

void sub_22D5D5E70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D5D6130(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__32025(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__32026(uint64_t a1)
{

}

void sub_22D5D71E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a34, 8);
  _Unwind_Resume(a1);
}

void __getVNRecognizeDocumentsRequestClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  VisionLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("VNRecognizeDocumentsRequest");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getVNRecognizeDocumentsRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getVNRecognizeDocumentsRequestClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFExtractTextFromImageAction.m"), 17, CFSTR("Unable to find class %s"), "VNRecognizeDocumentsRequest");

    __break(1u);
  }
}

void sub_22D5D7528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void __getVNImageRequestHandlerClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  VisionLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("VNImageRequestHandler");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getVNImageRequestHandlerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getVNImageRequestHandlerClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFExtractTextFromImageAction.m"), 16, CFSTR("Unable to find class %s"), "VNImageRequestHandler");

    __break(1u);
  }
}

void VisionLibrary()
{
  void *v0;
  void *v1;
  void *v2;

  if (!VisionLibraryCore_frameworkLibrary)
    VisionLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!VisionLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *VisionLibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("WFExtractTextFromImageAction.m"), 15, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

void __getVNDocumentObservationClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  VisionLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("VNDocumentObservation");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getVNDocumentObservationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getVNDocumentObservationClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFExtractTextFromImageAction.m"), 18, CFSTR("Unable to find class %s"), "VNDocumentObservation");

    __break(1u);
  }
}

void sub_22D5D9744(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_22D5DB5DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D5DC3D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getMFMailAccountProxyGeneratorClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  MessageUILibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MFMailAccountProxyGenerator");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMFMailAccountProxyGeneratorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMFMailAccountProxyGeneratorClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFSendEmailAction.m"), 30, CFSTR("Unable to find class %s"), "MFMailAccountProxyGenerator");

    __break(1u);
  }
}

void MessageUILibrary()
{
  void *v0;
  void *v1;
  void *v2;

  if (!MessageUILibraryCore_frameworkLibrary)
    MessageUILibraryCore_frameworkLibrary = _sl_dlopen();
  if (!MessageUILibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *MessageUILibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("WFSendEmailAction.m"), 29, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

void __getMFMailComposeViewControllerClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  MessageUILibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MFMailComposeViewController");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMFMailComposeViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMFMailComposeViewControllerClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFSendEmailAction.m"), 31, CFSTR("Unable to find class %s"), "MFMailComposeViewController");

    __break(1u);
  }
}

void sub_22D5DD678(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 216), 8);
  _Unwind_Resume(a1);
}

void getkCLLocationCoordinate2DInvalid()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (void *)getkCLLocationCoordinate2DInvalidSymbolLoc_ptr;
  v7 = getkCLLocationCoordinate2DInvalidSymbolLoc_ptr;
  if (!getkCLLocationCoordinate2DInvalidSymbolLoc_ptr)
  {
    v1 = CoreLocationLibrary_33025();
    v0 = dlsym(v1, "kCLLocationCoordinate2DInvalid");
    v5[3] = (uint64_t)v0;
    getkCLLocationCoordinate2DInvalidSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CLLocationCoordinate2D getkCLLocationCoordinate2DInvalid(void)");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFGetHalfwayPointAction.m"), 17, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_22D5DD7A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__33018(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__33019(uint64_t a1)
{

}

void sub_22D5DDB50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void WFCLLocationCoordinate2DIsValid(double a1, double a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v4 = getCLLocationCoordinate2DIsValidSymbolLoc_ptr;
  v11 = getCLLocationCoordinate2DIsValidSymbolLoc_ptr;
  if (!getCLLocationCoordinate2DIsValidSymbolLoc_ptr)
  {
    v5 = CoreLocationLibrary_33025();
    v4 = dlsym(v5, "CLLocationCoordinate2DIsValid");
    v9[3] = (uint64_t)v4;
    getCLLocationCoordinate2DIsValidSymbolLoc_ptr = v4;
  }
  _Block_object_dispose(&v8, 8);
  if (v4)
  {
    ((void (*)(double, double))v4)(a1, a2);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL WFCLLocationCoordinate2DIsValid(CLLocationCoordinate2D)");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("WFGetHalfwayPointAction.m"), 16, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_22D5DDC60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getCLLocationClass_block_invoke_33022(uint64_t a1)
{
  void *v2;
  void *v3;

  CoreLocationLibrary_33025();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("CLLocation");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCLLocationClass_softClass_33021 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCLLocationClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFGetHalfwayPointAction.m"), 13, CFSTR("Unable to find class %s"), "CLLocation");

    __break(1u);
  }
}

void *CoreLocationLibrary_33025()
{
  void *v0;
  void *v2;
  void *v3;

  if (!CoreLocationLibraryCore_frameworkLibrary_33034)
    CoreLocationLibraryCore_frameworkLibrary_33034 = _sl_dlopen();
  v0 = (void *)CoreLocationLibraryCore_frameworkLibrary_33034;
  if (!CoreLocationLibraryCore_frameworkLibrary_33034)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CoreLocationLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFGetHalfwayPointAction.m"), 12, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void sub_22D5DE004(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void __getCLPlacemarkClass_block_invoke_33053(uint64_t a1)
{
  void *v2;
  void *v3;

  CoreLocationLibrary_33025();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("CLPlacemark");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCLPlacemarkClass_softClass_33052 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCLPlacemarkClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFGetHalfwayPointAction.m"), 14, CFSTR("Unable to find class %s"), "CLPlacemark");

    __break(1u);
  }
}

void sub_22D5DE234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getCLGeocoderClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  CoreLocationLibrary_33025();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("CLGeocoder");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCLGeocoderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCLGeocoderClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFGetHalfwayPointAction.m"), 15, CFSTR("Unable to find class %s"), "CLGeocoder");

    __break(1u);
  }
}

void sub_22D5DFEB8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

Class __getAVAudioSessionClass_block_invoke_33483(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!AVFoundationLibraryCore_frameworkLibrary_33486)
    AVFoundationLibraryCore_frameworkLibrary_33486 = _sl_dlopen();
  if (!AVFoundationLibraryCore_frameworkLibrary_33486)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *AVFoundationLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFMicrophoneAccessResource.m"), 16, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("AVAudioSession");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAVAudioSessionClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFMicrophoneAccessResource.m"), 17, CFSTR("Unable to find class %s"), "AVAudioSession");

LABEL_8:
    __break(1u);
  }
  getAVAudioSessionClass_softClass_33482 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void WFContentCollectionFromStorageServiceResult(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a1;
  v7 = a2;
  v8 = a4;
  if (!objc_msgSend(v6, "count"))
    (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);
  v12 = v8;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __WFContentCollectionFromStorageServiceResult_block_invoke;
  v13[3] = &unk_24F8B6960;
  v14 = v7;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __WFContentCollectionFromStorageServiceResult_block_invoke_2;
  v11[3] = &unk_24F8B9110;
  v9 = v8;
  v10 = v7;
  objc_msgSend(v6, "if_mapAsynchronously:completionHandler:", v13, v11);

}

id UIPasteboardChangedNotificationFunction()
{
  return (id)constantUIPasteboardChangedNotification;
}

id initUIPasteboardChangedNotification()
{
  id *v0;

  if (UIKitLibrary_sOnce_33537 != -1)
    dispatch_once(&UIKitLibrary_sOnce_33537, &__block_literal_global_33538);
  v0 = (id *)dlsym((void *)UIKitLibrary_sLib_33539, "UIPasteboardChangedNotification");
  if (!v0)
    __assert_rtn("initUIPasteboardChangedNotification", "WFSetClipboardAction.m", 21, "constant");
  objc_storeStrong((id *)&constantUIPasteboardChangedNotification, *v0);
  getUIPasteboardChangedNotification = (uint64_t (*)())UIPasteboardChangedNotificationFunction;
  return (id)constantUIPasteboardChangedNotification;
}

id UIPasteboardFunction()
{
  return (id)classUIPasteboard;
}

Class initUIPasteboard()
{
  Class result;

  if (UIKitLibrary_sOnce_33537 != -1)
    dispatch_once(&UIKitLibrary_sOnce_33537, &__block_literal_global_33538);
  result = objc_getClass("UIPasteboard");
  classUIPasteboard = (uint64_t)result;
  getUIPasteboardClass = (uint64_t (*)())UIPasteboardFunction;
  return result;
}

id UIPasteboardOptionExpirationDateFunction()
{
  return (id)constantUIPasteboardOptionExpirationDate;
}

id initUIPasteboardOptionExpirationDate()
{
  id *v0;

  if (UIKitLibrary_sOnce_33537 != -1)
    dispatch_once(&UIKitLibrary_sOnce_33537, &__block_literal_global_33538);
  v0 = (id *)dlsym((void *)UIKitLibrary_sLib_33539, "UIPasteboardOptionExpirationDate");
  if (!v0)
    __assert_rtn("initUIPasteboardOptionExpirationDate", "WFSetClipboardAction.m", 20, "constant");
  objc_storeStrong((id *)&constantUIPasteboardOptionExpirationDate, *v0);
  getUIPasteboardOptionExpirationDate = (uint64_t (*)())UIPasteboardOptionExpirationDateFunction;
  return (id)constantUIPasteboardOptionExpirationDate;
}

id UIPasteboardOptionLocalOnlyFunction()
{
  return (id)constantUIPasteboardOptionLocalOnly;
}

id initUIPasteboardOptionLocalOnly()
{
  id *v0;

  if (UIKitLibrary_sOnce_33537 != -1)
    dispatch_once(&UIKitLibrary_sOnce_33537, &__block_literal_global_33538);
  v0 = (id *)dlsym((void *)UIKitLibrary_sLib_33539, "UIPasteboardOptionLocalOnly");
  if (!v0)
    __assert_rtn("initUIPasteboardOptionLocalOnly", "WFSetClipboardAction.m", 19, "constant");
  objc_storeStrong((id *)&constantUIPasteboardOptionLocalOnly, *v0);
  getUIPasteboardOptionLocalOnly = (uint64_t (*)())UIPasteboardOptionLocalOnlyFunction;
  return (id)constantUIPasteboardOptionLocalOnly;
}

void sub_22D5E2BE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D5E2FBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22D5E36EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18, id a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  id *v31;
  id *v32;
  id *v33;
  uint64_t v34;

  objc_destroyWeak(v33);
  objc_destroyWeak(v32);
  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  objc_destroyWeak(&a19);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v34 - 160), 8);
  _Unwind_Resume(a1);
}

id getMPAVEndpointRouteClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getMPAVEndpointRouteClass_softClass_33846;
  v7 = getMPAVEndpointRouteClass_softClass_33846;
  if (!getMPAVEndpointRouteClass_softClass_33846)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getMPAVEndpointRouteClass_block_invoke_33847;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getMPAVEndpointRouteClass_block_invoke_33847((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D5E3F50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id WFEnforceClass_33843(void *a1, uint64_t a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  id v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  if (v3 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    getWFGeneralLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      v8 = 136315906;
      v9 = "WFEnforceClass";
      v10 = 2114;
      v11 = v3;
      v12 = 2114;
      v13 = (id)objc_opt_class();
      v14 = 2114;
      v15 = a2;
      v6 = v13;
      _os_log_impl(&dword_22D353000, v5, OS_LOG_TYPE_FAULT, "%s Setting audio session category for route discovery failed: %d error: %@", (uint8_t *)&v8, 0x2Au);

    }
    v4 = 0;
  }
  else
  {
    v4 = v3;
  }

  return v4;
}

void __getMPAVEndpointRouteClass_block_invoke_33847(uint64_t a1)
{
  void *v2;
  void *v3;

  MediaPlayerLibrary_33848();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MPAVEndpointRoute");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMPAVEndpointRouteClass_softClass_33846 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMPAVEndpointRouteClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFMediaRoutePicker.m"), 24, CFSTR("Unable to find class %s"), "MPAVEndpointRoute");

    __break(1u);
  }
}

void MediaPlayerLibrary_33848()
{
  void *v0;
  void *v1;
  void *v2;

  if (!MediaPlayerLibraryCore_frameworkLibrary_33854)
    MediaPlayerLibraryCore_frameworkLibrary_33854 = _sl_dlopen();
  if (!MediaPlayerLibraryCore_frameworkLibrary_33854)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *MediaPlayerLibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("WFMediaRoutePicker.m"), 20, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

void *__Block_byref_object_copy__33870(uint64_t a1, uint64_t a2)
{
  void *result;

  result = _Block_copy(*(const void **)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__33871(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy__28(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__29(uint64_t a1)
{

}

void sub_22D5E4DC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id WFMediaRoutePickerInjectRouteNameInUserInfoIfPossible(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v11 = CFSTR("InvolvedMediaRoute");
    v12[0] = a1;
    v5 = (void *)MEMORY[0x24BDBCE70];
    v6 = a1;
    objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v4, "if_dictionaryByAddingEntriesFromDictionary:", v7);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = v7;
    }
    v9 = v8;

  }
  else
  {
    v9 = v3;
  }

  return v9;
}

void __getMPAVOutputDeviceRoutingDataSourceClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  MediaPlayerLibrary_33848();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MPAVOutputDeviceRoutingDataSource");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMPAVOutputDeviceRoutingDataSourceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMPAVOutputDeviceRoutingDataSourceClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFMediaRoutePicker.m"), 23, CFSTR("Unable to find class %s"), "MPAVOutputDeviceRoutingDataSource");

    __break(1u);
  }
}

void __getMPAVRoutingControllerClass_block_invoke_33930(uint64_t a1)
{
  void *v2;
  void *v3;

  MediaPlayerLibrary_33848();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MPAVRoutingController");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMPAVRoutingControllerClass_softClass_33929 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMPAVRoutingControllerClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFMediaRoutePicker.m"), 21, CFSTR("Unable to find class %s"), "MPAVRoutingController");

    __break(1u);
  }
}

uint64_t WFMediaRoutePickerErrorCodeFromMRMediaRemoteError(int a1)
{
  if (a1 == 35)
    return 8;
  else
    return 7;
}

void WFPerformBooleanSettingIntent(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  const __CFString *v12;
  objc_class *v13;
  void *v14;
  id v15;
  id v16;
  objc_class *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  _BYTE v23[24];
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = a1;
  v8 = objc_msgSend(v7, "operation");
  objc_msgSend(v7, "state");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "BOOLValue");
  getWFBundledIntentsLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    if (v8 > 2)
      v12 = CFSTR("Invalid");
    else
      v12 = off_24F8B6D70[v8];
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v23 = 136315906;
    *(_QWORD *)&v23[4] = "WFPerformBooleanSettingIntent";
    *(_WORD *)&v23[12] = 2114;
    *(_QWORD *)&v23[14] = v12;
    *(_WORD *)&v23[22] = 2114;
    v24 = v14;
    LOWORD(v25) = 1024;
    *(_DWORD *)((char *)&v25 + 2) = v10;
    _os_log_impl(&dword_22D353000, v11, OS_LOG_TYPE_INFO, "%s Applying operation %{public}@ to %{public}@ with state %d", v23, 0x26u);

  }
  if (v8 == 2)
  {
    v15 = v5;
    v16 = v6;
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)v23 = MEMORY[0x24BDAC760];
    *(_QWORD *)&v23[8] = 3221225472;
    *(_QWORD *)&v23[16] = __WFToggleBooleanSetting_block_invoke;
    v24 = &unk_24F8B6D50;
    v26 = v15;
    v27 = v16;
    v25 = v18;
    v19 = v18;
    v20 = v16;
    v21 = v15;
    objc_msgSend(v21, "getStateWithCompletionHandler:", v23);

LABEL_13:
    goto LABEL_14;
  }
  if (v8 != 1)
  {
    getWFBundledIntentsLogObject();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v23 = 136315138;
      *(_QWORD *)&v23[4] = "WFPerformBooleanSettingIntent";
      _os_log_impl(&dword_22D353000, v22, OS_LOG_TYPE_ERROR, "%s Unknown operation!", v23, 0xCu);
    }

    WFSettingsClientError();
    v21 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))v6 + 2))(v6, v21);
    goto LABEL_13;
  }
  objc_msgSend(v5, "setState:completionHandler:", v10, v6);
LABEL_14:

}

id WFTodoistErrorFromResponseObject(void *a1)
{
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = v1;
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("error_code"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_class();
    WFEnforceClass(v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)objc_opt_new();
      objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("error"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_opt_class();
      WFEnforceClass(v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        objc_msgSend(v6, "setObject:forKey:", v9, *MEMORY[0x24BDD0FC8]);
      objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("error_extra"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_opt_class();
      WFEnforceClass(v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        objc_msgSend(v6, "addEntriesFromDictionary:", v12);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("WFTodoistErrorDomain"), objc_msgSend(v5, "integerValue"), v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "code") == 32)
      {
        objc_msgSend(v13, "userInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v14, "mutableCopy");

        objc_msgSend(v15, "setObject:forKey:", CFSTR("Premium Required"), *MEMORY[0x24BDD0FD8]);
        objc_msgSend(v15, "setObject:forKey:", CFSTR("Adding notes, reminders, and files requires a Todoist premium subscription."), *MEMORY[0x24BDD0FC8]);
        v16 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(v13, "domain");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, objc_msgSend(v13, "code"), v15);
        v18 = objc_claimAutoreleasedReturnValue();

        v13 = (void *)v18;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void sub_22D5EBCE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

Class __getPHAssetClass_block_invoke_34895(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!PhotosLibraryCore_frameworkLibrary_34898)
    PhotosLibraryCore_frameworkLibrary_34898 = _sl_dlopen();
  if (!PhotosLibraryCore_frameworkLibrary_34898)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *PhotosLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFSelectPhotoAction.m"), 15, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("PHAsset");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getPHAssetClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFSelectPhotoAction.m"), 16, CFSTR("Unable to find class %s"), "PHAsset");

LABEL_8:
    __break(1u);
  }
  getPHAssetClass_softClass_34894 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id EMFEmojiLocaleDataFunction()
{
  return (id)classEMFEmojiLocaleData;
}

Class initEMFEmojiLocaleData()
{
  Class result;

  if (EmojiFoundationLibrary_sOnce != -1)
    dispatch_once(&EmojiFoundationLibrary_sOnce, &__block_literal_global_34990);
  result = objc_getClass("EMFEmojiLocaleData");
  classEMFEmojiLocaleData = (uint64_t)result;
  getEMFEmojiLocaleDataClass = (uint64_t (*)())EMFEmojiLocaleDataFunction;
  return result;
}

id EMFEmojiTokenFunction()
{
  return (id)classEMFEmojiToken;
}

Class initEMFEmojiToken()
{
  Class result;

  if (EmojiFoundationLibrary_sOnce != -1)
    dispatch_once(&EmojiFoundationLibrary_sOnce, &__block_literal_global_34990);
  result = objc_getClass("EMFEmojiToken");
  classEMFEmojiToken = (uint64_t)result;
  getEMFEmojiTokenClass = (uint64_t (*)())EMFEmojiTokenFunction;
  return result;
}

void sub_22D5EF6A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D5EF9F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D5F03C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D5F06A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D5F0840(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D5F09F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getFPDeleteOperationClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  FileProviderLibrary_35451();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("FPDeleteOperation");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getFPDeleteOperationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getFPDeleteOperationClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFDefaultFileStorageService.m"), 39, CFSTR("Unable to find class %s"), "FPDeleteOperation");

    __break(1u);
  }
}

void __getFPTrashOperationClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  FileProviderLibrary_35451();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("FPTrashOperation");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getFPTrashOperationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getFPTrashOperationClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFDefaultFileStorageService.m"), 40, CFSTR("Unable to find class %s"), "FPTrashOperation");

    __break(1u);
  }
}

id getFPItemManagerClass_35448()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getFPItemManagerClass_softClass_35449;
  v7 = getFPItemManagerClass_softClass_35449;
  if (!getFPItemManagerClass_softClass_35449)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getFPItemManagerClass_block_invoke_35450;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getFPItemManagerClass_block_invoke_35450((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D5F0D2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getFPItemManagerClass_block_invoke_35450(uint64_t a1)
{
  void *v2;
  void *v3;

  FileProviderLibrary_35451();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("FPItemManager");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getFPItemManagerClass_softClass_35449 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getFPItemManagerClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFDefaultFileStorageService.m"), 37, CFSTR("Unable to find class %s"), "FPItemManager");

    __break(1u);
  }
}

void *FileProviderLibrary_35451()
{
  void *v0;
  void *v2;
  void *v3;

  if (!FileProviderLibraryCore_frameworkLibrary_35460)
    FileProviderLibraryCore_frameworkLibrary_35460 = _sl_dlopen();
  v0 = (void *)FileProviderLibraryCore_frameworkLibrary_35460;
  if (!FileProviderLibraryCore_frameworkLibrary_35460)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *FileProviderLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFDefaultFileStorageService.m"), 35, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void __getFPRenameOperationClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  FileProviderLibrary_35451();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("FPRenameOperation");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getFPRenameOperationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getFPRenameOperationClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFDefaultFileStorageService.m"), 41, CFSTR("Unable to find class %s"), "FPRenameOperation");

    __break(1u);
  }
}

void __getFPCopyOperationClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  FileProviderLibrary_35451();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("FPCopyOperation");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getFPCopyOperationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getFPCopyOperationClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFDefaultFileStorageService.m"), 43, CFSTR("Unable to find class %s"), "FPCopyOperation");

    __break(1u);
  }
}

void __getFPMoveOperationClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  FileProviderLibrary_35451();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("FPMoveOperation");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getFPMoveOperationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getFPMoveOperationClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFDefaultFileStorageService.m"), 42, CFSTR("Unable to find class %s"), "FPMoveOperation");

    __break(1u);
  }
}

void __getFPCreateFolderOperationClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  FileProviderLibrary_35451();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("FPCreateFolderOperation");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getFPCreateFolderOperationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getFPCreateFolderOperationClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFDefaultFileStorageService.m"), 38, CFSTR("Unable to find class %s"), "FPCreateFolderOperation");

    __break(1u);
  }
}

void sub_22D5F1788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getNSFileProviderErrorItemKey()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getNSFileProviderErrorItemKeySymbolLoc_ptr;
  v8 = getNSFileProviderErrorItemKeySymbolLoc_ptr;
  if (!getNSFileProviderErrorItemKeySymbolLoc_ptr)
  {
    v1 = FileProviderLibrary_35451();
    v0 = (id *)dlsym(v1, "NSFileProviderErrorItemKey");
    v6[3] = (uint64_t)v0;
    getNSFileProviderErrorItemKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSErrorUserInfoKey getNSFileProviderErrorItemKey(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFDefaultFileStorageService.m"), 44, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_22D5F188C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getFPItemClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  FileProviderLibrary_35451();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("FPItem");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getFPItemClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getFPItemClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFDefaultFileStorageService.m"), 36, CFSTR("Unable to find class %s"), "FPItem");

    __break(1u);
  }
}

uint64_t __Block_byref_object_copy__35498(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__35499(uint64_t a1)
{

}

void sub_22D5F2BB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D5F3560(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  uint64_t v41;

  _Block_object_dispose(&a41, 8);
  _Block_object_dispose((const void *)(v41 - 224), 8);
  _Block_object_dispose((const void *)(v41 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_22D5F4DFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getMPMediaPlaylistCreationMetadataClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  MediaPlayerLibrary_35837();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MPMediaPlaylistCreationMetadata");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMPMediaPlaylistCreationMetadataClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMPMediaPlaylistCreationMetadataClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFCreatePlaylistAction.m"), 18, CFSTR("Unable to find class %s"), "MPMediaPlaylistCreationMetadata");

    __break(1u);
  }
}

void __getMPMediaLibraryClass_block_invoke_35834(uint64_t a1)
{
  void *v2;
  void *v3;

  MediaPlayerLibrary_35837();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MPMediaLibrary");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMPMediaLibraryClass_softClass_35833 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMPMediaLibraryClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFCreatePlaylistAction.m"), 17, CFSTR("Unable to find class %s"), "MPMediaLibrary");

    __break(1u);
  }
}

void MediaPlayerLibrary_35837()
{
  void *v0;
  void *v1;
  void *v2;

  if (!MediaPlayerLibraryCore_frameworkLibrary_35845)
    MediaPlayerLibraryCore_frameworkLibrary_35845 = _sl_dlopen();
  if (!MediaPlayerLibraryCore_frameworkLibrary_35845)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *MediaPlayerLibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("WFCreatePlaylistAction.m"), 16, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

id getMKMapItemClass_35886()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getMKMapItemClass_softClass_35936;
  v7 = getMKMapItemClass_softClass_35936;
  if (!getMKMapItemClass_softClass_35936)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getMKMapItemClass_block_invoke_35937;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getMKMapItemClass_block_invoke_35937((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D5F57C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void WFGetMapItemFromContentCollection(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  v16[0] = objc_opt_class();
  v16[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __WFGetMapItemFromContentCollection_block_invoke;
  v12[3] = &unk_24F8B7308;
  v14 = v5;
  v15 = v7;
  v13 = v6;
  v9 = v5;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v9, "generateCollectionByCoercingToItemClasses:completionHandler:", v8, v12);

}

void sub_22D5F5B30(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_22D5F5EE8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getCLPlacemarkClass_block_invoke_35891(uint64_t a1)
{
  void *v2;
  void *v3;

  CoreLocationLibrary_35908();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("CLPlacemark");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCLPlacemarkClass_softClass_35890 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCLPlacemarkClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFGetTravelTimeAction.m"), 31, CFSTR("Unable to find class %s"), "CLPlacemark");

    __break(1u);
  }
}

void WFGetMapItemFromString(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v3, "length"))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2050000000;
    v5 = (void *)getCLGeocoderClass_softClass_35892;
    v15 = getCLGeocoderClass_softClass_35892;
    v6 = MEMORY[0x24BDAC760];
    if (!getCLGeocoderClass_softClass_35892)
    {
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __getCLGeocoderClass_block_invoke_35893;
      v11[3] = &unk_24F8BB430;
      v11[4] = &v12;
      __getCLGeocoderClass_block_invoke_35893((uint64_t)v11);
      v5 = (void *)v13[3];
    }
    v7 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v12, 8);
    v8 = (void *)objc_opt_new();
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __WFGetMapItemFromString_block_invoke;
    v9[3] = &unk_24F8B9110;
    v10 = v4;
    objc_msgSend(v8, "geocodeAddressString:completionHandler:", v3, v9);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

void sub_22D5F6118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getCLGeocoderClass_block_invoke_35893(uint64_t a1)
{
  void *v2;
  void *v3;

  CoreLocationLibrary_35908();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("CLGeocoder");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCLGeocoderClass_softClass_35892 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCLGeocoderClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFGetTravelTimeAction.m"), 30, CFSTR("Unable to find class %s"), "CLGeocoder");

    __break(1u);
  }
}

id getMKPlacemarkClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getMKPlacemarkClass_softClass;
  v7 = getMKPlacemarkClass_softClass;
  if (!getMKPlacemarkClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getMKPlacemarkClass_block_invoke;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getMKPlacemarkClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D5F6360(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getMKPlacemarkClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  MapKitLibrary_35894();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MKPlacemark");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMKPlacemarkClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMKPlacemarkClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFGetTravelTimeAction.m"), 23, CFSTR("Unable to find class %s"), "MKPlacemark");

    __break(1u);
  }
}

void *MapKitLibrary_35894()
{
  void *v0;
  void *v2;
  void *v3;

  if (!MapKitLibraryCore_frameworkLibrary_35902)
    MapKitLibraryCore_frameworkLibrary_35902 = _sl_dlopen();
  v0 = (void *)MapKitLibraryCore_frameworkLibrary_35902;
  if (!MapKitLibraryCore_frameworkLibrary_35902)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *MapKitLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFGetTravelTimeAction.m"), 21, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void *CoreLocationLibrary_35908()
{
  void *v0;
  void *v2;
  void *v3;

  if (!CoreLocationLibraryCore_frameworkLibrary_35911)
    CoreLocationLibraryCore_frameworkLibrary_35911 = _sl_dlopen();
  v0 = (void *)CoreLocationLibraryCore_frameworkLibrary_35911;
  if (!CoreLocationLibraryCore_frameworkLibrary_35911)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CoreLocationLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFGetTravelTimeAction.m"), 29, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void __getMKMapItemClass_block_invoke_35937(uint64_t a1)
{
  void *v2;
  void *v3;

  MapKitLibrary_35894();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MKMapItem");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMKMapItemClass_softClass_35936 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMKMapItemClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFGetTravelTimeAction.m"), 24, CFSTR("Unable to find class %s"), "MKMapItem");

    __break(1u);
  }
}

void WFGetTravelTime(void *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v8 = a5;
  v9 = a2;
  v10 = a1;
  objc_msgSend(getMKLocationManagerClass(), "sharedLocationManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContinuesWhileInactive:", 1);

  objc_msgSend(getMKLocationManagerClass(), "sharedLocationManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  WFSetEffectiveBundleForMKLocationManager();

  getMKDirectionsRequestClass();
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setSource:", v10);

  objc_msgSend(v13, "setDestination:", v9);
  objc_msgSend(v13, "setTransportType:", a3);
  v14 = (void *)objc_msgSend(objc_alloc((Class)getMKDirectionsClass()), "initWithRequest:", v13);
  WFCLInUseAssertionWithOptions();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __WFGetTravelTime_block_invoke;
  v18[3] = &unk_24F8B7330;
  v19 = v15;
  v20 = v8;
  v16 = v15;
  v17 = v8;
  objc_msgSend(v14, "calculateETAWithCompletionHandler:", v18);

}

void WFGetTravelTimeWithTripInfo(void *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v8 = a5;
  v9 = a2;
  v10 = a1;
  objc_msgSend(getMKLocationManagerClass(), "sharedLocationManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setContinuesWhileInactive:", 1);

  objc_msgSend(getMKLocationManagerClass(), "sharedLocationManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  WFSetEffectiveBundleForMKLocationManager();

  getMKDirectionsRequestClass();
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setSource:", v10);

  objc_msgSend(v13, "setDestination:", v9);
  objc_msgSend(v13, "setTransportType:", a3);
  v14 = (void *)objc_msgSend(objc_alloc((Class)getMKDirectionsClass()), "initWithRequest:", v13);
  WFCLInUseAssertionWithOptions();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __WFGetTravelTimeWithTripInfo_block_invoke;
  v18[3] = &unk_24F8B7358;
  v19 = v15;
  v20 = v8;
  v16 = v15;
  v17 = v8;
  objc_msgSend(v14, "calculateDirectionsWithCompletionHandler:", v18);

}

id getMKLocationManagerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getMKLocationManagerClass_softClass;
  v7 = getMKLocationManagerClass_softClass;
  if (!getMKLocationManagerClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getMKLocationManagerClass_block_invoke;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getMKLocationManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D5F6ED8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getMKDirectionsRequestClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getMKDirectionsRequestClass_softClass;
  v7 = getMKDirectionsRequestClass_softClass;
  if (!getMKDirectionsRequestClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getMKDirectionsRequestClass_block_invoke;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getMKDirectionsRequestClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D5F6F90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getMKDirectionsClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getMKDirectionsClass_softClass;
  v7 = getMKDirectionsClass_softClass;
  if (!getMKDirectionsClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getMKDirectionsClass_block_invoke;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getMKDirectionsClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D5F7048(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id WFLocalizedMapKitError(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  _QWORD *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  _QWORD v31[5];
  _QWORD v32[6];

  v32[5] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = v1;
  if (!v1)
    goto LABEL_8;
  objc_msgSend(v1, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v4 = (_QWORD *)getMKErrorDomainSymbolLoc_ptr_35964;
  v28 = getMKErrorDomainSymbolLoc_ptr_35964;
  if (!getMKErrorDomainSymbolLoc_ptr_35964)
  {
    v5 = MapKitLibrary_35894();
    v4 = dlsym(v5, "MKErrorDomain");
    v26[3] = (uint64_t)v4;
    getMKErrorDomainSymbolLoc_ptr_35964 = (uint64_t)v4;
  }
  _Block_object_dispose(&v25, 8);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSErrorDomain getMKErrorDomain(void)");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("WFGetTravelTimeAction.m"), 22, CFSTR("%s"), dlerror(), v25);

    __break(1u);
  }
  v6 = objc_msgSend(v3, "isEqualToString:", *v4);

  if ((v6 & 1) != 0)
  {
    v31[0] = &unk_24F93B2E8;
    WFLocalizedString(CFSTR("An unknown mapping error occurred."));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v7;
    v31[1] = &unk_24F93B300;
    WFLocalizedString(CFSTR("The map server was unable to return the desired information"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v8;
    v31[2] = &unk_24F93B318;
    WFLocalizedString(CFSTR("The data was not loaded because data throttling is in effect. This can occur when making frequent requests for data over a short period of time."));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = v9;
    v31[3] = &unk_24F93B330;
    WFLocalizedString(CFSTR("The specified placemark could not be found."));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v32[3] = v10;
    v31[4] = &unk_24F93B348;
    WFLocalizedString(CFSTR("The specified directions could not be found."));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v32[4] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v2, "code");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = v15 == 0;

    if ((_DWORD)v10)
    {
      v21 = v2;
    }
    else
    {
      v16 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(v2, "domain");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v19;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, v13, v20);
      v21 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
LABEL_8:
    v21 = v2;
  }

  return v21;
}

void sub_22D5F748C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getMKDirectionsClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  MapKitLibrary_35894();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MKDirections");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMKDirectionsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMKDirectionsClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFGetTravelTimeAction.m"), 27, CFSTR("Unable to find class %s"), "MKDirections");

    __break(1u);
  }
}

void __getMKDirectionsRequestClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  MapKitLibrary_35894();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MKDirectionsRequest");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMKDirectionsRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMKDirectionsRequestClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFGetTravelTimeAction.m"), 26, CFSTR("Unable to find class %s"), "MKDirectionsRequest");

    __break(1u);
  }
}

void __getMKLocationManagerClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  MapKitLibrary_35894();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MKLocationManager");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMKLocationManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMKLocationManagerClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFGetTravelTimeAction.m"), 25, CFSTR("Unable to find class %s"), "MKLocationManager");

    __break(1u);
  }
}

void WFGetTravelTimeFromCurrentLocation(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  id v9;

  v7 = a4;
  v8 = a1;
  objc_msgSend(getMKMapItemClass_35886(), "mapItemForCurrentLocation");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  WFGetTravelTime(v9, v8, a2, a3, v7);

}

void WFGetTravelTimeFromCurrentLocationWithTripInfo(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  id v9;

  v7 = a4;
  v8 = a1;
  objc_msgSend(getMKMapItemClass_35886(), "mapItemForCurrentLocation");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  WFGetTravelTimeWithTripInfo(v9, v8, a2, a3, v7);

}

void sub_22D5F93B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D5F97EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *BackBoardServicesLibrary()
{
  void *v0;
  void *v2;
  void *v3;

  if (!BackBoardServicesLibraryCore_frameworkLibrary)
    BackBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = (void *)BackBoardServicesLibraryCore_frameworkLibrary;
  if (!BackBoardServicesLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *BackBoardServicesLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFBrightnessSettingsClient.m"), 17, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void sub_22D5FC9DC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

id getAVAudioSessionClass_36797()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getAVAudioSessionClass_softClass_36798;
  v7 = getAVAudioSessionClass_softClass_36798;
  if (!getAVAudioSessionClass_softClass_36798)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getAVAudioSessionClass_block_invoke_36799;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getAVAudioSessionClass_block_invoke_36799((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D5FCCA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getAVAudioSessionClass_block_invoke_36799(uint64_t a1)
{
  void *v2;
  void *v3;

  AVFoundationLibrary_36800();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AVAudioSession");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVAudioSessionClass_softClass_36798 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAVAudioSessionClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFPlaySoundAction.m"), 16, CFSTR("Unable to find class %s"), "AVAudioSession");

    __break(1u);
  }
}

void *AVFoundationLibrary_36800()
{
  void *v0;
  void *v2;
  void *v3;

  if (!AVFoundationLibraryCore_frameworkLibrary_36809)
    AVFoundationLibraryCore_frameworkLibrary_36809 = _sl_dlopen();
  v0 = (void *)AVFoundationLibraryCore_frameworkLibrary_36809;
  if (!AVFoundationLibraryCore_frameworkLibrary_36809)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *AVFoundationLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFPlaySoundAction.m"), 15, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void getAVAudioSessionCategoryPlayback_36818()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getAVAudioSessionCategoryPlaybackSymbolLoc_ptr_36831;
  v8 = getAVAudioSessionCategoryPlaybackSymbolLoc_ptr_36831;
  if (!getAVAudioSessionCategoryPlaybackSymbolLoc_ptr_36831)
  {
    v1 = AVFoundationLibrary_36800();
    v0 = (id *)dlsym(v1, "AVAudioSessionCategoryPlayback");
    v6[3] = (uint64_t)v0;
    getAVAudioSessionCategoryPlaybackSymbolLoc_ptr_36831 = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AVAudioSessionCategory getAVAudioSessionCategoryPlayback(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFPlaySoundAction.m"), 19, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_22D5FCF60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getAVAudioPlayerClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  AVFoundationLibrary_36800();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AVAudioPlayer");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVAudioPlayerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAVAudioPlayerClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFPlaySoundAction.m"), 17, CFSTR("Unable to find class %s"), "AVAudioPlayer");

    __break(1u);
  }
}

void sub_22D5FD604(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22D5FE3DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__37122(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__37123(uint64_t a1)
{

}

void sub_22D5FF114(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

Class __getPHPhotoLibraryClass_block_invoke_37202(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!PhotosLibraryCore_frameworkLibrary_37203)
    PhotosLibraryCore_frameworkLibrary_37203 = _sl_dlopen();
  if (!PhotosLibraryCore_frameworkLibrary_37203)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *PhotosLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFPhotoAccessResource.m"), 15, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("PHPhotoLibrary");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getPHPhotoLibraryClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFPhotoAccessResource.m"), 16, CFSTR("Unable to find class %s"), "PHPhotoLibrary");

LABEL_8:
    __break(1u);
  }
  getPHPhotoLibraryClass_softClass_37201 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id WFiTunesPodcastObjectsFromDatabaseShows(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __WFiTunesPodcastObjectsFromDatabaseShows_block_invoke;
  v7[3] = &unk_24F8B78E0;
  v8 = v3;
  v4 = v3;
  objc_msgSend(a1, "if_compactMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void sub_22D6007F4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

Class __getPRSServiceClass_block_invoke_37395(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!PosterBoardServicesLibraryCore_frameworkLibrary_37397)
    PosterBoardServicesLibraryCore_frameworkLibrary_37397 = _sl_dlopen();
  if (!PosterBoardServicesLibraryCore_frameworkLibrary_37397)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *PosterBoardServicesLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFSwitchPosterAction.m"), 20, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("PRSService");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getPRSServiceClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFSwitchPosterAction.m"), 21, CFSTR("Unable to find class %s"), "PRSService");

LABEL_8:
    __break(1u);
  }
  getPRSServiceClass_softClass_37394 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id WFAttributionFunction()
{
  return (id)classWFAttribution;
}

Class initWFAttribution()
{
  Class result;

  if (WeatherFoundationLibrary_sOnce != -1)
    dispatch_once(&WeatherFoundationLibrary_sOnce, &__block_literal_global_37624);
  result = objc_getClass("WFAttribution");
  classWFAttribution = (uint64_t)result;
  getWFAttributionClass = (uint64_t (*)())WFAttributionFunction;
  return result;
}

void sub_22D603614(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPHAssetClass_block_invoke_37639(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!PhotosLibraryCore_frameworkLibrary_37642)
    PhotosLibraryCore_frameworkLibrary_37642 = _sl_dlopen();
  if (!PhotosLibraryCore_frameworkLibrary_37642)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *PhotosLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFDeletePhotosAction.m"), 16, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("PHAsset");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getPHAssetClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFDeletePhotosAction.m"), 17, CFSTR("Unable to find class %s"), "PHAsset");

LABEL_8:
    __break(1u);
  }
  getPHAssetClass_softClass_37638 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_22D603950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMPMediaItemCollectionClass_block_invoke_37674(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!MediaPlayerLibraryCore_frameworkLibrary_37676)
    MediaPlayerLibraryCore_frameworkLibrary_37676 = _sl_dlopen();
  if (!MediaPlayerLibraryCore_frameworkLibrary_37676)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *MediaPlayerLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFSelectMusicAction.m"), 15, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("MPMediaItemCollection");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMPMediaItemCollectionClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFSelectMusicAction.m"), 16, CFSTR("Unable to find class %s"), "MPMediaItemCollection");

LABEL_8:
    __break(1u);
  }
  getMPMediaItemCollectionClass_softClass_37673 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id UIPasteboardFunction_37805()
{
  return (id)classUIPasteboard_37811;
}

Class initUIPasteboard_37806()
{
  Class result;

  if (UIKitLibrary_sOnce_37808 != -1)
    dispatch_once(&UIKitLibrary_sOnce_37808, &__block_literal_global_37809);
  result = objc_getClass("UIPasteboard");
  classUIPasteboard_37811 = (uint64_t)result;
  getUIPasteboardClass_37804 = (uint64_t (*)())UIPasteboardFunction_37805;
  return result;
}

id UIDeviceFunction()
{
  return (id)classUIDevice;
}

Class initUIDevice()
{
  Class result;

  if (UIKitLibrary_sOnce_37841 != -1)
    dispatch_once(&UIKitLibrary_sOnce_37841, &__block_literal_global_37842);
  result = objc_getClass("UIDevice");
  classUIDevice = (uint64_t)result;
  getUIDeviceClass = (uint64_t (*)())UIDeviceFunction;
  return result;
}

id WFAllPossibleMediaTypes()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[10];

  v5[9] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BEC4968];
  v5[0] = *MEMORY[0x24BEC4960];
  v5[1] = v0;
  v1 = *MEMORY[0x24BEC4958];
  v5[2] = *MEMORY[0x24BEC4970];
  v5[3] = v1;
  v2 = *MEMORY[0x24BEC4990];
  v5[4] = *MEMORY[0x24BEC4980];
  v5[5] = v2;
  v3 = *MEMORY[0x24BEC4998];
  v5[6] = *MEMORY[0x24BEC4988];
  v5[7] = v3;
  v5[8] = *MEMORY[0x24BEC4950];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 9);
  return (id)objc_claimAutoreleasedReturnValue();
}

id WFSerializedNameForMediaType(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = WFSerializedNameForMediaType_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&WFSerializedNameForMediaType_onceToken, &__block_literal_global_304);
  objc_msgSend((id)WFSerializedNameForMediaType_mapping, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id WFLocalizedNameForMediaType(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = WFLocalizedNameForMediaType_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&WFLocalizedNameForMediaType_onceToken, &__block_literal_global_311);
  objc_msgSend((id)WFLocalizedNameForMediaType_mapping, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id WFEntityTypesForMediaType(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = WFEntityTypesForMediaType_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&WFEntityTypesForMediaType_onceToken, &__block_literal_global_272);
  objc_msgSend((id)WFEntityTypesForMediaType_mapping, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id WFSerializedNameForEntityType(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = WFSerializedNameForEntityType_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&WFSerializedNameForEntityType_onceToken, &__block_literal_global_273);
  objc_msgSend((id)WFSerializedNameForEntityType_mapping, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id WFLocalizedNameForEntityType(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = WFLocalizedNameForEntityType_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&WFLocalizedNameForEntityType_onceToken, &__block_literal_global_354);
  objc_msgSend((id)WFLocalizedNameForEntityType_mapping, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id WFAttributesForMediaType(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v1 = WFAttributesForMediaType_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&WFAttributesForMediaType_onceToken, &__block_literal_global_271);
  v7[0] = CFSTR("productID");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)WFAttributesForMediaType_mapping, "objectForKeyedSubscript:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id WFSerializedNameForAttribute(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = WFSerializedNameForAttribute_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&WFSerializedNameForAttribute_onceToken, &__block_literal_global_219);
  objc_msgSend((id)WFSerializedNameForAttribute_mapping, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id WFLocalizedNameForAttribute(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = WFLocalizedNameForAttribute_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&WFLocalizedNameForAttribute_onceToken, &__block_literal_global_439);
  objc_msgSend((id)WFLocalizedNameForAttribute_mapping, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id WFLocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  WFCurrentBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, v1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id WFCurrentBundle()
{
  if (WFCurrentBundle_onceToken != -1)
    dispatch_once(&WFCurrentBundle_onceToken, &__block_literal_global_38569);
  return (id)WFCurrentBundle_bundle;
}

id WFLocalizedStringWithKey(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = a1;
  WFCurrentBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v4, v3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id WFLocalizedPluralString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    v2 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ (Pluralization)"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    WFCurrentBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", v4, v1, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = v1;
  }

  return v6;
}

id WFDeferrableLocalizedStringWithKey(void *a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x24BEC1438];
  v4 = a2;
  v5 = a1;
  v6 = (void *)objc_msgSend([v3 alloc], "initWithString:", v4);
  WFCurrentBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", v5, v4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setLocalizedValue:", v8);
  return v6;
}

id WFLocalizedContentPropertyNameMarker(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x24BDD17C8];
  v2 = a1;
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@ (Content Property Name)"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WFDeferrableLocalizedStringWithKey(v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id WFLocalizedContentPropertyPossibleValueMarker(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x24BDD17C8];
  v2 = a1;
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@ (Content Property Possible Value)"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WFDeferrableLocalizedStringWithKey(v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id WFLocalizedParameterValueMarker(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x24BDD17C8];
  v2 = a1;
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@ (Parameter Value)"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WFDeferrableLocalizedStringWithKey(v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id WFLocalizedParameterValue(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v1, "localizedValue");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ (Parameter Value)"), v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    WFLocalizedStringWithKey(v3, v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

id WFLocalizedStringResourceWithKey(void *a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x24BDD19B8];
  v4 = a2;
  v5 = a1;
  v6 = [v3 alloc];
  objc_msgSend(MEMORY[0x24BDBCEA0], "autoupdatingCurrentLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WFCurrentBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithKey:defaultValue:table:locale:bundleURL:", v5, v4, 0, v7, v9);

  return v10;
}

id getAVFlashlightClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getAVFlashlightClass_softClass;
  v7 = getAVFlashlightClass_softClass;
  if (!getAVFlashlightClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getAVFlashlightClass_block_invoke;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getAVFlashlightClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D60C32C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAVFlashlightClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!AVFoundationLibraryCore_frameworkLibrary_39042)
    AVFoundationLibraryCore_frameworkLibrary_39042 = _sl_dlopen();
  if (!AVFoundationLibraryCore_frameworkLibrary_39042)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *AVFoundationLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFFlashlightSettingsClient.m"), 18, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("AVFlashlight");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAVFlashlightClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFFlashlightSettingsClient.m"), 19, CFSTR("Unable to find class %s"), "AVFlashlight");

LABEL_8:
    __break(1u);
  }
  getAVFlashlightClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_22D60E41C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id CLPlacemarkFunction()
{
  return (id)classCLPlacemark;
}

Class initCLPlacemark()
{
  Class result;

  if (CoreLocationLibrary_sOnce != -1)
    dispatch_once(&CoreLocationLibrary_sOnce, &__block_literal_global_39693);
  result = objc_getClass("CLPlacemark");
  classCLPlacemark = (uint64_t)result;
  getCLPlacemarkClass_39691 = (uint64_t (*)())CLPlacemarkFunction;
  return result;
}

uint64_t (*initHKUILocalizedWorkoutTypeName(uint64_t a1))()
{
  uint64_t (*v2)();

  if (HealthUILibrary_sOnce != -1)
    dispatch_once(&HealthUILibrary_sOnce, &__block_literal_global_120);
  v2 = (uint64_t (*)())dlsym((void *)HealthUILibrary_sLib, "HKUILocalizedWorkoutTypeName");
  softLinkHKUILocalizedWorkoutTypeName = v2;
  if (v2)
  {
    ((void (*)(uint64_t))v2)(a1);
    v2 = (uint64_t (*)())objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

void sub_22D614C3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getNEVPNManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!NetworkExtensionLibraryCore_frameworkLibrary)
    NetworkExtensionLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!NetworkExtensionLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *NetworkExtensionLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFVPNPickerParameter.m"), 14, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("NEVPNManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getNEVPNManagerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFVPNPickerParameter.m"), 15, CFSTR("Unable to find class %s"), "NEVPNManager");

LABEL_8:
    __break(1u);
  }
  getNEVPNManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_22D616590(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  uint64_t v33;

  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v33 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__40465(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__40466(uint64_t a1)
{

}

void sub_22D621820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__41055(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__41056(uint64_t a1)
{

}

void sub_22D62193C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D621B60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getPHAssetCollectionClass_block_invoke_41059(uint64_t a1)
{
  void *v2;
  void *v3;

  PhotosLibrary_41066();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("PHAssetCollection");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPHAssetCollectionClass_softClass_41058 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getPHAssetCollectionClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFCreatePhotoAlbumAction.m"), 17, CFSTR("Unable to find class %s"), "PHAssetCollection");

    __break(1u);
  }
}

void PhotosLibrary_41066()
{
  void *v0;
  void *v1;
  void *v2;

  if (!PhotosLibraryCore_frameworkLibrary_41071)
    PhotosLibraryCore_frameworkLibrary_41071 = _sl_dlopen();
  if (!PhotosLibraryCore_frameworkLibrary_41071)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *PhotosLibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("WFCreatePhotoAlbumAction.m"), 16, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

void __getPHAssetCollectionChangeRequestClass_block_invoke_41078(uint64_t a1)
{
  void *v2;
  void *v3;

  PhotosLibrary_41066();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("PHAssetCollectionChangeRequest");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPHAssetCollectionChangeRequestClass_softClass_41077 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getPHAssetCollectionChangeRequestClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFCreatePhotoAlbumAction.m"), 18, CFSTR("Unable to find class %s"), "PHAssetCollectionChangeRequest");

    __break(1u);
  }
}

void sub_22D622294(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D622598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D6228E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *AVFoundationLibrary_41186()
{
  void *v0;
  void *v2;
  void *v3;

  if (!AVFoundationLibraryCore_frameworkLibrary_41194)
    AVFoundationLibraryCore_frameworkLibrary_41194 = _sl_dlopen();
  v0 = (void *)AVFoundationLibraryCore_frameworkLibrary_41194;
  if (!AVFoundationLibraryCore_frameworkLibrary_41194)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *AVFoundationLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFAudioRecorder.m"), 17, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

id getAVAudioSessionClass_41198()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getAVAudioSessionClass_softClass_41202;
  v7 = getAVAudioSessionClass_softClass_41202;
  if (!getAVAudioSessionClass_softClass_41202)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getAVAudioSessionClass_block_invoke_41203;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getAVAudioSessionClass_block_invoke_41203((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D622DB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getAVAudioSessionInterruptionNotification()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getAVAudioSessionInterruptionNotificationSymbolLoc_ptr;
  v8 = getAVAudioSessionInterruptionNotificationSymbolLoc_ptr;
  if (!getAVAudioSessionInterruptionNotificationSymbolLoc_ptr)
  {
    v1 = AVFoundationLibrary_41186();
    v0 = (id *)dlsym(v1, "AVAudioSessionInterruptionNotification");
    v6[3] = (uint64_t)v0;
    getAVAudioSessionInterruptionNotificationSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSNotificationName getAVAudioSessionInterruptionNotification(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFAudioRecorder.m"), 30, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_22D622EA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getAVAudioSessionClass_block_invoke_41203(uint64_t a1)
{
  void *v2;
  void *v3;

  AVFoundationLibrary_41186();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AVAudioSession");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVAudioSessionClass_softClass_41202 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAVAudioSessionClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFAudioRecorder.m"), 19, CFSTR("Unable to find class %s"), "AVAudioSession");

    __break(1u);
  }
}

void getAVFormatIDKey()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getAVFormatIDKeySymbolLoc_ptr;
  v8 = getAVFormatIDKeySymbolLoc_ptr;
  if (!getAVFormatIDKeySymbolLoc_ptr)
  {
    v1 = AVFoundationLibrary_41186();
    v0 = (id *)dlsym(v1, "AVFormatIDKey");
    v6[3] = (uint64_t)v0;
    getAVFormatIDKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getAVFormatIDKey(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFAudioRecorder.m"), 21, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_22D623064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getAVSampleRateKey()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getAVSampleRateKeySymbolLoc_ptr;
  v8 = getAVSampleRateKeySymbolLoc_ptr;
  if (!getAVSampleRateKeySymbolLoc_ptr)
  {
    v1 = AVFoundationLibrary_41186();
    v0 = (id *)dlsym(v1, "AVSampleRateKey");
    v6[3] = (uint64_t)v0;
    getAVSampleRateKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getAVSampleRateKey(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFAudioRecorder.m"), 22, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_22D62315C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getAVNumberOfChannelsKey()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getAVNumberOfChannelsKeySymbolLoc_ptr;
  v8 = getAVNumberOfChannelsKeySymbolLoc_ptr;
  if (!getAVNumberOfChannelsKeySymbolLoc_ptr)
  {
    v1 = AVFoundationLibrary_41186();
    v0 = (id *)dlsym(v1, "AVNumberOfChannelsKey");
    v6[3] = (uint64_t)v0;
    getAVNumberOfChannelsKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getAVNumberOfChannelsKey(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFAudioRecorder.m"), 23, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_22D623254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getAVEncoderAudioQualityKey()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getAVEncoderAudioQualityKeySymbolLoc_ptr;
  v8 = getAVEncoderAudioQualityKeySymbolLoc_ptr;
  if (!getAVEncoderAudioQualityKeySymbolLoc_ptr)
  {
    v1 = AVFoundationLibrary_41186();
    v0 = (id *)dlsym(v1, "AVEncoderAudioQualityKey");
    v6[3] = (uint64_t)v0;
    getAVEncoderAudioQualityKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getAVEncoderAudioQualityKey(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFAudioRecorder.m"), 24, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_22D62334C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getAVLinearPCMIsFloatKey()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getAVLinearPCMIsFloatKeySymbolLoc_ptr_41228;
  v8 = getAVLinearPCMIsFloatKeySymbolLoc_ptr_41228;
  if (!getAVLinearPCMIsFloatKeySymbolLoc_ptr_41228)
  {
    v1 = AVFoundationLibrary_41186();
    v0 = (id *)dlsym(v1, "AVLinearPCMIsFloatKey");
    v6[3] = (uint64_t)v0;
    getAVLinearPCMIsFloatKeySymbolLoc_ptr_41228 = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getAVLinearPCMIsFloatKey(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFAudioRecorder.m"), 25, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_22D623444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getAVLinearPCMIsBigEndianKey()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getAVLinearPCMIsBigEndianKeySymbolLoc_ptr;
  v8 = getAVLinearPCMIsBigEndianKeySymbolLoc_ptr;
  if (!getAVLinearPCMIsBigEndianKeySymbolLoc_ptr)
  {
    v1 = AVFoundationLibrary_41186();
    v0 = (id *)dlsym(v1, "AVLinearPCMIsBigEndianKey");
    v6[3] = (uint64_t)v0;
    getAVLinearPCMIsBigEndianKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getAVLinearPCMIsBigEndianKey(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFAudioRecorder.m"), 26, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_22D62353C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getAVLinearPCMBitDepthKey()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getAVLinearPCMBitDepthKeySymbolLoc_ptr_41224;
  v8 = getAVLinearPCMBitDepthKeySymbolLoc_ptr_41224;
  if (!getAVLinearPCMBitDepthKeySymbolLoc_ptr_41224)
  {
    v1 = AVFoundationLibrary_41186();
    v0 = (id *)dlsym(v1, "AVLinearPCMBitDepthKey");
    v6[3] = (uint64_t)v0;
    getAVLinearPCMBitDepthKeySymbolLoc_ptr_41224 = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getAVLinearPCMBitDepthKey(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFAudioRecorder.m"), 27, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_22D623634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getAVAudioRecorderClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  AVFoundationLibrary_41186();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AVAudioRecorder");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVAudioRecorderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAVAudioRecorderClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFAudioRecorder.m"), 18, CFSTR("Unable to find class %s"), "AVAudioRecorder");

    __break(1u);
  }
}

void getBluetoothAvailabilityChangedNotification()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getBluetoothAvailabilityChangedNotificationSymbolLoc_ptr;
  v8 = getBluetoothAvailabilityChangedNotificationSymbolLoc_ptr;
  if (!getBluetoothAvailabilityChangedNotificationSymbolLoc_ptr)
  {
    v1 = BluetoothManagerLibrary();
    v0 = (id *)dlsym(v1, "BluetoothAvailabilityChangedNotification");
    v6[3] = (uint64_t)v0;
    getBluetoothAvailabilityChangedNotificationSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getBluetoothAvailabilityChangedNotification(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFBluetoothSettingsClient.m"), 16, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_22D626BA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getBluetoothDeviceUpdatedNotification()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getBluetoothDeviceUpdatedNotificationSymbolLoc_ptr;
  v8 = getBluetoothDeviceUpdatedNotificationSymbolLoc_ptr;
  if (!getBluetoothDeviceUpdatedNotificationSymbolLoc_ptr)
  {
    v1 = BluetoothManagerLibrary();
    v0 = (id *)dlsym(v1, "BluetoothDeviceUpdatedNotification");
    v6[3] = (uint64_t)v0;
    getBluetoothDeviceUpdatedNotificationSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getBluetoothDeviceUpdatedNotification(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFBluetoothSettingsClient.m"), 17, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_22D626CA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getBluetoothDeviceRemovedNotification()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getBluetoothDeviceRemovedNotificationSymbolLoc_ptr;
  v8 = getBluetoothDeviceRemovedNotificationSymbolLoc_ptr;
  if (!getBluetoothDeviceRemovedNotificationSymbolLoc_ptr)
  {
    v1 = BluetoothManagerLibrary();
    v0 = (id *)dlsym(v1, "BluetoothDeviceRemovedNotification");
    v6[3] = (uint64_t)v0;
    getBluetoothDeviceRemovedNotificationSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getBluetoothDeviceRemovedNotification(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFBluetoothSettingsClient.m"), 18, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_22D626D98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getBluetoothDeviceChangedNotification()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getBluetoothDeviceChangedNotificationSymbolLoc_ptr;
  v8 = getBluetoothDeviceChangedNotificationSymbolLoc_ptr;
  if (!getBluetoothDeviceChangedNotificationSymbolLoc_ptr)
  {
    v1 = BluetoothManagerLibrary();
    v0 = (id *)dlsym(v1, "BluetoothDeviceChangedNotification");
    v6[3] = (uint64_t)v0;
    getBluetoothDeviceChangedNotificationSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getBluetoothDeviceChangedNotification(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFBluetoothSettingsClient.m"), 19, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_22D626E90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *BluetoothManagerLibrary()
{
  void *v0;
  void *v2;
  void *v3;

  if (!BluetoothManagerLibraryCore_frameworkLibrary)
    BluetoothManagerLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = (void *)BluetoothManagerLibraryCore_frameworkLibrary;
  if (!BluetoothManagerLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *BluetoothManagerLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFBluetoothSettingsClient.m"), 15, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

id WFBluetoothDeviceFilterDevicesMatchingType(void *a1, uint64_t a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __WFBluetoothDeviceFilterDevicesMatchingType_block_invoke;
  v3[3] = &__block_descriptor_40_e25_B16__0__BluetoothDevice_8l;
  v3[4] = a2;
  objc_msgSend(a1, "if_objectsPassingTest:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_22D627604(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void __getBluetoothManagerClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  BluetoothManagerLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("BluetoothManager");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getBluetoothManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getBluetoothManagerClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFBluetoothSettingsClient.m"), 20, CFSTR("Unable to find class %s"), "BluetoothManager");

    __break(1u);
  }
}

id getPDFDocumentClass_41931()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getPDFDocumentClass_softClass_41934;
  v7 = getPDFDocumentClass_softClass_41934;
  if (!getPDFDocumentClass_softClass_41934)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getPDFDocumentClass_block_invoke_41935;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getPDFDocumentClass_block_invoke_41935((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D627C68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPDFDocumentClass_block_invoke_41935(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!PDFKitLibraryCore_frameworkLibrary_41936)
    PDFKitLibraryCore_frameworkLibrary_41936 = _sl_dlopen();
  if (!PDFKitLibraryCore_frameworkLibrary_41936)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *PDFKitLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFPrintAction.m"), 24, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("PDFDocument");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getPDFDocumentClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFPrintAction.m"), 25, CFSTR("Unable to find class %s"), "PDFDocument");

LABEL_8:
    __break(1u);
  }
  getPDFDocumentClass_softClass_41934 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_22D628448(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__42046(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__42047(uint64_t a1)
{

}

__CFString *WFHTTPFormEncodedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;

  v1 = a1;
  if (v1)
  {
    v2 = v1;
    objc_msgSend(MEMORY[0x24BDD14A8], "alphanumericCharacterSet");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "formUnionWithCharacterSet:", v5);

    objc_msgSend(v4, "addCharactersInString:", CFSTR("-_.~"));
    objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\r\n"), CFSTR("\n"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\r\n"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "stringByAddingPercentEncodingWithAllowedCharacters:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsSeparatedByCharactersInSet:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR("+"));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = &stru_24F8BBA48;
  }
  return v11;
}

CGPathRef WFCreateRoundedRectPath(double a1, double a2, double a3, double a4, double a5)
{
  id v5;
  CGPathRef v6;

  -[objc_class bezierPathWithRoundedRect:cornerRadius:](getUIBezierPathClass(), "bezierPathWithRoundedRect:cornerRadius:", a1, a2, a3, a4, a5);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = CGPathRetain((CGPathRef)objc_msgSend(v5, "CGPath"));

  return v6;
}

id UIBezierPathFunction()
{
  return (id)classUIBezierPath;
}

Class initUIBezierPath()
{
  Class result;

  if (UIKitLibrary_sOnce_42121 != -1)
    dispatch_once(&UIKitLibrary_sOnce_42121, &__block_literal_global_42122);
  result = objc_getClass("UIBezierPath");
  classUIBezierPath = (uint64_t)result;
  getUIBezierPathClass = (uint64_t (*)())UIBezierPathFunction;
  return result;
}

void sub_22D62C5D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D62C7D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *CoreTelephonyLibrary_42510()
{
  void *v0;
  void *v2;
  void *v3;

  if (!CoreTelephonyLibraryCore_frameworkLibrary_42526)
    CoreTelephonyLibraryCore_frameworkLibrary_42526 = _sl_dlopen();
  v0 = (void *)CoreTelephonyLibraryCore_frameworkLibrary_42526;
  if (!CoreTelephonyLibraryCore_frameworkLibrary_42526)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CoreTelephonyLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFCellularDataSettingsClient.m"), 18, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

id WFNSErrorFromCTError(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  switch((_DWORD)a1)
  {
    case 0:
      return 0;
    case 2:
      v2 = (void *)MEMORY[0x24BDD1540];
      v3 = (_QWORD *)MEMORY[0x24BDD1010];
      goto LABEL_7;
    case 1:
      v2 = (void *)MEMORY[0x24BDD1540];
      v3 = (_QWORD *)MEMORY[0x24BDD1128];
LABEL_7:
      objc_msgSend(v2, "errorWithDomain:code:userInfo:", *v3, a1 >> 32, 0);
      return (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = HIDWORD(a1);
  v6 = (void *)MEMORY[0x24BDD1540];
  v7 = *MEMORY[0x24BEC4678];
  v12[0] = CFSTR("CTErrorDomain");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = CFSTR("CTError");
  v13[0] = v8;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 2, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void sub_22D62CBFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D62CFEC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void *__getACAccountDataclassNotesSymbolLoc_block_invoke(_QWORD *a1)
{
  void *v2;
  void *result;
  void *v4;

  if (!AccountsLibraryCore_frameworkLibrary)
    AccountsLibraryCore_frameworkLibrary = _sl_dlopen();
  v2 = (void *)AccountsLibraryCore_frameworkLibrary;
  if (!AccountsLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *AccountsLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFNoteGroupSubstituableState.m"), 18, CFSTR("%s"), 0);

    __break(1u);
    free(v4);
  }
  result = dlsym(v2, "ACAccountDataclassNotes");
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  getACAccountDataclassNotesSymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  return result;
}

id getWFDictateTextActionLogObject()
{
  if (getWFDictateTextActionLogObject_onceToken != -1)
    dispatch_once(&getWFDictateTextActionLogObject_onceToken, &__block_literal_global_42783);
  return (id)getWFDictateTextActionLogObject_log;
}

id initkAFAssistantErrorDomain()
{
  id *v0;

  if (AssistantServicesLibrary_sOnce != -1)
    dispatch_once(&AssistantServicesLibrary_sOnce, &__block_literal_global_315);
  v0 = (id *)dlsym((void *)AssistantServicesLibrary_sLib, "kAFAssistantErrorDomain");
  if (!v0)
    __assert_rtn("initkAFAssistantErrorDomain", "WFDictateTextAction.m", 30, "constant");
  objc_storeStrong((id *)&constantkAFAssistantErrorDomain, *v0);
  getkAFAssistantErrorDomain = (uint64_t (*)())kAFAssistantErrorDomainFunction;
  return (id)constantkAFAssistantErrorDomain;
}

id kAFAssistantErrorDomainFunction()
{
  return (id)constantkAFAssistantErrorDomain;
}

void __getWFDictateTextActionLogObject_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x24BEC1968], "DictateTextAction");
  v1 = (void *)getWFDictateTextActionLogObject_log;
  getWFDictateTextActionLogObject_log = (uint64_t)v0;

}

id AFSpeechRequestOptionsFunction()
{
  return (id)classAFSpeechRequestOptions;
}

Class initAFSpeechRequestOptions()
{
  Class result;

  if (AssistantServicesLibrary_sOnce != -1)
    dispatch_once(&AssistantServicesLibrary_sOnce, &__block_literal_global_315);
  result = objc_getClass("AFSpeechRequestOptions");
  classAFSpeechRequestOptions = (uint64_t)result;
  getAFSpeechRequestOptionsClass = (uint64_t (*)(_QWORD))AFSpeechRequestOptionsFunction;
  return result;
}

id AFDictationOptionsFunction()
{
  return (id)classAFDictationOptions;
}

Class initAFDictationOptions()
{
  Class result;

  if (AssistantServicesLibrary_sOnce != -1)
    dispatch_once(&AssistantServicesLibrary_sOnce, &__block_literal_global_315);
  result = objc_getClass("AFDictationOptions");
  classAFDictationOptions = (uint64_t)result;
  getAFDictationOptionsClass = (uint64_t (*)())AFDictationOptionsFunction;
  return result;
}

id AFDictationConnectionFunction()
{
  return (id)classAFDictationConnection;
}

Class initAFDictationConnection()
{
  Class result;

  if (AssistantServicesLibrary_sOnce != -1)
    dispatch_once(&AssistantServicesLibrary_sOnce, &__block_literal_global_315);
  result = objc_getClass("AFDictationConnection");
  classAFDictationConnection = (uint64_t)result;
  getAFDictationConnectionClass = (uint64_t (*)())AFDictationConnectionFunction;
  return result;
}

id getWFWFDictateTextActionLogObject()
{
  if (getWFWFDictateTextActionLogObject_onceToken != -1)
    dispatch_once(&getWFWFDictateTextActionLogObject_onceToken, &__block_literal_global_114_42876);
  return (id)getWFWFDictateTextActionLogObject_log;
}

void __getWFWFDictateTextActionLogObject_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create((const char *)*MEMORY[0x24BEC1968], "WFDictateTextAction");
  v1 = (void *)getWFWFDictateTextActionLogObject_log;
  getWFWFDictateTextActionLogObject_log = (uint64_t)v0;

}

void sub_22D6300C4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_22D630360(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getSBFWallpaperParallaxSettingsClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  SpringBoardFoundationLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("SBFWallpaperParallaxSettings");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSBFWallpaperParallaxSettingsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getSBFWallpaperParallaxSettingsClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFSetWallpaperAction.m"), 36, CFSTR("Unable to find class %s"), "SBFWallpaperParallaxSettings");

    __break(1u);
  }
}

void *SpringBoardFoundationLibrary()
{
  void *v0;
  void *v2;
  void *v3;

  if (!SpringBoardFoundationLibraryCore_frameworkLibrary)
    SpringBoardFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = (void *)SpringBoardFoundationLibraryCore_frameworkLibrary;
  if (!SpringBoardFoundationLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *SpringBoardFoundationLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFSetWallpaperAction.m"), 34, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void __getSBFWallpaperOptionsClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  SpringBoardFoundationLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("SBFWallpaperOptions");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSBFWallpaperOptionsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getSBFWallpaperOptionsClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFSetWallpaperAction.m"), 35, CFSTR("Unable to find class %s"), "SBFWallpaperOptions");

    __break(1u);
  }
}

void sub_22D631350(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSBSUIWallpaperPreviewViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!SpringBoardUIServicesLibraryCore_frameworkLibrary)
    SpringBoardUIServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!SpringBoardUIServicesLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *SpringBoardUIServicesLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFSetWallpaperAction.m"), 39, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("SBSUIWallpaperPreviewViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getSBSUIWallpaperPreviewViewControllerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFSetWallpaperAction.m"), 40, CFSTR("Unable to find class %s"), "SBSUIWallpaperPreviewViewController");

LABEL_8:
    __break(1u);
  }
  getSBSUIWallpaperPreviewViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __getUIViewClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  UIKitLibrary_43056();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("UIView");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getUIViewClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getUIViewClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFSetWallpaperAction.m"), 47, CFSTR("Unable to find class %s"), "UIView");

    __break(1u);
  }
}

void UIKitLibrary_43056()
{
  void *v0;
  void *v1;
  void *v2;

  if (!UIKitLibraryCore_frameworkLibrary_43058)
    UIKitLibraryCore_frameworkLibrary_43058 = _sl_dlopen();
  if (!UIKitLibraryCore_frameworkLibrary_43058)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *UIKitLibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("WFSetWallpaperAction.m"), 46, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

void sub_22D631D34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getUIScreenClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  UIKitLibrary_43056();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("UIScreen");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getUIScreenClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getUIScreenClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFSetWallpaperAction.m"), 49, CFSTR("Unable to find class %s"), "UIScreen");

    __break(1u);
  }
}

void __getUIImageClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  UIKitLibrary_43056();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("UIImage");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getUIImageClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getUIImageClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFSetWallpaperAction.m"), 48, CFSTR("Unable to find class %s"), "UIImage");

    __break(1u);
  }
}

id getPRSServiceClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getPRSServiceClass_softClass_43076;
  v7 = getPRSServiceClass_softClass_43076;
  if (!getPRSServiceClass_softClass_43076)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getPRSServiceClass_block_invoke_43077;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getPRSServiceClass_block_invoke_43077((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D631F80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getPRSServiceClass_block_invoke_43077(uint64_t a1)
{
  void *v2;
  void *v3;

  PosterBoardServicesLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("PRSService");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPRSServiceClass_softClass_43076 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getPRSServiceClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFSetWallpaperAction.m"), 43, CFSTR("Unable to find class %s"), "PRSService");

    __break(1u);
  }
}

void PosterBoardServicesLibrary()
{
  void *v0;
  void *v1;
  void *v2;

  if (!PosterBoardServicesLibraryCore_frameworkLibrary_43079)
    PosterBoardServicesLibraryCore_frameworkLibrary_43079 = _sl_dlopen();
  if (!PosterBoardServicesLibraryCore_frameworkLibrary_43079)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *PosterBoardServicesLibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("WFSetWallpaperAction.m"), 42, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

void sub_22D632B18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__43107(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__43108(uint64_t a1)
{

}

void sub_22D632FC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getPRSExternalSystemServiceClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  PosterBoardServicesLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("PRSExternalSystemService");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPRSExternalSystemServiceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getPRSExternalSystemServiceClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFSetWallpaperAction.m"), 44, CFSTR("Unable to find class %s"), "PRSExternalSystemService");

    __break(1u);
  }
}

void sub_22D635B5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  id *v21;

  _Block_object_dispose(&a21, 8);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getASWebAuthenticationSessionClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!AuthenticationServicesLibraryCore_frameworkLibrary)
    AuthenticationServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!AuthenticationServicesLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *AuthenticationServicesLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFOAuth2WebAuthorizationSession.m"), 24, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("ASWebAuthenticationSession");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getASWebAuthenticationSessionClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFOAuth2WebAuthorizationSession.m"), 25, CFSTR("Unable to find class %s"), "ASWebAuthenticationSession");

LABEL_8:
    __break(1u);
  }
  getASWebAuthenticationSessionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_22D637EF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id WFHKInterpolateMissingGroups(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  WFHKGroupingIndexPathTransformer *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  WFHKGroupingIndexPathTransformer *v22;
  id v23;
  id v24;
  id v25;
  void (**v26)(void *, uint64_t, char *);
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  char *v39;
  void *v40;
  WFHKGroupingIndexPathTransformer *v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void (**v51)(void *, uint64_t, char *);
  void *v52;
  void *v53;
  _QWORD aBlock[4];
  WFHKGroupingIndexPathTransformer *v55;
  id v56;
  id v57;
  id v58;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = -[WFHKGroupingIndexPathTransformer initWithGroupingOption:]([WFHKGroupingIndexPathTransformer alloc], "initWithGroupingOption:", objc_msgSend(v6, "groupingOption"));
  v49 = v5;
  v9 = (void *)objc_msgSend(v5, "mutableCopy");
  v50 = (void *)objc_opt_new();
  objc_msgSend(v6, "queryStartDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHKGroupingIndexPathTransformer transformedValue:](v8, "transformedValue:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "queryEndDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHKGroupingIndexPathTransformer transformedValue:](v8, "transformedValue:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = v11;
  WFHKOffsetGroupKey(v11, -1, objc_msgSend(v6, "groupingOption"));
  v14 = objc_claimAutoreleasedReturnValue();
  v47 = v13;
  WFHKOffsetGroupKey(v13, 1, objc_msgSend(v6, "groupingOption"));
  v15 = objc_claimAutoreleasedReturnValue();
  v46 = (void *)v14;
  objc_msgSend(v9, "insertObject:atIndex:", v14, 0);
  v45 = (void *)v15;
  objc_msgSend(v9, "addObject:", v15);
  if (objc_msgSend(v9, "count"))
  {
    v16 = 0;
    v39 = sel_minute;
    v42 = v7;
    v43 = v6;
    v40 = v9;
    v41 = v8;
    do
    {
      v17 = v16++;
      if (v16 >= objc_msgSend(v9, "count", v39))
        break;
      if (!objc_msgSend(v7, "isRunning"))
      {
        v37 = 0;
        v36 = v50;
        goto LABEL_19;
      }
      objc_msgSend(v9, "objectAtIndexedSubscript:", v17);
      v18 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", v16);
      v19 = objc_claimAutoreleasedReturnValue();
      v53 = (void *)v18;
      -[WFHKGroupingIndexPathTransformer reverseTransformedValue:](v8, "reverseTransformedValue:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = (void *)v19;
      -[WFHKGroupingIndexPathTransformer reverseTransformedValue:](v8, "reverseTransformedValue:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 3221225472;
      aBlock[2] = __WFHKInterpolateMissingGroups_block_invoke;
      aBlock[3] = &unk_24F8B98F8;
      v22 = v8;
      v55 = v22;
      v23 = v20;
      v56 = v23;
      v24 = v21;
      v57 = v24;
      v25 = v50;
      v58 = v25;
      v26 = (void (**)(void *, uint64_t, char *))_Block_copy(aBlock);
      v51 = v26;
      switch(objc_msgSend(v6, "groupingOption"))
      {
        case 1:
          v26[2](v26, 64, v39);
          break;
        case 2:
          v26[2](v26, 32, sel_hour);
          break;
        case 3:
          v26[2](v26, 16, sel_day);
          break;
        case 4:
          v26[2](v26, 0x2000, sel_weekOfYear);
          break;
        case 5:
          v26[2](v26, 8, sel_month);
          break;
        case 6:
          -[WFHKGroupingIndexPathTransformer conversionCalendar](v22, "conversionCalendar");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = v24;
          objc_msgSend(v27, "components:fromDate:toDate:options:", 8, v23, v24, 0);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          v29 = objc_msgSend(v28, "month");
          if ((unint64_t)(v29 - 3) >= 3)
          {
            v30 = v29 / 3 - 1;
            v31 = 3;
            do
            {
              v32 = objc_alloc_init(MEMORY[0x24BDBCE68]);
              objc_msgSend(v32, "setMonth:", v31);
              -[WFHKGroupingIndexPathTransformer conversionCalendar](v22, "conversionCalendar");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "dateByAddingComponents:toDate:options:", v32, v23, 0);
              v34 = (void *)objc_claimAutoreleasedReturnValue();

              -[WFHKGroupingIndexPathTransformer transformedValue:](v22, "transformedValue:", v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "addObject:", v35);

              v31 += 3;
              --v30;
            }
            while (v30);
          }

          v7 = v42;
          v6 = v43;
          v9 = v40;
          v8 = v41;
          v24 = v44;
          v26 = v51;
          break;
        case 7:
          v26[2](v26, 4, sel_year);
          break;
        default:
          break;
      }

    }
    while (v16 < objc_msgSend(v9, "count"));
  }
  v36 = v50;
  v37 = v50;
LABEL_19:

  return v37;
}

id WFHKOffsetGroupKey(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  WFHKGroupingIndexPathTransformer *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a1;
  v6 = -[WFHKGroupingIndexPathTransformer initWithGroupingOption:]([WFHKGroupingIndexPathTransformer alloc], "initWithGroupingOption:", a3);
  -[WFHKGroupingIndexPathTransformer reverseTransformedValue:](v6, "reverseTransformedValue:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  v9 = v8;
  switch(a3)
  {
    case 1:
      objc_msgSend(v8, "setMinute:", a2);
      break;
    case 2:
      objc_msgSend(v8, "setHour:", a2);
      break;
    case 3:
      objc_msgSend(v8, "setDay:", a2);
      break;
    case 4:
      objc_msgSend(v8, "setWeekOfYear:", a2);
      break;
    case 5:
      v10 = a2;
      goto LABEL_8;
    case 6:
      v10 = 3 * a2;
LABEL_8:
      objc_msgSend(v8, "setMonth:", v10);
      break;
    case 7:
      objc_msgSend(v8, "setYear:", a2);
      break;
    default:
      break;
  }
  -[WFHKGroupingIndexPathTransformer conversionCalendar](v6, "conversionCalendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dateByAddingComponents:toDate:options:", v9, v7, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFHKGroupingIndexPathTransformer transformedValue:](v6, "transformedValue:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void sub_22D63E4F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAXSpringBoardServerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_44490)
    AccessibilityUtilitiesLibraryCore_frameworkLibrary_44490 = _sl_dlopen();
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_44490)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *AccessibilityUtilitiesLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFOrientationSettingsClient.m"), 18, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("AXSpringBoardServer");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAXSpringBoardServerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFOrientationSettingsClient.m"), 19, CFSTR("Unable to find class %s"), "AXSpringBoardServer");

LABEL_8:
    __break(1u);
  }
  getAXSpringBoardServerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id CLPlacemarkFunction_44699()
{
  return (id)classCLPlacemark_44729;
}

Class initCLPlacemark_44700()
{
  Class result;

  if (CoreLocationLibrary_sOnce_44726 != -1)
    dispatch_once(&CoreLocationLibrary_sOnce_44726, &__block_literal_global_44727);
  result = objc_getClass("CLPlacemark");
  classCLPlacemark_44729 = (uint64_t)result;
  getCLPlacemarkClass_44698 = (uint64_t (*)())CLPlacemarkFunction_44699;
  return result;
}

id UIPrintFormatterFunction()
{
  return (id)classUIPrintFormatter;
}

Class initUIPrintFormatter()
{
  Class result;

  if (UIKitLibrary_sOnce_44813 != -1)
    dispatch_once(&UIKitLibrary_sOnce_44813, &__block_literal_global_304_44814);
  result = objc_getClass("UIPrintFormatter");
  classUIPrintFormatter = (uint64_t)result;
  getUIPrintFormatterClass = (uint64_t (*)())UIPrintFormatterFunction;
  return result;
}

void sub_22D640450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__44832(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__44833(uint64_t a1)
{

}

void sub_22D640A58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  _Unwind_Resume(exception_object);
}

id getPHAssetClass_45194()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getPHAssetClass_softClass_45227;
  v7 = getPHAssetClass_softClass_45227;
  if (!getPHAssetClass_softClass_45227)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getPHAssetClass_block_invoke_45228;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getPHAssetClass_block_invoke_45228((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D6428B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D642D00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__45199(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__45200(uint64_t a1)
{

}

void sub_22D642E60(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void __getPHAssetCollectionChangeRequestClass_block_invoke_45206(uint64_t a1)
{
  void *v2;
  void *v3;

  PhotosLibrary_45211();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("PHAssetCollectionChangeRequest");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPHAssetCollectionChangeRequestClass_softClass_45205 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getPHAssetCollectionChangeRequestClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFSaveToCameraRollAction.m"), 20, CFSTR("Unable to find class %s"), "PHAssetCollectionChangeRequest");

    __break(1u);
  }
}

void sub_22D6433CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getPHAssetChangeRequestClass_block_invoke_45210(uint64_t a1)
{
  void *v2;
  void *v3;

  PhotosLibrary_45211();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("PHAssetChangeRequest");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPHAssetChangeRequestClass_softClass_45209 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getPHAssetChangeRequestClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFSaveToCameraRollAction.m"), 19, CFSTR("Unable to find class %s"), "PHAssetChangeRequest");

    __break(1u);
  }
}

void PhotosLibrary_45211()
{
  void *v0;
  void *v1;
  void *v2;

  if (!PhotosLibraryCore_frameworkLibrary_45219)
    PhotosLibraryCore_frameworkLibrary_45219 = _sl_dlopen();
  if (!PhotosLibraryCore_frameworkLibrary_45219)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *PhotosLibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("WFSaveToCameraRollAction.m"), 16, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

void __getPHAssetClass_block_invoke_45228(uint64_t a1)
{
  void *v2;
  void *v3;

  PhotosLibrary_45211();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("PHAsset");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPHAssetClass_softClass_45227 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getPHAssetClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFSaveToCameraRollAction.m"), 17, CFSTR("Unable to find class %s"), "PHAsset");

    __break(1u);
  }
}

id WFPHAssetCollectionMatchingDescriptor(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id PHAssetCollectionClass_45330;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  int v31;
  id v32;
  uint64_t v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  _QWORD v45[5];
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _QWORD v52[3];

  v52[1] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2050000000;
  v2 = (void *)getPHPhotoLibraryClass_softClass_45328;
  v49 = getPHPhotoLibraryClass_softClass_45328;
  if (!getPHPhotoLibraryClass_softClass_45328)
  {
    v45[0] = MEMORY[0x24BDAC760];
    v45[1] = 3221225472;
    v45[2] = __getPHPhotoLibraryClass_block_invoke_45329;
    v45[3] = &unk_24F8BB430;
    v45[4] = &v46;
    __getPHPhotoLibraryClass_block_invoke_45329((uint64_t)v45);
    v2 = (void *)v47[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v46, 8);
  if (objc_msgSend(v3, "authorizationStatus") == 3)
  {
    objc_msgSend(MEMORY[0x24BE19610], "sharedLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0;
    objc_msgSend(v4, "fetchOptionsWithError:", &v44);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v44;

    if (v5)
    {
      objc_msgSend(v5, "setWantsIncrementalChangeDetails:", 0);
      v6 = (void *)objc_opt_new();
      objc_msgSend(v1, "localIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        PHAssetCollectionClass_45330 = getPHAssetCollectionClass_45330();
        objc_msgSend(v1, "localIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v52[0] = v9;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(PHAssetCollectionClass_45330, "fetchAssetCollectionsWithLocalIdentifiers:options:", v10, v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v11);

      }
      objc_msgSend(v1, "localizedTitle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v13 = (void *)MEMORY[0x24BDD1758];
        objc_msgSend(v1, "localizedTitle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "predicateWithFormat:", CFSTR("title = %@"), v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setPredicate:", v15);

        objc_msgSend(getPHAssetCollectionClass_45330(), "fetchAssetCollectionsWithType:subtype:options:", 1, 0x7FFFFFFFFFFFFFFFLL, v5);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v16);

      }
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v17 = v6;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v41;
        v34 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v41 != v19)
              objc_enumerationMutation(v17);
            v21 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
            v36 = 0u;
            v37 = 0u;
            v38 = 0u;
            v39 = 0u;
            v22 = v21;
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
            if (v23)
            {
              v24 = *(_QWORD *)v37;
              while (2)
              {
                for (j = 0; j != v23; ++j)
                {
                  if (*(_QWORD *)v37 != v24)
                    objc_enumerationMutation(v22);
                  v26 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
                  if ((objc_msgSend(v26, "canPerformEditOperation:", 3) & 1) != 0)
                  {
                    v32 = v26;

                    v28 = v17;
                    goto LABEL_30;
                  }
                }
                v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v50, 16);
                if (v23)
                  continue;
                break;
              }
            }

            v19 = v34;
          }
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
          v19 = v34;
        }
        while (v18);
      }

      objc_msgSend(v5, "setPredicate:", 0);
      objc_msgSend(getPHAssetCollectionClass_45330(), "fetchAssetCollectionsWithType:subtype:options:", 2, 209, v5);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "firstObject");
      v28 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v28, "localizedTitle");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "localizedTitle");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v29, "isEqualToString:", v30);

      if (v31)
      {
        v28 = v28;
        v32 = v28;
      }
      else
      {
        v32 = 0;
      }
LABEL_30:

    }
    else
    {
      v32 = 0;
    }

  }
  else
  {
    v32 = 0;
  }

  return v32;
}

void sub_22D644138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  _Block_object_dispose(&a36, 8);
  _Unwind_Resume(a1);
}

void __getPHPhotoLibraryClass_block_invoke_45329(uint64_t a1)
{
  void *v2;
  void *v3;

  PhotosLibrary_45335();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("PHPhotoLibrary");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPHPhotoLibraryClass_softClass_45328 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getPHPhotoLibraryClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFPHAssetCollectionState.m"), 17, CFSTR("Unable to find class %s"), "PHPhotoLibrary");

    __break(1u);
  }
}

id getPHAssetCollectionClass_45330()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getPHAssetCollectionClass_softClass_45333;
  v7 = getPHAssetCollectionClass_softClass_45333;
  if (!getPHAssetCollectionClass_softClass_45333)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getPHAssetCollectionClass_block_invoke_45334;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getPHAssetCollectionClass_block_invoke_45334((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D6442BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getPHAssetCollectionClass_block_invoke_45334(uint64_t a1)
{
  void *v2;
  void *v3;

  PhotosLibrary_45335();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("PHAssetCollection");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPHAssetCollectionClass_softClass_45333 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getPHAssetCollectionClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFPHAssetCollectionState.m"), 16, CFSTR("Unable to find class %s"), "PHAssetCollection");

    __break(1u);
  }
}

void PhotosLibrary_45335()
{
  void *v0;
  void *v1;
  void *v2;

  if (!PhotosLibraryCore_frameworkLibrary_45340)
    PhotosLibraryCore_frameworkLibrary_45340 = _sl_dlopen();
  if (!PhotosLibraryCore_frameworkLibrary_45340)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *PhotosLibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("WFPHAssetCollectionState.m"), 15, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

void sub_22D644B50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D644E98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

void sub_22D645860(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void *AVFoundationLibrary_45394()
{
  void *v0;
  void *v2;
  void *v3;

  if (!AVFoundationLibraryCore_frameworkLibrary_45454)
    AVFoundationLibraryCore_frameworkLibrary_45454 = _sl_dlopen();
  v0 = (void *)AVFoundationLibraryCore_frameworkLibrary_45454;
  if (!AVFoundationLibraryCore_frameworkLibrary_45454)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *AVFoundationLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFEncodeMediaAction.m"), 25, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void getAVAssetExportPreset1920x1080()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getAVAssetExportPreset1920x1080SymbolLoc_ptr;
  v8 = getAVAssetExportPreset1920x1080SymbolLoc_ptr;
  if (!getAVAssetExportPreset1920x1080SymbolLoc_ptr)
  {
    v1 = AVFoundationLibrary_45394();
    v0 = (id *)dlsym(v1, "AVAssetExportPreset1920x1080");
    v6[3] = (uint64_t)v0;
    getAVAssetExportPreset1920x1080SymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getAVAssetExportPreset1920x1080(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFEncodeMediaAction.m"), 47, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_22D645E48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getAVAssetExportPreset3840x2160()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getAVAssetExportPreset3840x2160SymbolLoc_ptr;
  v8 = getAVAssetExportPreset3840x2160SymbolLoc_ptr;
  if (!getAVAssetExportPreset3840x2160SymbolLoc_ptr)
  {
    v1 = AVFoundationLibrary_45394();
    v0 = (id *)dlsym(v1, "AVAssetExportPreset3840x2160");
    v6[3] = (uint64_t)v0;
    getAVAssetExportPreset3840x2160SymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getAVAssetExportPreset3840x2160(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFEncodeMediaAction.m"), 48, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_22D645F40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getAVAssetExportPresetAppleProRes422LPCM()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getAVAssetExportPresetAppleProRes422LPCMSymbolLoc_ptr;
  v8 = getAVAssetExportPresetAppleProRes422LPCMSymbolLoc_ptr;
  if (!getAVAssetExportPresetAppleProRes422LPCMSymbolLoc_ptr)
  {
    v1 = AVFoundationLibrary_45394();
    v0 = (id *)dlsym(v1, "AVAssetExportPresetAppleProRes422LPCM");
    v6[3] = (uint64_t)v0;
    getAVAssetExportPresetAppleProRes422LPCMSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getAVAssetExportPresetAppleProRes422LPCM(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFEncodeMediaAction.m"), 50, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_22D646038(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getAVAssetExportPresetPassthrough()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getAVAssetExportPresetPassthroughSymbolLoc_ptr;
  v8 = getAVAssetExportPresetPassthroughSymbolLoc_ptr;
  if (!getAVAssetExportPresetPassthroughSymbolLoc_ptr)
  {
    v1 = AVFoundationLibrary_45394();
    v0 = (id *)dlsym(v1, "AVAssetExportPresetPassthrough");
    v6[3] = (uint64_t)v0;
    getAVAssetExportPresetPassthroughSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getAVAssetExportPresetPassthrough(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFEncodeMediaAction.m"), 49, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_22D646130(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22D646284(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_22D646C08(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x260], 8);
  _Unwind_Resume(a1);
}

void __getAVAssetClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  AVFoundationLibrary_45394();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AVAsset");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVAssetClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAVAssetClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFEncodeMediaAction.m"), 26, CFSTR("Unable to find class %s"), "AVAsset");

    __break(1u);
  }
}

void __getAVMutableCompositionClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  AVFoundationLibrary_45394();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AVMutableComposition");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVMutableCompositionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAVMutableCompositionClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFEncodeMediaAction.m"), 29, CFSTR("Unable to find class %s"), "AVMutableComposition");

    __break(1u);
  }
}

void *CoreMediaLibrary()
{
  void *v0;
  void *v2;
  void *v3;

  if (!CoreMediaLibraryCore_frameworkLibrary)
    CoreMediaLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = (void *)CoreMediaLibraryCore_frameworkLibrary;
  if (!CoreMediaLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CoreMediaLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFEncodeMediaAction.m"), 16, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void __getAVAssetExportSessionClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  AVFoundationLibrary_45394();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AVAssetExportSession");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVAssetExportSessionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAVAssetExportSessionClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFEncodeMediaAction.m"), 31, CFSTR("Unable to find class %s"), "AVAssetExportSession");

    __break(1u);
  }
}

void __getAVMetadataItemClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  AVFoundationLibrary_45394();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AVMetadataItem");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVMetadataItemClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAVMetadataItemClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFEncodeMediaAction.m"), 27, CFSTR("Unable to find class %s"), "AVMetadataItem");

    __break(1u);
  }
}

id WFMakeMetadataItem(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a2;
  v4 = a1;
  objc_msgSend(getAVMutableMetadataItemClass(), "metadataItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentifier:", v4);

  objc_msgSend(v5, "setValue:", v3);
  return v5;
}

void sub_22D6477F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getAVMutableMetadataItemClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getAVMutableMetadataItemClass_softClass;
  v7 = getAVMutableMetadataItemClass_softClass;
  if (!getAVMutableMetadataItemClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getAVMutableMetadataItemClass_block_invoke;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getAVMutableMetadataItemClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D6478B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getAVMutableMetadataItemClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  AVFoundationLibrary_45394();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AVMutableMetadataItem");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAVMutableMetadataItemClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAVMutableMetadataItemClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFEncodeMediaAction.m"), 28, CFSTR("Unable to find class %s"), "AVMutableMetadataItem");

    __break(1u);
  }
}

void sub_22D649750(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_22D64992C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_22D649AFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22D649C60(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_22D64A704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMKMapItemClass_block_invoke_45877(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!MapKitLibraryCore_frameworkLibrary_45878)
    MapKitLibraryCore_frameworkLibrary_45878 = _sl_dlopen();
  if (!MapKitLibraryCore_frameworkLibrary_45878)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void * _Nonnull MapKitLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFSearchMapsAction.m"), 20, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("MKMapItem");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class  _Nonnull getMKMapItemClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFSearchMapsAction.m"), 21, CFSTR("Unable to find class %s"), "MKMapItem");

LABEL_8:
    __break(1u);
  }
  getMKMapItemClass_softClass_45876 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_22D64E2B0(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *WFStringFromIPSocketAddress(unsigned __int8 *a1)
{
  int v1;
  uint64_t v2;
  socklen_t v3;
  char *v4;
  const void *v5;
  unsigned __int8 *v6;
  uint64_t v8;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v1 = a1[1];
    switch(v1)
    {
      case 30:
        v2 = MEMORY[0x24BDAC7A8](a1);
        v4 = (char *)&v8;
        v5 = (const void *)(v2 + 8);
        break;
      case 18:
        v6 = &a1[a1[5]];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02X:%02X:%02X:%02X:%02X:%02X"), v6[8], v6[9], v6[10], v6[11], v6[12], v6[13]);
        a1 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        return a1;
      case 2:
        v2 = MEMORY[0x24BDAC7A8](a1);
        v4 = (char *)v9;
        v5 = (const void *)(v2 + 4);
        break;
      default:
        a1 = 0;
        return a1;
    }
    a1 = (unsigned __int8 *)inet_ntop(*(unsigned __int8 *)(v2 + 1), v5, v4, v3);
    if (a1)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a1);
      a1 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
    }
  }
  return a1;
}

id WFDefaultNetworkInterfaces()
{
  char *v0;
  void *v1;
  size_t v2;
  size_t v3;
  char *v4;
  uint64_t v5;
  _BYTE *v6;
  unsigned int v7;
  uint64_t v8;
  _BYTE *v9;
  void *v10;
  size_t size;
  char v13[17];
  _OWORD v14[4];
  int v15[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)v15 = xmmword_22D6AD5B0;
  v16 = 7;
  size = 0;
  sysctl(v15, 6u, 0, &size, 0, 0);
  v0 = (char *)malloc_type_malloc(size, 0x852E95CCuLL);
  sysctl(v15, 6u, v0, &size, 0, 0);
  v1 = (void *)objc_opt_new();
  v2 = size;
  if (size)
  {
    v3 = 0;
    do
    {
      v4 = &v0[v3];
      if ((v0[v3 + 10] & 2) == 0 || (v4[22] & 1) == 0)
      {
        v5 = 0;
        v6 = v4 + 92;
        memset(v14, 0, sizeof(v14));
        v7 = *((_DWORD *)v4 + 3);
        do
        {
          if (((v7 >> v5) & 1) != 0)
          {
            v8 = ((*v6 - 1) & 0xFFFFFFFC) + 4;
            if (!*v6)
              v8 = 4;
            v9 = v6;
            v6 += v8;
          }
          else
          {
            v9 = 0;
          }
          *((_QWORD *)v14 + v5++) = v9;
        }
        while (v5 != 8);
        if_indextoname(*((unsigned __int16 *)v4 + 2), v13);
        if (*(_QWORD *)&v14[0] && !*(_DWORD *)(*(_QWORD *)&v14[0] + 4))
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v1, "addObject:", v10);

        }
        v2 = size;
      }
      v3 += *(unsigned __int16 *)v4;
    }
    while (v3 < v2);
  }
  free(v0);
  return v1;
}

void sub_22D651C68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62)
{
  _Block_object_dispose(&a62, 8);
  _Unwind_Resume(a1);
}

Class __getCLLocationClass_block_invoke_46745(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!CoreLocationLibraryCore_frameworkLibrary_46832)
    CoreLocationLibraryCore_frameworkLibrary_46832 = _sl_dlopen();
  if (!CoreLocationLibraryCore_frameworkLibrary_46832)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CoreLocationLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFWeatherDataContentItem.m"), 16, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("CLLocation");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCLLocationClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFWeatherDataContentItem.m"), 17, CFSTR("Unable to find class %s"), "CLLocation");

LABEL_8:
    __break(1u);
  }
  getCLLocationClass_softClass_46744 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getPDFDocumentClass_47061()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getPDFDocumentClass_softClass_47072;
  v7 = getPDFDocumentClass_softClass_47072;
  if (!getPDFDocumentClass_softClass_47072)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getPDFDocumentClass_block_invoke_47073;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getPDFDocumentClass_block_invoke_47073((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D6533D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPDFDocumentClass_block_invoke_47073(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!PDFKitLibraryCore_frameworkLibrary_47074)
    PDFKitLibraryCore_frameworkLibrary_47074 = _sl_dlopen();
  if (!PDFKitLibraryCore_frameworkLibrary_47074)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *PDFKitLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFMakePDFAction.m"), 28, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("PDFDocument");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getPDFDocumentClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFMakePDFAction.m"), 29, CFSTR("Unable to find class %s"), "PDFDocument");

LABEL_8:
    __break(1u);
  }
  getPDFDocumentClass_softClass_47072 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_22D653C84(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_22D65468C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void __getPRSServiceClass_block_invoke_47223(uint64_t a1)
{
  void *v2;
  void *v3;

  PosterBoardServicesLibrary_47228();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("PRSService");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPRSServiceClass_softClass_47222 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getPRSServiceClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFPosterContentItem.m"), 23, CFSTR("Unable to find class %s"), "PRSService");

    __break(1u);
  }
}

void sub_22D654A8C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void __getPRSPosterSnapshotRequestClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  PosterBoardServicesLibrary_47228();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("PRSPosterSnapshotRequest");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPRSPosterSnapshotRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getPRSPosterSnapshotRequestClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFPosterContentItem.m"), 24, CFSTR("Unable to find class %s"), "PRSPosterSnapshotRequest");

    __break(1u);
  }
}

void PosterBoardServicesLibrary_47228()
{
  void *v0;
  void *v1;
  void *v2;

  if (!PosterBoardServicesLibraryCore_frameworkLibrary_47236)
    PosterBoardServicesLibraryCore_frameworkLibrary_47236 = _sl_dlopen();
  if (!PosterBoardServicesLibraryCore_frameworkLibrary_47236)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *PosterBoardServicesLibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("WFPosterContentItem.m"), 22, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

void sub_22D65576C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
  uint64_t v51;

  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose((const void *)(v51 - 224), 8);
  _Unwind_Resume(a1);
}

void sub_22D65644C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  id *v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v13);
  _Unwind_Resume(a1);
}

id WFDropboxErrorFromResponseObject(void *a1, int a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("error"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  WFEnforceClass(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    WFDropboxErrorFromErrorObject(v6, a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("error_summary"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_opt_class();
      WFEnforceClass(v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v13 = (void *)MEMORY[0x24BDD17C8];
        WFLocalizedString(CFSTR("An unknown error occurred (%@)"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localizedStringWithFormat:", v14, v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        WFLocalizedString(CFSTR("An unknown error occurred"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR(".tag"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_opt_class();
      WFEnforceClass(v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v18, "isEqualToString:", CFSTR("path")))
        goto LABEL_11;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("path"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      WFDropboxErrorFromErrorObject(v19, a2);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("reason"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        WFDropboxErrorFromErrorObject(v20, a2);
        v9 = (id)objc_claimAutoreleasedReturnValue();

        if (!v9)
        {
LABEL_11:
          v21 = (void *)MEMORY[0x24BDD1540];
          v24 = *MEMORY[0x24BDD0FC8];
          v25[0] = v15;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("WFDropboxErrorDomain"), -1, v22);
          v9 = (id)objc_claimAutoreleasedReturnValue();

        }
      }

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id WFDropboxErrorFromErrorObject(void *a1, int a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR(".tag"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  WFEnforceClass(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("not_found")))
    {
      v6 = (__CFString *)(id)*MEMORY[0x24BDD0B88];
      v7 = CFSTR("We couldn’t find a file at the specified path.");
      v8 = 4;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("not_file")) & 1) != 0)
    {
      v6 = CFSTR("WFDropboxErrorDomain");
      v8 = 100;
      v7 = CFSTR("A file was expected, but the path provided refers to something that isn’t a file.");
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("not_folder")) & 1) != 0)
    {
      v6 = CFSTR("WFDropboxErrorDomain");
      v8 = 101;
      v7 = CFSTR("A folder was expected, but the path provided refers to something that isn’t a folder.");
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("restricted_content")) & 1) != 0)
    {
      v6 = CFSTR("WFDropboxErrorDomain");
      v8 = 102;
      v7 = CFSTR("The file cannot be transferred because the content is restricted. For example, sometimes there are legal restrictions due to copyright claims.");
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("invalid_path_root")) & 1) != 0)
    {
      v6 = CFSTR("WFDropboxErrorDomain");
      v8 = 103;
      v7 = CFSTR("The path root parameter provided is invalid.");
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("conflict")) & 1) != 0)
    {
      v6 = CFSTR("WFDropboxErrorDomain");
      v8 = 105;
      v7 = CFSTR("Dropbox cannot write to the specified path due to a conflict.");
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("no_write_permission")) & 1) != 0)
    {
      v6 = CFSTR("WFDropboxErrorDomain");
      v8 = 106;
      v7 = CFSTR("You don’t have permission to write to the specified location.");
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("insufficient_space")) & 1) != 0)
    {
      v6 = CFSTR("WFDropboxErrorDomain");
      v8 = 107;
      v7 = CFSTR("You don’t have enough available space in Dropbox to write this data.");
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("disallowed_name")) & 1) != 0
           || objc_msgSend(v5, "isEqualToString:", CFSTR("malformed_path")))
    {
      if (a2)
        v7 = CFSTR("Dropbox cannot save this file or folder because of its name.");
      else
        v7 = CFSTR("Dropbox cannot access this file or folder because of its name.");
      v6 = CFSTR("WFDropboxErrorDomain");
      v8 = 108;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("invalid_settings")) & 1) != 0)
    {
      v6 = CFSTR("WFDropboxErrorDomain");
      v8 = 111;
      v7 = CFSTR("The share settings provided are invalid.");
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("not_authorized")) & 1) != 0)
    {
      v6 = CFSTR("WFDropboxErrorDomain");
      v8 = 112;
      v7 = CFSTR("You are not allowed to modify the settings of this link.");
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("reset")) & 1) != 0)
    {
      v6 = CFSTR("WFDropboxErrorDomain");
      v8 = 104;
      v7 = CFSTR("The request timed out. Please try again.");
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("email_not_verified")) & 1) != 0)
    {
      v6 = CFSTR("WFDropboxErrorDomain");
      v8 = 109;
      v7 = CFSTR("An error occurred when creating a sharing link because the email associated with your Dropbox account has not been verified.");
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("shared_link_already_exists")) & 1) != 0)
    {
      v6 = CFSTR("WFDropboxErrorDomain");
      v8 = 110;
      v7 = CFSTR("A shared link already exists.");
    }
    else
    {
      v6 = CFSTR("WFDropboxErrorDomain");
      if (!objc_msgSend(v5, "isEqualToString:", CFSTR("access_denied")))
        goto LABEL_39;
      v7 = CFSTR("Access to the requested path is forbidden.");
      v8 = 113;
    }
    WFLocalizedString(v7);
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      v12 = (void *)MEMORY[0x24BDD1540];
      v15 = *MEMORY[0x24BDD0FC8];
      v16[0] = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", v6, v8, v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_40:
      goto LABEL_41;
    }
LABEL_39:
    v9 = 0;
    goto LABEL_40;
  }
  v9 = 0;
LABEL_41:

  return v9;
}

void __Block_byref_object_copy__240(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void __Block_byref_object_dispose__241(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

__CFString *WFDropboxProcessPath(void *a1)
{
  id v1;
  __CFString *v2;
  uint64_t v3;
  uint64_t v4;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("/")) & 1) != 0)
  {
    v2 = &stru_24F8BBA48;
  }
  else
  {
    if ((objc_msgSend(v1, "hasPrefix:", CFSTR("/")) & 1) == 0 && objc_msgSend(v1, "length"))
    {
      objc_msgSend(CFSTR("/"), "stringByAppendingString:", v1);
      v3 = objc_claimAutoreleasedReturnValue();

      v1 = (id)v3;
    }
    if (objc_msgSend(v1, "hasSuffix:", CFSTR("/")))
    {
      objc_msgSend(v1, "substringToIndex:", objc_msgSend(v1, "length") - 1);
      v4 = objc_claimAutoreleasedReturnValue();

      v1 = (id)v4;
    }
    v2 = (__CFString *)v1;
    v1 = v2;
  }

  return v2;
}

uint64_t __Block_byref_object_copy__47478(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__47479(uint64_t a1)
{

}

void *__Block_byref_object_copy__159(uint64_t a1, uint64_t a2)
{
  void *result;

  result = _Block_copy(*(const void **)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__160(uint64_t a1)
{

}

void sub_22D658B84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *MediaPlayerLibrary_47683()
{
  void *v0;
  void *v2;
  void *v3;

  if (!MediaPlayerLibraryCore_frameworkLibrary_47692)
    MediaPlayerLibraryCore_frameworkLibrary_47692 = _sl_dlopen();
  v0 = (void *)MediaPlayerLibraryCore_frameworkLibrary_47692;
  if (!MediaPlayerLibraryCore_frameworkLibrary_47692)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *MediaPlayerLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("WFSetListeningModeAction.m"), 28, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void sub_22D6590C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getMPAVOutputDeviceRouteClass_block_invoke_47702(uint64_t a1)
{
  void *v2;
  void *v3;

  MediaPlayerLibrary_47683();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("MPAVOutputDeviceRoute");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMPAVOutputDeviceRouteClass_softClass_47701 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getMPAVOutputDeviceRouteClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WFSetListeningModeAction.m"), 29, CFSTR("Unable to find class %s"), "MPAVOutputDeviceRoute");

    __break(1u);
  }
}

void sub_22D65AA38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  _Block_object_dispose(&a21, 8);
  objc_destroyWeak(location);
  _Unwind_Resume(a1);
}

id HKUnitPreferenceControllerFunction()
{
  return (id)classHKUnitPreferenceController;
}

Class initHKUnitPreferenceController()
{
  Class result;

  if (HealthUILibrary_sOnce_48016 != -1)
    dispatch_once(&HealthUILibrary_sOnce_48016, &__block_literal_global_48017);
  result = objc_getClass("HKUnitPreferenceController");
  classHKUnitPreferenceController = (uint64_t)result;
  getHKUnitPreferenceControllerClass = (uint64_t (*)())HKUnitPreferenceControllerFunction;
  return result;
}

void __Block_byref_object_copy__48038(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void __Block_byref_object_dispose__48039(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

id WFHKBloodGlucoseMealTimeUnspecified()
{
  return WFLocalizedParameterValueMarker(CFSTR("Unspecified"));
}

uint64_t WFHKNormalizeString(void *a1, const char *a2)
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR(" "));
}

void sub_22D65D50C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getNEVPNManagerClass_block_invoke_48291(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!NetworkExtensionLibraryCore_frameworkLibrary_48318)
    NetworkExtensionLibraryCore_frameworkLibrary_48318 = _sl_dlopen();
  if (!NetworkExtensionLibraryCore_frameworkLibrary_48318)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *NetworkExtensionLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFSetVPNAction.m"), 15, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("NEVPNManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getNEVPNManagerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFSetVPNAction.m"), 16, CFSTR("Unable to find class %s"), "NEVPNManager");

LABEL_8:
    __break(1u);
  }
  getNEVPNManagerClass_softClass_48290 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getAVSystemControllerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getAVSystemControllerClass_softClass_48516;
  v7 = getAVSystemControllerClass_softClass_48516;
  if (!getAVSystemControllerClass_softClass_48516)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getAVSystemControllerClass_block_invoke_48517;
    v3[3] = &unk_24F8BB430;
    v3[4] = &v4;
    __getAVSystemControllerClass_block_invoke_48517((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_22D65EC88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAVSystemControllerClass_block_invoke_48517(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!CelestialLibraryCore_frameworkLibrary_48518)
    CelestialLibraryCore_frameworkLibrary_48518 = _sl_dlopen();
  if (!CelestialLibraryCore_frameworkLibrary_48518)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CelestialLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("WFSetVolumeAction.m"), 24, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("AVSystemController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAVSystemControllerClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("WFSetVolumeAction.m"), 25, CFSTR("Unable to find class %s"), "AVSystemController");

LABEL_8:
    __break(1u);
  }
  getAVSystemControllerClass_softClass_48516 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_22D661140(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__48832(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__48833(uint64_t a1)
{

}

void sub_22D661B0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__48868(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__48869(uint64_t a1)
{

}

uint64_t sub_22D6654EC()
{
  return MEMORY[0x24BDB4BE8]();
}

uint64_t sub_22D6654F8()
{
  return MEMORY[0x24BDB4BF0]();
}

uint64_t sub_22D665504()
{
  return MEMORY[0x24BDB4BF8]();
}

uint64_t sub_22D665510()
{
  return MEMORY[0x24BDB4D88]();
}

uint64_t sub_22D66551C()
{
  return MEMORY[0x24BDB4DB8]();
}

uint64_t sub_22D665528()
{
  return MEMORY[0x24BDB4DD8]();
}

uint64_t sub_22D665534()
{
  return MEMORY[0x24BDB4DF8]();
}

uint64_t sub_22D665540()
{
  return MEMORY[0x24BDB4E08]();
}

uint64_t sub_22D66554C()
{
  return MEMORY[0x24BDB4E10]();
}

uint64_t sub_22D665558()
{
  return MEMORY[0x24BDB4E60]();
}

uint64_t sub_22D665564()
{
  return MEMORY[0x24BDB4E68]();
}

uint64_t sub_22D665570()
{
  return MEMORY[0x24BDB4F00]();
}

uint64_t sub_22D66557C()
{
  return MEMORY[0x24BDB4F20]();
}

uint64_t sub_22D665588()
{
  return MEMORY[0x24BDB4F88]();
}

uint64_t sub_22D665594()
{
  return MEMORY[0x24BDB4F98]();
}

uint64_t sub_22D6655A0()
{
  return MEMORY[0x24BDB5010]();
}

uint64_t sub_22D6655AC()
{
  return MEMORY[0x24BDB5028]();
}

uint64_t sub_22D6655B8()
{
  return MEMORY[0x24BDB51B0]();
}

uint64_t sub_22D6655C4()
{
  return MEMORY[0x24BDB51C0]();
}

uint64_t sub_22D6655D0()
{
  return MEMORY[0x24BDB52D0]();
}

uint64_t sub_22D6655DC()
{
  return MEMORY[0x24BDB52D8]();
}

uint64_t sub_22D6655E8()
{
  return MEMORY[0x24BDB52E0]();
}

uint64_t sub_22D6655F4()
{
  return MEMORY[0x24BDB5328]();
}

uint64_t sub_22D665600()
{
  return MEMORY[0x24BDB5330]();
}

uint64_t sub_22D66560C()
{
  return MEMORY[0x24BDB5418]();
}

uint64_t sub_22D665618()
{
  return MEMORY[0x24BDB5420]();
}

uint64_t sub_22D665624()
{
  return MEMORY[0x24BDB5458]();
}

uint64_t sub_22D665630()
{
  return MEMORY[0x24BDB5460]();
}

uint64_t sub_22D66563C()
{
  return MEMORY[0x24BDB5468]();
}

uint64_t sub_22D665648()
{
  return MEMORY[0x24BDB5470]();
}

uint64_t sub_22D665654()
{
  return MEMORY[0x24BDB5508]();
}

uint64_t sub_22D665660()
{
  return MEMORY[0x24BDB5518]();
}

uint64_t sub_22D66566C()
{
  return MEMORY[0x24BDB5528]();
}

uint64_t sub_22D665678()
{
  return MEMORY[0x24BDB5578]();
}

uint64_t sub_22D665684()
{
  return MEMORY[0x24BDB5588]();
}

uint64_t sub_22D665690()
{
  return MEMORY[0x24BDB5690]();
}

uint64_t sub_22D66569C()
{
  return MEMORY[0x24BDB57D0]();
}

uint64_t sub_22D6656A8()
{
  return MEMORY[0x24BDB5800]();
}

uint64_t sub_22D6656B4()
{
  return MEMORY[0x24BDB5810]();
}

uint64_t sub_22D6656C0()
{
  return MEMORY[0x24BDB5978]();
}

uint64_t sub_22D6656CC()
{
  return MEMORY[0x24BDB5980]();
}

uint64_t sub_22D6656D8()
{
  return MEMORY[0x24BDB5A48]();
}

uint64_t sub_22D6656E4()
{
  return MEMORY[0x24BDB5A58]();
}

uint64_t sub_22D6656F0()
{
  return MEMORY[0x24BDB5D40]();
}

uint64_t sub_22D6656FC()
{
  return MEMORY[0x24BDB5D50]();
}

uint64_t sub_22D665708()
{
  return MEMORY[0x24BDB5D68]();
}

uint64_t sub_22D665714()
{
  return MEMORY[0x24BDB5D70]();
}

uint64_t sub_22D665720()
{
  return MEMORY[0x24BDB5D78]();
}

uint64_t sub_22D66572C()
{
  return MEMORY[0x24BDB5D90]();
}

uint64_t sub_22D665738()
{
  return MEMORY[0x24BDB5DA0]();
}

uint64_t sub_22D665744()
{
  return MEMORY[0x24BDB5DA8]();
}

uint64_t sub_22D665750()
{
  return MEMORY[0x24BDB5DB0]();
}

uint64_t sub_22D66575C()
{
  return MEMORY[0x24BDB5DD8]();
}

uint64_t sub_22D665768()
{
  return MEMORY[0x24BDB5DF0]();
}

uint64_t sub_22D665774()
{
  return MEMORY[0x24BDB5E00]();
}

uint64_t sub_22D665780()
{
  return MEMORY[0x24BDB5EF0]();
}

uint64_t sub_22D66578C()
{
  return MEMORY[0x24BDB5F00]();
}

uint64_t sub_22D665798()
{
  return MEMORY[0x24BDB5F38]();
}

uint64_t sub_22D6657A4()
{
  return MEMORY[0x24BDB5F40]();
}

uint64_t sub_22D6657B0()
{
  return MEMORY[0x24BDB5F50]();
}

uint64_t sub_22D6657BC()
{
  return MEMORY[0x24BDB5F58]();
}

uint64_t sub_22D6657C8()
{
  return MEMORY[0x24BDB5FF0]();
}

uint64_t sub_22D6657D4()
{
  return MEMORY[0x24BDB5FF8]();
}

uint64_t sub_22D6657E0()
{
  return MEMORY[0x24BDB6000]();
}

uint64_t sub_22D6657EC()
{
  return MEMORY[0x24BDB6010]();
}

uint64_t sub_22D6657F8()
{
  return MEMORY[0x24BDB6018]();
}

uint64_t sub_22D665804()
{
  return MEMORY[0x24BDB6098]();
}

uint64_t sub_22D665810()
{
  return MEMORY[0x24BDB60A0]();
}

uint64_t sub_22D66581C()
{
  return MEMORY[0x24BDB60A8]();
}

uint64_t sub_22D665828()
{
  return MEMORY[0x24BDB6150]();
}

uint64_t sub_22D665834()
{
  return MEMORY[0x24BDB6168]();
}

uint64_t sub_22D665840()
{
  return MEMORY[0x24BDB61A8]();
}

uint64_t sub_22D66584C()
{
  return MEMORY[0x24BDB61D0]();
}

uint64_t sub_22D665858()
{
  return MEMORY[0x24BDB61E8]();
}

uint64_t sub_22D665864()
{
  return MEMORY[0x24BDB61F0]();
}

uint64_t sub_22D665870()
{
  return MEMORY[0x24BDB61F8]();
}

uint64_t sub_22D66587C()
{
  return MEMORY[0x24BDB6200]();
}

uint64_t sub_22D665888()
{
  return MEMORY[0x24BDB6318]();
}

uint64_t sub_22D665894()
{
  return MEMORY[0x24BDB6330]();
}

uint64_t sub_22D6658A0()
{
  return MEMORY[0x24BDB6398]();
}

uint64_t sub_22D6658AC()
{
  return MEMORY[0x24BDB63A0]();
}

uint64_t sub_22D6658B8()
{
  return MEMORY[0x24BDB63B0]();
}

uint64_t sub_22D6658C4()
{
  return MEMORY[0x24BDB6400]();
}

uint64_t sub_22D6658D0()
{
  return MEMORY[0x24BDB6408]();
}

uint64_t sub_22D6658DC()
{
  return MEMORY[0x24BDB6410]();
}

uint64_t sub_22D6658E8()
{
  return MEMORY[0x24BDB6420]();
}

uint64_t sub_22D6658F4()
{
  return MEMORY[0x24BDB6430]();
}

uint64_t sub_22D665900()
{
  return MEMORY[0x24BDB64B0]();
}

uint64_t sub_22D66590C()
{
  return MEMORY[0x24BDB64E0]();
}

uint64_t sub_22D665918()
{
  return MEMORY[0x24BDB64E8]();
}

uint64_t sub_22D665924()
{
  return MEMORY[0x24BDB6588]();
}

uint64_t sub_22D665930()
{
  return MEMORY[0x24BDCB430]();
}

uint64_t sub_22D66593C()
{
  return MEMORY[0x24BDCB468]();
}

uint64_t sub_22D665948()
{
  return MEMORY[0x24BDCB470]();
}

uint64_t sub_22D665954()
{
  return MEMORY[0x24BDCB488]();
}

uint64_t sub_22D665960()
{
  return MEMORY[0x24BDCB498]();
}

uint64_t sub_22D66596C()
{
  return MEMORY[0x24BDCB930]();
}

uint64_t sub_22D665978()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_22D665984()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_22D665990()
{
  return MEMORY[0x24BDCBE78]();
}

uint64_t sub_22D66599C()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_22D6659A8()
{
  return MEMORY[0x24BDCCB20]();
}

uint64_t sub_22D6659B4()
{
  return MEMORY[0x24BDCCBD0]();
}

uint64_t sub_22D6659C0()
{
  return MEMORY[0x24BDCCC10]();
}

uint64_t sub_22D6659CC()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_22D6659D8()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_22D6659E4()
{
  return MEMORY[0x24BDCD320]();
}

uint64_t sub_22D6659F0()
{
  return MEMORY[0x24BDCD340]();
}

uint64_t sub_22D6659FC()
{
  return MEMORY[0x24BDCD348]();
}

uint64_t sub_22D665A08()
{
  return MEMORY[0x24BDCD380]();
}

uint64_t sub_22D665A14()
{
  return MEMORY[0x24BDCD3B0]();
}

uint64_t sub_22D665A20()
{
  return MEMORY[0x24BDCD810]();
}

uint64_t sub_22D665A2C()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_22D665A38()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_22D665A44()
{
  return MEMORY[0x24BDCD898]();
}

uint64_t sub_22D665A50()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_22D665A5C()
{
  return MEMORY[0x24BDCD908]();
}

uint64_t sub_22D665A68()
{
  return MEMORY[0x24BDCD938]();
}

uint64_t sub_22D665A74()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_22D665A80()
{
  return MEMORY[0x24BDCD9E8]();
}

uint64_t sub_22D665A8C()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_22D665A98()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_22D665AA4()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_22D665AB0()
{
  return MEMORY[0x24BDCDD00]();
}

uint64_t sub_22D665ABC()
{
  return MEMORY[0x24BDCE468]();
}

uint64_t sub_22D665AC8()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_22D665AD4()
{
  return MEMORY[0x24BDCE5F0]();
}

uint64_t sub_22D665AE0()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_22D665AEC()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_22D665AF8()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_22D665B04()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_22D665B10()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_22D665B1C()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_22D665B28()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_22D665B34()
{
  return MEMORY[0x24BDCEC90]();
}

uint64_t sub_22D665B40()
{
  return MEMORY[0x24BDCECA0]();
}

uint64_t sub_22D665B4C()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_22D665B58()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_22D665B64()
{
  return MEMORY[0x24BDCF188]();
}

uint64_t sub_22D665B70()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_22D665B7C()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_22D665B88()
{
  return MEMORY[0x24BDCF4D8]();
}

uint64_t sub_22D665B94()
{
  return MEMORY[0x24BDCF4F0]();
}

uint64_t sub_22D665BA0()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_22D665BAC()
{
  return MEMORY[0x24BDFA1D0]();
}

uint64_t sub_22D665BB8()
{
  return MEMORY[0x24BDFA1D8]();
}

uint64_t sub_22D665BC4()
{
  return MEMORY[0x24BDFA1E8]();
}

uint64_t sub_22D665BD0()
{
  return MEMORY[0x24BDFA200]();
}

uint64_t sub_22D665BDC()
{
  return MEMORY[0x24BDFA218]();
}

uint64_t sub_22D665BE8()
{
  return MEMORY[0x24BDFA220]();
}

uint64_t sub_22D665BF4()
{
  return MEMORY[0x24BDFA228]();
}

uint64_t sub_22D665C00()
{
  return MEMORY[0x24BDFA230]();
}

uint64_t sub_22D665C0C()
{
  return MEMORY[0x24BDFA238]();
}

uint64_t sub_22D665C18()
{
  return MEMORY[0x24BDFA240]();
}

uint64_t sub_22D665C24()
{
  return MEMORY[0x24BDFA268]();
}

uint64_t sub_22D665C30()
{
  return MEMORY[0x24BDFA270]();
}

uint64_t sub_22D665C3C()
{
  return MEMORY[0x24BDFA290]();
}

uint64_t sub_22D665C48()
{
  return MEMORY[0x24BDFA298]();
}

uint64_t sub_22D665C54()
{
  return MEMORY[0x24BDFA2A0]();
}

uint64_t sub_22D665C60()
{
  return MEMORY[0x24BDFA2B8]();
}

uint64_t sub_22D665C6C()
{
  return MEMORY[0x24BDFA2C0]();
}

uint64_t sub_22D665C78()
{
  return MEMORY[0x24BDFA2C8]();
}

uint64_t sub_22D665C84()
{
  return MEMORY[0x24BDFA2D0]();
}

uint64_t sub_22D665C90()
{
  return MEMORY[0x24BDFA2D8]();
}

uint64_t sub_22D665C9C()
{
  return MEMORY[0x24BDFA2E0]();
}

uint64_t sub_22D665CA8()
{
  return MEMORY[0x24BDFA2E8]();
}

uint64_t sub_22D665CB4()
{
  return MEMORY[0x24BDFA2F0]();
}

uint64_t sub_22D665CC0()
{
  return MEMORY[0x24BDFA340]();
}

uint64_t sub_22D665CCC()
{
  return MEMORY[0x24BDFA348]();
}

uint64_t sub_22D665CD8()
{
  return MEMORY[0x24BDFA358]();
}

uint64_t sub_22D665CE4()
{
  return MEMORY[0x24BDFA360]();
}

uint64_t sub_22D665CF0()
{
  return MEMORY[0x24BDFA368]();
}

uint64_t sub_22D665CFC()
{
  return MEMORY[0x24BDFA3A8]();
}

uint64_t sub_22D665D08()
{
  return MEMORY[0x24BDFA3B0]();
}

uint64_t sub_22D665D14()
{
  return MEMORY[0x24BDFA3B8]();
}

uint64_t sub_22D665D20()
{
  return MEMORY[0x24BDFA3C0]();
}

uint64_t sub_22D665D2C()
{
  return MEMORY[0x24BDFA3C8]();
}

uint64_t sub_22D665D38()
{
  return MEMORY[0x24BDFA3D0]();
}

uint64_t sub_22D665D44()
{
  return MEMORY[0x24BDFA3D8]();
}

uint64_t sub_22D665D50()
{
  return MEMORY[0x24BDFA3E8]();
}

uint64_t sub_22D665D5C()
{
  return MEMORY[0x24BDFA430]();
}

uint64_t sub_22D665D68()
{
  return MEMORY[0x24BDFA438]();
}

uint64_t sub_22D665D74()
{
  return MEMORY[0x24BDFA440]();
}

uint64_t sub_22D665D80()
{
  return MEMORY[0x24BDFA448]();
}

uint64_t sub_22D665D8C()
{
  return MEMORY[0x24BDFA458]();
}

uint64_t sub_22D665D98()
{
  return MEMORY[0x24BDFA460]();
}

uint64_t sub_22D665DA4()
{
  return MEMORY[0x24BDFA470]();
}

uint64_t sub_22D665DB0()
{
  return MEMORY[0x24BDFA498]();
}

uint64_t sub_22D665DBC()
{
  return MEMORY[0x24BDFA4A8]();
}

uint64_t sub_22D665DC8()
{
  return MEMORY[0x24BDFA4B0]();
}

uint64_t sub_22D665DD4()
{
  return MEMORY[0x24BDFA4D0]();
}

uint64_t sub_22D665DE0()
{
  return MEMORY[0x24BDFA5D0]();
}

uint64_t sub_22D665DEC()
{
  return MEMORY[0x24BDFA5F0]();
}

uint64_t sub_22D665DF8()
{
  return MEMORY[0x24BDFA608]();
}

uint64_t sub_22D665E04()
{
  return MEMORY[0x24BDFA610]();
}

uint64_t sub_22D665E10()
{
  return MEMORY[0x24BDFA618]();
}

uint64_t sub_22D665E1C()
{
  return MEMORY[0x24BDFA628]();
}

uint64_t sub_22D665E28()
{
  return MEMORY[0x24BDFA630]();
}

uint64_t sub_22D665E34()
{
  return MEMORY[0x24BDFA710]();
}

uint64_t sub_22D665E40()
{
  return MEMORY[0x24BDFA718]();
}

uint64_t sub_22D665E4C()
{
  return MEMORY[0x24BDFA748]();
}

uint64_t sub_22D665E58()
{
  return MEMORY[0x24BDFA750]();
}

uint64_t sub_22D665E64()
{
  return MEMORY[0x24BDFA758]();
}

uint64_t sub_22D665E70()
{
  return MEMORY[0x24BDFA800]();
}

uint64_t sub_22D665E7C()
{
  return MEMORY[0x24BDFA808]();
}

uint64_t sub_22D665E88()
{
  return MEMORY[0x24BDFA810]();
}

uint64_t sub_22D665E94()
{
  return MEMORY[0x24BDFA830]();
}

uint64_t sub_22D665EA0()
{
  return MEMORY[0x24BDFA840]();
}

uint64_t sub_22D665EAC()
{
  return MEMORY[0x24BDFA858]();
}

uint64_t sub_22D665EB8()
{
  return MEMORY[0x24BDFA888]();
}

uint64_t sub_22D665EC4()
{
  return MEMORY[0x24BDFA890]();
}

uint64_t sub_22D665ED0()
{
  return MEMORY[0x24BDFA898]();
}

uint64_t sub_22D665EDC()
{
  return MEMORY[0x24BEC2FC8]();
}

uint64_t sub_22D665EE8()
{
  return MEMORY[0x24BEC2FD8]();
}

uint64_t sub_22D665EF4()
{
  return MEMORY[0x24BEC3288]();
}

uint64_t sub_22D665F00()
{
  return MEMORY[0x24BEC3348]();
}

uint64_t sub_22D665F0C()
{
  return MEMORY[0x24BEC3350]();
}

uint64_t sub_22D665F18()
{
  return MEMORY[0x24BEC3358]();
}

uint64_t sub_22D665F24()
{
  return MEMORY[0x24BEC3360]();
}

uint64_t sub_22D665F30()
{
  return MEMORY[0x24BEC3368]();
}

uint64_t sub_22D665F3C()
{
  return MEMORY[0x24BEC3378]();
}

uint64_t sub_22D665F48()
{
  return MEMORY[0x24BEC3418]();
}

uint64_t sub_22D665F54()
{
  return MEMORY[0x24BEC3420]();
}

uint64_t sub_22D665F60()
{
  return MEMORY[0x24BEC3428]();
}

uint64_t sub_22D665F6C()
{
  return MEMORY[0x24BEC35A0]();
}

uint64_t sub_22D665F78()
{
  return MEMORY[0x24BEC35A8]();
}

uint64_t sub_22D665F84()
{
  return MEMORY[0x24BEC3648]();
}

uint64_t sub_22D665F90()
{
  return MEMORY[0x24BEC3650]();
}

uint64_t sub_22D665F9C()
{
  return MEMORY[0x24BEC3658]();
}

uint64_t sub_22D665FA8()
{
  return MEMORY[0x24BEC3668]();
}

uint64_t sub_22D665FB4()
{
  return MEMORY[0x24BEC3670]();
}

uint64_t sub_22D665FC0()
{
  return MEMORY[0x24BEC3690]();
}

uint64_t sub_22D665FCC()
{
  return MEMORY[0x24BEC3698]();
}

uint64_t sub_22D665FD8()
{
  return MEMORY[0x24BEC3738]();
}

uint64_t sub_22D665FE4()
{
  return MEMORY[0x24BEC3770]();
}

uint64_t sub_22D665FF0()
{
  return MEMORY[0x24BEC3778]();
}

uint64_t sub_22D665FFC()
{
  return MEMORY[0x24BEC3788]();
}

uint64_t sub_22D666008()
{
  return MEMORY[0x24BEC3790]();
}

uint64_t sub_22D666014()
{
  return MEMORY[0x24BEC3798]();
}

uint64_t sub_22D666020()
{
  return MEMORY[0x24BEC37A8]();
}

uint64_t sub_22D66602C()
{
  return MEMORY[0x24BEC37B8]();
}

uint64_t sub_22D666038()
{
  return MEMORY[0x24BEC37C0]();
}

uint64_t sub_22D666044()
{
  return MEMORY[0x24BEC37D0]();
}

uint64_t sub_22D666050()
{
  return MEMORY[0x24BEC37F0]();
}

uint64_t sub_22D66605C()
{
  return MEMORY[0x24BEC37F8]();
}

uint64_t sub_22D666068()
{
  return MEMORY[0x24BEC3808]();
}

uint64_t sub_22D666074()
{
  return MEMORY[0x24BEDF3E8]();
}

uint64_t sub_22D666080()
{
  return MEMORY[0x24BEDF408]();
}

uint64_t sub_22D66608C()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_22D666098()
{
  return MEMORY[0x24BEC1270]();
}

uint64_t sub_22D6660A4()
{
  return MEMORY[0x24BEE6238]();
}

uint64_t sub_22D6660B0()
{
  return MEMORY[0x24BEE6270]();
}

uint64_t sub_22D6660BC()
{
  return MEMORY[0x24BEE63B8]();
}

uint64_t sub_22D6660C8()
{
  return MEMORY[0x24BEE6410]();
}

uint64_t sub_22D6660D4()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_22D6660E0()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_22D6660EC()
{
  return MEMORY[0x24BEB9728]();
}

uint64_t sub_22D6660F8()
{
  return MEMORY[0x24BEB9738]();
}

uint64_t sub_22D666104()
{
  return MEMORY[0x24BEB9970]();
}

uint64_t sub_22D666110()
{
  return MEMORY[0x24BEB9A18]();
}

uint64_t sub_22D66611C()
{
  return MEMORY[0x24BEB9A48]();
}

uint64_t sub_22D666128()
{
  return MEMORY[0x24BEB9A60]();
}

uint64_t sub_22D666134()
{
  return MEMORY[0x24BEB9AB8]();
}

uint64_t sub_22D666140()
{
  return MEMORY[0x24BEB9B28]();
}

uint64_t sub_22D66614C()
{
  return MEMORY[0x24BEB9B48]();
}

uint64_t sub_22D666158()
{
  return MEMORY[0x24BEB9B70]();
}

uint64_t sub_22D666164()
{
  return MEMORY[0x24BEB9C30]();
}

uint64_t sub_22D666170()
{
  return MEMORY[0x24BEB9CD8]();
}

uint64_t sub_22D66617C()
{
  return MEMORY[0x24BEB9CF0]();
}

uint64_t sub_22D666188()
{
  return MEMORY[0x24BEB9D20]();
}

uint64_t sub_22D666194()
{
  return MEMORY[0x24BEB9D68]();
}

uint64_t sub_22D6661A0()
{
  return MEMORY[0x24BEB9D70]();
}

uint64_t sub_22D6661AC()
{
  return MEMORY[0x24BEB9D80]();
}

uint64_t sub_22D6661B8()
{
  return MEMORY[0x24BEB9D90]();
}

uint64_t sub_22D6661C4()
{
  return MEMORY[0x24BEB9D98]();
}

uint64_t sub_22D6661D0()
{
  return MEMORY[0x24BEB9DA0]();
}

uint64_t sub_22D6661DC()
{
  return MEMORY[0x24BEB9DB0]();
}

uint64_t sub_22D6661E8()
{
  return MEMORY[0x24BEB9DC8]();
}

uint64_t sub_22D6661F4()
{
  return MEMORY[0x24BEB9DE0]();
}

uint64_t sub_22D666200()
{
  return MEMORY[0x24BEB9DF0]();
}

uint64_t sub_22D66620C()
{
  return MEMORY[0x24BEB9E58]();
}

uint64_t sub_22D666218()
{
  return MEMORY[0x24BEB9E68]();
}

uint64_t sub_22D666224()
{
  return MEMORY[0x24BEB9E70]();
}

uint64_t sub_22D666230()
{
  return MEMORY[0x24BEB9F28]();
}

uint64_t sub_22D66623C()
{
  return MEMORY[0x24BEB9F50]();
}

uint64_t sub_22D666248()
{
  return MEMORY[0x24BEB9F60]();
}

uint64_t sub_22D666254()
{
  return MEMORY[0x24BEB9F98]();
}

uint64_t sub_22D666260()
{
  return MEMORY[0x24BEB9FA0]();
}

uint64_t sub_22D66626C()
{
  return MEMORY[0x24BEB9FA8]();
}

uint64_t sub_22D666278()
{
  return MEMORY[0x24BEBA018]();
}

uint64_t sub_22D666284()
{
  return MEMORY[0x24BEBA028]();
}

uint64_t sub_22D666290()
{
  return MEMORY[0x24BEBA030]();
}

uint64_t sub_22D66629C()
{
  return MEMORY[0x24BEBA038]();
}

uint64_t sub_22D6662A8()
{
  return MEMORY[0x24BEBA058]();
}

uint64_t sub_22D6662B4()
{
  return MEMORY[0x24BEBA088]();
}

uint64_t sub_22D6662C0()
{
  return MEMORY[0x24BEBA098]();
}

uint64_t sub_22D6662CC()
{
  return MEMORY[0x24BEBA0A0]();
}

uint64_t sub_22D6662D8()
{
  return MEMORY[0x24BEBA0A8]();
}

uint64_t sub_22D6662E4()
{
  return MEMORY[0x24BEBA0B0]();
}

uint64_t sub_22D6662F0()
{
  return MEMORY[0x24BEBA0B8]();
}

uint64_t sub_22D6662FC()
{
  return MEMORY[0x24BEBA0E0]();
}

uint64_t sub_22D666308()
{
  return MEMORY[0x24BEBA110]();
}

uint64_t sub_22D666314()
{
  return MEMORY[0x24BEBA120]();
}

uint64_t sub_22D666320()
{
  return MEMORY[0x24BEBA178]();
}

uint64_t sub_22D66632C()
{
  return MEMORY[0x24BEBA190]();
}

uint64_t sub_22D666338()
{
  return MEMORY[0x24BEBA198]();
}

uint64_t sub_22D666344()
{
  return MEMORY[0x24BEBA228]();
}

uint64_t sub_22D666350()
{
  return MEMORY[0x24BEBA240]();
}

uint64_t sub_22D66635C()
{
  return MEMORY[0x24BEBA250]();
}

uint64_t sub_22D666368()
{
  return MEMORY[0x24BEBA300]();
}

uint64_t sub_22D666374()
{
  return MEMORY[0x24BEBA308]();
}

uint64_t sub_22D666380()
{
  return MEMORY[0x24BEBA310]();
}

uint64_t sub_22D66638C()
{
  return MEMORY[0x24BEC3838]();
}

uint64_t sub_22D666398()
{
  return MEMORY[0x24BEBA4B0]();
}

uint64_t sub_22D6663A4()
{
  return MEMORY[0x24BEBA4C0]();
}

uint64_t sub_22D6663B0()
{
  return MEMORY[0x24BEBA4E0]();
}

uint64_t sub_22D6663BC()
{
  return MEMORY[0x24BEBA528]();
}

uint64_t sub_22D6663C8()
{
  return MEMORY[0x24BEBA538]();
}

uint64_t sub_22D6663D4()
{
  return MEMORY[0x24BEBA588]();
}

uint64_t sub_22D6663E0()
{
  return MEMORY[0x24BEBA590]();
}

uint64_t sub_22D6663EC()
{
  return MEMORY[0x24BEBA5A0]();
}

uint64_t sub_22D6663F8()
{
  return MEMORY[0x24BEBA5B8]();
}

uint64_t sub_22D666404()
{
  return MEMORY[0x24BEBA620]();
}

uint64_t sub_22D666410()
{
  return MEMORY[0x24BEBA628]();
}

uint64_t sub_22D66641C()
{
  return MEMORY[0x24BEBA638]();
}

uint64_t sub_22D666428()
{
  return MEMORY[0x24BEBA648]();
}

uint64_t sub_22D666434()
{
  return MEMORY[0x24BEBA650]();
}

uint64_t sub_22D666440()
{
  return MEMORY[0x24BEBA670]();
}

uint64_t sub_22D66644C()
{
  return MEMORY[0x24BEBA698]();
}

uint64_t sub_22D666458()
{
  return MEMORY[0x24BEBA6E8]();
}

uint64_t sub_22D666464()
{
  return MEMORY[0x24BEBA710]();
}

uint64_t sub_22D666470()
{
  return MEMORY[0x24BEBA728]();
}

uint64_t sub_22D66647C()
{
  return MEMORY[0x24BEBA730]();
}

uint64_t sub_22D666488()
{
  return MEMORY[0x24BEBA740]();
}

uint64_t sub_22D666494()
{
  return MEMORY[0x24BEE54D8]();
}

uint64_t sub_22D6664A0()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_22D6664AC()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_22D6664B8()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_22D6664C4()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_22D6664D0()
{
  return MEMORY[0x24BEE06A0]();
}

uint64_t sub_22D6664DC()
{
  return MEMORY[0x24BEE06C8]();
}

uint64_t sub_22D6664E8()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_22D6664F4()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_22D666500()
{
  return MEMORY[0x24BDB6620]();
}

uint64_t sub_22D66650C()
{
  return MEMORY[0x24BDCF8D0]();
}

uint64_t sub_22D666518()
{
  return MEMORY[0x24BDCF8D8]();
}

uint64_t sub_22D666524()
{
  return MEMORY[0x24BDCF8E8]();
}

uint64_t sub_22D666530()
{
  return MEMORY[0x24BDCF910]();
}

uint64_t sub_22D66653C()
{
  return MEMORY[0x24BDCF930]();
}

uint64_t sub_22D666548()
{
  return MEMORY[0x24BDCF938]();
}

uint64_t sub_22D666554()
{
  return MEMORY[0x24BDCF948]();
}

uint64_t sub_22D666560()
{
  return MEMORY[0x24BDCF968]();
}

uint64_t sub_22D66656C()
{
  return MEMORY[0x24BDCF978]();
}

uint64_t sub_22D666578()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_22D666584()
{
  return MEMORY[0x24BDCF9F0]();
}

uint64_t sub_22D666590()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_22D66659C()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_22D6665A8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_22D6665B4()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_22D6665C0()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_22D6665CC()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_22D6665D8()
{
  return MEMORY[0x24BEE0AD0]();
}

uint64_t sub_22D6665E4()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_22D6665F0()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_22D6665FC()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_22D666608()
{
  return MEMORY[0x24BEE0BB0]();
}

uint64_t sub_22D666614()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_22D666620()
{
  return MEMORY[0x24BEE0C00]();
}

uint64_t sub_22D66662C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_22D666638()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_22D666644()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_22D666650()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_22D66665C()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_22D666668()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_22D666674()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_22D666680()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_22D66668C()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_22D666698()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_22D6666A4()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_22D6666B0()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_22D6666BC()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_22D6666C8()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_22D6666D4()
{
  return MEMORY[0x24BDB6650]();
}

uint64_t sub_22D6666E0()
{
  return MEMORY[0x24BDCFC20]();
}

uint64_t sub_22D6666EC()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_22D6666F8()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_22D666704()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_22D666710()
{
  return MEMORY[0x24BEE68C8]();
}

uint64_t sub_22D66671C()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_22D666728()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_22D666734()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_22D666740()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_22D66674C()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_22D666758()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_22D666764()
{
  return MEMORY[0x24BEE1910]();
}

uint64_t sub_22D666770()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_22D66677C()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_22D666788()
{
  return MEMORY[0x24BEBA768]();
}

uint64_t sub_22D666794()
{
  return MEMORY[0x24BEC3868]();
}

uint64_t sub_22D6667A0()
{
  return MEMORY[0x24BEC3870]();
}

uint64_t sub_22D6667AC()
{
  return MEMORY[0x24BEC3878]();
}

uint64_t sub_22D6667B8()
{
  return MEMORY[0x24BEC3880]();
}

uint64_t sub_22D6667C4()
{
  return MEMORY[0x24BEC3888]();
}

uint64_t sub_22D6667D0()
{
  return MEMORY[0x24BEC3890]();
}

uint64_t sub_22D6667DC()
{
  return MEMORY[0x24BEC3898]();
}

uint64_t sub_22D6667E8()
{
  return MEMORY[0x24BEC38A0]();
}

uint64_t sub_22D6667F4()
{
  return MEMORY[0x24BEC38B0]();
}

uint64_t sub_22D666800()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_22D66680C()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_22D666818()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_22D666824()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_22D666830()
{
  return MEMORY[0x24BEC38C0]();
}

uint64_t sub_22D66683C()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_22D666848()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_22D666854()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_22D666860()
{
  return MEMORY[0x24BEC38D8]();
}

uint64_t sub_22D66686C()
{
  return MEMORY[0x24BEC38E0]();
}

uint64_t sub_22D666878()
{
  return MEMORY[0x24BDD0010]();
}

uint64_t sub_22D666884()
{
  return MEMORY[0x24BDD0028]();
}

uint64_t sub_22D666890()
{
  return MEMORY[0x24BDD0058]();
}

uint64_t sub_22D66689C()
{
  return MEMORY[0x24BEBA780]();
}

uint64_t sub_22D6668A8()
{
  return MEMORY[0x24BEC3910]();
}

uint64_t sub_22D6668B4()
{
  return MEMORY[0x24BEDF478]();
}

uint64_t sub_22D6668C0()
{
  return MEMORY[0x24BEE5328]();
}

uint64_t sub_22D6668CC()
{
  return MEMORY[0x24BEC3960]();
}

uint64_t sub_22D6668D8()
{
  return MEMORY[0x24BEC3968]();
}

uint64_t sub_22D6668E4()
{
  return MEMORY[0x24BEC3970]();
}

uint64_t sub_22D6668F0()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_22D6668FC()
{
  return MEMORY[0x24BDD0248]();
}

uint64_t sub_22D666908()
{
  return MEMORY[0x24BEC3990]();
}

uint64_t sub_22D666914()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_22D666920()
{
  return MEMORY[0x24BEE1D50]();
}

uint64_t sub_22D66692C()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_22D666938()
{
  return MEMORY[0x24BDD0498]();
}

uint64_t sub_22D666944()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_22D666950()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_22D66695C()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_22D666968()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_22D666974()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_22D666980()
{
  return MEMORY[0x24BEE20D8]();
}

uint64_t sub_22D66698C()
{
  return MEMORY[0x24BEE20E8]();
}

uint64_t sub_22D666998()
{
  return MEMORY[0x24BEE2210]();
}

uint64_t sub_22D6669A4()
{
  return MEMORY[0x24BEE2270]();
}

uint64_t sub_22D6669B0()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_22D6669BC()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_22D6669C8()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_22D6669D4()
{
  return MEMORY[0x24BEE2500]();
}

uint64_t sub_22D6669E0()
{
  return MEMORY[0x24BEE2508]();
}

uint64_t sub_22D6669EC()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_22D6669F8()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_22D666A04()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_22D666A10()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_22D666A1C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_22D666A28()
{
  return MEMORY[0x24BEE2840]();
}

uint64_t sub_22D666A34()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_22D666A40()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_22D666A4C()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_22D666A58()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_22D666A64()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_22D666A70()
{
  return MEMORY[0x24BEE2E58]();
}

uint64_t sub_22D666A7C()
{
  return MEMORY[0x24BEE2E70]();
}

uint64_t sub_22D666A88()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_22D666A94()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_22D666AA0()
{
  return MEMORY[0x24BEE2F58]();
}

uint64_t sub_22D666AAC()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_22D666AB8()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_22D666AC4()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_22D666AD0()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_22D666ADC()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_22D666AE8()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_22D666AF4()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_22D666B00()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t sub_22D666B0C()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_22D666B18()
{
  return MEMORY[0x24BEE3A28]();
}

uint64_t sub_22D666B24()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_22D666B30()
{
  return MEMORY[0x24BEE3B90]();
}

uint64_t sub_22D666B3C()
{
  return MEMORY[0x24BEE3B98]();
}

uint64_t sub_22D666B48()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_22D666B54()
{
  return MEMORY[0x24BEE3D98]();
}

uint64_t sub_22D666B60()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_22D666B6C()
{
  return MEMORY[0x24BDD06E0]();
}

uint64_t sub_22D666B78()
{
  return MEMORY[0x24BDD06F0]();
}

uint64_t sub_22D666B84()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_22D666B90()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_22D666B9C()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_22D666BA8()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_22D666BB4()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_22D666BC0()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_22D666BCC()
{
  return MEMORY[0x24BEE4328]();
}

void AudioServicesPlaySystemSoundWithCompletion(SystemSoundID inSystemSoundID, void *inCompletionBlock)
{
  MEMORY[0x24BDB6988](*(_QWORD *)&inSystemSoundID, inCompletionBlock);
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x24BE0C258]();
}

uint64_t CARenderServerGetDisplayLogicalBounds()
{
  return MEMORY[0x24BDE5528]();
}

uint64_t CARenderServerSnapshot()
{
  return MEMORY[0x24BDE5560]();
}

void CCHmac(CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
  MEMORY[0x24BDAC238](*(_QWORD *)&algorithm, key, keyLength, data, dataLength, macOut);
}

void CCHmacFinal(CCHmacContext *ctx, void *macOut)
{
  MEMORY[0x24BDAC240](ctx, macOut);
}

void CCHmacInit(CCHmacContext *ctx, CCHmacAlgorithm algorithm, const void *key, size_t keyLength)
{
  MEMORY[0x24BDAC248](ctx, *(_QWORD *)&algorithm, key, keyLength);
}

void CCHmacUpdate(CCHmacContext *ctx, const void *data, size_t dataLength)
{
  MEMORY[0x24BDAC250](ctx, data, dataLength);
}

uint64_t CCRSACryptorCreatePublicKeyFromPrivateKey()
{
  return MEMORY[0x24BDAC288]();
}

uint64_t CCRSACryptorExport()
{
  return MEMORY[0x24BDAC290]();
}

uint64_t CCRSACryptorGeneratePair()
{
  return MEMORY[0x24BDAC298]();
}

uint64_t CCRSACryptorImport()
{
  return MEMORY[0x24BDAC2A0]();
}

uint64_t CCRSACryptorRelease()
{
  return MEMORY[0x24BDAC2A8]();
}

uint64_t CCRSAGetKeyComponents()
{
  return MEMORY[0x24BDAC2B0]();
}

uint64_t CCRSAGetKeySize()
{
  return MEMORY[0x24BDAC2B8]();
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC300](data, *(_QWORD *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC320](data, *(_QWORD *)&len, md);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC358](data, *(_QWORD *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x24BDBB930](arg);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

CFHTTPMessageRef CFHTTPMessageCreateRequest(CFAllocatorRef alloc, CFStringRef requestMethod, CFURLRef url, CFStringRef httpVersion)
{
  return (CFHTTPMessageRef)MEMORY[0x24BDB72D8](alloc, requestMethod, url, httpVersion);
}

void CFHTTPMessageSetHeaderFieldValue(CFHTTPMessageRef message, CFStringRef headerField, CFStringRef value)
{
  MEMORY[0x24BDB7310](message, headerField, value);
}

CFHostRef CFHostCreateWithName(CFAllocatorRef allocator, CFStringRef hostname)
{
  return (CFHostRef)MEMORY[0x24BDB7320](allocator, hostname);
}

CFArrayRef CFHostGetAddressing(CFHostRef theHost, Boolean *hasBeenResolved)
{
  return (CFArrayRef)MEMORY[0x24BDB7328](theHost, hasBeenResolved);
}

Boolean CFHostStartInfoResolution(CFHostRef theHost, CFHostInfoType info, CFStreamError *error)
{
  return MEMORY[0x24BDB7340](theHost, *(_QWORD *)&info, error);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

CFErrorRef CFReadStreamCopyError(CFReadStreamRef stream)
{
  return (CFErrorRef)MEMORY[0x24BDBC220](stream);
}

CFReadStreamRef CFReadStreamCreateForHTTPRequest(CFAllocatorRef alloc, CFHTTPMessageRef request)
{
  return (CFReadStreamRef)MEMORY[0x24BDB7350](alloc, request);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x24BDBC258](stream);
}

CFIndex CFReadStreamRead(CFReadStreamRef stream, UInt8 *buffer, CFIndex bufferLength)
{
  return MEMORY[0x24BDBC260](stream, buffer, bufferLength);
}

void CFReadStreamScheduleWithRunLoop(CFReadStreamRef stream, CFRunLoopRef runLoop, CFRunLoopMode runLoopMode)
{
  MEMORY[0x24BDBC268](stream, runLoop, runLoopMode);
}

Boolean CFReadStreamSetClient(CFReadStreamRef stream, CFOptionFlags streamEvents, CFReadStreamClientCallBack clientCB, CFStreamClientContext *clientContext)
{
  return MEMORY[0x24BDBC270](stream, streamEvents, clientCB, clientContext);
}

Boolean CFReadStreamSetProperty(CFReadStreamRef stream, CFStreamPropertyKey propertyName, CFTypeRef propertyValue)
{
  return MEMORY[0x24BDBC280](stream, propertyName, propertyValue);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC300]();
}

CFSocketError CFSocketConnectToAddress(CFSocketRef s, CFDataRef address, CFTimeInterval timeout)
{
  return MEMORY[0x24BDBC440](s, address, timeout);
}

CFSocketRef CFSocketCreate(CFAllocatorRef allocator, SInt32 protocolFamily, SInt32 socketType, SInt32 protocol, CFOptionFlags callBackTypes, CFSocketCallBack callout, const CFSocketContext *context)
{
  return (CFSocketRef)MEMORY[0x24BDBC448](allocator, *(_QWORD *)&protocolFamily, *(_QWORD *)&socketType, *(_QWORD *)&protocol, callBackTypes, callout, context);
}

CFSocketNativeHandle CFSocketGetNative(CFSocketRef s)
{
  return MEMORY[0x24BDBC470](s);
}

void CFSocketInvalidate(CFSocketRef s)
{
  MEMORY[0x24BDBC480](s);
}

void CFStreamCreateBoundPair(CFAllocatorRef alloc, CFReadStreamRef *readStream, CFWriteStreamRef *writeStream, CFIndex transferBufferSize)
{
  MEMORY[0x24BDBC490](alloc, readStream, writeStream, transferBufferSize);
}

CFStringRef CFStringConvertEncodingToIANACharSetName(CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC4E8](*(_QWORD *)&encoding);
}

unint64_t CFStringConvertEncodingToNSStringEncoding(CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC4F0](*(_QWORD *)&encoding);
}

CFStringEncoding CFStringConvertIANACharSetNameToEncoding(CFStringRef theString)
{
  return MEMORY[0x24BDBC4F8](theString);
}

CFStringEncoding CFStringConvertNSStringEncodingToEncoding(unint64_t encoding)
{
  return MEMORY[0x24BDBC500](encoding);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x24BDBC5B0](alloc, str, range.location, range.length);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x24BDBC5F8](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFStringRef CFStringGetNameOfEncoding(CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC670](*(_QWORD *)&encoding);
}

CFStringRef CFURLCopyLastPathComponent(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x24BDBC7A8](url);
}

CFStringRef CFURLCopyPassword(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x24BDBC7B0](anURL);
}

CFStringRef CFURLCopyUserName(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x24BDBC7E0](anURL);
}

CFURLRef CFURLCreateCopyDeletingLastPathComponent(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x24BDBC808](allocator, url);
}

CFStringRef CFURLCreateStringByAddingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveUnescaped, CFStringRef legalURLCharactersToBeEscaped, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC838](allocator, originalString, charactersToLeaveUnescaped, legalURLCharactersToBeEscaped, *(_QWORD *)&encoding);
}

CFStringRef CFURLCreateStringByReplacingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveEscaped)
{
  return (CFStringRef)MEMORY[0x24BDBC840](allocator, originalString, charactersToLeaveEscaped);
}

CFStringRef CFURLCreateStringByReplacingPercentEscapesUsingEncoding(CFAllocatorRef allocator, CFStringRef origString, CFStringRef charsToLeaveEscaped, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC848](allocator, origString, charsToLeaveEscaped, *(_QWORD *)&encoding);
}

Boolean CFURLHasDirectoryPath(CFURLRef anURL)
{
  return MEMORY[0x24BDBC8B8](anURL);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8D0](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x24BDBC8E8](alloc, uuid);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8A0](retstr, t1, t2);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x24BDBD8C8](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8D8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD900](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD908](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x24BDBD920](context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB80]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBB8](name);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x24BDBDCE0](c, path);
}

void CGContextClip(CGContextRef c)
{
  MEMORY[0x24BDBDD28](c);
}

void CGContextClipToMask(CGContextRef c, CGRect rect, CGImageRef mask)
{
  MEMORY[0x24BDBDD30](c, mask, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDD38](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x24BDBDDD8](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x24BDBDF30](c);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x24BDBDF58](c);
}

void CGContextRotateCTM(CGContextRef c, CGFloat angle)
{
  MEMORY[0x24BDBDF68](c, angle);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x24BDBDF70](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x24BDBDF78](c, sx, sy);
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
  MEMORY[0x24BDBE018](c, *(_QWORD *)&quality);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x24BDBE130](c, tx, ty);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE190](info, data, size, releaseData);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
  MEMORY[0x24BDBE1C8](provider);
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x24BDBE5E0](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(_QWORD *)&bitmapInfo, provider);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x24BDBE5F8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x24BDD9048](idst, image, properties);
}

uint64_t CGImageDestinationCopyImageFormats()
{
  return MEMORY[0x24BDD9060]();
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x24BDD9088](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x24BDD9090](idst);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

void CGPathAddEllipseInRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
  MEMORY[0x24BDBEDC0](path, m, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x24BDBEE80]();
}

CGPathRef CGPathCreateWithRoundedRect(CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x24BDBEEB0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, cornerWidth, cornerHeight);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x24BDBEF48](path);
}

CGPathRef CGPathRetain(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x24BDBEF50](path);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBEFB8](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBF038]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x24BDC0498](retstr, value, *(_QWORD *)&timescale);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x24BDC0580](retstr, start, duration);
}

uint64_t CNContactPropertyKeyFromWFContactPropertyID()
{
  return MEMORY[0x24BE19350]();
}

CTFontRef CTFontCreateWithName(CFStringRef name, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x24BDC47C8](name, matrix, size);
}

BOOL CTFontGetGlyphsForCharacters(CTFontRef font, const UniChar *characters, CGGlyph *glyphs, CFIndex count)
{
  return MEMORY[0x24BDC48F0](font, characters, glyphs, count);
}

uint64_t INCRouteAudioToAirplayOutputDevices()
{
  return MEMORY[0x24BE5B8F0]();
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x24BDD8B50](properties);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x24BDD8B80](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x24BDD8D08](buffer, *(_QWORD *)&options, seed);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x24BDD8DD0](buffer, *(_QWORD *)&options, seed);
}

BOOL JSCheckScriptSyntax(JSContextRef ctx, JSStringRef script, JSStringRef sourceURL, int startingLineNumber, JSValueRef *exception)
{
  return MEMORY[0x24BDDA528](ctx, script, sourceURL, *(_QWORD *)&startingLineNumber, exception);
}

CFStringRef JSStringCopyCFString(CFAllocatorRef alloc, JSStringRef string)
{
  return (CFStringRef)MEMORY[0x24BDDA638](alloc, string);
}

JSStringRef JSStringCreateWithUTF8CString(const char *string)
{
  return (JSStringRef)MEMORY[0x24BDDA648](string);
}

void JSStringRelease(JSStringRef string)
{
  MEMORY[0x24BDDA670](string);
}

JSStringRef JSValueToStringCopy(JSContextRef ctx, JSValueRef value, JSValueRef *exception)
{
  return (JSStringRef)MEMORY[0x24BDDA710](ctx, value, exception);
}

uint64_t MRAVEndpointGetLocalEndpoint()
{
  return MEMORY[0x24BE64DC0]();
}

uint64_t MRAVOutputDeviceCopyAvailableBluetoothListeningMode()
{
  return MEMORY[0x24BE64E58]();
}

uint64_t MRAVOutputDeviceSetCurrentBluetoothListeningMode()
{
  return MEMORY[0x24BE64E98]();
}

uint64_t MRAVReconnaissanceSessionBeginEndpointsSearch()
{
  return MEMORY[0x24BE64EB0]();
}

uint64_t MRAVReconnaissanceSessionCreateWithEndpointFeatures()
{
  return MEMORY[0x24BE64EC8]();
}

uint64_t MRAVReconnaissanceSessionSetReturnPartialResults()
{
  return MEMORY[0x24BE64EE8]();
}

uint64_t MRAVReconnaissanceSessionSetWaitForUnanimousEndpoints()
{
  return MEMORY[0x24BE64F00]();
}

uint64_t MRMediaRemoteCopyCommandDescription()
{
  return MEMORY[0x24BE650C0]();
}

uint64_t MRMediaRemoteCopyCommandHandlerStatusDescription()
{
  return MEMORY[0x24BE650C8]();
}

uint64_t MRMediaRemoteCopySendCommandErrorDescription()
{
  return MEMORY[0x24BE650F0]();
}

uint64_t MRMediaRemoteGetLocalOrigin()
{
  return MEMORY[0x24BE65148]();
}

uint64_t MRMediaRemotePlaybackSessionMigrateForDevice()
{
  return MEMORY[0x24BE651F0]();
}

uint64_t MRMediaRemoteSendCommandToPlayer()
{
  return MEMORY[0x24BE65238]();
}

uint64_t MRMediaRemoteSendCommandWithReply()
{
  return MEMORY[0x24BE65248]();
}

uint64_t MRMediaRemoteSetAppPlaybackQueueForPlayer()
{
  return MEMORY[0x24BE65258]();
}

uint64_t MRNowPlayingClientCreate()
{
  return MEMORY[0x24BE65298]();
}

uint64_t MRNowPlayingPlayerCreate()
{
  return MEMORY[0x24BE652C0]();
}

uint64_t MRNowPlayingPlayerPathCreate()
{
  return MEMORY[0x24BE652D8]();
}

uint64_t MRSystemAppPlaybackQueueCreate()
{
  return MEMORY[0x24BE653F8]();
}

uint64_t MRSystemAppPlaybackQueueDestroy()
{
  return MEMORY[0x24BE65410]();
}

uint64_t MRSystemAppPlaybackQueueSetGenericTrackIdentifiers()
{
  return MEMORY[0x24BE65438]();
}

uint64_t MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback()
{
  return MEMORY[0x24BE65440]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x24BDD0E08](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSRange NSRangeFromString(NSString *aString)
{
  NSUInteger v1;
  NSUInteger v2;
  NSRange result;

  v1 = MEMORY[0x24BDD11C8](aString);
  result.length = v2;
  result.location = v1;
  return result;
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x24BDD1208](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x24BDD1258](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

uint64_t SBSLockDevice()
{
  return MEMORY[0x24BEB0CB8]();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A70](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A78](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x24BDE8A80](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x24BDE8A88](query, attributesToUpdate);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x24BDE8D70](allocator);
}

uint32_t SecTaskGetCodeSignStatus(SecTaskRef task)
{
  return MEMORY[0x24BDE8D80](task);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BEBE280](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BEBE298]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BEBE2B0]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x24BEBE2D8](image, compressionQuality);
}

CFStringRef UTTypeCopyPreferredTagWithClass(CFStringRef inUTI, CFStringRef inTagClass)
{
  return (CFStringRef)MEMORY[0x24BDC15D0](inUTI, inTagClass);
}

CFStringRef UTTypeCreatePreferredIdentifierForTag(CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI)
{
  return (CFStringRef)MEMORY[0x24BDC15E0](inTagClass, inTag, inConformingToUTI);
}

uint64_t VCIsDeviceLocked()
{
  return MEMORY[0x24BEC17E8]();
}

uint64_t VCIsInternalBuild()
{
  return MEMORY[0x24BEC17F0]();
}

uint64_t WFAddImageFileToGIF()
{
  return MEMORY[0x24BE19690]();
}

uint64_t WFAppTransportSecuredURL()
{
  return MEMORY[0x24BE196A0]();
}

uint64_t WFArchiveFormatFileExtension()
{
  return MEMORY[0x24BE196B0]();
}

uint64_t WFArchiveFormatSupportsMultipleFiles()
{
  return MEMORY[0x24BE196B8]();
}

uint64_t WFAsyncTransformedImageFromImage()
{
  return MEMORY[0x24BE196C8]();
}

uint64_t WFCLInUseAssertionWithOptions()
{
  return MEMORY[0x24BEC4320]();
}

uint64_t WFCLLocationAccuracyFromWFLocationAccuracy()
{
  return MEMORY[0x24BEC4328]();
}

uint64_t WFClearWorkflowEventStore()
{
  return MEMORY[0x24BE19710]();
}

uint64_t WFContentItemListThumbnailCornerRadiusForRoundingStyle()
{
  return MEMORY[0x24BEC1818]();
}

uint64_t WFCreateArchiveWithFiles()
{
  return MEMORY[0x24BE19778]();
}

uint64_t WFDateFormattingGetDefaultCustomDateFormat()
{
  return MEMORY[0x24BE19780]();
}

uint64_t WFExtractArchiveFile()
{
  return MEMORY[0x24BE197E8]();
}

uint64_t WFFinderImageResizeFormatFromDescription()
{
  return MEMORY[0x24BEC18B0]();
}

uint64_t WFFinderImageResizeSizeFromDescription()
{
  return MEMORY[0x24BEC18B8]();
}

uint64_t WFGenerateGIFFromImageFiles()
{
  return MEMORY[0x24BE19800]();
}

uint64_t WFGenerateGIFFromVideo()
{
  return MEMORY[0x24BE19808]();
}

uint64_t WFGenerateImageFilesFromGIF()
{
  return MEMORY[0x24BE19810]();
}

uint64_t WFGenerateVideoFromGIF()
{
  return MEMORY[0x24BE19818]();
}

uint64_t WFGetContentLocationFromURLActionInput()
{
  return MEMORY[0x24BE19820]();
}

uint64_t WFGetWorkflowEventStore()
{
  return MEMORY[0x24BE19828]();
}

uint64_t WFGetWorkflowReminderStore()
{
  return MEMORY[0x24BE19830]();
}

uint64_t WFImageDataIsAnimatedGIF()
{
  return MEMORY[0x24BE19848]();
}

uint64_t WFImagePropertyNameAlbum()
{
  return MEMORY[0x24BE19850]();
}

uint64_t WFImagePropertyNameDateTaken()
{
  return MEMORY[0x24BE19858]();
}

uint64_t WFImagePropertyNameIsScreenshot()
{
  return MEMORY[0x24BE19860]();
}

uint64_t WFImagePropertyNameMediaType()
{
  return MEMORY[0x24BE19868]();
}

uint64_t WFImagePropertyNamePhotoType()
{
  return MEMORY[0x24BE19870]();
}

uint64_t WFImageSizeFromFile()
{
  return MEMORY[0x24BE19878]();
}

uint64_t WFLivePhotoFileType()
{
  return MEMORY[0x24BE19890]();
}

uint64_t WFMakeContentLocationForRemindersAccount()
{
  return MEMORY[0x24BE198A0]();
}

uint64_t WFMaximumBundleVersion()
{
  return MEMORY[0x24BEC44A8]();
}

uint64_t WFMetadataRotateImage()
{
  return MEMORY[0x24BE198A8]();
}

uint64_t WFNotesFolderIntentsValueFromLinkValue()
{
  return MEMORY[0x24BEC44D0]();
}

uint64_t WFNotesFolderLinkValueFromIntentsValue()
{
  return MEMORY[0x24BEC44D8]();
}

uint64_t WFPhotoLibraryMediaTypeImage()
{
  return MEMORY[0x24BE198B0]();
}

uint64_t WFPhotoLibraryMediaTypeVideo()
{
  return MEMORY[0x24BE198B8]();
}

uint64_t WFPhotoLibraryPhotoTypeBurst()
{
  return MEMORY[0x24BE198C0]();
}

uint64_t WFPhotoLibraryPhotoTypeLivePhoto()
{
  return MEMORY[0x24BE198C8]();
}

uint64_t WFReminderPropertyNameDueDate()
{
  return MEMORY[0x24BE198F8]();
}

uint64_t WFReminderPropertyNameIsCompleted()
{
  return MEMORY[0x24BE19900]();
}

uint64_t WFReminderPropertyNameList()
{
  return MEMORY[0x24BE19908]();
}

uint64_t WFResizedImageFromImageFile()
{
  return MEMORY[0x24BE19910]();
}

uint64_t WFSanitizedPostersError()
{
  return MEMORY[0x24BEC4648]();
}

uint64_t WFSetEffectiveBundleForMKLocationManager()
{
  return MEMORY[0x24BEC4660]();
}

uint64_t WFSettingsClientError()
{
  return MEMORY[0x24BEC4670]();
}

uint64_t WFSupportedArchiveFormats()
{
  return MEMORY[0x24BE19920]();
}

uint64_t WFTimeIntervalFromExpectedTravelTime()
{
  return MEMORY[0x24BE19928]();
}

uint64_t WiFiDeviceClientCopyCurrentNetwork()
{
  return MEMORY[0x24BE678E8]();
}

uint64_t WiFiDeviceClientGetInterfaceName()
{
  return MEMORY[0x24BE67918]();
}

uint64_t WiFiManagerClientCopyInterfaces()
{
  return MEMORY[0x24BE679A8]();
}

uint64_t WiFiManagerClientCopyMisPassword()
{
  return MEMORY[0x24BE679B0]();
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x24BE679D0]();
}

uint64_t WiFiManagerClientGetDevice()
{
  return MEMORY[0x24BE67A10]();
}

uint64_t WiFiManagerClientGetMISDiscoveryState()
{
  return MEMORY[0x24BE67A20]();
}

uint64_t WiFiManagerClientSetMISDiscoveryState()
{
  return MEMORY[0x24BE67B00]();
}

uint64_t WiFiManagerClientSetMisPassword()
{
  return MEMORY[0x24BE67B18]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x24BDBCF60]();
}

uint64_t _CTServerConnectionEraseCellularDataUsageRecords()
{
  return MEMORY[0x24BDC28B8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

int __darwin_check_fd_set_overflow(int a1, const void *a2, int a3)
{
  return MEMORY[0x24BDAC7B8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x24BDAC7D8](a1);
  return result;
}

uint64_t j____explicit_bzero_hook()
{
  return __explicit_bzero_hook();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
}

uint64_t __memmove_chk()
{
  return MEMORY[0x24BDAC850]();
}

uint64_t __memset_chk()
{
  return MEMORY[0x24BDAC858]();
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x24BDAC890](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t __strcpy_chk()
{
  return MEMORY[0x24BDAC900]();
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x24BDAC908]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x24BDAC930](*(_QWORD *)&a1);
}

void _exit(int a1)
{
  MEMORY[0x24BDACAC8](*(_QWORD *)&a1);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
  MEMORY[0x24BDAD160](__buf, __nbytes);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x24BDAD200](a1, a2);
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x24BDAD220](__y, __x);
  return result;
}

int atoi(const char *a1)
{
  return MEMORY[0x24BDAD258](a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

long double cbrt(long double __x)
{
  long double result;

  MEMORY[0x24BDAD330](__x);
  return result;
}

uint64_t cced25519_make_key_pair()
{
  return MEMORY[0x24BDAD630]();
}

uint64_t ccrng()
{
  return MEMORY[0x24BDAD758]();
}

uint64_t ccsha512_di()
{
  return MEMORY[0x24BDAD840]();
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x24BEDCE40](cls, name, imp, types);
}

BOOL class_addProtocol(Class cls, Protocol *protocol)
{
  return MEMORY[0x24BEDCE58](cls, protocol);
}

Method *__cdecl class_copyMethodList(Class cls, unsigned int *outCount)
{
  return (Method *)MEMORY[0x24BEDCE70](cls, outCount);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x24BDADA10](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

long double cos(long double __x)
{
  long double result;

  MEMORY[0x24BDADBE0](__x);
  return result;
}

double difftime(time_t a1, time_t a2)
{
  double result;

  MEMORY[0x24BDADC30](a1, a2);
  return result;
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCE0](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCF8](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED8](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFA0](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x24BDAE058](a1, a2);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

uint64_t dyld_get_active_platform()
{
  return MEMORY[0x24BDAE0D0]();
}

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x24BDAE270](__x);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int feof(FILE *a1)
{
  return MEMORY[0x24BDAE328](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x24BDAE330](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x24BDAE350](a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x24BDAE380](a1, *(_QWORD *)&a2, a3);
}

int fileno(FILE *a1)
{
  return MEMORY[0x24BDAE390](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x24BDAE438](*(_QWORD *)&a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x24BDAE440](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE448](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void freeifaddrs(ifaddrs *a1)
{
  MEMORY[0x24BDAE468](a1);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x24BDAE4D8](a1, a2, *(_QWORD *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x24BDAE530](a1);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x24BDAE548](*(_QWORD *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

uint64_t getWFActionsLogObject()
{
  return MEMORY[0x24BEC1D60]();
}

uint64_t getWFBundledIntentsLogObject()
{
  return MEMORY[0x24BEC1D70]();
}

uint64_t getWFFilesLogObject()
{
  return MEMORY[0x24BEC1D98]();
}

uint64_t getWFGeneralLogObject()
{
  return MEMORY[0x24BEC1DA0]();
}

uint64_t getWFIntentExecutionLogObject()
{
  return MEMORY[0x24BEC1DB0]();
}

uint64_t getWFSessionKitLogObject()
{
  return MEMORY[0x24BEC1DC0]();
}

uint64_t getWFWorkflowExecutionLogObject()
{
  return MEMORY[0x24BEC1DE0]();
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

hostent *__cdecl gethostbyname2(const char *a1, int a2)
{
  return (hostent *)MEMORY[0x24BDAE648](a1, *(_QWORD *)&a2);
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x24BDAE660](a1);
}

int getpagesize(void)
{
  return MEMORY[0x24BDAE6B8]();
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x24BDAE6E8]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x24BDAE780](a1, a2);
}

uid_t getuid(void)
{
  return MEMORY[0x24BDAE788]();
}

tm *__cdecl gmtime(const time_t *a1)
{
  return (tm *)MEMORY[0x24BDAE7B0](a1);
}

const char *__cdecl hstrerror(int a1)
{
  return (const char *)MEMORY[0x24BDAE830](*(_QWORD *)&a1);
}

htmlParserCtxtPtr htmlCreatePushParserCtxt(htmlSAXHandlerPtr sax, void *user_data, const char *chunk, int size, const char *filename, xmlCharEncoding enc)
{
  return (htmlParserCtxtPtr)MEMORY[0x24BEDE560](sax, user_data, chunk, *(_QWORD *)&size, filename, *(_QWORD *)&enc);
}

int htmlParseChunk(htmlParserCtxtPtr ctxt, const char *chunk, int size, int terminate)
{
  return MEMORY[0x24BEDE598](ctxt, chunk, *(_QWORD *)&size, *(_QWORD *)&terminate);
}

htmlDocPtr htmlReadMemory(const char *buffer, int size, const char *URL, const char *encoding, int options)
{
  return (htmlDocPtr)MEMORY[0x24BEDE5B0](buffer, *(_QWORD *)&size, URL, encoding, *(_QWORD *)&options);
}

size_t iconv(iconv_t a1, char **a2, size_t *a3, char **a4, size_t *a5)
{
  return MEMORY[0x24BEDBF18](a1, a2, a3, a4, a5);
}

int iconv_close(iconv_t a1)
{
  return MEMORY[0x24BEDBF20](a1);
}

iconv_t iconv_open(const char *a1, const char *a2)
{
  return (iconv_t)MEMORY[0x24BEDBF28](a1, a2);
}

int iconvctl(iconv_t a1, int a2, void *a3)
{
  return MEMORY[0x24BEDBF30](a1, *(_QWORD *)&a2, a3);
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return (char *)MEMORY[0x24BDAE850](*(_QWORD *)&a1, a2);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x24BDAE8B0](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x24BDAE8B8](*(_QWORD *)&a1, a2, a3);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAA8](__x);
  return result;
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAB0](__x);
  return result;
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE70](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x24BDAEEC8](__s, __smax, *(_QWORD *)&__c, __n);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x24BEDCF30](m);
}

SEL method_getName(Method m)
{
  return (SEL)MEMORY[0x24BEDCF38](m);
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return (const char *)MEMORY[0x24BEDCF50](m);
}

time_t mktime(tm *a1)
{
  return MEMORY[0x24BDAEF98](a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x24BDAEFA8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x24BDAEFF0](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x24BDAF150](*(_QWORD *)&val);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x24BEDD070]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

void objc_moveWeak(id *to, id *from)
{
  MEMORY[0x24BEDD0F8](to, from);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3F0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x24BDAF4D0]();
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

int pthread_equal(pthread_t a1, pthread_t a2)
{
  return MEMORY[0x24BDAF828](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x24BDAF910](a1, a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x24BDAF978]();
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x24BDAFA18](__base, __nel, __width, __compar);
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return MEMORY[0x24BDAFAE0](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

void rewind(FILE *a1)
{
  MEMORY[0x24BDAFB98](a1);
}

int select(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  return MEMORY[0x24BDAFC70](*(_QWORD *)&a1, a2, a3, a4, a5);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return MEMORY[0x24BDAFCE8](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x24BDAFD78](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
}

int sigaction(int a1, const sigaction *a2, sigaction *a3)
{
  return MEMORY[0x24BDAFDE8](*(_QWORD *)&a1, a2, a3);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return (void (__cdecl *)(int))MEMORY[0x24BDAFE00](*(_QWORD *)&a1, a2);
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x24BDAFE18](__x);
  return result;
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x24BDAFE50](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFEA0](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x24BDAFED0](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFEE8](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

size_t strcspn(const char *__s, const char *__charset)
{
  return MEMORY[0x24BDAFF08](__s, __charset);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF30](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF38](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x24BDAFF50](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF70](__dst, __src, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF78](__s1, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFFA8](__s, *(_QWORD *)&__c);
}

size_t strspn(const char *__s, const char *__charset)
{
  return MEMORY[0x24BDAFFC0](__s, __charset);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0000](__str, __endptr, *(_QWORD *)&__base);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0010](__str, __endptr, *(_QWORD *)&__base);
}

uint64_t strtonum(const char *__numstr, uint64_t __minval, uint64_t __maxval, const char **__errstrp)
{
  return MEMORY[0x24BDB0020](__numstr, __minval, __maxval, __errstrp);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0030](__str, __endptr, *(_QWORD *)&__base);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x24BEE4BA8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x24BEE4BB0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x24BEE71C8]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x24BEE71D0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x24BEE71D8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x24BEE71E0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x24BEE71E8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x24BEE71F0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x24BEE4C50]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getAtPartialKeyPath()
{
  return MEMORY[0x24BEE4CF0]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x24BEE4ED0]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x24BEE7230]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x24BEE5058]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x24BDB00F8](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

long double tan(long double __x)
{
  long double result;

  MEMORY[0x24BDB0138](__x);
  return result;
}

int tcgetattr(int a1, termios *a2)
{
  return MEMORY[0x24BDB01E0](*(_QWORD *)&a1, a2);
}

int tcsetattr(int a1, int a2, const termios *a3)
{
  return MEMORY[0x24BDB01E8](*(_QWORD *)&a1, *(_QWORD *)&a2, a3);
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

time_t timegm(tm *const a1)
{
  return MEMORY[0x24BDB0248](a1);
}

int timingsafe_bcmp(const void *__b1, const void *__b2, size_t __len)
{
  return MEMORY[0x24BDB0260](__b1, __b2, __len);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x24BDB0358](a1, a2, a3);
}

uint64_t vk_cgImageRemoveBackgroundWithDownsizing()
{
  return MEMORY[0x24BEBFFD0]();
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x24BDB0448](__str, __size, __format, a4);
}

void vsyslog(int a1, const char *a2, __darwin_va_list a3)
{
  MEMORY[0x24BDB0460](*(_QWORD *)&a1, a2, a3);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x24BDB0558](*(_QWORD *)&__fd, __buf, __nbyte);
}

const xmlChar *__cdecl xmlBufferContent(const xmlBuffer *buf)
{
  return (const xmlChar *)MEMORY[0x24BEDE630](buf);
}

xmlBufferPtr xmlBufferCreate(void)
{
  return (xmlBufferPtr)MEMORY[0x24BEDE638]();
}

void xmlBufferFree(xmlBufferPtr buf)
{
  MEMORY[0x24BEDE650](buf);
}

int xmlBufferLength(const xmlBuffer *buf)
{
  return MEMORY[0x24BEDE658](buf);
}

xmlParserCtxtPtr xmlCreatePushParserCtxt(xmlSAXHandlerPtr sax, void *user_data, const char *chunk, int size, const char *filename)
{
  return (xmlParserCtxtPtr)MEMORY[0x24BEDE6B8](sax, user_data, chunk, *(_QWORD *)&size, filename);
}

int xmlCtxtUseOptions(xmlParserCtxtPtr ctxt, int options)
{
  return MEMORY[0x24BEDE6E0](ctxt, *(_QWORD *)&options);
}

xmlNodePtr xmlDocGetRootElement(const xmlDoc *doc)
{
  return (xmlNodePtr)MEMORY[0x24BEDE740](doc);
}

xmlNodePtr xmlDocSetRootElement(xmlDocPtr doc, xmlNodePtr root)
{
  return (xmlNodePtr)MEMORY[0x24BEDE748](doc, root);
}

void xmlFreeDoc(xmlDocPtr cur)
{
  MEMORY[0x24BEDE760](cur);
}

void xmlFreeDtd(xmlDtdPtr cur)
{
  MEMORY[0x24BEDE768](cur);
}

void xmlFreeParserCtxt(xmlParserCtxtPtr ctxt)
{
  MEMORY[0x24BEDE798](ctxt);
}

void xmlFreeTextWriter(xmlTextWriterPtr writer)
{
  MEMORY[0x24BEDE7B0](writer);
}

const char *__cdecl xmlGetCharEncodingName(xmlCharEncoding enc)
{
  return (const char *)MEMORY[0x24BEDE7C8](*(_QWORD *)&enc);
}

xmlExternalEntityLoader xmlGetExternalEntityLoader(void)
{
  return (xmlExternalEntityLoader)MEMORY[0x24BEDE7E0]();
}

xmlErrorPtr xmlGetLastError(void)
{
  return (xmlErrorPtr)MEMORY[0x24BEDE7F8]();
}

uint64_t xmlGetLineNo(const xmlNode *node)
{
  return MEMORY[0x24BEDE800](node);
}

xmlChar *__cdecl xmlGetNsProp(const xmlNode *node, const xmlChar *name, const xmlChar *nameSpace)
{
  return (xmlChar *)MEMORY[0x24BEDE818](node, name, nameSpace);
}

xmlEntityPtr xmlGetPredefinedEntity(const xmlChar *name)
{
  return (xmlEntityPtr)MEMORY[0x24BEDE820](name);
}

xmlChar *__cdecl xmlGetProp(const xmlNode *node, const xmlChar *name)
{
  return (xmlChar *)MEMORY[0x24BEDE828](node, name);
}

void *__cdecl xmlHashLookup(xmlHashTablePtr table, const xmlChar *name)
{
  return (void *)MEMORY[0x24BEDE868](table, name);
}

xmlDtdPtr xmlIOParseDTD(xmlSAXHandlerPtr sax, xmlParserInputBufferPtr input, xmlCharEncoding enc)
{
  return (xmlDtdPtr)MEMORY[0x24BEDE8B8](sax, input, *(_QWORD *)&enc);
}

xmlParserInputPtr xmlNewInputFromFile(xmlParserCtxtPtr ctxt, const char *filename)
{
  return (xmlParserInputPtr)MEMORY[0x24BEDE998](ctxt, filename);
}

xmlTextWriterPtr xmlNewTextWriter(xmlOutputBufferPtr out)
{
  return (xmlTextWriterPtr)MEMORY[0x24BEDE9F8](out);
}

xmlNodePtr xmlNextElementSibling(xmlNodePtr node)
{
  return (xmlNodePtr)MEMORY[0x24BEDEA20](node);
}

int xmlNodeDump(xmlBufferPtr buf, xmlDocPtr doc, xmlNodePtr cur, int level, int format)
{
  return MEMORY[0x24BEDEA38](buf, doc, cur, *(_QWORD *)&level, *(_QWORD *)&format);
}

xmlChar *__cdecl xmlNodeGetContent(const xmlNode *cur)
{
  return (xmlChar *)MEMORY[0x24BEDEA50](cur);
}

xmlOutputBufferPtr xmlOutputBufferCreateIO(xmlOutputWriteCallback iowrite, xmlOutputCloseCallback ioclose, void *ioctx, xmlCharEncodingHandlerPtr encoder)
{
  return (xmlOutputBufferPtr)MEMORY[0x24BEDEA98](iowrite, ioclose, ioctx, encoder);
}

int xmlParseChunk(xmlParserCtxtPtr ctxt, const char *chunk, int size, int terminate)
{
  return MEMORY[0x24BEDEAB0](ctxt, chunk, *(_QWORD *)&size, *(_QWORD *)&terminate);
}

xmlParserInputBufferPtr xmlParserInputBufferCreateFilename(const char *URI, xmlCharEncoding enc)
{
  return (xmlParserInputBufferPtr)MEMORY[0x24BEDEAE0](URI, *(_QWORD *)&enc);
}

xmlDocPtr xmlReadMemory(const char *buffer, int size, const char *URL, const char *encoding, int options)
{
  return (xmlDocPtr)MEMORY[0x24BEDEB00](buffer, *(_QWORD *)&size, URL, encoding, *(_QWORD *)&options);
}

void xmlResetError(xmlErrorPtr err)
{
  MEMORY[0x24BEDEB20](err);
}

void xmlResetLastError(void)
{
  MEMORY[0x24BEDEB28]();
}

void xmlSetExternalEntityLoader(xmlExternalEntityLoader f)
{
  MEMORY[0x24BEDEBF0](f);
}

void xmlStopParser(xmlParserCtxtPtr ctxt)
{
  MEMORY[0x24BEDEC20](ctxt);
}

int xmlTextWriterEndCDATA(xmlTextWriterPtr writer)
{
  return MEMORY[0x24BEDED28](writer);
}

int xmlTextWriterEndDocument(xmlTextWriterPtr writer)
{
  return MEMORY[0x24BEDED38](writer);
}

int xmlTextWriterEndElement(xmlTextWriterPtr writer)
{
  return MEMORY[0x24BEDED40](writer);
}

int xmlTextWriterSetIndent(xmlTextWriterPtr writer, int indent)
{
  return MEMORY[0x24BEDED60](writer, *(_QWORD *)&indent);
}

int xmlTextWriterStartCDATA(xmlTextWriterPtr writer)
{
  return MEMORY[0x24BEDED78](writer);
}

int xmlTextWriterStartDocument(xmlTextWriterPtr writer, const char *version, const char *encoding, const char *standalone)
{
  return MEMORY[0x24BEDED88](writer, version, encoding, standalone);
}

int xmlTextWriterStartElement(xmlTextWriterPtr writer, const xmlChar *name)
{
  return MEMORY[0x24BEDED90](writer, name);
}

int xmlTextWriterWriteAttribute(xmlTextWriterPtr writer, const xmlChar *name, const xmlChar *content)
{
  return MEMORY[0x24BEDEDA8](writer, name, content);
}

int xmlTextWriterWriteCDATA(xmlTextWriterPtr writer, const xmlChar *content)
{
  return MEMORY[0x24BEDEDB8](writer, content);
}

int xmlTextWriterWriteRaw(xmlTextWriterPtr writer, const xmlChar *content)
{
  return MEMORY[0x24BEDEDD0](writer, content);
}

int xmlTextWriterWriteString(xmlTextWriterPtr writer, const xmlChar *content)
{
  return MEMORY[0x24BEDEDD8](writer, content);
}

xmlXPathObjectPtr xmlXPathEvalExpression(const xmlChar *str, xmlXPathContextPtr ctxt)
{
  return (xmlXPathObjectPtr)MEMORY[0x24BEDEED0](str, ctxt);
}

void xmlXPathFreeContext(xmlXPathContextPtr ctxt)
{
  MEMORY[0x24BEDEEE8](ctxt);
}

void xmlXPathFreeObject(xmlXPathObjectPtr obj)
{
  MEMORY[0x24BEDEEF8](obj);
}

xmlXPathContextPtr xmlXPathNewContext(xmlDocPtr doc)
{
  return (xmlXPathContextPtr)MEMORY[0x24BEDEF58](doc);
}

xmlXPathObjectPtr xmlXPathNodeEval(xmlNodePtr node, const xmlChar *str, xmlXPathContextPtr ctx)
{
  return (xmlXPathObjectPtr)MEMORY[0x24BEDEF98](node, str, ctx);
}

int xmlXPathRegisterNs(xmlXPathContextPtr ctxt, const xmlChar *prefix, const xmlChar *ns_uri)
{
  return MEMORY[0x24BEDF038](ctxt, prefix, ns_uri);
}

