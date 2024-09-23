@implementation FMDCryptoUtil

+ (BOOL)generatePublicPrivateKeyPair:(id *)a3 privateKey:(id *)a4
{
  const __CFDictionary *v6;
  __SecKey *v7;
  BOOL v8;
  BOOL v9;
  __SecKey *v10;
  id v11;
  id v12;
  NSObject *v13;
  CFErrorRef error;
  uint8_t buf[4];
  CFErrorRef v17;
  _QWORD v18[2];
  _QWORD v19[2];

  v18[0] = kSecAttrKeyType;
  v18[1] = kSecAttrKeySizeInBits;
  v19[0] = kSecAttrKeyTypeEC;
  v19[1] = &off_1000398D0;
  v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 2));
  error = 0;
  v7 = SecKeyCreateRandomKey(v6, &error);
  if (error)
    v8 = 1;
  else
    v8 = v7 == 0;
  v9 = !v8;
  if (v8)
  {
    v12 = sub_100005190();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = error;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "### key gen completed with %@", buf, 0xCu);
    }

  }
  else
  {
    v10 = v7;
    v11 = +[FMDCryptoUtil keyToData:](FMDCryptoUtil, "keyToData:", SecKeyCopyPublicKey(v7));
    *a3 = (id)objc_claimAutoreleasedReturnValue(v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[FMDCryptoUtil keyToData:](FMDCryptoUtil, "keyToData:", v10));
  }

  return v9;
}

+ (id)decryptData:(id)a3 privateKeyData:(id)a4
{
  const __CFData *v6;
  id v7;
  void *v8;
  CFDataRef v9;
  id v10;
  NSObject *v11;
  __SecKey *v12;
  __SecKey *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  __SecKey *v18;
  const __CFData *v19;
  CFErrorRef v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  CFErrorRef error;
  uint8_t buf[4];
  __SecKey *v32;
  __int16 v33;
  const __CFData *v34;

  v6 = (const __CFData *)a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    v10 = sub_100005190();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (__SecKey *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fm_hexString"));
      *(_DWORD *)buf = 138412546;
      v32 = v12;
      v33 = 2112;
      v34 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "### privateKey = %@ cipherText = %@", buf, 0x16u);

    }
    v13 = (__SecKey *)objc_msgSend((id)objc_opt_class(a1), "dataToKey:isPublic:", v8, 0);
    v14 = sub_100005190();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "### decoded privateKey = %@", buf, 0xCu);
    }

    error = 0;
    v9 = SecKeyCreateDecryptedData(v13, kSecKeyAlgorithmECIESEncryptionStandardVariableIVX963SHA256AESGCM, v6, &error);
    if (v9)
    {
      v16 = sub_100005190();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = (__SecKey *)-[__CFData bytes](objc_retainAutorelease(v9), "bytes");
        *(_DWORD *)buf = 136315138;
        v32 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "### decryption success with cipherText = %s", buf, 0xCu);
      }

      v19 = v9;
    }
    else
    {
      v20 = error;
      v21 = sub_100005190();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_10001FFF8((uint64_t)v20, v22, v23, v24, v25, v26, v27, v28);

    }
  }

  return v9;
}

+ (void)testCrypto
{
  const __CFDictionary *v3;
  __SecKey *v4;
  id v5;
  NSObject *v6;
  __SecKey *v7;
  NSObject *v8;
  id v9;
  size_t v10;
  id v11;
  NSObject *v12;
  size_t BlockSize;
  NSObject *v14;
  id v15;
  NSObject *v16;
  id v17;
  CFDataRef v18;
  id v19;
  NSObject *v20;
  __CFError *v21;
  void *v22;
  CFErrorRef v23;
  NSObject *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  CFErrorRef v34;
  id v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  CFErrorRef v44;
  CFErrorRef error;
  uint8_t buf[4];
  CFErrorRef v47;
  __int16 v48;
  id v49;
  _QWORD v50[2];
  _QWORD v51[2];

  v50[0] = kSecAttrKeyType;
  v50[1] = kSecAttrKeySizeInBits;
  v51[0] = kSecAttrKeyTypeEC;
  v51[1] = &off_1000398D0;
  v3 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v51, v50, 2));
  error = 0;
  v4 = SecKeyCreateRandomKey(v3, &error);
  v5 = sub_100005190();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v47 = error;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "### key gen completed with %@", buf, 0xCu);
  }

  v7 = SecKeyCopyPublicKey(v4);
  if (SecKeyIsAlgorithmSupported(v7, kSecKeyOperationTypeEncrypt, kSecKeyAlgorithmECIESEncryptionStandardVariableIVX963SHA256AESGCM))
  {
    v8 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", "This is a secret!\n", 19));
    v9 = -[NSObject length](v8, "length");
    v10 = SecKeyGetBlockSize(v7) - 130;
    v11 = sub_100005190();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      BlockSize = SecKeyGetBlockSize(v7);
      *(_DWORD *)buf = 134217984;
      v47 = (CFErrorRef)(BlockSize - 130);
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "### max message size %lu", buf, 0xCu);
    }

    if ((unint64_t)v9 >= v10)
    {
      v33 = sub_100005190();
      v14 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_100020188(v8);
    }
    else
    {
      v44 = 0;
      v14 = SecKeyCreateEncryptedData(v7, kSecKeyAlgorithmECIESEncryptionStandardVariableIVX963SHA256AESGCM, (CFDataRef)v8, &v44);
      if (v14)
      {
        v15 = sub_100005190();
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = -[NSObject bytes](objc_retainAutorelease(v14), "bytes");
          *(_DWORD *)buf = 138412546;
          v47 = (CFErrorRef)v14;
          v48 = 2080;
          v49 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "### encryption success with cipherText = %@\n cipherString = %s", buf, 0x16u);
        }

        v44 = 0;
        v18 = SecKeyCreateDecryptedData(v4, kSecKeyAlgorithmECIESEncryptionStandardVariableIVX963SHA256AESGCM, (CFDataRef)v14, &v44);
        if (v18)
        {
          v19 = sub_100005190();
          v20 = objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v21 = (__CFError *)-[__CFData bytes](objc_retainAutorelease(v18), "bytes");
            *(_DWORD *)buf = 136315138;
            v47 = v21;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "### decryption success with cipherText = %s", buf, 0xCu);
          }

          v22 = (void *)objc_opt_class(a1);
          v23 = (CFErrorRef)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "keyToData:", v7));
          v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "keyToData:", v4));
          objc_msgSend(v22, "testCrypto2:privateKey:", v23, v24);
        }
        else
        {
          v23 = v44;
          v43 = sub_100005190();
          v24 = objc_claimAutoreleasedReturnValue(v43);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            sub_1000200F4(v23);
        }

      }
      else
      {
        v34 = v44;
        v35 = sub_100005190();
        v36 = objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          sub_100020090((uint64_t)v34, v36, v37, v38, v39, v40, v41, v42);

      }
    }

  }
  else
  {
    v25 = sub_100005190();
    v8 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10002005C(v8, v26, v27, v28, v29, v30, v31, v32);
  }

}

+ (void)testCrypto2:(id)a3 privateKey:(id)a4
{
  NSObject *v6;
  id v7;
  __SecKey *v8;
  __SecKey *v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  id v17;
  size_t v18;
  id v19;
  NSObject *v20;
  size_t BlockSize;
  NSObject *v22;
  id v23;
  NSObject *v24;
  id v25;
  CFDataRef v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  NSObject *v47;
  CFErrorRef error;
  uint8_t buf[4];
  NSObject *v50;
  __int16 v51;
  id v52;

  v6 = a3;
  v7 = a4;
  v8 = (__SecKey *)objc_msgSend((id)objc_opt_class(a1), "dataToKey:isPublic:", v7, 0);
  v9 = (__SecKey *)objc_msgSend((id)objc_opt_class(a1), "dataToKey:isPublic:", v6, 1);
  v10 = sub_100005190();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v50 = v6;
    v51 = 2112;
    v52 = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "### publicKeyData = %@ privateKeyData = %@", buf, 0x16u);
  }

  v12 = sub_100005190();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = -[NSObject bytes](objc_retainAutorelease(v6), "bytes");
    v15 = objc_msgSend(objc_retainAutorelease(v7), "bytes");
    *(_DWORD *)buf = 136315394;
    v50 = v14;
    v51 = 2080;
    v52 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "### string publicKeyData = %s privateKeyData = %s", buf, 0x16u);
  }

  if (SecKeyIsAlgorithmSupported(v9, kSecKeyOperationTypeEncrypt, kSecKeyAlgorithmECIESEncryptionStandardVariableIVX963SHA256AESGCM))
  {
    v16 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", "This is a secret!\n", 19));
    v17 = -[NSObject length](v16, "length");
    v18 = SecKeyGetBlockSize(v9) - 130;
    v19 = sub_100005190();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      BlockSize = SecKeyGetBlockSize(v9);
      *(_DWORD *)buf = 134217984;
      v50 = (BlockSize - 130);
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "### max message size %lu", buf, 0xCu);
    }

    if ((unint64_t)v17 >= v18)
    {
      v38 = sub_100005190();
      v22 = objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_100020188(v16);
    }
    else
    {
      error = 0;
      v22 = SecKeyCreateEncryptedData(v9, kSecKeyAlgorithmECIESEncryptionStandardVariableIVX963SHA256AESGCM, (CFDataRef)v16, &error);
      if (v22)
      {
        v23 = sub_100005190();
        v24 = objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v25 = -[NSObject bytes](objc_retainAutorelease(v22), "bytes");
          *(_DWORD *)buf = 138412546;
          v50 = v22;
          v51 = 2080;
          v52 = v25;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "### encryption success with cipherText = %@\n cipherString = %s", buf, 0x16u);
        }

        error = 0;
        v26 = SecKeyCreateDecryptedData(v8, kSecKeyAlgorithmECIESEncryptionStandardVariableIVX963SHA256AESGCM, (CFDataRef)v22, &error);
        if (v26)
        {
          v27 = sub_100005190();
          v28 = objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            v29 = -[__CFData bytes](objc_retainAutorelease(v26), "bytes");
            *(_DWORD *)buf = 136315138;
            v50 = v29;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "### decryption success with cipherText = %s", buf, 0xCu);
          }
        }
        else
        {
          v28 = error;
          v46 = sub_100005190();
          v47 = objc_claimAutoreleasedReturnValue(v46);
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            sub_1000200F4(v28);

        }
      }
      else
      {
        v26 = error;
        v39 = sub_100005190();
        v28 = objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          sub_100020090((uint64_t)v26, v28, v40, v41, v42, v43, v44, v45);
      }

    }
  }
  else
  {
    v30 = sub_100005190();
    v16 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_10002005C(v16, v31, v32, v33, v34, v35, v36, v37);
  }

}

+ (id)keyToData:(__SecKey *)a3
{
  CFDataRef v3;
  CFErrorRef v4;
  id v5;
  NSObject *v6;
  CFErrorRef error;
  uint8_t buf[4];
  CFErrorRef v10;

  error = 0;
  v3 = SecKeyCopyExternalRepresentation(a3, &error);
  if (!v3)
  {
    v4 = error;
    v5 = sub_100005190();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "### error converting keys = %@", buf, 0xCu);
    }

  }
  return v3;
}

+ (__SecKey)dataToKey:(id)a3 isPublic:(BOOL)a4
{
  const CFStringRef *v4;
  CFStringRef v5;
  const __CFData *v6;
  const __CFDictionary *v7;
  __SecKey *v8;
  CFErrorRef v9;
  id v10;
  NSObject *v11;
  CFErrorRef error;
  uint8_t buf[4];
  CFErrorRef v15;
  _QWORD v16[3];
  _QWORD v17[3];

  if (!a3)
    return 0;
  v16[0] = kSecAttrKeyType;
  v16[1] = kSecAttrKeyClass;
  v4 = &kSecAttrKeyClassPublic;
  if (!a4)
    v4 = &kSecAttrKeyClassPrivate;
  v5 = *v4;
  v17[0] = kSecAttrKeyTypeEC;
  v17[1] = v5;
  v16[2] = kSecAttrKeySizeInBits;
  v17[2] = &off_1000398D0;
  v6 = (const __CFData *)a3;
  v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 3));
  error = 0;
  v8 = SecKeyCreateWithData(v6, v7, &error);

  if (!v8)
  {
    v9 = error;
    v10 = sub_100005190();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "### error generating keys = %@", buf, 0xCu);
    }

  }
  return v8;
}

+ (id)publicKeyFromPrivateKey:(id)a3
{
  id v4;
  __SecKey *v5;
  SecKeyRef v6;
  id v7;
  void *v8;

  v4 = a3;
  v5 = (__SecKey *)objc_msgSend((id)objc_opt_class(a1), "dataToKey:isPublic:", v4, 0);

  if (v5)
  {
    v6 = SecKeyCopyPublicKey(v5);
    v7 = objc_msgSend((id)objc_opt_class(a1), "keyToData:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

@end
