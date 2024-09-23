@implementation NEIKEv2SecurityContextAESGCM

- (id)constructEncryptedPacketFromPayloadData:(id)a3 authenticatedHeaders:(id)a4
{
  id v6;
  id v7;
  NSMutableData *encryptionContext;
  NSObject *v9;
  uint64_t v10;
  int v11;
  unsigned int v12;
  int v13;
  int v14;
  NSObject *v15;
  int v16;
  int v17;
  int v18;
  NSObject *v19;
  int v21;
  NSObject *v22;
  int v23;
  int v24;
  NSObject *v25;
  const char *v26;
  int v27;
  int v28;
  char v29;
  uint8_t buf[4];
  int v31;
  _BYTE __s[24];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)__s = 136315138;
      *(_QWORD *)&__s[4] = "-[NEIKEv2SecurityContextAESGCM constructEncryptedPacketFromPayloadData:authenticatedHeaders:]";
      _os_log_fault_impl(&dword_19BD16000, v9, OS_LOG_TYPE_FAULT, "%s called with null authenticatedHeaders", __s, 0xCu);
    }
    goto LABEL_17;
  }
  if (self)
    encryptionContext = self->_encryptionContext;
  else
    encryptionContext = 0;
  v9 = encryptionContext;
  -[NSObject mutableBytes](v9, "mutableBytes");
  ccaes_gcm_encrypt_mode();
  v10 = objc_msgSend(v6, "length");
  v11 = objc_msgSend(v7, "length");
  v12 = -[NEIKEv2SecurityContext overheadForPlaintextLength:](self, "overheadForPlaintextLength:", v10);
  v13 = ccgcm_reset();
  if (v13)
  {
    v21 = v13;
    ne_log_obj();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)__s = 67109120;
      *(_DWORD *)&__s[4] = v21;
      _os_log_fault_impl(&dword_19BD16000, v22, OS_LOG_TYPE_FAULT, "ccgcm_reset failed: %d", __s, 8u);
    }

LABEL_17:
    v19 = 0;
    goto LABEL_11;
  }
  *(_DWORD *)&__s[8] = 0;
  *(_QWORD *)__s = 0;
  v14 = ccgcm_inc_iv();
  if (v14)
  {
    v23 = v14;
    memset_s(__s, 0xCuLL, 0, 0xCuLL);
    ne_log_obj();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      v31 = v23;
      _os_log_fault_impl(&dword_19BD16000, v15, OS_LOG_TYPE_FAULT, "ccgcm_inc_iv failed: %d", buf, 8u);
    }
    goto LABEL_26;
  }
  v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", v11 + (_DWORD)v10 + v12);
  -[NSObject appendData:](v15, "appendData:", v7);
  -[NSObject appendBytes:length:](v15, "appendBytes:length:", &__s[4], 8);
  memset_s(__s, 0xCuLL, 0, 0xCuLL);
  -[NSObject appendData:](v15, "appendData:", v6);
  v29 = 0;
  -[NSObject appendBytes:length:](v15, "appendBytes:length:", &v29, 1);
  -[NSObject setLength:](v15, "setLength:", -[NSObject length](v15, "length") + 16);
  -[NSObject bytes](v15, "bytes");
  v16 = ccgcm_aad();
  if (v16)
  {
    v24 = v16;
    ne_log_obj();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      v31 = v24;
      v26 = "ccgcm_aad failed: %d";
      goto LABEL_28;
    }
LABEL_25:

LABEL_26:
    v19 = 0;
    goto LABEL_10;
  }
  -[NSObject mutableBytes](v15, "mutableBytes");
  v17 = ccgcm_update();
  if (v17)
  {
    v27 = v17;
    ne_log_obj();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      v31 = v27;
      v26 = "ccgcm_update failed: %d";
      goto LABEL_28;
    }
    goto LABEL_25;
  }
  v18 = ccgcm_finalize();
  if (v18)
  {
    v28 = v18;
    ne_log_obj();
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      goto LABEL_25;
    *(_DWORD *)buf = 67109120;
    v31 = v28;
    v26 = "ccgcm_finalize failed: %d";
LABEL_28:
    _os_log_fault_impl(&dword_19BD16000, v25, OS_LOG_TYPE_FAULT, v26, buf, 8u);
    goto LABEL_25;
  }
  v19 = v15;
LABEL_10:

LABEL_11:
  return v19;
}

- (id)decryptPayloadData:(id)a3 authenticatedHeaders:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  unsigned int v10;
  NSMutableData *decryptionContext;
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
  int v25;
  const char *v26;
  int v27;
  int v28;
  NSObject *v29;
  const char *v30;
  uint8_t *p_s;
  _DWORD v32[4];
  int __s;
  const char *v34;
  uint64_t v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    ne_log_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      __s = 136315138;
      v34 = "-[NEIKEv2SecurityContextAESGCM decryptPayloadData:authenticatedHeaders:]";
      v22 = "%s called with null payloadData";
LABEL_21:
      _os_log_fault_impl(&dword_19BD16000, v12, OS_LOG_TYPE_FAULT, v22, (uint8_t *)&__s, 0xCu);
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
      __s = 136315138;
      v34 = "-[NEIKEv2SecurityContextAESGCM decryptPayloadData:authenticatedHeaders:]";
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
        __s = 67109120;
        LODWORD(v34) = v10;
        _os_log_error_impl(&dword_19BD16000, v12, OS_LOG_TYPE_ERROR, "Cannot decrypt, encrypted data length %u too short", (uint8_t *)&__s, 8u);
      }
      goto LABEL_34;
    }
    decryptionContext = self->_decryptionContext;
  }
  else
  {
    decryptionContext = 0;
  }
  v12 = decryptionContext;
  -[NSObject mutableBytes](v12, "mutableBytes");
  ccaes_gcm_decrypt_mode();
  v13 = ccgcm_reset();
  if (v13)
  {
    v23 = v13;
    ne_log_obj();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      __s = 67109120;
      LODWORD(v34) = v23;
      _os_log_fault_impl(&dword_19BD16000, v24, OS_LOG_TYPE_FAULT, "ccgcm_reset failed: %d", (uint8_t *)&__s, 8u);
    }

    goto LABEL_34;
  }
  v36 = 0;
  v35 = 0;
  if (self)
    incomingEncryptionSalt = self->_incomingEncryptionSalt;
  else
    incomingEncryptionSalt = 0;
  -[NSData getBytes:length:](incomingEncryptionSalt, "getBytes:length:", &v35, 4);
  objc_msgSend(v6, "getBytes:length:", (char *)&v35 + 4, 8);
  v15 = ccgcm_set_iv();
  if (v15)
  {
    v25 = v15;
    ne_log_obj();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      goto LABEL_37;
    __s = 67109120;
    LODWORD(v34) = v25;
    v26 = "ccgcm_set_iv failed: %d";
LABEL_29:
    _os_log_fault_impl(&dword_19BD16000, v17, OS_LOG_TYPE_FAULT, v26, (uint8_t *)&__s, 8u);
    goto LABEL_37;
  }
  objc_msgSend(v8, "length");
  objc_msgSend(v8, "bytes");
  v16 = ccgcm_aad();
  if (v16)
  {
    v27 = v16;
    ne_log_obj();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      goto LABEL_37;
    __s = 67109120;
    LODWORD(v34) = v27;
    v26 = "ccgcm_aad failed: %d";
    goto LABEL_29;
  }
  v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", v10 - 24);
  objc_msgSend(v6, "bytes");
  -[NSObject mutableBytes](v17, "mutableBytes");
  v18 = ccgcm_update();
  if (v18)
  {
    v28 = v18;
    ne_log_obj();
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
    {
LABEL_36:

      goto LABEL_37;
    }
    __s = 67109120;
    LODWORD(v34) = v28;
    v30 = "ccgcm_update failed: %d";
    p_s = (uint8_t *)&__s;
LABEL_39:
    _os_log_fault_impl(&dword_19BD16000, v29, OS_LOG_TYPE_FAULT, v30, p_s, 8u);
    goto LABEL_36;
  }
  objc_msgSend(v6, "getBytes:range:", &__s, v10 - 16, 16);
  v19 = ccgcm_finalize();
  memset_s(&__s, 0x10uLL, 0, 0x10uLL);
  if (v19)
  {
    ne_log_obj();
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      goto LABEL_36;
    v32[0] = 67109120;
    v32[1] = v19;
    v30 = "ccgcm_finalize failed: %d";
    p_s = (uint8_t *)v32;
    goto LABEL_39;
  }
  if (!+[NEIKEv2SecurityContext removePaddingFromDecryptedPayload:]((uint64_t)NEIKEv2SecurityContext, v17))
  {
LABEL_37:
    v20 = 0;
    goto LABEL_15;
  }
  v20 = v17;
LABEL_15:

LABEL_16:
  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incomingEncryptionSalt, 0);
  objc_storeStrong((id *)&self->_decryptionContext, 0);
  objc_storeStrong((id *)&self->_encryptionContext, 0);
}

- (id)initWithEncryptionProtocol:(void *)a3 outgoingEncryptionKey:(void *)a4 incomingEncryptionKey:
{
  _QWORD *v7;
  id v8;
  id v9;
  unint64_t v10;
  id *v11;
  CFIndex v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  CFIndex v17;
  __CFData *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  CFDataRef v22;
  id v23;
  NSObject *v24;
  const char *v26;
  NSObject *v27;
  NSObject *v28;
  int v29;
  CFIndex v30;
  int __s;
  _DWORD v32[7];

  *(_QWORD *)&v32[5] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!a1)
    goto LABEL_14;
  if (!v7)
  {
    ne_log_obj();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      __s = 136315138;
      *(_QWORD *)v32 = "-[NEIKEv2SecurityContextAESGCM initWithEncryptionProtocol:outgoingEncryptionKey:incomingEncryptionKey:]";
      _os_log_fault_impl(&dword_19BD16000, v13, OS_LOG_TYPE_FAULT, "%s called with null encryptionProtocol", (uint8_t *)&__s, 0xCu);
    }
    v11 = 0;
    goto LABEL_20;
  }
  v10 = v7[2];
  if (v10 > 0x1E)
  {
LABEL_14:
    v11 = 0;
    goto LABEL_21;
  }
  v11 = 0;
  if (((0x401C0000u >> v10) & 1) != 0 && v10 - 29 >= 3)
  {
    a1 = (id *)-[NEIKEv2SecurityContext initWithMinimumEncryptedPayloadSize:](a1, 25);
    if (a1)
    {
      ccaes_gcm_encrypt_mode();
      v12 = ccgcm_context_size();
      v13 = +[NSMutableData mutableSensitiveDataPrefilledWithMaxCapacity:](MEMORY[0x1E0C99DF0], v12);
      if (v13)
      {
        v14 = +[NEIKEv2Crypto createRandomWithSize:]((uint64_t)NEIKEv2Crypto, 8u);
        if (v14)
        {
          v15 = v14;
          objc_msgSend(v8, "getBytes:range:", &__s, objc_msgSend(v8, "length") - 4, 4);
          -[NSObject getBytes:length:](v15, "getBytes:length:", v32, 8);
          -[NSObject mutableBytes](v13, "mutableBytes");
          objc_msgSend(v8, "length");
          objc_msgSend(v8, "bytes");
          v16 = ccgcm_init_with_iv();
          memset_s(&__s, 0xCuLL, 0, 0xCuLL);
          if (v16)
          {
            ne_log_obj();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
            {
              LOWORD(v29) = 0;
              _os_log_fault_impl(&dword_19BD16000, v19, OS_LOG_TYPE_FAULT, "ccgcm_init_with_iv failed", (uint8_t *)&v29, 2u);
            }
            goto LABEL_17;
          }
          objc_storeStrong(a1 + 2, v13);
          ccaes_gcm_decrypt_mode();
          v17 = ccgcm_context_size();
          v18 = +[NSMutableData mutableSensitiveDataPrefilledWithMaxCapacity:](MEMORY[0x1E0C99DF0], v17);
          if (!v18)
          {
            ne_log_obj();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
            {
              v29 = 134217984;
              v30 = v17;
              _os_log_fault_impl(&dword_19BD16000, v28, OS_LOG_TYPE_FAULT, "[NEMutableSensitiveData mutableSensitiveDataPrefilledWithMaxCapacity:%zu] failed", (uint8_t *)&v29, 0xCu);
            }

            v19 = 0;
            goto LABEL_17;
          }
          v19 = v18;
          -[__CFData mutableBytes](v18, "mutableBytes");
          objc_msgSend(v9, "length");
          objc_msgSend(v9, "bytes");
          if (ccgcm_init())
          {
            ne_log_obj();
            v24 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
              goto LABEL_16;
            LOWORD(v29) = 0;
            v26 = "ccgcm_init failed";
          }
          else
          {
            objc_storeStrong(a1 + 3, v19);
            v20 = objc_msgSend(v9, "bytes");
            v21 = objc_msgSend(v9, "length");
            v22 = +[NSData sensitiveDataWithBytes:length:](MEMORY[0x1E0C99D50], (const UInt8 *)(v20 + v21 - 4), 4);
            v23 = a1[4];
            a1[4] = v22;

            if (a1[4])
            {
              v11 = a1;
LABEL_18:

LABEL_19:
LABEL_20:

              goto LABEL_21;
            }
            ne_log_obj();
            v24 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
              goto LABEL_16;
            LOWORD(v29) = 0;
            v26 = "[NESensitiveData sensitiveDataWithBytes:length:IKEv2_CRYPTO_GCM_SALT_LEN] failed";
          }
          _os_log_fault_impl(&dword_19BD16000, v24, OS_LOG_TYPE_FAULT, v26, (uint8_t *)&v29, 2u);
LABEL_16:

LABEL_17:
          v11 = 0;
          goto LABEL_18;
        }
        ne_log_obj();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        {
          __s = 67109120;
          v32[0] = 8;
          _os_log_fault_impl(&dword_19BD16000, v27, OS_LOG_TYPE_FAULT, "[NEIKEv2Crypto createRandomWithSize:%u] failed", (uint8_t *)&__s, 8u);
        }

        v15 = 0;
      }
      else
      {
        ne_log_obj();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          __s = 134217984;
          *(_QWORD *)v32 = v12;
          _os_log_fault_impl(&dword_19BD16000, v15, OS_LOG_TYPE_FAULT, "[NEMutableSensitiveData mutableSensitiveDataPrefilledWithMaxCapacity:%zu] failed", (uint8_t *)&__s, 0xCu);
        }
      }
      v11 = 0;
      goto LABEL_19;
    }
    goto LABEL_14;
  }
LABEL_21:

  return v11;
}

@end
