@implementation SMTPAccount

- (void)releaseAllConnections
{
  NSTimer *timer;
  MFSMTPConnection *v4;
  MFSMTPConnection *connection;
  objc_super v6;

  -[SMTPAccount mf_lock](self, "mf_lock");
  -[NSTimer invalidate](self->_timer, "invalidate");
  timer = self->_timer;
  self->_timer = 0;

  v4 = self->_connection;
  connection = self->_connection;
  self->_connection = 0;

  -[SMTPAccount mf_unlock](self, "mf_unlock");
  -[MFSMTPConnection quit](v4, "quit");
  v6.receiver = self;
  v6.super_class = (Class)SMTPAccount;
  -[MFAccount releaseAllConnections](&v6, sel_releaseAllConnections);

}

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->_timer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SMTPAccount;
  -[SMTPAccount dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __18__SMTPAccount_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_35 != -1)
    dispatch_once(&log_onceToken_35, block);
  return (OS_os_log *)(id)log_log_35;
}

void __18__SMTPAccount_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_35;
  log_log_35 = (uint64_t)v1;

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
  void *v3;
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  pthread_mutex_lock(&sASDHostnamesLock);
  v3 = (void *)sASDHostnames;
  if (!sASDHostnames)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v5 = (void *)sASDHostnames;
    sASDHostnames = (uint64_t)v4;

    v3 = (void *)sASDHostnames;
  }
  objc_msgSend(v3, "addObject:", v6);
  pthread_mutex_unlock(&sASDHostnamesLock);

}

- (Class)deliveryClass
{
  Class deliveryClass;

  deliveryClass = self->_deliveryClass;
  if (deliveryClass)
    return deliveryClass;
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
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
  objc_class *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SMTPAccount;
  v2 = -[MFAccount connectionClass](&v4, sel_connectionClass);
  if (!v2)
    v2 = (objc_class *)objc_opt_class();
  return v2;
}

- (id)_defaultSettingsWithPort:(unsigned int)a3 useSSL:(BOOL)a4 directSSL:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  uint64_t v7;
  void *v8;

  v5 = a5;
  v6 = a4;
  v7 = *(_QWORD *)&a3;
  -[MFAccount defaultConnectionSettings](self, "defaultConnectionSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPortNumber:", v7);
  objc_msgSend(v8, "setUsesSSL:", v6);
  objc_msgSend(v8, "setTryDirectSSL:", v5);
  return v8;
}

- (id)connectionSettingsForAuthentication:(BOOL)a3 secure:(id)a4 insecure:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  char v24;
  _BOOL4 v26;
  id v27;
  id v28;

  v6 = a3;
  v28 = a4;
  v27 = a5;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26 = v6;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[MFAccount defaultConnectionSettings](self, "defaultConnectionSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "portNumber");
  if ((objc_msgSend(v11, "usesSSL") & 1) != 0)
  {
    -[SMTPAccount _defaultSettingsWithPort:useSSL:directSSL:](self, "_defaultSettingsWithPort:useSSL:directSSL:", v12, 0, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v13);

    -[SMTPAccount _defaultSettingsWithPort:useSSL:directSSL:](self, "_defaultSettingsWithPort:useSSL:directSSL:", v12, 1, objc_msgSend(v11, "tryDirectSSL") ^ 1);
  }
  else
  {
    -[SMTPAccount _defaultSettingsWithPort:useSSL:directSSL:](self, "_defaultSettingsWithPort:useSSL:directSSL:", v12, 1, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v15);

    -[SMTPAccount _defaultSettingsWithPort:useSSL:directSSL:](self, "_defaultSettingsWithPort:useSSL:directSSL:", v12, 1, 0);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v14);

  for (i = 0; i != 3; ++i)
  {
    v17 = dword_1A5999B80[i];
    if ((_DWORD)v12 != (_DWORD)v17)
    {
      -[SMTPAccount _defaultSettingsWithPort:useSSL:directSSL:](self, "_defaultSettingsWithPort:useSSL:directSSL:", dword_1A5999B80[i], 1, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v18);

      -[SMTPAccount _defaultSettingsWithPort:useSSL:directSSL:](self, "_defaultSettingsWithPort:useSSL:directSSL:", v17, 1, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v19);

      -[SMTPAccount _defaultSettingsWithPort:useSSL:directSSL:](self, "_defaultSettingsWithPort:useSSL:directSSL:", v17, 0, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v20);

    }
  }
  if (v26)
  {
    v22 = v27;
    v21 = v28;
    objc_msgSend(v10, "addObjectsFromArray:", v9);
    v23 = v8;
  }
  else
  {
    v22 = v27;
    v21 = v28;
    v24 = objc_msgSend(v11, "usesSSL");
    v23 = v9;
    if ((v24 & 1) == 0)
    {
      objc_msgSend(v10, "addObjectsFromArray:", v8);
      v23 = v9;
    }
  }
  objc_msgSend(v10, "addObjectsFromArray:", v23);
  if (v21)
    objc_msgSend(v21, "addObjectsFromArray:", v9);
  if (v22)
    objc_msgSend(v22, "addObjectsFromArray:", v8);

  return v10;
}

- (id)secureConnectionSettings
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAccount defaultConnectionSettings](self, "defaultConnectionSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "usesSSL"))
    objc_msgSend(v3, "addObject:", v4);
  v5 = -[SMTPAccount connectionSettingsForAuthentication:secure:insecure:](self, "connectionSettingsForAuthentication:secure:insecure:", 1, v3, 0);

  return v3;
}

- (id)insecureConnectionSettings
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAccount defaultConnectionSettings](self, "defaultConnectionSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "usesSSL") & 1) == 0)
    objc_msgSend(v3, "addObject:", v4);
  v5 = -[SMTPAccount connectionSettingsForAuthentication:secure:insecure:](self, "connectionSettingsForAuthentication:secure:insecure:", 1, 0, v3);

  return v3;
}

- (id)alternateConnectionSettings
{
  return -[SMTPAccount connectionSettingsForAuthentication:secure:insecure:](self, "connectionSettingsForAuthentication:secure:insecure:", 0, 0, 0);
}

- (BOOL)_shouldTryDirectSSLConnectionOnPort:(unsigned int)a3
{
  char v3;
  void *v4;
  void *v5;

  v3 = a3 == 465;
  -[MFAccount _objectForAccountInfoKey:](self, "_objectForAccountInfoKey:", CFSTR("SSLIsDirect"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v3 = objc_msgSend(v4, "BOOLValue");

  return v3;
}

- (id)preferredAuthScheme
{
  void *v3;
  objc_super v5;

  if (-[DeliveryAccount shouldUseAuthentication](self, "shouldUseAuthentication"))
  {
    v5.receiver = self;
    v5.super_class = (Class)SMTPAccount;
    -[MFAccount preferredAuthScheme](&v5, sel_preferredAuthScheme);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0D1E688], "schemeWithName:", *MEMORY[0x1E0D1E668]);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)setPreferredAuthScheme:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[DeliveryAccount setShouldUseAuthentication:](self, "setShouldUseAuthentication:", v4 != 0);
  v5.receiver = self;
  v5.super_class = (Class)SMTPAccount;
  -[MFAccount setPreferredAuthScheme:](&v5, sel_setPreferredAuthScheme_, v4);

}

- (id)customAuthenticationErrorStringForError:(id)a3 authScheme:(id)a4
{
  void *v4;
  uint64_t v5;

  objc_msgSend(a3, "mf_shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
  {
    MFLookupLocalizedString(CFSTR("FAILED_SEND_TITLE"), CFSTR("Cannot Send Mail"), CFSTR("Delayed"));
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  return v4;
}

- (id)errorForResponse:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "status");
  v5 = v4 - 530;
  if ((unint64_t)(v4 - 530) > 8 || ((1 << (v4 - 18)) & 0x111) == 0)
    MFLookupLocalizedString(CFSTR("FAILED_SEND"), CFSTR("Check the account settings for the outgoing server “%@”."), CFSTR("Delayed"));
  else
    MFLookupLocalizedString(CFSTR("FAILED_SEND_SSL_NEEDED"), CFSTR("Check the SSL setting for the outgoing server “%@”."), CFSTR("Delayed"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = v7;
  if (v5 > 8)
    v9 = v7;

  v10 = (void *)MEMORY[0x1E0CB3940];
  -[DeliveryAccount displayHostname](self, "displayHostname");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = CFSTR("UserFriendlyErrorDescription");
  v18[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  MFLookupLocalizedString(CFSTR("FAILED_SEND_TITLE"), CFSTR("Cannot Send Mail"), CFSTR("Delayed"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), 1032, v12, v14, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)supportsPipelining
{
  return *((_BYTE *)self + 120) & 1;
}

- (void)setSupportsPipelining:(BOOL)a3
{
  *((_BYTE *)self + 120) = *((_BYTE *)self + 120) & 0xFE | a3;
}

- (BOOL)supportsOutboxCopy
{
  return (*((unsigned __int8 *)self + 120) >> 1) & 1;
}

- (void)setSupportsOutboxCopy:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 120) = *((_BYTE *)self + 120) & 0xFD | v3;
}

- (__CFString)connectionServiceType
{
  __CFString *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SMTPAccount;
  result = -[MFAccount connectionServiceType](&v4, sel_connectionServiceType);
  if ((*((_BYTE *)self + 120) & 4) != 0)
    return (__CFString *)*MEMORY[0x1E0CA7368];
  return result;
}

- (id)authenticatedConnection:(BOOL)a3
{
  MFSMTPConnection *v5;
  char v6;
  MFSMTPConnection *connection;
  time_t v8;
  MFSMTPConnection *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[SMTPAccount mf_lock](self, "mf_lock");
  if (a3)
  {
    v5 = 0;
    v6 = 4;
  }
  else
  {
    v5 = self->_connection;
    v6 = 0;
  }
  connection = self->_connection;
  self->_connection = 0;

  *((_BYTE *)self + 120) = *((_BYTE *)self + 120) & 0xFB | v6;
  -[SMTPAccount mf_unlock](self, "mf_unlock");
  if (v5)
  {
    v8 = time(0);
    if (v8 <= -[MFSMTPConnection timeLastCommandWasSent](v5, "timeLastCommandWasSent") + 30
      || -[MFSMTPConnection noop](v5, "noop") == 2)
    {
      v9 = v5;
      goto LABEL_15;
    }

  }
  v9 = -[MFAccount _newConnection](self, "_newConnection");
  if (v9)
  {
    if (-[MFAccount _connectAndAuthenticate:](self, "_connectAndAuthenticate:", v9))
    {
      v10 = -[MFSMTPConnection maximumMessageBytes](v9, "maximumMessageBytes");
      if (v10)
        -[DeliveryAccount setMaximumMessageBytes:](self, "setMaximumMessageBytes:", v10);
      -[SMTPAccount setSupportsPipelining:](self, "setSupportsPipelining:", -[MFSMTPConnection supportsPipelining](v9, "supportsPipelining", v10));
      -[SMTPAccount setSupportsOutboxCopy:](self, "setSupportsOutboxCopy:", -[MFSMTPConnection supportsOutboxCopy](v9, "supportsOutboxCopy"));
    }
    else
    {

      v9 = 0;
    }
  }
LABEL_15:
  +[SMTPAccount log](SMTPAccount, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[MFSMTPConnection domainName](self->_connection, "domainName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543362;
    v15 = v12;
    _os_log_impl(&dword_1A4F90000, v11, OS_LOG_TYPE_DEFAULT, "_connection domain name: %{public}@", (uint8_t *)&v14, 0xCu);

  }
  return v9;
}

- (void)disconnect:(id)a3
{
  objc_msgSend(a3, "quit");
}

- (void)connectionExpired:(id)a3
{
  NSTimer *timer;
  MFSMTPConnection *connection;
  MFSMTPConnection *v6;
  void *v7;
  void *v8;
  MFSMTPConnection *v9;

  timer = self->_timer;
  self->_timer = 0;

  -[SMTPAccount mf_lock](self, "mf_lock");
  v9 = self->_connection;
  connection = self->_connection;
  self->_connection = 0;

  -[SMTPAccount mf_unlock](self, "mf_unlock");
  v6 = v9;
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99DB8], "mf_invocationWithSelector:target:object:", sel_disconnect_, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFInvocationQueue sharedInvocationQueue](MFInvocationQueue, "sharedInvocationQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addInvocation:", v7);

    v6 = v9;
  }

}

- (void)setTimer
{
  NSTimer *v3;
  NSTimer *timer;

  -[SMTPAccount mf_lock](self, "mf_lock");
  -[NSTimer invalidate](self->_timer, "invalidate");
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_connectionExpired_, 0, 0, 60.0);
  v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  timer = self->_timer;
  self->_timer = v3;

  -[SMTPAccount mf_unlock](self, "mf_unlock");
}

- (void)checkInConnection:(id)a3
{
  void *v5;
  int v6;
  MFSMTPConnection *connection;
  time_t v8;
  int64_t v9;
  id v10;

  v10 = a3;
  MFUserAgent();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isMobileMail");

  if (v6)
  {
    -[SMTPAccount mf_lock](self, "mf_lock");
    connection = self->_connection;
    if (!connection)
      objc_storeStrong((id *)&self->_connection, a3);
    -[SMTPAccount mf_unlock](self, "mf_unlock");
    v8 = time(0);
    if (!connection)
    {
      v9 = v8;
      if (v8 > self->_lastTimerSetTime + 10)
      {
        -[SMTPAccount performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_setTimer, 0, 0);
        self->_lastTimerSetTime = v9;
      }
    }
  }
  else
  {
    objc_msgSend(v10, "quit");
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
  id v3;
  char v4;

  v3 = a3;
  pthread_mutex_lock(&sASDHostnamesLock);
  v4 = objc_msgSend((id)sASDHostnames, "containsObject:", v3);
  pthread_mutex_unlock(&sASDHostnamesLock);

  return v4;
}

- (BOOL)canBeFallbackAccount
{
  SMTPAccount *v2;
  void *v3;

  v2 = self;
  -[MFAccount hostname](self, "hostname");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = !-[SMTPAccount _isAppleServiceDeliveryHostname:](v2, "_isAppleServiceDeliveryHostname:", v3);

  return (char)v2;
}

@end
