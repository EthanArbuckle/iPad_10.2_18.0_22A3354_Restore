@implementation MDMHTTPTransaction

- (MDMHTTPTransaction)initWithURL:(id)a3 data:(id)a4 identity:(__SecIdentity *)a5 pinnedCertificates:(id)a6 pinningRevocationCheckRequired:(BOOL)a7 signMessage:(BOOL)a8 isCheckin:(BOOL)a9 isCheckout:(BOOL)a10 isShortTransaction:(BOOL)a11 rmAccountID:(id)a12
{
  _BOOL8 v12;
  _BOOL8 v13;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  MDMHTTPTransaction *v22;
  MDMHTTPTransaction *v23;
  uint64_t v24;
  __CFString **v25;
  objc_super v27;

  v12 = a8;
  v13 = a7;
  v18 = a4;
  v19 = a6;
  v20 = a12;
  v21 = *MEMORY[0x1E0D1C0A0];
  v27.receiver = self;
  v27.super_class = (Class)MDMHTTPTransaction;
  v22 = -[DMCHTTPTransaction initWithURL:method:](&v27, sel_initWithURL_method_, a3, v21);
  v23 = v22;
  if (v22)
  {
    if (a11)
      v24 = 30;
    else
      v24 = 60;
    -[MDMHTTPTransaction _commonInit:timeout:pinnedSecCertificateRefs:pinningRevocationCheckRequired:signMessage:rmAccountID:](v22, "_commonInit:timeout:pinnedSecCertificateRefs:pinningRevocationCheckRequired:signMessage:rmAccountID:", a5, v24, v19, v13, v12, v20);
    v23->_isCheckIn = a9;
    v23->_isCheckout = a10;
    if (a10)
      -[DMCHTTPTransaction setIgnoreAuthenticatorError:](v23, "setIgnoreAuthenticatorError:", 1);
    v25 = &kMDMContentTypeCheckin;
    if (!a9 && !a10)
      v25 = &kMDMContentTypeMDM;
    -[DMCHTTPTransaction setContentType:](v23, "setContentType:", *v25);
    -[DMCHTTPTransaction setData:](v23, "setData:", v18);
  }

  return v23;
}

- (MDMHTTPTransaction)initWithURL:(id)a3 identity:(__SecIdentity *)a4 pinnedCertificates:(id)a5 pinningRevocationCheckRequired:(BOOL)a6 signMessage:(BOOL)a7 isShortTransaction:(BOOL)a8 rmAccountID:(id)a9
{
  _BOOL4 v9;
  _BOOL8 v10;
  _BOOL8 v11;
  id v15;
  id v16;
  uint64_t v17;
  MDMHTTPTransaction *v18;
  MDMHTTPTransaction *v19;
  uint64_t v20;
  objc_super v22;

  v9 = a8;
  v10 = a7;
  v11 = a6;
  v15 = a5;
  v16 = a9;
  v17 = *MEMORY[0x1E0D1C090];
  v22.receiver = self;
  v22.super_class = (Class)MDMHTTPTransaction;
  v18 = -[DMCHTTPTransaction initWithURL:method:](&v22, sel_initWithURL_method_, a3, v17);
  v19 = v18;
  if (v18)
  {
    if (v9)
      v20 = 60;
    else
      v20 = 120;
    -[MDMHTTPTransaction _commonInit:timeout:pinnedSecCertificateRefs:pinningRevocationCheckRequired:signMessage:rmAccountID:](v18, "_commonInit:timeout:pinnedSecCertificateRefs:pinningRevocationCheckRequired:signMessage:rmAccountID:", a4, v20, v15, v11, v10, v16);
  }

  return v19;
}

- (MDMHTTPTransaction)initWithURL:(id)a3 downloadURL:(id)a4 identity:(__SecIdentity *)a5 pinnedCertificates:(id)a6 pinningRevocationCheckRequired:(BOOL)a7 signMessage:(BOOL)a8 isShortTransaction:(BOOL)a9 rmAccountID:(id)a10
{
  _BOOL8 v10;
  _BOOL8 v11;
  id v16;
  id v17;
  uint64_t v18;
  MDMHTTPTransaction *v19;
  MDMHTTPTransaction *v20;
  uint64_t v21;
  objc_super v23;

  v10 = a8;
  v11 = a7;
  v16 = a6;
  v17 = a10;
  v18 = *MEMORY[0x1E0D1C090];
  v23.receiver = self;
  v23.super_class = (Class)MDMHTTPTransaction;
  v19 = -[DMCHTTPTransaction initWithURL:method:downloadURL:](&v23, sel_initWithURL_method_downloadURL_, a3, v18, a4);
  v20 = v19;
  if (v19)
  {
    if (a9)
      v21 = 60;
    else
      v21 = 120;
    -[MDMHTTPTransaction _commonInit:timeout:pinnedSecCertificateRefs:pinningRevocationCheckRequired:signMessage:rmAccountID:](v19, "_commonInit:timeout:pinnedSecCertificateRefs:pinningRevocationCheckRequired:signMessage:rmAccountID:", a5, v21, v16, v11, v10, v17);
  }

  return v20;
}

- (void)_commonInit:(__SecIdentity *)a3 timeout:(unint64_t)a4 pinnedSecCertificateRefs:(id)a5 pinningRevocationCheckRequired:(BOOL)a6 signMessage:(BOOL)a7 rmAccountID:(id)a8
{
  _BOOL4 v8;
  _BOOL8 v9;
  id v14;
  id v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  int v19;
  id v20;
  uint64_t v21;

  v8 = a7;
  v9 = a6;
  v21 = *MEMORY[0x1E0C80C00];
  v14 = a8;
  v15 = a5;
  -[DMCHTTPTransaction setTimeout:](self, "setTimeout:", (double)a4);
  -[DMCHTTPTransaction setUserAgent:](self, "setUserAgent:", CFSTR("MDM/1.0"));
  -[DMCHTTPTransaction setIdentity:](self, "setIdentity:", a3);
  -[DMCHTTPTransaction setPinnedSecCertificateRefs:](self, "setPinnedSecCertificateRefs:", v15);

  -[DMCHTTPTransaction setPinningRevocationCheckRequired:](self, "setPinningRevocationCheckRequired:", v9);
  v16 = *(NSObject **)(DMCLogObjects() + 8);
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
  if (v14)
  {
    if (v17)
    {
      v19 = 138543362;
      v20 = v14;
      _os_log_impl(&dword_1D4BF7000, v16, OS_LOG_TYPE_DEBUG, "RMAccount ID provided to MDMHTTPTransaction: %{public}@", (uint8_t *)&v19, 0xCu);
    }
    +[MDMAccountUtilities authenticatorForRMAccountID:](MDMAccountUtilities, "authenticatorForRMAccountID:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCHTTPTransaction setAuthenticator:](self, "setAuthenticator:", v18);

  }
  else if (v17)
  {
    LOWORD(v19) = 0;
    _os_log_impl(&dword_1D4BF7000, v16, OS_LOG_TYPE_DEBUG, "No RMAccount ID provided to MDMHTTPTransaction", (uint8_t *)&v19, 2u);
  }
  if (v8)
    -[DMCHTTPTransaction setCMSSignatureHeaderName:](self, "setCMSSignatureHeaderName:", CFSTR("Mdm-Signature"));

}

+ (id)unauthorizedByServerError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = *MEMORY[0x1E0D1C150];
  DMCErrorArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 12020, v4, *MEMORY[0x1E0D1C030], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)reauthRequiredMAIDError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = *MEMORY[0x1E0D1C150];
  DMCErrorArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 12095, v4, *MEMORY[0x1E0D1C038], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)reauthRequiredThirdPartyError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = *MEMORY[0x1E0D1C150];
  DMCErrorArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 12096, v4, *MEMORY[0x1E0D1C038], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isCheckIn
{
  return self->_isCheckIn;
}

- (BOOL)isCheckout
{
  return self->_isCheckout;
}

@end
