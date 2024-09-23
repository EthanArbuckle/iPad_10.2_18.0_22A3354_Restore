@implementation CLEEDCryptoUtilities

+ (id)getSessionIDWithPhoneNumber:(id)a3 sessionStartTime:(int64_t)a4
{
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  int64_t v17;

  v17 = a4;
  v5 = (void *)MEMORY[0x1E0C99DF0];
  v6 = objc_msgSend_length(a3, a2, (uint64_t)a3, a4);
  v9 = (void *)objc_msgSend_dataWithCapacity_(v5, v7, v6 + 8, v8);
  v12 = objc_msgSend_dataUsingEncoding_(a3, v10, 4, v11);
  objc_msgSend_appendData_(v9, v13, v12, v14);
  objc_msgSend_appendBytes_length_(v9, v15, (uint64_t)&v17, 8);
  return v9;
}

+ (__SecCertificate)copyCertFromBase64String:(id)a3
{
  id v4;
  const char *v5;
  const __CFData *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const __CFData *v10;
  __SecCertificate *v11;

  v4 = objc_alloc(MEMORY[0x1E0C99D50]);
  v6 = (const __CFData *)objc_msgSend_initWithBase64EncodedString_options_(v4, v5, (uint64_t)a3, 0);
  v10 = v6;
  if (v6 && objc_msgSend_length(v6, v7, v8, v9))
  {
    v11 = SecCertificateCreateWithData(0, v10);

    return v11;
  }
  else
  {

    return 0;
  }
}

+ (id)getECIESDecryptedData:(id)a3 key:(__SecKey *)a4 sharedInfo:(id)a5
{
  void *DecryptedDataWithParameters;
  id v6;
  NSObject *v7;
  char *v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a3 && a4 && a5)
  {
    v10 = *MEMORY[0x1E0CD6F00];
    v11 = a5;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)&v11, (uint64_t)&v10, 1);
    DecryptedDataWithParameters = (void *)SecKeyCreateDecryptedDataWithParameters();
    v6 = DecryptedDataWithParameters;
  }
  else
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
    v7 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v13 = "+[CLEEDCryptoUtilities getECIESDecryptedData:key:sharedInfo:]";
      _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,one or more input parameters is nil,early return", buf, 0xCu);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
      v9 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "+[CLEEDCryptoUtilities getECIESDecryptedData:key:sharedInfo:]", "CoreLocation: %s\n", v9);
      if (v9 != (char *)buf)
        free(v9);
    }
    return 0;
  }
  return DecryptedDataWithParameters;
}

+ (__SecKey)copyPublicKeyFromPrivateKey:(__SecKey *)a3
{
  __SecKey *result;
  NSObject *v4;
  NSObject *v5;
  char *v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
    v5 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v8 = "+[CLEEDCryptoUtilities copyPublicKeyFromPrivateKey:]";
      _os_log_impl(&dword_18F5B3000, v5, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil privateKey,early return", buf, 0xCu);
    }
    if (!sub_18F5C4AE0(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 == -1)
      goto LABEL_18;
    goto LABEL_20;
  }
  result = SecKeyCopyPublicKey(a3);
  if (result)
    return result;
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
  v4 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    v8 = "+[CLEEDCryptoUtilities copyPublicKeyFromPrivateKey:]";
    _os_log_impl(&dword_18F5B3000, v4, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,failed to copy public key from private key\n", buf, 0xCu);
  }
  if (sub_18F5C4AE0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 == -1)
    {
LABEL_18:
      v6 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "+[CLEEDCryptoUtilities copyPublicKeyFromPrivateKey:]", "CoreLocation: %s\n", v6);
      if (v6 != (char *)buf)
        free(v6);
      return 0;
    }
LABEL_20:
    dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
    goto LABEL_18;
  }
  return 0;
}

+ (id)createKeyExternalRepresentation:(__SecKey *)a3
{
  id result;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  NSObject *v46;
  CFErrorRef error;
  int v48;
  const char *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  int v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  uint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
    v46 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v57 = "+[CLEEDCryptoUtilities createKeyExternalRepresentation:]";
      _os_log_impl(&dword_18F5B3000, v46, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil key,early return", buf, 0xCu);
    }
    if (!sub_18F5C4AE0(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
    v48 = 136446210;
    v49 = "+[CLEEDCryptoUtilities createKeyExternalRepresentation:]";
    v45 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "+[CLEEDCryptoUtilities createKeyExternalRepresentation:]", "CoreLocation: %s\n", v45);
    if (v45 == (char *)buf)
      return 0;
    goto LABEL_22;
  }
  error = 0;
  result = SecKeyCopyExternalRepresentation(a3, &error);
  if (!error)
    return result;
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
  v4 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
  {
    v8 = objc_msgSend_code(error, v5, v6, v7);
    v12 = (void *)objc_msgSend_domain(error, v9, v10, v11);
    v16 = objc_msgSend_UTF8String(v12, v13, v14, v15);
    v20 = (void *)objc_msgSend_localizedDescription(error, v17, v18, v19);
    v24 = objc_msgSend_UTF8String(v20, v21, v22, v23);
    *(_DWORD *)buf = 136446978;
    v57 = "+[CLEEDCryptoUtilities createKeyExternalRepresentation:]";
    v58 = 1024;
    v59 = v8;
    v60 = 2080;
    v61 = v16;
    v62 = 2080;
    v63 = v24;
    _os_log_impl(&dword_18F5B3000, v4, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,failed to produce external representation for key,error code,%d,domain,%s,reason,%s\n", buf, 0x26u);
  }
  if (sub_18F5C4AE0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
    v28 = objc_msgSend_code(error, v25, v26, v27);
    v32 = (void *)objc_msgSend_domain(error, v29, v30, v31);
    v36 = objc_msgSend_UTF8String(v32, v33, v34, v35);
    v40 = (void *)objc_msgSend_localizedDescription(error, v37, v38, v39);
    v44 = objc_msgSend_UTF8String(v40, v41, v42, v43);
    v48 = 136446978;
    v49 = "+[CLEEDCryptoUtilities createKeyExternalRepresentation:]";
    v50 = 1024;
    v51 = v28;
    v52 = 2080;
    v53 = v36;
    v54 = 2080;
    v55 = v44;
    v45 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "+[CLEEDCryptoUtilities createKeyExternalRepresentation:]", "CoreLocation: %s\n", v45);
    if (v45 != (char *)buf)
LABEL_22:
      free(v45);
  }
  return 0;
}

+ (id)getKeyExternalRepresentation:(__SecKey *)a3
{
  uint64_t v3;
  void *KeyExternalRepresentation;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v10;
  NSObject *v11;
  char *v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
    v10 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v14 = "+[CLEEDCryptoUtilities getKeyExternalRepresentation:]";
      _os_log_impl(&dword_18F5B3000, v10, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil key,early return", buf, 0xCu);
    }
    if (!sub_18F5C4AE0(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 == -1)
      goto LABEL_18;
LABEL_20:
    dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
LABEL_18:
    v12 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "+[CLEEDCryptoUtilities getKeyExternalRepresentation:]", "CoreLocation: %s\n", v12);
    if (v12 != (char *)buf)
      free(v12);
    return 0;
  }
  KeyExternalRepresentation = (void *)objc_msgSend_createKeyExternalRepresentation_(CLEEDCryptoUtilities, a2, (uint64_t)a3, v3);
  if (KeyExternalRepresentation)
  {
    v7 = KeyExternalRepresentation;
    v8 = (void *)objc_msgSend_base64EncodedStringWithOptions_(KeyExternalRepresentation, v5, 0, v6);

    return v8;
  }
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
  v11 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    v14 = "+[CLEEDCryptoUtilities getKeyExternalRepresentation:]";
    _os_log_impl(&dword_18F5B3000, v11, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil extRep,early return", buf, 0xCu);
  }
  if (sub_18F5C4AE0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 == -1)
      goto LABEL_18;
    goto LABEL_20;
  }
  return 0;
}

+ (__SecKey)createKeyFromExternalRepresentationData:(id)a3 keyClass:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  const __CFDictionary *v7;
  __SecKey *result;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  NSObject *v51;
  CFErrorRef error;
  int v53;
  const char *v54;
  __int16 v55;
  int v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  _QWORD v61[2];
  _QWORD v62[2];
  uint8_t buf[4];
  const char *v64;
  __int16 v65;
  int v66;
  __int16 v67;
  uint64_t v68;
  __int16 v69;
  uint64_t v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  if (!a3 || !a4)
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
    v51 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v64 = "+[CLEEDCryptoUtilities createKeyFromExternalRepresentationData:keyClass:]";
      _os_log_impl(&dword_18F5B3000, v51, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,one or more input parameters is nil,early return", buf, 0xCu);
    }
    if (!sub_18F5C4AE0(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
    v53 = 136446210;
    v54 = "+[CLEEDCryptoUtilities createKeyFromExternalRepresentationData:keyClass:]";
    v50 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "+[CLEEDCryptoUtilities createKeyFromExternalRepresentationData:keyClass:]", "CoreLocation: %s\n", v50);
    if (v50 == (char *)buf)
      return 0;
    goto LABEL_23;
  }
  v5 = *MEMORY[0x1E0CD6A50];
  v6 = *MEMORY[0x1E0CD69F8];
  v61[0] = *MEMORY[0x1E0CD6A38];
  v61[1] = v6;
  v62[0] = v5;
  v62[1] = a4;
  v7 = (const __CFDictionary *)objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v62, (uint64_t)v61, 2);
  error = 0;
  result = SecKeyCreateWithData((CFDataRef)a3, v7, &error);
  if (!error)
    return result;
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
  v9 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
  {
    v13 = objc_msgSend_code(error, v10, v11, v12);
    v17 = (void *)objc_msgSend_domain(error, v14, v15, v16);
    v21 = objc_msgSend_UTF8String(v17, v18, v19, v20);
    v25 = (void *)objc_msgSend_localizedDescription(error, v22, v23, v24);
    v29 = objc_msgSend_UTF8String(v25, v26, v27, v28);
    *(_DWORD *)buf = 136446978;
    v64 = "+[CLEEDCryptoUtilities createKeyFromExternalRepresentationData:keyClass:]";
    v65 = 1024;
    v66 = v13;
    v67 = 2080;
    v68 = v21;
    v69 = 2080;
    v70 = v29;
    _os_log_impl(&dword_18F5B3000, v9, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,failed to create key from external representation,error code,%d,domain,%s,reason,%s\n", buf, 0x26u);
  }
  if (sub_18F5C4AE0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
    v33 = objc_msgSend_code(error, v30, v31, v32);
    v37 = (void *)objc_msgSend_domain(error, v34, v35, v36);
    v41 = objc_msgSend_UTF8String(v37, v38, v39, v40);
    v45 = (void *)objc_msgSend_localizedDescription(error, v42, v43, v44);
    v49 = objc_msgSend_UTF8String(v45, v46, v47, v48);
    v53 = 136446978;
    v54 = "+[CLEEDCryptoUtilities createKeyFromExternalRepresentationData:keyClass:]";
    v55 = 1024;
    v56 = v33;
    v57 = 2080;
    v58 = v41;
    v59 = 2080;
    v60 = v49;
    v50 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "+[CLEEDCryptoUtilities createKeyFromExternalRepresentationData:keyClass:]", "CoreLocation: %s\n", v50);
    if (v50 != (char *)buf)
LABEL_23:
      free(v50);
  }
  return 0;
}

+ (__SecKey)createKeyFromExternalRepresentationString:(id)a3 keyClass:(id)a4
{
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  __SecKey *KeyFromExternalRepresentationData_keyClass;
  NSObject *v11;
  NSObject *v12;
  char *v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a3 || !a4)
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
    v12 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v16 = "+[CLEEDCryptoUtilities createKeyFromExternalRepresentationString:keyClass:]";
      _os_log_impl(&dword_18F5B3000, v12, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,one or more input parameters is nil,early return", buf, 0xCu);
    }
    if (!sub_18F5C4AE0(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 == -1)
      goto LABEL_19;
    goto LABEL_21;
  }
  v6 = objc_alloc(MEMORY[0x1E0C99D50]);
  v8 = (void *)objc_msgSend_initWithBase64EncodedString_options_(v6, v7, (uint64_t)a3, 0);
  KeyFromExternalRepresentationData_keyClass = (__SecKey *)objc_msgSend_createKeyFromExternalRepresentationData_keyClass_(CLEEDCryptoUtilities, v9, (uint64_t)v8, (uint64_t)a4);

  if (!KeyFromExternalRepresentationData_keyClass)
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
    v11 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v16 = "+[CLEEDCryptoUtilities createKeyFromExternalRepresentationString:keyClass:]";
      _os_log_impl(&dword_18F5B3000, v11, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil key,early return", buf, 0xCu);
    }
    if (!sub_18F5C4AE0(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 == -1)
    {
LABEL_19:
      v14 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "+[CLEEDCryptoUtilities createKeyFromExternalRepresentationString:keyClass:]", "CoreLocation: %s\n", v14);
      if (v14 != (char *)buf)
        free(v14);
      return 0;
    }
LABEL_21:
    dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
    goto LABEL_19;
  }
  return KeyFromExternalRepresentationData_keyClass;
}

+ (id)copyAdrPublicKeyData:(id)a3
{
  uint64_t v3;
  __SecCertificate *v4;
  __SecCertificate *v5;
  __SecKey *v6;
  __SecKey *v7;
  CFDataRef v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  char *v12;
  NSObject *v13;
  char *v15;
  char *v16;
  CFErrorRef error;
  int v18;
  const char *v19;
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
    v10 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v21 = "+[CLEEDCryptoUtilities copyAdrPublicKeyData:]";
      _os_log_impl(&dword_18F5B3000, v10, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil adrCert,early return", buf, 0xCu);
    }
    if (!sub_18F5C4AE0(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
    v18 = 136446210;
    v19 = "+[CLEEDCryptoUtilities copyAdrPublicKeyData:]";
LABEL_27:
    v12 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "+[CLEEDCryptoUtilities copyAdrPublicKeyData:]", "CoreLocation: %s\n", v12);
    if (v12 != (char *)buf)
      free(v12);
    return 0;
  }
  v4 = (__SecCertificate *)objc_msgSend_copyCertFromBase64String_(CLEEDCryptoUtilities, a2, (uint64_t)a3, v3);
  if (!v4)
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
    v11 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v21 = "+[CLEEDCryptoUtilities copyAdrPublicKeyData:]";
      _os_log_impl(&dword_18F5B3000, v11, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil cert obtained from copyCertFromBase64String,early return", buf, 0xCu);
    }
    if (!sub_18F5C4AE0(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
    v18 = 136446210;
    v19 = "+[CLEEDCryptoUtilities copyAdrPublicKeyData:]";
    goto LABEL_27;
  }
  v5 = v4;
  v6 = SecCertificateCopyKey(v4);
  if (!v6)
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
    v13 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v21 = "+[CLEEDCryptoUtilities copyAdrPublicKeyData:]";
      _os_log_impl(&dword_18F5B3000, v13, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil publicKey obtained from SecCertificateCopyKey,early return", buf, 0xCu);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
      v18 = 136446210;
      v19 = "+[CLEEDCryptoUtilities copyAdrPublicKeyData:]";
      v15 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "+[CLEEDCryptoUtilities copyAdrPublicKeyData:]", "CoreLocation: %s\n", v15);
      if (v15 != (char *)buf)
        free(v15);
    }
    CFRelease(v5);
    return 0;
  }
  v7 = v6;
  error = 0;
  v8 = SecKeyCopyExternalRepresentation(v6, &error);
  if (!v8)
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
    v9 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v21 = "+[CLEEDCryptoUtilities copyAdrPublicKeyData:]";
      _os_log_impl(&dword_18F5B3000, v9, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil adrPublicKeyData obtained from SecKeyCopyExternalRepresentation,early return", buf, 0xCu);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
      v18 = 136446210;
      v19 = "+[CLEEDCryptoUtilities copyAdrPublicKeyData:]";
      v16 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "+[CLEEDCryptoUtilities copyAdrPublicKeyData:]", "CoreLocation: %s\n", v16);
      if (v16 != (char *)buf)
        free(v16);
    }
  }
  CFRelease(v5);
  CFRelease(v7);
  return v8;
}

+ (id)getRandomBytes:(int)a3
{
  uint64_t v3;
  size_t v5;
  void *v6;
  const __SecRandom *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  int v13;
  NSObject *v14;
  char *v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_msgSend_dataWithLength_(MEMORY[0x1E0C99DF0], a2, a3, v3);
  v7 = (const __SecRandom *)*MEMORY[0x1E0CD7000];
  v11 = (void *)objc_msgSend_mutableBytes(v6, v8, v9, v10);
  v12 = SecRandomCopyBytes(v7, v5, v11);
  if (v12)
  {
    v13 = v12;
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
    v14 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v18 = "+[CLEEDCryptoUtilities getRandomBytes:]";
      v19 = 1024;
      v20 = a3;
      v21 = 1024;
      v22 = v13;
      _os_log_impl(&dword_18F5B3000, v14, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,failed to create %d random bytes with error code %d\n", buf, 0x18u);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
      v16 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "+[CLEEDCryptoUtilities getRandomBytes:]", "CoreLocation: %s\n", v16);
      if (v16 != (char *)buf)
        free(v16);
    }
    return 0;
  }
  return v6;
}

+ (__SecKey)createRandomP256PrivateKey
{
  uint64_t v2;
  uint64_t v3;
  const __CFDictionary *v4;
  __SecKey *result;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  CFErrorRef error;
  int v49;
  const char *v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  uint64_t v56;
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  uint64_t v64;
  _QWORD v65[2];
  _QWORD v66[3];

  v66[2] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CD6A50];
  v3 = *MEMORY[0x1E0CD6A20];
  v65[0] = *MEMORY[0x1E0CD6A38];
  v65[1] = v3;
  v66[0] = v2;
  v66[1] = &unk_1E29B5BF0;
  v4 = (const __CFDictionary *)objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v66, (uint64_t)v65, 2);
  error = 0;
  result = SecKeyCreateRandomKey(v4, &error);
  if (error)
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
    v6 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_msgSend_code(error, v7, v8, v9);
      v14 = (void *)objc_msgSend_domain(error, v11, v12, v13);
      v18 = objc_msgSend_UTF8String(v14, v15, v16, v17);
      v22 = (void *)objc_msgSend_localizedDescription(error, v19, v20, v21);
      v26 = objc_msgSend_UTF8String(v22, v23, v24, v25);
      *(_DWORD *)buf = 136446978;
      v58 = "+[CLEEDCryptoUtilities createRandomP256PrivateKey]";
      v59 = 2048;
      v60 = v10;
      v61 = 2080;
      v62 = v18;
      v63 = 2080;
      v64 = v26;
      _os_log_impl(&dword_18F5B3000, v6, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,failed to create random P-256 private key,error code,%ld,domain,%s,reason,%s\n", buf, 0x2Au);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
      v30 = objc_msgSend_code(error, v27, v28, v29);
      v34 = (void *)objc_msgSend_domain(error, v31, v32, v33);
      v38 = objc_msgSend_UTF8String(v34, v35, v36, v37);
      v42 = (void *)objc_msgSend_localizedDescription(error, v39, v40, v41);
      v46 = objc_msgSend_UTF8String(v42, v43, v44, v45);
      v49 = 136446978;
      v50 = "+[CLEEDCryptoUtilities createRandomP256PrivateKey]";
      v51 = 2048;
      v52 = v30;
      v53 = 2080;
      v54 = v38;
      v55 = 2080;
      v56 = v46;
      v47 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "+[CLEEDCryptoUtilities createRandomP256PrivateKey]", "CoreLocation: %s\n", v47);
      if (v47 != (char *)buf)
        free(v47);
    }
    return 0;
  }
  return result;
}

+ (id)getKeyFingerprintWithKeyData:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 *v16;
  const char *v17;
  NSObject *v19;
  char *v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = a3;
    v5 = (void *)objc_msgSend_dataWithLength_(MEMORY[0x1E0C99DF0], a2, 32, v3);
    v9 = (const void *)objc_msgSend_bytes(v4, v6, v7, v8);
    LODWORD(v4) = objc_msgSend_length(v4, v10, v11, v12);
    v16 = (unsigned __int8 *)objc_msgSend_mutableBytes(v5, v13, v14, v15);
    CC_SHA256(v9, (CC_LONG)v4, v16);
    return (id)objc_msgSend_subdataWithRange_(v5, v17, 0, 2);
  }
  else
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
    v19 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v22 = "+[CLEEDCryptoUtilities getKeyFingerprintWithKeyData:]";
      _os_log_impl(&dword_18F5B3000, v19, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil keyData,early return", buf, 0xCu);
    }
    if (sub_18F5C4AE0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE1720A0 != -1)
        dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
      v20 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "+[CLEEDCryptoUtilities getKeyFingerprintWithKeyData:]", "CoreLocation: %s\n", v20);
      if (v20 != (char *)buf)
        free(v20);
    }
    return 0;
  }
}

+ (id)getKeyFingerprint:(__SecKey *)a3
{
  uint64_t v3;
  void *KeyExternalRepresentation;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  char *v9;
  uint64_t v10;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
    v7 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v13 = "+[CLEEDCryptoUtilities getKeyFingerprint:]";
      _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil key,early return", buf, 0xCu);
    }
    if (!sub_18F5C4AE0(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 == -1)
      goto LABEL_18;
LABEL_20:
    dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
LABEL_18:
    v9 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "+[CLEEDCryptoUtilities getKeyFingerprint:]", "CoreLocation: %s\n", v9);
    if (v9 != (char *)buf)
      free(v9);
    return 0;
  }
  KeyExternalRepresentation = (void *)objc_msgSend_createKeyExternalRepresentation_(CLEEDCryptoUtilities, a2, (uint64_t)a3, v3);
  if (KeyExternalRepresentation)
  {
    v5 = KeyExternalRepresentation;
    v6 = KeyExternalRepresentation;
    return (id)MEMORY[0x1E0DE7D20](CLEEDCryptoUtilities, sel_getKeyFingerprintWithKeyData_, v5, v10);
  }
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
  v8 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446210;
    v13 = "+[CLEEDCryptoUtilities getKeyFingerprint:]";
    _os_log_impl(&dword_18F5B3000, v8, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil keyData,early return", buf, 0xCu);
  }
  if (sub_18F5C4AE0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 == -1)
      goto LABEL_18;
    goto LABEL_20;
  }
  return 0;
}

+ (id)getDerivedKeyWithLength:(int)a3 secretData:(id)a4 additionalInfo:(id)a5
{
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  int AnsiX963;
  const char *v12;
  uint64_t v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  NSObject *v32;
  char *v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (!a4 || !a5)
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
    v16 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v35 = "+[CLEEDCryptoUtilities getDerivedKeyWithLength:secretData:additionalInfo:]";
      _os_log_impl(&dword_18F5B3000, v16, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,one or more input parameters is nil,early return", buf, 0xCu);
    }
    if (!sub_18F5C4AE0(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 == -1)
      goto LABEL_27;
    goto LABEL_29;
  }
  objc_msgSend_bytes(a5, a2, *(uint64_t *)&a3, (uint64_t)a4);
  objc_msgSend_length(a5, v8, v9, v10);
  AnsiX963 = CCKDFParametersCreateAnsiX963();
  if (AnsiX963)
  {
    v14 = AnsiX963;
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
    v15 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v35 = "+[CLEEDCryptoUtilities getDerivedKeyWithLength:secretData:additionalInfo:]";
      v36 = 1024;
      v37 = v14;
      _os_log_impl(&dword_18F5B3000, v15, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,failed to create ANSI X9.63 KDF params,result,%d\n", buf, 0x12u);
    }
    if (!sub_18F5C4AE0(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 == -1)
      goto LABEL_27;
    goto LABEL_29;
  }
  v17 = (void *)objc_msgSend_dataWithLength_(MEMORY[0x1E0C99DF0], v12, a3, v13);
  objc_msgSend_bytes(a4, v19, v20, v21);
  objc_msgSend_length(a4, v22, v23, v24);
  objc_msgSend_mutableBytes(v17, v25, v26, v27);
  objc_msgSend_length(v17, v28, v29, v30);
  v31 = CCDeriveKey();
  CCKDFParametersDestroy();
  if (!v31)
    return v17;
  if (qword_1EE1720A0 != -1)
    dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
  v32 = qword_1EE172098;
  if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446466;
    v35 = "+[CLEEDCryptoUtilities getDerivedKeyWithLength:secretData:additionalInfo:]";
    v36 = 1024;
    v37 = v31;
    _os_log_impl(&dword_18F5B3000, v32, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,failed to derive key,result,%d\n", buf, 0x12u);
  }
  if (sub_18F5C4AE0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 == -1)
    {
LABEL_27:
      v33 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "+[CLEEDCryptoUtilities getDerivedKeyWithLength:secretData:additionalInfo:]", "CoreLocation: %s\n", v33);
      if (v33 != (char *)buf)
        free(v33);
      return 0;
    }
LABEL_29:
    dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
    goto LABEL_27;
  }
  return 0;
}

+ (id)getGMACWithAuthData:(id)a3 key:(id)a4 iv:(id)a5
{
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  int v34;
  NSObject *v35;
  NSObject *v36;
  char *v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!a3 || !a4 || !a5)
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
    v36 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v40 = "+[CLEEDCryptoUtilities getGMACWithAuthData:key:iv:]";
      _os_log_impl(&dword_18F5B3000, v36, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,one or more input parameters is nil,early return", buf, 0xCu);
    }
    if (!sub_18F5C4AE0(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 == -1)
      goto LABEL_20;
    goto LABEL_22;
  }
  v8 = (void *)objc_msgSend_dataWithLength_(MEMORY[0x1E0C99DF0], a2, 16, (uint64_t)a4);
  objc_msgSend_bytes(a4, v9, v10, v11);
  objc_msgSend_length(a4, v12, v13, v14);
  objc_msgSend_bytes(a5, v15, v16, v17);
  objc_msgSend_length(a5, v18, v19, v20);
  objc_msgSend_bytes(a3, v21, v22, v23);
  objc_msgSend_length(a3, v24, v25, v26);
  objc_msgSend_mutableBytes(v8, v27, v28, v29);
  objc_msgSend_length(v8, v30, v31, v32);
  v33 = CCCryptorGCMOneshotEncrypt();
  if (v33)
  {
    v34 = v33;
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
    v35 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v40 = "+[CLEEDCryptoUtilities getGMACWithAuthData:key:iv:]";
      v41 = 1024;
      v42 = v34;
      _os_log_impl(&dword_18F5B3000, v35, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,failed to compute GMAC,error,%d\n", buf, 0x12u);
    }
    if (!sub_18F5C4AE0(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 == -1)
    {
LABEL_20:
      v38 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "+[CLEEDCryptoUtilities getGMACWithAuthData:key:iv:]", "CoreLocation: %s\n", v38);
      if (v38 != (char *)buf)
        free(v38);
      return 0;
    }
LABEL_22:
    dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
    goto LABEL_20;
  }
  return v8;
}

+ (id)getAESGCMDecryptedData:(id)a3 key:(id)a4 iv:(id)a5 authTag:(id)a6
{
  void *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  int v43;
  NSObject *v44;
  NSObject *v45;
  char *v47;
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  int v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (!a3 || !a4 || !a5 || !a6)
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
    v45 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v49 = "+[CLEEDCryptoUtilities getAESGCMDecryptedData:key:iv:authTag:]";
      _os_log_impl(&dword_18F5B3000, v45, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,one or more input parameters is nil,early return", buf, 0xCu);
    }
    if (!sub_18F5C4AE0(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 == -1)
      goto LABEL_21;
    goto LABEL_23;
  }
  v10 = (void *)MEMORY[0x1E0C99DF0];
  v11 = objc_msgSend_length(a3, a2, (uint64_t)a3, (uint64_t)a4);
  v14 = (void *)objc_msgSend_dataWithLength_(v10, v12, v11, v13);
  objc_msgSend_bytes(a4, v15, v16, v17);
  objc_msgSend_length(a4, v18, v19, v20);
  objc_msgSend_bytes(a5, v21, v22, v23);
  objc_msgSend_length(a5, v24, v25, v26);
  objc_msgSend_bytes(a3, v27, v28, v29);
  objc_msgSend_length(a3, v30, v31, v32);
  objc_msgSend_mutableBytes(v14, v33, v34, v35);
  objc_msgSend_bytes(a6, v36, v37, v38);
  objc_msgSend_length(a6, v39, v40, v41);
  v42 = CCCryptorGCMOneshotDecrypt();
  if (v42)
  {
    v43 = v42;
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
    v44 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v49 = "+[CLEEDCryptoUtilities getAESGCMDecryptedData:key:iv:authTag:]";
      v50 = 1024;
      v51 = v43;
      _os_log_impl(&dword_18F5B3000, v44, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,failed to decrypt data,error,%d\n", buf, 0x12u);
    }
    if (!sub_18F5C4AE0(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 == -1)
    {
LABEL_21:
      v47 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 0, "+[CLEEDCryptoUtilities getAESGCMDecryptedData:key:iv:authTag:]", "CoreLocation: %s\n", v47);
      if (v47 != (char *)buf)
        free(v47);
      return 0;
    }
LABEL_23:
    dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
    goto LABEL_21;
  }
  return v14;
}

+ (id)getECIESEncryptedData:(id)a3 key:(__SecKey *)a4 sharedInfo:(id)a5 prependKeyFingerprint:(BOOL)a6
{
  _BOOL4 v7;
  void *EncryptedDataWithParameters;
  id v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t KeyFingerprint;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  NSObject *v28;
  char *v29;
  uint64_t v30;
  id v31;
  uint8_t buf[4];
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!a3 || !a4 || !a5)
  {
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
    v12 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v33 = "+[CLEEDCryptoUtilities getECIESEncryptedData:key:sharedInfo:prependKeyFingerprint:]";
      _os_log_impl(&dword_18F5B3000, v12, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,one or more input parameters is nil,early return", buf, 0xCu);
    }
    if (!sub_18F5C4AE0(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
LABEL_24:
    v29 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "+[CLEEDCryptoUtilities getECIESEncryptedData:key:sharedInfo:prependKeyFingerprint:]", "CoreLocation: %s\n", v29);
    if (v29 != (char *)buf)
      free(v29);
    return 0;
  }
  v7 = a6;
  v30 = *MEMORY[0x1E0CD6F00];
  v31 = a5;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)&v31, (uint64_t)&v30, 1);
  EncryptedDataWithParameters = (void *)SecKeyCreateEncryptedDataWithParameters();
  v9 = EncryptedDataWithParameters;
  if (v7)
  {
    KeyFingerprint = objc_msgSend_getKeyFingerprint_(CLEEDCryptoUtilities, v10, (uint64_t)a4, v11);
    if (KeyFingerprint)
    {
      v18 = KeyFingerprint;
      v19 = (void *)MEMORY[0x1E0C99DF0];
      v20 = objc_msgSend_length(EncryptedDataWithParameters, v15, v16, v17);
      v23 = (void *)objc_msgSend_dataWithCapacity_(v19, v21, v20 + 2, v22);
      objc_msgSend_appendData_(v23, v24, v18, v25);
      objc_msgSend_appendData_(v23, v26, (uint64_t)EncryptedDataWithParameters, v27);
      return v23;
    }
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
    v28 = qword_1EE172098;
    if (os_log_type_enabled((os_log_t)qword_1EE172098, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      v33 = "+[CLEEDCryptoUtilities getECIESEncryptedData:key:sharedInfo:prependKeyFingerprint:]";
      _os_log_impl(&dword_18F5B3000, v28, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s,nil keyFingerprint,early return", buf, 0xCu);
    }
    if (!sub_18F5C4AE0(115, 0))
      return 0;
    bzero(buf, 0x65CuLL);
    if (qword_1EE1720A0 != -1)
      dispatch_once(&qword_1EE1720A0, &unk_1E2990590);
    goto LABEL_24;
  }
  return EncryptedDataWithParameters;
}

@end
