@implementation IDSStunMessage

- (IDSStunMessage)initWithType:(int64_t)a3
{
  IDSStunMessage *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IDSStunMessage;
  result = -[IDSStunMessage init](&v5, sel_init);
  if (result)
    result->_type = a3;
  return result;
}

- (void)dealloc
{
  _CCCryptor *cryptorRef;
  objc_super v4;

  cryptorRef = self->_cryptorRef;
  if (cryptorRef)
    CCCryptorRelease(cryptorRef);
  v4.receiver = self;
  v4.super_class = (Class)IDSStunMessage;
  -[IDSStunMessage dealloc](&v4, sel_dealloc);
}

- (id)description
{
  double v2;

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("[%04x/%uB/%@]"), v2, LOWORD(self->_type), self->_len, self->_requestID);
}

- (BOOL)addAttribute:(IDSStunAttribute *)a3
{
  double v3;
  int *p_numAttribute;
  int numAttribute;
  NSObject *v7;

  if (!a3)
    return 0;
  p_numAttribute = &self->_numAttribute;
  numAttribute = self->_numAttribute;
  if (numAttribute < 19)
  {
    memcpy(&self->_attributes[numAttribute], a3, sizeof(self->_attributes[numAttribute]));
    ++*p_numAttribute;
    return 1;
  }
  else
  {
    objc_msgSend_Stun(IDSFoundationLog, a2, (uint64_t)a3, v3);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_19BAF49F4(&a3->type, v7);

    return 0;
  }
}

- (BOOL)hasAttribute:(int64_t)a3
{
  unint64_t numAttribute;
  IDSStunAttribute *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t type;

  numAttribute = self->_numAttribute;
  if ((int)numAttribute < 1)
    return 0;
  if (self->_attributes[0].type == a3)
    return 1;
  v5 = &self->_attributes[1];
  v6 = 1;
  do
  {
    v7 = v6;
    if (numAttribute == v6)
      break;
    type = v5->type;
    ++v6;
    ++v5;
  }
  while (type != a3);
  return v7 < numAttribute;
}

- (BOOL)getAttribute:(int64_t)a3 attribute:(IDSStunAttribute *)a4
{
  unint64_t numAttribute;
  IDSStunAttribute *attributes;
  BOOL v6;
  unint64_t v7;
  IDSStunAttribute *v8;
  uint64_t type;

  numAttribute = self->_numAttribute;
  if ((int)numAttribute < 1)
    return 0;
  attributes = self->_attributes;
  if (self->_attributes[0].type != a3)
  {
    v7 = 0;
    v8 = &self->_attributes[1];
    while (numAttribute - 1 != v7)
    {
      type = v8->type;
      ++v8;
      ++v7;
      if (type == a3)
      {
        v6 = v7 < numAttribute;
        attributes = v8 - 1;
        goto LABEL_8;
      }
    }
    return 0;
  }
  v6 = 1;
LABEL_8:
  memcpy(a4, attributes, sizeof(IDSStunAttribute));
  return v6;
}

- (BOOL)stunRequestToBuffer:(char *)a3 outputLength:(int *)a4 transactionID:(char *)a5 reqCount:(int)a6 userName:(char *)a7 usernameLen:(int)a8 sendTime:(unsigned __int16)a9 keyData:(id)a10 remainingLength:(unint64_t)a11
{
  const char *v18;
  uint64_t v19;
  id v20;
  double v21;
  BOOL v22;
  BOOL v23;
  char v24;
  NSObject *v25;
  void *v26;
  const char *v27;
  double v28;
  const char *v29;
  double v30;
  const char *v31;
  double v32;
  const char *v33;
  double v34;
  const char *v35;
  double v36;
  const char *v37;
  double v38;
  _QWORD v40[188];

  v40[186] = *MEMORY[0x1E0C80C00];
  v20 = a10;
  if (a3)
    v22 = a4 == 0;
  else
    v22 = 1;
  v23 = v22 || a11 == 0;
  v24 = v23;
  if (v23)
  {
    objc_msgSend_Stun(IDSFoundationLog, v18, v19, v21);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v40[0]) = 134218496;
      *(_QWORD *)((char *)v40 + 4) = a3;
      WORD2(v40[1]) = 2048;
      *(_QWORD *)((char *)&v40[1] + 6) = a4;
      HIWORD(v40[2]) = 2048;
      v40[3] = a11;
      _os_log_error_impl(&dword_19B949000, v25, OS_LOG_TYPE_ERROR, "refreshRequestToBuffer - invalid parameter outputBuffer: %p, outputLength: %p, remainingLength: %zd", (uint8_t *)v40, 0x20u);
    }

  }
  else
  {
    if (a5)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v18, (uint64_t)a5, v21, 12);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setTransactionID_(self, v27, (uint64_t)v26, v28);

    }
    else
    {
      objc_msgSend_setTransactionID_(self, v18, 0, v21);
    }
    if (a6 >= 1)
    {
      memset(v40, 170, 0x5D0uLL);
      LODWORD(v40[0]) = 262181;
      LODWORD(v40[1]) = a6;
      objc_msgSend_addAttribute_(self, v31, (uint64_t)v40, v32);
    }
    if (a7 && a8 >= 1)
    {
      memset(v40, 170, 0x5D0uLL);
      LOWORD(v40[0]) = 6;
      WORD1(v40[0]) = a8;
      LODWORD(v40[1]) = a8;
      __memcpy_chk();
      objc_msgSend_addAttribute_(self, v33, (uint64_t)v40, v34);
    }
    if (a9)
    {
      memset(v40, 170, 0x5D0uLL);
      LODWORD(v40[0]) = 294917;
      LODWORD(v40[1]) = 4;
      BYTE4(v40[1]) = HIBYTE(a9);
      BYTE5(v40[1]) = a9;
      HIWORD(v40[1]) = 0;
      objc_msgSend_addAttribute_(self, v35, (uint64_t)v40, v36);
    }
    if (v20)
    {
      objc_msgSend_setKey_(self, v29, (uint64_t)v20, v30);
      memset(v40, 170, 0x5D0uLL);
      LODWORD(v40[0]) = 1310728;
      LODWORD(v40[1]) = 20;
      objc_msgSend_addAttribute_(self, v37, (uint64_t)v40, v38);
    }
    objc_msgSend_write_outputLength_remainingLength_(self, v29, (uint64_t)a3, v30, a4, a11);
  }

  return v24 ^ 1;
}

- (BOOL)stunResponseToBuffer:(char *)a3 outputLength:(int *)a4 transactionID:(id)a5 reqCount:(int)a6 echoTime:(unsigned __int16)a7 delay:(unsigned __int16)a8 keyData:(id)a9 remainingLength:(unint64_t)a10
{
  int v11;
  const char *v17;
  uint64_t v18;
  id v19;
  double v20;
  BOOL v21;
  BOOL v22;
  char v23;
  NSObject *v24;
  const char *v25;
  double v26;
  const char *v27;
  double v28;
  const char *v29;
  double v30;
  const char *v31;
  double v32;
  _QWORD v34[188];

  v11 = a7;
  v34[186] = *MEMORY[0x1E0C80C00];
  v19 = a9;
  if (a3)
    v21 = a4 == 0;
  else
    v21 = 1;
  v22 = v21 || a10 == 0;
  v23 = v22;
  if (v22)
  {
    objc_msgSend_Stun(IDSFoundationLog, v17, v18, v20);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v34[0]) = 134218496;
      *(_QWORD *)((char *)v34 + 4) = a3;
      WORD2(v34[1]) = 2048;
      *(_QWORD *)((char *)&v34[1] + 6) = a4;
      HIWORD(v34[2]) = 2048;
      v34[3] = a10;
      _os_log_error_impl(&dword_19B949000, v24, OS_LOG_TYPE_ERROR, "refreshRequestToBuffer - invalid parameter: outputBuffer: %p, outputLength: %p, remainingLength: %zd", (uint8_t *)v34, 0x20u);
    }

  }
  else
  {
    objc_msgSend_setTransactionID_(self, v17, (uint64_t)a5, v20);
    if (a6 >= 1)
    {
      memset(v34, 170, 0x5D0uLL);
      LODWORD(v34[0]) = 262181;
      LODWORD(v34[1]) = a6;
      objc_msgSend_addAttribute_(self, v27, (uint64_t)v34, v28);
    }
    if (v11)
    {
      memset(v34, 170, 0x5D0uLL);
      LODWORD(v34[0]) = 294917;
      LODWORD(v34[1]) = 4;
      BYTE4(v34[1]) = BYTE1(v11);
      BYTE5(v34[1]) = v11;
      BYTE6(v34[1]) = HIBYTE(a8);
      HIBYTE(v34[1]) = a8;
      objc_msgSend_addAttribute_(self, v29, (uint64_t)v34, v30);
    }
    if (v19)
    {
      objc_msgSend_setKey_(self, v25, (uint64_t)v19, v26);
      memset(v34, 170, 0x5D0uLL);
      LODWORD(v34[0]) = 1310728;
      LODWORD(v34[1]) = 20;
      objc_msgSend_addAttribute_(self, v31, (uint64_t)v34, v32);
    }
    objc_msgSend_write_outputLength_remainingLength_(self, v25, (uint64_t)a3, v26, a4, a10);
  }

  return v23 ^ 1;
}

- (BOOL)dataIndicationToBuffer:(char *)a3 outputLength:(int *)a4 data:(char *)a5 dataLen:(int)a6 keyData:(id)a7 remainingLength:(unint64_t)a8
{
  const char *v14;
  uint64_t v15;
  id v16;
  double v17;
  BOOL v18;
  BOOL v20;
  BOOL v21;
  const char *v22;
  double v23;
  const char *v24;
  double v25;
  const char *v26;
  double v27;
  NSObject *v28;
  _DWORD v30[372];
  _QWORD __b[188];

  __b[187] = *MEMORY[0x1E0C80C00];
  v16 = a7;
  if (a3)
    v18 = a4 == 0;
  else
    v18 = 1;
  v20 = v18 || a5 == 0 || a6 <= 0;
  v21 = !v20;
  if (v20)
  {
    objc_msgSend_Stun(IDSFoundationLog, v14, v15, v17);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      LODWORD(__b[0]) = 134218496;
      *(_QWORD *)((char *)__b + 4) = a3;
      WORD2(__b[1]) = 2048;
      *(_QWORD *)((char *)&__b[1] + 6) = a4;
      HIWORD(__b[2]) = 2048;
      __b[3] = a8;
      _os_log_error_impl(&dword_19B949000, v28, OS_LOG_TYPE_ERROR, "failed to create data indication with invalid parameter, outputBuffer: %p, outputLength: %p, remainingLength: %zd", (uint8_t *)__b, 0x20u);
    }

  }
  else
  {
    objc_msgSend_setTransactionID_(self, v14, 0, v17);
    memset(__b, 170, 0x5D0uLL);
    LOWORD(__b[0]) = 19;
    WORD1(__b[0]) = a6;
    LODWORD(__b[1]) = a6;
    __memcpy_chk();
    objc_msgSend_addAttribute_(self, v22, (uint64_t)__b, v23);
    if (v16)
    {
      objc_msgSend_setKey_(self, v24, (uint64_t)v16, v25);
      memset(v30, 170, sizeof(v30));
      v30[0] = 1310728;
      v30[2] = 20;
      objc_msgSend_addAttribute_(self, v26, (uint64_t)v30, v27);
    }
    objc_msgSend_write_outputLength_remainingLength_(self, v24, (uint64_t)a3, v25, a4, a8);
  }

  return v21;
}

- (void)_addUInt8Attribute:(int64_t)a3 value:(unsigned __int8)a4
{
  __int16 v5;
  const char *v7;
  double v8;
  _WORD __b[744];
  uint64_t v10;

  v5 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  memset(__b, 170, sizeof(__b));
  __b[0] = v5;
  __b[1] = 1;
  LOBYTE(__b[4]) = a4;
  objc_msgSend_addAttribute_(self, v7, (uint64_t)__b, v8);
}

- (void)_addUInt16Attribute:(int64_t)a3 value:(unsigned __int16)a4
{
  __int16 v5;
  const char *v7;
  double v8;
  _WORD __b[744];
  uint64_t v10;

  v5 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  memset(__b, 170, sizeof(__b));
  __b[0] = v5;
  __b[1] = 2;
  __b[4] = a4;
  objc_msgSend_addAttribute_(self, v7, (uint64_t)__b, v8);
}

- (void)_addUInt32Attribute:(int64_t)a3 value:(unsigned int)a4
{
  __int16 v5;
  const char *v7;
  double v8;
  _DWORD __b[372];
  uint64_t v10;

  v5 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  memset(__b, 170, sizeof(__b));
  LOWORD(__b[0]) = v5;
  HIWORD(__b[0]) = 4;
  __b[2] = a4;
  objc_msgSend_addAttribute_(self, v7, (uint64_t)__b, v8);
}

- (void)_addUInt64Attribute:(int64_t)a3 value:(unint64_t)a4
{
  __int16 v5;
  const char *v7;
  double v8;
  _QWORD __b[187];

  v5 = a3;
  __b[186] = *MEMORY[0x1E0C80C00];
  memset(__b, 170, 0x5D0uLL);
  LOWORD(__b[0]) = v5;
  WORD1(__b[0]) = 8;
  __b[1] = a4;
  objc_msgSend_addAttribute_(self, v7, (uint64_t)__b, v8);
}

- (void)_addBinaryDataAttribute:(int64_t)a3 value:(id)a4
{
  __int16 v4;
  id v6;
  const char *v7;
  uint64_t v8;
  double v9;
  unint64_t v10;
  const char *v11;
  uint64_t v12;
  double v13;
  unint64_t v14;
  NSObject *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  double v19;
  const char *v20;
  double v21;
  int v22;
  unint64_t v23;
  __int16 v24;
  uint64_t v25;
  _DWORD __b[372];
  uint64_t v27;

  v4 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      memset(__b, 170, sizeof(__b));
      v10 = objc_msgSend_length(v6, v7, v8, v9);
      v14 = v10;
      if (v10 < 0x5C1)
      {
        LOWORD(__b[0]) = v4;
        HIWORD(__b[0]) = v10;
        BYTE2(__b[1]) = 0;
        __b[2] = v10;
        v16 = objc_retainAutorelease(v6);
        objc_msgSend_bytes(v16, v17, v18, v19);
        __memcpy_chk();
        objc_msgSend_addAttribute_(self, v20, (uint64_t)__b, v21);
      }
      else
      {
        objc_msgSend_Stun(IDSFoundationLog, v11, v12, v13);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v22 = 134218240;
          v23 = v14;
          v24 = 2048;
          v25 = 1472;
          _os_log_impl(&dword_19B949000, v15, OS_LOG_TYPE_DEFAULT, "_addBinaryDataAttribute: len %lu > sizeof(attr.value.binaryData.data) %lu", (uint8_t *)&v22, 0x16u);
        }

      }
    }
  }

}

- (void)_addUUIDAttribute:(int64_t)a3 value:(id)a4
{
  __int16 v4;
  id v6;
  id v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  const char *v13;
  __int128 v14;
  _DWORD __b[372];
  uint64_t v16;

  v4 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      memset(__b, 170, sizeof(__b));
      v7 = objc_alloc(MEMORY[0x1E0CB3A28]);
      v10 = (void *)objc_msgSend_initWithUUIDString_(v7, v8, (uint64_t)v6, v9);
      *(_QWORD *)&v14 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
      objc_msgSend_getUUIDBytes_(v10, v11, (uint64_t)&v14, v12);
      LOWORD(__b[0]) = v4;
      HIWORD(__b[0]) = 16;
      __b[2] = 16;
      *(_OWORD *)&__b[3] = v14;
      objc_msgSend_addAttribute_(self, v13, (uint64_t)__b, *(double *)&v14);

    }
  }

}

- (void)_addXORAddressAttribute:(int64_t)a3 value:(sockaddr *)a4
{
  int sa_family;
  __int16 v6;
  const char *v8;
  double v9;
  _WORD __b[744];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    sa_family = a4->sa_family;
    if (sa_family == 30 || sa_family == 2)
    {
      v6 = a3;
      memset(__b, 170, sizeof(__b));
      __b[0] = v6;
      __b[1] = 128;
      __memcpy_chk();
      objc_msgSend_addAttribute_(self, v8, (uint64_t)__b, v9);
    }
  }
}

- (void)setTransactionID:(id)a3
{
  id v4;
  CCRNGStatus v5;
  const char *v6;
  uint64_t v7;
  double v8;
  CCRNGStatus v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  double v17;
  const char *v18;
  uint64_t v19;
  double v20;
  const char *v21;
  NSObject *v22;
  double v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  double v27;
  NSString *v28;
  NSString *requestID;
  const char *v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  _BYTE bytes[12];
  __int16 v35;
  uint64_t v36;
  uint8_t buf[4];
  CCRNGStatus v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    memset(bytes, 170, sizeof(bytes));
    v5 = CCRandomGenerateBytes(bytes, 0xCuLL);
    if (v5)
    {
      v9 = v5;
      objc_msgSend_Stun(IDSFoundationLog, v6, v7, v8);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v38 = v9;
        _os_log_impl(&dword_19B949000, v10, OS_LOG_TYPE_DEFAULT, "CCRandomGenerateBytes failed (%d), use arc4random_buf.", buf, 8u);
      }

      arc4random_buf(bytes, 0xCuLL);
    }
    objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v6, (uint64_t)bytes, v8, 12);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)&self->_transactionID, v4);
  v14 = objc_msgSend_bytes(self->_transactionID, v11, v12, v13);
  if (objc_msgSend_length(self->_transactionID, v15, v16, v17) == 12)
  {
    objc_msgSend_stringWithCapacity_(MEMORY[0x1E0CB37A0], v18, 24, v20);
    v22 = objc_claimAutoreleasedReturnValue();
    v24 = 0;
    do
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v21, (uint64_t)CFSTR("%02X"), v23, *(unsigned __int8 *)(v14 + v24));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_appendString_(v22, v26, (uint64_t)v25, v27);

      ++v24;
    }
    while ((_DWORD)v24 != 12);
    objc_msgSend_stringWithString_(MEMORY[0x1E0CB3940], v21, (uint64_t)v22, v23);
    v28 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestID = self->_requestID;
    self->_requestID = v28;

  }
  else
  {
    objc_msgSend_Stun(IDSFoundationLog, v18, v19, v20);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v33 = objc_msgSend_length(self->_transactionID, v30, v31, v32);
      *(_DWORD *)bytes = 134218240;
      *(_QWORD *)&bytes[4] = v33;
      v35 = 2048;
      v36 = 12;
      _os_log_impl(&dword_19B949000, v22, OS_LOG_TYPE_DEFAULT, "ERROR: TransactionID length = %lu, mismatch STUN_TRANSACTIONID_LEN = %ld", bytes, 0x16u);
    }
  }

}

- (void)setAttributes:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  int v14;
  const char *v15;
  double v16;
  void *v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  double v23;
  NSObject *v24;
  const char *v25;
  double v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  double v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  double v34;
  NSObject *v35;
  const char *v36;
  double v37;
  id v38;
  const char *v39;
  double v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  void *v47;
  const char *v48;
  double v49;
  const char *v50;
  uint64_t v51;
  double v52;
  int v53;
  const char *v54;
  double v55;
  const char *v56;
  double v57;
  const char *v58;
  double v59;
  const char *v60;
  uint64_t v61;
  double v62;
  uint64_t v63;
  const char *v64;
  double v65;
  const char *v66;
  double v67;
  const char *v68;
  double v69;
  const char *v70;
  double v71;
  const char *v72;
  double v73;
  const char *v74;
  uint64_t v75;
  double v76;
  uint64_t v77;
  const char *v78;
  double v79;
  const char *v80;
  uint64_t v81;
  double v82;
  unsigned __int8 v83;
  const char *v84;
  double v85;
  const char *v86;
  double v87;
  const char *v88;
  double v89;
  const char *v90;
  uint64_t v91;
  double v92;
  uint64_t v93;
  const char *v94;
  double v95;
  const char *v96;
  uint64_t v97;
  double v98;
  uint64_t v99;
  const char *v100;
  double v101;
  const char *v102;
  uint64_t v103;
  double v104;
  uint64_t v105;
  const char *v106;
  double v107;
  const char *v108;
  uint64_t v109;
  double v110;
  uint64_t v111;
  const char *v112;
  double v113;
  const char *v114;
  double v115;
  const char *v116;
  double v117;
  const char *v118;
  double v119;
  id v120;
  const char *v121;
  uint64_t v122;
  double v123;
  uint64_t v124;
  const char *v125;
  double v126;
  const char *v127;
  uint64_t v128;
  double v129;
  unsigned __int8 v130;
  const char *v131;
  double v132;
  const char *v133;
  uint64_t v134;
  double v135;
  uint64_t v136;
  const char *v137;
  double v138;
  const char *v139;
  uint64_t v140;
  double v141;
  uint64_t v142;
  const char *v143;
  double v144;
  const char *v145;
  uint64_t v146;
  double v147;
  uint64_t v148;
  const char *v149;
  double v150;
  const char *v151;
  uint64_t v152;
  double v153;
  unsigned __int16 v154;
  const char *v155;
  double v156;
  const char *v157;
  uint64_t v158;
  double v159;
  uint64_t v160;
  const char *v161;
  double v162;
  const char *v163;
  uint64_t v164;
  double v165;
  uint64_t v166;
  const char *v167;
  double v168;
  const char *v169;
  uint64_t v170;
  double v171;
  uint64_t v172;
  const char *v173;
  double v174;
  const char *v175;
  uint64_t v176;
  double v177;
  unsigned __int16 v178;
  const char *v179;
  double v180;
  const char *v181;
  uint64_t v182;
  double v183;
  unsigned __int16 v184;
  const char *v185;
  double v186;
  const char *v187;
  double v188;
  const char *v189;
  uint64_t v190;
  double v191;
  uint64_t v192;
  const char *v193;
  double v194;
  const char *v195;
  uint64_t v196;
  double v197;
  uint64_t v198;
  const char *v199;
  double v200;
  const char *v201;
  uint64_t v202;
  double v203;
  uint64_t v204;
  const char *v205;
  double v206;
  const char *v207;
  uint64_t v208;
  double v209;
  uint64_t v210;
  const char *v211;
  double v212;
  const char *v213;
  uint64_t v214;
  double v215;
  unsigned __int16 v216;
  const char *v217;
  double v218;
  const char *v219;
  double v220;
  const char *v221;
  double v222;
  const char *v223;
  double v224;
  const char *v225;
  uint64_t v226;
  double v227;
  unsigned __int8 v228;
  const char *v229;
  double v230;
  const char *v231;
  double v232;
  const char *v233;
  double v234;
  const char *v235;
  uint64_t v236;
  double v237;
  uint64_t v238;
  const char *v239;
  double v240;
  const char *v241;
  uint64_t v242;
  double v243;
  uint64_t v244;
  const char *v245;
  double v246;
  const char *v247;
  double v248;
  const char *v249;
  double v250;
  void *v251;
  const char *v252;
  double v253;
  void *v254;
  NSObject *oslog;
  BOOL *p_requiresAES128CTR;
  void *v257;
  char v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  uint8_t buf[32];
  _BYTE v264[128];
  uint64_t v265;

  v265 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_objectForKey_(v4, v5, (uint64_t)CFSTR("ids-stun-attribute-channelnumber"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend_objectForKey_(v4, v8, (uint64_t)CFSTR("ids-stun-attribute-channelnumber"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend_unsignedIntegerValue(v10, v11, v12, v13);
    objc_msgSend__addUInt32Attribute_value_(self, v15, 12, v16, (v14 << 16));

  }
  objc_msgSend_objectForKey_(v4, v8, (uint64_t)CFSTR("ids-stun-attribute-qr-sessiontokenkey"), v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend_objectForKey_(v4, v18, (uint64_t)CFSTR("ids-stun-attribute-qr-sessiontokenkey"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_Stun(IDSFoundationLog, v21, v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v20;
      _os_log_impl(&dword_19B949000, v24, OS_LOG_TYPE_DEFAULT, "setAttributes: IDSStunAttributeQRSessionTokenKey: %@", buf, 0xCu);
    }

    objc_msgSend__addBinaryDataAttribute_value_(self, v25, 65522, v26, v20);
  }
  objc_msgSend_objectForKey_(v4, v18, (uint64_t)CFSTR("ids-stun-attribute-qr-realloctoken"), v19);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend_objectForKey_(v4, v28, (uint64_t)CFSTR("ids-stun-attribute-qr-realloctoken"), v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_Stun(IDSFoundationLog, v32, v33, v34);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v31;
      _os_log_impl(&dword_19B949000, v35, OS_LOG_TYPE_DEFAULT, "setAttributes: IDSStunAttributeQRReallocToken: %@", buf, 0xCu);
    }

    objc_msgSend__addBinaryDataAttribute_value_(self, v36, 65520, v37, v31);
  }
  objc_msgSend_allKeys(v4, v28, v29, v30);
  v261 = 0u;
  v262 = 0u;
  v259 = 0u;
  v260 = 0u;
  v38 = (id)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v259, v40, v264, 16);
  if (!v42)
  {

    goto LABEL_115;
  }
  v257 = 0;
  v258 = 0;
  v43 = *(_QWORD *)v260;
  v44 = 138412290;
  p_requiresAES128CTR = &self->_requiresAES128CTR;
  do
  {
    for (i = 0; i != v42; ++i)
    {
      if (*(_QWORD *)v260 != v43)
        objc_enumerationMutation(v38);
      v46 = *(void **)(*((_QWORD *)&v259 + 1) + 8 * i);
      objc_msgSend_objectForKey_(v4, v41, (uint64_t)v46, *(double *)&v44, v254);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_isEqualToString_(v46, v48, (uint64_t)CFSTR("ids-stun-attribute-requestedtransport"), v49))
      {
        v53 = objc_msgSend_unsignedCharValue(v47, v50, v51, v52);
        objc_msgSend__addUInt32Attribute_value_(self, v54, 25, v55, (v53 << 24));
      }
      else if ((objc_msgSend_isEqualToString_(v46, v50, (uint64_t)CFSTR("ids-stun-attribute-qr-sessiontokenkey"), v52) & 1) == 0)
      {
        if (objc_msgSend_isEqualToString_(v46, v56, (uint64_t)CFSTR("ids-stun-attribute-qr-sessionid"), v57))
        {
          objc_msgSend__addUUIDAttribute_value_(self, v58, 65521, v59, v47);
        }
        else if (objc_msgSend_isEqualToString_(v46, v58, (uint64_t)CFSTR("ids-stun-attribute-lifetime"), v59))
        {
          v63 = objc_msgSend_unsignedIntegerValue(v47, v60, v61, v62);
          objc_msgSend__addUInt32Attribute_value_(self, v64, 13, v65, v63);
        }
        else if ((objc_msgSend_isEqualToString_(v46, v60, (uint64_t)CFSTR("ids-stun-attribute-qr-realloctoken"), v62) & 1) == 0)
        {
          if (objc_msgSend_isEqualToString_(v46, v66, (uint64_t)CFSTR("ids-stun-attribute-messageintegrity"), v67))
          {
            objc_msgSend_setKey_(self, v68, (uint64_t)v47, v69);
            v258 = 1;
          }
          else if (objc_msgSend_isEqualToString_(v46, v68, (uint64_t)CFSTR("ids-stun-attribute-data"), v69))
          {
            objc_msgSend__addBinaryDataAttribute_value_(self, v70, 19, v71, v47);
          }
          else if ((objc_msgSend_isEqualToString_(v46, v70, (uint64_t)CFSTR("ids-stun-attribute-channelnumber"), v71) & 1) == 0)
          {
            if (objc_msgSend_isEqualToString_(v46, v72, (uint64_t)CFSTR("ids-stun-attribute-xormappedaddress"), v73))
            {
              v77 = objc_msgSend_sa(v47, v74, v75, v76);
              objc_msgSend__addXORAddressAttribute_value_(self, v78, 32, v79, v77);
            }
            else if (objc_msgSend_isEqualToString_(v46, v74, (uint64_t)CFSTR("ids-stun-attribute-cellrat"), v76))
            {
              v83 = objc_msgSend_unsignedIntegerValue(v47, v80, v81, v82);
              objc_msgSend__addUInt32Attribute_value_(self, v84, 32775, v85, v83);
            }
            else if (objc_msgSend_isEqualToString_(v46, v80, (uint64_t)CFSTR("ids-stun-attribute-linkuuid"), v82))
            {
              objc_msgSend__addBinaryDataAttribute_value_(self, v86, 32776, v87, v47);
            }
            else if (objc_msgSend_isEqualToString_(v46, v86, (uint64_t)CFSTR("ids-stun-attribute-software"), v87))
            {
              objc_msgSend__addBinaryDataAttribute_value_(self, v88, 32802, v89, v47);
            }
            else if (objc_msgSend_isEqualToString_(v46, v88, (uint64_t)CFSTR("ids-stun-attribute-clienttime"), v89))
            {
              v93 = objc_msgSend_unsignedIntegerValue(v47, v90, v91, v92);
              objc_msgSend__addUInt32Attribute_value_(self, v94, 65523, v95, v93);
            }
            else if (objc_msgSend_isEqualToString_(v46, v90, (uint64_t)CFSTR("ids-stun-attribute-clientlatency"), v92))
            {
              v99 = objc_msgSend_unsignedIntegerValue(v47, v96, v97, v98);
              objc_msgSend__addUInt32Attribute_value_(self, v100, 65524, v101, v99);
            }
            else if (objc_msgSend_isEqualToString_(v46, v96, (uint64_t)CFSTR("ids-stun-attribute-infoflags"), v98))
            {
              v105 = objc_msgSend_unsignedIntegerValue(v47, v102, v103, v104);
              objc_msgSend__addUInt32Attribute_value_(self, v106, 65525, v107, v105);
            }
            else if (objc_msgSend_isEqualToString_(v46, v102, (uint64_t)CFSTR("ids-stun-attribute-capabilityflags"), v104))
            {
              v111 = objc_msgSend_longValue(v47, v108, v109, v110);
              objc_msgSend__addUInt64Attribute_value_(self, v112, 65527, v113, v111);
            }
            else if (objc_msgSend_isEqualToString_(v46, v108, (uint64_t)CFSTR("ids-stun-attribute-enc-pub-streams"), v110))
            {
              *p_requiresAES128CTR = 1;
              objc_msgSend__addBinaryDataAttribute_value_(self, v114, 60929, v115, v47);
            }
            else if (objc_msgSend_isEqualToString_(v46, v114, (uint64_t)CFSTR("ids-stun-attribute-enc-sub-streams"), v115))
            {
              *p_requiresAES128CTR = 1;
              objc_msgSend__addBinaryDataAttribute_value_(self, v116, 60930, v117, v47);
            }
            else if (objc_msgSend_isEqualToString_(v46, v116, (uint64_t)CFSTR("ids-stun-attribvute-enc-marker"), v117))
            {
              v120 = v47;

              v257 = v120;
            }
            else if (objc_msgSend_isEqualToString_(v46, v118, (uint64_t)CFSTR("ids-stun-attribute-generation-counter"), v119))
            {
              v124 = objc_msgSend_unsignedIntegerValue(v47, v121, v122, v123);
              objc_msgSend__addUInt32Attribute_value_(self, v125, 65531, v126, v124);
            }
            else if (objc_msgSend_isEqualToString_(v46, v121, (uint64_t)CFSTR("ids-stun-attribute-max-concurrent-streams"), v123))
            {
              v130 = objc_msgSend_unsignedIntValue(v47, v127, v128, v129);
              objc_msgSend__addUInt8Attribute_value_(self, v131, 65532, v132, v130);
            }
            else if (objc_msgSend_isEqualToString_(v46, v127, (uint64_t)CFSTR("ids-stun-attribute-sent-packets"), v129))
            {
              v136 = objc_msgSend_unsignedIntegerValue(v47, v133, v134, v135);
              objc_msgSend__addUInt32Attribute_value_(self, v137, 65504, v138, v136);
            }
            else if (objc_msgSend_isEqualToString_(v46, v133, (uint64_t)CFSTR("ids-stun-attribute-received-packets"), v135))
            {
              v142 = objc_msgSend_unsignedIntegerValue(v47, v139, v140, v141);
              objc_msgSend__addUInt32Attribute_value_(self, v143, 65505, v144, v142);
            }
            else if (objc_msgSend_isEqualToString_(v46, v139, (uint64_t)CFSTR("ids-stun-attribute-channel-binding-info"), v141))
            {
              v148 = objc_msgSend_unsignedIntegerValue(v47, v145, v146, v147);
              objc_msgSend__addUInt32Attribute_value_(self, v149, 65508, v150, v148);
            }
            else if (objc_msgSend_isEqualToString_(v46, v145, (uint64_t)CFSTR("ids-stun-attribute-relay-link-id"), v147))
            {
              v154 = objc_msgSend_unsignedIntegerValue(v47, v151, v152, v153);
              objc_msgSend__addUInt16Attribute_value_(self, v155, 65509, v156, v154);
            }
            else if (objc_msgSend_isEqualToString_(v46, v151, (uint64_t)CFSTR("ids-stun-attribute-qr-request-id"), v153))
            {
              v160 = objc_msgSend_unsignedIntegerValue(v47, v157, v158, v159);
              objc_msgSend__addUInt32Attribute_value_(self, v161, 65510, v162, v160);
            }
            else if (objc_msgSend_isEqualToString_(v46, v157, (uint64_t)CFSTR("ids-stun-attribute-qr-cookie"), v159))
            {
              v166 = objc_msgSend_unsignedIntegerValue(v47, v163, v164, v165);
              objc_msgSend__addUInt32Attribute_value_(self, v167, 65513, v168, v166);
            }
            else if (objc_msgSend_isEqualToString_(v46, v163, (uint64_t)CFSTR("ids-stun-attribute-qr-testoptions"), v165))
            {
              v172 = objc_msgSend_unsignedIntegerValue(v47, v169, v170, v171);
              objc_msgSend__addUInt32Attribute_value_(self, v173, 65511, v174, v172);
            }
            else if (objc_msgSend_isEqualToString_(v46, v169, (uint64_t)CFSTR("ids-stun-attribute-qr-test-requested-message"), v171))
            {
              v178 = objc_msgSend_unsignedIntegerValue(v47, v175, v176, v177);
              objc_msgSend__addUInt16Attribute_value_(self, v179, 65472, v180, v178);
            }
            else if (objc_msgSend_isEqualToString_(v46, v175, (uint64_t)CFSTR("ids-stun-attribute-qr-test-requested-error-code"), v177))
            {
              v184 = objc_msgSend_unsignedIntegerValue(v47, v181, v182, v183);
              objc_msgSend__addUInt16Attribute_value_(self, v185, 65474, v186, v184);
            }
            else if (objc_msgSend_isEqualToString_(v46, v181, (uint64_t)CFSTR("ids-stun-attribute-qr-testsuboperation"), v183))
            {
              objc_msgSend__addBinaryDataAttribute_value_(self, v187, 65473, v188, v47);
            }
            else if (objc_msgSend_isEqualToString_(v46, v187, (uint64_t)CFSTR("ids-stun-attribute-link-attributes"), v188))
            {
              v192 = objc_msgSend_unsignedIntegerValue(v47, v189, v190, v191);
              objc_msgSend__addUInt32Attribute_value_(self, v193, 32803, v194, v192);
            }
            else if (objc_msgSend_isEqualToString_(v46, v189, (uint64_t)CFSTR("ids-stun-attribute-data-so-masks-attributes"), v191))
            {
              v198 = objc_msgSend_unsignedIntegerValue(v47, v195, v196, v197);
              objc_msgSend__addUInt32Attribute_value_(self, v199, 32804, v200, v198);
            }
            else if (objc_msgSend_isEqualToString_(v46, v195, (uint64_t)CFSTR("gl-attr-error-code-data"), v197))
            {
              v204 = objc_msgSend_unsignedIntegerValue(v47, v201, v202, v203);
              objc_msgSend__addUInt32Attribute_value_(self, v205, 9, v206, v204);
            }
            else if (objc_msgSend_isEqualToString_(v46, v201, (uint64_t)CFSTR("ids-stun-attribute-session-state-counter"), v203))
            {
              v210 = objc_msgSend_unsignedIntegerValue(v47, v207, v208, v209);
              objc_msgSend__addUInt32Attribute_value_(self, v211, 65489, v212, v210);
            }
            else if (objc_msgSend_isEqualToString_(v46, v207, (uint64_t)CFSTR("ids-stun-attribute-session-state-type"), v209))
            {
              v216 = objc_msgSend_unsignedIntegerValue(v47, v213, v214, v215);
              objc_msgSend__addUInt16Attribute_value_(self, v217, 65518, v218, v216);
            }
            else if (objc_msgSend_isEqualToString_(v46, v213, (uint64_t)CFSTR("ids-stun-attribute-enc-ParticipantIDs"), v215))
            {
              *p_requiresAES128CTR = 1;
              objc_msgSend__addBinaryDataAttribute_value_(self, v219, 60928, v220, v47);
            }
            else if (objc_msgSend_isEqualToString_(v46, v219, (uint64_t)CFSTR("ids-stun-attribute-plugin-name"), v220))
            {
              *p_requiresAES128CTR = 1;
              objc_msgSend__addBinaryDataAttribute_value_(self, v221, 60935, v222, v47);
            }
            else if (objc_msgSend_isEqualToString_(v46, v221, (uint64_t)CFSTR("ids-stun-attribute-raw-public-key"), v222))
            {
              objc_msgSend__addBinaryDataAttribute_value_(self, v223, 65495, v224, v47);
            }
            else if (objc_msgSend_isEqualToString_(v46, v223, (uint64_t)CFSTR("ids-stun-attribute-plugin-operation"), v224))
            {
              v228 = objc_msgSend_unsignedIntValue(v47, v225, v226, v227);
              objc_msgSend__addUInt8Attribute_value_(self, v229, 65491, v230, v228);
            }
            else if (objc_msgSend_isEqualToString_(v46, v225, (uint64_t)CFSTR("ids-stun-attribute-qr-server-blob"), v227))
            {
              objc_msgSend__addBinaryDataAttribute_value_(self, v231, 65503, v232, v47);
            }
            else if (objc_msgSend_isEqualToString_(v46, v231, (uint64_t)CFSTR("ids-stun-attribute-tle-p2p-blob"), v232))
            {
              objc_msgSend__addBinaryDataAttribute_value_(self, v233, 36865, v234, v47);
            }
            else if (objc_msgSend_isEqualToString_(v46, v233, (uint64_t)CFSTR("ids-stun-attribute-tle-p2p-connection-id-ids"), v234))
            {
              v238 = objc_msgSend_unsignedIntValue(v47, v235, v236, v237);
              objc_msgSend__addUInt32Attribute_value_(self, v239, 36867, v240, v238);
            }
            else if (objc_msgSend_isEqualToString_(v46, v235, (uint64_t)CFSTR("ids-stun-attribute-tle-p2p-connection-id-avc"), v237))
            {
              v244 = objc_msgSend_unsignedIntValue(v47, v241, v242, v243);
              objc_msgSend__addUInt32Attribute_value_(self, v245, 36866, v246, v244);
            }
            else if (objc_msgSend_isEqualToString_(v46, v241, (uint64_t)CFSTR("ids-stun-attribute-qr-materials"), v243))
            {
              objc_msgSend__addBinaryDataAttribute_value_(self, v247, 65499, v248, v47);
            }
            else
            {
              OSLogHandleForIDSCategory();
              oslog = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v46;
                _os_log_impl(&dword_19B949000, oslog, OS_LOG_TYPE_ERROR, "receive unknown stun attribute key %@ for QR stun message, ignore.", buf, 0xCu);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                _IDSWarnV();
                _IDSLogV(0, CFSTR("IDSFoundation"), CFSTR("Warning"), CFSTR("receive unknown stun attribute key %@ for QR stun message, ignore."));
                v254 = v46;
                _IDSLogTransport(CFSTR("Warning"), CFSTR("IDS"), CFSTR("receive unknown stun attribute key %@ for QR stun message, ignore."));
              }
            }
          }
        }
      }

    }
    v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v41, (uint64_t)&v259, *(double *)&v44, v264, 16);
  }
  while (v42);

  if (v257)
  {
    objc_msgSend__addBinaryDataAttribute_value_(self, v249, 60934, v250);
    if ((v258 & 1) == 0)
      goto LABEL_116;
    goto LABEL_114;
  }
  if ((v258 & 1) == 0)
  {
LABEL_115:
    v257 = 0;
    goto LABEL_116;
  }
LABEL_114:
  memset(buf, 170, 20);
  objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v249, (uint64_t)buf, v250, 20, v254);
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__addBinaryDataAttribute_value_(self, v252, 8, v253, v251);

LABEL_116:
}

- (void)setTransactionID:(id)a3 attributes:(id)a4
{
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  id v10;

  v10 = a4;
  objc_msgSend_setTransactionID_(self, v6, (uint64_t)a3, v7);
  objc_msgSend_setAttributes_(self, v8, (uint64_t)v10, v9);

}

- (BOOL)write:(char *)a3 outputLength:(int *)a4 remainingLength:(unint64_t)a5
{
  double v5;

  return objc_msgSend_write_outputLength_remainingLength_internal_(self, a2, (uint64_t)a3, v5, a4, a5, 1);
}

- (BOOL)write:(char *)a3 outputLength:(int *)a4 remainingLength:(unint64_t)a5 internal:(BOOL)a6
{
  double v6;
  unint64_t v9;
  _BOOL4 v10;
  char *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int *p_numAttribute;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unsigned int type;
  IDSStunAttribute *v33;
  NSObject *v34;
  int v35;
  NSObject *v37;
  int v38;
  unsigned int u32;
  double v40;
  char *v41;
  const char *v42;
  uint64_t v43;
  double v44;
  int v45;
  NSObject *v46;
  int v47;
  int v48;
  uint64_t v49;
  unsigned int v50;
  uint64_t v51;
  NSData *key;
  const void *v54;
  const char *v55;
  uint64_t v56;
  double v57;
  size_t v58;
  unsigned int v59;
  _CCCryptor *__dst;
  size_t __n;
  int v62;
  uint8_t v63[4];
  int v64;
  uint8_t buf[1472];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v62 = -1431655766;
  if (!a3 || !a4)
  {
    objc_msgSend_Stun(IDSFoundationLog, a2, (uint64_t)a3, v6, a4, a5, a6);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_19BAF4D88();

    return 0;
  }
  v9 = a5;
  if (!a5)
  {
    objc_msgSend_Stun(IDSFoundationLog, a2, (uint64_t)a3, v6);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_19BAF4A94(v14, v15, v16, v17, v18, v19, v20, v21);
LABEL_70:

    return 0;
  }
  v10 = a6;
  if (a6)
  {
    v9 = a5 - 1;
    *a3 = 15;
    v12 = a3 + 1;
  }
  else
  {
    v12 = a3;
  }
  if (v9 <= 3)
  {
    objc_msgSend_Stun(IDSFoundationLog, a2, (uint64_t)a3, v6);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_19BAF4AFC();
    goto LABEL_70;
  }
  *(_WORD *)v12 = bswap32(LOWORD(self->_type)) >> 16;
  if (v9 - 4 <= 3)
  {
    objc_msgSend_Stun(IDSFoundationLog, a2, (uint64_t)a3, v6);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_19BAF4B5C();
    goto LABEL_70;
  }
  *((_DWORD *)v12 + 1) = 1118048801;
  if (v9 - 8 <= 0xB)
  {
    objc_msgSend_Stun(IDSFoundationLog, a2, (uint64_t)a3, v6);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_19BAF4BBC();
    goto LABEL_70;
  }
  v22 = objc_msgSend_bytes(self->_transactionID, a2, (uint64_t)a3, v6);
  v26 = *(_QWORD *)v22;
  *((_DWORD *)v12 + 4) = *(_DWORD *)(v22 + 8);
  *((_QWORD *)v12 + 1) = v26;
  v27 = (uint64_t)(v12 + 20);
  p_numAttribute = &self->_numAttribute;
  if (self->_numAttribute >= 1)
  {
    v29 = 0;
    v30 = 0;
    v31 = v9 - 20;
    v25 = 67109376;
    while (1)
    {
      v62 = 0;
      v33 = &self->_attributes[v29];
      type = v33->type;
      if (type <= 0x9001)
      {
        switch(self->_attributes[v29].type)
        {
          case 6u:
          case 8u:
          case 0x13u:
            goto LABEL_33;
          case 7u:
          case 0xBu:
          case 0xEu:
          case 0xFu:
          case 0x10u:
          case 0x11u:
          case 0x14u:
          case 0x15u:
          case 0x17u:
          case 0x18u:
          case 0x1Au:
          case 0x1Bu:
          case 0x1Cu:
          case 0x1Du:
          case 0x1Eu:
          case 0x1Fu:
          case 0x21u:
          case 0x23u:
          case 0x24u:
            goto LABEL_57;
          case 9u:
            writeStunErrorCodeAttribute(&self->_attributes[v29].type, v27, &v62, v31, *(double *)&v25);
            goto LABEL_46;
          case 0xAu:
            writeStunUnknownAttribute((int *)&self->_attributes[v29], v27, &v62, v31, *(double *)&v25);
            goto LABEL_46;
          case 0xCu:
          case 0xDu:
          case 0x19u:
          case 0x25u:
            goto LABEL_45;
          case 0x12u:
          case 0x16u:
          case 0x20u:
            objc_msgSend_transactionID(self, v23, v24, *(double *)&v25);
            v34 = objc_claimAutoreleasedReturnValue();
            writeStunXORAddressAttribute(&self->_attributes[v29].type, v34, v27, &v62, v31);
            goto LABEL_26;
          case 0x22u:
            goto LABEL_43;
          default:
            if (type - 32773 > 0x1F)
              goto LABEL_32;
            v35 = 1 << (type - 5);
            if ((v35 & 0x20000009) != 0)
              goto LABEL_33;
            if ((v35 & 0xC0000004) != 0)
              goto LABEL_45;
LABEL_32:
            if (type == 36865)
              goto LABEL_33;
            goto LABEL_57;
        }
      }
      switch(self->_attributes[v29].type)
      {
        case 0xFFC0u:
        case 0xFFC2u:
        case 0xFFE5u:
        case 0xFFEEu:
          writeStunUINT16Attribute(&self->_attributes[v29].type, v27, &v62, v31, *(double *)&v25);
          goto LABEL_46;
        case 0xFFC1u:
        case 0xFFD7u:
        case 0xFFDBu:
        case 0xFFDFu:
        case 0xFFF0u:
        case 0xFFF1u:
        case 0xFFF2u:
LABEL_33:
          writeStunBinaryDataAttribute(&self->_attributes[v29].type, v27, &v62, v31, *(double *)&v25);
          goto LABEL_46;
        case 0xFFC3u:
        case 0xFFC4u:
        case 0xFFC5u:
        case 0xFFC6u:
        case 0xFFC7u:
        case 0xFFC8u:
        case 0xFFC9u:
        case 0xFFCAu:
        case 0xFFCBu:
        case 0xFFCCu:
        case 0xFFCDu:
        case 0xFFCEu:
        case 0xFFCFu:
        case 0xFFD0u:
        case 0xFFD2u:
        case 0xFFD4u:
        case 0xFFD5u:
        case 0xFFD6u:
        case 0xFFD8u:
        case 0xFFD9u:
        case 0xFFDAu:
        case 0xFFDCu:
        case 0xFFDDu:
        case 0xFFDEu:
        case 0xFFE8u:
        case 0xFFEAu:
        case 0xFFEBu:
        case 0xFFECu:
        case 0xFFEDu:
        case 0xFFEFu:
        case 0xFFF6u:
        case 0xFFF8u:
        case 0xFFF9u:
        case 0xFFFAu:
          goto LABEL_57;
        case 0xFFD1u:
        case 0xFFE0u:
        case 0xFFE1u:
        case 0xFFE2u:
        case 0xFFE4u:
        case 0xFFE6u:
        case 0xFFE7u:
        case 0xFFE9u:
        case 0xFFF3u:
        case 0xFFF4u:
        case 0xFFF5u:
        case 0xFFFBu:
          goto LABEL_45;
        case 0xFFD3u:
        case 0xFFFCu:
          writeStunUINT8Attribute(&self->_attributes[v29].type, v27, &v62, v31, *(double *)&v25);
          goto LABEL_46;
        case 0xFFE3u:
        case 0xFFF7u:
LABEL_43:
          writeStunUINT64Attribute(&self->_attributes[v29].type, v27, &v62, v31, *(double *)&v25);
          goto LABEL_46;
        default:
          if (type - 60928 > 7 || ((1 << type) & 0xC7) == 0)
          {
            if (type - 36866 < 2)
            {
LABEL_45:
              writeStunUINT32Attribute(&self->_attributes[v29].type, v27, &v62, v31, *(double *)&v25);
              goto LABEL_46;
            }
LABEL_57:
            objc_msgSend_Stun(IDSFoundationLog, v23, v24, *(double *)&v25);
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              v45 = v33->type;
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&buf[4] = v45;
              _os_log_impl(&dword_19B949000, v34, OS_LOG_TYPE_DEFAULT, "write: unknown attribute %04X", buf, 8u);
            }
LABEL_26:

          }
          else
          {
            objc_msgSend_Stun(IDSFoundationLog, v23, v24, *(double *)&v25);
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              v38 = v33->type;
              u32 = self->_attributes[v29].value.u32;
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&buf[4] = v38;
              *(_WORD *)&buf[8] = 1024;
              *(_DWORD *)&buf[10] = u32;
              _os_log_impl(&dword_19B949000, v37, OS_LOG_TYPE_DEFAULT, "send enc attr %04X, %dB.", buf, 0xEu);
            }

            v41 = (char *)self + v29 * 1488;
            if (!self->_attributes[v29].encrypted && *((_WORD *)v41 + 21) && self->_cryptorRef)
            {
              __dst = self->_cryptorRef;
              memset(buf, 170, sizeof(buf));
              __n = 0;
              if (!StunUtilDoAES128CTR(__dst, &self->_attributes[v29].value.u32 + 1, self->_attributes[v29].value.binaryData.len, buf, &__n))
              {
                objc_msgSend_Stun(IDSFoundationLog, v42, v43, v44);
                v46 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                {
                  v47 = v33->type;
                  *(_DWORD *)v63 = 67109120;
                  v64 = v47;
                  _os_log_impl(&dword_19B949000, v46, OS_LOG_TYPE_DEFAULT, "write: failed to enc attribute %04x.", v63, 8u);
                }

                p_numAttribute = &self->_numAttribute;
                goto LABEL_48;
              }
              v59 = __n;
              memcpy(&self->_attributes[v29].value.u32 + 1, buf, __n);
              self->_attributes[v29].value.u32 = v59;
              v41[46] = 1;
            }
            writeStunBinaryDataAttribute(&self->_attributes[v29].type, v27, &v62, v31, v40);
          }
          p_numAttribute = &self->_numAttribute;
LABEL_46:
          if (v31 < v62)
          {
            objc_msgSend_Stun(IDSFoundationLog, v23, v24, *(double *)&v25);
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              sub_19BAF4C1C(&v62, v31, v14);
            goto LABEL_70;
          }
          v27 += v62;
          v31 -= v62;
LABEL_48:
          ++v30;
          ++v29;
          if (v30 >= *p_numAttribute)
            goto LABEL_62;
          break;
      }
    }
  }
LABEL_62:
  v48 = v27 - (_DWORD)a3;
  if (v27 - (uint64_t)a3 <= 19)
  {
    objc_msgSend_Stun(IDSFoundationLog, v23, v24, *(double *)&v25);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_19BAF4C98(v48, v14, v49);
    goto LABEL_70;
  }
  v50 = v48 - 20;
  self->_len = v48 - 20;
  if (v10)
  {
    if ((_WORD)v48 == 20)
    {
      objc_msgSend_Stun(IDSFoundationLog, v23, v24, *(double *)&v25);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_19BAF4D10(&self->_len, v14);
      goto LABEL_70;
    }
    v50 = v48 - 21;
    self->_len = v48 - 21;
    v51 = 3;
  }
  else
  {
    v51 = 2;
  }
  *(_WORD *)&a3[v51] = bswap32(v50) >> 16;
  *a4 = v48;
  key = self->_key;
  if (key)
  {
    v54 = (const void *)objc_msgSend_bytes(key, v23, v24, *(double *)&v25);
    v58 = objc_msgSend_length(self->_key, v55, v56, v57);
    CCHmac(0, v54, v58, a3, v48 - 24, &a3[v48 - 20]);
  }
  return 1;
}

- (BOOL)verifyMessageIntegrityWithKey:(id)a3 inputBuffer:(char *)a4 inputLength:(int)a5
{
  size_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  double v11;
  const void *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  size_t v16;
  _BYTE v18[24];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a5 < 44)
    return 0;
  v7 = (a5 - 24);
  memset(v18, 170, 20);
  v8 = objc_retainAutorelease(a3);
  v12 = (const void *)objc_msgSend_bytes(v8, v9, v10, v11, *(_QWORD *)v18, *(_QWORD *)&v18[8], *(_QWORD *)&v18[16], v19);
  v16 = objc_msgSend_length(v8, v13, v14, v15);

  CCHmac(0, v12, v16, a4, v7, v18);
  return timingsafe_bcmp(v18, &a4[a5 - 20], 0x14uLL) == 0;
}

- (BOOL)read:(char *)a3 inputLength:(unint64_t)a4
{
  double v4;

  return objc_msgSend_read_inputLength_internal_(self, a2, (uint64_t)a3, v4, a4, 1);
}

- (BOOL)read:(char *)a3 inputLength:(unint64_t)a4 internal:(BOOL)a5
{
  double v5;
  unint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  _BOOL4 v12;
  char *v15;
  uint64_t v16;
  NSObject *v17;
  int v18;
  unsigned int v19;
  int *p_numAttribute;
  char *v21;
  void *v22;
  const char *v23;
  double v24;
  unsigned __int8 *v25;
  int v26;
  unint64_t v27;
  int8x16_t *attributes;
  unsigned __int8 *v29;
  unint64_t v30;
  unsigned int v31;
  const char *v32;
  uint64_t v33;
  double v34;
  unsigned int v35;
  char StunErrorCodeAttribute;
  int v37;
  uint64_t v38;
  int StunUnknownAttribute;
  const char *v41;
  uint64_t v42;
  double v43;
  NSObject *v44;
  const __CFString *v45;
  const char *v46;
  uint64_t v47;
  double v48;
  const char *v49;
  uint64_t v50;
  double v51;
  NSObject *v52;
  NSObject *v53;
  NSObject *v54;
  int v55;
  const char *v56;
  NSObject *v57;
  uint32_t v58;
  BOOL StunBinaryDataAttribute;
  unsigned int v60;
  uint64_t v61;
  int v62;
  uint8_t buf[4];
  _BYTE v64[10];
  unint64_t v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend_Stun(IDSFoundationLog, a2, 0, v5, a4, a5);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v9 = "read: invalid inputBuffer";
      v10 = v8;
      v11 = 2;
      goto LABEL_10;
    }
LABEL_11:

LABEL_12:
    LOBYTE(v12) = 0;
    return v12;
  }
  if (a5)
    v7 = 21;
  else
    v7 = 20;
  if (v7 > a4)
  {
    objc_msgSend_Stun(IDSFoundationLog, a2, (uint64_t)a3, v5);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)v64 = a4;
      *(_WORD *)&v64[8] = 2048;
      v65 = v7;
      v9 = "read: short packet (%zd < %zd)";
      v10 = v8;
      v11 = 22;
LABEL_10:
      _os_log_impl(&dword_19B949000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  v15 = &a3[a5];
  self->_type = bswap32(*(unsigned __int16 *)v15) >> 16;
  v16 = bswap32(*((unsigned __int16 *)v15 + 1)) >> 16;
  self->_len = v16;
  if (v16 + 20 > a4)
  {
    objc_msgSend_Stun(IDSFoundationLog, a2, (uint64_t)a3, v5);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = self->_len + 20;
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)v64 = a4;
      *(_WORD *)&v64[8] = 1024;
      LODWORD(v65) = v18;
      _os_log_impl(&dword_19B949000, v17, OS_LOG_TYPE_DEFAULT, "read: short packet (%zd < %d)", buf, 0x12u);
    }

    goto LABEL_12;
  }
  v19 = *((_DWORD *)v15 + 1);
  if (v19 != 1118048801)
  {
    objc_msgSend_Stun(IDSFoundationLog, a2, (uint64_t)a3, v5);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v64 = bswap32(v19);
    v9 = "read: invalid magic cookie %08X";
    v10 = v8;
    v11 = 8;
    goto LABEL_10;
  }
  p_numAttribute = &self->_numAttribute;
  v21 = &a3[a4];
  v61 = *((_QWORD *)v15 + 1);
  v62 = *((_DWORD *)v15 + 4);
  objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], a2, (uint64_t)&v61, v5, 12);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTransactionID_(self, v23, (uint64_t)v22, v24);

  v25 = (unsigned __int8 *)(v15 + 24);
  LOBYTE(v12) = v15 + 24 > v21;
  if (v15 + 24 > v21)
  {
    v26 = 0;
    goto LABEL_82;
  }
  v26 = 0;
  v27 = 0;
  attributes = (int8x16_t *)self->_attributes;
  v29 = (unsigned __int8 *)(v15 + 20);
  while (2)
  {
    v30 = v27;
    attributes->i16[0] = bswap32(*(unsigned __int16 *)v29) >> 16;
    v31 = bswap32(*((unsigned __int16 *)v29 + 1));
    attributes->i16[1] = HIWORD(v31);
    v60 = HIWORD(v31);
    if ((StunUtilHasValidAttrLength((uint64_t)v25, HIWORD(v31), (unint64_t)v21) & 1) == 0)
    {
      objc_msgSend_Stun(IDSFoundationLog, v32, v33, v34);
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        v55 = attributes->u16[0];
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v64 = v60;
        *(_WORD *)&v64[4] = 1024;
        *(_DWORD *)&v64[6] = v55;
        v56 = "read: bad attribute length %d, type %u";
        v57 = v54;
        v58 = 14;
LABEL_79:
        _os_log_impl(&dword_19B949000, v57, OS_LOG_TYPE_DEFAULT, v56, buf, v58);
      }
LABEL_80:

      return v12;
    }
    if ((int)v21 - (int)v25 < 0)
    {
      objc_msgSend_Stun(IDSFoundationLog, v32, v33, v34);
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v64 = (_DWORD)v21 - (_DWORD)v25;
        v56 = "remaining Bytes = %d";
        v57 = v54;
        v58 = 8;
        goto LABEL_79;
      }
      goto LABEL_80;
    }
    v35 = attributes->u16[0];
    if (v35 <= 0x9001)
    {
      switch(attributes->i16[0])
      {
        case 6:
        case 8:
        case 0x13:
          goto LABEL_39;
        case 7:
        case 0xB:
        case 0xE:
        case 0xF:
        case 0x10:
        case 0x11:
        case 0x14:
        case 0x15:
        case 0x17:
        case 0x18:
        case 0x1A:
        case 0x1B:
        case 0x1C:
        case 0x1D:
        case 0x1E:
        case 0x1F:
        case 0x21:
        case 0x23:
        case 0x24:
          goto LABEL_62;
        case 9:
          attributes->i16[2] = 6;
          StunErrorCodeAttribute = readStunErrorCodeAttribute(attributes, (char *)&v60, v25, (int)v21 - (int)v25, v34);
          goto LABEL_44;
        case 0xA:
          attributes->i16[2] = 9;
          StunUnknownAttribute = readStunUnknownAttribute((uint64_t)attributes, (int *)&v60, (unsigned __int16 *)v25, (int)v21 - (int)v25);
          objc_msgSend_Stun(IDSFoundationLog, v41, v42, v43);
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            v45 = CFSTR("NO");
            if (StunUnknownAttribute)
              v45 = CFSTR("YES");
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v64 = v45;
            _os_log_impl(&dword_19B949000, v44, OS_LOG_TYPE_DEFAULT, "read unknown attribute, success = %@", buf, 0xCu);
          }

          ++v26;
          if ((StunUnknownAttribute & 1) == 0)
            goto LABEL_81;
          goto LABEL_45;
        case 0xC:
        case 0xD:
        case 0x19:
        case 0x25:
          goto LABEL_43;
        case 0x12:
        case 0x16:
        case 0x20:
          attributes->i16[2] = 2;
          StunErrorCodeAttribute = readStunXORAddressAttribute(attributes, &v60, self->_transactionID, (uint64_t)v25, (int)v21 - (int)v25);
          goto LABEL_44;
        case 0x22:
          goto LABEL_30;
        default:
          if (v35 - 32773 > 0x1F)
            goto LABEL_34;
          v37 = 1 << (v35 - 5);
          if ((v37 & 0x20000009) != 0)
            goto LABEL_39;
          if ((v37 & 0xC0000004) != 0)
            goto LABEL_43;
LABEL_34:
          if (v35 != 36865)
            goto LABEL_62;
          goto LABEL_39;
      }
    }
    switch(attributes->i16[0])
    {
      case 0xFFD1:
      case 0xFFE0:
      case 0xFFE1:
      case 0xFFE2:
      case 0xFFE4:
      case 0xFFE6:
      case 0xFFE8:
      case 0xFFE9:
      case 0xFFF3:
      case 0xFFF4:
      case 0xFFF5:
      case 0xFFFB:
        goto LABEL_43;
      case 0xFFD2:
        attributes->i16[2] = 8;
        v38 = (int)v60;
        ++v26;
        if (v60)
          goto LABEL_81;
        goto LABEL_46;
      case 0xFFD3:
        attributes->i16[2] = 10;
        StunErrorCodeAttribute = readStunUINT8Attribute((uint64_t)attributes, (char *)&v60, v25, (int)v21 - (int)v25, v34);
        goto LABEL_44;
      case 0xFFD4:
      case 0xFFD6:
      case 0xFFD7:
      case 0xFFD8:
      case 0xFFD9:
      case 0xFFDA:
      case 0xFFDC:
      case 0xFFDD:
      case 0xFFDE:
      case 0xFFE7:
      case 0xFFEF:
      case 0xFFF2:
      case 0xFFF6:
      case 0xFFF8:
      case 0xFFF9:
      case 0xFFFA:
        goto LABEL_62;
      case 0xFFD5:
      case 0xFFE3:
      case 0xFFF7:
LABEL_30:
        attributes->i16[2] = 4;
        StunErrorCodeAttribute = readStunUINT64Attribute((uint64_t)attributes, (char *)&v60, (unint64_t *)v25, (int)v21 - (int)v25, v34);
        goto LABEL_44;
      case 0xFFDB:
      case 0xFFDF:
      case 0xFFEA:
      case 0xFFEB:
      case 0xFFED:
      case 0xFFF0:
      case 0xFFF1:
        goto LABEL_39;
      case 0xFFE5:
      case 0xFFEC:
      case 0xFFEE:
        attributes->i16[2] = 7;
        ++v26;
        if (!readStunUINT16Attribute((uint64_t)attributes, (char *)&v60, (unsigned __int16 *)v25, (int)v21 - (int)v25, v34))goto LABEL_81;
        goto LABEL_45;
      default:
        if (v35 - 60928 <= 0xB && ((1 << v35) & 0xD71) != 0)
        {
          self->_requiresAES128CTR = 1;
LABEL_39:
          attributes->i16[2] = 5;
          StunErrorCodeAttribute = readStunBinaryDataAttribute((uint64_t)attributes, (int *)&v60, v25, (_DWORD)v21 - (_DWORD)v25);
LABEL_44:
          ++v26;
          if ((StunErrorCodeAttribute & 1) == 0)
            goto LABEL_81;
          goto LABEL_45;
        }
        if (v35 - 36866 < 2)
        {
LABEL_43:
          attributes->i16[2] = 3;
          StunErrorCodeAttribute = readStunUINT32Attribute((uint64_t)attributes, (char *)&v60, (unsigned int *)v25, (int)v21 - (int)v25, v34);
          goto LABEL_44;
        }
LABEL_62:
        if (!isReservedStunEncryptedAttribute(attributes->i16[0]))
        {
          if ((v60 & 3) != 0)
            v60 += -v60 & 3;
          objc_msgSend_Stun(IDSFoundationLog, v46, v47, v48);
          v53 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v64 = v35;
            _os_log_impl(&dword_19B949000, v53, OS_LOG_TYPE_DEFAULT, "read: unknown attribute %04X", buf, 8u);
          }

          v29 = &v25[v60];
          ++v26;
          goto LABEL_47;
        }
        self->_requiresAES128CTR = 1;
        attributes->i16[2] = 5;
        StunBinaryDataAttribute = readStunBinaryDataAttribute((uint64_t)attributes, (int *)&v60, v25, (_DWORD)v21 - (_DWORD)v25);
        objc_msgSend_Stun(IDSFoundationLog, v49, v50, v51);
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v64 = v35;
          _os_log_impl(&dword_19B949000, v52, OS_LOG_TYPE_DEFAULT, "read: decrypt and drop the reserved encrypted attribute %04X", buf, 8u);
        }

        ++v26;
        if (!StunBinaryDataAttribute)
          goto LABEL_81;
LABEL_45:
        v38 = (int)v60;
LABEL_46:
        v29 = &v25[v38];
LABEL_47:
        v27 = v30 + 1;
        v25 = v29 + 4;
        v12 = v29 + 4 > (unsigned __int8 *)v21 || v30 > 0x12;
        attributes += 93;
        if (!v12)
          continue;
        v26 = v30 + 1;
LABEL_81:
        p_numAttribute = &self->_numAttribute;
LABEL_82:
        *p_numAttribute = v26;
        return v12;
    }
  }
}

- (BOOL)initAES128CTR:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  _CCCryptor **p_cryptorRef;
  NSObject *v10;
  CCCryptorRef v11;
  int64_t v12;
  NSObject *v13;
  const char *v14;
  int type_low;
  NSData *transactionID;
  id v17;
  const char *v18;
  uint64_t v19;
  double v20;
  const void *v21;
  BOOL inited;
  NSObject *v23;
  int v25;
  _DWORD v26[7];

  *(_QWORD *)&v26[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8 = v4;
  if (self->_requiresAES128CTR)
  {
    if (v4)
    {
      p_cryptorRef = &self->_cryptorRef;
      if (self->_cryptorRef)
      {
        objc_msgSend_Stun(IDSFoundationLog, v5, v6, v7);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = *p_cryptorRef;
          v25 = 134217984;
          *(_QWORD *)v26 = v11;
          _os_log_impl(&dword_19B949000, v10, OS_LOG_TYPE_DEFAULT, "release AES128-CTR cryptor %p.", (uint8_t *)&v25, 0xCu);
        }

        CCCryptorRelease(*p_cryptorRef);
        *p_cryptorRef = 0;
      }
      v12 = self->_type & 0x110;
      objc_msgSend_Stun(IDSFoundationLog, v5, v6, v7);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = "encrypt";
        type_low = LOWORD(self->_type);
        if (v12)
          v14 = "decrypt";
        v25 = 67109378;
        v26[0] = type_low;
        LOWORD(v26[1]) = 2080;
        *(_QWORD *)((char *)&v26[1] + 2) = v14;
        _os_log_impl(&dword_19B949000, v13, OS_LOG_TYPE_DEFAULT, "Start AES128-CTR for stun message type %04X to %s.", (uint8_t *)&v25, 0x12u);
      }

      transactionID = self->_transactionID;
      v17 = objc_retainAutorelease(v8);
      v21 = (const void *)objc_msgSend_bytes(v17, v18, v19, v20);
      inited = StunUtilInitAES128CTR(transactionID, v12 != 0, v21, p_cryptorRef);
    }
    else
    {
      objc_msgSend_Stun(IDSFoundationLog, v5, v6, v7);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v25) = 0;
        _os_log_impl(&dword_19B949000, v23, OS_LOG_TYPE_DEFAULT, "initAES128CTR failed with invalid key.", (uint8_t *)&v25, 2u);
      }

      inited = 0;
    }
  }
  else
  {
    inited = 1;
  }

  return inited;
}

- (BOOL)decryptAES128CTRStunAttributes:(id)a3
{
  const char *v5;
  double v6;
  const char *v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  unsigned int *p_errorNumber;
  uint64_t v12;
  unsigned int v13;
  size_t v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  unsigned int v20;
  unsigned int v21;
  NSObject *v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  size_t __n;
  uint8_t buf[4];
  unsigned int v29;
  __int16 v30;
  int v31;
  _BYTE __b[1472];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  memset(__b, 170, sizeof(__b));
  __n = 0;
  objc_msgSend_initAES128CTR_(self, v5, (uint64_t)a3, v6);
  v9 = 1;
  if (self->_numAttribute >= 1)
  {
    v10 = 0;
    p_errorNumber = (unsigned int *)&self->_attributes[0].value.errorCode.errorNumber;
    v12 = 67109376;
    while (1)
    {
      v13 = *((unsigned __int16 *)p_errorNumber - 6);
      if (v13 - 60928 <= 8 && ((1 << v13) & 0x171) != 0)
      {
        v15 = *(p_errorNumber - 1);
        objc_msgSend_Stun(IDSFoundationLog, v7, v8, *(double *)&v12);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          v29 = v13;
          v30 = 1024;
          v31 = v15;
          _os_log_impl(&dword_19B949000, v16, OS_LOG_TYPE_DEFAULT, "recv enc attr %04X, %dB.", buf, 0xEu);
        }

        if ((int)v15 >= 1)
        {
          if (!StunUtilDoAES128CTR(self->_cryptorRef, p_errorNumber, v15, __b, &__n))
          {
            objc_msgSend_Stun(IDSFoundationLog, v17, v18, v19);
            v22 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              goto LABEL_20;
            *(_DWORD *)buf = 67109120;
            v29 = v13;
            v23 = "decryptAES128CTRStunAttributes: failed to read attr (%04x).";
            v24 = v22;
            v25 = 8;
            goto LABEL_19;
          }
          v20 = __n;
          memcpy(p_errorNumber, __b, __n);
          *(p_errorNumber - 1) = v20;
          if (v13 == 60934)
          {
            v21 = *p_errorNumber;
            if (*p_errorNumber != 1414938954)
              break;
          }
        }
      }
      p_errorNumber += 372;
      if (++v10 >= self->_numAttribute)
        return 1;
    }
    objc_msgSend_Stun(IDSFoundationLog, v7, v8, *(double *)&v12);
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      goto LABEL_20;
    *(_DWORD *)buf = 67109376;
    v29 = bswap32(v21);
    v30 = 1024;
    v31 = 1245795924;
    v23 = "decryptAES128CTRStunAttributes: enc marker mismatch (%08x != %08x).";
    v24 = v22;
    v25 = 14;
LABEL_19:
    _os_log_impl(&dword_19B949000, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);
LABEL_20:

    return 0;
  }
  return v9;
}

- (int64_t)type
{
  return self->_type;
}

- (NSData)transactionID
{
  return self->_transactionID;
}

- (NSData)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 29808);
}

- (NSString)requestID
{
  return self->_requestID;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_transactionID, 0);
}

@end
