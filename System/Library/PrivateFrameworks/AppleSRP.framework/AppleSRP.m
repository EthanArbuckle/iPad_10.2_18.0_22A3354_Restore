char *t_serveropenraw(uint64_t a1, uint64_t a2)
{
  char *v4;
  uint64_t i;
  CC_LONG v6;
  uint64_t v7;
  CC_SHA1_CTX v9;
  unsigned __int8 v10[20];
  unsigned __int8 md[20];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = (char *)malloc_type_malloc(0x668uLL, 0x103004022E4922EuLL);
  if (v4)
  {
    memset(&v9, 0, sizeof(v9));
    *((_QWORD *)v4 + 12) = cstr_new();
    CC_SHA1_Init((CC_SHA1_CTX *)(v4 + 392));
    *(_QWORD *)v4 = *(_QWORD *)(a2 + 8);
    *((_QWORD *)v4 + 1) = v4 + 548;
    __memcpy_chk();
    CC_SHA1_Init(&v9);
    CC_SHA1_Update(&v9, *((const void **)v4 + 1), *(_DWORD *)v4);
    CC_SHA1_Final(md, &v9);
    *((_QWORD *)v4 + 2) = *(_QWORD *)(a2 + 24);
    *((_QWORD *)v4 + 3) = v4 + 804;
    __memcpy_chk();
    CC_SHA1_Init(&v9);
    CC_SHA1_Update(&v9, *((const void **)v4 + 3), *((_DWORD *)v4 + 4));
    CC_SHA1_Final(v10, &v9);
    for (i = 0; i != 20; ++i)
      md[i] ^= v10[i];
    CC_SHA1_Update((CC_SHA1_CTX *)(v4 + 392), md, 0x14u);
    CC_SHA1_Init(&v9);
    v6 = strlen(*(const char **)a1);
    CC_SHA1_Update(&v9, *(const void **)a1, v6);
    CC_SHA1_Final(md, &v9);
    CC_SHA1_Update((CC_SHA1_CTX *)(v4 + 392), md, 0x14u);
    *((_QWORD *)v4 + 4) = *(_QWORD *)(a1 + 8);
    *((_QWORD *)v4 + 5) = v4 + 1060;
    __memcpy_chk();
    v7 = *(_QWORD *)(a1 + 24);
    *((_QWORD *)v4 + 6) = v7;
    *((_QWORD *)v4 + 7) = v4 + 1316;
    __memcpy_chk();
    CC_SHA1_Update((CC_SHA1_CTX *)(v4 + 392), v4 + 1316, v7);
    *((_QWORD *)v4 + 9) = v4 + 1348;
    *((_QWORD *)v4 + 11) = v4 + 1380;
    CC_SHA1_Init((CC_SHA1_CTX *)(v4 + 200));
    CC_SHA1_Init((CC_SHA1_CTX *)(v4 + 104));
    CC_SHA1_Init((CC_SHA1_CTX *)(v4 + 296));
  }
  return v4;
}

void t_servergenexp(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  if ((unint64_t)*a1 >= 0x20)
    v1 = 32;
  else
    v1 = *a1;
  a1[8] = v1;
  t_random(a1[9], v1);
  BigIntegerFromBytes();
  v2 = BigIntegerFromBytes();
  BigIntegerFromBytes();
  v3 = BigIntegerFromInt();
  BigIntegerModExp();
  BigIntegerFromBytes();
  BigIntegerAdd();
  BigIntegerCmp(v3, v2);
}

uint64_t t_serveraddexdata(uint64_t a1, const void *a2, int a3)
{
  return cstr_appendn(*(uint64_t **)(a1 + 96), a2, a3);
}

uint64_t t_servergetkey(uint64_t a1, uint64_t a2)
{
  CC_SHA1_CTX *v4;
  uint8x8_t v5;
  uint64_t v6;
  CC_SHA1_CTX c;
  unsigned __int8 md[20];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  memset(&c, 0, sizeof(c));
  v4 = (CC_SHA1_CTX *)(a1 + 392);
  CC_SHA1_Update((CC_SHA1_CTX *)(a1 + 392), *(const void **)(a2 + 8), *(_DWORD *)a2);
  CC_SHA1_Update(v4, *(const void **)(a1 + 88), *(_DWORD *)(a1 + 80));
  CC_SHA1_Init(&c);
  CC_SHA1_Update(&c, *(const void **)(a1 + 88), *(_DWORD *)(a1 + 80));
  CC_SHA1_Final(md, &c);
  v5.i32[0] = *(_DWORD *)md;
  if (vmovn_s16((int16x8_t)vmovl_u8(v5)).u32[0])
  {
    BigIntegerFromBytes();
    CC_SHA1_Update((CC_SHA1_CTX *)(a1 + 104), *(const void **)(a2 + 8), *(_DWORD *)a2);
    CC_SHA1_Update((CC_SHA1_CTX *)(a1 + 200), *(const void **)(a2 + 8), *(_DWORD *)a2);
    BigIntegerFromBytes();
    BigIntegerFromBytes();
    BigIntegerFromBytes();
    BigIntegerFromBytes();
    BigIntegerFromInt();
    BigIntegerModExp();
    v6 = BigIntegerFromInt();
    BigIntegerModMul();
    BigIntegerFree();
    BigIntegerFree();
    BigIntegerFree();
    BigIntegerFree();
    BigIntegerCmpInt(v6, 1);
  }
  return 0;
}

uint64_t t_serververify(uint64_t a1, uint64_t a2)
{
  unint64_t v6;
  unint64_t v7;
  unsigned __int8 *v9;
  CC_SHA1_CTX *v10;
  unsigned __int8 md[8];
  unint64_t v12;
  unsigned int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  CC_SHA1_Final(md, (CC_SHA1_CTX *)(a1 + 296));
  if (*(_QWORD *)md == *(_QWORD *)a2
    && v12 == *(_QWORD *)(a2 + 8)
    && v13 == (unint64_t)*(unsigned int *)(a2 + 16))
  {
    v9 = (unsigned __int8 *)(a1 + 528);
    v10 = (CC_SHA1_CTX *)(a1 + 104);
    goto LABEL_16;
  }
  CC_SHA1_Final(md, (CC_SHA1_CTX *)(a1 + 392));
  v6 = bswap64(*(unint64_t *)md);
  v7 = bswap64(*(_QWORD *)a2);
  if (v6 == v7)
  {
    v6 = bswap64(v12);
    v7 = bswap64(*(_QWORD *)(a2 + 8));
    if (v6 == v7)
    {
      v6 = bswap32(v13);
      v7 = bswap32(*(_DWORD *)(a2 + 16));
      if (v6 == v7)
      {
        CC_SHA1_Update((CC_SHA1_CTX *)(a1 + 200), md, 0x14u);
        CC_SHA1_Update((CC_SHA1_CTX *)(a1 + 200), (const void *)(a1 + 488), 0x28u);
        v9 = (unsigned __int8 *)(a1 + 528);
        v10 = (CC_SHA1_CTX *)(a1 + 200);
LABEL_16:
        CC_SHA1_Final(v9, v10);
        return 0;
      }
    }
  }
  if (v6 < v7)
    return 0xFFFFFFFFLL;
  else
    return 1;
}

uint64_t t_serverresponse(uint64_t a1)
{
  return a1 + 528;
}

void t_serverclose(uint64_t a1)
{
  *(_OWORD *)(a1 + 1348) = 0u;
  *(_OWORD *)(a1 + 1364) = 0u;
  *(_OWORD *)(a1 + 1060) = 0u;
  *(_OWORD *)(a1 + 1076) = 0u;
  *(_OWORD *)(a1 + 1092) = 0u;
  *(_OWORD *)(a1 + 1108) = 0u;
  *(_OWORD *)(a1 + 1124) = 0u;
  *(_OWORD *)(a1 + 1140) = 0u;
  *(_OWORD *)(a1 + 1156) = 0u;
  *(_OWORD *)(a1 + 1172) = 0u;
  *(_OWORD *)(a1 + 1188) = 0u;
  *(_OWORD *)(a1 + 1204) = 0u;
  *(_OWORD *)(a1 + 1220) = 0u;
  *(_OWORD *)(a1 + 1236) = 0u;
  *(_OWORD *)(a1 + 1252) = 0u;
  *(_OWORD *)(a1 + 1268) = 0u;
  *(_OWORD *)(a1 + 1284) = 0u;
  *(_OWORD *)(a1 + 1300) = 0u;
  *(_OWORD *)(a1 + 1316) = 0u;
  *(_OWORD *)(a1 + 1332) = 0u;
  *(_QWORD *)(a1 + 520) = 0;
  *(_OWORD *)(a1 + 488) = 0u;
  *(_OWORD *)(a1 + 504) = 0u;
  cstr_clear_free(*(_DWORD **)(a1 + 96));
  free((void *)a1);
}

_QWORD *cstr_new_alloc()
{
  _QWORD *result;

  result = malloc_type_malloc(0x28uLL, 0x103004021F519B8uLL);
  if (result)
  {
    result[1] = 0;
    result[2] = 0;
    *result = &cstr_empty_string;
    *((_DWORD *)result + 6) = 1;
    result[4] = 0;
  }
  return result;
}

_QWORD *cstr_new()
{
  _QWORD *result;

  result = malloc_type_malloc(0x28uLL, 0x103004021F519B8uLL);
  if (result)
  {
    result[1] = 0;
    result[2] = 0;
    *result = &cstr_empty_string;
    *((_DWORD *)result + 6) = 1;
    result[4] = 0;
  }
  return result;
}

_QWORD *cstr_dup_alloc(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;

  v2 = malloc_type_malloc(0x28uLL, 0x103004021F519B8uLL);
  v3 = v2;
  if (v2)
  {
    v2[1] = 0;
    v2[2] = 0;
    *v2 = &cstr_empty_string;
    *((_DWORD *)v2 + 6) = 1;
    v2[4] = 0;
    cstr_setn((uint64_t)v2, *(const void **)a1, *(_QWORD *)(a1 + 8));
  }
  return v3;
}

uint64_t cstr_setn(uint64_t a1, const void *a2, size_t a3)
{
  if ((cstr_alloc(a1, a3 + 1) & 0x80000000) != 0)
    return 0xFFFFFFFFLL;
  *(_BYTE *)(*(_QWORD *)a1 + a3) = 0;
  if (a2)
  {
    if (a3)
      memmove(*(void **)a1, a2, a3);
  }
  *(_QWORD *)(a1 + 8) = a3;
  return 1;
}

_QWORD *cstr_create(const char *a1)
{
  int v2;

  v2 = strlen(a1);
  return cstr_createn(a1, v2);
}

_QWORD *cstr_createn(const void *a1, int a2)
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = malloc_type_malloc(0x28uLL, 0x103004021F519B8uLL);
  v5 = v4;
  if (v4)
  {
    v4[1] = 0;
    v4[2] = 0;
    *v4 = &cstr_empty_string;
    *((_DWORD *)v4 + 6) = 1;
    v4[4] = 0;
    cstr_setn((uint64_t)v4, a1, a2);
  }
  return v5;
}

uint64_t cstr_use(uint64_t result)
{
  ++*(_DWORD *)(result + 24);
  return result;
}

void cstr_clear_free(_DWORD *a1)
{
  int v1;
  size_t v3;

  v1 = a1[6] - 1;
  a1[6] = v1;
  if (!v1)
  {
    v3 = *((_QWORD *)a1 + 2);
    if (v3)
    {
      bzero(*(void **)a1, v3);
      free(*(void **)a1);
    }
    free(a1);
  }
}

void cstr_free(_DWORD *a1)
{
  int v1;

  v1 = a1[6] - 1;
  a1[6] = v1;
  if (!v1)
  {
    if (*((_QWORD *)a1 + 2))
      free(*(void **)a1);
    free(a1);
  }
}

void cstr_empty(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 16))
    free(*(void **)a1);
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = &cstr_empty_string;
}

uint64_t cstr_copy(uint64_t a1, uint64_t a2)
{
  return cstr_setn(a1, *(const void **)a2, *(_QWORD *)(a2 + 8));
}

uint64_t cstr_set(uint64_t a1, char *__s)
{
  size_t v4;

  v4 = (int)strlen(__s);
  return cstr_setn(a1, __s, v4);
}

uint64_t cstr_alloc(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  unint64_t v4;
  size_t v5;
  _BYTE *v6;
  _BYTE *v7;
  size_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= a2)
    return 0;
  v4 = 2 * v2;
  if (v4 <= a2)
    v4 = a2;
  if (v4 <= 4)
    v5 = 4;
  else
    v5 = v4;
  v6 = malloc_type_malloc(v5, 0x100004077774924uLL);
  if (!v6)
    return 0xFFFFFFFFLL;
  v7 = v6;
  if (*(_QWORD *)a1)
  {
    v6[*(_QWORD *)(a1 + 8)] = 0;
    if (*(_QWORD *)(a1 + 16))
    {
      v8 = *(_QWORD *)(a1 + 8);
      if (v8)
        memcpy(v6, *(const void **)a1, v8);
      free(*(void **)a1);
    }
  }
  *(_QWORD *)a1 = v7;
  *(_QWORD *)(a1 + 16) = v5;
  return 1;
}

uint64_t cstr_set_length(_QWORD *a1, int a2)
{
  uint64_t v3;
  unint64_t v4;

  v3 = a2;
  v4 = a1[1];
  if (v4 > a2)
  {
    *(_BYTE *)(*a1 + a2) = 0;
LABEL_6:
    a1[1] = v3;
    return 1;
  }
  if (v4 >= a2)
    return 0;
  if ((cstr_alloc((uint64_t)a1, a2 + 1) & 0x80000000) == 0)
  {
    bzero((void *)(*a1 + a1[1]), v3 - a1[1] + 1);
    goto LABEL_6;
  }
  return 0xFFFFFFFFLL;
}

uint64_t cstr_append(uint64_t *a1, char *__s)
{
  size_t v4;

  v4 = (int)strlen(__s);
  return cstr_appendn(a1, __s, v4);
}

uint64_t cstr_appendn(uint64_t *a1, const void *a2, size_t a3)
{
  uint64_t v6;
  size_t v7;

  if ((cstr_alloc((uint64_t)a1, a3 + a1[1] + 1) & 0x80000000) != 0)
    return 0xFFFFFFFFLL;
  memcpy((void *)(*a1 + a1[1]), a2, a3);
  v6 = *a1;
  v7 = a1[1] + a3;
  a1[1] = v7;
  *(_BYTE *)(v6 + v7) = 0;
  return 1;
}

uint64_t cstr_append_str(uint64_t *a1, uint64_t a2)
{
  return cstr_appendn(a1, *(const void **)a2, *(_QWORD *)(a2 + 8));
}

uint64_t SRP_initialize_library()
{
  if ((library_initialized & 1) == 0)
  {
    BigIntegerCtxFree();
    library_initialized = 1;
  }
  return 0;
}

uint64_t SRP_finalize_library()
{
  if (library_initialized == 1)
  {
    library_initialized = 0;
    BigIntegerCtxFree();
  }
  return 0;
}

uint64_t SRP_set_modulus_min_bits(int a1)
{
  srp_modulus_min_bits = a1;
  return 0;
}

uint64_t SRP_get_modulus_min_bits()
{
  return srp_modulus_min_bits;
}

uint64_t SRP_set_secret_bits_cb(uint64_t (*a1)())
{
  srp_sb_cb = a1;
  return 0;
}

uint64_t SRP_get_secret_bits()
{
  return srp_sb_cb();
}

void *SRP_SERVER_LOOKUP_new(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  unsigned int (*v4)(_QWORD *);

  v2 = malloc_type_malloc(0x10uLL, 0xA0040AFF93C70uLL);
  v3 = v2;
  if (v2)
  {
    *v2 = a1;
    v2[1] = 0;
    v4 = *(unsigned int (**)(_QWORD *))(a1 + 8);
    if (v4)
    {
      if (v4(v2))
      {
        free(v3);
        return 0;
      }
    }
  }
  return v3;
}

uint64_t SRP_SERVER_LOOKUP_free(void *a1)
{
  void (*v2)(void *);

  v2 = *(void (**)(void *))(*(_QWORD *)a1 + 16);
  if (v2)
    v2(a1);
  free(a1);
  return 0;
}

uint64_t SRP_SERVER_do_lookup(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 24))(a1);
}

_QWORD *SRP_new(uint64_t a1)
{
  _DWORD *v2;
  _QWORD *v3;
  unsigned int (*v4)(_QWORD *);

  v2 = malloc_type_malloc(0x90uLL, 0x10A004039E137EAuLL);
  v3 = v2;
  if (v2)
  {
    v2[1] = 0;
    *((_QWORD *)v2 + 1) = cstr_new();
    v3[14] = BigIntegerCtxNew();
    v3[15] = 0;
    *((_OWORD *)v3 + 1) = 0u;
    *((_OWORD *)v3 + 2) = 0u;
    *((_OWORD *)v3 + 3) = 0u;
    *((_OWORD *)v3 + 4) = 0u;
    v3[10] = 0;
    v3[11] = cstr_new();
    v3[12] = a1;
    v3[13] = 0;
    v3[16] = 0;
    v3[17] = 0;
    v4 = *(unsigned int (**)(_QWORD *))(a1 + 8);
    if (v4)
    {
      if (v4(v3))
      {
        free(v3);
        return 0;
      }
    }
  }
  return v3;
}

uint64_t SRP_free(_QWORD *a1)
{
  void (*v2)(_QWORD *);
  _DWORD *v3;
  _DWORD *v4;
  _DWORD *v5;

  v2 = *(void (**)(_QWORD *))(a1[12] + 16);
  if (v2)
    v2(a1);
  v3 = (_DWORD *)a1[1];
  if (v3)
    cstr_clear_free(v3);
  if (a1[2])
    BigIntegerFree();
  if (a1[15])
    BigIntegerCtxFree();
  if (a1[3])
    BigIntegerFree();
  v4 = (_DWORD *)a1[4];
  if (v4)
    cstr_clear_free(v4);
  if (a1[5])
    BigIntegerClearFree();
  if (a1[6])
    BigIntegerClearFree();
  if (a1[7])
    BigIntegerFree();
  if (a1[8])
    BigIntegerClearFree();
  if (a1[9])
    BigIntegerFree();
  if (a1[10])
    BigIntegerClearFree();
  if (a1[14])
    BigIntegerCtxFree();
  v5 = (_DWORD *)a1[11];
  if (v5)
    cstr_clear_free(v5);
  free(a1);
  return 0;
}

uint64_t SRP_set_server_lookup(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(a1 + 136) = a2;
  return 0;
}

uint64_t SRP_set_client_param_verify_cb(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(a1 + 128) = a2;
  return 0;
}

uint64_t SRP_set_username(uint64_t a1, char *a2)
{
  uint64_t result;

  cstr_set(*(_QWORD *)(a1 + 8), a2);
  result = *(_QWORD *)(a1 + 136);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)result + 24))(result, a1, *(_QWORD *)(a1 + 8));
  return result;
}

uint64_t SRP_set_user_raw(uint64_t a1, const void *a2, int a3)
{
  uint64_t result;

  cstr_setn(*(_QWORD *)(a1 + 8), a2, a3);
  result = *(_QWORD *)(a1 + 136);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)result + 24))(result, a1, *(_QWORD *)(a1 + 8));
  return result;
}

uint64_t SRP_set_params(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, const void *a6, uint64_t a7)
{
  uint64_t result;
  _QWORD *v15;
  uint64_t (*v16)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  result = 0xFFFFFFFFLL;
  if (a2 && a4 && a6)
  {
    *(_QWORD *)(a1 + 16) = BigIntegerFromBytes();
    if ((*(_BYTE *)(a1 + 4) & 1) != 0)
      *(_QWORD *)(a1 + 120) = BigIntegerCtxNew();
    *(_QWORD *)(a1 + 24) = BigIntegerFromBytes();
    v15 = *(_QWORD **)(a1 + 32);
    if (!v15)
    {
      v15 = cstr_new();
      *(_QWORD *)(a1 + 32) = v15;
    }
    cstr_setn((uint64_t)v15, a6, (int)a7);
    if ((int)BigIntegerBitLen(*(_QWORD *)(a1 + 16)) >= srp_modulus_min_bits)
    {
      v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 128);
      if (!v16)
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, const void *, uint64_t))(*(_QWORD *)(a1 + 96) + 24))(a1, a2, a3, a4, a5, a6, a7);
      result = v16(a1, a2, a3, a4, a5);
      if (!(_DWORD)result)
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, const void *, uint64_t))(*(_QWORD *)(a1 + 96) + 24))(a1, a2, a3, a4, a5, a6, a7);
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t SRP_set_authenticator(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 96) + 32))();
}

uint64_t SRP_set_auth_password(uint64_t a1, char *__s)
{
  size_t v4;
  uint64_t (*v6)(uint64_t, char *, size_t);

  v6 = *(uint64_t (**)(uint64_t, char *, size_t))(*(_QWORD *)(a1 + 96) + 40);
  v4 = strlen(__s);
  return v6(a1, __s, v4);
}

uint64_t SRP_set_auth_password_raw(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 96) + 40))();
}

uint64_t SRP_gen_pub(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 96) + 48))();
}

uint64_t SRP_add_ex_data(uint64_t a1, const void *a2, int a3)
{
  cstr_appendn(*(uint64_t **)(a1 + 88), a2, a3);
  return 0;
}

uint64_t SRP_compute_key(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 96) + 56))();
}

uint64_t SRP_verify(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 96) + 64))();
}

uint64_t SRP_respond(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 96) + 72))();
}

uint64_t SRP_CLIENT_builtin_param_verify_cb()
{
  return 0xFFFFFFFFLL;
}

uint64_t SRP_CLIENT_default_param_verify_cb()
{
  return 0xFFFFFFFFLL;
}

uint64_t SRP_use_engine()
{
  if (BigIntegerUseEngine())
    return 0xFFFFFFFFLL;
  else
    return 0;
}

char **SRP6a_client_method()
{
  return &srp6a_client_meth;
}

uint64_t srp6a_client_init(_QWORD *a1)
{
  CC_SHA1_CTX *v2;

  *a1 = 0x30000000CLL;
  v2 = (CC_SHA1_CTX *)malloc_type_malloc(0xE8uLL, 0x10000403E2B8178uLL);
  a1[13] = v2;
  CC_SHA1_Init(v2);
  CC_SHA1_Init((CC_SHA1_CTX *)(a1[13] + 96));
  return 0;
}

uint64_t srp6_client_finish(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 104);
  if (v1)
  {
    *(_QWORD *)(v1 + 224) = 0;
    *(_OWORD *)(v1 + 192) = 0u;
    *(_OWORD *)(v1 + 208) = 0u;
    *(_OWORD *)(v1 + 160) = 0u;
    *(_OWORD *)(v1 + 176) = 0u;
    *(_OWORD *)(v1 + 128) = 0u;
    *(_OWORD *)(v1 + 144) = 0u;
    *(_OWORD *)(v1 + 96) = 0u;
    *(_OWORD *)(v1 + 112) = 0u;
    *(_OWORD *)(v1 + 64) = 0u;
    *(_OWORD *)(v1 + 80) = 0u;
    *(_OWORD *)(v1 + 32) = 0u;
    *(_OWORD *)(v1 + 48) = 0u;
    *(_OWORD *)v1 = 0u;
    *(_OWORD *)(v1 + 16) = 0u;
    free(*(void **)(a1 + 104));
  }
  return 0;
}

uint64_t srp6_client_params(uint64_t a1, const void *a2, CC_LONG a3, const void *a4, CC_LONG a5, const void *a6, CC_LONG a7)
{
  uint64_t i;
  CC_SHA1_CTX v16;
  unsigned __int8 v17[20];
  unsigned __int8 md[20];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  memset(&v16, 0, sizeof(v16));
  CC_SHA1_Init(&v16);
  CC_SHA1_Update(&v16, a2, a3);
  CC_SHA1_Final(md, &v16);
  CC_SHA1_Init(&v16);
  CC_SHA1_Update(&v16, a4, a5);
  CC_SHA1_Final(v17, &v16);
  for (i = 0; i != 20; ++i)
    md[i] ^= v17[i];
  CC_SHA1_Update(*(CC_SHA1_CTX **)(a1 + 104), md, 0x14u);
  CC_SHA1_Init(&v16);
  CC_SHA1_Update(&v16, **(const void ***)(a1 + 8), *(_DWORD *)(*(_QWORD *)(a1 + 8) + 8));
  CC_SHA1_Final(md, &v16);
  CC_SHA1_Update(*(CC_SHA1_CTX **)(a1 + 104), md, 0x14u);
  CC_SHA1_Update(*(CC_SHA1_CTX **)(a1 + 104), a6, a7);
  return 0;
}

uint64_t srp6_client_auth(uint64_t a1)
{
  *(_QWORD *)(a1 + 48) = BigIntegerFromBytes();
  *(_QWORD *)(a1 + 40) = BigIntegerFromInt();
  BigIntegerModExp();
  return 0;
}

uint64_t srp6_client_passwd(uint64_t a1, const void *a2, CC_LONG a3)
{
  CC_SHA1_CTX v7;
  unsigned __int8 md[20];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  memset(&v7, 0, sizeof(v7));
  CC_SHA1_Init(&v7);
  CC_SHA1_Update(&v7, **(const void ***)(a1 + 8), *(_DWORD *)(*(_QWORD *)(a1 + 8) + 8));
  CC_SHA1_Update(&v7, ":", 1u);
  CC_SHA1_Update(&v7, a2, a3);
  CC_SHA1_Final(md, &v7);
  CC_SHA1_Init(&v7);
  CC_SHA1_Update(&v7, **(const void ***)(a1 + 32), *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8));
  CC_SHA1_Update(&v7, md, 0x14u);
  CC_SHA1_Final(md, &v7);
  memset(&v7, 0, sizeof(v7));
  return SRP_set_authenticator(a1);
}

uint64_t srp6_client_genpub(uint64_t a1, _QWORD **a2)
{
  int secret_bits;
  int v5;
  int v6;
  _QWORD *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;

  BigIntegerBitLen(*(_QWORD *)(a1 + 16));
  secret_bits = SRP_get_secret_bits();
  v5 = secret_bits + 7;
  if (secret_bits < -7)
    v5 = secret_bits + 14;
  v6 = v5 >> 3;
  if (a2)
  {
    v7 = *a2;
    if (!*a2)
    {
      v7 = cstr_new();
      *a2 = v7;
    }
  }
  else
  {
    v7 = cstr_new();
  }
  v8 = BigIntegerBitLen(*(_QWORD *)(a1 + 16));
  v9 = v8 + 7;
  if (v8 < -7)
    v9 = v8 + 14;
  if (v6 > v9 >> 3)
  {
    v10 = BigIntegerBitLen(*(_QWORD *)(a1 + 16));
    v11 = v10 + 7;
    if (v10 < -7)
      v11 = v10 + 14;
    v6 = v11 >> 3;
  }
  v12 = BigIntegerBitLen(*(_QWORD *)(a1 + 16));
  v13 = v12 + 7;
  if (v12 < -7)
    v13 = v12 + 14;
  cstr_set_length(v7, v13 >> 3);
  t_random(*v7, v6);
  *(_QWORD *)(a1 + 64) = BigIntegerFromBytes();
  BigIntegerBitLen(*(_QWORD *)(a1 + 16));
  BigIntegerAddInt();
  *(_QWORD *)(a1 + 56) = BigIntegerFromInt();
  BigIntegerModExp();
  BigIntegerToCstr(*(_QWORD *)(a1 + 56), v7);
  CC_SHA1_Update(*(CC_SHA1_CTX **)(a1 + 104), (const void *)*v7, *((_DWORD *)v7 + 2));
  CC_SHA1_Update((CC_SHA1_CTX *)(*(_QWORD *)(a1 + 104) + 96), (const void *)*v7, *((_DWORD *)v7 + 2));
  if (!a2)
    cstr_clear_free(v7);
  return 0;
}

void srp6a_client_key(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  CC_SHA1_CTX v5[2];
  unsigned __int8 md[40];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  memset(v5, 0, 96);
  CC_SHA1_Init(v5);
  v2 = cstr_new();
  BigIntegerToCstr(*(_QWORD *)(a1 + 16), v2);
  CC_SHA1_Update(v5, (const void *)*v2, *((_DWORD *)v2 + 2));
  v3 = *(_QWORD *)(a1 + 24);
  if ((*(_BYTE *)(a1 + 4) & 2) != 0)
    BigIntegerToCstrEx(v3, (const void **)v2, v2[1]);
  else
    BigIntegerToCstr(v3, v2);
  CC_SHA1_Update(v5, (const void *)*v2, *((_DWORD *)v2 + 2));
  CC_SHA1_Final(md, v5);
  cstr_free(v2);
  v4 = BigIntegerFromBytes();
  BigIntegerCmpInt(v4, 0);
}

uint64_t sub_20A044C44(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, CC_SHA1_CTX *c, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t ca,uint64_t c_8,uint64_t c_16,uint64_t c_24,uint64_t c_32,uint64_t c_40,uint64_t c_48,uint64_t c_56,uint64_t c_64,uint64_t c_72,uint64_t c_80)
{
  uint64_t v31;
  signed int v32;
  const void *v33;
  uint64_t v34;
  int v35;
  int v36;
  int v37;
  _QWORD *v38;
  uint64_t v39;
  int v40;
  size_t v41;
  const void *v42;
  CC_LONG v43;
  uint64_t v44;
  CC_SHA1_CTX v46[2];

  if (a1)
  {
    v35 = BigIntegerBitLen(*(_QWORD *)(v31 + 16));
    v36 = v35 + 7;
    if (v35 < -7)
      v36 = v35 + 14;
    v37 = v36 >> 3;
    if (v36 >> 3 >= v32)
    {
      memset(v46, 0, 96);
      CC_SHA1_Init(v46);
      v38 = cstr_new();
      v39 = *(_QWORD *)(v31 + 56);
      if ((*(_BYTE *)(v31 + 4) & 2) != 0)
      {
        BigIntegerToCstrEx(v39, (const void **)v38, v37);
        CC_SHA1_Update(v46, (const void *)*v38, *((_DWORD *)v38 + 2));
        v40 = v37 - v32;
        if (v37 > v32)
        {
          v41 = v40;
          memcpy((void *)(*v38 + v40), v33, v32);
          bzero((void *)*v38, v41);
          v42 = (const void *)*v38;
          v43 = v37;
          goto LABEL_10;
        }
      }
      else
      {
        BigIntegerToCstr(v39, v38);
        CC_SHA1_Update(v46, (const void *)*v38, *((_DWORD *)v38 + 2));
      }
      v42 = v33;
      v43 = v32;
LABEL_10:
      CC_SHA1_Update(v46, v42, v43);
      CC_SHA1_Final((unsigned __int8 *)(v34 - 108), v46);
      *(_QWORD *)(v31 + 72) = BigIntegerFromBytes();
      CC_SHA1_Update(*(CC_SHA1_CTX **)(v31 + 104), v33, v32);
      v44 = BigIntegerFromBytes();
      BigIntegerCmp(v44, *(_QWORD *)(v31 + 16));
    }
  }
  BigIntegerClearFree();
  return 0xFFFFFFFFLL;
}

uint64_t srp6_client_verify(uint64_t a1, uint64_t a2, int a3)
{
  BOOL v5;
  BOOL v6;
  unsigned __int8 md[8];
  uint64_t v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  CC_SHA1_Final(md, (CC_SHA1_CTX *)(*(_QWORD *)(a1 + 104) + 96));
  if (a3 == 20
    && (*(_QWORD *)md == *(_QWORD *)a2 ? (v5 = v9 == *(_QWORD *)(a2 + 8)) : (v5 = 0),
        v5 ? (v6 = v10 == (unint64_t)*(unsigned int *)(a2 + 16)) : (v6 = 0),
        v6))
  {
    return 0;
  }
  else
  {
    return 0xFFFFFFFFLL;
  }
}

uint64_t srp6_client_respond(uint64_t a1, unsigned __int8 ***a2)
{
  unsigned __int8 **v4;

  if (!a2)
    return 0xFFFFFFFFLL;
  v4 = *a2;
  if (!*a2)
  {
    v4 = (unsigned __int8 **)cstr_new();
    *a2 = v4;
  }
  cstr_set_length(v4, 20);
  CC_SHA1_Final(**a2, *(CC_SHA1_CTX **)(a1 + 104));
  CC_SHA1_Update((CC_SHA1_CTX *)(*(_QWORD *)(a1 + 104) + 96), **a2, *((_DWORD *)*a2 + 2));
  CC_SHA1_Update((CC_SHA1_CTX *)(*(_QWORD *)(a1 + 104) + 96), (const void *)(*(_QWORD *)(a1 + 104) + 192), 0x28u);
  return 0;
}

char **SRP6_server_method()
{
  return &srp6_server_meth;
}

char **SRP6a_server_method()
{
  return &srp6a_server_meth;
}

uint64_t srp6_server_init(_QWORD *a1)
{
  CC_SHA1_CTX *v2;

  *a1 = 0x10000001CLL;
  v2 = (CC_SHA1_CTX *)malloc_type_malloc(0x1BCuLL, 0x1000040E79818FDuLL);
  a1[13] = v2;
  CC_SHA1_Init(v2);
  CC_SHA1_Init((CC_SHA1_CTX *)(a1[13] + 96));
  CC_SHA1_Init((CC_SHA1_CTX *)(a1[13] + 192));
  CC_SHA1_Init((CC_SHA1_CTX *)(a1[13] + 288));
  return 0;
}

uint64_t srp6_server_finish(uint64_t a1)
{
  _OWORD *v1;

  v1 = *(_OWORD **)(a1 + 104);
  if (v1)
  {
    v1[25] = 0u;
    v1[26] = 0u;
    v1[23] = 0u;
    v1[24] = 0u;
    v1[21] = 0u;
    v1[22] = 0u;
    v1[19] = 0u;
    v1[20] = 0u;
    v1[17] = 0u;
    v1[18] = 0u;
    v1[15] = 0u;
    v1[16] = 0u;
    v1[13] = 0u;
    v1[14] = 0u;
    v1[11] = 0u;
    v1[12] = 0u;
    v1[9] = 0u;
    v1[10] = 0u;
    v1[7] = 0u;
    v1[8] = 0u;
    v1[5] = 0u;
    v1[6] = 0u;
    v1[3] = 0u;
    v1[4] = 0u;
    v1[1] = 0u;
    v1[2] = 0u;
    *v1 = 0u;
    *(_OWORD *)((char *)v1 + 428) = 0u;
    free(*(void **)(a1 + 104));
  }
  return 0;
}

uint64_t srp6_server_params(uint64_t a1, const void *a2, CC_LONG a3, const void *a4, CC_LONG a5, const void *a6, CC_LONG a7)
{
  uint64_t i;
  CC_SHA1_CTX v16;
  unsigned __int8 v17[20];
  unsigned __int8 md[20];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  memset(&v16, 0, sizeof(v16));
  CC_SHA1_Init(&v16);
  CC_SHA1_Update(&v16, a2, a3);
  CC_SHA1_Final(md, &v16);
  CC_SHA1_Init(&v16);
  CC_SHA1_Update(&v16, a4, a5);
  CC_SHA1_Final(v17, &v16);
  for (i = 0; i != 20; ++i)
    md[i] ^= v17[i];
  CC_SHA1_Update((CC_SHA1_CTX *)(*(_QWORD *)(a1 + 104) + 96), md, 0x14u);
  CC_SHA1_Init(&v16);
  CC_SHA1_Update(&v16, **(const void ***)(a1 + 8), *(_DWORD *)(*(_QWORD *)(a1 + 8) + 8));
  CC_SHA1_Final(md, &v16);
  CC_SHA1_Update((CC_SHA1_CTX *)(*(_QWORD *)(a1 + 104) + 96), md, 0x14u);
  CC_SHA1_Update((CC_SHA1_CTX *)(*(_QWORD *)(a1 + 104) + 96), a6, a7);
  return 0;
}

uint64_t srp6_server_auth(uint64_t a1)
{
  *(_QWORD *)(a1 + 40) = BigIntegerFromBytes();
  return 0;
}

uint64_t srp6_server_passwd(uint64_t a1, const void *a2, CC_LONG a3)
{
  CC_SHA1_CTX v7;
  unsigned __int8 md[8];
  uint64_t v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  memset(&v7, 0, sizeof(v7));
  CC_SHA1_Init(&v7);
  CC_SHA1_Update(&v7, **(const void ***)(a1 + 8), *(_DWORD *)(*(_QWORD *)(a1 + 8) + 8));
  CC_SHA1_Update(&v7, ":", 1u);
  CC_SHA1_Update(&v7, a2, a3);
  CC_SHA1_Final(md, &v7);
  CC_SHA1_Init(&v7);
  CC_SHA1_Update(&v7, **(const void ***)(a1 + 32), *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8));
  CC_SHA1_Update(&v7, md, 0x14u);
  CC_SHA1_Final(md, &v7);
  memset(&v7, 0, sizeof(v7));
  *(_QWORD *)(a1 + 48) = BigIntegerFromBytes();
  *(_QWORD *)md = 0;
  v9 = 0;
  v10 = 0;
  *(_QWORD *)(a1 + 40) = BigIntegerFromInt();
  BigIntegerModExp();
  return 0;
}

uint64_t srp6_server_genpub(_QWORD *a1, _QWORD **a2)
{
  BigIntegerFromInt();
  srp6_server_genpub_ex(a1, a2);
  BigIntegerClearFree();
  return 0;
}

uint64_t srp6_server_key(uint64_t a1, uint64_t a2, const void *a3, signed int a4)
{
  int v7;
  int v8;
  int v9;
  _QWORD *v10;
  int v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  CC_SHA1_CTX v16;
  unsigned __int8 md[20];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = BigIntegerBitLen(*(_QWORD *)(a1 + 16));
  v8 = v7 + 7;
  if (v7 < -7)
    v8 = v7 + 14;
  v9 = v8 >> 3;
  if (v8 >> 3 >= a4)
  {
    memset(&v16, 0, sizeof(v16));
    CC_SHA1_Update((CC_SHA1_CTX *)(*(_QWORD *)(a1 + 104) + 96), a3, a4);
    v10 = cstr_new();
    BigIntegerToCstr(*(_QWORD *)(a1 + 56), v10);
    CC_SHA1_Update((CC_SHA1_CTX *)(*(_QWORD *)(a1 + 104) + 96), (const void *)*v10, *((_DWORD *)v10 + 2));
    CC_SHA1_Update(*(CC_SHA1_CTX **)(a1 + 104), a3, a4);
    CC_SHA1_Update((CC_SHA1_CTX *)(*(_QWORD *)(a1 + 104) + 192), a3, a4);
    CC_SHA1_Init(&v16);
    if ((*(_BYTE *)(a1 + 4) & 2) == 0)
    {
      CC_SHA1_Update(&v16, a3, a4);
      goto LABEL_11;
    }
    v11 = v9 - a4;
    if (v9 <= a4)
    {
      CC_SHA1_Update(&v16, a3, a4);
      if (v10[1] >= (unint64_t)v9)
        goto LABEL_11;
      v13 = v9;
      v12 = *(_QWORD *)(a1 + 56);
    }
    else
    {
      cstr_set_length(v10, v9);
      memcpy((void *)(*v10 + v11), a3, a4);
      bzero((void *)*v10, v11);
      CC_SHA1_Update(&v16, (const void *)*v10, v9);
      v12 = *(_QWORD *)(a1 + 56);
      v13 = v9;
    }
    BigIntegerToCstrEx(v12, (const void **)v10, v13);
LABEL_11:
    CC_SHA1_Update(&v16, (const void *)*v10, *((_DWORD *)v10 + 2));
    CC_SHA1_Final(md, &v16);
    *(_QWORD *)(a1 + 72) = BigIntegerFromBytes();
    BigIntegerFromInt();
    BigIntegerModExp();
    BigIntegerFromBytes();
    v14 = BigIntegerFromInt();
    BigIntegerModMul();
    BigIntegerFree();
    BigIntegerCmpInt(v14, 1);
  }
  return 0xFFFFFFFFLL;
}

uint64_t srp6_server_verify(uint64_t a1, uint64_t a2, int a3)
{
  BOOL v7;
  CC_SHA1_CTX *v8;
  CC_SHA1_CTX *v11;
  unsigned __int8 *v12;
  unsigned __int8 md[8];
  uint64_t v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  CC_SHA1_Final(md, (CC_SHA1_CTX *)(*(_QWORD *)(a1 + 104) + 288));
  if (a3 != 20)
  {
    CC_SHA1_Final(md, (CC_SHA1_CTX *)(*(_QWORD *)(a1 + 104) + 96));
    return 0xFFFFFFFFLL;
  }
  v7 = *(_QWORD *)md == *(_QWORD *)a2
    && v15 == *(_QWORD *)(a2 + 8)
    && v16 == (unint64_t)*(unsigned int *)(a2 + 16);
  v8 = *(CC_SHA1_CTX **)(a1 + 104);
  if (v7)
  {
    v12 = (unsigned __int8 *)&v8[4].data[3];
    v11 = v8 + 2;
  }
  else
  {
    CC_SHA1_Final(md, v8 + 1);
    if (*(_QWORD *)md != *(_QWORD *)a2
      || v15 != *(_QWORD *)(a2 + 8)
      || v16 != (unint64_t)*(unsigned int *)(a2 + 16))
    {
      return 0xFFFFFFFFLL;
    }
    CC_SHA1_Update(*(CC_SHA1_CTX **)(a1 + 104), md, 0x14u);
    CC_SHA1_Update(*(CC_SHA1_CTX **)(a1 + 104), (const void *)(*(_QWORD *)(a1 + 104) + 384), 0x28u);
    v11 = *(CC_SHA1_CTX **)(a1 + 104);
    v12 = (unsigned __int8 *)&v11[4].data[3];
  }
  CC_SHA1_Final(v12, v11);
  return 0;
}

uint64_t srp6_server_respond(uint64_t a1, uint64_t **a2)
{
  uint64_t *v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  _OWORD *v8;

  if (!a2)
    return 0xFFFFFFFFLL;
  v4 = *a2;
  if (!*a2)
  {
    v4 = cstr_new();
    *a2 = v4;
  }
  cstr_set_length(v4, 20);
  result = 0;
  v6 = **a2;
  v7 = *(_QWORD *)(a1 + 104);
  v8 = (_OWORD *)(v7 + 424);
  LODWORD(v7) = *(_DWORD *)(v7 + 440);
  *(_OWORD *)v6 = *v8;
  *(_DWORD *)(v6 + 16) = v7;
  return result;
}

void srp6_server_genpub_ex(_QWORD *a1, _QWORD **a2)
{
  int secret_bits;
  int v5;
  int v6;
  _QWORD *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;

  BigIntegerBitLen(a1[2]);
  secret_bits = SRP_get_secret_bits();
  v5 = secret_bits + 7;
  if (secret_bits < -7)
    v5 = secret_bits + 14;
  v6 = v5 >> 3;
  if (a2)
  {
    v7 = *a2;
    if (!*a2)
    {
      v7 = cstr_new();
      *a2 = v7;
    }
  }
  else
  {
    v7 = cstr_new();
  }
  v8 = BigIntegerBitLen(a1[2]);
  v9 = v8 + 7;
  if (v8 < -7)
    v9 = v8 + 14;
  if (v6 > v9 >> 3)
  {
    v10 = BigIntegerBitLen(a1[2]);
    v11 = v10 + 7;
    if (v10 < -7)
      v11 = v10 + 14;
    v6 = v11 >> 3;
  }
  v12 = BigIntegerBitLen(a1[2]);
  v13 = v12 + 7;
  if (v12 < -7)
    v13 = v12 + 14;
  cstr_set_length(v7, v13 >> 3);
  t_random(*v7, v6);
  a1[8] = BigIntegerFromBytes();
  a1[7] = BigIntegerFromInt();
  BigIntegerMul();
  BigIntegerModExp();
  BigIntegerAdd();
  BigIntegerMod();
  BigIntegerToCstr(a1[7], v7);
  CC_SHA1_Update((CC_SHA1_CTX *)(a1[13] + 288), (const void *)*v7, *((_DWORD *)v7 + 2));
  if (!a2)
    cstr_clear_free(v7);
}

uint64_t srp6a_server_init(_QWORD *a1)
{
  CC_SHA1_CTX *v2;

  *a1 = 0x30000001CLL;
  v2 = (CC_SHA1_CTX *)malloc_type_malloc(0x1BCuLL, 0x1000040E79818FDuLL);
  a1[13] = v2;
  CC_SHA1_Init(v2);
  CC_SHA1_Init((CC_SHA1_CTX *)(a1[13] + 96));
  CC_SHA1_Init((CC_SHA1_CTX *)(a1[13] + 192));
  CC_SHA1_Init((CC_SHA1_CTX *)(a1[13] + 288));
  return 0;
}

void srp6a_server_genpub(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  CC_SHA1_CTX v5;
  unsigned __int8 md[20];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  memset(&v5, 0, sizeof(v5));
  CC_SHA1_Init(&v5);
  v2 = cstr_new();
  BigIntegerToCstr(*(_QWORD *)(a1 + 16), v2);
  CC_SHA1_Update(&v5, (const void *)*v2, *((_DWORD *)v2 + 2));
  v3 = *(_QWORD *)(a1 + 24);
  if ((*(_BYTE *)(a1 + 4) & 2) != 0)
    BigIntegerToCstrEx(v3, (const void **)v2, v2[1]);
  else
    BigIntegerToCstr(v3, v2);
  CC_SHA1_Update(&v5, (const void *)*v2, *((_DWORD *)v2 + 2));
  CC_SHA1_Final(md, &v5);
  cstr_free(v2);
  v4 = BigIntegerFromBytes();
  BigIntegerCmpInt(v4, 0);
}

uint64_t sub_20A045BBC(int a1)
{
  _QWORD **v1;
  _QWORD *v2;
  uint64_t v3;

  if (a1)
  {
    srp6_server_genpub_ex(v2, v1);
    v3 = 0;
  }
  else
  {
    v3 = 0xFFFFFFFFLL;
  }
  BigIntegerClearFree();
  return v3;
}

uint64_t BigIntegerFromInt()
{
  uint64_t v0;

  v0 = CCCreateBigNum();
  if (v0)
    CCBigNumSetI();
  return v0;
}

uint64_t BigIntegerFromBytes()
{
  return CCBigNumFromData();
}

uint64_t BigIntegerToBytes()
{
  return CCBigNumToData();
}

uint64_t BigIntegerToCstr(uint64_t a1, _QWORD *a2)
{
  int v3;
  int v4;
  int v5;

  v3 = CCBigNumBitCount();
  v4 = v3 + 7;
  if (v3 < -7)
    v4 = v3 + 14;
  if ((cstr_set_length(a2, v4 >> 3) & 0x80000000) != 0)
    return 0xFFFFFFFFLL;
  v5 = CCBigNumToData();
  return ((int)cstr_set_length(a2, v5) >> 31);
}

uint64_t BigIntegerToCstrEx(uint64_t a1, const void **a2, unint64_t a3)
{
  int v5;
  uint64_t result;
  size_t v7;

  if ((cstr_set_length(a2, a3) & 0x80000000) != 0)
    return 0xFFFFFFFFLL;
  v5 = CCBigNumToData();
  result = 0;
  if (a3 > v5)
  {
    v7 = a3 - v5;
    memmove((char *)*a2 + v7, *a2, v5);
    bzero((void *)*a2, v7);
    return 0;
  }
  return result;
}

uint64_t BigIntegerToHex(uint64_t a1, char *a2, int a3)
{
  char *v5;

  v5 = (char *)CCBigNumToHexString();
  strlcpy(a2, v5, a3);
  free(v5);
  return 0;
}

uint64_t BigIntegerToString(uint64_t a1, char *a2)
{
  uint64_t v3;
  char *v4;
  _BYTE *v5;
  char *v6;
  char v7;

  v3 = BigIntegerFromInt();
  CCBigNumModI();
  *a2 = b64table[0];
  v4 = a2 + 1;
  BigIntegerFromInt();
  CCBigNumDiv();
  CCBigNumFree();
  v5 = a2 + 1;
  if ((int)MEMORY[0x20BD1EF50](v3, 0) >= 1)
  {
    v5 = a2 + 1;
    do
    {
      CCBigNumModI();
      *v5++ = b64table[0];
      BigIntegerFromInt();
      CCBigNumDiv();
      CCBigNumFree();
    }
    while ((int)MEMORY[0x20BD1EF50](v3, 0) > 0);
  }
  CCBigNumFree();
  *v5 = 0;
  v6 = v5 - 1;
  if (v6 > a2)
  {
    do
    {
      v7 = *v6;
      *v6-- = *(v4 - 1);
      *(v4 - 1) = v7;
    }
    while (v6 > v4++);
  }
  return 0;
}

uint64_t BigIntegerModInt()
{
  CCBigNumModI();
  return 0;
}

uint64_t BigIntegerDivInt()
{
  BigIntegerFromInt();
  CCBigNumDiv();
  CCBigNumFree();
  return 0;
}

uint64_t BigIntegerFree()
{
  CCBigNumFree();
  return 0;
}

uint64_t BigIntegerLShift()
{
  CCBigNumLeftShift();
  return 0;
}

uint64_t BigIntegerAdd()
{
  CCBigNumAdd();
  return 0;
}

uint64_t BigIntegerAddInt()
{
  CCBigNumAddI();
  return 0;
}

uint64_t BigIntegerSub()
{
  CCBigNumSub();
  return 0;
}

uint64_t BigIntegerSubInt()
{
  CCBigNumSubI();
  return 0;
}

uint64_t BigIntegerMul()
{
  CCBigNumMul();
  return 0;
}

uint64_t BigIntegerMulInt()
{
  CCBigNumMulI();
  return 0;
}

uint64_t BigIntegerMod()
{
  CCBigNumMod();
  return 0;
}

uint64_t BigIntegerModMul()
{
  CCBigNumMulMod();
  return 0;
}

uint64_t BigIntegerModExp()
{
  CCBigNumModExp();
  return 0;
}

uint64_t BigIntegerCheckPrime()
{
  return CCBigNumIsPrime();
}

uint64_t BigIntegerClearFree()
{
  CCBigNumFree();
  return 0;
}

uint64_t BigIntegerCtxNew()
{
  return 0;
}

uint64_t BigIntegerCtxFree()
{
  return 0;
}

uint64_t BigIntegerUseEngine()
{
  return 0xFFFFFFFFLL;
}

void t_random(uint64_t a1, int a2)
{
  if (a2)
  {
    if (CCRandomCopyBytes())
      abort();
  }
}

_BYTE *t_sessionkey(_BYTE *a1, _BYTE *a2, unint64_t a3)
{
  unint64_t v3;
  _BYTE *v4;
  unint64_t v6;
  void *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  unsigned int v13;
  uint64_t v14;
  unsigned __int8 *v15;
  uint64_t i;
  char v17;
  CC_SHA1_CTX v19;
  unsigned __int8 md[20];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (a3 > 0xFA0)
    return 0;
  v3 = a3;
  v4 = a2;
  if (a3)
  {
    while (!*v4)
    {
      ++v4;
      if (!--v3)
      {
        v4 = &a2[a3];
        break;
      }
    }
  }
  v6 = v3 >> 1;
  v7 = malloc_type_malloc(v3 >> 1, 0x100004077774924uLL);
  if (!v7)
    return 0;
  v8 = v7;
  memset(&v19, 0, sizeof(v19));
  if (v3 >= 2)
  {
    v9 = 0;
    v10 = 0;
    do
    {
      *((_BYTE *)v7 + v10++) = v4[v3 + ~(unint64_t)v9];
      v9 += 2;
    }
    while (v6 > v10);
  }
  CC_SHA1_Init(&v19);
  CC_SHA1_Update(&v19, v8, v3 >> 1);
  CC_SHA1_Final(md, &v19);
  v11 = 0;
  v12 = a1;
  do
  {
    *v12 = md[v11];
    v12 += 2;
    ++v11;
  }
  while (v11 != 20);
  if (v3 >= 2)
  {
    v13 = 0;
    v14 = 0;
    do
    {
      *((_BYTE *)v8 + v14++) = v4[v3 - 2 - v13];
      v13 += 2;
    }
    while (v6 > v14);
  }
  CC_SHA1_Init(&v19);
  CC_SHA1_Update(&v19, v8, v3 >> 1);
  v15 = md;
  CC_SHA1_Final(md, &v19);
  for (i = 1; i != 41; i += 2)
  {
    v17 = *v15++;
    a1[i] = v17;
  }
  bzero(v8, v3 >> 1);
  free(v8);
  return a1;
}

unsigned __int8 *t_mgf1(unsigned __int8 *result, unsigned int a2, const void *a3, CC_LONG a4)
{
  unsigned __int8 *v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int data;
  CC_SHA1_CTX c;
  unsigned __int8 md[20];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v7 = result;
    v8 = 0;
    v9 = 0;
    memset(&c, 0, sizeof(c));
    while (1)
    {
      data = bswap32(v9);
      CC_SHA1_Init(&c);
      CC_SHA1_Update(&c, a3, a4);
      CC_SHA1_Update(&c, &data, 4u);
      v10 = v8 + 20;
      if (v8 + 20 > a2)
        break;
      result = (unsigned __int8 *)CC_SHA1_Final(&v7[v8], &c);
      ++v9;
      v8 += 20;
      if (v10 >= a2)
        return result;
    }
    CC_SHA1_Final(md, &c);
    return (unsigned __int8 *)memcpy(&v7[v8], md, a2 - v8);
  }
  return result;
}

uint64_t t_fromhex(_BYTE *a1, char *__s)
{
  char *v2;
  size_t v4;
  _BYTE *v5;
  char v6;
  int v7;
  unsigned int v8;
  unsigned int v9;
  char v10;
  char v11;
  char v12;
  int v13;
  unsigned int v14;
  char v15;
  char v16;
  char v17;
  int v18;
  unsigned int v19;
  char v20;
  char v21;

  v2 = __s;
  v4 = strlen(__s);
  if ((v4 & 1) == 0)
  {
    v5 = a1;
    if (!v4)
      return ((_DWORD)v5 - (_DWORD)a1);
    goto LABEL_12;
  }
  v7 = *v2++;
  v6 = v7;
  v8 = (v7 << 24) - 788529153;
  v9 = (v7 << 24) - 1610612737;
  v10 = v7 - 55;
  if (((v7 << 24) - 1073741825) >= 0x6FFFFFF)
    v11 = 0;
  else
    v11 = v10;
  if (v9 < 0x6FFFFFF)
    v11 = v6 - 87;
  v12 = v6 - 48;
  if (v8 < 0xAFFFFFF)
    v11 = v12;
  *a1 = v11;
  v5 = a1 + 1;
  if (--v4)
  {
    do
    {
LABEL_12:
      v13 = *v2;
      v14 = (v13 << 24) - 788529153;
      if (((v13 << 24) - 1073741825) >= 0x6FFFFFF)
        v15 = 0;
      else
        v15 = v13 - 55;
      if (((v13 << 24) - 1610612737) < 0x6FFFFFF)
        v15 = v13 - 87;
      v16 = v13 - 48;
      if (v14 >= 0xAFFFFFF)
        v16 = v15;
      v17 = 16 * v16;
      v18 = v2[1];
      v19 = (v18 << 24) - 788529153;
      if (((v18 << 24) - 1073741825) >= 0x6FFFFFF)
        v20 = 0;
      else
        v20 = v18 - 55;
      if (((v18 << 24) - 1610612737) < 0x6FFFFFF)
        v20 = v18 - 87;
      v21 = v18 - 48;
      if (v19 >= 0xAFFFFFF)
        v21 = v20;
      *v5++ = v21 | v17;
      v2 += 2;
      v4 -= 2;
    }
    while (v4);
  }
  return ((_DWORD)v5 - (_DWORD)a1);
}

char *t_tohex(char *a1, _BYTE *a2, int a3)
{
  int v4;
  int v6;
  char *v7;
  uint64_t v8;

  *a1 = 0;
  if (a3)
  {
    v4 = a3;
    v6 = 0;
    v7 = a1;
    do
    {
      if (v6)
        goto LABEL_4;
      if (!*a2)
      {
        v6 = 0;
        goto LABEL_6;
      }
      if (*a2 >= 0x10u)
      {
LABEL_4:
        v8 = 2;
        sprintf(v7, "%.2X");
      }
      else
      {
        v8 = 1;
        sprintf(v7, "%.1X");
      }
      v7 += v8;
      v6 = 1;
LABEL_6:
      ++a2;
      --v4;
    }
    while (v4);
  }
  return a1;
}

char *t_tohexcstr(char **a1, _BYTE *a2, int a3)
{
  cstr_set_length(a1, (2 * a3) | 1);
  return t_tohex(*a1, a2, a3);
}

size_t t_fromb64(void *a1, char *__s)
{
  unsigned int v4;
  BOOL v5;
  uint64_t v6;
  unsigned int v8;
  _BYTE *v9;
  _BYTE *v10;
  uint64_t v11;
  char *v12;
  size_t v13;
  uint64_t v14;
  signed int v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;
  char v19;
  int v20;
  _BYTE *v21;
  int v22;
  int v23;
  unsigned __int8 *v24;
  int v25;
  int v26;
  int v27;

  while (1)
  {
    v4 = *__s;
    v5 = v4 > 0x20;
    v6 = (1 << v4) & 0x100000600;
    if (v5 || v6 == 0)
      break;
    ++__s;
  }
  v8 = strlen(__s);
  v9 = malloc_type_malloc(v8 + 1, 0x100004077774924uLL);
  if (!v9)
    return 0xFFFFFFFFLL;
  v10 = v9;
  if (v8)
  {
    v11 = 0;
    while (1)
    {
      v12 = strchr(b64table_0, __s[v11]);
      if (!v12)
        break;
      v10[v11++] = (_BYTE)v12 - b64table_0;
      if (v8 == v11)
        goto LABEL_14;
    }
    v8 = v11;
  }
LABEL_14:
  v14 = 0;
  v15 = v8 - 1;
  v16 = (int)v8 - 1;
  v17 = v8 - 3;
  v18 = v8 - 2;
  while (1)
  {
    v19 = v10[v15 + v14];
    v10[v16 + 1] = v19;
    if (v15 + v14 < 1)
    {
LABEL_19:
      LODWORD(v16) = v16 + 1;
      goto LABEL_21;
    }
    v10[v16 + 1] = v19 | (v10[v18 + v14] << 6);
    v20 = (v10[v18 + v14] >> 2) & 0xF;
    v10[v16] = (v10[v18 + v14] >> 2) & 0xF;
    if (v15 + v14 == 1)
      goto LABEL_21;
    v21 = &v10[v16];
    *v21 = v20 | (16 * v10[v17 + v14]);
    v22 = (v10[v17 + v14] >> 4) & 3;
    *(v21 - 1) = (v10[v17 + v14] >> 4) & 3;
    if ((v15 + v14) < 3)
      break;
    v23 = v8 - 4 + v14;
    v14 -= 4;
    *(v21 - 1) = v22 | (4 * v10[v23]);
    *(v21 - 2) = 0;
    v16 -= 3;
    if (v15 + v14 == -1)
      goto LABEL_19;
  }
  LODWORD(v16) = v16 - 1;
LABEL_21:
  v24 = &v10[(int)v16];
  do
  {
    v26 = *v24++;
    v25 = v26;
    v27 = v16 + 1;
    if (v8 < v16)
      break;
    LODWORD(v16) = v16 + 1;
  }
  while (!v25);
  v13 = v8 - v27 + 2;
  memcpy(a1, v24 - 1, v13);
  free(v10);
  return v13;
}

size_t t_cstrfromb64(void **a1, char *__s)
{
  size_t v4;
  size_t v5;

  v4 = strlen(__s);
  cstr_set_length(a1, (6 * v4 + 7) >> 3);
  v5 = t_fromb64(*a1, __s);
  cstr_set_length(a1, v5);
  return v5;
}

_BYTE *t_tob64(_BYTE *result, unsigned __int8 *a2, unsigned int a3)
{
  unsigned int v3;
  unint64_t v4;
  unsigned int v5;
  unsigned __int8 *v6;
  unsigned int v7;
  int v8;
  unsigned __int8 *v9;
  _BYTE *v10;
  BOOL v11;
  int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  int v16;
  unsigned __int8 *v17;

  v3 = 0;
  v4 = a3 % 3;
  if ((_DWORD)v4 == 1)
  {
    v6 = a2;
    goto LABEL_5;
  }
  v5 = 0;
  if ((_DWORD)v4 == 2)
  {
    v6 = a2 + 1;
    v3 = *a2;
LABEL_5:
    v5 = *v6;
  }
  v7 = 0;
  v8 = 0;
  v9 = a2 + 1;
  v10 = result;
  while (1)
  {
    if (v8)
      v11 = 1;
    else
      v11 = v7 > 3;
    v12 = v11;
    if (v12 == 1)
      *v10++ = b64table_0[(unint64_t)v7 >> 2];
    v13 = (16 * (v7 & 3)) | (v3 >> 4);
    if ((_DWORD)v13)
      v14 = 1;
    else
      v14 = v12;
    if (v14 == 1)
      *v10++ = b64table_0[v13];
    v15 = (4 * (v3 & 0xF)) | (v5 >> 6);
    if ((_DWORD)v15)
      v14 = 1;
    if (v14 == 1)
    {
      *v10++ = b64table_0[v15];
      v16 = v5 & 0x3F;
LABEL_25:
      *v10++ = b64table_0[v16];
      v8 = 1;
      goto LABEL_26;
    }
    v16 = v5 & 0x3F;
    if ((v5 & 0x3F) != 0)
      goto LABEL_25;
    v8 = 0;
LABEL_26:
    if (v4 >= a3)
      break;
    v17 = &v9[v4];
    v7 = a2[v4];
    v3 = v9[v4];
    v4 += 3;
    v5 = v17[1];
  }
  *v10 = 0;
  return result;
}

_BYTE *t_tob64cstr(_QWORD *a1, unsigned __int8 *a2, unsigned int a3)
{
  cstr_set_length(a1, ((8 * a3) | 4) / 6 + 1);
  return t_tob64((_BYTE *)*a1, a2, a3);
}

char **SRP_RFC2945_client_method()
{
  return &srp_rfc2945_client_meth;
}

uint64_t srp2945_client_init(uint64_t a1)
{
  CC_SHA1_CTX *v2;

  *(_DWORD *)a1 = 12;
  *(_QWORD *)(a1 + 128) = SRP_CLIENT_default_param_verify_cb;
  v2 = (CC_SHA1_CTX *)malloc_type_malloc(0xE8uLL, 0x10000403E2B8178uLL);
  *(_QWORD *)(a1 + 104) = v2;
  CC_SHA1_Init(v2);
  CC_SHA1_Init((CC_SHA1_CTX *)(*(_QWORD *)(a1 + 104) + 96));
  return 0;
}

uint64_t srp2945_client_finish(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 104);
  if (v1)
  {
    *(_QWORD *)(v1 + 224) = 0;
    *(_OWORD *)(v1 + 192) = 0u;
    *(_OWORD *)(v1 + 208) = 0u;
    *(_OWORD *)(v1 + 160) = 0u;
    *(_OWORD *)(v1 + 176) = 0u;
    *(_OWORD *)(v1 + 128) = 0u;
    *(_OWORD *)(v1 + 144) = 0u;
    *(_OWORD *)(v1 + 96) = 0u;
    *(_OWORD *)(v1 + 112) = 0u;
    *(_OWORD *)(v1 + 64) = 0u;
    *(_OWORD *)(v1 + 80) = 0u;
    *(_OWORD *)(v1 + 32) = 0u;
    *(_OWORD *)(v1 + 48) = 0u;
    *(_OWORD *)v1 = 0u;
    *(_OWORD *)(v1 + 16) = 0u;
    free(*(void **)(a1 + 104));
  }
  return 0;
}

uint64_t srp2945_client_params(uint64_t a1, const void *a2, CC_LONG a3, const void *a4, CC_LONG a5, const void *a6, CC_LONG a7)
{
  uint64_t i;
  CC_SHA1_CTX v16;
  unsigned __int8 v17[20];
  unsigned __int8 md[20];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  memset(&v16, 0, sizeof(v16));
  CC_SHA1_Init(&v16);
  CC_SHA1_Update(&v16, a2, a3);
  CC_SHA1_Final(md, &v16);
  CC_SHA1_Init(&v16);
  CC_SHA1_Update(&v16, a4, a5);
  CC_SHA1_Final(v17, &v16);
  for (i = 0; i != 20; ++i)
    md[i] ^= v17[i];
  CC_SHA1_Update(*(CC_SHA1_CTX **)(a1 + 104), md, 0x14u);
  CC_SHA1_Init(&v16);
  CC_SHA1_Update(&v16, **(const void ***)(a1 + 8), *(_DWORD *)(*(_QWORD *)(a1 + 8) + 8));
  CC_SHA1_Final(md, &v16);
  CC_SHA1_Update(*(CC_SHA1_CTX **)(a1 + 104), md, 0x14u);
  CC_SHA1_Update(*(CC_SHA1_CTX **)(a1 + 104), a6, a7);
  return 0;
}

uint64_t srp2945_client_auth(uint64_t a1)
{
  *(_QWORD *)(a1 + 48) = BigIntegerFromBytes();
  *(_QWORD *)(a1 + 40) = BigIntegerFromInt();
  BigIntegerModExp();
  return 0;
}

uint64_t srp2945_client_passwd(uint64_t a1, const void *a2, CC_LONG a3)
{
  CC_SHA1_CTX v7;
  unsigned __int8 md[20];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  memset(&v7, 0, sizeof(v7));
  CC_SHA1_Init(&v7);
  CC_SHA1_Update(&v7, **(const void ***)(a1 + 8), *(_DWORD *)(*(_QWORD *)(a1 + 8) + 8));
  CC_SHA1_Update(&v7, ":", 1u);
  CC_SHA1_Update(&v7, a2, a3);
  CC_SHA1_Final(md, &v7);
  CC_SHA1_Init(&v7);
  CC_SHA1_Update(&v7, **(const void ***)(a1 + 32), *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8));
  CC_SHA1_Update(&v7, md, 0x14u);
  CC_SHA1_Final(md, &v7);
  memset(&v7, 0, sizeof(v7));
  return SRP_set_authenticator(a1);
}

uint64_t srp2945_client_genpub(uint64_t a1, _QWORD **a2)
{
  int secret_bits;
  int v5;
  int v6;
  _QWORD *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;

  BigIntegerBitLen(*(_QWORD *)(a1 + 16));
  secret_bits = SRP_get_secret_bits();
  v5 = secret_bits + 7;
  if (secret_bits < -7)
    v5 = secret_bits + 14;
  v6 = v5 >> 3;
  if (a2)
  {
    v7 = *a2;
    if (!*a2)
    {
      v7 = cstr_new();
      *a2 = v7;
    }
  }
  else
  {
    v7 = cstr_new();
  }
  v8 = BigIntegerBitLen(*(_QWORD *)(a1 + 16));
  v9 = v8 + 7;
  if (v8 < -7)
    v9 = v8 + 14;
  if (v6 > v9 >> 3)
  {
    v10 = BigIntegerBitLen(*(_QWORD *)(a1 + 16));
    v11 = v10 + 7;
    if (v10 < -7)
      v11 = v10 + 14;
    v6 = v11 >> 3;
  }
  v12 = BigIntegerBitLen(*(_QWORD *)(a1 + 16));
  v13 = v12 + 7;
  if (v12 < -7)
    v13 = v12 + 14;
  cstr_set_length(v7, v13 >> 3);
  t_random(*v7, v6);
  *(_QWORD *)(a1 + 64) = BigIntegerFromBytes();
  BigIntegerBitLen(*(_QWORD *)(a1 + 16));
  BigIntegerAddInt();
  *(_QWORD *)(a1 + 56) = BigIntegerFromInt();
  BigIntegerModExp();
  BigIntegerToCstr(*(_QWORD *)(a1 + 56), v7);
  CC_SHA1_Update(*(CC_SHA1_CTX **)(a1 + 104), (const void *)*v7, *((_DWORD *)v7 + 2));
  CC_SHA1_Update((CC_SHA1_CTX *)(*(_QWORD *)(a1 + 104) + 96), (const void *)*v7, *((_DWORD *)v7 + 2));
  if (!a2)
    cstr_clear_free(v7);
  return 0;
}

void srp2945_client_key(uint64_t a1, uint64_t a2, const void *a3, CC_LONG a4)
{
  uint64_t v7;
  CC_SHA1_CTX v8;
  unsigned __int8 md[20];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  memset(&v8, 0, sizeof(v8));
  CC_SHA1_Init(&v8);
  CC_SHA1_Update(&v8, a3, a4);
  CC_SHA1_Final(md, &v8);
  v7 = BigIntegerFromBytes();
  *(_QWORD *)(a1 + 72) = v7;
  BigIntegerCmpInt(v7, 0);
}

uint64_t sub_20A046F94(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  uint64_t v30;
  CC_LONG v31;
  const void *v32;
  uint64_t v33;

  if (a1)
  {
    CC_SHA1_Update(*(CC_SHA1_CTX **)(v30 + 104), v32, v31);
    v33 = BigIntegerFromBytes();
    BigIntegerCmp(v33, *(_QWORD *)(v30 + 16));
  }
  return 0xFFFFFFFFLL;
}

uint64_t srp2945_client_verify(uint64_t a1, uint64_t a2, int a3)
{
  BOOL v5;
  BOOL v6;
  unsigned __int8 md[8];
  uint64_t v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  CC_SHA1_Final(md, (CC_SHA1_CTX *)(*(_QWORD *)(a1 + 104) + 96));
  if (a3 == 20
    && (*(_QWORD *)md == *(_QWORD *)a2 ? (v5 = v9 == *(_QWORD *)(a2 + 8)) : (v5 = 0),
        v5 ? (v6 = v10 == (unint64_t)*(unsigned int *)(a2 + 16)) : (v6 = 0),
        v6))
  {
    return 0;
  }
  else
  {
    return 0xFFFFFFFFLL;
  }
}

uint64_t srp2945_client_respond(uint64_t a1, unsigned __int8 ***a2)
{
  unsigned __int8 **v4;

  if (!a2)
    return 0xFFFFFFFFLL;
  v4 = *a2;
  if (!*a2)
  {
    v4 = (unsigned __int8 **)cstr_new();
    *a2 = v4;
  }
  cstr_set_length(v4, 20);
  CC_SHA1_Final(**a2, *(CC_SHA1_CTX **)(a1 + 104));
  CC_SHA1_Update((CC_SHA1_CTX *)(*(_QWORD *)(a1 + 104) + 96), **a2, *((_DWORD *)*a2 + 2));
  CC_SHA1_Update((CC_SHA1_CTX *)(*(_QWORD *)(a1 + 104) + 96), (const void *)(*(_QWORD *)(a1 + 104) + 192), 0x28u);
  return 0;
}

char **SRP_RFC2945_server_method()
{
  return &srp_rfc2945_server_meth;
}

uint64_t srp2945_server_init(uint64_t a1)
{
  CC_SHA1_CTX *v2;

  *(_DWORD *)a1 = 28;
  v2 = (CC_SHA1_CTX *)malloc_type_malloc(0x1BCuLL, 0x1000040E79818FDuLL);
  *(_QWORD *)(a1 + 104) = v2;
  CC_SHA1_Init(v2);
  CC_SHA1_Init((CC_SHA1_CTX *)(*(_QWORD *)(a1 + 104) + 96));
  CC_SHA1_Init((CC_SHA1_CTX *)(*(_QWORD *)(a1 + 104) + 192));
  CC_SHA1_Init((CC_SHA1_CTX *)(*(_QWORD *)(a1 + 104) + 288));
  return 0;
}

uint64_t srp2945_server_finish(uint64_t a1)
{
  _OWORD *v1;

  v1 = *(_OWORD **)(a1 + 104);
  if (v1)
  {
    v1[25] = 0u;
    v1[26] = 0u;
    v1[23] = 0u;
    v1[24] = 0u;
    v1[21] = 0u;
    v1[22] = 0u;
    v1[19] = 0u;
    v1[20] = 0u;
    v1[17] = 0u;
    v1[18] = 0u;
    v1[15] = 0u;
    v1[16] = 0u;
    v1[13] = 0u;
    v1[14] = 0u;
    v1[11] = 0u;
    v1[12] = 0u;
    v1[9] = 0u;
    v1[10] = 0u;
    v1[7] = 0u;
    v1[8] = 0u;
    v1[5] = 0u;
    v1[6] = 0u;
    v1[3] = 0u;
    v1[4] = 0u;
    v1[1] = 0u;
    v1[2] = 0u;
    *v1 = 0u;
    *(_OWORD *)((char *)v1 + 428) = 0u;
    free(*(void **)(a1 + 104));
  }
  return 0;
}

uint64_t srp2945_server_params(uint64_t a1, const void *a2, CC_LONG a3, const void *a4, CC_LONG a5, const void *a6, CC_LONG a7)
{
  uint64_t i;
  CC_SHA1_CTX v16;
  unsigned __int8 v17[20];
  unsigned __int8 md[20];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  memset(&v16, 0, sizeof(v16));
  CC_SHA1_Init(&v16);
  CC_SHA1_Update(&v16, a2, a3);
  CC_SHA1_Final(md, &v16);
  CC_SHA1_Init(&v16);
  CC_SHA1_Update(&v16, a4, a5);
  CC_SHA1_Final(v17, &v16);
  for (i = 0; i != 20; ++i)
    md[i] ^= v17[i];
  CC_SHA1_Update((CC_SHA1_CTX *)(*(_QWORD *)(a1 + 104) + 96), md, 0x14u);
  CC_SHA1_Init(&v16);
  CC_SHA1_Update(&v16, **(const void ***)(a1 + 8), *(_DWORD *)(*(_QWORD *)(a1 + 8) + 8));
  CC_SHA1_Final(md, &v16);
  CC_SHA1_Update((CC_SHA1_CTX *)(*(_QWORD *)(a1 + 104) + 96), md, 0x14u);
  CC_SHA1_Update((CC_SHA1_CTX *)(*(_QWORD *)(a1 + 104) + 96), a6, a7);
  return 0;
}

uint64_t srp2945_server_auth(uint64_t a1)
{
  *(_QWORD *)(a1 + 40) = BigIntegerFromBytes();
  return 0;
}

uint64_t srp2945_server_passwd(uint64_t a1, const void *a2, CC_LONG a3)
{
  CC_SHA1_CTX v7;
  unsigned __int8 md[8];
  uint64_t v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  memset(&v7, 0, sizeof(v7));
  CC_SHA1_Init(&v7);
  CC_SHA1_Update(&v7, **(const void ***)(a1 + 8), *(_DWORD *)(*(_QWORD *)(a1 + 8) + 8));
  CC_SHA1_Update(&v7, ":", 1u);
  CC_SHA1_Update(&v7, a2, a3);
  CC_SHA1_Final(md, &v7);
  CC_SHA1_Init(&v7);
  CC_SHA1_Update(&v7, **(const void ***)(a1 + 32), *(_DWORD *)(*(_QWORD *)(a1 + 32) + 8));
  CC_SHA1_Update(&v7, md, 0x14u);
  CC_SHA1_Final(md, &v7);
  memset(&v7, 0, sizeof(v7));
  *(_QWORD *)(a1 + 48) = BigIntegerFromBytes();
  *(_QWORD *)md = 0;
  v9 = 0;
  v10 = 0;
  *(_QWORD *)(a1 + 40) = BigIntegerFromInt();
  BigIntegerModExp();
  return 0;
}

void srp2945_server_genpub(_QWORD *a1, _QWORD **a2)
{
  int secret_bits;
  int v5;
  int v6;
  _QWORD *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;

  BigIntegerBitLen(a1[2]);
  secret_bits = SRP_get_secret_bits();
  v5 = secret_bits + 7;
  if (secret_bits < -7)
    v5 = secret_bits + 14;
  v6 = v5 >> 3;
  if (a2)
  {
    v7 = *a2;
    if (!*a2)
    {
      v7 = cstr_new();
      *a2 = v7;
    }
  }
  else
  {
    v7 = cstr_new();
  }
  v8 = BigIntegerBitLen(a1[2]);
  v9 = v8 + 7;
  if (v8 < -7)
    v9 = v8 + 14;
  if (v6 > v9 >> 3)
  {
    v10 = BigIntegerBitLen(a1[2]);
    v11 = v10 + 7;
    if (v10 < -7)
      v11 = v10 + 14;
    v6 = v11 >> 3;
  }
  v12 = BigIntegerBitLen(a1[2]);
  v13 = v12 + 7;
  if (v12 < -7)
    v13 = v12 + 14;
  cstr_set_length(v7, v13 >> 3);
  t_random(*v7, v6);
  a1[8] = BigIntegerFromBytes();
  a1[7] = BigIntegerFromInt();
  BigIntegerModExp();
  BigIntegerAdd();
  BigIntegerCmp(a1[7], a1[2]);
}

void srp2945_server_key(uint64_t a1, int a2, void *data, CC_LONG len)
{
  _QWORD *v7;
  uint64_t v8;

  CC_SHA1_Update((CC_SHA1_CTX *)(*(_QWORD *)(a1 + 104) + 96), data, len);
  v7 = cstr_new();
  BigIntegerToCstr(*(_QWORD *)(a1 + 56), v7);
  CC_SHA1_Update((CC_SHA1_CTX *)(*(_QWORD *)(a1 + 104) + 96), (const void *)*v7, *((_DWORD *)v7 + 2));
  CC_SHA1_Update(*(CC_SHA1_CTX **)(a1 + 104), data, len);
  CC_SHA1_Update((CC_SHA1_CTX *)(*(_QWORD *)(a1 + 104) + 192), data, len);
  BigIntegerFromInt();
  BigIntegerModExp();
  BigIntegerFromBytes();
  v8 = BigIntegerFromInt();
  BigIntegerModMul();
  BigIntegerCmpInt(v8, 1);
}

uint64_t srp2945_server_verify(uint64_t a1, uint64_t a2, int a3)
{
  BOOL v7;
  CC_SHA1_CTX *v8;
  CC_SHA1_CTX *v11;
  unsigned __int8 *v12;
  unsigned __int8 md[8];
  uint64_t v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  CC_SHA1_Final(md, (CC_SHA1_CTX *)(*(_QWORD *)(a1 + 104) + 288));
  if (a3 != 20)
  {
    CC_SHA1_Final(md, (CC_SHA1_CTX *)(*(_QWORD *)(a1 + 104) + 96));
    return 0xFFFFFFFFLL;
  }
  v7 = *(_QWORD *)md == *(_QWORD *)a2
    && v15 == *(_QWORD *)(a2 + 8)
    && v16 == (unint64_t)*(unsigned int *)(a2 + 16);
  v8 = *(CC_SHA1_CTX **)(a1 + 104);
  if (v7)
  {
    v12 = (unsigned __int8 *)&v8[4].data[3];
    v11 = v8 + 2;
  }
  else
  {
    CC_SHA1_Final(md, v8 + 1);
    if (*(_QWORD *)md != *(_QWORD *)a2
      || v15 != *(_QWORD *)(a2 + 8)
      || v16 != (unint64_t)*(unsigned int *)(a2 + 16))
    {
      return 0xFFFFFFFFLL;
    }
    CC_SHA1_Update(*(CC_SHA1_CTX **)(a1 + 104), md, 0x14u);
    CC_SHA1_Update(*(CC_SHA1_CTX **)(a1 + 104), (const void *)(*(_QWORD *)(a1 + 104) + 384), 0x28u);
    v11 = *(CC_SHA1_CTX **)(a1 + 104);
    v12 = (unsigned __int8 *)&v11[4].data[3];
  }
  CC_SHA1_Final(v12, v11);
  return 0;
}

uint64_t srp2945_server_respond(uint64_t a1, uint64_t **a2)
{
  uint64_t *v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  _OWORD *v8;

  if (!a2)
    return 0xFFFFFFFFLL;
  v4 = *a2;
  if (!*a2)
  {
    v4 = cstr_new();
    *a2 = v4;
  }
  cstr_set_length(v4, 20);
  result = 0;
  v6 = **a2;
  v7 = *(_QWORD *)(a1 + 104);
  v8 = (_OWORD *)(v7 + 424);
  LODWORD(v7) = *(_DWORD *)(v7 + 440);
  *(_OWORD *)v6 = *v8;
  *(_DWORD *)(v6 + 16) = v7;
  return result;
}

uint64_t CCBigNumAdd()
{
  return MEMORY[0x24BDAC030]();
}

uint64_t CCBigNumAddI()
{
  return MEMORY[0x24BDAC038]();
}

uint64_t CCBigNumBitCount()
{
  return MEMORY[0x24BDAC040]();
}

uint64_t CCBigNumCompare()
{
  return MEMORY[0x24BDAC048]();
}

uint64_t CCBigNumCompareI()
{
  return MEMORY[0x24BDAC050]();
}

uint64_t CCBigNumDiv()
{
  return MEMORY[0x24BDAC058]();
}

uint64_t CCBigNumFree()
{
  return MEMORY[0x24BDAC060]();
}

uint64_t CCBigNumFromData()
{
  return MEMORY[0x24BDAC068]();
}

uint64_t CCBigNumIsPrime()
{
  return MEMORY[0x24BDAC070]();
}

uint64_t CCBigNumLeftShift()
{
  return MEMORY[0x24BDAC078]();
}

uint64_t CCBigNumMod()
{
  return MEMORY[0x24BDAC080]();
}

uint64_t CCBigNumModExp()
{
  return MEMORY[0x24BDAC088]();
}

uint64_t CCBigNumModI()
{
  return MEMORY[0x24BDAC090]();
}

uint64_t CCBigNumMul()
{
  return MEMORY[0x24BDAC098]();
}

uint64_t CCBigNumMulI()
{
  return MEMORY[0x24BDAC0A0]();
}

uint64_t CCBigNumMulMod()
{
  return MEMORY[0x24BDAC0A8]();
}

uint64_t CCBigNumSetI()
{
  return MEMORY[0x24BDAC0B0]();
}

uint64_t CCBigNumSub()
{
  return MEMORY[0x24BDAC0B8]();
}

uint64_t CCBigNumSubI()
{
  return MEMORY[0x24BDAC0C0]();
}

uint64_t CCBigNumToData()
{
  return MEMORY[0x24BDAC0C8]();
}

uint64_t CCBigNumToHexString()
{
  return MEMORY[0x24BDAC0D0]();
}

uint64_t CCCreateBigNum()
{
  return MEMORY[0x24BDAC0E0]();
}

uint64_t CCRandomCopyBytes()
{
  return MEMORY[0x24BDAC2C8]();
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x24BDAC328](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x24BDAC330](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC338](c, data, *(_QWORD *)&len);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFE60](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFEE8](__s, *(_QWORD *)&__c);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF38](__dst, __source, __size);
}

