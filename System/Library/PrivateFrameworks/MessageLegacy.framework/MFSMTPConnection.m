@implementation MFSMTPConnection

- (MFSMTPConnection)init
{
  MFSMTPConnection *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MFSMTPConnection;
  v2 = -[MFConnection init](&v4, sel_init);
  if (v2)
    v2->_mdata = (NSMutableData *)objc_msgSend(objc_alloc(MEMORY[0x1E0D46100]), "initWithCapacity:", 128);
  return v2;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFSMTPConnection;
  -[MFConnection dealloc](&v3, sel_dealloc);
}

- (int)state
{
  unsigned int v2;

  v2 = -[MFSMTPResponse status](self->_lastResponse, "status");
  if (v2 > 0x257)
    return 6;
  else
    return *(_DWORD *)((char *)&unk_1C88A3890 + ((v2 / 0x19uLL) & 0xFFFFFFC));
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

  v4 = (NSString *)objc_msgSend(a3, "copyWithZone:", -[MFSMTPConnection zone](self, "zone"));

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

- (BOOL)supports8BitMime
{
  int v2;

  v2 = -[MFSMTPConnection _supportsExtension:](self, "_supportsExtension:", CFSTR("8BITMIME"));
  if (v2)
    LOBYTE(v2) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("Enable8BITMIME"));
  return v2;
}

- (BOOL)supportsBinaryMime
{
  int v2;

  v2 = -[MFSMTPConnection _supportsExtension:](self, "_supportsExtension:", CFSTR("BINARYMIME"));
  if (v2)
    LOBYTE(v2) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("EnableBINARYMIME"));
  return v2;
}

- (BOOL)supportsEnhancedStatusCodes
{
  return -[MFSMTPConnection _supportsExtension:](self, "_supportsExtension:", CFSTR("ENHANCEDSTATUSCODES"));
}

- (BOOL)supportsChunking
{
  int v2;

  v2 = -[MFSMTPConnection _supportsExtension:](self, "_supportsExtension:", CFSTR("CHUNKING"));
  if (v2)
    LOBYTE(v2) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("DisableCHUNKING")) ^ 1;
  return v2;
}

- (unint64_t)maximumMessageBytes
{
  unint64_t result;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t Bytes;
  char __str[21];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  result = -[NSMutableArray count](self->_serviceExtensions, "count");
  if (result)
  {
    v4 = result;
    v5 = 1;
    do
    {
      if (objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_serviceExtensions, "objectAtIndex:", v5 - 1), "caseInsensitiveCompare:", CFSTR("SIZE"))|| (v7 = (void *)-[NSMutableArray objectAtIndex:](self->_serviceExtensions, "objectAtIndex:", v5), !objc_msgSend(v7, "count")))
      {
        v6 = 0;
      }
      else
      {
        v6 = (void *)objc_msgSend(v7, "objectAtIndex:", 0);
      }
      v5 += 2;
    }
    while (v5 <= v4 && !v6);
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v8 = objc_msgSend(v6, "length");
      Bytes = MFStringGetBytes();
      result = 0;
      if (v8 == Bytes)
      {
        __str[0] = 0;
        return strtoull(__str, 0, 10);
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)authenticationMechanisms
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  unint64_t i;
  void *v7;

  v3 = -[NSMutableArray count](self->_serviceExtensions, "count");
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    for (i = 1; i <= v4; i += 2)
    {
      if (!objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_serviceExtensions, "objectAtIndex:", i - 1), "caseInsensitiveCompare:", CFSTR("AUTH")))
      {
        v7 = (void *)-[NSMutableArray objectAtIndex:](self->_serviceExtensions, "objectAtIndex:", i);
        if (objc_msgSend(v7, "count"))
        {
          if (v5)
            objc_msgSend(v5, "addObjectsFromArray:", v7);
          else
            v5 = (void *)objc_msgSend(v7, "mutableCopyWithZone:", 0);
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
  objc_super v6;

  if (!objc_msgSend(a3, "preferredAuthScheme"))
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)MFSMTPConnection;
  return -[MFConnection authenticateUsingAccount:](&v6, sel_authenticateUsingAccount_, a3);
}

- (BOOL)authenticateUsingAccount:(id)a3 authenticator:(id)a4
{
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  id v17;
  uint64_t v18;

  v7 = (void *)objc_msgSend(a4, "saslName");
  v8 = objc_msgSend(a4, "base64EncodeResponseData");
  objc_msgSend(a4, "setAuthenticationState:", 1);
  v9 = (void *)objc_msgSend(a4, "responseForServerData:", 0);
  self->_hideLoggedData = objc_msgSend(a4, "justSentPlainTextPassword");
  if (v9)
  {
    if (v8)
      objc_msgSend(v9, "mf_encodeBase64WithoutLineBreaks");
    v10 = (void *)objc_msgSend(v7, "mutableCopyWithZone:", 0);
    v11 = (void *)MFCreateStringWithData();
    objc_msgSend(v10, "appendString:", CFSTR(" "));
    objc_msgSend(v10, "appendString:", v11);

    v12 = -[MFSMTPConnection _sendCommand:length:argument:trailer:](self, "_sendCommand:length:argument:trailer:", "AUTH ", 5, v10, 0);
  }
  else
  {
    v12 = -[MFSMTPConnection _sendCommand:length:argument:trailer:](self, "_sendCommand:length:argument:trailer:", "AUTH ", 5, v7, 0);
  }
  if (v12 == 2)
    v12 = -[MFSMTPConnection _getReply](self, "_getReply");
  else
    objc_msgSend(a4, "setAuthenticationState:", 3);
  if (objc_msgSend(a4, "authenticationState") == 1)
  {
    while ((v12 - 4) >= 2)
    {
      if (v12 == 2)
      {
        v17 = a4;
        v18 = 4;
        goto LABEL_27;
      }
      if (v12 != 3)
        goto LABEL_26;
      v13 = -[MFSMTPResponse lastResponseLine](self->_lastResponse, "lastResponseLine");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        v13 = (id)objc_msgSend(MEMORY[0x1E0C99D50], "data");
      if (v8)
        v13 = (id)objc_msgSend(v13, "mf_decodeBase64");
      v14 = (void *)objc_msgSend(a4, "responseForServerData:", v13);
      self->_hideLoggedData = objc_msgSend(a4, "justSentPlainTextPassword");
      if (v14)
      {
        if (v8)
          v14 = (void *)objc_msgSend(v14, "mf_encodeBase64WithoutLineBreaks");
        v15 = -[MFSMTPConnection _sendCommand:length:argument:trailer:](self, "_sendCommand:length:argument:trailer:", objc_msgSend(v14, "bytes"), objc_msgSend(v14, "length"), 0, 0);
        if (v15 != 2)
        {
          v12 = v15;
LABEL_26:
          v17 = a4;
          v18 = 3;
LABEL_27:
          objc_msgSend(v17, "setAuthenticationState:", v18);
          goto LABEL_28;
        }
        v12 = -[MFSMTPConnection _getReply](self, "_getReply");
      }
      else
      {
        objc_msgSend(a4, "setAuthenticationState:", 2);
        v12 = 3;
      }
LABEL_28:
      if (objc_msgSend(a4, "authenticationState") != 1)
        goto LABEL_29;
    }
    v16 = (void *)objc_msgSend(a3, "errorForResponse:", self->_lastResponse);
    objc_msgSend(v16, "setMoreInfo:", -[MFSMTPConnection lastResponseLine](self, "lastResponseLine"));
    objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "setError:", v16);
    v17 = a4;
    v18 = 2;
    goto LABEL_27;
  }
LABEL_29:
  self->_hideLoggedData = 0;
  return objc_msgSend(a4, "authenticationState") == 4;
}

- (BOOL)connectUsingAccount:(id)a3
{
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  v5 = -[MFSMTPConnection _connectUsingAccount:](self, "_connectUsingAccount:");
  if (!v5)
    return v5;
  if (-[MFSMTPConnection _doHandshakeUsingAccount:](self, "_doHandshakeUsingAccount:", a3) != 2)
  {
LABEL_16:
    LOBYTE(v5) = 0;
    return v5;
  }
  if (!objc_msgSend(a3, "usesSSL")
    || !objc_msgSend((id)*MEMORY[0x1E0C9B328], "isEqualToString:", -[_MFSocket securityProtocol](self->super._socket, "securityProtocol")))
  {
    LOBYTE(v5) = 1;
    return v5;
  }
  if (!-[MFSMTPConnection _hasParameter:forKeyword:](self, "_hasParameter:forKeyword:", 0, CFSTR("STARTTLS")))
  {
    v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", MFLookupLocalizedString((uint64_t)CFSTR("FAILED_SEND_SSL_NEEDED"), (uint64_t)CFSTR("Check the SSL setting for the outgoing server “%@”."), CFSTR("Delayed")), objc_msgSend(a3, "hostname"));
    v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v7, CFSTR("UserFriendlyErrorDescription"));
    v9 = +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v10 = MFLookupLocalizedString((uint64_t)CFSTR("FAILED_SEND_TITLE"), (uint64_t)CFSTR("Cannot Send Mail"), CFSTR("Delayed"));
    v11 = 1034;
LABEL_15:
    objc_msgSend(v9, "setError:", +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), v11, v7, v10, v8));
    goto LABEL_16;
  }
  if (-[MFSMTPConnection _sendCommand:length:argument:trailer:](self, "_sendCommand:length:argument:trailer:", "STARTTLS", 8, 0, 0) != 2|| -[MFSMTPConnection _getReply](self, "_getReply") != 2)
  {
    v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", MFLookupLocalizedString((uint64_t)CFSTR("FAILED_SEND_SSL_NEEDED"), (uint64_t)CFSTR("Check the SSL setting for the outgoing server “%@”."), CFSTR("Delayed")), objc_msgSend(a3, "hostname"));
    v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v7, CFSTR("UserFriendlyErrorDescription"));
    v9 = +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v10 = MFLookupLocalizedString((uint64_t)CFSTR("FAILED_SEND_TITLE"), (uint64_t)CFSTR("Cannot Send Mail"), CFSTR("Delayed"));
    v11 = 1033;
    goto LABEL_15;
  }
  v6 = objc_msgSend(a3, "clientCertificates");
  if (v6)
    -[_MFSocket setClientCertificates:](self->super._socket, "setClientCertificates:", v6);
  v5 = -[_MFSocket setSecurityProtocol:](self->super._socket, "setSecurityProtocol:", *MEMORY[0x1E0C9B320]);
  if (v5)
    LOBYTE(v5) = -[MFSMTPConnection _doHandshakeUsingAccount:](self, "_doHandshakeUsingAccount:", a3) == 2;
  return v5;
}

- (int)mailFrom:(id)a3
{
  const char *v5;
  void *v6;
  int v7;

  if (-[MFSMTPConnection supportsBinaryMime](self, "supportsBinaryMime"))
  {
    v5 = "> BODY=BINARYMIME";
  }
  else if (-[MFSMTPConnection supports8BitMime](self, "supports8BitMime"))
  {
    v5 = "> BODY=8BITMIME";
  }
  else
  {
    v5 = ">";
  }
  v6 = (void *)objc_msgSend(a3, "mf_copyIDNAEncodedEmailAddress");
  v7 = -[MFSMTPConnection _sendCommand:length:argument:trailer:](self, "_sendCommand:length:argument:trailer:", "MAIL FROM:<", 11, v6, v5);
  if (v7 == 2)
    v7 = -[MFSMTPConnection _getReply](self, "_getReply");

  return v7;
}

- (int)rcptTo:(id)a3
{
  void *v4;
  int v5;

  v4 = (void *)objc_msgSend(a3, "mf_copyIDNAEncodedEmailAddress");
  v5 = -[MFSMTPConnection _sendCommand:length:argument:trailer:](self, "_sendCommand:length:argument:trailer:", "RCPT TO:<", 9, v4, ">");
  if (v5 == 2)
    v5 = -[MFSMTPConnection _getReply](self, "_getReply");

  return v5;
}

- (int)noop
{
  int result;

  result = -[MFSMTPConnection _sendCommand:length:argument:trailer:](self, "_sendCommand:length:argument:trailer:", "NOOP", 4, 0, 0);
  if (result == 2)
    return -[MFSMTPConnection _getReply](self, "_getReply");
  return result;
}

- (int)sendBData:(id)a3
{
  uint64_t v5;
  int originalSocketTimeout;
  uint64_t v7;
  id v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  int v14;
  _QWORD v16[8];
  _QWORD v17[8];
  _QWORD v18[4];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int v26;

  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 5;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v5 = objc_msgSend(a3, "length");
  v22 = objc_msgSend(a3, "numberOfNewlinesNeedingConversion:", 0) + v5;
  originalSocketTimeout = self->_originalSocketTimeout;
  if (originalSocketTimeout >= 1)
  {
    if (originalSocketTimeout <= 180)
      v7 = 180;
    else
      v7 = originalSocketTimeout;
    -[_MFSocket setTimeout:](self->super._socket, "setTimeout:", v7);
  }
  v8 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v9 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("BDAT %lu LAST\r\n"), v20[3]);
  if (-[MFConnection writeData:dontLogBytesInRange:](self, "writeData:dontLogBytesInRange:", objc_msgSend(v9, "dataUsingEncoding:", 4), 0x7FFFFFFFFFFFFFFFLL, 0))
  {
    v10 = v20[3] / 0x50uLL;
    if (v10 <= 0x2000)
      v10 = 0x2000;
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x2020000000;
    v11 = MEMORY[0x1E0C809B0];
    v18[3] = 0;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __30__MFSMTPConnection_sendBData___block_invoke;
    v17[3] = &unk_1E81CBB78;
    v17[4] = self;
    v17[5] = v18;
    v17[6] = &v19;
    v17[7] = v10;
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D46100]), "initWithCapacity:", 0x10000);
    *((_DWORD *)v24 + 6) = 2;
    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = __30__MFSMTPConnection_sendBData___block_invoke_2;
    v16[3] = &unk_1E81CBBA0;
    v16[4] = v12;
    v16[5] = self;
    v16[6] = v17;
    v16[7] = &v23;
    objc_msgSend(a3, "enumerateConvertingNewlinesUsingBlock:", v16);
    if (*((_DWORD *)v24 + 6) == 2)
    {
      v13 = -[MFSMTPConnection _sendData:progressHandler:](self, "_sendData:progressHandler:", v12, v17);
      *((_DWORD *)v24 + 6) = v13;
    }

    _Block_object_dispose(v18, 8);
  }

  v14 = *((_DWORD *)v24 + 6);
  if (v14 == 2)
  {
    -[MFSMTPConnection _getReply](self, "_getReply");
    v14 = -[MFSMTPConnection state](self, "state");
    *((_DWORD *)v24 + 6) = v14;
  }
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  return v14;
}

uint64_t __30__MFSMTPConnection_sendBData___block_invoke(_QWORD *a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) += a2;
  objc_msgSend(*(id *)(a1[4] + 168), "setPercentDone:", (double)*(unint64_t *)(*(_QWORD *)(a1[5] + 8) + 24)/ (double)*(unint64_t *)(*(_QWORD *)(a1[6] + 8) + 24)* 0.800000012+ 0.200000003);
  return a1[7];
}

BOOL __30__MFSMTPConnection_sendBData___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "appendBytes:length:", a2, a3);
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "length") >= 0x10000)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "_sendData:progressHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "setLength:", 0);
  }
  return *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == 2;
}

- (int)sendData:(id)a3
{
  int originalSocketTimeout;
  _MFSocket *socket;
  uint64_t v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  _QWORD v17[9];
  _QWORD v18[9];
  _QWORD v19[4];
  _QWORD v20[4];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  originalSocketTimeout = self->_originalSocketTimeout;
  if (originalSocketTimeout >= 1)
  {
    socket = self->super._socket;
    if (originalSocketTimeout <= 120)
      v7 = 120;
    else
      v7 = originalSocketTimeout;
    -[_MFSocket setTimeout:](socket, "setTimeout:", v7);
  }
  v8 = +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v9 = objc_msgSend(a3, "length");
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = 0;
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __29__MFSMTPConnection_sendData___block_invoke;
  v18[3] = &unk_1E81CBBC8;
  v18[6] = v19;
  v18[7] = v20;
  v18[4] = a3;
  v18[5] = self;
  v18[8] = (v9 / 0x14) & 0xFFFFFFFFFFFE000;
  -[NSMutableData setLength:](self->_mdata, "setLength:", 0);
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __29__MFSMTPConnection_sendData___block_invoke_2;
  v17[3] = &unk_1E81CBBF0;
  v17[4] = self;
  v17[5] = v8;
  v17[7] = &v21;
  v17[8] = v20;
  v17[6] = v18;
  objc_msgSend(a3, "enumerateConvertingNewlinesUsingBlock:", v17);
  if (!*((_BYTE *)v22 + 24))
  {
    v11 = self->_originalSocketTimeout;
    if (v11 >= 1)
    {
      if (v11 <= 600)
        v12 = 600;
      else
        v12 = v11;
      -[_MFSocket setTimeout:](self->super._socket, "setTimeout:", v12);
    }
    -[MFSMTPConnection _getReply](self, "_getReply");
    v13 = self->_originalSocketTimeout;
    if (v13 >= 1)
    {
      if (v13 <= 300)
        v14 = 300;
      else
        v14 = v13;
      -[_MFSocket setTimeout:](self->super._socket, "setTimeout:", v14);
    }
  }
  v15 = -[MFSMTPConnection state](self, "state");
  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(&v21, 8);
  return v15;
}

uint64_t __29__MFSMTPConnection_sendData___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                          + 24);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 168), "setPercentDone:", (float)((float)((float)*(unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) * 0.8)/ (float)(unint64_t)objc_msgSend(*(id *)(a1 + 32), "length"))+ 0.200000003);
  return *(_QWORD *)(a1 + 64);
}

BOOL __29__MFSMTPConnection_sendData___block_invoke_2(uint64_t a1, _BYTE *a2, uint64_t a3, int a4, int a5)
{
  BOOL v10;

  if (*a2 == 46)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "appendBytes:length:", a2, 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "appendBytes:length:", a2, a3);
  if (a5 && (a4 & 1) == 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "appendBytes:length:", "\r\n", 2);
  if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "length") >> 13)
    v10 = 0;
  else
    v10 = a5 == 0;
  if (!v10)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "shouldCancel"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setStatus:", 550);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      objc_msgSend(*(id *)(a1 + 32), "disconnect");
    }
    else
    {
      if (a5)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "appendBytes:length:", ".", 1);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "appendBytes:length:", "\r\n", 2);
      }
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) += a3;
      if (a4)
        --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_sendData:progressHandler:", *(_QWORD *)(*(_QWORD *)(a1 + 32)+ 128), *(_QWORD *)(a1 + 48)) != 2;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setLength:", 0);
  }
  return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == 0;
}

- (int)quit
{
  int v3;

  v3 = -[MFSMTPConnection _sendCommand:length:argument:trailer:](self, "_sendCommand:length:argument:trailer:", "QUIT", 4, 0, 0);
  if (v3 == 2)
    -[MFConnection disconnect](self, "disconnect");
  return v3;
}

- (id)dataForMailFrom:(id)a3
{
  const char *v5;
  void *v6;
  id v7;

  if (-[MFSMTPConnection supportsBinaryMime](self, "supportsBinaryMime"))
  {
    v5 = "> BODY=BINARYMIME";
  }
  else if (-[MFSMTPConnection supports8BitMime](self, "supports8BitMime"))
  {
    v5 = "> BODY=8BITMIME";
  }
  else
  {
    v5 = ">";
  }
  v6 = (void *)objc_msgSend(a3, "mf_copyIDNAEncodedEmailAddress");
  v7 = -[MFSMTPConnection _dataForCommand:length:argument:trailer:](self, "_dataForCommand:length:argument:trailer:", "MAIL FROM:<", 11, v6, v5);

  return v7;
}

- (id)dataForRcptTo:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_msgSend(a3, "mf_copyIDNAEncodedEmailAddress");
  v5 = -[MFSMTPConnection _dataForCommand:length:argument:trailer:](self, "_dataForCommand:length:argument:trailer:", "RCPT TO:<", 9, v4, ">");

  return v5;
}

- (id)dataForDataCmd
{
  return -[MFSMTPConnection _dataForCommand:length:argument:trailer:](self, "_dataForCommand:length:argument:trailer:", "DATA", 4, 0, 0);
}

- (int64_t)mailFrom:(id)a3 recipients:(id)a4 withData:(id)a5 host:(id)a6 errorTitle:(id *)a7 errorMessage:(id *)a8 serverResponse:(id *)a9 displayError:(BOOL *)a10 errorCode:(int *)a11 errorUserInfo:(id *)a12
{
  id *v17;
  id v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  int v31;
  int v32;
  uint64_t v33;
  double v34;
  double v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  MFSMTPResponse *lastResponse;
  uint64_t v44;
  MFSMTPResponse *v45;
  id *v46;
  id v47;
  int64_t v48;
  NSObject *v49;
  id v50;
  MFSMTPResponse *v51;
  uint64_t v52;
  const __CFString *v53;
  const __CFString *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  int *v58;
  char v59;
  int v60;
  int v61;
  int v62;
  char v63;
  id *v64;
  id v65;
  _BOOL4 v66;
  char v67;
  unsigned int v68;
  int v69;
  void *v70;
  id v71;
  id v72;
  BOOL v73;
  id v75;
  id v76;
  id v77;
  id v78;
  id *v79;
  id *v80;
  uint64_t v81;
  id v82;
  id v83;
  _BOOL4 v84;
  BOOL v85;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  uint64_t v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  uint8_t buf[4];
  _BYTE v97[18];
  _BYTE v98[128];
  const __CFString *v99;
  const __CFString *v100;
  uint64_t v101;
  uint64_t v102;
  _BYTE v103[128];
  uint64_t v104;

  v17 = a9;
  v104 = *MEMORY[0x1E0C80C00];
  v18 = +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor", a3, a4, a5, a6);
  if (a10)
    *a10 = 0;
  v19 = -[MFSMTPConnection supportsChunking](self, "supportsChunking");
  if (!-[MFSMTPConnection supportsPipelining](self, "supportsPipelining"))
  {
    if (-[MFSMTPConnection mailFrom:](self, "mailFrom:", a3) != 2)
    {
      *a11 = 1047;
      lastResponse = self->_lastResponse;
      v44 = MFLookupLocalizedString((uint64_t)CFSTR("SMTP_INVALID_SENDER_ADDRESS"), (uint64_t)CFSTR("The sender address “%@” was rejected by the server."), CFSTR("Delayed"));
      v45 = lastResponse;
      v46 = a9;
      *a8 = -[MFSMTPResponse errorMessageWithAddress:defaultMessage:](v45, "errorMessageWithAddress:defaultMessage:", a3, v44);
      v47 = -[MFSMTPConnection lastResponseLine](self, "lastResponseLine");
      v48 = 1;
      goto LABEL_117;
    }
    v85 = v19;
    v75 = v18;
    v78 = a5;
    v83 = a3;
    v79 = a7;
    objc_msgSend(self->_delegate, "setPercentDone:", 0.15);
    v27 = objc_msgSend(a4, "count");
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v28 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v87, v98, 16);
    if (!v28)
    {
      v30 = 0;
      v31 = 0;
      v32 = 0;
      goto LABEL_40;
    }
    v29 = v28;
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v33 = *(_QWORD *)v88;
    v34 = (float)(0.05 / (float)v27);
    v35 = 0.150000006;
LABEL_21:
    v36 = 0;
    while (1)
    {
      if (*(_QWORD *)v88 != v33)
        objc_enumerationMutation(a4);
      v91 = 0;
      v91 = *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * v36);
      if (-[MFSMTPConnection rcptTo:](self, "rcptTo:") != 2)
        break;
      ++v31;
      v35 = v35 + v34;
      objc_msgSend(self->_delegate, "setPercentDone:", v35);
LABEL_31:
      if (v29 == ++v36)
      {
        v40 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v87, v98, 16);
        v29 = v40;
        if (!v40)
        {
LABEL_40:
          v49 = MFLogGeneral();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v97 = v31;
            *(_WORD *)&v97[4] = 2112;
            *(_QWORD *)&v97[6] = v30;
            _os_log_impl(&dword_1C8839000, v49, OS_LOG_TYPE_INFO, "SMTP delivery:%d valid recipients; invalid recipients = %@",
              buf,
              0x12u);
          }
          v50 = v83;
          if (v32)
          {
            if (objc_msgSend(v30, "count"))
            {
              a7 = v79;
              if (a10)
                *a10 = 1;
              *a11 = 1049;
              v51 = self->_lastResponse;
              v52 = objc_msgSend(v30, "lastObject");
              if ((unint64_t)objc_msgSend(v30, "count") < 2)
              {
                v53 = CFSTR("SMTP_1_BAD_RECIPIENT");
                v54 = CFSTR("The recipient “%@” was rejected by the server.");
              }
              else
              {
                v53 = CFSTR("SMTP_BAD_RECIPIENTS");
                v54 = CFSTR("The recipients were rejected by the server.");
              }
              v71 = -[MFSMTPResponse errorMessageWithAddress:defaultMessage:](v51, "errorMessageWithAddress:defaultMessage:", v52, MFLookupLocalizedString((uint64_t)v53, (uint64_t)v54, CFSTR("Delayed")));
              *a8 = v71;
              v48 = 1;
            }
            else
            {
              *a11 = 1049;
              v71 = -[MFSMTPResponse errorMessageWithAddress:defaultMessage:](self->_lastResponse, "errorMessageWithAddress:defaultMessage:", 0, MFLookupLocalizedString((uint64_t)CFSTR("SMTP_RECIPIENTS_UNRECOGNIZED"), (uint64_t)CFSTR("Verify that you have addressed this message correctly. Check your SMTP server settings in Mail Preferences and verify any advanced settings with your system administrator."), CFSTR("Delayed")));
              *a8 = v71;
              v48 = 1;
              a7 = v79;
            }
            goto LABEL_119;
          }
          if (self->_useSaveSent && -[MFSMTPConnection _supportsSaveSentExtension](self, "_supportsSaveSentExtension"))
          {
            if (self->_saveSentMbox)
              v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" imapmailbox=\"%@\"), self->_saveSentMbox);
            else
              v55 = 0;
            v73 = -[MFSMTPConnection _sendCommand:length:argument:trailer:](self, "_sendCommand:length:argument:trailer:", "SSNT", 4, v55, 0) != 2|| -[MFSMTPConnection _getReply](self, "_getReply") != 2;
            self->_dislikesSaveSentMbox = v73;

          }
          if (v85)
          {
            v69 = -[MFSMTPConnection sendBData:](self, "sendBData:", v78);
            a7 = v79;
            goto LABEL_113;
          }
          a7 = v79;
          if (-[MFSMTPConnection _sendCommand:length:argument:trailer:](self, "_sendCommand:length:argument:trailer:", "DATA", 4, 0, 0) == 2&& -[MFSMTPConnection _getReply](self, "_getReply") == 3)
          {
            v69 = -[MFSMTPConnection sendData:](self, "sendData:", v78);
LABEL_113:
            if (v69 == 2)
            {
              v48 = 0;
              goto LABEL_118;
            }
            v70 = v75;
LABEL_91:
            if ((objc_msgSend(v70, "shouldCancel") & 1) != 0)
            {
              v48 = 4;
              goto LABEL_118;
            }
            if (v69 == 4)
            {
              v72 = -[MFSMTPResponse errorMessageWithAddress:defaultMessage:](self->_lastResponse, "errorMessageWithAddress:defaultMessage:", v50, MFLookupLocalizedString((uint64_t)CFSTR("SMTP_SENDING_CONTENT_LATER"), (uint64_t)CFSTR("Mail will try to send the message again later."), CFSTR("Delayed")));
              v48 = 2;
            }
            else
            {
              if (v69 == 5)
                v48 = 7;
              else
                v48 = 1;
              v72 = -[MFSMTPResponse errorMessageWithAddress:defaultMessage:](self->_lastResponse, "errorMessageWithAddress:defaultMessage:", v50, MFLookupLocalizedString((uint64_t)CFSTR("SMTP_SENDING_CONTENT_FAILED"), (uint64_t)CFSTR("Sending the message content to the server failed."), CFSTR("Delayed")));
            }
            *a8 = v72;
            v47 = -[MFSMTPConnection lastResponseLine](self, "lastResponseLine");
          }
          else
          {
            -[MFSMTPResponse setStatus:](self->_lastResponse, "setStatus:", 550);
            *a8 = -[MFSMTPResponse errorMessageWithAddress:defaultMessage:](self->_lastResponse, "errorMessageWithAddress:defaultMessage:", 0, MFLookupLocalizedString((uint64_t)CFSTR("SMTP_SENDING_CONTENT_FAILED"), (uint64_t)CFSTR("Sending the message content to the server failed."), CFSTR("Delayed")));
            v47 = -[MFSMTPConnection lastResponseLine](self, "lastResponseLine");
            v48 = 1;
          }
          v46 = a9;
LABEL_117:
          *v46 = v47;
          goto LABEL_118;
        }
        goto LABEL_21;
      }
    }
    if (v30)
    {
      objc_msgSend(v30, "addObject:", v91);
      if (v32)
        goto LABEL_29;
    }
    else
    {
      v30 = (id)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DE8]), "initWithObjects:count:", &v91, 1);
      if (v32)
      {
LABEL_29:
        v37 = MFLogGeneral();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          v38 = v91;
          v39 = -[MFSMTPConnection lastResponseLine](self, "lastResponseLine");
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v97 = v38;
          v17 = a9;
          *(_WORD *)&v97[8] = 2112;
          *(_QWORD *)&v97[10] = v39;
          _os_log_error_impl(&dword_1C8839000, v37, OS_LOG_TYPE_ERROR, "SMTP error for recipient %@: %@", buf, 0x16u);
        }
        goto LABEL_31;
      }
    }
    v32 = -[MFSMTPResponse status](self->_lastResponse, "status");
    *v17 = -[MFSMTPConnection lastResponseLine](self, "lastResponseLine");
    goto LABEL_29;
  }
  v77 = a5;
  -[NSMutableData setLength:](self->_mdata, "setLength:", 0);
  v82 = a3;
  -[NSMutableData appendData:](self->_mdata, "appendData:", -[MFSMTPConnection dataForMailFrom:](self, "dataForMailFrom:", a3));
  v84 = v19;
  v94 = 0u;
  v95 = 0u;
  if (v19)
    v20 = 1;
  else
    v20 = 2;
  v92 = 0uLL;
  v93 = 0uLL;
  v21 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v92, v103, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v93;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v93 != v23)
          objc_enumerationMutation(a4);
        -[NSMutableData appendData:](self->_mdata, "appendData:", -[MFSMTPConnection dataForRcptTo:](self, "dataForRcptTo:", *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * i)));
      }
      v22 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v92, v103, 16);
    }
    while (v22);
  }
  v25 = objc_msgSend(a4, "count") + v20;
  if (self->_useSaveSent && -[MFSMTPConnection _supportsSaveSentExtension](self, "_supportsSaveSentExtension"))
  {
    if (self->_saveSentMbox)
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" imapmailbox=\"%@\"), self->_saveSentMbox);
    else
      v26 = 0;
    -[NSMutableData appendData:](self->_mdata, "appendData:", -[MFSMTPConnection _dataForCommand:length:argument:trailer:](self, "_dataForCommand:length:argument:trailer:", "SSNT", 4, v26, 0));

    v42 = v25 + 1;
    v41 = 1;
  }
  else
  {
    v41 = 0;
    v42 = v25;
  }
  if (!v84)
    -[NSMutableData appendData:](self->_mdata, "appendData:", -[MFSMTPConnection dataForDataCmd](self, "dataForDataCmd"));
  v76 = v18;
  -[MFSMTPConnection _sendData:](self, "_sendData:", self->_mdata);
  if (!v42)
  {
    v48 = 0;
    v59 = 1;
    v66 = v84;
    v67 = v84;
    goto LABEL_84;
  }
  v80 = a7;
  v56 = 0;
  v48 = 0;
  v57 = v25 - 1;
  v58 = &OBJC_IVAR___MFStream__rStream;
  v81 = *MEMORY[0x1E0D1EDF0];
  v59 = 1;
  do
  {
    v60 = -[MFSMTPConnection _getReply](self, "_getReply");
    v61 = v60;
    if (v57 == v56)
      v62 = v41;
    else
      v62 = 0;
    if (v62 == 1)
    {
      *((_BYTE *)&self->super.super.isa + v58[541]) = v60 != 2;
      goto LABEL_78;
    }
    if ((v59 & ((v60 & 0xFFFFFFFE) != 2)) == 1)
    {
      if (v56)
      {
        v63 = v84;
        if (v42 - 1 != v56)
          v63 = 1;
        v64 = a12;
        if ((v63 & 1) == 0)
        {
          v65 = -[MFSMTPResponse errorMessageWithAddress:defaultMessage:](self->_lastResponse, "errorMessageWithAddress:defaultMessage:", 0, MFLookupLocalizedString((uint64_t)CFSTR("SMTP_SENDING_CONTENT_FAILED"), (uint64_t)CFSTR("Sending the message content to the server failed."), CFSTR("Delayed")));
          goto LABEL_74;
        }
        if (a10)
          *a10 = 1;
        *a11 = 1049;
        v65 = -[MFSMTPResponse errorMessageWithAddress:defaultMessage:](self->_lastResponse, "errorMessageWithAddress:defaultMessage:", objc_msgSend(a4, "objectAtIndex:", v56 - 1), MFLookupLocalizedString((uint64_t)CFSTR("SMTP_1_BAD_RECIPIENT"), (uint64_t)CFSTR("The recipient “%@” was rejected by the server."), CFSTR("Delayed")));
      }
      else
      {
        *a11 = 1047;
        v65 = -[MFSMTPResponse errorMessageWithAddress:defaultMessage:](self->_lastResponse, "errorMessageWithAddress:defaultMessage:", v82, MFLookupLocalizedString((uint64_t)CFSTR("SMTP_INVALID_SENDER_ADDRESS"), (uint64_t)CFSTR("The sender address “%@” was rejected by the server."), CFSTR("Delayed")));
      }
      v64 = a12;
LABEL_74:
      *a8 = v65;
      *a9 = -[MFSMTPConnection lastResponseLine](self, "lastResponseLine");
      if (v64)
      {
        v101 = v81;
        v99 = CFSTR("SMTPFailureReason");
        v100 = MFSMTPFailureReasonString(-[MFSMTPResponse failureReason](self->_lastResponse, "failureReason"));
        v102 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1);
        v59 = 0;
        *v64 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
      }
      else
      {
        v59 = 0;
      }
      v48 = 1;
      v58 = &OBJC_IVAR___MFStream__rStream;
    }
LABEL_78:
    ++v56;
  }
  while (v42 != v56);
  v66 = v84;
  v67 = v61 == 3 || v84;
  a7 = v80;
LABEL_84:
  v50 = v82;
  if ((v59 & 1) != 0 && (v67 & 1) != 0)
  {
    objc_msgSend(self->_delegate, "setPercentDone:", 0.2);
    v68 = v66
        ? -[MFSMTPConnection sendBData:](self, "sendBData:", v77)
        : -[MFSMTPConnection sendData:](self, "sendData:", v77);
    v69 = v68;
    if (v68 != 2)
    {
      v70 = v76;
      goto LABEL_91;
    }
  }
LABEL_118:
  v71 = *a8;
LABEL_119:
  if (v71 && !*a7)
    *a7 = (id)MFLookupLocalizedString((uint64_t)CFSTR("SMTP_SENDING_FAILED_TITLE"), (uint64_t)CFSTR("Unable to Send Email"), CFSTR("Delayed"));
  return v48;
}

- (int64_t)timeLastCommandWasSent
{
  return self->_lastCommandTimestamp;
}

- (int)_sendBytes:(const char *)a3 length:(unint64_t)a4 progressHandler:(id)a5
{
  unint64_t v6;
  unint64_t v9;
  unint64_t v10;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v6 = a4;
  v9 = a4;
  if (a5)
  {
    v10 = (*((uint64_t (**)(id, _QWORD))a5 + 2))(a5, 0);
    if (v10 >= v6 || v10 == 0)
      v9 = v6;
    else
      v9 = v10;
  }
  if (v6)
  {
    while (1)
    {
      v12 = self->_hideLoggedData ? 0 : 0x7FFFFFFFFFFFFFFFLL;
      v13 = self->_hideLoggedData ? v9 : 0;
      if (!-[MFConnection writeBytes:length:dontLogBytesInRange:](self, "writeBytes:length:dontLogBytesInRange:", a3, v9, v12, v13))break;
      v6 -= v9;
      if (a5)
      {
        v14 = (*((uint64_t (**)(id, unint64_t))a5 + 2))(a5, v9);
        if (v14 >= v6)
          v15 = v6;
        else
          v15 = v14;
        if (!v14)
          v15 = v6;
      }
      else if (v9 >= v6)
      {
        v15 = v6;
      }
      else
      {
        v15 = v9;
      }
      a3 += v9;
      v9 = v15;
      if (!v6)
        goto LABEL_27;
    }
    -[MFSMTPConnection _setLastResponse:](self, "_setLastResponse:", 0);
    return 4;
  }
  else
  {
LABEL_27:
    -[MFSMTPConnection _setLastResponse:](self, "_setLastResponse:", 0);
    return 2;
  }
}

- (int)_sendData:(id)a3
{
  return -[MFSMTPConnection _sendBytes:length:progressHandler:](self, "_sendBytes:length:progressHandler:", objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"), 0);
}

- (int)_sendData:(id)a3 progressHandler:(id)a4
{
  return -[MFSMTPConnection _sendBytes:length:progressHandler:](self, "_sendBytes:length:progressHandler:", objc_msgSend(a3, "bytes"), objc_msgSend(a3, "length"), a4);
}

- (id)_dataForCommand:(const char *)a3 length:(unint64_t)a4 argument:(id)a5 trailer:(const char *)a6
{
  void *v12;
  void *v13;
  const char *CStringPtr;
  CFIndex Length;
  uint64_t v16;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;

  v12 = (void *)objc_msgSend(MEMORY[0x1E0D46100], "data");
  v13 = v12;
  if (a3)
    objc_msgSend(v12, "appendBytes:length:", a3, a4);
  if (a5)
  {
    CStringPtr = CFStringGetCStringPtr((CFStringRef)a5, 0x600u);
    if (CStringPtr)
    {
      objc_msgSend(v13, "appendBytes:length:", CStringPtr, strlen(CStringPtr));
      if (!a6)
        goto LABEL_12;
      goto LABEL_11;
    }
    Length = CFStringGetLength((CFStringRef)a5);
    v19 = &v20;
    v20 = 0;
    if (Length != MFStringGetBytes())
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", &v20), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SMTPConnection.m"), 896, CFSTR("Invalid argument %@"), a5);
    v16 = objc_msgSend(v13, "length", v19);
    objc_msgSend(v13, "setLength:", v20 + v16);
    objc_msgSend(v13, "mutableBytes");
    v18 = 0;
    if (Length != MFStringGetBytes())
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", 0), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SMTPConnection.m"), 901, CFSTR("Invalid argument %@"), a5);
      if (!a6)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  if (a6)
LABEL_11:
    objc_msgSend(v13, "appendBytes:length:", a6, strlen(a6));
LABEL_12:
  objc_msgSend(v13, "appendBytes:length:", "\r\n", 2, v18);
  return v13;
}

- (int)_sendCommand:(const char *)a3 length:(unint64_t)a4 argument:(id)a5 trailer:(const char *)a6
{
  self->_lastCommandTimestamp = time(0);
  -[NSMutableData setLength:](self->_mdata, "setLength:", 0);
  -[NSMutableData appendData:](self->_mdata, "appendData:", -[MFSMTPConnection _dataForCommand:length:argument:trailer:](self, "_dataForCommand:length:argument:trailer:", a3, a4, a5, a6));
  return -[MFSMTPConnection _sendData:](self, "_sendData:", self->_mdata);
}

- (int)_getReply
{
  void *v3;
  uint64_t v4;
  int v5;
  MFSMTPResponse *v6;
  MFSMTPResponse *v7;
  uint64_t v8;
  void *v9;
  char v11;
  uint64_t v12;
  uint64_t v13;

  v3 = 0;
  v12 = 0;
  v13 = 0;
  v11 = 1;
  do
  {
    v4 = -[MFSMTPConnection _readResponseRange:isContinuation:](self, "_readResponseRange:isContinuation:", &v12, &v11);
    if (v4 > 0x257)
      v5 = 6;
    else
      v5 = *(_DWORD *)((char *)&unk_1C88A3890 + ((v4 / 0x19uLL) & 0xFFFFFFC));
    v6 = -[MFSMTPResponse initWithStatus:]([MFSMTPResponse alloc], "initWithStatus:", v4);
    v7 = v6;
    if (v5 == 2)
    {
      v8 = 0;
LABEL_10:
      -[MFSMTPResponse setLastResponseLine:](v6, "setLastResponseLine:", v8);
      goto LABEL_12;
    }
    if (v12 != 0x7FFFFFFFFFFFFFFFLL && v13)
    {
      v8 = -[NSMutableData subdataWithRange:](self->_mdata, "subdataWithRange:");
      v6 = v7;
      goto LABEL_10;
    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", MFLookupLocalizedString((uint64_t)CFSTR("SMTP_GENERIC_ERROR_FORMAT"), (uint64_t)CFSTR("An error occurred while delivering this message via the SMTP server “%@”"), CFSTR("Delayed")), -[_MFSocket remoteHostname](self->super._socket, "remoteHostname"));
    -[MFSMTPResponse setLastResponseLine:](v7, "setLastResponseLine:", v9);

LABEL_12:
    if (!v11)
      goto LABEL_18;
    if (v3)
      objc_msgSend(v3, "addObject:", v7);
    else
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v7, 0);

  }
  while (v11);
  v7 = 0;
LABEL_18:
  -[MFSMTPResponse setContinuationResponses:](v7, "setContinuationResponses:", v3);
  -[MFSMTPConnection _setLastResponse:](self, "_setLastResponse:", v7);

  return v5;
}

- (int)_readResponseRange:(_NSRange *)a3 isContinuation:(BOOL *)a4
{
  uint64_t v8;
  NSUInteger v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSUInteger v20;
  BOOL v21;
  BOOL v23;
  int v24;
  NSUInteger v26;
  NSUInteger v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD block[6];

  *a3 = (_NSRange)xmmword_1C88A3830;
  -[NSMutableData setLength:](self->_mdata, "setLength:", 0);
  if (!-[MFConnection readLineIntoData:](self, "readLineIntoData:", self->_mdata))
  {
    v23 = 0;
    v24 = 0;
    if (!a4)
      return v24;
LABEL_16:
    *a4 = v23;
    return v24;
  }
  v8 = -[NSMutableData bytes](self->_mdata, "bytes");
  v9 = -[NSMutableData length](self->_mdata, "length");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__MFSMTPConnection__readResponseRange_isContinuation___block_invoke;
  block[3] = &unk_1E81CACB0;
  block[4] = self;
  block[5] = a2;
  if (_readResponseRange_isContinuation__once != -1)
    dispatch_once(&_readResponseRange_isContinuation__once, block);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v8, v9, 1, 0);
  v11 = (void *)objc_msgSend((id)_readResponseRange_isContinuation___responseRegex, "firstMatchInString:options:range:", v10, 0, 0, v9);
  if (v11)
  {
    v12 = v11;
    if (objc_msgSend(v11, "numberOfRanges") != 4)
      -[MFSMTPConnection _readResponseRange:isContinuation:].cold.1();
    v30 = v8;
    objc_msgSend(v12, "range");
    v14 = v13;
    v28 = objc_msgSend(v12, "rangeAtIndex:", 1);
    v16 = v15;
    v17 = objc_msgSend(v12, "rangeAtIndex:", 2);
    v29 = v18;
    v19 = objc_msgSend(v12, "rangeAtIndex:", 3);
    if (v14)
      v21 = v16 == 0;
    else
      v21 = 1;
    if (v21 || v19 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v27 = -[NSMutableData length](self->_mdata, "length");
      v26 = 0;
      v23 = 0;
      v24 = 550;
    }
    else
    {
      v26 = v19;
      v27 = v20;
      v24 = strtoul((const char *)(v30 + v28), 0, 10);
      if (v29)
        v23 = *(_BYTE *)(v30 + v17) == 45;
      else
        v23 = 0;
    }
    a3->location = v26;
    a3->length = v27;
  }
  else
  {
    v23 = 0;
    v24 = 0;
  }

  if (a4)
    goto LABEL_16;
  return v24;
}

uint64_t __54__MFSMTPConnection__readResponseRange_isContinuation___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("^([0-9]+)([- ])?(.*)$"), 16, 0);
  _readResponseRange_isContinuation___responseRegex = result;
  if (!result)
    return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("SMTPConnection.m"), 990, CFSTR("Unable to init regular expression from %@"), CFSTR("^([0-9]+)([- ])?(.*)$"));
  return result;
}

- (BOOL)_connectUsingAccount:(id)a3
{
  unsigned __int8 v5;
  _MFSocket *socket;
  int v7;
  uint64_t v8;
  void *v10;
  uint64_t v11;
  objc_super v12;

  -[MFSMTPConnection _setLastResponse:](self, "_setLastResponse:", 0);
  v12.receiver = self;
  v12.super_class = (Class)MFSMTPConnection;
  v5 = -[MFConnection connectUsingAccount:](&v12, sel_connectUsingAccount_, a3);
  socket = self->super._socket;
  if ((v5 & 1) != 0)
  {
    v7 = -[_MFSocket timeout](socket, "timeout");
    self->_originalSocketTimeout = v7;
    if (v7 >= 1)
    {
      if (v7 <= 300)
        v8 = 300;
      else
        v8 = v7;
      -[_MFSocket setTimeout:](self->super._socket, "setTimeout:", v8);
    }
    if (-[MFSMTPConnection _getReply](self, "_getReply") == 2)
      return 1;
  }
  else
  {

    self->super._socket = 0;
  }
  v10 = (void *)objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "error");
  if (!v10 || objc_msgSend(v10, "code") == 1029)
  {
    v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", MFLookupLocalizedString((uint64_t)CFSTR("FAILED_SEND"), (uint64_t)CFSTR("Check the account settings for the outgoing server “%@”."), CFSTR("Delayed")), objc_msgSend(a3, "hostname"));
    objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "setError:", +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), 1031, v11, MFLookupLocalizedString((uint64_t)CFSTR("FAILED_SEND_TITLE"), (uint64_t)CFSTR("Cannot Send Mail"), CFSTR("Delayed")), 0));
  }
  return 0;
}

- (int)_doHandshakeUsingAccount:(id)a3
{
  NSData *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int v9;
  const void *v10;
  int v11;
  const __CFString *v12;
  const __CFString *v13;
  int v14;
  char v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  __CFString *ParameterStringFromBytes;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  NSMutableArray *serviceExtensions;
  NSMutableArray *v26;
  char v27;
  NSObject *v28;
  id v30;
  id v32;
  char v33;
  _BYTE buf[24];
  _BYTE cStr[17];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[31];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = -[_MFSocket sourceIPAddress](self->super._socket, "sourceIPAddress");
  if (!v5)
    goto LABEL_8;
  v6 = -[NSData bytes](v5, "bytes");
  v7 = v6;
  v8 = &cStr[1];
  memset(v41, 0, sizeof(v41));
  v40 = 0u;
  v39 = 0u;
  v38 = 0u;
  v37 = 0u;
  v36 = 0u;
  *(_OWORD *)&cStr[1] = 0u;
  cStr[0] = 91;
  v9 = *(unsigned __int8 *)(v6 + 1);
  if (v9 == 2)
  {
    v10 = (const void *)(v6 + 4);
    v11 = 2;
  }
  else
  {
    if (v9 != 30)
    {
LABEL_8:
      v12 = 0;
      goto LABEL_9;
    }
    __strlcat_chk();
    v8 = &cStr[strlen(&cStr[1]) + 1];
    v10 = (const void *)(v7 + 8);
    v11 = *(unsigned __int8 *)(v7 + 1);
  }
  if (!inet_ntop(v11, v10, v8, cStr - v8 + 126))
    goto LABEL_8;
  __strlcat_chk();
  v12 = (id)CFStringCreateWithCString(0, cStr, 0x600u);
  -[MFSMTPConnection setDomainName:](self, "setDomainName:", v12);
LABEL_9:
  v33 = 1;
  if (v12)
    v13 = v12;
  else
    v13 = CFSTR("localhost");
  v14 = -[MFSMTPConnection _sendCommand:length:argument:trailer:](self, "_sendCommand:length:argument:trailer:", "EHLO ", 5, v13, 0);
  if (v14 != 2)
  {
    if (!objc_msgSend(a3, "usesSSL"))
      goto LABEL_50;
    v27 = 1;
LABEL_46:
    if (!objc_msgSend((id)*MEMORY[0x1E0CB31B0], "isEqualToString:", objc_msgSend((id)objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "error"), "domain"))&& (v27 & 1) != 0)
    {
      goto LABEL_50;
    }
    return v14;
  }
  v32 = a3;
  v15 = 1;
  v16 = 1;
  while (1)
  {
    *(_QWORD *)cStr = 0;
    *(_QWORD *)&cStr[8] = 0;
    if (-[MFSMTPConnection _readResponseRange:isContinuation:](self, "_readResponseRange:isContinuation:", cStr, &v33, v32) == 250)
    {
      if (!(v15 & 1 | (*(_QWORD *)&cStr[8] == 0)))
      {
        v17 = -[NSMutableData bytes](self->_mdata, "bytes");
        v18 = v17 + *(_QWORD *)cStr;
        *(_QWORD *)buf = v17 + *(_QWORD *)cStr;
        v19 = v17 + *(_QWORD *)cStr + *(_QWORD *)&cStr[8];
        if (*(_QWORD *)&cStr[8] >= 6uLL && !strncasecmp((const char *)(v17 + *(_QWORD *)cStr), "AUTH=", 5uLL))
          v20 = v18 + 5;
        else
          v20 = v19;
        ParameterStringFromBytes = _createParameterStringFromBytes((const UInt8 **)buf, v20);
        if (ParameterStringFromBytes)
        {
          v22 = _createParameterStringFromBytes((const UInt8 **)buf, v19);
          if (v22)
          {
            v23 = v22;
            v24 = 0;
            do
            {
              if (!v24)
                v24 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 5);
              objc_msgSend(v24, "addObject:", v23);

              v23 = _createParameterStringFromBytes((const UInt8 **)buf, v19);
            }
            while (v23);
          }
          else
          {
            v24 = 0;
          }
          serviceExtensions = self->_serviceExtensions;
          if (!serviceExtensions)
          {
            serviceExtensions = (NSMutableArray *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DE8]), "init");
            self->_serviceExtensions = serviceExtensions;
          }
          -[NSMutableArray addObject:](serviceExtensions, "addObject:", ParameterStringFromBytes);
          v26 = self->_serviceExtensions;
          if (v24)
          {
            -[NSMutableArray addObject:](v26, "addObject:", v24);

          }
          else
          {
            -[NSMutableArray addObject:](v26, "addObject:", objc_msgSend(MEMORY[0x1E0C99D20], "array"));
          }

        }
      }
      v16 = 0;
      v15 = 0;
      goto LABEL_36;
    }
    if (-[MFSMTPResponse status](self->_lastResponse, "status") != 500)
      break;
LABEL_36:
    if (!v33)
      goto LABEL_44;
  }
  v28 = MFLogGeneral();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    v30 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", -[NSMutableData bytes](self->_mdata, "bytes"), -[NSMutableData length](self->_mdata, "length"), 4);
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v30;
    _os_log_impl(&dword_1C8839000, v28, OS_LOG_TYPE_INFO, "--- Got unexpected EHLO response ESMTP params %@", buf, 0xCu);
  }
  v33 = 0;
LABEL_44:
  a3 = v32;
  if ((objc_msgSend(v32, "usesSSL", v32) & 1) != 0)
  {
    v27 = v16 & 1;
    goto LABEL_46;
  }
  if ((v16 & 1) != 0)
  {
LABEL_50:
    if (!-[_MFSocket isWritable](self->super._socket, "isWritable"))
      goto LABEL_56;
    if (-[MFSMTPConnection _sendCommand:length:argument:trailer:](self, "_sendCommand:length:argument:trailer:", "RSET", 4, 0, 0) == 2)-[MFSMTPConnection _getReply](self, "_getReply");
    if (!-[_MFSocket isWritable](self->super._socket, "isWritable")
      || -[MFSMTPConnection _sendCommand:length:argument:trailer:](self, "_sendCommand:length:argument:trailer:", "HELO ", 5, v13, 0) != 2|| (v14 = -[MFSMTPConnection _getReply](self, "_getReply"), v14 != 2))
    {
LABEL_56:
      -[_MFSocket abort](self->super._socket, "abort");

      self->super._socket = 0;
      if (-[MFSMTPConnection _connectUsingAccount:](self, "_connectUsingAccount:", a3))
      {
        v14 = -[MFSMTPConnection _sendCommand:length:argument:trailer:](self, "_sendCommand:length:argument:trailer:", "HELO ", 5, v13, 0);
        if (v14 == 2)
          return -[MFSMTPConnection _getReply](self, "_getReply");
      }
    }
  }
  return v14;
}

- (BOOL)_hasParameter:(id)a3 forKeyword:(id)a4
{
  unint64_t v7;
  uint64_t v8;
  _BOOL4 v9;
  uint64_t v10;
  unint64_t v11;
  BOOL v12;

  v7 = -[NSMutableArray count](self->_serviceExtensions, "count");
  v8 = objc_msgSend(a3, "uppercaseString");
  if (v7 >= 2)
  {
    v10 = v8;
    v11 = 1;
    do
    {
      v12 = objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_serviceExtensions, "objectAtIndex:", v11 - 1), "caseInsensitiveCompare:", a4) == 0;
      v9 = v12;
      v12 = !v12 || v10 == 0;
      if (!v12)
        v9 = objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_serviceExtensions, "objectAtIndex:", v11), "indexOfObject:", v10) != 0x7FFFFFFFFFFFFFFFLL;
      v11 += 2;
    }
    while (v11 < v7 && !v9);
  }
  else
  {
    LOBYTE(v9) = 0;
  }
  return v9;
}

- (BOOL)_supportsExtension:(id)a3
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = -[NSMutableArray count](self->_serviceExtensions, "count");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    do
    {
      v8 = objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_serviceExtensions, "objectAtIndex:", v7), "caseInsensitiveCompare:", a3);
      LOBYTE(v5) = v8 == 0;
      if (v7 + 3 > v6)
        break;
      v7 += 2;
    }
    while (v8);
  }
  return v5;
}

- (void)_setLastResponse:(id)a3
{
  MFSMTPResponse *lastResponse;

  lastResponse = self->_lastResponse;
  if (lastResponse != a3)
  {

    self->_lastResponse = (MFSMTPResponse *)a3;
  }
}

- (id)lastResponseLine
{
  id v2;
  __CFString *v3;

  v2 = -[MFSMTPResponse lastResponseLine](self->_lastResponse, "lastResponseLine");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = (__CFString *)v2;
    return v3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = (__CFString *)CFStringCreateWithBytes(0, (const UInt8 *)objc_msgSend(v2, "bytes"), objc_msgSend(v2, "length"), 0x600u, 0);
    return v3;
  }
  return (id)objc_msgSend(v2, "description");
}

- (BOOL)_supportsSaveSentExtension
{
  return -[MFSMTPConnection _supportsExtension:](self, "_supportsExtension:", CFSTR("SSNT"));
}

- (void)setUseSaveSent:(BOOL)a3 toFolder:(id)a4
{
  self->_useSaveSent = a3;
  if ((objc_msgSend(a4, "isEqualToString:", self->_saveSentMbox) & 1) == 0)
  {
    self->_dislikesSaveSentMbox = 0;

    self->_saveSentMbox = (NSString *)objc_msgSend(a4, "copy");
  }
}

- (void)_readResponseRange:isContinuation:.cold.1()
{
  __assert_rtn("-[MFSMTPConnection _readResponseRange:isContinuation:]", "SMTPConnection.m", 997, "[match numberOfRanges] == 4");
}

@end
