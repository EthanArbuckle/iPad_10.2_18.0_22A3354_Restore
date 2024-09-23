@implementation MTROperationalCSRInfo

- (id)_initWithValidatedCSR:(id)a3 csrNonce:(id)a4 csrElementsTLV:(id)a5 attestationSignature:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  MTROperationalCSRInfo *v15;
  id *p_isa;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)MTROperationalCSRInfo;
  v15 = -[MTROperationalCSRInfo init](&v18, sel_init);
  p_isa = (id *)&v15->super.isa;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_csr, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
    objc_storeStrong(p_isa + 4, a6);
  }

  return p_isa;
}

- (MTROperationalCSRInfo)initWithCSRNonce:(NSData *)csrNonce csrElementsTLV:(MTRTLVBytes)csrElementsTLV attestationSignature:(NSData *)attestationSignature
{
  NSData *v8;
  NSData *v9;
  NSData *v10;
  MTROperationalCSRInfo *v11;
  NSData *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  NSObject *v21;
  void *v22;
  const char *v23;
  void *__s2;
  size_t __n;
  __int128 __s1;
  __int128 v27;

  v8 = csrNonce;
  v9 = csrElementsTLV;
  v10 = attestationSignature;
  v27 = 0uLL;
  __s1 = 0uLL;
  sub_233D4889C(v9, &v27, &__s1, &__s2);
  if (!(_DWORD)__s2)
  {
    v13 = objc_retainAutorelease(v8);
    v16 = objc_msgSend_bytes(v13, v14, v15);
    v19 = objc_msgSend_length(v13, v17, v18);
    sub_233BF7114(&__s2, v16, v19);

    if (*((_QWORD *)&__s1 + 1) == __n && (!__n || !memcmp((const void *)__s1, __s2, __n)))
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v20, v27, *((_QWORD *)&v27 + 1));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      self = (MTROperationalCSRInfo *)(id)objc_msgSend__initWithValidatedCSR_csrNonce_csrElementsTLV_attestationSignature_(self, v23, (uint64_t)v22, v13, v9, v10);

      v11 = self;
      goto LABEL_3;
    }
    sub_234117B80(0, "NotSpecified");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      LOWORD(__s2) = 0;
      _os_log_impl(&dword_233BF3000, v21, OS_LOG_TYPE_ERROR, "Provided CSR nonce does not match provided csrElementsTLV", (uint8_t *)&__s2, 2u);
    }

    if (sub_234114844(1u))
      sub_2341147D0(0, 1);
  }
  v11 = 0;
LABEL_3:

  return v11;
}

- (MTROperationalCSRInfo)initWithCSRElementsTLV:(MTRTLVBytes)csrElementsTLV attestationSignature:(NSData *)attestationSignature
{
  NSData *v6;
  NSData *v7;
  const char *v8;
  MTROperationalCSRInfo *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  _QWORD v15[3];
  __int128 v16;
  __int128 v17;

  v6 = csrElementsTLV;
  v7 = attestationSignature;
  v17 = 0uLL;
  v16 = 0uLL;
  sub_233D4889C(v6, &v17, &v16, v15);
  if (LODWORD(v15[0]))
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v8, v17, *((_QWORD *)&v17 + 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v11, v16, *((_QWORD *)&v16 + 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    self = (MTROperationalCSRInfo *)(id)objc_msgSend__initWithValidatedCSR_csrNonce_csrElementsTLV_attestationSignature_(self, v13, (uint64_t)v10, v12, v6, v7);

    v9 = self;
  }

  return v9;
}

- (MTROperationalCSRInfo)initWithCSRResponseParams:(MTROperationalCredentialsClusterCSRResponseParams *)responseParams
{
  MTROperationalCredentialsClusterCSRResponseParams *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  MTROperationalCSRInfo *v12;

  v4 = responseParams;
  objc_msgSend_nocsrElements(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_attestationSignature(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (MTROperationalCSRInfo *)objc_msgSend_initWithCSRElementsTLV_attestationSignature_(self, v11, (uint64_t)v7, v10);

  return v12;
}

- (MTRCSRDERBytes)csr
{
  return self->_csr;
}

- (NSData)csrNonce
{
  return self->_csrNonce;
}

- (MTRTLVBytes)csrElementsTLV
{
  return self->_csrElementsTLV;
}

- (NSData)attestationSignature
{
  return self->_attestationSignature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attestationSignature, 0);
  objc_storeStrong((id *)&self->_csrElementsTLV, 0);
  objc_storeStrong((id *)&self->_csrNonce, 0);
  objc_storeStrong((id *)&self->_csr, 0);
}

@end
