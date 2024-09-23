@implementation NDOBAAManager

- (BOOL)generateBAACertficate:(id)a3
{
  id v3;
  dispatch_semaphore_t v4;
  int IsSupported;
  NSObject *v6;
  SecAccessControlRef v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  id v15;
  dispatch_time_t v16;
  NSObject *v17;
  BOOL v18;
  id v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  CFErrorRef error;
  uint8_t v25[4];
  const char *v26;
  __int16 v27;
  int v28;
  _QWORD v29[5];
  _BYTE buf[24];
  char v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = dispatch_semaphore_create(0);
  IsSupported = DeviceIdentityIsSupported();
  _NDOLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = "-[NDOBAAManager generateBAACertficate:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = IsSupported;
    _os_log_impl(&dword_22D064000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s: deviceIdentitySupported on this device:%d", buf, 0x12u);
  }

  if (IsSupported)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v31 = 0;
    error = 0;
    v7 = SecAccessControlCreateWithFlags(0, (CFTypeRef)*MEMORY[0x24BDE8F70], 0x40000000uLL, &error);
    if (v7)
    {
      v8 = objc_alloc(MEMORY[0x24BDBCEB8]);
      v9 = *MEMORY[0x24BE2C400];
      v29[0] = *MEMORY[0x24BE2C458];
      v29[1] = v9;
      v10 = *MEMORY[0x24BE2C3F8];
      v29[2] = *MEMORY[0x24BE2C420];
      v29[3] = v10;
      v29[4] = *MEMORY[0x24BE2C410];
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v8, "initWithArray:", v11);

      v13 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      objc_msgSend(v13, "setObject:forKeyedSubscript:", CFSTR("com.apple.ndoagent.baaCertificates"), *MEMORY[0x24BE2C3D0]);
      objc_msgSend(v13, "setObject:forKeyedSubscript:", CFSTR("com.apple.ndoagent"), *MEMORY[0x24BE2C3C8]);
      objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE2C3A8]);
      objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_24F8247B8, *MEMORY[0x24BE2C3E0]);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BE2C470]);

      objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_24F8247D0, *MEMORY[0x24BE2C480]);
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE2C398]);
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE2C448]);
      v15 = v13;
      v23 = v3;
      v22 = v4;
      DeviceIdentityIssueClientCertificateWithCompletion();
      v16 = dispatch_time(0, 60000000000);
      if (dispatch_semaphore_wait(v22, v16))
      {
        _NDOLogSystem();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v25 = 136446466;
          v26 = "-[NDOBAAManager generateBAACertficate:]";
          v27 = 1024;
          v28 = 60;
          _os_log_impl(&dword_22D064000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s: Installation timed out after %d seconds", v25, 0x12u);
        }

      }
      CFRelease(v7);
      v18 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;
    }
    else
    {
      _NDOLogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        -[__CFError description](error, "description");
        v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v21 = objc_msgSend(v20, "UTF8String");
        *(_DWORD *)v25 = 136315138;
        v26 = (const char *)v21;
        _os_log_error_impl(&dword_22D064000, v12, OS_LOG_TYPE_ERROR, "Failed to create access control: %s", v25, 0xCu);

      }
      v18 = 0;
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

void __39__NDOBAAManager_generateBAACertficate___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  __int128 v23;
  id v24;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    if (a2 && v7)
    {
      objc_msgSend(*(id *)(a1 + 40), "setPrivateKey:", a2);
      objc_msgSend(*(id *)(a1 + 40), "setClientCertArray:", v7);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    }
    else if (!a2 || !objc_msgSend(v7, "count"))
    {
      _NDOLogSystem();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        __39__NDOBAAManager_generateBAACertficate___block_invoke_cold_1(v17, v18, v19);

    }
    v20 = *(_QWORD *)(a1 + 56);
    if (v20)
    {
      objc_msgSend(*(id *)(a1 + 40), "clientCertArray");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, uint64_t, _QWORD))(v20 + 16))(v20, v21, objc_msgSend(*(id *)(a1 + 40), "privateKey"), 0);

    }
    goto LABEL_19;
  }
  if ((mobileactivationErrorHasDomainAndErrorCode() & 1) == 0
    && !mobileactivationErrorHasDomainAndErrorCode())
  {
    v22 = *(_QWORD *)(a1 + 56);
    if (v22)
      (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v22 + 16))(v22, 0, 0, v8);
LABEL_19:
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
    goto LABEL_20;
  }
  _NDOLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    __39__NDOBAAManager_generateBAACertficate___block_invoke_cold_2((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE2C470]);
  v23 = *(_OWORD *)(a1 + 56);
  v16 = (id)v23;
  v24 = *(id *)(a1 + 48);
  DeviceIdentityIssueClientCertificateWithCompletion();

LABEL_20:
}

void __39__NDOBAAManager_generateBAACertficate___block_invoke_8(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  if (a2 && v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "setPrivateKey:", a2);
    objc_msgSend(*(id *)(a1 + 32), "setClientCertArray:", v10);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  v8 = *(_QWORD *)(a1 + 48);
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "clientCertArray");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, uint64_t, id))(v8 + 16))(v8, v9, objc_msgSend(*(id *)(a1 + 32), "privateKey"), v7);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (BOOL)addBAAAuthenticationHeadersToRequest:(id)a3 withBody:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  _BOOL4 v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v24;
  const char *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a3;
  -[NDOBAAManager signDataAndEncodeToBase64:withPrivateKey:status:](self, "signDataAndEncodeToBase64:withPrivateKey:status:", v8, -[NDOBAAManager privateKey](self, "privateKey"), a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[NDOBAAManager clientCertArray](self, "clientCertArray");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOBAAManager certificatesEncodeToBase64:status:](self, "certificatesEncodeToBase64:status:", v11, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setValue:forHTTPHeaderField:", v10, CFSTR("X-Apple-Baa-S"));
  objc_msgSend(v9, "setValue:forHTTPHeaderField:", v12, CFSTR("X-Apple-Baa"));

  if (v10)
    v13 = v12 == 0;
  else
    v13 = 1;
  v14 = !v13;
  _NDOLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 136446722;
      v25 = "-[NDOBAAManager addBAAAuthenticationHeadersToRequest:withBody:error:]";
      v26 = 2112;
      v27 = v10;
      v28 = 2112;
      v29 = v12;
      _os_log_impl(&dword_22D064000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s: signatureDataString: %@\n certificateString: %@", (uint8_t *)&v24, 0x20u);
    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    -[NDOBAAManager addBAAAuthenticationHeadersToRequest:withBody:error:].cold.1((uint64_t)a5, v16, v17, v18, v19, v20, v21, v22);
  }

  return v14;
}

- (id)signDataAndEncodeToBase64:(id)a3 withPrivateKey:(__SecKey *)a4 status:(id *)a5
{
  CFDataRef v5;
  CFDataRef v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  CFErrorRef error;

  error = 0;
  v5 = SecKeyCreateSignature(a4, (SecKeyAlgorithm)*MEMORY[0x24BDE92D0], (CFDataRef)a3, &error);
  v6 = v5;
  if (v5)
  {
    -[__CFData base64EncodedStringWithOptions:](v5, "base64EncodedStringWithOptions:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (error)
    {
      _NDOLogSystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[NDOBAAManager signDataAndEncodeToBase64:withPrivateKey:status:].cold.1((uint64_t *)&error, v8, v9);

      CFRelease(error);
    }
    v7 = 0;
  }

  return v7;
}

- (id)certificatesEncodeToBase64:(id)a3 status:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;

  -[NDOBAAManager serializeCertificateChain:](self, "serializeCertificateChain:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDOBAAManager _compressCertificates:](self, "_compressCertificates:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _NDOLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[NDOBAAManager certificatesEncodeToBase64:status:].cold.1(v9);

    v8 = 0;
  }

  return v8;
}

- (id)serializeCertificateChain:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CFDataRef v10;
  NSObject *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[4];
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = SecCertificateCopyData(*(SecCertificateRef *)(*((_QWORD *)&v14 + 1) + 8 * v9));
        if (-[__CFData length](v10, "length", (_QWORD)v14))
        {
          -[__CFData base64EncodedStringWithOptions:](v10, "base64EncodedStringWithOptions:", 0);
          v11 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v11);
        }
        else
        {
          _NDOLogSystem();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            -[NDOBAAManager serializeCertificateChain:].cold.1(v18, &v19, v11);
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v7);
  }

  v12 = (void *)objc_msgSend(v4, "copy");
  return v12;
}

- (void)writeCertsToDevice:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  __SecCertificate *v6;
  __SecCertificate *v7;
  CFDataRef v8;

  v3 = a3;
  v4 = v3;
  if (v3 && (unint64_t)objc_msgSend(v3, "count") > 1)
  {
    v6 = (__SecCertificate *)objc_msgSend(v4, "objectAtIndex:", 0);
    v7 = (__SecCertificate *)objc_msgSend(v4, "objectAtIndex:", 1);
    v5 = SecCertificateCopyData(v6);
    v8 = SecCertificateCopyData(v7);
    -[NSObject writeToFile:atomically:](v5, "writeToFile:atomically:", CFSTR("/tmp/leafCertificate"), 1);
    -[__CFData writeToFile:atomically:](v8, "writeToFile:atomically:", CFSTR("/tmp/intermediateCertificate"), 1);

  }
  else
  {
    _NDOLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[NDOBAAManager writeCertsToDevice:].cold.1(v5);
  }

}

- (id)_compressCertificates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = CFSTR("certs");
  v13[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v5, 0, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  if (objc_msgSend(v6, "length"))
  {
    -[NDOBAAManager _zlibCompressionForData:](self, "_zlibCompressionForData:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v7)
    {
      _NDOLogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[NDOBAAManager _compressCertificates:].cold.1(v7, v9);

    }
    v8 = 0;
  }

  return v8;
}

- (id)_zlibCompressionForData:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint8_t *v6;
  size_t v7;
  id v8;
  const uint8_t *v9;
  size_t v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDBCEC8];
  v4 = a3;
  objc_msgSend(v3, "dataWithLength:", objc_msgSend(v4, "length"));
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (uint8_t *)objc_msgSend(v5, "bytes");
  v7 = objc_msgSend(v4, "length");
  v8 = objc_retainAutorelease(v4);
  v9 = (const uint8_t *)objc_msgSend(v8, "bytes");
  v10 = objc_msgSend(v8, "length");

  v11 = (void *)compression_encode_buffer(v6, v7, v9, v10, 0, COMPRESSION_ZLIB);
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(objc_retainAutorelease(v5), "bytes"), v11, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  if (-[NDOBAAManager privateKey](self, "privateKey"))
    CFRelease(-[NDOBAAManager privateKey](self, "privateKey"));
  v3.receiver = self;
  v3.super_class = (Class)NDOBAAManager;
  -[NDOBAAManager dealloc](&v3, sel_dealloc);
}

- (NSArray)clientCertArray
{
  return self->_clientCertArray;
}

- (void)setClientCertArray:(id)a3
{
  objc_storeStrong((id *)&self->_clientCertArray, a3);
}

- (__SecKey)privateKey
{
  return self->_privateKey;
}

- (void)setPrivateKey:(__SecKey *)a3
{
  self->_privateKey = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientCertArray, 0);
}

void __39__NDOBAAManager_generateBAACertficate___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136446210;
  v4 = "-[NDOBAAManager generateBAACertficate:]_block_invoke_2";
  OUTLINED_FUNCTION_0_0(&dword_22D064000, a1, a3, "%{public}s: Failed to get reference key or cert!", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

void __39__NDOBAAManager_generateBAACertficate___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_22D064000, a2, a3, "%{public}s: BAA (UCRT) failed due to missing UCRT with error: %@, falling back to BAA (SCRT)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)addBAAAuthenticationHeadersToRequest:(uint64_t)a3 withBody:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_22D064000, a2, a3, "%{public}s: Failed to add Baa Headers with error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)signDataAndEncodeToBase64:(uint64_t *)a1 withPrivateKey:(NSObject *)a2 status:(uint64_t)a3 .cold.1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0_0(&dword_22D064000, a2, a3, "Unable to sign data and encode with error: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

- (void)certificatesEncodeToBase64:(os_log_t)log status:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22D064000, log, OS_LOG_TYPE_ERROR, "Unable to sign request", v1, 2u);
}

- (void)serializeCertificateChain:(NSObject *)a3 .cold.1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136446210;
  *a2 = "-[NDOBAAManager serializeCertificateChain:]";
  OUTLINED_FUNCTION_0_0(&dword_22D064000, a3, (uint64_t)a3, "%{public}s: Found NULL attestation data!!", a1);
}

- (void)writeCertsToDevice:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22D064000, log, OS_LOG_TYPE_DEBUG, "NDOBAAManager: Certificates not present!", v1, 2u);
}

- (void)_compressCertificates:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_0(&dword_22D064000, a2, v4, "Unable to create attestation data with error: %@", (uint8_t *)&v5);

}

@end
