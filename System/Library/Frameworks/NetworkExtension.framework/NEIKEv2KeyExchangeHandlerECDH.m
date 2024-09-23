@implementation NEIKEv2KeyExchangeHandlerECDH

- (BOOL)processPeerPayload:(id)a3
{
  id v4;
  NSObject *v5;
  _TtC16NetworkExtension20NEIKEv2CryptoKitECDH *ecdhHandler;
  _TtC16NetworkExtension20NEIKEv2CryptoKitECDH *v7;
  BOOL v8;
  NSObject *v9;
  _TtC16NetworkExtension20NEIKEv2CryptoKitECDH *v10;
  _TtC16NetworkExtension20NEIKEv2CryptoKitECDH *v11;
  void *v12;
  NSObject *v13;
  unint64_t v14;
  unint64_t method;
  unint64_t v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  NSObject *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  ne_log_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    if (self)
      method = self->super._method;
    else
      method = 0;
    *(_DWORD *)buf = 134217984;
    v20 = (const char *)method;
    _os_log_debug_impl(&dword_19BD16000, v5, OS_LOG_TYPE_DEBUG, "Compute ECDH %zu shared secret", buf, 0xCu);
  }

  if (v4)
  {
    if (self)
      ecdhHandler = self->_ecdhHandler;
    else
      ecdhHandler = 0;
    v18 = 0;
    v7 = ecdhHandler;
    v8 = -[NEIKEv2CryptoKitECDH processPeerPayload:error:](v7, "processPeerPayload:error:", v4, &v18);
    v9 = v18;

    if (v8)
    {
      if (self)
        v10 = self->_ecdhHandler;
      else
        v10 = 0;
      v11 = v10;
      -[NEIKEv2CryptoKitECDH sharedSecret](v11, "sharedSecret");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NEIKEv2KeyExchangeHandler setSharedSecret:]((uint64_t)self, v12);

      ne_log_obj();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        if (self)
          v14 = self->super._method;
        else
          v14 = 0;
        *(_DWORD *)buf = 134217984;
        v20 = (const char *)v14;
        _os_log_debug_impl(&dword_19BD16000, v13, OS_LOG_TYPE_DEBUG, "Computed ECDH %zu shared secret", buf, 0xCu);
      }
    }
    else
    {
      ne_log_obj();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        if (self)
          v17 = self->super._method;
        else
          v17 = 0;
        *(_DWORD *)buf = 134218242;
        v20 = (const char *)v17;
        v21 = 2112;
        v22 = v9;
        _os_log_fault_impl(&dword_19BD16000, v13, OS_LOG_TYPE_FAULT, "Failed to compute ECDH %zu shared secret: %@", buf, 0x16u);
      }
    }

  }
  else
  {
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[NEIKEv2KeyExchangeHandlerECDH processPeerPayload:]";
      _os_log_fault_impl(&dword_19BD16000, v9, OS_LOG_TYPE_FAULT, "%s called with null peerPayload", buf, 0xCu);
    }
    v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ecdhHandler, 0);
}

@end
