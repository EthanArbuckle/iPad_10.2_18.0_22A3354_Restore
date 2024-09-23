@implementation NEIKEv2SecurityContextChaCha20Poly1305

- (id)constructEncryptedPacketFromPayloadData:(id)a3 authenticatedHeaders:(id)a4
{
  id v6;
  id v7;
  NSMutableData *outgoingEncryptionContext;
  NSObject *v9;
  id v10;
  uint64_t v11;
  int v12;
  unsigned int v13;
  int v14;
  unint64_t currentOutgoingIV;
  int v16;
  NSObject *v17;
  int v18;
  int v19;
  int v20;
  NSObject *v21;
  int v23;
  NSObject *v24;
  int v25;
  int v26;
  NSObject *v27;
  int v28;
  const char *v29;
  int v30;
  char v31;
  uint8_t buf[4];
  int v33;
  _BYTE __s[24];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (self)
      outgoingEncryptionContext = self->_outgoingEncryptionContext;
    else
      outgoingEncryptionContext = 0;
    v9 = outgoingEncryptionContext;
    -[NSObject mutableBytes](v9, "mutableBytes");
    ccchacha20poly1305_info();
    v10 = v6;
    v11 = objc_msgSend(v6, "length");
    v12 = objc_msgSend(v7, "length");
    v13 = -[NEIKEv2SecurityContext overheadForPlaintextLength:](self, "overheadForPlaintextLength:", v11);
    v14 = ccchacha20poly1305_reset();
    if (!v14)
    {
      *(_DWORD *)&__s[8] = 0;
      *(_QWORD *)__s = 0;
      if (self)
      {
        -[NSData getBytes:length:](self->_outgoingEncryptionSalt, "getBytes:length:", __s, 4);
        currentOutgoingIV = self->_currentOutgoingIV;
        self->_currentOutgoingIV = currentOutgoingIV + 1;
      }
      else
      {
        objc_msgSend(0, "getBytes:length:", __s, 4);
        currentOutgoingIV = 0;
      }
      *(_QWORD *)&__s[4] = currentOutgoingIV;
      v16 = ccchacha20poly1305_setnonce();
      if (v16)
      {
        v25 = v16;
        memset_s(__s, 0xCuLL, 0, 0xCuLL);
        ne_log_obj();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109120;
          v33 = v25;
          _os_log_fault_impl(&dword_19BD16000, v17, OS_LOG_TYPE_FAULT, "ccchacha20poly1305_setnonce failed: %d", buf, 8u);
        }
        v21 = 0;
        v6 = v10;
        goto LABEL_12;
      }
      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", v12 + (_DWORD)v11 + v13);
      -[NSObject appendData:](v17, "appendData:", v7);
      -[NSObject appendBytes:length:](v17, "appendBytes:length:", &__s[4], 8);
      memset_s(__s, 0xCuLL, 0, 0xCuLL);
      -[NSObject appendData:](v17, "appendData:", v6);
      v31 = 0;
      -[NSObject appendBytes:length:](v17, "appendBytes:length:", &v31, 1);
      -[NSObject setLength:](v17, "setLength:", -[NSObject length](v17, "length") + 16);
      -[NSObject bytes](v17, "bytes");
      v18 = ccchacha20poly1305_aad();
      if (v18)
      {
        v26 = v18;
        ne_log_obj();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109120;
          v33 = v26;
          _os_log_fault_impl(&dword_19BD16000, v27, OS_LOG_TYPE_FAULT, "ccchacha20poly1305_aad failed: %d", buf, 8u);
        }
        goto LABEL_25;
      }
      -[NSObject mutableBytes](v17, "mutableBytes");
      v19 = ccchacha20poly1305_encrypt();
      if (v19)
      {
        v28 = v19;
        ne_log_obj();
        v27 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
          goto LABEL_25;
        *(_DWORD *)buf = 67109120;
        v33 = v28;
        v29 = "ccchacha20poly1305_encrypt failed: %d";
      }
      else
      {
        v20 = ccchacha20poly1305_finalize();
        if (!v20)
        {
          v21 = v17;
LABEL_12:

          goto LABEL_13;
        }
        v30 = v20;
        ne_log_obj();
        v27 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        {
LABEL_25:

          v21 = 0;
          goto LABEL_12;
        }
        *(_DWORD *)buf = 67109120;
        v33 = v30;
        v29 = "ccchacha20poly1305_finalize failed: %d";
      }
      _os_log_fault_impl(&dword_19BD16000, v27, OS_LOG_TYPE_FAULT, v29, buf, 8u);
      goto LABEL_25;
    }
    v23 = v14;
    ne_log_obj();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)__s = 67109120;
      *(_DWORD *)&__s[4] = v23;
      _os_log_fault_impl(&dword_19BD16000, v24, OS_LOG_TYPE_FAULT, "ccchacha20poly1305_reset failed: %d", __s, 8u);
    }

    v21 = 0;
    v6 = v10;
  }
  else
  {
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)__s = 136315138;
      *(_QWORD *)&__s[4] = "-[NEIKEv2SecurityContextChaCha20Poly1305 constructEncryptedPacketFromPayloadData:authenticatedHeaders:]";
      _os_log_fault_impl(&dword_19BD16000, v9, OS_LOG_TYPE_FAULT, "%s called with null authenticatedHeaders", __s, 0xCu);
    }
    v21 = 0;
  }
LABEL_13:

  return v21;
}

- (id)decryptPayloadData:(id)a3 authenticatedHeaders:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  unsigned int v10;
  NSMutableData *incomingEncryptionContext;
  NSObject *v12;
  int v13;
  NSData *incomingEncryptionSalt;
  int v15;
  int v16;
  NSObject *v17;
  int v18;
  int v19;
  NSObject *v20;
  const char *v22;
  int v23;
  NSObject *v24;
  const char *v25;
  int v26;
  int v27;
  NSObject *v28;
  const char *v29;
  int v30;
  int v31;
  int v32;
  _BYTE __s[24];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    ne_log_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)__s = 136315138;
      *(_QWORD *)&__s[4] = "-[NEIKEv2SecurityContextChaCha20Poly1305 decryptPayloadData:authenticatedHeaders:]";
      v22 = "%s called with null payloadData";
LABEL_21:
      _os_log_fault_impl(&dword_19BD16000, v12, OS_LOG_TYPE_FAULT, v22, __s, 0xCu);
    }
LABEL_34:
    v20 = 0;
    goto LABEL_16;
  }
  if (!v7)
  {
    ne_log_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)__s = 136315138;
      *(_QWORD *)&__s[4] = "-[NEIKEv2SecurityContextChaCha20Poly1305 decryptPayloadData:authenticatedHeaders:]";
      v22 = "%s called with null authenticatedHeaders";
      goto LABEL_21;
    }
    goto LABEL_34;
  }
  v9 = objc_msgSend(v6, "length");
  v10 = v9;
  if (self)
  {
    if (self->super._minimumEncryptedPayloadSize > v9)
    {
      ne_log_obj();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__s = 67109120;
        *(_DWORD *)&__s[4] = v10;
        _os_log_error_impl(&dword_19BD16000, v12, OS_LOG_TYPE_ERROR, "Cannot decrypt, encrypted data length %u too short", __s, 8u);
      }
      goto LABEL_34;
    }
    incomingEncryptionContext = self->_incomingEncryptionContext;
  }
  else
  {
    incomingEncryptionContext = 0;
  }
  v12 = incomingEncryptionContext;
  -[NSObject mutableBytes](v12, "mutableBytes");
  ccchacha20poly1305_info();
  v13 = ccchacha20poly1305_reset();
  if (v13)
  {
    v23 = v13;
    ne_log_obj();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)__s = 67109120;
      *(_DWORD *)&__s[4] = v23;
      _os_log_fault_impl(&dword_19BD16000, v24, OS_LOG_TYPE_FAULT, "ccchacha20poly1305_reset failed: %d", __s, 8u);
    }

    goto LABEL_34;
  }
  *(_DWORD *)&__s[8] = 0;
  *(_QWORD *)__s = 0;
  if (self)
    incomingEncryptionSalt = self->_incomingEncryptionSalt;
  else
    incomingEncryptionSalt = 0;
  -[NSData getBytes:length:](incomingEncryptionSalt, "getBytes:length:", __s, 4);
  objc_msgSend(v6, "getBytes:length:", &__s[4], 8);
  v15 = ccchacha20poly1305_setnonce();
  memset_s(__s, 0xCuLL, 0, 0xCuLL);
  if (v15)
  {
    ne_log_obj();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      goto LABEL_37;
    v31 = 67109120;
    v32 = v15;
    v25 = "ccchacha20poly1305_setnonce failed: %d";
LABEL_29:
    _os_log_fault_impl(&dword_19BD16000, v17, OS_LOG_TYPE_FAULT, v25, (uint8_t *)&v31, 8u);
    goto LABEL_37;
  }
  objc_msgSend(v8, "length");
  objc_msgSend(v8, "bytes");
  v16 = ccchacha20poly1305_aad();
  if (v16)
  {
    v26 = v16;
    ne_log_obj();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      goto LABEL_37;
    v31 = 67109120;
    v32 = v26;
    v25 = "ccchacha20poly1305_aad failed: %d";
    goto LABEL_29;
  }
  v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", v10 - 24);
  objc_msgSend(v6, "bytes");
  -[NSObject mutableBytes](v17, "mutableBytes");
  v18 = ccchacha20poly1305_decrypt();
  if (v18)
  {
    v27 = v18;
    ne_log_obj();
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
    {
LABEL_36:

      goto LABEL_37;
    }
    v31 = 67109120;
    v32 = v27;
    v29 = "ccchacha20poly1305_decrypt failed: %d";
LABEL_39:
    _os_log_fault_impl(&dword_19BD16000, v28, OS_LOG_TYPE_FAULT, v29, (uint8_t *)&v31, 8u);
    goto LABEL_36;
  }
  v19 = ccchacha20poly1305_verify();
  if (v19)
  {
    v30 = v19;
    ne_log_obj();
    v28 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      goto LABEL_36;
    v31 = 67109120;
    v32 = v30;
    v29 = "ccchacha20poly1305_verify failed: %d";
    goto LABEL_39;
  }
  if (!+[NEIKEv2SecurityContext removePaddingFromDecryptedPayload:]((uint64_t)NEIKEv2SecurityContext, v17))
  {
LABEL_37:
    v20 = 0;
    goto LABEL_15;
  }
  v17 = v17;
  v20 = v17;
LABEL_15:

LABEL_16:
  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incomingEncryptionSalt, 0);
  objc_storeStrong((id *)&self->_outgoingEncryptionSalt, 0);
  objc_storeStrong((id *)&self->_incomingEncryptionContext, 0);
  objc_storeStrong((id *)&self->_outgoingEncryptionContext, 0);
}

- (id)initWithEncryptionProtocol:(void *)a3 outgoingEncryptionKey:(void *)a4 incomingEncryptionKey:
{
  _QWORD *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  CFDataRef v12;
  id v13;
  NSObject *v14;
  __CFData *v15;
  uint64_t v16;
  uint64_t v17;
  CFDataRef v18;
  id v19;
  __CFData *v20;
  NSObject *v21;
  id *v22;
  NSObject *v23;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  uint8_t buf[4];
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!a1)
    goto LABEL_14;
  if (!v7)
  {
    ne_log_obj();
    v23 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      goto LABEL_13;
    *(_DWORD *)buf = 136315138;
    v35 = (uint64_t)"-[NEIKEv2SecurityContextChaCha20Poly1305 initWithEncryptionProtocol:outgoingEncryptionKey:incomingEncryptionKey:]";
    v25 = "%s called with null encryptionProtocol";
    v26 = v23;
    v27 = 12;
    goto LABEL_20;
  }
  if (v7[2] != 28)
    goto LABEL_14;
  a1 = (id *)-[NEIKEv2SecurityContext initWithMinimumEncryptedPayloadSize:](a1, 25);
  if (!a1)
    goto LABEL_14;
  v10 = objc_msgSend(v8, "bytes");
  v11 = objc_msgSend(v8, "length");
  v12 = +[NSData sensitiveDataWithBytes:length:](MEMORY[0x1E0C99D50], (const UInt8 *)(v10 + v11 - 4), 4);
  v13 = a1[4];
  a1[4] = v12;

  if (a1[4])
  {
    v33 = 0;
    v14 = +[NEIKEv2Crypto createRandomWithSize:]((uint64_t)NEIKEv2Crypto, 8u);
    -[NSObject getBytes:length:](v14, "getBytes:length:", &v33, 8);
    a1[6] = v33;
    v15 = +[NSMutableData mutableSensitiveDataPrefilledWithMaxCapacity:](MEMORY[0x1E0C99DF0], 256);
    if (v15)
    {
      ccchacha20poly1305_info();
      -[__CFData mutableBytes](v15, "mutableBytes");
      objc_msgSend(v8, "bytes");
      if (ccchacha20poly1305_init())
      {
        ne_log_obj();
        v21 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
          goto LABEL_16;
        *(_WORD *)buf = 0;
        v28 = "ccchacha20poly1305_init failed";
      }
      else
      {
        objc_storeStrong(a1 + 2, v15);
        v16 = objc_msgSend(v9, "bytes");
        v17 = objc_msgSend(v9, "length");
        v18 = +[NSData sensitiveDataWithBytes:length:](MEMORY[0x1E0C99D50], (const UInt8 *)(v16 + v17 - 4), 4);
        v19 = a1[5];
        a1[5] = v18;

        if (a1[5])
        {
          v20 = +[NSMutableData mutableSensitiveDataPrefilledWithMaxCapacity:](MEMORY[0x1E0C99DF0], 256);
          if (v20)
          {
            v21 = v20;
            ccchacha20poly1305_info();
            -[NSObject mutableBytes](v21, "mutableBytes");
            objc_msgSend(v9, "bytes");
            if (!ccchacha20poly1305_init())
            {
              objc_storeStrong(a1 + 3, v21);
              v22 = a1;
LABEL_17:

              goto LABEL_18;
            }
            ne_log_obj();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_19BD16000, v32, OS_LOG_TYPE_FAULT, "ccchacha20poly1305_init failed", buf, 2u);
            }

          }
          else
          {
            ne_log_obj();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 134217984;
              v35 = 256;
              _os_log_fault_impl(&dword_19BD16000, v31, OS_LOG_TYPE_FAULT, "[NEMutableSensitiveData mutableSensitiveDataPrefilledWithMaxCapacity:%zu] failed", buf, 0xCu);
            }

            v21 = 0;
          }
LABEL_16:
          v22 = 0;
          goto LABEL_17;
        }
        ne_log_obj();
        v21 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
          goto LABEL_16;
        *(_WORD *)buf = 0;
        v28 = "[NESensitiveData sensitiveDataWithBytes:length:IKEv2_CRYPTO_CHACHAPOLY_SALT_LEN] failed";
      }
      v29 = v21;
      v30 = 2;
    }
    else
    {
      ne_log_obj();
      v21 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        goto LABEL_16;
      *(_DWORD *)buf = 134217984;
      v35 = 256;
      v28 = "[NEMutableSensitiveData mutableSensitiveDataPrefilledWithMaxCapacity:%zu] failed";
      v29 = v21;
      v30 = 12;
    }
    _os_log_fault_impl(&dword_19BD16000, v29, OS_LOG_TYPE_FAULT, v28, buf, v30);
    goto LABEL_16;
  }
  ne_log_obj();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    v25 = "[NESensitiveData sensitiveDataWithBytes:length:IKEv2_CRYPTO_CHACHAPOLY_SALT_LEN] failed";
    v26 = v23;
    v27 = 2;
LABEL_20:
    _os_log_fault_impl(&dword_19BD16000, v26, OS_LOG_TYPE_FAULT, v25, buf, v27);
  }
LABEL_13:

LABEL_14:
  v22 = 0;
LABEL_18:

  return v22;
}

@end
