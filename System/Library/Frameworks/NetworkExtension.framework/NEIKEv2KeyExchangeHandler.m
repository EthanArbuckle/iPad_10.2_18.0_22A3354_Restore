@implementation NEIKEv2KeyExchangeHandler

- (void)setSharedSecret:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

- (BOOL)processPeerPayload:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedSecret, 0);
  objc_storeStrong((id *)&self->_keyExchangeData, 0);
}

+ (NSObject)handlerForKEMethod:(uint64_t)a1
{
  NEIKEv2KeyExchangeHandlerMODP *v3;
  NSObject *v4;
  id v5;
  void *v6;
  uint64_t v7;
  NEIKEv2KeyExchangeHandlerECDH *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  __objc2_class *v12;
  NEIKEv2KeyExchangeHandlerKyber *v13;
  NSObject *v14;
  Class v15;
  __objc2_class *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  Class isa;
  NSObject *v21;
  objc_class *v22;
  int v23;
  unint64_t v24;
  unint64_t v25;
  __CFData *v26;
  NSObject *v27;
  int v28;
  NSObject *v29;
  objc_class *v30;
  Class v31;
  NSObject *v32;
  objc_class *v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v37;
  Class v38;
  Class v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  uint64_t v43;
  Class v44;
  unint64_t v45;
  Class v46;
  Class v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  int v54;
  Class v55;
  const char *v56;
  NSObject *v57;
  uint32_t v58;
  unint64_t v59;
  Class v60;
  NSObject *v61;
  int v62;
  NSObject *v63;
  Class v64;
  objc_class *v65;
  uint8_t buf[4];
  unint64_t v67;
  __int16 v68;
  NSObject *v69;
  __int16 v70;
  unint64_t v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  if (a2 > 0x20)
    goto LABEL_17;
  if (((1 << a2) & 0x7C026) != 0)
  {
    v3 = [NEIKEv2KeyExchangeHandlerMODP alloc];
    if (!v3)
    {
      v4 = 0;
      goto LABEL_36;
    }
    v4 = -[NEIKEv2KeyExchangeHandler initWithMethod:](v3, a2);
    if (!v4)
    {
LABEL_52:
      v4 = v4;
      v9 = v4;
      goto LABEL_53;
    }
    switch(a2)
    {
      case 1uLL:
        v5 = objc_alloc(MEMORY[0x1E0C99D50]);
        v6 = &NEIKEv2CryptoDHPrimeMODP768;
        v7 = 96;
        break;
      case 2uLL:
        v5 = objc_alloc(MEMORY[0x1E0C99D50]);
        v6 = &NEIKEv2CryptoDHPrimeMODP1024;
        v7 = 128;
        break;
      case 5uLL:
        v5 = objc_alloc(MEMORY[0x1E0C99D50]);
        v6 = &NEIKEv2CryptoDHPrimeMODP1536;
        v7 = 192;
        break;
      case 0xEuLL:
        v5 = objc_alloc(MEMORY[0x1E0C99D50]);
        v6 = &NEIKEv2CryptoDHPrimeMODP2048;
        v7 = 256;
        break;
      case 0xFuLL:
        v5 = objc_alloc(MEMORY[0x1E0C99D50]);
        v6 = &NEIKEv2CryptoDHPrimeMODP3072;
        v7 = 384;
        break;
      case 0x10uLL:
        v5 = objc_alloc(MEMORY[0x1E0C99D50]);
        v6 = &NEIKEv2CryptoDHPrimeMODP4096;
        v7 = 512;
        break;
      case 0x11uLL:
        v5 = objc_alloc(MEMORY[0x1E0C99D50]);
        v6 = &NEIKEv2CryptoDHPrimeMODP6144;
        v7 = 768;
        break;
      case 0x12uLL:
        v5 = objc_alloc(MEMORY[0x1E0C99D50]);
        v6 = &NEIKEv2CryptoDHPrimeMODP8192;
        v7 = 1024;
        break;
      default:
        ne_log_obj();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134217984;
          v67 = a2;
          _os_log_fault_impl(&dword_19BD16000, v18, OS_LOG_TYPE_FAULT, "Unsupported KE method %zu", buf, 0xCu);
        }

        goto LABEL_36;
    }
    v19 = objc_msgSend(v5, "initWithBytesNoCopy:length:freeWhenDone:", v6, v7, 0);
    isa = v4[4].isa;
    v4[4].isa = (Class)v19;

    ne_log_obj();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v46 = v4[1].isa;
      *(_DWORD *)buf = 134217984;
      v67 = (unint64_t)v46;
      _os_log_debug_impl(&dword_19BD16000, v21, OS_LOG_TYPE_DEBUG, "Generate MODP DH %zu key", buf, 0xCu);
    }

    v22 = v4[4].isa;
    v65 = 0;
    -[objc_class bytes](v22, "bytes");
    -[objc_class length](v22, "length");
    v23 = SecDHCreate();
    if (v23)
    {
      v54 = v23;
      ne_log_obj();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        v55 = v4[1].isa;
        *(_DWORD *)buf = 134218240;
        v67 = (unint64_t)v55;
        v68 = 1024;
        LODWORD(v69) = v54;
        v56 = "Failed to create MODP DH %zu context: %d";
        v57 = v27;
        v58 = 18;
LABEL_81:
        _os_log_fault_impl(&dword_19BD16000, v57, OS_LOG_TYPE_FAULT, v56, buf, v58);
      }
    }
    else
    {
      v4[5].isa = v65;
      v24 = -[objc_class length](v22, "length");
      v25 = SecDHGetMaxKeyLength();
      if (v25 <= v24)
      {
        v26 = +[NSMutableData mutableSensitiveDataPrefilledWithMaxCapacity:](MEMORY[0x1E0C99DF0], v24);
        if (v26)
        {
          v27 = v26;
          -[__CFData mutableBytes](v26, "mutableBytes");
          v28 = SecDHGenerateKeypair();
          if (!v28)
          {
            objc_storeStrong((id *)&v4[2].isa, v27);
            ne_log_obj();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              v47 = v4[1].isa;
              *(_DWORD *)buf = 134217984;
              v67 = (unint64_t)v47;
              _os_log_debug_impl(&dword_19BD16000, v29, OS_LOG_TYPE_DEBUG, "Generated MODP DH %zu key", buf, 0xCu);
            }

            goto LABEL_52;
          }
          v62 = v28;
          ne_log_obj();
          v63 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_FAULT))
          {
            v64 = v4[1].isa;
            *(_DWORD *)buf = 134218240;
            v67 = (unint64_t)v64;
            v68 = 1024;
            LODWORD(v69) = v62;
            _os_log_fault_impl(&dword_19BD16000, v63, OS_LOG_TYPE_FAULT, "Failed to generate MODP DH %zu key pair: %d", buf, 0x12u);
          }

        }
        else
        {
          ne_log_obj();
          v61 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134217984;
            v67 = v24;
            _os_log_fault_impl(&dword_19BD16000, v61, OS_LOG_TYPE_FAULT, "[NEMutableSensitiveData mutableSensitiveDataPrefilledWithMaxCapacity:%zu] failed", buf, 0xCu);
          }

          v27 = 0;
        }
        goto LABEL_88;
      }
      v59 = v25;
      ne_log_obj();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      {
        v60 = v4[1].isa;
        *(_DWORD *)buf = 134218496;
        v67 = (unint64_t)v60;
        v68 = 2048;
        v69 = v59;
        v70 = 2048;
        v71 = v24;
        v56 = "Max MODP DH %zu key length (%zu) is greater than prime length (%zu)";
        v57 = v27;
        v58 = 32;
        goto LABEL_81;
      }
    }
LABEL_88:

LABEL_36:
    v9 = 0;
LABEL_53:

    return v9;
  }
  if (((1 << a2) & 0x180380000) == 0)
  {
LABEL_17:
    if (a2 - 11001 >= 2)
    {
      ne_log_obj();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v67) = a2;
        _os_log_fault_impl(&dword_19BD16000, v17, OS_LOG_TYPE_FAULT, "Unknown KE method %u", buf, 8u);
      }

      return 0;
    }
    v13 = [NEIKEv2KeyExchangeHandlerKyber alloc];
    if (!v13)
      return 0;
    v9 = -[NEIKEv2KeyExchangeHandler initWithMethod:](v13, a2);
    if (!v9)
      return v9;
    ne_log_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v50 = (unint64_t)v9[1].isa;
      *(_DWORD *)buf = 134217984;
      v67 = v50;
      _os_log_debug_impl(&dword_19BD16000, v14, OS_LOG_TYPE_DEBUG, "Generate Kyber %zu key", buf, 0xCu);
    }

    v15 = v9[1].isa;
    if (v15 == (Class)11002)
    {
      v16 = _TtC16NetworkExtension25NEIKEv2CryptoKitKyber1024;
    }
    else
    {
      if (v15 != (Class)11001)
      {
        ne_log_obj();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
        {
          v45 = (unint64_t)v9[1].isa;
          *(_DWORD *)buf = 134217984;
          v67 = v45;
          _os_log_fault_impl(&dword_19BD16000, v42, OS_LOG_TYPE_FAULT, "Invalid Kyber type %zu", buf, 0xCu);
        }
        goto LABEL_75;
      }
      v16 = _TtC16NetworkExtension24NEIKEv2CryptoKitKyber768;
    }
    v65 = 0;
    v37 = objc_msgSend([v16 alloc], "initAndReturnError:", &v65);
    v4 = v65;
    v38 = v9[4].isa;
    v9[4].isa = (Class)v37;

    v39 = v9[4].isa;
    ne_log_obj();
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = v40;
    if (v39)
    {
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        v52 = (unint64_t)v9[1].isa;
        *(_DWORD *)buf = 134217984;
        v67 = v52;
        _os_log_debug_impl(&dword_19BD16000, v41, OS_LOG_TYPE_DEBUG, "Generated Kyber %zu key", buf, 0xCu);
      }

      v42 = v9[4].isa;
      -[NSObject keyExchangeData](v42, "keyExchangeData");
      v43 = objc_claimAutoreleasedReturnValue();
      v44 = v9[2].isa;
      v9[2].isa = (Class)v43;

      goto LABEL_76;
    }
    if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
    {
      v53 = (unint64_t)v9[1].isa;
      *(_DWORD *)buf = 134218242;
      v67 = v53;
      v68 = 2112;
      v69 = v4;
      _os_log_fault_impl(&dword_19BD16000, v41, OS_LOG_TYPE_FAULT, "Failed to create Kyber %zu key: %@", buf, 0x16u);
    }

    v42 = v4;
LABEL_75:
    v4 = v9;
    v9 = 0;
LABEL_76:

    goto LABEL_53;
  }
  v8 = [NEIKEv2KeyExchangeHandlerECDH alloc];
  if (!v8)
    return 0;
  v9 = -[NEIKEv2KeyExchangeHandler initWithMethod:](v8, a2);
  if (v9)
  {
    ne_log_obj();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v48 = (unint64_t)v9[1].isa;
      *(_DWORD *)buf = 134217984;
      v67 = v48;
      _os_log_debug_impl(&dword_19BD16000, v10, OS_LOG_TYPE_DEBUG, "Generate ECDH %zu key", buf, 0xCu);
    }

    v11 = (uint64_t)v9[1].isa;
    if (v11 <= 20)
    {
      if (v11 == 19)
      {
        v12 = _TtC16NetworkExtension20NEIKEv2CryptoKitP256;
        goto LABEL_57;
      }
      if (v11 == 20)
      {
        v12 = _TtC16NetworkExtension20NEIKEv2CryptoKitP384;
        goto LABEL_57;
      }
    }
    else
    {
      switch(v11)
      {
        case 21:
          v12 = _TtC16NetworkExtension20NEIKEv2CryptoKitP521;
          goto LABEL_57;
        case 31:
          v12 = _TtC16NetworkExtension22NEIKEv2CryptoKitX25519;
          goto LABEL_57;
        case 32:
          v12 = _TtC16NetworkExtension20NEIKEv2CryptoKitX448;
LABEL_57:
          v30 = (objc_class *)objc_alloc_init(v12);
          v31 = v9[4].isa;
          v9[4].isa = v30;

          ne_log_obj();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            v49 = (unint64_t)v9[1].isa;
            *(_DWORD *)buf = 134217984;
            v67 = v49;
            _os_log_debug_impl(&dword_19BD16000, v32, OS_LOG_TYPE_DEBUG, "Generated ECDH %zu key", buf, 0xCu);
          }

          v33 = v9[4].isa;
          -[objc_class keyExchangeData](v33, "keyExchangeData");
          v34 = objc_claimAutoreleasedReturnValue();
          v35 = v9[2].isa;
          v9[2].isa = (Class)v34;
LABEL_60:

          return v9;
      }
    }
    ne_log_obj();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
    {
      v51 = (unint64_t)v9[1].isa;
      *(_DWORD *)buf = 134217984;
      v67 = v51;
      _os_log_fault_impl(&dword_19BD16000, v35, OS_LOG_TYPE_FAULT, "Invalid ECDH type %zu", buf, 0xCu);
    }
    v33 = (objc_class *)v9;
    v9 = 0;
    goto LABEL_60;
  }
  return v9;
}

- (_QWORD)initWithMethod:(void *)a1
{
  _QWORD *result;
  NSObject *v4;
  uint8_t v5[16];
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)NEIKEv2KeyExchangeHandler;
  result = objc_msgSendSuper2(&v6, sel_init);
  if (result)
  {
    result[1] = a2;
  }
  else
  {
    ne_log_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_fault_impl(&dword_19BD16000, v4, OS_LOG_TYPE_FAULT, "[super init] failed", v5, 2u);
    }

    return 0;
  }
  return result;
}

+ (NEIKEv2KeyExchangeHandlerKyber)handlerForKEMethod:(void *)a3 peerPayload:
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  NEIKEv2KeyExchangeHandlerKyber *v7;
  NEIKEv2KeyExchangeHandlerKyber *v9;
  NSObject *v10;
  NSObject *v11;
  unint64_t v12;
  __objc2_class *v13;
  NSObject *v14;
  uint64_t v15;
  _TtC16NetworkExtension19NEIKEv2CryptoKitKEM *kyberHandler;
  _TtC16NetworkExtension19NEIKEv2CryptoKitKEM *v17;
  NSObject *v18;
  NSObject *v19;
  _TtC16NetworkExtension19NEIKEv2CryptoKitKEM *v20;
  uint64_t v21;
  NSData *keyExchangeData;
  NSObject *p_super;
  uint64_t v24;
  NSData *sharedSecret;
  const char *v26;
  const char *method;
  const char *v28;
  const char *v29;
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  NEIKEv2KeyExchangeHandlerKyber *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_self();
  if (a2 <= 0x20 && ((1 << a2) & 0x1803FC026) != 0)
  {
    v6 = +[NEIKEv2KeyExchangeHandler handlerForKEMethod:](v5, a2);
    if (-[NSObject processPeerPayload:](v6, "processPeerPayload:", v4))
    {
      v7 = v6;
LABEL_5:

      goto LABEL_6;
    }
LABEL_32:
    v7 = 0;
    goto LABEL_5;
  }
  if (a2 - 11001 < 2)
  {
    v9 = [NEIKEv2KeyExchangeHandlerKyber alloc];
    v10 = v4;
    v6 = v10;
    if (!v9)
      goto LABEL_32;
    if (!v10)
    {
      ne_log_obj();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v32 = "-[NEIKEv2KeyExchangeHandlerKyber initWithKyberMethod:peerPayload:]";
        _os_log_fault_impl(&dword_19BD16000, p_super, OS_LOG_TYPE_FAULT, "%s called with null peerPayload", buf, 0xCu);
      }
      goto LABEL_30;
    }
    v7 = (NEIKEv2KeyExchangeHandlerKyber *)-[NEIKEv2KeyExchangeHandler initWithMethod:](v9, a2);
    if (!v7)
      goto LABEL_5;
    ne_log_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      method = (const char *)v7->super._method;
      *(_DWORD *)buf = 134217984;
      v32 = method;
      _os_log_debug_impl(&dword_19BD16000, v11, OS_LOG_TYPE_DEBUG, "Encapsulate Kyber %zu secret", buf, 0xCu);
    }

    v12 = v7->super._method;
    if (v12 == 11002)
    {
      v13 = _TtC16NetworkExtension25NEIKEv2CryptoKitKyber1024;
    }
    else
    {
      if (v12 != 11001)
      {
        ne_log_obj();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
        {
          v26 = (const char *)v7->super._method;
          *(_DWORD *)buf = 134217984;
          v32 = v26;
          _os_log_fault_impl(&dword_19BD16000, p_super, OS_LOG_TYPE_FAULT, "Invalid Kyber type %zu", buf, 0xCu);
        }
LABEL_29:
        v9 = v7;
LABEL_30:
        v7 = 0;
LABEL_31:

        goto LABEL_5;
      }
      v13 = _TtC16NetworkExtension24NEIKEv2CryptoKitKyber768;
    }
    v30 = 0;
    v15 = objc_msgSend([v13 alloc], "initWithPublicKeyData:error:", v6, &v30);
    v9 = (NEIKEv2KeyExchangeHandlerKyber *)v30;
    kyberHandler = v7->_kyberHandler;
    v7->_kyberHandler = (_TtC16NetworkExtension19NEIKEv2CryptoKitKEM *)v15;

    v17 = v7->_kyberHandler;
    ne_log_obj();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v17)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v28 = (const char *)v7->super._method;
        *(_DWORD *)buf = 134217984;
        v32 = v28;
        _os_log_debug_impl(&dword_19BD16000, v19, OS_LOG_TYPE_DEBUG, "Encapsulated Kyber %zu secret", buf, 0xCu);
      }

      v20 = v7->_kyberHandler;
      -[NEIKEv2CryptoKitKEM keyExchangeData](v20, "keyExchangeData");
      v21 = objc_claimAutoreleasedReturnValue();
      keyExchangeData = v7->super._keyExchangeData;
      v7->super._keyExchangeData = (NSData *)v21;

      p_super = v7->_kyberHandler;
      -[NSObject sharedSecret](p_super, "sharedSecret");
      v24 = objc_claimAutoreleasedReturnValue();
      sharedSecret = v7->super._sharedSecret;
      v7->super._sharedSecret = (NSData *)v24;

      goto LABEL_31;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      v29 = (const char *)v7->super._method;
      *(_DWORD *)buf = 134218242;
      v32 = v29;
      v33 = 2112;
      v34 = v9;
      _os_log_fault_impl(&dword_19BD16000, v19, OS_LOG_TYPE_FAULT, "Failed to encapsulate Kyber %zu secret: %@", buf, 0x16u);
    }

    p_super = &v9->super.super;
    goto LABEL_29;
  }
  ne_log_obj();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v32) = a2;
    _os_log_fault_impl(&dword_19BD16000, v14, OS_LOG_TYPE_FAULT, "Unknown KE method %u", buf, 8u);
  }

  v7 = 0;
LABEL_6:

  return v7;
}

@end
