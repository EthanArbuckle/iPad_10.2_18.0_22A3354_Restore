@implementation ATGrappaSession

- (ATGrappaSession)initWithType:(unint64_t)a3
{
  ATGrappaSession *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ATGrappaSession;
  result = -[ATGrappaSession init](&v5, sel_init);
  if (result)
    result->_sessionType = a3;
  return result;
}

- (id)deviceInfo
{
  int v2;
  int v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  NuRl2rYpg6zLtnsguhi3();
  if (v2)
  {
    v3 = v2;
    _ATLogCategoryFramework();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v11 = v3;
      _os_log_impl(&dword_1D1868000, v4, OS_LOG_TYPE_ERROR, "GrappaDeviceGetInfo failed, %ld", buf, 0xCu);
    }
    v5 = 0;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", 0);
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", v4, CFSTR("version"), v7, CFSTR("deviceType"), v8, CFSTR("protocolVersion"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)establishDeviceSessionWithRequestData:(id)a3 responseData:(id *)a4
{
  id v7;
  void *v8;
  id v9;
  int v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v15;
  void *v16;
  uint64_t v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (!self->_sessionType)
  {
    if (v7)
      goto LABEL_3;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATGrappa.m"), 66, CFSTR("no session request data"));

LABEL_9:
    v13 = 0;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATGrappa.m"), 65, CFSTR("function is client-only"));

  if (!v8)
    goto LABEL_12;
LABEL_3:
  v17 = 0;
  v9 = objc_retainAutorelease(v8);
  VVaAJGMXS456O5KIXfqv(objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"), (uint64_t)&self->_sessionId, (uint64_t)&v17);
  if (!v10)
  {
    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v17, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      X5EvIJWqdcALcjaxX6Pl(v17);
    }
    goto LABEL_9;
  }
  v11 = v10;
  _ATLogCategoryFramework();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v19 = v11;
    _os_log_impl(&dword_1D1868000, v12, OS_LOG_TYPE_ERROR, "Grappa session could not be established, %ld", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v13;
}

- (id)establishHostSessionWithDeviceInfo:(id)a3 clientRequestData:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  void *v14;
  CFDataRef v15;
  const __CFData *v16;
  void *v18;
  _DWORD length[3];
  _DWORD v20[4];
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (self->_sessionType != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATGrappa.m"), 85, CFSTR("function is host-only"));

  }
  objc_msgSend(v7, "objectForKey:", CFSTR("version"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = objc_msgSend(v8, "unsignedCharValue");

  objc_msgSend(v7, "objectForKey:", CFSTR("deviceType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = objc_msgSend(v9, "unsignedIntValue");

  objc_msgSend(v7, "objectForKey:", CFSTR("protocolVersion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = objc_msgSend(v10, "unsignedCharValue");

  memset(length, 0, sizeof(length));
  uhO2GULXwfgKwPcp4YR2((uint64_t)v20, (uint64_t)&self->_sessionId, &length[1], (uint64_t)length);
  if (v11)
  {
    v12 = v11;
    _ATLogCategoryFramework();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v22 = v12;
      _os_log_impl(&dword_1D1868000, v13, OS_LOG_TYPE_ERROR, "GrappaHostInit failed, %ld", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = CFDataCreate(0, *(const UInt8 **)&length[1], length[0]);
    rpY4QOlsWsxk0fLzfV8h(*(uint64_t *)&length[1]);
    v16 = v15;
    v14 = 0;
    *a4 = v16;
  }

  return v14;
}

- (id)beginHostSessionWithDeviceResponseData:(id)a3
{
  id v5;
  unsigned int sessionId;
  id v7;
  int v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v13;
  _DWORD v14[2];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self->_sessionType != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATGrappa.m"), 109, CFSTR("function is host-only"));

  }
  sessionId = self->_sessionId;
  v7 = objc_retainAutorelease(v5);
  LainiFYJT9auDqhZYWzW(sessionId, objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));
  if (v8)
  {
    v9 = v8;
    _ATLogCategoryFramework();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v14[0] = 67109120;
      v14[1] = v9;
      _os_log_impl(&dword_1D1868000, v10, OS_LOG_TYPE_ERROR, "GrappaHostEstablishKey failed. err=%d", (uint8_t *)v14, 8u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)createSignature:(id *)a3 forData:(id)a4
{
  if (self->_sessionType)
    -[ATGrappaSession _hostCreateSignature:forData:](self, "_hostCreateSignature:forData:", a3, a4);
  else
    -[ATGrappaSession _deviceCreateSignature:forData:](self, "_deviceCreateSignature:forData:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)verifySignature:(id)a3 forData:(id)a4
{
  if (self->_sessionType)
    -[ATGrappaSession _hostVerifySignature:forData:](self, "_hostVerifySignature:forData:", a3, a4);
  else
    -[ATGrappaSession _deviceVerifySignature:forData:](self, "_deviceVerifySignature:forData:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_deviceCreateSignature:(id *)a3 forData:(id)a4
{
  const __CFData *v6;
  uint64_t sessionId;
  const UInt8 *BytePtr;
  CFIndex Length;
  int v10;
  int v11;
  NSObject *v12;
  void *v13;
  uint64_t v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = (const __CFData *)a4;
  if (-[__CFData length](v6, "length"))
  {
    v15 = 0;
    sessionId = self->_sessionId;
    BytePtr = CFDataGetBytePtr(v6);
    Length = CFDataGetLength(v6);
    jumT7rcoieclCtxS2rgJ(sessionId, (uint64_t)BytePtr, Length, (uint64_t)&v15);
    if (v10)
    {
      v11 = v10;
      _ATLogCategoryFramework();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v17 = v11;
        _os_log_impl(&dword_1D1868000, v12, OS_LOG_TYPE_ERROR, "GrappaDeviceSign failed. err=%ld", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 0, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v15, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      X5EvIJWqdcALcjaxX6Pl(v15);
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
    *a3 = 0;
  }

  return v13;
}

- (id)_deviceVerifySignature:(id)a3 forData:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  int v9;
  int v10;
  NSObject *v11;
  void *v12;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "length") && objc_msgSend(v5, "length"))
  {
    v7 = objc_retainAutorelease(v6);
    objc_msgSend(v7, "bytes");
    objc_msgSend(v7, "length");
    v8 = objc_retainAutorelease(v5);
    objc_msgSend(v8, "bytes");
    objc_msgSend(v8, "length");
    CFUnnB0JdUjJ5CNJMkDS();
    if (v9)
    {
      v10 = v9;
      _ATLogCategoryFramework();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v14 = 134217984;
        v15 = v10;
        _os_log_impl(&dword_1D1868000, v11, OS_LOG_TYPE_ERROR, "GrappaDeviceVerify failed. err=%ld", (uint8_t *)&v14, 0xCu);
      }

      goto LABEL_9;
    }
LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
  if (!objc_msgSend(v6, "length") && !objc_msgSend(v5, "length"))
    goto LABEL_10;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v12;
}

- (id)_hostCreateSignature:(id *)a3 forData:(id)a4
{
  const __CFData *v6;
  unsigned int sessionId;
  const UInt8 *BytePtr;
  CFIndex Length;
  int v10;
  int v11;
  NSObject *v12;
  void *v13;
  unsigned int v15;
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = (const __CFData *)a4;
  if (-[__CFData length](v6, "length"))
  {
    v16 = 0;
    v15 = 0;
    sessionId = self->_sessionId;
    BytePtr = CFDataGetBytePtr(v6);
    Length = CFDataGetLength(v6);
    qk82YWRPNDt4yUtuP3cY(sessionId, (uint64_t)BytePtr, Length, &v16, (uint64_t)&v15);
    if (v10)
    {
      v11 = v10;
      _ATLogCategoryFramework();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v18 = v11;
        _os_log_impl(&dword_1D1868000, v12, OS_LOG_TYPE_ERROR, "GrappaHostSign failed. err=%ld", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), 0, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v16, v15);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      X5EvIJWqdcALcjaxX6Pl(v16);
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
    *a3 = 0;
  }

  return v13;
}

- (id)_hostVerifySignature:(id)a3 forData:(id)a4
{
  id v6;
  id v7;
  unsigned int sessionId;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  int v14;
  int v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  int v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "length") && objc_msgSend(v6, "length"))
  {
    sessionId = self->_sessionId;
    v9 = objc_retainAutorelease(v7);
    v10 = objc_msgSend(v9, "bytes");
    v11 = objc_msgSend(v9, "length");
    v12 = objc_retainAutorelease(v6);
    v13 = objc_msgSend(v12, "bytes");
    objc_msgSend(v12, "length");
    tTA34a4tbgsKsWljx9Ip(sessionId, v10, v11, v13);
    if (v14)
    {
      v15 = v14;
      _ATLogCategoryFramework();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v20 = 134217984;
        v21 = v15;
        _os_log_impl(&dword_1D1868000, v16, OS_LOG_TYPE_ERROR, "GrappaHostVerify failed. err=%ld", (uint8_t *)&v20, 0xCu);
      }

      v17 = 0;
      goto LABEL_10;
    }
LABEL_11:
    v18 = 0;
    goto LABEL_12;
  }
  if (!objc_msgSend(v7, "length") && !objc_msgSend(v6, "length"))
    goto LABEL_11;
  v17 = 4;
LABEL_10:
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ATError"), v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionRequestData, 0);
  objc_storeStrong((id *)&self->_sessionResponseData, 0);
}

@end
