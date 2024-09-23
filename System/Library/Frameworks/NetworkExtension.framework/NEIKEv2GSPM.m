@implementation NEIKEv2GSPM

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstPeerMessage, 0);
  objc_storeStrong((id *)&self->_firstLocalMessage, 0);
  objc_storeStrong((id *)&self->_spake2Handler, 0);
  objc_storeStrong((id *)&self->_nextMessage, 0);
  objc_storeStrong((id *)&self->_sessionKey, 0);
}

- (id)initWithIKESA:(id *)a1
{
  _QWORD *v3;
  _BYTE *v4;
  void *v5;
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  _BYTE *v10;
  const char *v11;
  _BYTE *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id *v19;
  _TtC16NetworkExtension26NEIKEv2CryptoKitSPAKE2Plus *v20;
  const char *v21;
  void *v22;
  const char *v23;
  _BYTE *v24;
  void *v25;
  const char *v26;
  _BYTE *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  id v34;
  NSObject *v35;
  id v36;
  id *v37;
  NSObject *v38;
  const char *v39;
  id v41;
  const char *v42;
  NSObject *v43;
  uint32_t v44;
  __CFString *String;
  _BOOL4 v46;
  NSObject *v47;
  void *v48;
  id v49;
  id obj;
  objc_super v51;
  id location;
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  _BYTE *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!a1)
  {
    v37 = 0;
    goto LABEL_30;
  }
  if (v3)
    v5 = (void *)v3[13];
  else
    v5 = 0;
  v6 = v5;

  if (!v6)
  {
    ne_log_obj();
    v38 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
      goto LABEL_28;
    *(_DWORD *)buf = 136315138;
    v54 = "-[NEIKEv2GSPM initWithIKESA:]";
    v39 = "%s called with null ikeSA.remoteSecurePasswordMethod";
LABEL_27:
    _os_log_fault_impl(&dword_19BD16000, v38, OS_LOG_TYPE_FAULT, v39, buf, 0xCu);
    goto LABEL_28;
  }
  -[NEIKEv2IKESA sharedSecret](v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    ne_log_obj();
    v38 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
      goto LABEL_28;
    *(_DWORD *)buf = 136315138;
    v54 = "-[NEIKEv2GSPM initWithIKESA:]";
    v39 = "%s called with null ikeSA.sharedSecret";
    goto LABEL_27;
  }
  v10 = -[NEIKEv2IKESA copyInitiatorIdentifier](v4, v9);

  if (!v10)
  {
    ne_log_obj();
    v38 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
      goto LABEL_28;
    *(_DWORD *)buf = 136315138;
    v54 = "-[NEIKEv2GSPM initWithIKESA:]";
    v39 = "%s called with null ikeSA.copyInitiatorIdentifier";
    goto LABEL_27;
  }
  v12 = -[NEIKEv2IKESA copyResponderIdentifier](v4, v11);

  if (!v12)
  {
    ne_log_obj();
    v38 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
      goto LABEL_28;
    *(_DWORD *)buf = 136315138;
    v54 = "-[NEIKEv2GSPM initWithIKESA:]";
    v39 = "%s called with null ikeSA.copyResponderIdentifier";
    goto LABEL_27;
  }
  if (v4)
    v13 = (void *)*((_QWORD *)v4 + 13);
  else
    v13 = 0;
  v14 = v13;
  v15 = objc_msgSend(v14, "securePasswordMethod");

  if (v15 == 11001)
  {
    location = 0;
    v16 = -[NEIKEv2IKESA createConcatedNoncesAndReturnError:](v4, (char *)&location);
    v48 = v16;
    if (!v16)
    {
      ne_log_obj();
      v18 = objc_claimAutoreleasedReturnValue();
      v46 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
      v41 = location;
      if (v46)
      {
        *(_DWORD *)buf = 138412546;
        v54 = (const char *)location;
        v55 = 2112;
        v56 = v4;
        _os_log_error_impl(&dword_19BD16000, v18, OS_LOG_TYPE_ERROR, "Failed to retrieve concatenated nonces %@ for %@", buf, 0x16u);
      }
      v37 = 0;
      goto LABEL_34;
    }
    v17 = v16;
    v18 = -[NEIKEv2IKESA createConcatenatedSPIsAndReturnError:](v4, (char *)&location);
    if (v18)
    {
      v51.receiver = a1;
      v51.super_class = (Class)NEIKEv2GSPM;
      v19 = (id *)objc_msgSendSuper2(&v51, sel_init);
      if (!v19)
      {
        ne_log_obj();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_19BD16000, v35, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
        }
        a1 = 0;
        goto LABEL_32;
      }
      a1 = v19;
      v20 = [_TtC16NetworkExtension26NEIKEv2CryptoKitSPAKE2Plus alloc];
      -[NEIKEv2IKESA sharedSecret](v4, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[NEIKEv2IKESA copyInitiatorIdentifier](v4, v23);
      objc_msgSend(v24, "identifierData");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[NEIKEv2IKESA copyResponderIdentifier](v4, v26);
      objc_msgSend(v27, "identifierData");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
        v29 = v4[9] & 1;
      else
        v29 = 0;
      obj = location;
      v30 = -[NEIKEv2CryptoKitSPAKE2Plus initWithSeed:initiatorID:responderID:salt:context:forInitiator:error:](v20, "initWithSeed:initiatorID:responderID:salt:context:forInitiator:error:", v22, v25, v28, v17, v18, v29, &obj);
      v31 = obj;
      objc_storeStrong(&location, obj);
      v32 = a1[3];
      a1[3] = (id)v30;

      v33 = a1[3];
      if (v33)
      {
        v49 = v31;
        v34 = v33;
        objc_msgSend(v34, "getFirstMessageAndReturnError:", &v49);
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = v49;
        location = v36;

        if (v35)
        {
          objc_storeStrong(a1 + 4, v35);
          objc_storeStrong(a1 + 2, v35);
          a1 = a1;
          v37 = a1;
LABEL_33:

          v41 = location;
LABEL_34:

          goto LABEL_29;
        }
        ne_log_obj();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v54 = (const char *)v36;
          _os_log_error_impl(&dword_19BD16000, v47, OS_LOG_TYPE_ERROR, "Failed to get first message from SPAKE2 handler %@", buf, 0xCu);
        }

        v35 = 0;
LABEL_32:
        v37 = 0;
        goto LABEL_33;
      }
      ne_log_obj();
      v35 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        goto LABEL_32;
      *(_DWORD *)buf = 138412290;
      v54 = (const char *)v31;
      v42 = "Failed to create SPAKE2 handler %@";
      v43 = v35;
      v44 = 12;
    }
    else
    {
      ne_log_obj();
      v35 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        goto LABEL_32;
      *(_DWORD *)buf = 138412546;
      v54 = (const char *)location;
      v55 = 2112;
      v56 = v4;
      v42 = "Failed to retrieve concatenated SPIs %@ for %@";
      v43 = v35;
      v44 = 22;
    }
    _os_log_error_impl(&dword_19BD16000, v43, OS_LOG_TYPE_ERROR, v42, buf, v44);
    goto LABEL_32;
  }
  ne_log_obj();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
  {
    String = (__CFString *)NEIKEv2SecurePasswordMethodCreateString(v15);
    *(_DWORD *)buf = 138412290;
    v54 = (const char *)String;
    _os_log_fault_impl(&dword_19BD16000, v38, OS_LOG_TYPE_FAULT, "Support for secure password method %@ is not implemented", buf, 0xCu);

  }
LABEL_28:

  v37 = 0;
LABEL_29:

LABEL_30:
  return v37;
}

- (void)createLocalSignedOctets
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (!*(_QWORD *)(a1 + 32))
  {
    ne_log_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
LABEL_8:

      return 0;
    }
    v10 = 136315138;
    v11 = "-[NEIKEv2GSPM createLocalSignedOctets]";
    v8 = "%s called with null self.firstLocalMessage";
LABEL_12:
    _os_log_fault_impl(&dword_19BD16000, v7, OS_LOG_TYPE_FAULT, v8, (uint8_t *)&v10, 0xCu);
    goto LABEL_8;
  }
  v2 = *(void **)(a1 + 40);
  if (!v2)
  {
    ne_log_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      goto LABEL_8;
    v10 = 136315138;
    v11 = "-[NEIKEv2GSPM createLocalSignedOctets]";
    v8 = "%s called with null self.firstPeerMessage";
    goto LABEL_12;
  }
  v3 = v2;
  v4 = objc_msgSend(v3, "length");
  v5 = objc_msgSend(*(id *)(a1 + 40), "length") + v4;

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", v5);
  objc_msgSend(v6, "appendData:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v6, "appendData:", *(_QWORD *)(a1 + 40));
  return v6;
}

- (void)createRemoteSignedOctets
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = *(void **)(a1 + 40);
  if (!v2)
  {
    ne_log_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
LABEL_8:

      return 0;
    }
    v10 = 136315138;
    v11 = "-[NEIKEv2GSPM createRemoteSignedOctets]";
    v8 = "%s called with null self.firstPeerMessage";
LABEL_12:
    _os_log_fault_impl(&dword_19BD16000, v7, OS_LOG_TYPE_FAULT, v8, (uint8_t *)&v10, 0xCu);
    goto LABEL_8;
  }
  if (!*(_QWORD *)(a1 + 32))
  {
    ne_log_obj();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      goto LABEL_8;
    v10 = 136315138;
    v11 = "-[NEIKEv2GSPM createRemoteSignedOctets]";
    v8 = "%s called with null self.firstLocalMessage";
    goto LABEL_12;
  }
  v3 = v2;
  v4 = objc_msgSend(v3, "length");
  v5 = objc_msgSend(*(id *)(a1 + 40), "length") + v4;

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", v5);
  objc_msgSend(v6, "appendData:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v6, "appendData:", *(_QWORD *)(a1 + 32));
  return v6;
}

@end
