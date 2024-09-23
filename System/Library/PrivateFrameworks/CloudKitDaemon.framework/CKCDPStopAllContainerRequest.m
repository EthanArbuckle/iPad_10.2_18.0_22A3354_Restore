@implementation CKCDPStopAllContainerRequest

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)CKCDPStopAllContainerRequest;
  -[CKCDPStopAllContainerRequest description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("%@ %@"), v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;

  return (id)objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
}

- (BOOL)readFrom:(id)a3
{
  int *v4;
  int *v5;
  int *v6;
  int *v7;
  int v8;
  char v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v16;

  v4 = (int *)MEMORY[0x1E0D82BF0];
  v5 = (int *)MEMORY[0x1E0D82BD8];
  v6 = (int *)MEMORY[0x1E0D82BC8];
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (1)
  {
    v8 = *((unsigned __int8 *)a3 + *v6);
    if (*(_QWORD *)((char *)a3 + *v4) >= *(_QWORD *)((char *)a3 + *v5))
      return v8 == 0;
    if (*((_BYTE *)a3 + *v6))
    {
      v8 = 1;
      return v8 == 0;
    }
    v9 = 0;
    v10 = 0;
    v11 = 0;
    while (1)
    {
      v12 = *v4;
      v13 = *(_QWORD *)((char *)a3 + v12);
      if (v13 == -1 || v13 >= *(_QWORD *)((char *)a3 + *v5))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v7) + v13);
      *(_QWORD *)((char *)a3 + v12) = v13 + 1;
      v11 |= (unint64_t)(v14 & 0x7F) << v9;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v9 += 7;
      if (v10++ >= 9)
      {
        LOBYTE(v11) = 0;
        v8 = *((unsigned __int8 *)a3 + *v6);
        goto LABEL_14;
      }
    }
    *((_BYTE *)a3 + *v6) = 1;
LABEL_12:
    v8 = *((unsigned __int8 *)a3 + *v6);
    if (*((_BYTE *)a3 + *v6))
      LOBYTE(v11) = 0;
LABEL_14:
    if (v8)
      v16 = 1;
    else
      v16 = (v11 & 7) == 4;
    if (v16)
      return v8 == 0;
    if ((PBReaderSkipValueWithTag() & 1) == 0)
      return 0;
  }
}

- (unsigned)requestTypeCode
{
  return 88;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;

  v4 = (void *)objc_opt_class();
  v6 = (void *)objc_msgSend_allocWithZone_(v4, v5, (uint64_t)a3);
  return (id)objc_msgSend_init(v6, v7, v8);
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  uint64_t v4;
  const char *v5;
  char isMemberOfClass;

  v3 = a3;
  v4 = objc_opt_class();
  isMemberOfClass = objc_msgSend_isMemberOfClass_(v3, v5, v4);

  return isMemberOfClass;
}

- (unint64_t)hash
{
  return 0;
}

@end
