@implementation CRComponentBase

- (CRComponentBase)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRComponentBase;
  return -[CRComponentBase init](&v3, sel_init);
}

+ (id)sharedSingleton
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_21452A97C;
  block[3] = &unk_24D1AA2E8;
  block[4] = a1;
  if (qword_253E797E0 != -1)
    dispatch_once(&qword_253E797E0, block);
  return (id)qword_253E79830;
}

- (void)challengeComponentWith:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, _QWORD, _QWORD, _QWORD))a4 + 2))(a4, 0, 0, 0);
}

- (unsigned)CRCreateECDSADerData:(id)a3 responseDer:(id *)a4
{
  const __CFData *v4;
  uint64_t v5;
  uint64_t v6;
  const UInt8 *BytePtr;
  unsigned int Length;
  uint64_t v9;
  char *v10;
  char *v11;
  const __CFData *v12;
  uint64_t v13;
  const UInt8 *v14;
  _BYTE *v15;
  char v16;
  uint64_t v17;
  _BYTE *v18;
  const UInt8 *v19;
  char v20;
  uint64_t v21;
  const UInt8 *v22;
  _BYTE *v23;
  char v24;
  uint64_t v25;
  const UInt8 *v26;
  _BYTE *v27;
  char v28;
  NSObject *v30;
  NSObject *v31;

  v4 = (const __CFData *)a3;
  v5 = DEREncoderCreate();
  if (!v5)
  {
    handleForCategory(0);
    v30 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v6 = 0;
LABEL_48:
      v11 = 0;
      v10 = 0;
      goto LABEL_58;
    }
    sub_21456B32C();
LABEL_65:
    v6 = 0;
    v11 = 0;
    v10 = 0;
    goto LABEL_58;
  }
  v6 = DEREncoderCreate();
  if (!v6)
  {
    handleForCategory(0);
    v30 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      goto LABEL_48;
    sub_21456B358();
    goto LABEL_65;
  }
  BytePtr = CFDataGetBytePtr(v4);
  Length = CFDataGetLength(v4);
  v9 = Length >> 1;
  v10 = (char *)malloc_type_malloc((v9 + 1), 0x100004077774924uLL);
  v11 = (char *)malloc_type_malloc((v9 + 1), 0x100004077774924uLL);
  bzero(v11, (v9 + 1));
  bzero(v10, (v9 + 1));
  if (*(char *)BytePtr < 0)
  {
    v12 = v4;
    if (Length >= 2)
    {
      if (v9 <= 1)
        v17 = 1;
      else
        v17 = v9;
      v18 = v10 + 1;
      v19 = BytePtr;
      do
      {
        v20 = *v19++;
        *v18++ = v20;
        --v17;
      }
      while (v17);
    }
  }
  else
  {
    v12 = v4;
    if (Length >= 2)
    {
      if (v9 <= 1)
        v13 = 1;
      else
        v13 = v9;
      v14 = BytePtr;
      v15 = v10;
      do
      {
        v16 = *v14++;
        *v15++ = v16;
        --v13;
      }
      while (v13);
    }
  }
  if ((char)BytePtr[v9] < 0)
  {
    if (Length >= 2)
    {
      if (v9 <= 1)
        v25 = 1;
      else
        v25 = v9;
      v26 = &BytePtr[v9];
      v27 = v11 + 1;
      do
      {
        v28 = *v26++;
        *v27++ = v28;
        --v25;
      }
      while (v25);
    }
  }
  else if (Length >= 2)
  {
    if (v9 <= 1)
      v21 = 1;
    else
      v21 = v9;
    v22 = &BytePtr[v9];
    v23 = v11;
    do
    {
      v24 = *v22++;
      *v23++ = v24;
      --v21;
    }
    while (v21);
  }
  if (DEREncoderAddData())
  {
    handleForCategory(0);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      sub_214566E74();
    v4 = v12;
  }
  else if (DEREncoderAddData())
  {
    handleForCategory(0);
    v30 = objc_claimAutoreleasedReturnValue();
    v4 = v12;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      sub_214566E74();
  }
  else
  {
    v4 = v12;
    if (DEREncoderAddSequenceFromEncoder())
    {
      handleForCategory(0);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        sub_21456B408();
    }
    else
    {
      if (!DEREncoderCreateEncodedBuffer())
      {
        handleForCategory(0);
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          sub_21456B384();
        goto LABEL_60;
      }
      handleForCategory(0);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        sub_21456B3DC();
    }
  }
LABEL_58:

  handleForCategory(0);
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    sub_21456B2AC(v31);
LABEL_60:

  if (v5)
    DEREncoderDestroy();
  if (v6)
    DEREncoderDestroy();
  if (v10)
    free(v10);
  if (v11)
    free(v11);

  return 3;
}

- (id)sha256:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  CC_LONG v11;
  void *v12;
  const char *v13;
  unsigned __int8 md[32];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = objc_retainAutorelease(a3);
  v7 = (const void *)objc_msgSend_bytes(v3, v4, v5, v6);
  v11 = objc_msgSend_length(v3, v8, v9, v10);

  v12 = CC_SHA256(v7, v11, md);
  if (v12)
  {
    objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v13, (uint64_t)md, 32);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v12;
}

- (NSString)identifierBase64
{
  return self->identifierBase64;
}

- (void)setIdentifierBase64:(id)a3
{
  objc_storeStrong((id *)&self->identifierBase64, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->identifierBase64, 0);
}

@end
