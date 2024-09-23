@implementation SMTPAccount

- (void)releaseAllConnections
{
  MFSMTPConnection *connection;
  objc_super v4;

  _MFLockGlobalLock();
  -[NSTimer invalidate](self->_timer, "invalidate");
  self->_timer = 0;
  connection = self->_connection;
  self->_connection = 0;
  _MFUnlockGlobalLock();
  -[MFSMTPConnection quit](connection, "quit");

  v4.receiver = self;
  v4.super_class = (Class)SMTPAccount;
  -[MFAccount releaseAllConnections](&v4, sel_releaseAllConnections);
}

+ (id)accountTypeString
{
  return CFSTR("SMTP");
}

+ (void)legacyKeychainProtocol
{
  return (void *)*MEMORY[0x1E0CD6B18];
}

- (id)certUIService
{
  return (id)*MEMORY[0x1E0D0D5A0];
}

+ (id)newDefaultInstance
{
  return 0;
}

+ (void)registerAppleServiceDeliveryHostname:(id)a3
{
  id v4;

  pthread_mutex_lock(&__asdHostnamesLock);
  v4 = (id)__asdHostnames;
  if (!__asdHostnames)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    __asdHostnames = (uint64_t)v4;
  }
  objc_msgSend(v4, "addObject:", a3);
  pthread_mutex_unlock(&__asdHostnamesLock);
}

- (Class)deliveryClass
{
  Class result;

  result = self->_deliveryClass;
  if (!result)
    return (Class)objc_opt_class();
  return result;
}

- (void)setDeliveryClass:(Class)a3
{
  self->_deliveryClass = a3;
}

+ (unsigned)defaultPortNumber
{
  return 587;
}

- (id)serviceName
{
  return CFSTR("smtp");
}

+ (id)saslProfileName
{
  return CFSTR("smtp");
}

+ (BOOL)isCommonPortNumber:(unsigned int)a3
{
  unsigned __int8 v4;
  BOOL v5;
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___SMTPAccount;
  v4 = objc_msgSendSuper2(&v7, sel_isCommonPortNumber_);
  if (a3 == 587)
    v5 = 1;
  else
    v5 = v4;
  return a3 == 465 || v5;
}

- (Class)connectionClass
{
  Class result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SMTPAccount;
  result = -[MFAccount connectionClass](&v3, sel_connectionClass);
  if (!result)
    return (Class)objc_opt_class();
  return result;
}

- (id)_defaultSettingsWithPort:(unsigned int)a3 useSSL:(BOOL)a4 directSSL:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  uint64_t v7;
  id v8;

  v5 = a5;
  v6 = a4;
  v7 = *(_QWORD *)&a3;
  v8 = -[MFAccount defaultConnectionSettings](self, "defaultConnectionSettings");
  objc_msgSend(v8, "setPortNumber:", v7);
  objc_msgSend(v8, "setUsesSSL:", v6);
  objc_msgSend(v8, "setTryDirectSSL:", v5);
  return v8;
}

- (id)connectionSettingsForAuthentication:(BOOL)a3 secure:(id)a4 insecure:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  id v15;
  id v16;
  char v17;

  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = -[MFAccount defaultConnectionSettings](self, "defaultConnectionSettings");
  v11 = objc_msgSend(v10, "portNumber");
  if ((objc_msgSend(v10, "usesSSL") & 1) != 0)
  {
    objc_msgSend(v7, "addObject:", -[SMTPAccount _defaultSettingsWithPort:useSSL:directSSL:](self, "_defaultSettingsWithPort:useSSL:directSSL:", v11, 0, 0));
    v12 = objc_msgSend(v10, "tryDirectSSL") ^ 1;
  }
  else
  {
    objc_msgSend(v8, "addObject:", -[SMTPAccount _defaultSettingsWithPort:useSSL:directSSL:](self, "_defaultSettingsWithPort:useSSL:directSSL:", v11, 1, 1));
    v12 = 0;
  }
  objc_msgSend(v8, "addObject:", -[SMTPAccount _defaultSettingsWithPort:useSSL:directSSL:](self, "_defaultSettingsWithPort:useSSL:directSSL:", v11, 1, v12));
  for (i = 0; i != 3; ++i)
  {
    v14 = dword_1C88A37E8[i];
    if ((_DWORD)v11 != (_DWORD)v14)
    {
      objc_msgSend(v8, "addObject:", -[SMTPAccount _defaultSettingsWithPort:useSSL:directSSL:](self, "_defaultSettingsWithPort:useSSL:directSSL:", dword_1C88A37E8[i], 1, 1));
      objc_msgSend(v8, "addObject:", -[SMTPAccount _defaultSettingsWithPort:useSSL:directSSL:](self, "_defaultSettingsWithPort:useSSL:directSSL:", v14, 1, 0));
      objc_msgSend(v7, "addObject:", -[SMTPAccount _defaultSettingsWithPort:useSSL:directSSL:](self, "_defaultSettingsWithPort:useSSL:directSSL:", v14, 0, 0));
    }
  }
  v15 = v8;
  v16 = v7;
  if (a3 || (v17 = objc_msgSend(v10, "usesSSL", v8), v15 = v7, v16 = v8, (v17 & 1) == 0))
    objc_msgSend(v9, "addObjectsFromArray:", v15);
  objc_msgSend(v9, "addObjectsFromArray:", v16);
  if (a4)
    objc_msgSend(a4, "addObjectsFromArray:", v8);
  if (a5)
    objc_msgSend(a5, "addObjectsFromArray:", v7);

  return v9;
}

- (id)secureConnectionSettings
{
  void *v3;
  id v4;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = -[MFAccount defaultConnectionSettings](self, "defaultConnectionSettings");
  if (objc_msgSend(v4, "usesSSL"))
    objc_msgSend(v3, "addObject:", v4);
  -[SMTPAccount connectionSettingsForAuthentication:secure:insecure:](self, "connectionSettingsForAuthentication:secure:insecure:", 1, v3, 0);
  return v3;
}

- (id)insecureConnectionSettings
{
  void *v3;
  id v4;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = -[MFAccount defaultConnectionSettings](self, "defaultConnectionSettings");
  if ((objc_msgSend(v4, "usesSSL") & 1) == 0)
    objc_msgSend(v3, "addObject:", v4);
  -[SMTPAccount connectionSettingsForAuthentication:secure:insecure:](self, "connectionSettingsForAuthentication:secure:insecure:", 1, 0, v3);
  return v3;
}

- (id)alternateConnectionSettings
{
  return -[SMTPAccount connectionSettingsForAuthentication:secure:insecure:](self, "connectionSettingsForAuthentication:secure:insecure:", 0, 0, 0);
}

- (BOOL)_shouldTryDirectSSLConnectionOnPort:(unsigned int)a3
{
  id v4;
  uint64_t v5;

  v4 = -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("SSLIsDirect"));
  if (v4)
    LOBYTE(v5) = objc_msgSend(v4, "BOOLValue");
  else
    return a3 == 465;
  return v5;
}

- (id)preferredAuthScheme
{
  id result;
  objc_super v4;

  if (!-[DeliveryAccount shouldUseAuthentication](self, "shouldUseAuthentication"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)SMTPAccount;
  result = -[MFAccount preferredAuthScheme](&v4, sel_preferredAuthScheme);
  if (!result)
    return +[MFAuthScheme schemeWithName:](MFAuthScheme, "schemeWithName:", &stru_1E81CBE50);
  return result;
}

- (void)setPreferredAuthScheme:(id)a3
{
  objc_super v5;

  -[DeliveryAccount setShouldUseAuthentication:](self, "setShouldUseAuthentication:", a3 != 0);
  v5.receiver = self;
  v5.super_class = (Class)SMTPAccount;
  -[MFAccount setPreferredAuthScheme:](&v5, sel_setPreferredAuthScheme_, a3);
}

- (id)customAuthenticationErrorStringForError:(id)a3 authScheme:(id)a4
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "mf_shortDescription");
  if (objc_msgSend(v4, "length"))
    return v4;
  else
    return (id)MFLookupLocalizedString((uint64_t)CFSTR("FAILED_SEND_TITLE"), (uint64_t)CFSTR("Cannot Send Mail"), CFSTR("Delayed"));
}

- (id)errorForResponse:(id)a3
{
  int v4;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "status");
  if ((v4 - 530) > 8 || ((1 << (v4 - 18)) & 0x111) == 0)
  {
    v6 = CFSTR("FAILED_SEND");
    v7 = CFSTR("Check the account settings for the outgoing server “%@”.");
  }
  else
  {
    v6 = CFSTR("FAILED_SEND_SSL_NEEDED");
    v7 = CFSTR("Check the SSL setting for the outgoing server “%@”.");
  }
  v9 = CFSTR("UserFriendlyErrorDescription");
  v10[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", MFLookupLocalizedString((uint64_t)v6, (uint64_t)v7, CFSTR("Delayed")), -[DeliveryAccount displayHostname](self, "displayHostname"));
  return +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), 1032, v10[0], MFLookupLocalizedString((uint64_t)CFSTR("FAILED_SEND_TITLE"), (uint64_t)CFSTR("Cannot Send Mail"), CFSTR("Delayed")), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1));
}

- (BOOL)supportsPipelining
{
  return *((_BYTE *)self + 72) & 1;
}

- (void)setSupportsPipelining:(BOOL)a3
{
  *((_BYTE *)self + 72) = *((_BYTE *)self + 72) & 0xFE | a3;
}

- (BOOL)supportsOutboxCopy
{
  return (*((unsigned __int8 *)self + 72) >> 1) & 1;
}

- (void)setSupportsOutboxCopy:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 72) = *((_BYTE *)self + 72) & 0xFD | v3;
}

- (__CFString)connectionServiceType
{
  __CFString *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SMTPAccount;
  result = -[MFAccount connectionServiceType](&v4, sel_connectionServiceType);
  if ((*((_BYTE *)self + 72) & 4) != 0)
    return (__CFString *)*MEMORY[0x1E0CA7368];
  return result;
}

- (id)authenticatedConnection:(BOOL)a3
{
  MFSMTPConnection *connection;
  char v6;
  time_t v7;
  uint64_t v8;

  _MFLockGlobalLock();
  if (a3)
  {
    connection = 0;
    v6 = 4;
  }
  else
  {
    v6 = 0;
    connection = self->_connection;
  }
  self->_connection = 0;
  *((_BYTE *)self + 72) = *((_BYTE *)self + 72) & 0xFB | v6;
  _MFUnlockGlobalLock();
  if (connection)
  {
    v7 = time(0);
    if (v7 <= -[MFSMTPConnection timeLastCommandWasSent](connection, "timeLastCommandWasSent") + 30
      || -[MFSMTPConnection noop](connection, "noop") == 2)
    {
      return connection;
    }

  }
  connection = -[MFAccount _newConnection](self, "_newConnection");
  if (connection)
  {
    if (-[MFAccount _connectAndAuthenticate:](self, "_connectAndAuthenticate:", connection))
    {
      v8 = -[MFSMTPConnection maximumMessageBytes](connection, "maximumMessageBytes");
      if (v8)
        -[DeliveryAccount setMaximumMessageBytes:](self, "setMaximumMessageBytes:", v8);
      -[SMTPAccount setSupportsPipelining:](self, "setSupportsPipelining:", -[MFSMTPConnection supportsPipelining](connection, "supportsPipelining"));
      -[SMTPAccount setSupportsOutboxCopy:](self, "setSupportsOutboxCopy:", -[MFSMTPConnection supportsOutboxCopy](connection, "supportsOutboxCopy"));
    }
    else
    {

      connection = 0;
    }
  }
  return connection;
}

- (void)disconnect:(id)a3
{
  objc_msgSend(a3, "quit");

}

- (void)connectionExpired:(id)a3
{
  MFSMTPConnection *connection;

  self->_timer = 0;
  _MFLockGlobalLock();
  connection = self->_connection;
  self->_connection = 0;
  _MFUnlockGlobalLock();
  if (connection)
    objc_msgSend(+[MFInvocationQueue sharedInvocationQueue](MFInvocationQueue, "sharedInvocationQueue"), "addInvocation:", objc_msgSend(MEMORY[0x1E0C99DB8], "mf_invocationWithSelector:target:object:", sel_disconnect_, self, connection));
}

- (void)setTimer
{
  _MFLockGlobalLock();
  -[NSTimer invalidate](self->_timer, "invalidate");
  self->_timer = (NSTimer *)objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_connectionExpired_, 0, 0, 60.0);
  _MFUnlockGlobalLock();
}

- (void)checkInConnection:(id)a3
{
  MFSMTPConnection *connection;
  time_t v6;
  int64_t v7;

  if (objc_msgSend((id)MFUserAgent(), "isMobileMail"))
  {
    _MFLockGlobalLock();
    connection = self->_connection;
    if (!connection)
      self->_connection = (MFSMTPConnection *)a3;
    _MFUnlockGlobalLock();
    v6 = time(0);
    if (!connection)
    {
      v7 = v6;
      if (v6 > self->_lastTimerSetTime + 10)
      {
        -[SMTPAccount performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_setTimer, 0, 0);
        self->_lastTimerSetTime = v7;
      }
    }
  }
  else
  {
    objc_msgSend(a3, "quit");
  }
}

- (void)releaseAllForcedConnections
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SMTPAccount;
  -[MFAccount releaseAllForcedConnections](&v2, sel_releaseAllForcedConnections);
}

- (BOOL)_isAppleServiceDeliveryHostname:(id)a3
{
  pthread_mutex_lock(&__asdHostnamesLock);
  LOBYTE(a3) = objc_msgSend((id)__asdHostnames, "containsObject:", a3);
  pthread_mutex_unlock(&__asdHostnamesLock);
  return (char)a3;
}

- (BOOL)canBeFallbackAccount
{
  return !-[SMTPAccount _isAppleServiceDeliveryHostname:](self, "_isAppleServiceDeliveryHostname:", -[MFAccount hostname](self, "hostname"));
}

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->_timer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SMTPAccount;
  -[MFAccount dealloc](&v3, sel_dealloc);
}

@end
