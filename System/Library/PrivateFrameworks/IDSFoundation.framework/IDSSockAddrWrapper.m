@implementation IDSSockAddrWrapper

+ (id)wrapperWithSockAddr:(const sockaddr *)a3
{
  IDSSockAddrWrapper *v4;
  const char *v5;
  double v6;

  v4 = [IDSSockAddrWrapper alloc];
  return (id)objc_msgSend_initWithSockAddr_(v4, v5, (uint64_t)a3, v6);
}

+ (id)wrapperWithAddressString:(id)a3 withPortHostOrder:(unsigned __int16)a4 withInterfaceName:(id)a5
{
  unsigned int v5;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  double v11;
  const char *v12;
  IDSSockAddrWrapper *v13;
  const char *v14;
  double v15;
  void *v16;
  id v18;
  const char *v19;
  uint64_t v20;
  double v21;
  const char *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v5 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = objc_retainAutorelease(a3);
  v12 = (const char *)objc_msgSend_UTF8String(v8, v9, v10, v11);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  if (inet_pton(2, v12, (char *)&v23 + 4))
  {
    LOWORD(v23) = 528;
    WORD1(v23) = __rev16(v5);
  }
  else
  {
    if (!inet_pton(30, v12, (char *)&v23 + 8))
    {
      v16 = 0;
      goto LABEL_4;
    }
    LOWORD(v23) = 7708;
    WORD1(v23) = __rev16(v5);
    if (v7)
    {
      v18 = objc_retainAutorelease(v7);
      v22 = (const char *)objc_msgSend_UTF8String(v18, v19, v20, v21);
      DWORD2(v24) = if_nametoindex(v22);
    }
  }
  v13 = [IDSSockAddrWrapper alloc];
  v16 = (void *)objc_msgSend_initWithSockAddr_(v13, v14, (uint64_t)&v23, v15);
LABEL_4:

  return v16;
}

+ (id)wrapperWithAddressString:(id)a3 withPortHostOrder:(unsigned __int16)a4
{
  return (id)((uint64_t (*)(__objc2_class *, char *, id))MEMORY[0x1E0DE7D20])(IDSSockAddrWrapper, sel_wrapperWithAddressString_withPortHostOrder_withInterfaceName_, a3);
}

- (IDSSockAddrWrapper)initWithSockAddr:(const sockaddr *)a3
{
  IDSSockAddrWrapper *v4;
  IDSSockAddrWrapper *v5;
  int sa_family;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IDSSockAddrWrapper;
  v4 = -[IDSSockAddrWrapper init](&v8, sel_init);
  v5 = v4;
  if (!v4)
  {
LABEL_7:
    a3 = v5;
    goto LABEL_9;
  }
  if (a3)
  {
    if (!a3->sa_len || (sa_family = a3->sa_family, sa_family != 30) && sa_family != 2)
    {
      a3 = 0;
      goto LABEL_9;
    }
    memcpy(&v4->_sa, a3, a3->sa_len);
    goto LABEL_7;
  }
LABEL_9:

  return (IDSSockAddrWrapper *)a3;
}

- (id)description
{
  __int128 v2;
  void *v3;
  int ss_family;
  size_t v5;
  const char *v6;
  double v7;
  size_t v8;
  const char *v9;
  int *v10;
  char __s[32];
  __int128 v13;
  __int128 v14;
  __int16 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v15 = -21846;
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v13 = v2;
  v14 = v2;
  *(_OWORD *)__s = v2;
  *(_OWORD *)&__s[16] = v2;
  v3 = (void *)MEMORY[0x1E0CB3940];
  ss_family = self->_sa.ss_family;
  if (ss_family == 30)
  {
    __s[0] = 91;
    if (inet_ntop(30, &self->_sa.__ss_align, &__s[1], 0x41u))
    {
      v8 = strlen(__s);
      snprintf(&__s[v8], 66 - v8, "%%%u]:%u");
      goto LABEL_12;
    }
    v9 = " *** JT *** can't convert v6 address to string (%d)\n";
    goto LABEL_11;
  }
  if (ss_family == 2)
  {
    if (inet_ntop(2, &self->_sa.__ss_pad1[2], __s, 0x42u))
    {
      v5 = strlen(__s);
      snprintf(&__s[v5], 66 - v5, ":%u");
LABEL_12:
      objc_msgSend_stringWithUTF8String_(v3, v6, (uint64_t)__s, v7);
      return (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = " *** JT *** can't convert v4 address to string (%d)\n";
LABEL_11:
    v10 = __error();
    printf(v9, *v10);
    v7 = *(double *)"<invalid address>";
    strcpy(__s, "<invalid address>");
    goto LABEL_12;
  }
  strcpy(__s, "<unsupported address>");
  objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], a2, (uint64_t)__s, *(double *)"<unsupported address>");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)wrapperWithWrapper:(id)a3 andPortHostOrder:(unsigned __int16)a4
{
  unsigned int v4;
  id v5;
  IDSSockAddrWrapper *v6;
  const char *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  double v16;
  const char *v17;
  uint64_t v18;
  double v19;
  uint64_t v20;

  v4 = a4;
  v5 = a3;
  v6 = [IDSSockAddrWrapper alloc];
  v10 = objc_msgSend_sa(v5, v7, v8, v9);

  v13 = (void *)objc_msgSend_initWithSockAddr_(v6, v11, v10, v12);
  if (*(_BYTE *)(objc_msgSend_sa(v13, v14, v15, v16) + 1) == 2)
    v20 = objc_msgSend_sa4(v13, v17, v18, v19);
  else
    v20 = objc_msgSend_sa6(v13, v17, v18, v19);
  *(_WORD *)(v20 + 2) = __rev16(v4);
  return v13;
}

- (const)sa
{
  return (const sockaddr *)&self->_sa;
}

- (const)sa4
{
  return (const sockaddr_in *)&self->_sa;
}

- (const)sa6
{
  return (const sockaddr_in6 *)&self->_sa;
}

- (unsigned)saPortHostOrder
{
  return bswap32(*(unsigned __int16 *)self->_sa.__ss_pad1) >> 16;
}

- (BOOL)isEqualToSockAddr:(const sockaddr *)a3
{
  return sub_19BA47478((uint64_t)&self->_sa, (uint64_t)a3);
}

- (BOOL)isEqualToWrapper:(id)a3
{
  double v3;
  sockaddr_storage *p_sa;
  uint64_t v5;

  if (self == a3)
    return 1;
  p_sa = &self->_sa;
  v5 = objc_msgSend_sa(a3, a2, (uint64_t)a3, v3);
  return sub_19BA47478((uint64_t)p_sa, v5);
}

- (id)ipData
{
  uint64_t v2;
  double v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  double v7;
  uint64_t v8;
  const char *v9;
  double v10;

  v4 = (void *)MEMORY[0x1E0C99D50];
  if (self->_sa.ss_family == 2)
  {
    v5 = objc_msgSend_sa4(self, a2, v2, v3) + 4;
    objc_msgSend_dataWithBytes_length_(v4, v6, v5, v7, 4);
  }
  else
  {
    v8 = objc_msgSend_sa6(self, a2, v2, v3) + 8;
    objc_msgSend_dataWithBytes_length_(v4, v9, v8, v10, 16);
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)ipString
{
  uint64_t v2;
  __int128 v3;
  int ss_family;
  uint64_t v5;
  const char *v6;
  double v7;
  uint64_t v8;
  void *v9;
  char v11[16];
  _BYTE v12[30];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v12[14] = v3;
  *(_OWORD *)v11 = v3;
  *(_OWORD *)v12 = v3;
  ss_family = self->_sa.ss_family;
  if (ss_family == 30)
  {
    v8 = objc_msgSend_sa6(self, a2, v2, *(double *)&v3);
    if (!inet_ntop(30, (const void *)(v8 + 8), v11, 0x2Eu))
    {
      __error();
      printf(" *** JT *** can't convert v6 address to string (%d)\n");
      goto LABEL_8;
    }
  }
  else
  {
    if (ss_family != 2)
    {
LABEL_8:
      v9 = 0;
      return v9;
    }
    v5 = objc_msgSend_sa4(self, a2, v2, *(double *)&v3);
    if (!inet_ntop(2, (const void *)(v5 + 4), v11, 0x2Eu))
    {
      __error();
      printf(" *** JT *** can't convert v4 address to string (%d)\n");
      goto LABEL_8;
    }
  }
  objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v6, (uint64_t)v11, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  double v7;
  char isEqualToWrapper;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
    isEqualToWrapper = objc_msgSend_isEqualToWrapper_(self, v6, (uint64_t)v4, v7);
  else
    isEqualToWrapper = 0;

  return isEqualToWrapper;
}

- (unint64_t)hash
{
  return sub_19BA476D0((uint64_t)&self->_sa);
}

- (void)copySockAddr:(sockaddr *)a3
{
  memcpy(a3, &self->_sa, self->_sa.ss_len);
}

- (void)updateLocalPort:(unsigned __int16)a3
{
  *(_WORD *)self->_sa.__ss_pad1 = __rev16(a3);
}

@end
