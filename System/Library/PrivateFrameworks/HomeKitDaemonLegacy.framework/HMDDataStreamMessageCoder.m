@implementation HMDDataStreamMessageCoder

+ (BOOL)_decryptEncryptedOPACKFrame:(id)a3 sessionEncryption:(id)a4 receivedHeader:(id *)a5 receivedPayload:(id *)a6 error:(id *)a7
{
  id v11;
  id v12;
  BOOL v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v21;

  v11 = a3;
  v12 = a4;
  if ((unint64_t)objc_msgSend(v11, "length") > 0x13)
  {
    v14 = objc_retainAutorelease(v11);
    v15 = objc_msgSend(v14, "bytes");
    v16 = objc_msgSend(v14, "length");
    v21 = 0;
    objc_msgSend(v12, "decrypt:length:additionalAuthData:additionalAuthDataLength:authTagData:authTagDataLength:error:", v15 + 4, v16 - 20, v15, 4, v15 + v16 - 16, 16, &v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v21;
    v19 = v18;
    if (v18)
    {
      v13 = 0;
      if (a7)
        *a7 = objc_retainAutorelease(v18);
    }
    else
    {
      v13 = +[HMDDataStreamMessageCoder _decodeOPACKFrame:receivedHeader:receivedPayload:error:](HMDDataStreamMessageCoder, "_decodeOPACKFrame:receivedHeader:receivedPayload:error:", v17, a5, a6, a7);
    }

  }
  else if (a7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 1050);
    v13 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (BOOL)_decodeOPACKFrame:(id)a3 receivedHeader:(id *)a4 receivedPayload:(id *)a5 error:(id *)a6
{
  id v9;
  unsigned __int8 *v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  void *v14;

  v9 = objc_retainAutorelease(a3);
  v10 = (unsigned __int8 *)objc_msgSend(v9, "bytes");
  v11 = objc_msgSend(v9, "length");

  if (v11 && v11 - 1 >= (unint64_t)*v10)
  {
    v13 = (void *)OPACKDecodeBytes();
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v14 = (void *)OPACKDecodeBytes();
      if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        if (a4)
          *a4 = objc_retainAutorelease(v13);
        if (a5)
          *a5 = objc_retainAutorelease(v14);
        v12 = 1;
      }
      else if (a6)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 1052);
        v12 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }

    }
    else if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 1052);
      v12 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }

  }
  else if (a6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 1050);
    v12 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    return 0;
  }
  return v12;
}

+ (BOOL)_unpackUnencryptedOPACKFrame:(id)a3 receivedHeader:(id *)a4 receivedPayload:(id *)a5 error:(id *)a6
{
  id v9;
  BOOL v10;
  void *v11;

  v9 = a3;
  if ((unint64_t)objc_msgSend(v9, "length") > 3)
  {
    objc_msgSend(v9, "subdataWithRange:", 4, objc_msgSend(v9, "length") - 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = +[HMDDataStreamMessageCoder _decodeOPACKFrame:receivedHeader:receivedPayload:error:](HMDDataStreamMessageCoder, "_decodeOPACKFrame:receivedHeader:receivedPayload:error:", v11, a4, a5, a6);

  }
  else if (a6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 1050);
    v10 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)_encodeOPACKHeader:(id)a3 payload:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  char v17;
  int v18;

  v7 = a4;
  v18 = 0;
  v8 = (void *)MEMORY[0x1D17B93B0](a3, 0, &v18);
  if (v18)
    v9 = 1;
  else
    v9 = v8 == 0;
  if (!v9)
  {
    v11 = MEMORY[0x1D17B93B0](v7, 0, &v18);
    v12 = (void *)v11;
    if (v18 || !v11)
    {
      if (a5)
      {
        HMErrorFromOSStatus();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
    }
    else
    {
      v13 = objc_msgSend(v8, "length");
      v14 = objc_msgSend(v12, "length");
      if (v13 < 0x100)
      {
        v17 = v13;
        objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", v13 + v14 + 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "appendBytes:length:", &v17, 1);
        objc_msgSend(v10, "appendData:", v8);
        objc_msgSend(v10, "appendData:", v12);
        goto LABEL_19;
      }
      if (a5)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 1052);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
        v10 = 0;
        *a5 = v15;
LABEL_19:

        goto LABEL_20;
      }
    }
    v10 = 0;
    goto LABEL_19;
  }
  if (a5)
  {
    HMErrorFromOSStatus();
    v10 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
LABEL_20:

  return v10;
}

+ (id)_encryptEncryptedOPACKHeader:(id)a3 payload:(id)a4 sessionEncryption:(id)a5 error:(id *)a6
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _BYTE v18[4];

  v9 = a5;
  +[HMDDataStreamMessageCoder _encodeOPACKHeader:payload:error:](HMDDataStreamMessageCoder, "_encodeOPACKHeader:payload:error:", a3, a4, a6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    goto LABEL_5;
  v12 = objc_msgSend(v10, "length");
  v13 = v12 + 20;
  if ((unint64_t)(v12 + 20) < 0x100000)
  {
    v18[0] = 1;
    v18[1] = BYTE2(v12);
    v18[2] = BYTE1(v12);
    v18[3] = v12;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v18, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "encrypt:additionalAuthenticatedData:", v11, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "appendBytes:length:", v18, 4);
    objc_msgSend(v14, "appendData:", v16);

    goto LABEL_7;
  }
  if (a6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 1052);
    v14 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_5:
    v14 = 0;
  }
LABEL_7:

  return v14;
}

+ (id)_buildUnencryptedOPACKHeader:(id)a3 payload:(id)a4 error:(id *)a5
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _BYTE v11[4];

  +[HMDDataStreamMessageCoder _encodeOPACKHeader:payload:error:](HMDDataStreamMessageCoder, "_encodeOPACKHeader:payload:error:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    goto LABEL_5;
  v8 = objc_msgSend(v6, "length");
  if ((unint64_t)(v8 + 4) < 0x100000)
  {
    v11[0] = 3;
    v11[1] = BYTE2(v8);
    v11[2] = BYTE1(v8);
    v11[3] = v8;
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendBytes:length:", v11, 4);
    objc_msgSend(v9, "appendData:", v7);
    goto LABEL_7;
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 1052);
    v9 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_5:
    v9 = 0;
  }
LABEL_7:

  return v9;
}

+ (BOOL)decryptEncryptedOPACKFrame:(id)a3 sessionEncryption:(id)a4 receivedHeader:(id *)a5 receivedPayload:(id *)a6 error:(id *)a7
{
  return +[HMDDataStreamMessageCoder _decryptEncryptedOPACKFrame:sessionEncryption:receivedHeader:receivedPayload:error:](HMDDataStreamMessageCoder, "_decryptEncryptedOPACKFrame:sessionEncryption:receivedHeader:receivedPayload:error:", a3, a4, a5, a6, a7);
}

+ (id)encryptEncryptedOPACKHeader:(id)a3 payload:(id)a4 sessionEncryption:(id)a5 error:(id *)a6
{
  return +[HMDDataStreamMessageCoder _encryptEncryptedOPACKHeader:payload:sessionEncryption:error:](HMDDataStreamMessageCoder, "_encryptEncryptedOPACKHeader:payload:sessionEncryption:error:", a3, a4, a5, a6);
}

+ (BOOL)unpackUnencryptedOPACKFrame:(id)a3 receivedHeader:(id *)a4 receivedPayload:(id *)a5 error:(id *)a6
{
  return +[HMDDataStreamMessageCoder _unpackUnencryptedOPACKFrame:receivedHeader:receivedPayload:error:](HMDDataStreamMessageCoder, "_unpackUnencryptedOPACKFrame:receivedHeader:receivedPayload:error:", a3, a4, a5, a6);
}

+ (id)buildUnencryptedOPACKHeader:(id)a3 payload:(id)a4 error:(id *)a5
{
  return +[HMDDataStreamMessageCoder _buildUnencryptedOPACKHeader:payload:error:](HMDDataStreamMessageCoder, "_buildUnencryptedOPACKHeader:payload:error:", a3, a4, a5);
}

+ (BOOL)readHeaderFromPartialData:(id)a3 frameType:(unsigned __int8 *)a4 payloadLength:(unint64_t *)a5
{
  BOOL v8;
  NSObject *subrange;
  dispatch_data_t v10;
  size_t v12;
  void *buffer_ptr;

  if (dispatch_data_get_size((dispatch_data_t)a3) < 4)
    return 0;
  subrange = dispatch_data_create_subrange((dispatch_data_t)a3, 0, 4uLL);
  v12 = 0;
  buffer_ptr = 0;
  v10 = dispatch_data_create_map(subrange, (const void **)&buffer_ptr, &v12);

  v8 = v10 != 0;
  if (v10)
  {
    if (a4)
      *a4 = *(_BYTE *)buffer_ptr;
    if (a5)
      *a5 = ((unint64_t)*((unsigned __int8 *)buffer_ptr + 1) << 16) | ((unint64_t)*((unsigned __int8 *)buffer_ptr
                                                                                                + 2) << 8) | *((unsigned __int8 *)buffer_ptr + 3);
  }

  return v8;
}

+ (BOOL)readHeaderFromPartialData:(const char *)a3 length:(unint64_t)a4 frameType:(unsigned __int8 *)a5 payloadLength:(unint64_t *)a6
{
  if (a4 >= 4)
  {
    if (a5)
      *a5 = *a3;
    if (a6)
      *a6 = ((unint64_t)*((unsigned __int8 *)a3 + 1) << 16) | ((unint64_t)*((unsigned __int8 *)a3 + 2) << 8) | *((unsigned __int8 *)a3 + 3);
  }
  return a4 > 3;
}

+ (id)eventHeaderForProtocol:(id)a3 topic:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("protocol");
  v10[1] = CFSTR("event");
  v11[0] = a3;
  v11[1] = a4;
  v5 = (void *)MEMORY[0x1E0C99D80];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)requestHeaderForProtocol:(id)a3 topic:(id)a4 identifier:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("protocol");
  v13[1] = CFSTR("request");
  v14[0] = a3;
  v14[1] = a4;
  v13[2] = CFSTR("id");
  v14[2] = a5;
  v7 = (void *)MEMORY[0x1E0C99D80];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)responseHeaderForRequestHeader:(id)a3 status:(unsigned __int16)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  _QWORD v13[5];

  v4 = a4;
  v13[4] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("protocol");
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("protocol"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v12[1] = CFSTR("response");
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("request"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v7;
  v12[2] = CFSTR("id");
  objc_msgSend(v5, "objectForKeyedSubscript:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v13[2] = v8;
  v12[3] = CFSTR("status");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
