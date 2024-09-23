@implementation EMCertificateTrustInformation

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__EMCertificateTrustInformation_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_6 != -1)
    dispatch_once(&log_onceToken_6, block);
  return (OS_os_log *)(id)log_log_6;
}

void __36__EMCertificateTrustInformation_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_6;
  log_log_6 = (uint64_t)v1;

}

- (EMCertificateTrustInformation)initWithTrust:(__SecTrust *)a3 certificateType:(unint64_t)a4 sender:(id)a5
{
  id v8;
  EMCertificateTrustInformation *v9;
  EMCertificateTrustInformation *v10;
  uint64_t v11;
  NSString *sender;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)EMCertificateTrustInformation;
  v9 = -[EMCertificateTrustInformation init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_trust = a3;
    CFRetain(a3);
    v10->_certificateType = a4;
    v11 = objc_msgSend(v8, "copy");
    sender = v10->_sender;
    v10->_sender = (NSString *)v11;

  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_trust);
  v3.receiver = self;
  v3.super_class = (Class)EMCertificateTrustInformation;
  -[EMCertificateTrustInformation dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMCertificateTrustInformation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const void *v8;
  EMCertificateTrustInformation *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_sender"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("EFPropertyKey_certificateType"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("trust"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (v8 = (const void *)SecTrustDeserialize()) != 0)
  {
    self = -[EMCertificateTrustInformation initWithTrust:certificateType:sender:](self, "initWithTrust:certificateType:sender:", v8, v6, v5);
    CFRelease(v8);
    v9 = self;
  }
  else
  {
    +[EMCertificateTrustInformation log](EMCertificateTrustInformation, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[EMCertificateTrustInformation initWithCoder:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  -[EMCertificateTrustInformation sender](self, "sender");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_sender"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[EMCertificateTrustInformation certificateType](self, "certificateType"), CFSTR("EFPropertyKey_certificateType"));
  v6 = (void *)SecTrustSerialize();
  if (v6)
  {
    objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("trust"));
  }
  else
  {
    +[EMCertificateTrustInformation log](EMCertificateTrustInformation, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[EMCertificateTrustInformation encodeWithCoder:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

  }
}

- (BOOL)isEqual:(id)a3
{
  EMCertificateTrustInformation *v4;
  EMCertificateTrustInformation *v5;
  EMCertificateTrustInformation *v6;
  BOOL v7;

  v4 = (EMCertificateTrustInformation *)a3;
  v5 = v4;
  if (self == v4)
  {
    v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = CFEqual(-[EMCertificateTrustInformation certificate](self, "certificate"), -[EMCertificateTrustInformation certificate](v6, "certificate")) != 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return CFHash(-[EMCertificateTrustInformation certificate](self, "certificate"));
}

- (__SecCertificate)certificate
{
  CFArrayRef v2;
  void *v3;

  v2 = SecTrustCopyCertificateChain(-[EMCertificateTrustInformation trust](self, "trust"));
  -[__CFArray firstObject](v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (__SecCertificate *)v3;
}

- (NSString)commonName
{
  void *v2;
  void *v3;
  void *v4;

  -[EMCertificateTrustInformation certificate](self, "certificate");
  v2 = (void *)SecCertificateCopyCommonNames();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v4;
}

- (ECEmailAddressConvertible)firstEmailAddress
{
  void *v2;
  void *v3;
  void *v4;

  -[EMCertificateTrustInformation certificate](self, "certificate");
  v2 = (void *)SecCertificateCopyRFC822Names();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (ECEmailAddressConvertible *)v4;
}

- (NSArray)emailAddresses
{
  void *v2;
  void *v3;

  -[EMCertificateTrustInformation certificate](self, "certificate");
  v2 = (void *)SecCertificateCopyRFC822Names();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (void)evaluateTrustWithOptions:(unint64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  ECSecureMIMETrustEvaluation *v10;
  ECSecureMIMETrustEvaluation *trustEvaluation;
  id v12;

  -[EMCertificateTrustInformation sender](self, "sender");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emailAddressValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "simpleAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v5, "stringValue");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v9;

  objc_msgSend(MEMORY[0x1E0D1E790], "evaluateTrust:withOptions:signerEmailAddress:", self->_trust, a3, v12);
  v10 = (ECSecureMIMETrustEvaluation *)objc_claimAutoreleasedReturnValue();
  trustEvaluation = self->_trustEvaluation;
  self->_trustEvaluation = v10;

}

- (void)reevaluateTrustWithNetworkAccessAllowed
{
  void *v3;
  ECSecureMIMETrustEvaluation *v4;
  ECSecureMIMETrustEvaluation *trustEvaluation;
  id v6;

  v3 = (void *)MEMORY[0x1E0D1E790];
  -[EMCertificateTrustInformation trustEvaluation](self, "trustEvaluation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reevaluateWithNetworkAccessAllowed:");
  v4 = (ECSecureMIMETrustEvaluation *)objc_claimAutoreleasedReturnValue();
  trustEvaluation = self->_trustEvaluation;
  self->_trustEvaluation = v4;

}

- (__SecTrust)trust
{
  return self->_trust;
}

- (void)setTrust:(__SecTrust *)a3
{
  self->_trust = a3;
}

- (ECSecureMIMETrustEvaluation)trustEvaluation
{
  return self->_trustEvaluation;
}

- (void)setTrustEvaluation:(id)a3
{
  objc_storeStrong((id *)&self->_trustEvaluation, a3);
}

- (NSString)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)certificateType
{
  return self->_certificateType;
}

- (void)setCertificateType:(unint64_t)a3
{
  self->_certificateType = a3;
}

- (BOOL)_forceNetworkAccessAllowed
{
  return self->__forceNetworkAccessAllowed;
}

- (void)set_forceNetworkAccessAllowed:(BOOL)a3
{
  self->__forceNetworkAccessAllowed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_trustEvaluation, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1B99BB000, a1, a3, "Error decoding trust data", a5, a6, a7, a8, 0);
}

- (void)encodeWithCoder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1B99BB000, a1, a3, "Trust encoding failed", a5, a6, a7, a8, 0);
}

@end
