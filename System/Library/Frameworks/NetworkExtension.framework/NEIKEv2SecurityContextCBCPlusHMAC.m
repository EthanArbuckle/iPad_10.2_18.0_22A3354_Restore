@implementation NEIKEv2SecurityContextCBCPlusHMAC

- (void)dealloc
{
  _CCCryptor *outgoingEncryptionContext;
  _CCCryptor *incomingEncryptionContext;
  objc_super v5;

  if (self)
  {
    outgoingEncryptionContext = self->_outgoingEncryptionContext;
    if (outgoingEncryptionContext)
    {
      CCCryptorRelease(outgoingEncryptionContext);
      self->_outgoingEncryptionContext = 0;
    }
    incomingEncryptionContext = self->_incomingEncryptionContext;
    if (incomingEncryptionContext)
    {
      CCCryptorRelease(incomingEncryptionContext);
      self->_incomingEncryptionContext = 0;
    }
    if (self->_outgoingHMACBaseContext)
    {
      CCHmacDestroy();
      self->_outgoingHMACBaseContext = 0;
    }
    if (self->_incomingHMACBaseContext)
    {
      CCHmacDestroy();
      self->_incomingHMACBaseContext = 0;
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)NEIKEv2SecurityContextCBCPlusHMAC;
  -[NEIKEv2SecurityContextCBCPlusHMAC dealloc](&v5, sel_dealloc);
}

- (unsigned)overheadForPlaintextLength:(unsigned int)a3
{
  NEIKEv2EncryptionProtocol *v5;
  NEIKEv2IntegrityProtocol *integrityProtocol;
  unsigned int v7;

  if (self)
  {
    v5 = self->_encryptionProtocol;
    integrityProtocol = self->_integrityProtocol;
  }
  else
  {
    v5 = 0;
    integrityProtocol = 0;
  }
  v7 = +[NEIKEv2SecurityContextCBCPlusHMAC overheadForPlaintextLength:encryptionProtocol:integrityProtocol:]((uint64_t)NEIKEv2SecurityContextCBCPlusHMAC, a3, v5, integrityProtocol);

  return v7;
}

- (unsigned)maximumPayloadSizeWithinLimit:(unsigned int)a3
{
  unsigned int v5;
  BOOL v6;
  unsigned int v7;
  NEIKEv2EncryptionProtocol *encryptionProtocol;
  unsigned int v9;

  v5 = -[NEIKEv2SecurityContextCBCPlusHMAC fixedOverheadLength]((uint64_t)self);
  v6 = a3 >= v5;
  v7 = a3 - v5;
  if (v7 == 0 || !v6)
    return 0;
  if (self)
    encryptionProtocol = self->_encryptionProtocol;
  else
    encryptionProtocol = 0;
  v9 = -[NEIKEv2EncryptionProtocol blockLength]((uint64_t)encryptionProtocol);
  if (v7 - 1 >= v7 % v9)
    return v7 - 1 - v7 % v9;
  else
    return 0;
}

- (id)constructEncryptedPacketFromPayloadData:(id)a3 authenticatedHeaders:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  unsigned int v9;
  unsigned __int8 v10;
  size_t v11;
  void *v12;
  NEIKEv2EncryptionProtocol *encryptionProtocol;
  unsigned int v14;
  NSObject *v15;
  id v16;
  int v17;
  NSObject *v18;
  id v19;
  char *v20;
  _CCCryptor *outgoingEncryptionContext;
  char *v22;
  CCCryptorStatus v23;
  _CCCryptor *v24;
  CCCryptorStatus v25;
  $1DC23E134A5F43A06C89BE309303CDCF *outgoingHMACBaseContext;
  NEIKEv2SecurityContextCBCPlusHMAC *v27;
  NSObject *v28;
  NSObject *v30;
  CCCryptorStatus v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  size_t dataOutMoved;
  unsigned __int8 v36;
  uint8_t buf[4];
  _BYTE v38[10];
  __int16 v39;
  size_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = objc_msgSend(v6, "length");
    v9 = objc_msgSend(v7, "length");
    if (self)
      v10 = +[NEIKEv2SecurityContextCBCPlusHMAC paddingLengthForPlaintextLength:encryptionProtocol:]((uint64_t)NEIKEv2SecurityContextCBCPlusHMAC, v8, self->_encryptionProtocol);
    else
      v10 = 0;
    v36 = v10;
    v11 = v8 + v10 + 1;
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", -[NEIKEv2SecurityContextCBCPlusHMAC fixedOverheadLength]((uint64_t)self)+ v9+ v11);
    objc_msgSend(v12, "appendData:", v7);
    if (self)
      encryptionProtocol = self->_encryptionProtocol;
    else
      encryptionProtocol = 0;
    v14 = -[NEIKEv2EncryptionProtocol ivLength]((uint64_t)encryptionProtocol);
    v15 = +[NEIKEv2Crypto createRandomWithSize:]((uint64_t)NEIKEv2Crypto, v14);
    v34 = v15;
    if (!v15)
    {
      ne_log_obj();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v38 = v14;
        _os_log_fault_impl(&dword_19BD16000, v18, OS_LOG_TYPE_FAULT, "[NEIKEv2Crypto createRandomWithSize:%u] failed", buf, 8u);
      }
      v19 = 0;
      goto LABEL_25;
    }
    v33 = v7;
    objc_msgSend(v12, "appendData:", v15);
    v16 = v6;
    objc_msgSend(v12, "appendData:", v6);
    if (v10)
    {
      v17 = v10;
      v18 = +[NEIKEv2Crypto createRandomWithSize:]((uint64_t)NEIKEv2Crypto, v10);
      if (!v18)
      {
        ne_log_obj();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v38 = v17;
          _os_log_fault_impl(&dword_19BD16000, v18, OS_LOG_TYPE_FAULT, "[NEIKEv2Crypto createRandomWithSize:%u] failed", buf, 8u);
        }
        v19 = 0;
        v6 = v16;
        v7 = v33;
        goto LABEL_25;
      }
    }
    else
    {
      v18 = 0;
    }
    objc_msgSend(v12, "appendData:", v18);
    objc_msgSend(v12, "appendBytes:length:", &v36, 1);
    v20 = (char *)(objc_msgSend(v12, "mutableBytes") + v9);
    if (self)
      outgoingEncryptionContext = self->_outgoingEncryptionContext;
    else
      outgoingEncryptionContext = 0;
    v22 = &v20[v14];
    v23 = CCCryptorReset(outgoingEncryptionContext, v20);
    if (v23)
    {
      v31 = v23;
      ne_log_obj();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v38 = v31;
        _os_log_fault_impl(&dword_19BD16000, v32, OS_LOG_TYPE_FAULT, "CCCryptorReset failed: %d)", buf, 8u);
      }

    }
    dataOutMoved = 0;
    if (self)
      v24 = self->_outgoingEncryptionContext;
    else
      v24 = 0;
    v6 = v16;
    v25 = CCCryptorUpdate(v24, v22, v11, v22, v11, &dataOutMoved);
    v7 = v33;
    if (v25 || dataOutMoved != v11)
    {
      ne_log_obj();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)v38 = v25;
        *(_WORD *)&v38[4] = 1024;
        *(_DWORD *)&v38[6] = v11;
        v39 = 2048;
        v40 = dataOutMoved;
        _os_log_fault_impl(&dword_19BD16000, v28, OS_LOG_TYPE_FAULT, "CCCryptorUpdate failed: status %d, original %u, decrypted %zu)", buf, 0x18u);
      }
    }
    else
    {
      if (self)
      {
        outgoingHMACBaseContext = self->_outgoingHMACBaseContext;
        v27 = self;
      }
      else
      {
        v27 = 0;
        outgoingHMACBaseContext = 0;
      }
      -[NEIKEv2SecurityContextCBCPlusHMAC computeOutgoingHMACUsingContext:payloadData:]((uint64_t)v27, (uint64_t)outgoingHMACBaseContext, v12);
      v28 = objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        objc_msgSend(v12, "appendData:", v28);
        v19 = v12;
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
    }
    v19 = 0;
    goto LABEL_24;
  }
  ne_log_obj();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)v38 = "-[NEIKEv2SecurityContextCBCPlusHMAC constructEncryptedPacketFromPayloadData:authenticatedHeaders:]";
    _os_log_fault_impl(&dword_19BD16000, v30, OS_LOG_TYPE_FAULT, "%s called with null authenticatedHeaders", buf, 0xCu);
  }

  v19 = 0;
LABEL_26:

  return v19;
}

- (id)decryptPayloadData:(id)a3 authenticatedHeaders:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NEIKEv2IntegrityProtocol *integrityProtocol;
  int v11;
  unsigned int v12;
  unsigned int v13;
  $1DC23E134A5F43A06C89BE309303CDCF *incomingHMACBaseContext;
  NEIKEv2SecurityContextCBCPlusHMAC *v15;
  NSObject *v16;
  size_t v17;
  NEIKEv2EncryptionProtocol *encryptionProtocol;
  NSObject *v19;
  NSObject *v20;
  char *v21;
  _CCCryptor *incomingEncryptionContext;
  CCCryptorStatus v23;
  char *v24;
  CCCryptorStatus v25;
  NEIKEv2EncryptionProtocol *v27;
  const char *v28;
  CCCryptorStatus v29;
  NSObject *v30;
  NSObject *v31;
  size_t dataOutMoved;
  uint8_t buf[4];
  _BYTE v34[10];
  __int16 v35;
  size_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    ne_log_obj();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      goto LABEL_38;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)v34 = "-[NEIKEv2SecurityContextCBCPlusHMAC decryptPayloadData:authenticatedHeaders:]";
    v28 = "%s called with null payloadData";
LABEL_35:
    _os_log_fault_impl(&dword_19BD16000, v16, OS_LOG_TYPE_FAULT, v28, buf, 0xCu);
    goto LABEL_38;
  }
  if (!v7)
  {
    ne_log_obj();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      goto LABEL_38;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)v34 = "-[NEIKEv2SecurityContextCBCPlusHMAC decryptPayloadData:authenticatedHeaders:]";
    v28 = "%s called with null authenticatedHeaders";
    goto LABEL_35;
  }
  if (self)
  {
    v9 = -[NEIKEv2EncryptionProtocol ivLength]((uint64_t)self->_encryptionProtocol);
    integrityProtocol = self->_integrityProtocol;
  }
  else
  {
    v9 = -[NEIKEv2EncryptionProtocol ivLength](0);
    integrityProtocol = 0;
  }
  v11 = -[NEIKEv2IntegrityProtocol digestLength]((uint64_t)integrityProtocol);
  v12 = objc_msgSend(v6, "length");
  v13 = v12;
  if (self)
  {
    if (self->super._minimumEncryptedPayloadSize > v12)
    {
      ne_log_obj();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v34 = v13;
        _os_log_error_impl(&dword_19BD16000, v16, OS_LOG_TYPE_ERROR, "Cannot decrypt, encrypted data length %u too short", buf, 8u);
      }
      goto LABEL_38;
    }
    incomingHMACBaseContext = self->_incomingHMACBaseContext;
    v15 = self;
  }
  else
  {
    v15 = 0;
    incomingHMACBaseContext = 0;
  }
  -[NEIKEv2SecurityContextCBCPlusHMAC computeIncomingHMACUsingContext:authenticatedHeaders:payloadData:]((uint64_t)v15, (uint64_t)incomingHMACBaseContext, v8, v6);
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
LABEL_38:
    v20 = 0;
    goto LABEL_27;
  }
  objc_msgSend(v6, "bytes");
  -[NSObject bytes](v16, "bytes");
  if (cc_cmp_safe())
  {
    ne_log_obj();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19BD16000, v19, OS_LOG_TYPE_ERROR, "Integrity check failure", buf, 2u);
    }
    goto LABEL_15;
  }

  v17 = v13 - v9 - v11;
  if (self)
    encryptionProtocol = self->_encryptionProtocol;
  else
    encryptionProtocol = 0;
  if (!(v17 % -[NEIKEv2EncryptionProtocol blockLength]((uint64_t)encryptionProtocol)))
  {
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", v17);
    v21 = (char *)objc_msgSend(v6, "bytes");
    if (self)
      incomingEncryptionContext = self->_incomingEncryptionContext;
    else
      incomingEncryptionContext = 0;
    v23 = CCCryptorReset(incomingEncryptionContext, v21);
    if (v23)
    {
      v29 = v23;
      ne_log_obj();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v34 = v29;
        _os_log_fault_impl(&dword_19BD16000, v30, OS_LOG_TYPE_FAULT, "CCCryptorReset failed: %d)", buf, 8u);
      }

    }
    v24 = &v21[v9];
    dataOutMoved = 0;
    if (self)
      self = (NEIKEv2SecurityContextCBCPlusHMAC *)self->_incomingEncryptionContext;
    v25 = CCCryptorUpdate((CCCryptorRef)self, v24, v17, (void *)-[NSObject mutableBytes](v19, "mutableBytes"), v17, &dataOutMoved);
    if (v25 || dataOutMoved != v17)
    {
      ne_log_obj();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)v34 = v25;
        *(_WORD *)&v34[4] = 1024;
        *(_DWORD *)&v34[6] = v17;
        v35 = 2048;
        v36 = dataOutMoved;
        _os_log_fault_impl(&dword_19BD16000, v31, OS_LOG_TYPE_FAULT, "CC decrypt failed: status %d, original %u, decrypted %zu)", buf, 0x18u);
      }

    }
    else if (+[NEIKEv2SecurityContext removePaddingFromDecryptedPayload:]((uint64_t)NEIKEv2SecurityContext, v19))
    {
      v20 = v19;
LABEL_25:
      v16 = 0;
      goto LABEL_26;
    }
    v20 = 0;
    goto LABEL_25;
  }
  ne_log_obj();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    if (self)
      v27 = self->_encryptionProtocol;
    else
      v27 = 0;
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v34 = v17;
    *(_WORD *)&v34[4] = 1024;
    *(_DWORD *)&v34[6] = -[NEIKEv2EncryptionProtocol blockLength]((uint64_t)v27);
    _os_log_error_impl(&dword_19BD16000, v19, OS_LOG_TYPE_ERROR, "Ciphertext length %u is not a multiple of the cipher block length %u", buf, 0xEu);
  }
  v16 = 0;
LABEL_15:
  v20 = 0;
LABEL_26:

LABEL_27:
  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_integrityProtocol, 0);
  objc_storeStrong((id *)&self->_encryptionProtocol, 0);
}

- (__CFData)computeIncomingHMACUsingContext:(void *)a3 authenticatedHeaders:(void *)a4 payloadData:
{
  id v7;
  id v8;
  CFIndex v9;
  unsigned int v10;
  __CFData *v11;
  CCHmacContext *v12;
  CCHmacContext *v13;
  __CFData *v14;
  NSObject *v15;
  NSObject *v17;
  int v18;
  CFIndex v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!a1)
  {
    v14 = 0;
    goto LABEL_10;
  }
  v9 = CCHmacOutputSizeFromRef();
  v10 = -[NEIKEv2IntegrityProtocol digestLength](*(_QWORD *)(a1 + 40));
  v11 = +[NSMutableData mutableSensitiveDataPrefilledWithMaxCapacity:](MEMORY[0x1E0C99DF0], v9);
  if (!v11)
  {
    ne_log_obj();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      v18 = 134217984;
      v19 = v9;
      _os_log_fault_impl(&dword_19BD16000, v15, OS_LOG_TYPE_FAULT, "[NEMutableSensitiveData mutableSensitiveDataPrefilledWithMaxCapacity:%zu] failed", (uint8_t *)&v18, 0xCu);
    }

    goto LABEL_8;
  }
  v12 = (CCHmacContext *)CCHmacClone();
  if (!a2)
  {
    ne_log_obj();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v18) = 0;
      _os_log_fault_impl(&dword_19BD16000, v17, OS_LOG_TYPE_FAULT, "CCHmacClone failed", (uint8_t *)&v18, 2u);
    }

LABEL_8:
    v14 = 0;
    goto LABEL_9;
  }
  v13 = v12;
  CCHmacUpdate(v12, (const void *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
  CCHmacUpdate(v13, (const void *)objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length") - v10);
  CCHmacFinal(v13, (void *)-[__CFData mutableBytes](v11, "mutableBytes"));
  -[__CFData setLength:](v11, "setLength:", v10);
  CCHmacDestroy();
  v14 = v11;
LABEL_9:

LABEL_10:
  return v14;
}

- (uint64_t)fixedOverheadLength
{
  void *v1;
  id v2;
  uint64_t v3;

  if (result)
  {
    v1 = *(void **)(result + 40);
    v2 = *(id *)(result + 16);
    v3 = +[NEIKEv2SecurityContextCBCPlusHMAC fixedOverheadForEncryptionProtocol:integrityProtocol:]((uint64_t)NEIKEv2SecurityContextCBCPlusHMAC, v2, v1);

    return v3;
  }
  return result;
}

- (__CFData)computeOutgoingHMACUsingContext:(void *)a3 payloadData:
{
  id v5;
  CFIndex v6;
  unsigned int v7;
  __CFData *v8;
  CCHmacContext *v9;
  CCHmacContext *v10;
  __CFData *v11;
  NSObject *v12;
  NSObject *v14;
  int v15;
  CFIndex v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!a1)
  {
    v11 = 0;
    goto LABEL_10;
  }
  v6 = CCHmacOutputSizeFromRef();
  v7 = -[NEIKEv2IntegrityProtocol digestLength](*(_QWORD *)(a1 + 40));
  v8 = +[NSMutableData mutableSensitiveDataPrefilledWithMaxCapacity:](MEMORY[0x1E0C99DF0], v6);
  if (!v8)
  {
    ne_log_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      v15 = 134217984;
      v16 = v6;
      _os_log_fault_impl(&dword_19BD16000, v12, OS_LOG_TYPE_FAULT, "[NEMutableSensitiveData mutableSensitiveDataPrefilledWithMaxCapacity:%zu] failed", (uint8_t *)&v15, 0xCu);
    }

    goto LABEL_8;
  }
  v9 = (CCHmacContext *)CCHmacClone();
  if (!a2)
  {
    ne_log_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v15) = 0;
      _os_log_fault_impl(&dword_19BD16000, v14, OS_LOG_TYPE_FAULT, "CCHmacClone failed", (uint8_t *)&v15, 2u);
    }

LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  v10 = v9;
  CCHmacUpdate(v9, (const void *)objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"));
  CCHmacFinal(v10, (void *)-[__CFData mutableBytes](v8, "mutableBytes"));
  -[__CFData setLength:](v8, "setLength:", v7);
  CCHmacDestroy();
  v11 = v8;
LABEL_9:

LABEL_10:
  return v11;
}

+ (uint64_t)fixedOverheadForEncryptionProtocol:(void *)a3 integrityProtocol:
{
  id v4;
  id v5;
  int v6;

  v4 = a3;
  v5 = a2;
  objc_opt_self();
  v6 = -[NEIKEv2EncryptionProtocol ivLength]((uint64_t)v5);

  LODWORD(v5) = -[NEIKEv2IntegrityProtocol digestLength]((uint64_t)v4);
  return ((_DWORD)v5 + v6);
}

+ (uint64_t)paddingLengthForPlaintextLength:(void *)a3 encryptionProtocol:
{
  id v4;
  unsigned int v5;
  int v6;

  v4 = a3;
  objc_opt_self();
  v5 = -[NEIKEv2EncryptionProtocol blockLength]((uint64_t)v4);

  v6 = ((unint64_t)a2 + 1) % v5;
  if (v6)
    return v5 - v6;
  else
    return 0;
}

+ (uint64_t)overheadForPlaintextLength:(void *)a3 encryptionProtocol:(void *)a4 integrityProtocol:
{
  id v6;
  id v7;
  int v8;
  int v9;

  v6 = a4;
  v7 = a3;
  objc_opt_self();
  v8 = +[NEIKEv2SecurityContextCBCPlusHMAC fixedOverheadForEncryptionProtocol:integrityProtocol:]((uint64_t)NEIKEv2SecurityContextCBCPlusHMAC, v7, v6);

  v9 = +[NEIKEv2SecurityContextCBCPlusHMAC paddingLengthForPlaintextLength:encryptionProtocol:]((uint64_t)NEIKEv2SecurityContextCBCPlusHMAC, a2, v7);
  return (v8 + v9 + 1);
}

@end
