@implementation NEIKEv2SecurityContext

- (unsigned)overheadForPlaintextLength:(unsigned int)a3
{
  if (self)
    LODWORD(self) = self->_minimumEncryptedPayloadSize;
  return self;
}

- (unsigned)maximumPayloadSizeWithinLimit:(unsigned int)a3
{
  unsigned int minimumEncryptedPayloadSize;

  if (self)
  {
    minimumEncryptedPayloadSize = self->_minimumEncryptedPayloadSize;
    if (minimumEncryptedPayloadSize >= a3)
    {
      LODWORD(self) = 0;
      return self;
    }
  }
  else
  {
    minimumEncryptedPayloadSize = 0;
    if (!a3)
      return self;
  }
  LODWORD(self) = a3 - minimumEncryptedPayloadSize;
  return self;
}

- (id)constructEncryptedPacketFromPayloadData:(id)a3 authenticatedHeaders:(id)a4
{
  return 0;
}

- (id)decryptPayloadData:(id)a3 authenticatedHeaders:(id)a4
{
  return 0;
}

+ (BOOL)removePaddingFromDecryptedPayload:(uint64_t)a1
{
  id v2;
  unsigned int v3;
  unsigned int v4;
  int v5;
  _BOOL8 v6;
  NSObject *v8;
  NSObject *v9;
  unsigned __int8 v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  unsigned int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  v3 = objc_msgSend(v2, "length");
  v4 = v3;
  if (v3)
  {
    v10 = 0;
    objc_msgSend(v2, "getBytes:range:", &v10, v3 - 1, 1);
    v5 = v10 + 1;
    v6 = v10 < v4;
    if (v10 >= v4)
    {
      ne_log_obj();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109376;
        v12 = v5;
        v13 = 1024;
        v14 = v4;
        _os_log_error_impl(&dword_19BD16000, v9, OS_LOG_TYPE_ERROR, "BACKTRACE Padding len (%u) > decrypted data len (%u)", buf, 0xEu);
      }

    }
    else
    {
      objc_msgSend(v2, "setLength:", v4 - v5);
    }
  }
  else
  {
    ne_log_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19BD16000, v8, OS_LOG_TYPE_ERROR, "BACKTRACE Can't remove padding from payload of length 0", buf, 2u);
    }

    v6 = 0;
  }

  return v6;
}

- (_DWORD)initWithMinimumEncryptedPayloadSize:(void *)a1
{
  _DWORD *result;
  NSObject *v4;
  uint8_t v5[16];
  objc_super v6;

  v6.receiver = a1;
  v6.super_class = (Class)NEIKEv2SecurityContext;
  result = objc_msgSendSuper2(&v6, sel_init);
  if (result)
  {
    result[2] = a2;
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

@end
