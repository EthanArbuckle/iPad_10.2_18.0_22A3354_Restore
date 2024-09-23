@implementation _MFNTLMAuthenticator

- (void)dealloc
{
  objc_super v3;

  if (self->_ntlmGeneratorRef)
    NtlmGeneratorRelease();
  v3.receiver = self;
  v3.super_class = (Class)_MFNTLMAuthenticator;
  -[MFSASLAuthenticator dealloc](&v3, sel_dealloc);
}

- (void)setAuthenticationState:(int)a3
{
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  NSObject *v8;
  _BOOL4 v9;
  uint8_t v10[16];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_MFNTLMAuthenticator;
  -[MFSASLAuthenticator setAuthenticationState:](&v11, sel_setAuthenticationState_);
  if (a3 == 1)
  {
    v5 = MFLogGeneral();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      return;
    *(_WORD *)v10 = 0;
    v6 = "start NTLM authentication";
    v7 = v5;
  }
  else
  {
    if (self->_ntlmGeneratorRef)
    {
      NtlmGeneratorRelease();
      self->_ntlmGeneratorRef = 0;
    }
    self->_ntlmError = 0;
    v8 = MFLogGeneral();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if (a3 == 4)
    {
      if (!v9)
        return;
      *(_WORD *)v10 = 0;
      v6 = "NTLM authentication succeeded";
    }
    else
    {
      if (!v9)
        return;
      *(_WORD *)v10 = 0;
      v6 = "NTLM authentication failed";
    }
    v7 = v8;
  }
  _os_log_impl(&dword_1C8839000, v7, OS_LOG_TYPE_INFO, v6, v10, 2u);
}

- (id)responseForServerData:(id)a3
{
  int *p_ntlmError;
  id v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  NSObject *v9;
  const __CFString *v10;
  int ClientResponse;
  NSObject *v12;
  int v13;
  NSObject *v14;
  uint8_t buf[4];
  const __CFString *v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  p_ntlmError = &self->_ntlmError;
  if (self->_ntlmError)
    return 0;
  if (self->_ntlmGeneratorRef)
  {
    v5 = -[MFSASLAuthenticator account](self, "account", a3);
    v6 = objc_msgSend(v5, "domain");
    v7 = objc_msgSend(v5, "username");
    if (v7)
      v8 = (const __CFString *)v7;
    else
      v8 = &stru_1E81CBE50;
    objc_msgSend(v5, "password");
    v9 = MFLogGeneral();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      if (v6)
        v10 = (const __CFString *)v6;
      else
        v10 = &stru_1E81CBE50;
      *(_DWORD *)buf = 138412546;
      v16 = v8;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_1C8839000, v9, OS_LOG_TYPE_INFO, "NTLM - respond to server challenge; user = %@; domain = %@",
        buf,
        0x16u);
    }
    ClientResponse = NtlmCreateClientResponse();
  }
  else
  {
    if (objc_msgSend(a3, "length", a3))
    {
      v12 = MFLogGeneral();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C8839000, v12, OS_LOG_TYPE_INFO, "*** Unexpected server response during NTLM authentication", buf, 2u);
      }
    }
    v13 = NtlmGeneratorCreate();
    *p_ntlmError = v13;
    if (v13)
      goto LABEL_19;
    ClientResponse = NtlmCreateClientRequest();
  }
  *p_ntlmError = ClientResponse;
  if (ClientResponse)
  {
LABEL_19:
    v14 = MFLogGeneral();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[_MFNTLMAuthenticator responseForServerData:].cold.1(p_ntlmError, v14);
  }
  return 0;
}

- (void)responseForServerData:(int *)a1 .cold.1(int *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 134217984;
  v4 = v2;
  _os_log_error_impl(&dword_1C8839000, a2, OS_LOG_TYPE_ERROR, "*** Error %ld occurred during NTLM authentication", (uint8_t *)&v3, 0xCu);
}

@end
