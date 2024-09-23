@implementation EASession

- (EASession)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("EASessionInitException"), CFSTR("-init not supported. use -initWithAccessory:forProtocol."));
  return 0;
}

- (EASession)initWithAccessory:(EAAccessory *)accessory forProtocol:(NSString *)protocolString
{
  EASession *v6;
  EASession *v7;
  uint64_t v8;
  id v9;
  EAAccessoryManager *v10;
  uint64_t v11;
  NSString *eaSessionUUIDFromCoreAccessories;
  EAOutputStream *v13;
  int v14;
  int *v15;
  uint64_t v16;
  int *v17;
  char *v18;
  int *v20;
  int v21;
  int v22;
  _QWORD v23[6];
  int v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  objc_super v29;
  char v30[256];
  sockaddr v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v29.receiver = self;
  v29.super_class = (Class)EASession;
  v6 = -[EASession init](&v29, sel_init);
  v7 = v6;
  if (!v6)
    return v7;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v6->_sock = -1;
  v6->_useSocketInterfaceForEASession = 1;
  v6->_sessionID = 0x10000;
  v24 = 0x10000;
  v6->_accessory = accessory;
  v8 = -[NSString copy](protocolString, "copy");
  v7->_protocolString = (NSString *)v8;
  v7->_eaSessionUUIDFromCoreAccessories = 0;
  v9 = -[EAAccessory _protocolIDForProtocolString:](accessory, "_protocolIDForProtocolString:", v8);
  if (-[EAAccessoryManager appDeclaresProtocol:](+[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager"), "appDeclaresProtocol:", protocolString))
  {
    if (v9)
    {
      if (-[EAAccessory createdByCoreAccessories](v7->_accessory, "createdByCoreAccessories"))
      {
        v10 = +[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager");
        v11 = -[EAAccessory coreAccessoriesPrimaryUUID](v7->_accessory, "coreAccessoriesPrimaryUUID");
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __43__EASession_initWithAccessory_forProtocol___block_invoke;
        v23[3] = &unk_1E6B078C8;
        v23[4] = v7;
        v23[5] = &v25;
        -[EAAccessoryManager createEASessionForProtocol:accessoryUUID:withReply:](v10, "createEASessionForProtocol:accessoryUUID:withReply:", protocolString, v11, v23);
      }
      else
      {
        -[EAAccessory _internalConnectionID](accessory, "_internalConnectionID");
        objc_msgSend(v9, "unsignedIntValue");
        IAPAppCreateSessionForAccessory();
        v7->_sessionID = v24;
        v7->_useSocketInterfaceForEASession = 1;
      }
      if (*((_BYTE *)v26 + 24))
        goto LABEL_23;
      if (!v7->_useSocketInterfaceForEASession)
      {
        v7->_inputStream = (NSInputStream *)-[EAInputStream initWithAccessoryWithoutSocket:forSession:]([EAInputStream alloc], "initWithAccessoryWithoutSocket:forSession:", accessory, v7);
        v13 = -[EAOutputStream initWithAccessoryWithoutSocket:forSession:]([EAOutputStream alloc], "initWithAccessoryWithoutSocket:forSession:", accessory, v7);
        goto LABEL_16;
      }
      if (!HIWORD(v7->_sessionID))
      {
        v22 = 1;
        eaSessionUUIDFromCoreAccessories = v7->_eaSessionUUIDFromCoreAccessories;
        if (eaSessionUUIDFromCoreAccessories)
        {
          __snprintf_chk(v30, 0x100uLL, 0, 0x100uLL, "%s/ea.%lu", "/var/mobile/Library/ExternalAccessory", -[NSString hash](eaSessionUUIDFromCoreAccessories, "hash"));
          NSLog(CFSTR("[#ExternalAccessory] socketPath from app = %s"), v30);
        }
        else
        {
          -[EAAccessory _internalConnectionID](accessory, "_internalConnectionID");
          IAPAppToAppSocketPath();
        }
        v14 = socket(1, 1, 0);
        v7->_sock = v14;
        if (v14 < 0)
        {
          v16 = *__error();
          v17 = __error();
          v18 = strerror(*v17);
          NSLog(CFSTR("[#ExternalAccessory] Error - socket failed: %d - %s\n"), v16, v18);
          *((_BYTE *)v26 + 24) = 1;
          v7->_sock = -1;
          goto LABEL_23;
        }
        v32 = 0;
        memset(v31.sa_data, 0, 96);
        *(_WORD *)&v31.sa_len = 362;
        __strlcpy_chk();
        if (connect(v7->_sock, &v31, 0x6Au))
        {
          v15 = __error();
          NSLog(CFSTR("[#ExternalAccessory] ERROR - sock can not connect: %u"), *v15);
          goto LABEL_8;
        }
        if (ioctl(v7->_sock, 0x8004667EuLL, &v22))
        {
          v20 = __error();
          NSLog(CFSTR("[#ExternalAccessory] ERROR - unable to make write socket nonblocking: %u"), *v20);
        }
        v21 = 0x10000;
        setsockopt(v7->_sock, 0xFFFF, 4097, &v21, 4u);
        setsockopt(v7->_sock, 0xFFFF, 4098, &v21, 4u);
        v7->_inputStream = (NSInputStream *)-[EAInputStream initWithAccessory:forSession:socket:]([EAInputStream alloc], "initWithAccessory:forSession:socket:", accessory, v7, v7->_sock);
        v13 = -[EAOutputStream initWithAccessory:forSession:socket:]([EAOutputStream alloc], "initWithAccessory:forSession:socket:", accessory, v7, v7->_sock);
LABEL_16:
        v7->_outputStream = &v13->super;
        goto LABEL_23;
      }
      NSLog(CFSTR("[#ExternalAccessory] ERROR - opening session failed"));
    }
    else
    {
      NSLog(CFSTR("[#ExternalAccessory] ERROR - could not find protocolID for protocolString %@"), protocolString);
    }
  }
  else
  {
    NSLog(CFSTR("[#ExternalAccessory] ERROR - opening session failed as protocol %@ is not declared in Info.plist"), protocolString);
  }
LABEL_8:
  *((_BYTE *)v26 + 24) = 1;
LABEL_23:
  if (*((_BYTE *)v26 + 24))
  {

    v7 = 0;
  }
  else
  {
    -[EAAccessory _addSession:](v7->_accessory, "_addSession:", v7);
  }
  _Block_object_dispose(&v25, 8);
  return v7;
}

void __43__EASession_initWithAccessory_forProtocol___block_invoke(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4, void *a5)
{
  int v6;
  char v7;

  v6 = a4;
  v7 = a3;
  NSLog(CFSTR("[#ExternalAccessory] accessoryd sessionResult = %d, useSocketInterace = %d, sessionID = 0x%llX"), a2, a3, a4);
  if (a2)
  {
    -[EAAccessoryManager saveEASession:forEASessionUUID:](+[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager"), "saveEASession:forEASessionUUID:", *(_QWORD *)(a1 + 32), a5);
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16) = v6;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = objc_msgSend(a5, "copy");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = v7;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (void)dealloc
{
  uint64_t sessionID;
  EAAccessory *accessory;
  NSString *eaSessionUUIDFromCoreAccessories;
  int sock;
  _BOOL4 v7;
  objc_super v8;

  sessionID = self->_sessionID;
  accessory = self->_accessory;
  if (!accessory || (_DWORD)sessionID == 0x10000)
  {
    NSLog(CFSTR("[#ExternalAccessory] ERROR - %s:%s - %d unable to close session for _accessory=%p and sessionID=%lu"), a2, "/Library/Caches/com.apple.xbs/Sources/ExternalAccessory/EASession.m", "-[EASession dealloc]", 212, accessory, sessionID);
  }
  else if (!self->_eaSessionUUIDFromCoreAccessories)
  {
    -[EAAccessory _internalConnectionID](accessory, "_internalConnectionID");
    IAPAppCloseSessionToAccessory();
  }

  eaSessionUUIDFromCoreAccessories = self->_eaSessionUUIDFromCoreAccessories;
  if (eaSessionUUIDFromCoreAccessories)

  sock = self->_sock;
  v7 = +[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled");
  if (sock == -1)
  {
    if (v7)
      NSLog(CFSTR("[#ExternalAccessory] %s - %s - %d _sock for session %d ALREADY CLOSED"), "/Library/Caches/com.apple.xbs/Sources/ExternalAccessory/EASession.m", "-[EASession dealloc]", 231, sessionID);
  }
  else
  {
    if (v7)
      NSLog(CFSTR("[#ExternalAccessory] %s - %s - %d Closing _sock = %d for session %d"), "/Library/Caches/com.apple.xbs/Sources/ExternalAccessory/EASession.m", "-[EASession dealloc]", 224, self->_sock, sessionID);
    close(self->_sock);
    self->_sock = -1;
  }
  v8.receiver = self;
  v8.super_class = (Class)EASession;
  -[EASession dealloc](&v8, sel_dealloc);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EASession;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ {\n  accessory:%@\n  protocolString:%@\n  inputStream:%@\n  outputStream: %@\n}"), -[EASession description](&v3, sel_description), -[EAAccessory _shortDescription](self->_accessory, "_shortDescription"), self->_protocolString, self->_inputStream, self->_outputStream);
}

- (id)_shortDescription
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EASession;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), -[EASession description](&v3, sel_description));
}

- (unsigned)_sessionID
{
  return self->_sessionID;
}

- (void)_streamClosed
{
  if (-[NSOutputStream streamStatus](self->_outputStream, "streamStatus") == 6
    && -[NSInputStream streamStatus](self->_inputStream, "streamStatus") == 6)
  {
    NSLog(CFSTR("[#ExternalAccessory] Removing EASession %@ from list of sessionUUIDs"), self->_eaSessionUUIDFromCoreAccessories);
    -[EAAccessoryManager closeEASessionForEASessionUUID:](+[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager"), "closeEASessionForEASessionUUID:", self->_eaSessionUUIDFromCoreAccessories);
    -[EAAccessory _removeSession:](self->_accessory, "_removeSession:", self);
  }
}

- (void)_endStreams
{
  -[NSInputStream endStream](self->_inputStream, "endStream");
  -[NSOutputStream endStream](self->_outputStream, "endStream");
}

- (BOOL)isOpenCompleted
{
  return self->_openCompleted;
}

- (void)setOpenCompleted:(BOOL)a3
{
  if (a3)
  {
    self->_openCompleted = 1;
    -[NSInputStream openCompleted](self->_inputStream, "openCompleted");
    -[NSOutputStream openCompleted](self->_outputStream, "openCompleted");
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("EASessionOpenCompletedNotification"), self);
  }
}

- (id)EASessionUUID
{
  return self->_eaSessionUUIDFromCoreAccessories;
}

- (void)_handleIncomingEAData:(id)a3
{
  -[NSInputStream processIncomingAccessoryData:](self->_inputStream, "processIncomingAccessoryData:", a3);
}

- (EAAccessory)accessory
{
  return self->_accessory;
}

- (NSString)protocolString
{
  return self->_protocolString;
}

- (NSInputStream)inputStream
{
  return self->_inputStream;
}

- (NSOutputStream)outputStream
{
  return self->_outputStream;
}

@end
