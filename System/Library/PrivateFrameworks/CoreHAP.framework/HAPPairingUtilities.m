@implementation HAPPairingUtilities

+ (id)createAddPairingRequestForPairingIdentity:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t appended;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v16;

  v5 = a3;
  TLV8BufferInit();
  appended = appendRequestMethodAndState();
  if ((_DWORD)appended)
    goto LABEL_6;
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataUsingEncoding:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    appended = 4294960568;
LABEL_14:

    goto LABEL_6;
  }
  v9 = objc_retainAutorelease(v8);
  objc_msgSend(v9, "bytes");
  objc_msgSend(v9, "length");
  v10 = TLV8BufferAppend();
  if ((_DWORD)v10)
  {
    appended = v10;
    goto LABEL_14;
  }

  objc_msgSend(v5, "publicKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "data");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v12, "bytes");
  objc_msgSend(v11, "data");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "length");
  appended = TLV8BufferAppend();

  if (!(_DWORD)appended)
  {
    objc_msgSend(v5, "permissions");
    appended = TLV8BufferAppendUInt64();
    if (!(_DWORD)appended)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", 0, 0);
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v14 = (void *)v16;
        TLV8BufferFree();
        goto LABEL_9;
      }
      appended = 4294960568;
    }
  }
LABEL_6:
  TLV8BufferFree();
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithOSStatus:", appended);
    v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
LABEL_9:

  return v14;
}

+ (BOOL)parseAddPairingResponse:(id)a3 error:(id *)a4
{
  uint64_t v5;
  int v6;

  v5 = verifyResponseStateAndError(a3);
  v6 = v5;
  if (a4 && (_DWORD)v5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithOSStatus:", v5);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6 == 0;
}

+ (id)createRemovePairingRequestForPairingIdentity:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t appended;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a3;
  TLV8BufferInit();
  appended = appendRequestMethodAndState();
  if ((_DWORD)appended)
    goto LABEL_2;
  objc_msgSend(v5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataUsingEncoding:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    appended = 4294960568;
LABEL_12:

    goto LABEL_2;
  }
  v10 = objc_retainAutorelease(v9);
  objc_msgSend(v10, "bytes");
  objc_msgSend(v10, "length");
  v11 = TLV8BufferAppend();
  if ((_DWORD)v11)
  {
    appended = v11;
    goto LABEL_12;
  }

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", 0, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v7 = (void *)v12;
    TLV8BufferFree();
    goto LABEL_9;
  }
  appended = 4294960568;
LABEL_2:
  TLV8BufferFree();
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithOSStatus:", appended);
    v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
LABEL_9:

  return v7;
}

+ (BOOL)parseRemovePairingResponse:(id)a3 error:(id *)a4
{
  uint64_t v5;
  int v6;

  v5 = verifyResponseStateAndError(a3);
  v6 = v5;
  if (a4 && (_DWORD)v5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithOSStatus:", v5);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6 == 0;
}

+ (id)createListPairingsRequest:(id *)a3
{
  uint64_t appended;
  uint64_t v6;
  void *v7;

  TLV8BufferInit();
  appended = appendRequestMethodAndState();
  if (!(_DWORD)appended)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", 0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      TLV8BufferFree();
      return v7;
    }
    appended = 4294960568;
  }
  TLV8BufferFree();
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithOSStatus:", appended);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

+ (id)parseListPairingsResponse:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v5 = objc_retainAutorelease(a3);
  objc_msgSend(v5, "bytes");
  objc_msgSend(v5, "length");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = verifyResponseStateAndError(v5);
  if ((_DWORD)v7)
  {
    if (a4)
    {
LABEL_3:
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithOSStatus:", v7);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v8 = TLV8GetOrCopyCoalesced();
    if ((_DWORD)v8)
    {
      v7 = v8;
      v15 = 0;
      v11 = 0;
    }
    else
    {
      v9 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", 0, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v9, "initWithData:encoding:", v10, 4);

      if (v11)
      {
        v12 = TLV8GetOrCopyCoalesced();
        if ((_DWORD)v12)
        {
          v7 = v12;
          v15 = 0;
        }
        else
        {
          v13 = objc_alloc(MEMORY[0x1E0D28658]);
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", 0, 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)objc_msgSend(v13, "initWithPairingKeyData:", v14);

          if (v15)
          {
            v16 = TLV8Get();
            if ((_DWORD)v16)
              v7 = v16;
            else
              v7 = 4294960553;
          }
          else
          {
            v7 = 4294960596;
          }
        }
      }
      else
      {
        v15 = 0;
        v7 = 4294960568;
      }
    }

    if (a4)
      goto LABEL_3;
  }

  return 0;
}

@end
