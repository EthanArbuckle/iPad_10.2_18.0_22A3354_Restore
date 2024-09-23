@implementation MFCertificateTrustInfo

- (MFCertificateTrustInfo)initWithCertificateType:(unint64_t)a3 trust:(__SecTrust *)a4 sender:(id)a5
{
  id v9;
  MFCertificateTrustInfo *v10;
  MFCertificateTrustInfo *v11;
  uint64_t v12;
  NSString *sender;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSString *v18;
  NSString *v19;
  NSString *uncommentedSender;
  void *v22;
  objc_super v23;

  v9 = a5;
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFCertificateTrustInfo.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("trust"));

  }
  v23.receiver = self;
  v23.super_class = (Class)MFCertificateTrustInfo;
  v10 = -[MFCertificateTrustInfo init](&v23, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_certificateType = a3;
    v10->_unevaluatedTrust = (__SecTrust *)CFRetain(a4);
    v12 = objc_msgSend(v9, "copy");
    sender = v11->_sender;
    v11->_sender = (NSString *)v12;

    v14 = v9;
    objc_msgSend(v14, "emailAddressValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "simpleAddress");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v18 = v16;
    }
    else
    {
      objc_msgSend(v14, "stringValue");
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    v19 = v18;

    uncommentedSender = v11->_uncommentedSender;
    v11->_uncommentedSender = v19;

  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_unevaluatedTrust);
  v3.receiver = self;
  v3.super_class = (Class)MFCertificateTrustInfo;
  -[MFCertificateTrustInfo dealloc](&v3, sel_dealloc);
}

- (ECSecureMIMETrustEvaluation)trustEvaluation
{
  ECSecureMIMETrustEvaluation *trustEvaluation;
  void *v4;
  int v5;
  uint64_t v6;
  ECSecureMIMETrustEvaluation *v7;
  ECSecureMIMETrustEvaluation *v8;

  trustEvaluation = self->_trustEvaluation;
  if (!trustEvaluation)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "mf_blockRemoteContent");

    if (v5)
      v6 = 0;
    else
      v6 = 3;
    objc_msgSend(MEMORY[0x1E0D1E790], "evaluateTrust:withOptions:signerEmailAddress:", self->_unevaluatedTrust, v6, self->_uncommentedSender);
    v7 = (ECSecureMIMETrustEvaluation *)objc_claimAutoreleasedReturnValue();
    v8 = self->_trustEvaluation;
    self->_trustEvaluation = v7;

    trustEvaluation = self->_trustEvaluation;
  }
  return trustEvaluation;
}

- (__SecTrust)trust
{
  void *v2;
  __SecTrust *v3;

  -[MFCertificateTrustInfo trustEvaluation](self, "trustEvaluation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (__SecTrust *)objc_msgSend(v2, "trust");

  return v3;
}

- (unint64_t)certificateType
{
  return self->_certificateType;
}

- (NSString)sender
{
  return self->_sender;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_uncommentedSender, 0);
  objc_storeStrong((id *)&self->_trustEvaluation, 0);
}

@end
