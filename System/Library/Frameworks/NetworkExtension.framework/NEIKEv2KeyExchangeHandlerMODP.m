@implementation NEIKEv2KeyExchangeHandlerMODP

- (BOOL)processPeerPayload:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  CFIndex v7;
  __CFData *v8;
  NSObject *v9;
  int v10;
  BOOL v11;
  NSObject *v12;
  unint64_t method;
  unint64_t v15;
  uint64_t v16;
  NSUInteger v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  unint64_t v21;
  NSObject *v22;
  int v23;
  unint64_t v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  NSUInteger v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
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
    v26 = (const char *)method;
    _os_log_debug_impl(&dword_19BD16000, v5, OS_LOG_TYPE_DEBUG, "Compute MODP DH %zu result", buf, 0xCu);
  }

  if (!self || !self->_context)
  {
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_12;
    *(_DWORD *)buf = 136315138;
    v26 = "-[NEIKEv2KeyExchangeHandlerMODP processPeerPayload:]";
    v18 = "%s called with null self.context";
    goto LABEL_23;
  }
  if (!v4)
  {
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_12;
    *(_DWORD *)buf = 136315138;
    v26 = "-[NEIKEv2KeyExchangeHandlerMODP processPeerPayload:]";
    v18 = "%s called with null peerPayload";
LABEL_23:
    v19 = v9;
    v20 = 12;
    goto LABEL_18;
  }
  v6 = objc_msgSend(v4, "length");
  if (v6 != -[NSData length](self->_prime, "length"))
  {
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
LABEL_12:
      v11 = 0;
      goto LABEL_13;
    }
    v15 = self->super._method;
    v16 = objc_msgSend(v4, "length");
    v17 = -[NSData length](self->_prime, "length");
    *(_DWORD *)buf = 134218496;
    v26 = (const char *)v15;
    v27 = 2048;
    v28 = v16;
    v29 = 2048;
    v30 = v17;
    v18 = "Peer MODP DH %zu key length (%zu) is not equal to prime length (%zu)";
    v19 = v9;
    v20 = 32;
LABEL_18:
    _os_log_fault_impl(&dword_19BD16000, v19, OS_LOG_TYPE_FAULT, v18, buf, v20);
    goto LABEL_12;
  }
  v7 = -[NSData length](self->_prime, "length");
  v8 = +[NSMutableData mutableSensitiveDataPrefilledWithMaxCapacity:](MEMORY[0x1E0C99DF0], v7);
  if (!v8)
  {
    ne_log_obj();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134217984;
      v26 = (const char *)v7;
      _os_log_fault_impl(&dword_19BD16000, v22, OS_LOG_TYPE_FAULT, "[NEMutableSensitiveData mutableSensitiveDataPrefilledWithMaxCapacity:%zu] failed", buf, 0xCu);
    }

    v9 = 0;
    goto LABEL_12;
  }
  v9 = v8;
  objc_msgSend(v4, "bytes");
  objc_msgSend(v4, "length");
  -[NSObject mutableBytes](v9, "mutableBytes");
  v10 = SecDHComputeKey();
  v11 = v10 == 0;
  if (v10)
  {
    v23 = v10;
    ne_log_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v24 = self->super._method;
      *(_DWORD *)buf = 134218240;
      v26 = (const char *)v24;
      v27 = 1024;
      LODWORD(v28) = v23;
      _os_log_error_impl(&dword_19BD16000, v12, OS_LOG_TYPE_ERROR, "Failed to compute MODP DH %zu value: %d", buf, 0x12u);
    }
  }
  else
  {
    objc_storeStrong((id *)&self->super._sharedSecret, v9);
    ne_log_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v21 = self->super._method;
      *(_DWORD *)buf = 134217984;
      v26 = (const char *)v21;
      _os_log_debug_impl(&dword_19BD16000, v12, OS_LOG_TYPE_DEBUG, "Computed MODP DH %zu result", buf, 0xCu);
    }
  }

LABEL_13:
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  if (self && self->_context)
  {
    SecDHDestroy();
    self->_context = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)NEIKEv2KeyExchangeHandlerMODP;
  -[NEIKEv2KeyExchangeHandlerMODP dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prime, 0);
}

@end
