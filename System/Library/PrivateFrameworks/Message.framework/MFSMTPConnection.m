@implementation MFSMTPConnection

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__MFSMTPConnection_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_31 != -1)
    dispatch_once(&log_onceToken_31, block);
  return (OS_os_log *)(id)log_log_31;
}

void __23__MFSMTPConnection_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_31;
  log_log_31 = (uint64_t)v1;

}

- (MFSMTPConnection)init
{
  MFSMTPConnection *v2;
  uint64_t v3;
  NSMutableData *mdata;
  MFSMTPConnection *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFSMTPConnection;
  v2 = -[MFConnection init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D46100]), "initWithCapacity:", 128);
    mdata = v2->_mdata;
    v2->_mdata = (NSMutableData *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (unint64_t)state
{
  unint64_t v2;

  v2 = -[MFSMTPResponse status](self->_lastResponse, "status");
  if (v2 > 0x257)
    return 6;
  else
    return *(_QWORD *)((char *)&unk_1A5999B20
                     + ((2 * (((v2 >> 2) * (unsigned __int128)0x28F5C28F5C28F5C3uLL) >> 64)) & 0x1FFFFFFFFFFFFFF8));
}

- (id)lastResponse
{
  return (id)-[MFSMTPResponse copy](self->_lastResponse, "copy");
}

- (id)domainName
{
  return self->_domainName;
}

- (void)setDomainName:(id)a3
{
  NSString *v4;
  NSString *domainName;
  id v6;

  v6 = a3;
  v4 = (NSString *)objc_msgSend(v6, "copy");
  domainName = self->_domainName;
  self->_domainName = v4;

}

- (BOOL)supportsOutboxCopy
{
  if (-[MFSMTPConnection _hasParameter:forKeyword:](self, "_hasParameter:forKeyword:", 0, CFSTR("X-AOL-OUTBOX-COPY")))
    return 1;
  if (self->_dislikesSaveSentMbox)
    return 0;
  return -[MFSMTPConnection _supportsSaveSentExtension](self, "_supportsSaveSentExtension");
}

- (BOOL)supportsPipelining
{
  return -[MFSMTPConnection _supportsExtension:](self, "_supportsExtension:", CFSTR("PIPELINING"));
}

- (BOOL)supportsSMTPUTF8
{
  return -[MFSMTPConnection _supportsExtension:](self, "_supportsExtension:", CFSTR("SMTPUTF8"));
}

- (BOOL)supportsEnhancedStatusCodes
{
  return -[MFSMTPConnection _supportsExtension:](self, "_supportsExtension:", CFSTR("ENHANCEDSTATUSCODES"));
}

- (BOOL)supportsChunking
{
  int v2;
  void *v3;
  char v4;

  v2 = -[MFSMTPConnection _supportsExtension:](self, "_supportsExtension:", CFSTR("CHUNKING"));
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("DisableCHUNKING"));

    LOBYTE(v2) = v4 ^ 1;
  }
  return v2;
}

- (unint64_t)maximumMessageBytes
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t *v11;
  unint64_t v12;
  char __str[24];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = -[NSMutableArray count](self->_serviceExtensions, "count");
  if (!v3)
  {
    v6 = 0;
LABEL_16:
    v9 = 0;
    goto LABEL_17;
  }
  v4 = 1;
  do
  {
    -[NSMutableArray objectAtIndex:](self->_serviceExtensions, "objectAtIndex:", v4 - 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "caseInsensitiveCompare:", CFSTR("SIZE")))
    {
      v6 = 0;
    }
    else
    {
      -[NSMutableArray objectAtIndex:](self->_serviceExtensions, "objectAtIndex:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "count"))
      {
        objc_msgSend(v7, "objectAtIndex:", 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = 0;
      }

    }
    v4 += 2;
  }
  while (v4 <= v3 && !v6);
  if (!v6)
    goto LABEL_16;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_16;
  memset(__str, 170, 21);
  v8 = objc_msgSend(v6, "length");
  v11 = &v12;
  v12 = 0xAAAAAAAAAAAAAAAALL;
  if (v8 != MFStringGetBytes())
    goto LABEL_16;
  __str[v12] = 0;
  v9 = strtoull(__str, 0, 10);
LABEL_17:

  return v9;
}

- (id)authenticationMechanisms
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  unint64_t i;
  void *v7;
  void *v8;

  v3 = -[NSMutableArray count](self->_serviceExtensions, "count");
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    for (i = 1; i <= v4; i += 2)
    {
      -[NSMutableArray objectAtIndex:](self->_serviceExtensions, "objectAtIndex:", i - 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v7, "caseInsensitiveCompare:", CFSTR("AUTH")))
      {
        -[NSMutableArray objectAtIndex:](self->_serviceExtensions, "objectAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "count"))
        {
          if (v5)
            objc_msgSend(v5, "addObjectsFromArray:", v8);
          else
            v5 = (void *)objc_msgSend(v8, "mutableCopyWithZone:", 0);
        }

      }
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)authenticateUsingAccount:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  objc_msgSend(v4, "preferredAuthScheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v8.receiver = self;
    v8.super_class = (Class)MFSMTPConnection;
    v6 = -[MFConnection authenticateUsingAccount:](&v8, sel_authenticateUsingAccount_, v4);
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (BOOL)authenticateUsingAccount:(id)a3 authenticator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  __int128 v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  BOOL v24;
  __int128 v26;
  void *v27;
  int v28;
  uint8_t buf[4];
  MFSMTPConnection *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "saslName");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v7, "usesBase64EncodeResponseData");
  objc_msgSend(v7, "setAuthenticationState:", 1);
  objc_msgSend(v7, "responseForServerData:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  self->_hideLoggedData = objc_msgSend(v7, "justSentPlainTextPassword");
  if (v8)
  {
    if (v28)
    {
      objc_msgSend(v8, "mf_encodeBase64WithoutLineBreaks");
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v9;
    }
    v10 = (void *)objc_msgSend(v27, "mutableCopyWithZone:", 0);
    v11 = (void *)MFCreateStringWithData();
    objc_msgSend(v10, "appendString:", CFSTR(" "));
    objc_msgSend(v10, "appendString:", v11);
    v12 = -[MFSMTPConnection _sendCommand:length:argument:trailer:](self, "_sendCommand:length:argument:trailer:", "AUTH ", 5, v10, 0);

  }
  else
  {
    v12 = -[MFSMTPConnection _sendCommand:length:argument:trailer:](self, "_sendCommand:length:argument:trailer:", "AUTH ", 5, v27, 0);
  }
  if (v12 == 2)
    v12 = -[MFSMTPConnection _getReply](self, "_getReply");
  else
    objc_msgSend(v7, "setAuthenticationState:", 3);
  *(_QWORD *)&v13 = 134218242;
  v26 = v13;
  while (objc_msgSend(v7, "authenticationState", v26) == 1)
  {
    if (v12 - 4 < 2)
    {
      objc_msgSend(v6, "errorForResponse:", self->_lastResponse);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFSMTPConnection lastResponseLine](self, "lastResponseLine");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setMoreInfo:", v16);

      +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setError:", v15);

      objc_msgSend(v7, "setAuthenticationState:", 2);
      goto LABEL_32;
    }
    if (v12 == 2)
    {
      objc_msgSend(v7, "setAuthenticationState:", 4);
    }
    else if (v12 == 3)
    {
      -[MFSMTPResponse lastResponseLine](self->_lastResponse, "lastResponseLine");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = v15;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "data");
        v19 = (id)objc_claimAutoreleasedReturnValue();
      }
      v20 = v19;
      if (v28)
      {
        objc_msgSend(v19, "mf_decodeBase64");
        v21 = objc_claimAutoreleasedReturnValue();

        v20 = (void *)v21;
      }
      objc_msgSend(v7, "responseForServerData:", v20);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      self->_hideLoggedData = objc_msgSend(v7, "justSentPlainTextPassword");
      if (v22)
      {
        if (v28)
        {
          objc_msgSend(v22, "mf_encodeBase64WithoutLineBreaks");
          v23 = objc_claimAutoreleasedReturnValue();

          v22 = (id)v23;
        }
        v22 = objc_retainAutorelease(v22);
        v12 = -[MFSMTPConnection _sendCommand:length:argument:trailer:](self, "_sendCommand:length:argument:trailer:", objc_msgSend(v22, "bytes"), objc_msgSend(v22, "length"), 0, 0);
        if (v12 == 2)
          v12 = -[MFSMTPConnection _getReply](self, "_getReply");
        else
          objc_msgSend(v7, "setAuthenticationState:", 3);
      }
      else
      {
        objc_msgSend(v7, "setAuthenticationState:", 2);
        v12 = 3;
      }

LABEL_32:
    }
    else
    {
      +[MFSMTPConnection log](MFSMTPConnection, "log");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "parentAccountIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = v26;
        v30 = self;
        v31 = 2114;
        v32 = v18;
        _os_log_error_impl(&dword_1A4F90000, v14, OS_LOG_TYPE_ERROR, "MFSMTPConnection[%p]: Unexpected response during authentication for SMTP account %{public}@", buf, 0x16u);

      }
      objc_msgSend(v7, "setAuthenticationState:", 3);
    }
  }
  self->_hideLoggedData = 0;
  v24 = objc_msgSend(v7, "authenticationState") == 4;

  return v24;
}

- (BOOL)connectUsingAccount:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  _BOOL4 v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  if (!-[MFSMTPConnection _connectUsingAccount:](self, "_connectUsingAccount:", v4)
    || -[MFSMTPConnection _doHandshakeUsingAccount:](self, "_doHandshakeUsingAccount:", v4) != 2)
  {
    goto LABEL_16;
  }
  if (!objc_msgSend(v4, "usesSSL")
    || (-[MFNWConnectionWrapper securityProtocol](self->super._socket, "securityProtocol"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C9B328]),
        v5,
        !v6))
  {
    v9 = 1;
    goto LABEL_17;
  }
  if (!-[MFSMTPConnection _hasParameter:forKeyword:](self, "_hasParameter:forKeyword:", 0, CFSTR("STARTTLS")))
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    MFLookupLocalizedString(CFSTR("FAILED_SEND_SSL_NEEDED"), CFSTR("Check the SSL setting for the outgoing server “%@”."), CFSTR("Delayed"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hostname");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v13, CFSTR("UserFriendlyErrorDescription"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    MFLookupLocalizedString(CFSTR("FAILED_SEND_TITLE"), CFSTR("Cannot Send Mail"), CFSTR("Delayed"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), 1034, v13, v16, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setError:", v17);
LABEL_15:

LABEL_16:
    v9 = 0;
    goto LABEL_17;
  }
  if (-[MFSMTPConnection _sendCommand:length:argument:trailer:](self, "_sendCommand:length:argument:trailer:", "STARTTLS", 8, 0, 0) != 2|| -[MFSMTPConnection _getReply](self, "_getReply") != 2)
  {
    v18 = (void *)MEMORY[0x1E0CB3940];
    MFLookupLocalizedString(CFSTR("FAILED_SEND_SSL_NEEDED"), CFSTR("Check the SSL setting for the outgoing server “%@”."), CFSTR("Delayed"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hostname");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", v19, v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v13, CFSTR("UserFriendlyErrorDescription"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    MFLookupLocalizedString(CFSTR("FAILED_SEND_TITLE"), CFSTR("Cannot Send Mail"), CFSTR("Delayed"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), 1033, v13, v16, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setError:", v17);
    goto LABEL_15;
  }
  objc_msgSend(v4, "clientCertificates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    -[MFNWConnectionWrapper setClientCertificates:](self->super._socket, "setClientCertificates:", v7);
  v8 = -[MFConnection enableSSL](self, "enableSSL");

  if (!v8)
    goto LABEL_16;
  v9 = -[MFSMTPConnection _doHandshakeUsingAccount:](self, "_doHandshakeUsingAccount:", v4) == 2;
LABEL_17:

  return v9;
}

- (unint64_t)rcptTo:(id)a3
{
  id v4;
  unint64_t v5;

  v4 = a3;
  v5 = -[MFSMTPConnection _sendCommand:length:argument:trailer:](self, "_sendCommand:length:argument:trailer:", "RCPT TO:<", 9, v4, ">");
  if (v5 == 2)
    v5 = -[MFSMTPConnection _getReply](self, "_getReply");

  return v5;
}

- (unint64_t)noop
{
  unint64_t result;

  result = -[MFSMTPConnection _sendCommand:length:argument:trailer:](self, "_sendCommand:length:argument:trailer:", "NOOP", 4, 0, 0);
  if (result == 2)
    return -[MFSMTPConnection _getReply](self, "_getReply");
  return result;
}

- (unint64_t)sendBData:(id)a3
{
  id v4;
  uint64_t v5;
  int originalSocketTimeout;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD v21[4];
  id v22;
  MFSMTPConnection *v23;
  id v24;
  uint64_t *v25;
  _QWORD aBlock[8];
  _QWORD v27[4];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;

  v4 = a3;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 5;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0xAAAAAAAAAAAAAAAALL;
  v5 = objc_msgSend(v4, "length");
  v31 = objc_msgSend(v4, "numberOfNewlinesNeedingConversion:", 0) + v5;
  originalSocketTimeout = self->_originalSocketTimeout;
  if (originalSocketTimeout >= 1)
  {
    if (originalSocketTimeout <= 180)
      v7 = 180;
    else
      v7 = originalSocketTimeout;
    -[MFNWConnectionWrapper setTimeout:](self->super._socket, "setTimeout:", v7);
  }
  v8 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v9 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("BDAT %lu LAST\r\n"), v29[3]);
  objc_msgSend(v9, "dataUsingEncoding:", 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MFConnection writeData:dontLogBytesInRange:](self, "writeData:dontLogBytesInRange:", v10, 0x7FFFFFFFFFFFFFFFLL, 0);

  if (v11)
  {
    v12 = v29[3] / 0x50uLL;
    if (v12 <= 0x2000)
      v12 = 0x2000;
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x2020000000;
    v27[3] = 0;
    v13 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __30__MFSMTPConnection_sendBData___block_invoke;
    aBlock[3] = &unk_1E4E8EA20;
    aBlock[4] = self;
    aBlock[5] = v27;
    aBlock[6] = &v28;
    aBlock[7] = v12;
    v14 = _Block_copy(aBlock);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D46100]), "initWithCapacity:", 0x10000);
    v33[3] = 2;
    v21[0] = v13;
    v21[1] = 3221225472;
    v21[2] = __30__MFSMTPConnection_sendBData___block_invoke_2;
    v21[3] = &unk_1E4E8EA48;
    v16 = v15;
    v25 = &v32;
    v22 = v16;
    v23 = self;
    v17 = v14;
    v24 = v17;
    objc_msgSend(v4, "enumerateConvertingNewlinesUsingBlock:", v21);
    if (v33[3] == 2)
    {
      v18 = -[MFSMTPConnection _sendData:progressHandler:](self, "_sendData:progressHandler:", v16, v17);
      v33[3] = v18;
    }

    _Block_object_dispose(v27, 8);
  }
  v19 = v33[3];
  if (v19 == 2)
  {
    -[MFSMTPConnection _getReply](self, "_getReply");
    v19 = -[MFSMTPConnection state](self, "state");
    v33[3] = v19;
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

  return v19;
}

uint64_t __30__MFSMTPConnection_sendBData___block_invoke(_QWORD *a1, uint64_t a2)
{
  double v3;
  id WeakRetained;

  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) += a2;
  v3 = (double)*(unint64_t *)(*(_QWORD *)(a1[5] + 8) + 24)
     / (double)*(unint64_t *)(*(_QWORD *)(a1[6] + 8) + 24)
     * 0.800000012;
  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 176));
  objc_msgSend(WeakRetained, "setPercentDone:", v3 + 0.200000003);

  return a1[7];
}

BOOL __30__MFSMTPConnection_sendBData___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "appendBytes:length:", a2, a3);
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "length") >= 0x10000)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "_sendData:progressHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "setLength:", 0);
  }
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == 2;
}

- (unint64_t)sendData:(id)a3
{
  id v4;
  int originalSocketTimeout;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  unint64_t v18;
  _QWORD v20[5];
  id v21;
  id v22;
  uint64_t *v23;
  _QWORD *v24;
  _QWORD aBlock[4];
  id v26;
  MFSMTPConnection *v27;
  _QWORD *v28;
  unint64_t v29;
  _QWORD v30[4];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v4 = a3;
  originalSocketTimeout = self->_originalSocketTimeout;
  if (originalSocketTimeout >= 1)
  {
    if (originalSocketTimeout <= 120)
      v6 = 120;
    else
      v6 = originalSocketTimeout;
    -[MFNWConnectionWrapper setTimeout:](self->super._socket, "setTimeout:", v6);
  }
  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v8 = (objc_msgSend(v4, "length") / 0x14uLL) & 0xFFFFFFFFFFFE000;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v9 = MEMORY[0x1E0C809B0];
  v30[3] = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __29__MFSMTPConnection_sendData___block_invoke;
  aBlock[3] = &unk_1E4E8EA70;
  v28 = v30;
  v10 = v4;
  v26 = v10;
  v27 = self;
  v29 = v8;
  v11 = _Block_copy(aBlock);
  -[NSMutableData setLength:](self->_mdata, "setLength:", 0);
  v20[0] = v9;
  v20[1] = 3221225472;
  v20[2] = __29__MFSMTPConnection_sendData___block_invoke_2;
  v20[3] = &unk_1E4E8EA98;
  v20[4] = self;
  v12 = v7;
  v21 = v12;
  v23 = &v31;
  v24 = v30;
  v13 = v11;
  v22 = v13;
  objc_msgSend(v10, "enumerateConvertingNewlinesUsingBlock:", v20);
  if (!*((_BYTE *)v32 + 24))
  {
    v14 = self->_originalSocketTimeout;
    if (v14 >= 1)
    {
      if (v14 <= 600)
        v15 = 600;
      else
        v15 = v14;
      -[MFNWConnectionWrapper setTimeout:](self->super._socket, "setTimeout:", v15);
    }
    -[MFSMTPConnection _getReply](self, "_getReply");
    v16 = self->_originalSocketTimeout;
    if (v16 >= 1)
    {
      if (v16 <= 300)
        v17 = 300;
      else
        v17 = v16;
      -[MFNWConnectionWrapper setTimeout:](self->super._socket, "setTimeout:", v17);
    }
  }
  v18 = -[MFSMTPConnection state](self, "state");

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(&v31, 8);

  return v18;
}

uint64_t __29__MFSMTPConnection_sendData___block_invoke(uint64_t a1)
{
  float v2;
  double v3;
  id WeakRetained;

  v2 = (float)*(unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) * 0.8;
  v3 = (float)(v2 / (float)(unint64_t)objc_msgSend(*(id *)(a1 + 32), "length"));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 176));
  objc_msgSend(WeakRetained, "setPercentDone:", v3 + 0.200000003);

  return *(_QWORD *)(a1 + 56);
}

BOOL __29__MFSMTPConnection_sendData___block_invoke_2(uint64_t a1, _BYTE *a2, uint64_t a3, int a4, int a5)
{
  BOOL v10;

  if (*a2 == 46)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "appendBytes:length:", a2, 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "appendBytes:length:", a2, a3);
  if (a5 && (a4 & 1) == 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "appendBytes:length:", "\r\n", 2);
  if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "length") >> 13)
    v10 = 0;
  else
    v10 = a5 == 0;
  if (!v10)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "shouldCancel"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "setStatus:", 550);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      objc_msgSend(*(id *)(a1 + 32), "disconnect");
    }
    else
    {
      if (a5)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "appendBytes:length:", ".", 1);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "appendBytes:length:", "\r\n", 2);
      }
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) += a3;
      if (a4)
        --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_sendData:progressHandler:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136), *(_QWORD *)(a1 + 48)) != 2;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "setLength:", 0);
  }
  return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == 0;
}

- (unint64_t)quit
{
  unint64_t v3;

  v3 = -[MFSMTPConnection _sendCommand:length:argument:trailer:](self, "_sendCommand:length:argument:trailer:", "QUIT", 4, 0, 0);
  if (v3 == 2)
    -[MFConnection disconnect](self, "disconnect");
  return v3;
}

- (const)_trailerForMailFromWithEmailAddressFormatStyle:(int64_t)a3
{
  if (a3)
    return ">";
  else
    return "> SMTPUTF8";
}

- (unint64_t)mailFrom:(id)a3 emailFormatStyle:(int64_t)a4
{
  id v6;
  unint64_t v7;

  v6 = a3;
  v7 = -[MFSMTPConnection _sendCommand:length:argument:trailer:](self, "_sendCommand:length:argument:trailer:", "MAIL FROM:<", 11, v6, -[MFSMTPConnection _trailerForMailFromWithEmailAddressFormatStyle:](self, "_trailerForMailFromWithEmailAddressFormatStyle:", a4));
  if (v7 == 2)
    v7 = -[MFSMTPConnection _getReply](self, "_getReply");

  return v7;
}

- (id)dataForMailFrom:(id)a3 emailFormatStyle:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[MFSMTPConnection _dataForCommand:length:argument:trailer:](self, "_dataForCommand:length:argument:trailer:", "MAIL FROM:<", 11, v6, -[MFSMTPConnection _trailerForMailFromWithEmailAddressFormatStyle:](self, "_trailerForMailFromWithEmailAddressFormatStyle:", a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)dataForRcptTo:(id)a3
{
  -[MFSMTPConnection _dataForCommand:length:argument:trailer:](self, "_dataForCommand:length:argument:trailer:", "RCPT TO:<", 9, a3, ">");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)dataForDataCmd
{
  return -[MFSMTPConnection _dataForCommand:length:argument:trailer:](self, "_dataForCommand:length:argument:trailer:", "DATA", 4, 0, 0);
}

- (int64_t)mailFrom:(id)a3 recipients:(id)a4 withData:(id)a5 host:(id)a6 emailFormatStyle:(int64_t)a7 errorTitle:(id *)a8 errorMessage:(id *)a9 serverResponse:(id *)a10 displayError:(BOOL *)a11 errorCode:(int *)a12 errorUserInfo:(id *)a13
{
  id v18;
  id v19;
  NSMutableData *mdata;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  NSMutableData *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id *p_delegate;
  id v32;
  unint64_t v33;
  id v34;
  void *v35;
  int v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  uint64_t j;
  NSObject *v43;
  unint64_t v44;
  void *v45;
  NSObject *v46;
  MFSMTPResponse *v47;
  void *v48;
  uint64_t v49;
  MFSMTPResponse *v50;
  void *v51;
  id v52;
  void *v53;
  NSMutableData *v54;
  void *v55;
  NSMutableData *v56;
  void *v57;
  uint64_t v58;
  int64_t v59;
  uint64_t v60;
  char v61;
  unint64_t v62;
  unint64_t v63;
  int v64;
  char v65;
  MFSMTPResponse *lastResponse;
  void *v67;
  void *v68;
  MFSMTPResponse *v69;
  MFSMTPResponse *v70;
  void *v71;
  void *v72;
  char v73;
  id WeakRetained;
  unint64_t v75;
  unint64_t v76;
  MFSMTPResponse *v77;
  void *v78;
  MFSMTPResponse *v80;
  void *v81;
  void *v82;
  MFSMTPResponse *v83;
  id v84;
  BOOL v85;
  unint64_t v86;
  unint64_t v87;
  MFSMTPResponse *v88;
  void *v89;
  MFSMTPResponse *v90;
  void *v91;
  void *v92;
  MFSMTPResponse *v93;
  void *v94;
  uint64_t v96;
  id v97;
  id v98;
  void *v99;
  id v100;
  void *v101;
  void *v102;
  _BOOL4 v103;
  id v104;
  int v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  unint64_t v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  _QWORD v115[4];
  id v116;
  uint8_t buf[4];
  _BYTE v118[18];
  _BYTE v119[128];
  const __CFString *v120;
  void *v121;
  uint64_t v122;
  void *v123;
  _BYTE v124[128];
  uint64_t v125;

  v125 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v19 = a4;
  v100 = a5;
  v98 = a6;
  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  if (a11)
    *a11 = 0;
  v103 = -[MFSMTPConnection supportsChunking](self, "supportsChunking");
  v94 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6C8]), "initWithStyle:", a7);
  objc_msgSend(v94, "stringFromEmailAddressConvertible:", v18);
  v102 = (void *)objc_claimAutoreleasedReturnValue();

  v115[0] = MEMORY[0x1E0C809B0];
  v115[1] = 3221225472;
  v115[2] = __147__MFSMTPConnection_mailFrom_recipients_withData_host_emailFormatStyle_errorTitle_errorMessage_serverResponse_displayError_errorCode_errorUserInfo___block_invoke;
  v115[3] = &unk_1E4E89668;
  v97 = v94;
  v116 = v97;
  objc_msgSend(v19, "ef_map:", v115);
  v101 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[MFSMTPConnection supportsPipelining](self, "supportsPipelining"))
  {
    -[NSMutableData setLength:](self->_mdata, "setLength:", 0);
    mdata = self->_mdata;
    -[MFSMTPConnection dataForMailFrom:emailFormatStyle:](self, "dataForMailFrom:emailFormatStyle:", v102, a7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableData appendData:](mdata, "appendData:", v21);

    v113 = 0u;
    v114 = 0u;
    if (v103)
      v22 = 1;
    else
      v22 = 2;
    v111 = 0uLL;
    v112 = 0uLL;
    v23 = v101;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v111, v124, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v112;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v112 != v25)
            objc_enumerationMutation(v23);
          v27 = self->_mdata;
          -[MFSMTPConnection dataForRcptTo:](self, "dataForRcptTo:", *(_QWORD *)(*((_QWORD *)&v111 + 1) + 8 * i));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableData appendData:](v27, "appendData:", v28);

        }
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v111, v124, 16);
      }
      while (v24);
    }

    v29 = objc_msgSend(v23, "count") + v22;
    if (self->_useSaveSent && -[MFSMTPConnection _supportsSaveSentExtension](self, "_supportsSaveSentExtension"))
    {
      if (self->_saveSentMbox)
        v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" imapmailbox=\"%@\"), self->_saveSentMbox);
      else
        v30 = 0;
      v54 = self->_mdata;
      -[MFSMTPConnection _dataForCommand:length:argument:trailer:](self, "_dataForCommand:length:argument:trailer:", "SSNT", 4, v30, 0);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableData appendData:](v54, "appendData:", v55);

      v49 = v29 + 1;
      v105 = 1;
    }
    else
    {
      v105 = 0;
      v49 = v29;
    }
    if (!v103)
    {
      v56 = self->_mdata;
      -[MFSMTPConnection dataForDataCmd](self, "dataForDataCmd");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableData appendData:](v56, "appendData:", v57);

    }
    -[MFSMTPConnection _sendData:](self, "_sendData:", self->_mdata);
    if (v49)
    {
      v58 = 0;
      v59 = 0;
      v60 = v29 - 1;
      v96 = *MEMORY[0x1E0D1EDF0];
      v61 = 1;
      do
      {
        v62 = -[MFSMTPConnection _getReply](self, "_getReply");
        v63 = v62;
        v64 = v105;
        if (v60 != v58)
          v64 = 0;
        if (v64 == 1)
        {
          self->_dislikesSaveSentMbox = v62 != 2;
        }
        else if ((v61 & ((v62 & 0xFFFFFFFFFFFFFFFELL) != 2)) == 1)
        {
          if (v58)
          {
            v65 = v103;
            if (v49 - 1 != v58)
              v65 = 1;
            if ((v65 & 1) != 0)
            {
              if (a11)
                *a11 = 1;
              *a12 = 1049;
              lastResponse = self->_lastResponse;
              objc_msgSend(v23, "objectAtIndex:", v58 - 1);
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              MFLookupLocalizedString(CFSTR("SMTP_1_BAD_RECIPIENT"), CFSTR("The recipient “%@” was rejected by the server."), CFSTR("Delayed"));
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              -[MFSMTPResponse errorMessageWithAddress:defaultMessage:](lastResponse, "errorMessageWithAddress:defaultMessage:", v67, v68);
              *a9 = (id)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v70 = self->_lastResponse;
              MFLookupLocalizedString(CFSTR("SMTP_SENDING_CONTENT_FAILED"), CFSTR("Sending the message content to the server failed."), CFSTR("Delayed"));
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              -[MFSMTPResponse errorMessageWithAddress:defaultMessage:](v70, "errorMessageWithAddress:defaultMessage:", 0, v67);
              *a9 = (id)objc_claimAutoreleasedReturnValue();
            }
          }
          else
          {
            *a12 = 1047;
            v69 = self->_lastResponse;
            MFLookupLocalizedString(CFSTR("SMTP_INVALID_SENDER_ADDRESS"), CFSTR("The sender address “%@” was rejected by the server."), CFSTR("Delayed"));
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            -[MFSMTPResponse errorMessageWithAddress:defaultMessage:](v69, "errorMessageWithAddress:defaultMessage:", v102, v67);
            *a9 = (id)objc_claimAutoreleasedReturnValue();
          }

          -[MFSMTPConnection lastResponseLine](self, "lastResponseLine");
          *a10 = (id)objc_claimAutoreleasedReturnValue();
          if (a13)
          {
            v122 = v96;
            v120 = CFSTR("MFSMTPFailureReason");
            MFMFSMTPFailureReasonString(-[MFSMTPResponse failureReason](self->_lastResponse, "failureReason"));
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            v121 = v71;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v121, &v120, 1);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            v123 = v72;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v123, &v122, 1);
            *a13 = (id)objc_claimAutoreleasedReturnValue();

          }
          v61 = 0;
          v59 = 1;
        }
        ++v58;
      }
      while (v49 != v58);
      v73 = v103;
      if (v63 == 3)
        v73 = 1;
      if ((v61 & 1) == 0)
        goto LABEL_94;
    }
    else
    {
      v59 = 0;
      v73 = v103;
    }
    if ((v73 & 1) == 0)
      goto LABEL_94;
    WeakRetained = objc_loadWeakRetained(&self->_delegate);
    objc_msgSend(WeakRetained, "setPercentDone:", 0.2);

    v75 = v103
        ? -[MFSMTPConnection sendBData:](self, "sendBData:", v100)
        : -[MFSMTPConnection sendData:](self, "sendData:", v100);
    v76 = v75;
    if (v75 == 2)
      goto LABEL_94;
    if ((objc_msgSend(v99, "shouldCancel") & 1) != 0)
    {
LABEL_85:
      v59 = 4;
      goto LABEL_94;
    }
    if (v76 == 4)
    {
      v80 = self->_lastResponse;
      MFLookupLocalizedString(CFSTR("SMTP_SENDING_CONTENT_LATER"), CFSTR("Mail will try to send the message again later."), CFSTR("Delayed"));
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFSMTPResponse errorMessageWithAddress:defaultMessage:](v80, "errorMessageWithAddress:defaultMessage:", v102, v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = 2;
    }
    else
    {
      if (v76 == 5)
        v59 = 7;
      else
        v59 = 1;
      v83 = self->_lastResponse;
      MFLookupLocalizedString(CFSTR("SMTP_SENDING_CONTENT_FAILED"), CFSTR("Sending the message content to the server failed."), CFSTR("Delayed"));
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFSMTPResponse errorMessageWithAddress:defaultMessage:](v83, "errorMessageWithAddress:defaultMessage:", v102, v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
    }
    *a9 = v82;

    -[MFSMTPConnection lastResponseLine](self, "lastResponseLine");
    v84 = (id)objc_claimAutoreleasedReturnValue();
LABEL_102:
    *a10 = v84;
    goto LABEL_94;
  }
  if (-[MFSMTPConnection mailFrom:emailFormatStyle:](self, "mailFrom:emailFormatStyle:", v102, a7) != 2)
  {
    *a12 = 1047;
    v50 = self->_lastResponse;
    MFLookupLocalizedString(CFSTR("SMTP_INVALID_SENDER_ADDRESS"), CFSTR("The sender address “%@” was rejected by the server."), CFSTR("Delayed"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFSMTPResponse errorMessageWithAddress:defaultMessage:](v50, "errorMessageWithAddress:defaultMessage:", v102, v51);
    *a9 = (id)objc_claimAutoreleasedReturnValue();

    -[MFSMTPConnection lastResponseLine](self, "lastResponseLine");
    v52 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_45;
  }
  p_delegate = &self->_delegate;
  v32 = objc_loadWeakRetained(&self->_delegate);
  objc_msgSend(v32, "setPercentDone:", 0.15);

  v33 = objc_msgSend(v101, "count");
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  v34 = v101;
  v35 = 0;
  v36 = 0;
  v37 = 0;
  v38 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v106, v119, 16);
  if (!v38)
    goto LABEL_35;
  v39 = *(_QWORD *)v107;
  v40 = (float)(0.05 / (float)v33);
  v41 = 0.150000006;
  v104 = v34;
  do
  {
    for (j = 0; j != v38; ++j)
    {
      if (*(_QWORD *)v107 != v39)
        objc_enumerationMutation(v34);
      v110 = 0xAAAAAAAAAAAAAAAALL;
      v110 = *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * j);
      if (-[MFSMTPConnection rcptTo:](self, "rcptTo:") == 2)
      {
        v43 = objc_loadWeakRetained(p_delegate);
        v41 = v41 + v40;
        -[NSObject setPercentDone:](v43, "setPercentDone:", v41);
        ++v36;
        goto LABEL_33;
      }
      if (v35)
      {
        objc_msgSend(v35, "addObject:", v110);
        if (v37)
          goto LABEL_31;
      }
      else
      {
        v35 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DE8]), "initWithObjects:count:", &v110, 1);
        if (v37)
          goto LABEL_31;
      }
      v37 = -[MFSMTPResponse status](self->_lastResponse, "status");
      -[MFSMTPConnection lastResponseLine](self, "lastResponseLine");
      *a10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_31:
      +[MFSMTPConnection log](MFSMTPConnection, "log");
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        v44 = v110;
        -[MFSMTPConnection lastResponseLine](self, "lastResponseLine");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v118 = v44;
        *(_WORD *)&v118[8] = 2112;
        *(_QWORD *)&v118[10] = v45;
        _os_log_error_impl(&dword_1A4F90000, v43, OS_LOG_TYPE_ERROR, "SMTP error for recipient %@: %@", buf, 0x16u);

        v34 = v104;
        p_delegate = &self->_delegate;
      }
LABEL_33:

    }
    v38 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v106, v119, 16);
  }
  while (v38);
LABEL_35:

  +[MFSMTPConnection log](MFSMTPConnection, "log");
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v118 = v36;
    *(_WORD *)&v118[4] = 2112;
    *(_QWORD *)&v118[6] = v35;
    _os_log_impl(&dword_1A4F90000, v46, OS_LOG_TYPE_DEFAULT, "SMTP delivery:%d valid recipients; invalid recipients = %@",
      buf,
      0x12u);
  }

  if (!v37)
  {

    if (self->_useSaveSent && -[MFSMTPConnection _supportsSaveSentExtension](self, "_supportsSaveSentExtension"))
    {
      if (self->_saveSentMbox)
        v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" imapmailbox=\"%@\"), self->_saveSentMbox);
      else
        v53 = 0;
      v85 = -[MFSMTPConnection _sendCommand:length:argument:trailer:](self, "_sendCommand:length:argument:trailer:", "SSNT", 4, v53, 0) != 2|| -[MFSMTPConnection _getReply](self, "_getReply") != 2;
      self->_dislikesSaveSentMbox = v85;

    }
    if (v103)
    {
      v86 = -[MFSMTPConnection sendBData:](self, "sendBData:", v100);
LABEL_110:
      v87 = v86;
      if (v86 == 2)
      {
        v59 = 0;
        goto LABEL_94;
      }
      if ((objc_msgSend(v99, "shouldCancel") & 1) != 0)
        goto LABEL_85;
      if (v87 == 4)
      {
        v90 = self->_lastResponse;
        MFLookupLocalizedString(CFSTR("SMTP_SENDING_CONTENT_LATER"), CFSTR("Mail will try to send the message again later."), CFSTR("Delayed"));
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFSMTPResponse errorMessageWithAddress:defaultMessage:](v90, "errorMessageWithAddress:defaultMessage:", v102, v91);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = 2;
      }
      else
      {
        if (v87 == 5)
          v59 = 7;
        else
          v59 = 1;
        v93 = self->_lastResponse;
        MFLookupLocalizedString(CFSTR("SMTP_SENDING_CONTENT_FAILED"), CFSTR("Sending the message content to the server failed."), CFSTR("Delayed"));
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFSMTPResponse errorMessageWithAddress:defaultMessage:](v93, "errorMessageWithAddress:defaultMessage:", v102, v91);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
      }
      *a9 = v92;

      -[MFSMTPConnection lastResponseLine](self, "lastResponseLine");
      v84 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_102;
    }
    if (-[MFSMTPConnection _sendCommand:length:argument:trailer:](self, "_sendCommand:length:argument:trailer:", "DATA", 4, 0, 0) == 2&& -[MFSMTPConnection _getReply](self, "_getReply") == 3)
    {
      v86 = -[MFSMTPConnection sendData:](self, "sendData:", v100);
      goto LABEL_110;
    }
    -[MFSMTPResponse setStatus:](self->_lastResponse, "setStatus:", 550);
    v88 = self->_lastResponse;
    MFLookupLocalizedString(CFSTR("SMTP_SENDING_CONTENT_FAILED"), CFSTR("Sending the message content to the server failed."), CFSTR("Delayed"));
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFSMTPResponse errorMessageWithAddress:defaultMessage:](v88, "errorMessageWithAddress:defaultMessage:", 0, v89);
    *a9 = (id)objc_claimAutoreleasedReturnValue();

    -[MFSMTPConnection lastResponseLine](self, "lastResponseLine");
    v52 = (id)objc_claimAutoreleasedReturnValue();
LABEL_45:
    *a10 = v52;
    goto LABEL_93;
  }
  if (objc_msgSend(v35, "count"))
  {
    if (a11)
      *a11 = 1;
    *a12 = 1049;
    v47 = self->_lastResponse;
    objc_msgSend(v35, "lastObject");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v35, "count") < 2)
      MFLookupLocalizedString(CFSTR("SMTP_1_BAD_RECIPIENT"), CFSTR("The recipient “%@” was rejected by the server."), CFSTR("Delayed"));
    else
      MFLookupLocalizedString(CFSTR("SMTP_BAD_RECIPIENTS"), CFSTR("The recipients were rejected by the server."), CFSTR("Delayed"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFSMTPResponse errorMessageWithAddress:defaultMessage:](v47, "errorMessageWithAddress:defaultMessage:", v48, v78);
    *a9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    *a12 = 1049;
    v77 = self->_lastResponse;
    MFLookupLocalizedString(CFSTR("SMTP_RECIPIENTS_UNRECOGNIZED"), CFSTR("Verify that you have addressed this message correctly. Check your SMTP server settings in Mail Preferences and verify any advanced settings with your system administrator."), CFSTR("Delayed"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFSMTPResponse errorMessageWithAddress:defaultMessage:](v77, "errorMessageWithAddress:defaultMessage:", 0, v48);
    *a9 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_93:
  v59 = 1;
LABEL_94:
  if (*a9 && !*a8)
  {
    MFLookupLocalizedString(CFSTR("SMTP_SENDING_FAILED_TITLE"), CFSTR("Unable to Send Email"), CFSTR("Delayed"));
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v59;
}

id __147__MFSMTPConnection_mailFrom_recipients_withData_host_emailFormatStyle_errorTitle_errorMessage_serverResponse_displayError_errorCode_errorUserInfo___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "stringFromEmailAddressConvertible:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)timeLastCommandWasSent
{
  return self->_lastCommandTimestamp;
}

- (unint64_t)_sendBytes:(const char *)a3 length:(unint64_t)a4 progressHandler:(id)a5
{
  id v8;
  uint64_t (**v9)(_QWORD, _QWORD);
  unint64_t v10;
  unint64_t v11;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;

  v8 = a5;
  v9 = (uint64_t (**)(_QWORD, _QWORD))v8;
  v10 = a4;
  if (v8)
  {
    v11 = (*((uint64_t (**)(id, _QWORD))v8 + 2))(v8, 0);
    if (v11 >= a4 || v11 == 0)
      v10 = a4;
    else
      v10 = v11;
  }
  if (a4)
  {
    v13 = 4;
    while (1)
    {
      v14 = self->_hideLoggedData ? 0 : 0x7FFFFFFFFFFFFFFFLL;
      v15 = self->_hideLoggedData ? v10 : 0;
      if (!-[MFConnection writeBytes:length:dontLogBytesInRange:](self, "writeBytes:length:dontLogBytesInRange:", a3, v10, v14, v15))break;
      a4 -= v10;
      if (v9)
      {
        v16 = v9[2](v9, v10);
        if (v16 >= a4)
          v17 = a4;
        else
          v17 = v16;
        if (!v16)
          v17 = a4;
      }
      else if (v10 >= a4)
      {
        v17 = a4;
      }
      else
      {
        v17 = v10;
      }
      a3 += v10;
      v10 = v17;
      if (!a4)
        goto LABEL_28;
    }
  }
  else
  {
LABEL_28:
    v13 = 2;
  }
  -[MFSMTPConnection _setLastResponse:](self, "_setLastResponse:", 0);

  return v13;
}

- (unint64_t)_sendData:(id)a3
{
  id v4;
  unint64_t v5;

  v4 = objc_retainAutorelease(a3);
  v5 = -[MFSMTPConnection _sendBytes:length:progressHandler:](self, "_sendBytes:length:progressHandler:", objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"), 0);

  return v5;
}

- (unint64_t)_sendData:(id)a3 progressHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  unint64_t v9;

  v6 = a3;
  v7 = a4;
  v8 = objc_retainAutorelease(v6);
  v9 = -[MFSMTPConnection _sendBytes:length:progressHandler:](self, "_sendBytes:length:progressHandler:", objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"), v7);

  return v9;
}

- (id)_dataForCommand:(const char *)a3 length:(unint64_t)a4 argument:(id)a5 trailer:(const char *)a6
{
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;

  v9 = a5;
  objc_msgSend(MEMORY[0x1E0D46100], "data");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (a3)
    objc_msgSend(v10, "appendBytes:length:", a3, a4);
  objc_msgSend(v9, "precomposedStringWithCanonicalMapping");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = objc_msgSend(v12, "UTF8String");

  if (v13)
    objc_msgSend(v11, "mf_appendCString:", v13);
  if (a6)
    objc_msgSend(v11, "appendBytes:length:", a6, strlen(a6));
  objc_msgSend(v11, "appendBytes:length:", "\r\n", 2);

  return v11;
}

- (unint64_t)_sendCommand:(const char *)a3 length:(unint64_t)a4 argument:(id)a5 trailer:(const char *)a6
{
  id v10;
  NSMutableData *mdata;
  void *v12;
  unint64_t v13;

  v10 = a5;
  self->_lastCommandTimestamp = time(0);
  -[NSMutableData setLength:](self->_mdata, "setLength:", 0);
  mdata = self->_mdata;
  -[MFSMTPConnection _dataForCommand:length:argument:trailer:](self, "_dataForCommand:length:argument:trailer:", a3, a4, v10, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableData appendData:](mdata, "appendData:", v12);

  v13 = -[MFSMTPConnection _sendData:](self, "_sendData:", self->_mdata);
  return v13;
}

- (unint64_t)_getReply
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  MFSMTPResponse *v6;
  MFSMTPResponse *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  char v13;
  unint64_t v14;
  unint64_t v15;

  v3 = 0;
  v14 = 0xAAAAAAAAAAAAAAAALL;
  v15 = 0xAAAAAAAAAAAAAAAALL;
  v13 = 1;
  while (1)
  {
    v4 = -[MFSMTPConnection _readResponseRange:isContinuation:](self, "_readResponseRange:isContinuation:", &v14, &v13);
    v5 = v4 > 0x257
       ? 6
       : *(_QWORD *)((char *)&unk_1A5999B20
                   + ((2 * (((v4 >> 2) * (unsigned __int128)0x28F5C28F5C28F5C3uLL) >> 64)) & 0x1FFFFFFFFFFFFFF8));
    v6 = -[MFSMTPResponse initWithStatus:]([MFSMTPResponse alloc], "initWithStatus:", v4);
    v7 = v6;
    if (v5 == 2)
    {
      -[MFSMTPResponse setLastResponseLine:](v6, "setLastResponseLine:", 0);
    }
    else
    {
      if (v14 == 0x7FFFFFFFFFFFFFFFLL || !v15)
      {
        v9 = objc_alloc(MEMORY[0x1E0CB3940]);
        MFLookupLocalizedString(CFSTR("SMTP_GENERIC_ERROR_FORMAT"), CFSTR("An error occurred while delivering this message via the SMTP server “%@”"), CFSTR("Delayed"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFNWConnectionWrapper remoteHostname](self->super._socket, "remoteHostname");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)objc_msgSend(v9, "initWithFormat:", v10, v11);

        -[MFSMTPResponse setLastResponseLine:](v7, "setLastResponseLine:", v8);
      }
      else
      {
        -[NSMutableData subdataWithRange:](self->_mdata, "subdataWithRange:");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFSMTPResponse setLastResponseLine:](v7, "setLastResponseLine:", v8);
      }

    }
    if (!v13)
      break;
    if (v3)
      objc_msgSend(v3, "addObject:", v7);
    else
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v7, 0);

    if (!v13)
    {
      v7 = 0;
      break;
    }
  }
  -[MFSMTPResponse setContinuationResponses:](v7, "setContinuationResponses:", v3);
  -[MFSMTPConnection _setLastResponse:](self, "_setLastResponse:", v7);

  return v5;
}

- (unint64_t)_readResponseRange:(_NSRange *)a3 isContinuation:(BOOL *)a4
{
  NSUInteger v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  _BOOL8 v16;
  uint64_t v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
  unint64_t v21;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  _QWORD block[6];

  *a3 = (_NSRange)xmmword_1A59996E0;
  -[NSMutableData setLength:](self->_mdata, "setLength:", 0);
  if (!-[MFConnection readLineIntoData:](self, "readLineIntoData:", self->_mdata))
  {
    LOBYTE(v16) = 0;
    v21 = 0;
    if (!a4)
      return v21;
LABEL_12:
    *a4 = v16;
    return v21;
  }
  v26 = -[NSMutableData bytes](self->_mdata, "bytes");
  v8 = -[NSMutableData length](self->_mdata, "length");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__MFSMTPConnection__readResponseRange_isContinuation___block_invoke;
  block[3] = &unk_1E4E89DD0;
  block[4] = self;
  block[5] = a2;
  if (_readResponseRange_isContinuation__once != -1)
    dispatch_once(&_readResponseRange_isContinuation__once, block);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v26, v8, 1, 0);
  objc_msgSend((id)_readResponseRange_isContinuation___responseRegex, "firstMatchInString:options:range:", v25, 0, 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if (objc_msgSend(v9, "numberOfRanges") != 4)
      __assert_rtn("-[MFSMTPConnection _readResponseRange:isContinuation:]", "MFSMTPConnection.m", 924, "[match numberOfRanges] == 4");
    objc_msgSend(v10, "range");
    v12 = v11;
    v24 = objc_msgSend(v10, "rangeAtIndex:", 1);
    v14 = v13;
    v23 = objc_msgSend(v10, "rangeAtIndex:", 2);
    v16 = v15;
    v17 = objc_msgSend(v10, "rangeAtIndex:", 3);
    if (v12 && v14 && (v19 = v17, v17 != 0x7FFFFFFFFFFFFFFFLL))
    {
      v20 = v18;
      v21 = strtoul((const char *)(v26 + v24), 0, 10);
      if (v16)
        LOBYTE(v16) = *(_BYTE *)(v26 + v23) == 45;
    }
    else
    {
      v20 = -[NSMutableData length](self->_mdata, "length");
      v19 = 0;
      LOBYTE(v16) = 0;
      v21 = 550;
    }
    a3->location = v19;
    a3->length = v20;
  }
  else
  {
    LOBYTE(v16) = 0;
    v21 = 0;
  }

  if (a4)
    goto LABEL_12;
  return v21;
}

void __54__MFSMTPConnection__readResponseRange_isContinuation___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("^([0-9]+)([- ])?(.*)$"), 16, 0);
  v3 = (void *)_readResponseRange_isContinuation___responseRegex;
  _readResponseRange_isContinuation___responseRegex = v2;

  if (!_readResponseRange_isContinuation___responseRegex)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("MFSMTPConnection.m"), 917, CFSTR("Unable to init regular expression from %@"), CFSTR("^([0-9]+)([- ])?(.*)$"));

  }
}

- (BOOL)_connectUsingAccount:(id)a3
{
  id v4;
  unsigned __int8 v5;
  MFNWConnectionWrapper *socket;
  int v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  MFNWConnectionWrapper *v19;
  objc_super v21;

  v4 = a3;
  -[MFSMTPConnection _setLastResponse:](self, "_setLastResponse:", 0);
  v21.receiver = self;
  v21.super_class = (Class)MFSMTPConnection;
  v5 = -[MFConnection connectUsingAccount:](&v21, sel_connectUsingAccount_, v4);
  socket = self->super._socket;
  if ((v5 & 1) != 0)
  {
    v7 = -[MFNWConnectionWrapper timeout](socket, "timeout");
    self->_originalSocketTimeout = v7;
    if (v7 >= 1)
    {
      if (v7 <= 300)
        v8 = 300;
      else
        v8 = v7;
      -[MFNWConnectionWrapper setTimeout:](self->super._socket, "setTimeout:", v8);
    }
    if (-[MFSMTPConnection _getReply](self, "_getReply") == 2)
    {
      v9 = 1;
      goto LABEL_15;
    }
  }
  else
  {
    self->super._socket = 0;

  }
  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && objc_msgSend(v11, "code") != 1029)
  {
    v17 = v11;
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    MFLookupLocalizedString(CFSTR("FAILED_SEND"), CFSTR("Check the account settings for the outgoing server “%@”."), CFSTR("Delayed"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hostname");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    MFLookupLocalizedString(CFSTR("FAILED_SEND_TITLE"), CFSTR("Cannot Send Mail"), CFSTR("Delayed"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), 1031, v15, v16, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setError:", v17);

  }
  v19 = self->super._socket;
  self->super._socket = 0;

  v9 = 0;
LABEL_15:

  return v9;
}

- (unint64_t)_doHandshakeUsingAccount:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  char v6;
  __int128 v7;
  char v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  __CFString *v13;
  NSObject *v14;
  __CFString *v15;
  void *v16;
  uint64_t v17;
  NSMutableArray *serviceExtensions;
  NSMutableArray *v19;
  NSMutableArray *v20;
  NSObject *v21;
  NSMutableArray *v22;
  NSObject *v23;
  int v24;
  NSObject *v25;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  NSObject *v31;
  MFNWConnectionWrapper *socket;
  void *v34;
  __int128 v35;
  id v36;
  unint64_t v37;
  const UInt8 *v38;
  unint64_t v39;
  unint64_t v40;
  char v41;
  uint8_t buf[4];
  MFSMTPConnection *v43;
  __int16 v44;
  const __CFString *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v36 = a3;
  v41 = 1;
  +[MFSMTPConnection log](MFSMTPConnection, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v43 = self;
    v44 = 2114;
    v45 = CFSTR("smtpclient.apple");
    _os_log_impl(&dword_1A4F90000, v4, OS_LOG_TYPE_DEFAULT, "MFSMTPConnection[%p]: Trying EHLO using clientDomainName [%{public}@]", buf, 0x16u);
  }

  v37 = -[MFSMTPConnection _sendCommand:length:argument:trailer:](self, "_sendCommand:length:argument:trailer:", "EHLO ", 5, CFSTR("smtpclient.apple"), 0);
  if (v37 != 2)
  {
    v24 = 1;
    goto LABEL_41;
  }
  +[MFSMTPConnection log](MFSMTPConnection, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v43 = self;
    v44 = 2114;
    v45 = CFSTR("smtpclient.apple");
    _os_log_impl(&dword_1A4F90000, v5, OS_LOG_TYPE_DEFAULT, "MFSMTPConnection[%p]: EHLO using clientDomainName [%{public}@] - Success.", buf, 0x16u);
  }

  v6 = 1;
  *(_QWORD *)&v7 = 134218242;
  v35 = v7;
  v8 = 1;
  while (1)
  {
    v39 = 0xAAAAAAAAAAAAAAAALL;
    v40 = 0xAAAAAAAAAAAAAAAALL;
    if (-[MFSMTPConnection _readResponseRange:isContinuation:](self, "_readResponseRange:isContinuation:", &v39, &v41, v35) == 250)
    {
      if (!(v6 & 1 | (v40 == 0)))
      {
        v9 = -[NSMutableData bytes](self->_mdata, "bytes");
        v10 = v9 + v39;
        v38 = (const UInt8 *)(v9 + v39);
        v11 = v9 + v39 + v40;
        if (v40 >= 6 && !strncasecmp((const char *)(v9 + v39), "AUTH=", 5uLL))
        {
          _createParameterStringFromBytes(&v38, v10 + 5);
          v12 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          _createParameterStringFromBytes(&v38, v11);
          v12 = objc_claimAutoreleasedReturnValue();
        }
        v13 = (__CFString *)v12;
        +[MFSMTPConnection log](MFSMTPConnection, "log");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v35;
          v43 = self;
          v44 = 2112;
          v45 = v13;
          _os_log_impl(&dword_1A4F90000, v14, OS_LOG_TYPE_DEFAULT, "MFSMTPConnection[%p]: Current keyword: %@", buf, 0x16u);
        }

        if (v13)
        {
          v15 = 0;
          v16 = 0;
          while (1)
          {
            _createParameterStringFromBytes(&v38, v11);
            v17 = objc_claimAutoreleasedReturnValue();

            if (!v17)
              break;
            v16 = (void *)v17;
            if (!v15)
              v15 = (__CFString *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 5);
            -[__CFString addObject:](v15, "addObject:", v17);
          }
          serviceExtensions = self->_serviceExtensions;
          if (!serviceExtensions)
          {
            v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v20 = self->_serviceExtensions;
            self->_serviceExtensions = v19;

            serviceExtensions = self->_serviceExtensions;
          }
          -[NSMutableArray addObject:](serviceExtensions, "addObject:", v13);
          +[MFSMTPConnection log](MFSMTPConnection, "log");
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v35;
            v43 = self;
            v44 = 2112;
            v45 = v13;
            _os_log_impl(&dword_1A4F90000, v21, OS_LOG_TYPE_DEFAULT, "MFSMTPConnection[%p]: Service extension added keyword: %@", buf, 0x16u);
          }

          v22 = self->_serviceExtensions;
          if (v15)
          {
            -[NSMutableArray addObject:](self->_serviceExtensions, "addObject:", v15);
            +[MFSMTPConnection log](MFSMTPConnection, "log");
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v35;
              v43 = self;
              v44 = 2112;
              v45 = v15;
              _os_log_impl(&dword_1A4F90000, v23, OS_LOG_TYPE_DEFAULT, "MFSMTPConnection[%p]: Service extension added params: %@", buf, 0x16u);
            }
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99D20], "array");
            v23 = objc_claimAutoreleasedReturnValue();
            -[NSMutableArray addObject:](v22, "addObject:", v23);
          }

        }
      }
      v8 = 0;
      v6 = 0;
      goto LABEL_33;
    }
    if (-[MFSMTPResponse status](self->_lastResponse, "status") != 500)
      break;
LABEL_33:
    if (!v41)
      goto LABEL_40;
  }
  +[MFSMTPConnection log](MFSMTPConnection, "log");
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", -[NSMutableData bytes](self->_mdata, "bytes"), -[NSMutableData length](self->_mdata, "length"), 4);
    *(_DWORD *)buf = 134218498;
    v43 = self;
    v44 = 2114;
    v45 = CFSTR("smtpclient.apple");
    v46 = 2112;
    v47 = v34;
    _os_log_error_impl(&dword_1A4F90000, v25, OS_LOG_TYPE_ERROR, "MFSMTPConnection[%p]: Got unexpected EHLO response using clientDomainName [%{public}@] ESMTP params %@", buf, 0x20u);

  }
  v41 = 0;
LABEL_40:
  v24 = v8 & 1;
LABEL_41:
  if ((objc_msgSend(v36, "usesSSL") & 1) != 0)
  {
    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "error");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "domain");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend((id)*MEMORY[0x1E0CB31B0], "isEqualToString:", v29);

    if ((v30 & 1) != 0 || ((v24 ^ 1) & 1) != 0)
      goto LABEL_58;
  }
  else if ((v24 & 1) == 0)
  {
    goto LABEL_58;
  }
  +[MFSMTPConnection log](MFSMTPConnection, "log");
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v43 = self;
    v44 = 2114;
    v45 = CFSTR("smtpclient.apple");
    _os_log_impl(&dword_1A4F90000, v31, OS_LOG_TYPE_DEFAULT, "MFSMTPConnection[%p]: EHLO using clientDomainName [%{public}@] - Failed. Falling back to HELO", buf, 0x16u);
  }

  if (!-[MFNWConnectionWrapper isWritable](self->super._socket, "isWritable"))
    goto LABEL_55;
  if (-[MFSMTPConnection _sendCommand:length:argument:trailer:](self, "_sendCommand:length:argument:trailer:", "RSET", 4, 0, 0) == 2)-[MFSMTPConnection _getReply](self, "_getReply");
  if (-[MFNWConnectionWrapper isWritable](self->super._socket, "isWritable")
    && -[MFSMTPConnection _sendCommand:length:argument:trailer:](self, "_sendCommand:length:argument:trailer:", "HELO ", 5, CFSTR("smtpclient.apple"), 0) == 2&& (v37 = -[MFSMTPConnection _getReply](self, "_getReply"), v37 == 2))
  {
    v37 = 2;
  }
  else
  {
LABEL_55:
    -[MFNWConnectionWrapper close](self->super._socket, "close");
    socket = self->super._socket;
    self->super._socket = 0;

    if (-[MFSMTPConnection _connectUsingAccount:](self, "_connectUsingAccount:", v36))
    {
      v37 = -[MFSMTPConnection _sendCommand:length:argument:trailer:](self, "_sendCommand:length:argument:trailer:", "HELO ", 5, CFSTR("smtpclient.apple"), 0);
      if (v37 == 2)
        v37 = -[MFSMTPConnection _getReply](self, "_getReply");
    }
  }
LABEL_58:

  return v37;
}

- (BOOL)_hasParameter:(id)a3 forKeyword:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  _BOOL4 v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  v8 = -[NSMutableArray count](self->_serviceExtensions, "count");
  objc_msgSend(v6, "uppercaseString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 >= 2)
  {
    v11 = 1;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_serviceExtensions, "objectAtIndex:", v11 - 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "caseInsensitiveCompare:", v7);
      v10 = v13 == 0;

      if (v13)
        v14 = 1;
      else
        v14 = v9 == 0;
      if (!v14)
      {
        -[NSMutableArray objectAtIndex:](self->_serviceExtensions, "objectAtIndex:", v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v15, "indexOfObject:", v9) != 0x7FFFFFFFFFFFFFFFLL;

      }
      v11 += 2;
    }
    while (v11 < v8 && !v10);
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)_supportsExtension:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  __int128 v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  BOOL v11;
  char v12;
  __int128 v14;
  uint8_t buf[4];
  MFSMTPConnection *v16;
  __int16 v17;
  void *v18;
  uint8_t v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NSMutableArray count](self->_serviceExtensions, "count");
  +[MFSMTPConnection log](MFSMTPConnection, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[MFSMTPConnection _supportsExtension:].cold.1((uint64_t)self, v19, -[NSMutableArray count](self->_serviceExtensions, "count"), v6);

  if (v5)
  {
    v8 = 0;
    *(_QWORD *)&v7 = 134218242;
    v14 = v7;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_serviceExtensions, "objectAtIndex:", v8, v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[MFSMTPConnection log](MFSMTPConnection, "log");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v14;
        v16 = self;
        v17 = 2114;
        v18 = v9;
        _os_log_error_impl(&dword_1A4F90000, v10, OS_LOG_TYPE_ERROR, "MFSMTPConnection[%p]: current keyword %{public}@", buf, 0x16u);
      }

      v11 = objc_msgSend(v9, "caseInsensitiveCompare:", v4) == 0;
      v12 = v8 + 3 > v5 || v11;
      v8 += 2;
    }
    while ((v12 & 1) == 0);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_setLastResponse:(id)a3
{
  objc_storeStrong((id *)&self->_lastResponse, a3);
}

- (id)lastResponseLine
{
  void *v2;
  __CFString *v3;
  id v4;
  __CFString *v5;

  -[MFSMTPResponse lastResponseLine](self->_lastResponse, "lastResponseLine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
LABEL_6:
    v5 = v3;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v2, "description");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v4 = objc_retainAutorelease(v2);
  v5 = (__CFString *)CFStringCreateWithBytes(0, (const UInt8 *)objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"), 0x600u, 0);

LABEL_7:
  return v5;
}

- (BOOL)_supportsSaveSentExtension
{
  return -[MFSMTPConnection _supportsExtension:](self, "_supportsExtension:", CFSTR("SSNT"));
}

- (void)setUseSaveSent:(BOOL)a3 toFolder:(id)a4
{
  id v6;
  NSString *v7;
  NSString *saveSentMbox;
  id v9;

  v6 = a4;
  self->_useSaveSent = a3;
  v9 = v6;
  if ((objc_msgSend(v6, "isEqualToString:", self->_saveSentMbox) & 1) == 0)
  {
    self->_dislikesSaveSentMbox = 0;
    v7 = (NSString *)objc_msgSend(v9, "copy");
    saveSentMbox = self->_saveSentMbox;
    self->_saveSentMbox = v7;

  }
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_saveSentMbox, 0);
  objc_storeStrong((id *)&self->_domainName, 0);
  objc_storeStrong((id *)&self->_mdata, 0);
  objc_storeStrong((id *)&self->_serviceExtensions, 0);
  objc_storeStrong((id *)&self->_lastResponse, 0);
}

- (void)_supportsExtension:(uint64_t)a3 .cold.1(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218240;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(_QWORD *)(buf + 14) = a3;
  _os_log_error_impl(&dword_1A4F90000, log, OS_LOG_TYPE_ERROR, "MFSMTPConnection[%p]: extensions count %lu", buf, 0x16u);
}

@end
