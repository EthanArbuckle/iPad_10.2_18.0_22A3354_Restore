@implementation _LSValidationToken

- (id)setOwner:(id *)result
{
  if (result)
    return (id *)objc_storeWeak(result + 4, a2);
  return result;
}

- (_LSValidationToken)initWithPayload:(id)a3
{
  id v4;
  _LSValidationToken *v5;
  uint64_t v6;
  NSData *payload;
  uint64_t v8;
  NSData *nonce;
  uint64_t v10;
  NSData *HMAC;
  objc_super v13;
  _BYTE bytes[32];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_LSValidationToken;
  v5 = -[_LSValidationToken init](&v13, sel_init);
  _LSAssertRunningInServer((uint64_t)"-[_LSValidationToken initWithPayload:]");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    payload = v5->_payload;
    v5->_payload = (NSData *)v6;

    SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E0CD7000], 0x20uLL, bytes);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", bytes, 32);
    nonce = v5->_nonce;
    v5->_nonce = (NSData *)v8;

    _LSValidationTokenComputeHMAC(v5->_payload, v5->_nonce);
    v10 = objc_claimAutoreleasedReturnValue();
    HMAC = v5->_HMAC;
    v5->_HMAC = (NSData *)v10;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_owner);
  objc_storeStrong((id *)&self->_HMAC, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_payload, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_payload, CFSTR("payload"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_nonce, CFSTR("nonce"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_HMAC, CFSTR("HMAC"));

}

- (_LSValidationToken)initWithCoder:(id)a3
{
  id v4;
  _LSValidationToken *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_LSValidationToken;
  v5 = -[_LSValidationToken init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("payload"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nonce"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMAC"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v6 && v7 && v8)
    {
      objc_storeStrong((id *)&v5->_payload, v6);
      objc_storeStrong((id *)&v5->_nonce, v7);
      objc_storeStrong((id *)&v5->_HMAC, v9);
      if (!objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isServer")
        || (-[_LSValidationToken isCorrectForPayload:]((uint64_t)v5, v5->_payload) & 1) != 0)
      {
        goto LABEL_10;
      }
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB28A8], 4864, (uint64_t)"-[_LSValidationToken initWithCoder:]", 114, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "failWithError:", v10);
    }
    else
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB28A8], 4865, (uint64_t)"-[_LSValidationToken initWithCoder:]", 118, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "failWithError:", v10);
    }

    v5 = 0;
LABEL_10:

  }
  return v5;
}

- (uint64_t)isCorrectForPayload:(uint64_t)a1
{
  NSData *v3;
  void *v4;
  id v5;
  void *v6;
  size_t v7;
  id v8;
  const void *v9;
  id v10;
  int v11;
  id *v12;
  id WeakRetained;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v3 = a2;
  if (a1)
  {
    _LSAssertRunningInServer((uint64_t)"-[_LSValidationToken isCorrectForPayload:]");
    if (*(_QWORD *)(a1 + 8))
    {
      if (*(_QWORD *)(a1 + 16))
      {
        v4 = *(void **)(a1 + 24);
        if (v4)
        {
          v5 = v4;
          _LSValidationTokenComputeHMAC(v3, *(NSData **)(a1 + 16));
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          if (v6 && (v7 = objc_msgSend(v5, "length"), v7 == objc_msgSend(v6, "length")))
          {
            v8 = objc_retainAutorelease(v5);
            v9 = (const void *)objc_msgSend(v8, "bytes");
            v10 = objc_retainAutorelease(v6);
            v11 = timingsafe_bcmp(v9, (const void *)objc_msgSend(v10, "bytes"), v7);

            if (!v11)
            {
              a1 = 1;
              goto LABEL_20;
            }
          }
          else
          {

          }
        }
      }
    }
    if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isAppleInternal"))
    {
      v12 = (id *)(a1 + 32);
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

      if (WeakRetained)
      {
        _LSDefaultLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[_LSValidationToken isCorrectForPayload:].cold.3(v12, v14);
      }
      else
      {
        _LSDefaultLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[_LSValidationToken isCorrectForPayload:].cold.2(v14, v15, v16, v17, v18, v19, v20, v21);
      }

    }
    _LSDefaultLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[_LSValidationToken isCorrectForPayload:].cold.1(v22, v23, v24, v25, v26, v27, v28, v29);

    a1 = 0;
  }
LABEL_20:

  return a1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)isCorrectForPayload:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_20(&dword_182882000, a1, a3, "Failed HMAC validation; lsd may have crashed. Please file a bug report against Launch Services.",
    a5,
    a6,
    a7,
    a8,
    0);
}

- (void)isCorrectForPayload:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_20(&dword_182882000, a1, a3, "Token validation failed against unknown object.", a5, a6, a7, a8, 0);
}

- (void)isCorrectForPayload:(id *)a1 .cold.3(id *a1, NSObject *a2)
{
  id WeakRetained;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1);
  v4 = 138543362;
  v5 = WeakRetained;
  _os_log_error_impl(&dword_182882000, a2, OS_LOG_TYPE_ERROR, "Token validation failed against object %{public}@.", (uint8_t *)&v4, 0xCu);

}

@end
