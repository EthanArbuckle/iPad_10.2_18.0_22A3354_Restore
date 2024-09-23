@implementation MFSecureMIMECompositionManager

- (MFSecureMIMECompositionManager)init
{
  return -[MFSecureMIMECompositionManager initWithSendingAccount:signingPolicy:encryptionPolicy:](self, "initWithSendingAccount:signingPolicy:encryptionPolicy:", 0, 0, 0);
}

- (MFSecureMIMECompositionManager)initWithSigningPolicy:(int)a3 encryptionPolicy:(int)a4
{
  return -[MFSecureMIMECompositionManager initWithSendingAccount:signingPolicy:encryptionPolicy:](self, "initWithSendingAccount:signingPolicy:encryptionPolicy:", 0, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

- (MFSecureMIMECompositionManager)initWithSendingAccount:(id)a3 signingPolicy:(int)a4 encryptionPolicy:(int)a5
{
  MFSecureMIMECompositionManager *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MFSecureMIMECompositionManager;
  v8 = -[MFSecureMIMECompositionManager init](&v10, sel_init);
  if (v8)
  {
    v8->_lock = (NSLock *)objc_msgSend(objc_alloc(MEMORY[0x1E0D460A8]), "initWithName:andDelegate:", CFSTR("MFSecureMIMECompositionManager_lock"), 0);
    v8->_queue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.mobilemail.MFSecureMIMECompositionManagerQueue", 0);
    v8->_sendingAccount = (MailAccount *)a3;
    v8->_signingPolicy = a4;
    v8->_encryptionPolicy = a5;
    -[MFSecureMIMECompositionManager _updateSigningStatus_nts](v8, "_updateSigningStatus_nts");
    -[MFSecureMIMECompositionManager _updateEncryptionStatus_nts](v8, "_updateEncryptionStatus_nts");
  }
  return v8;
}

- (void)dealloc
{
  NSObject *queue;
  __SecIdentity *signingIdentity;
  __SecIdentity *encryptionIdentity;
  objc_super v6;

  queue = self->_queue;
  if (queue)
    dispatch_release(queue);

  signingIdentity = self->_signingIdentity;
  if (signingIdentity)
    CFRelease(signingIdentity);

  encryptionIdentity = self->_encryptionIdentity;
  if (encryptionIdentity)
    CFRelease(encryptionIdentity);

  v6.receiver = self;
  v6.super_class = (Class)MFSecureMIMECompositionManager;
  -[MFSecureMIMECompositionManager dealloc](&v6, sel_dealloc);
}

- (void)addRecipients:(id)a3
{
  void *v5;
  NSMutableSet *recipients;
  int encryptionPolicy;
  _BOOL4 v8;
  uint64_t encryptionStatus;
  NSObject *queue;
  _QWORD v11[6];

  if (objc_msgSend(a3, "count"))
  {
    v5 = (void *)objc_msgSend(a3, "copy");
    -[NSLock lock](self->_lock, "lock");
    if (self->_invalidated)
    {
      -[NSLock unlock](self->_lock, "unlock");
    }
    else
    {
      recipients = self->_recipients;
      if (!recipients)
      {
        recipients = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
        self->_recipients = recipients;
      }
      -[NSMutableSet unionSet:](recipients, "unionSet:", v5);
      encryptionPolicy = self->_encryptionPolicy;
      if (encryptionPolicy)
        ++self->_encryptionStatusSemaphore;
      v8 = -[MFSecureMIMECompositionManager _updateEncryptionStatus_nts](self, "_updateEncryptionStatus_nts");
      encryptionStatus = self->_encryptionStatus;
      -[NSLock unlock](self->_lock, "unlock");
      if (v8)
        -[MFSecureMIMECompositionManager _notifyDelegateEncryptionStatusDidChange:certsByRecipient:errorsByRecipient:identity:error:](self, "_notifyDelegateEncryptionStatusDidChange:certsByRecipient:errorsByRecipient:identity:error:", encryptionStatus, 0, 0, 0, 0);
      if (encryptionPolicy)
      {
        queue = self->_queue;
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __48__MFSecureMIMECompositionManager_addRecipients___block_invoke;
        v11[3] = &unk_1E81C9BC0;
        v11[4] = self;
        v11[5] = v5;
        dispatch_async(queue, v11);
      }
    }

  }
}

uint64_t __48__MFSecureMIMECompositionManager_addRecipients___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_determineEncryptionStatusWithNewRecipients:", *(_QWORD *)(a1 + 40));
}

- (void)removeRecipients:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t encryptionStatus;
  id v9;
  id v10;
  __SecIdentity *encryptionIdentity;
  CFTypeRef v12;
  MFError *v13;

  -[NSLock lock](self->_lock, "lock");
  if (self->_invalidated
    || (v5 = objc_msgSend(a3, "allObjects"),
        v6 = -[NSMutableDictionary count](self->_errorsByRecipient, "count"),
        v7 = -[NSMutableDictionary count](self->_certificatesByRecipient, "count"),
        -[NSMutableSet minusSet:](self->_recipients, "minusSet:", a3),
        -[NSMutableDictionary removeObjectsForKeys:](self->_errorsByRecipient, "removeObjectsForKeys:", v5),
        -[NSMutableDictionary removeObjectsForKeys:](self->_certificatesByRecipient, "removeObjectsForKeys:", v5),
        self->_encryptionStatusSemaphore)
    || !-[MFSecureMIMECompositionManager _updateEncryptionStatus_nts](self, "_updateEncryptionStatus_nts")
    && -[NSMutableDictionary count](self->_certificatesByRecipient, "count") == v7
    && -[NSMutableDictionary count](self->_errorsByRecipient, "count") == v6)
  {
    -[NSLock unlock](self->_lock, "unlock");
  }
  else
  {
    encryptionStatus = self->_encryptionStatus;
    if (-[NSMutableDictionary count](self->_errorsByRecipient, "count"))
      v9 = (id)-[NSMutableDictionary copy](self->_errorsByRecipient, "copy");
    else
      v9 = 0;
    if (-[NSMutableDictionary count](self->_certificatesByRecipient, "count"))
      v10 = (id)-[NSMutableDictionary copy](self->_certificatesByRecipient, "copy");
    else
      v10 = 0;
    encryptionIdentity = self->_encryptionIdentity;
    if (encryptionIdentity)
    {
      v12 = CFRetain(encryptionIdentity);
      v13 = 0;
    }
    else
    {
      v13 = self->_encryptionIdentityError;
      v12 = 0;
    }
    -[NSLock unlock](self->_lock, "unlock");
    -[MFSecureMIMECompositionManager _notifyDelegateEncryptionStatusDidChange:certsByRecipient:errorsByRecipient:identity:error:](self, "_notifyDelegateEncryptionStatusDidChange:certsByRecipient:errorsByRecipient:identity:error:", encryptionStatus, v10, v9, v12, v13);
    if (v12)
      CFRelease(v12);
  }
}

- (void)invalidate
{
  -[NSLock lock](self->_lock, "lock");
  self->_delegate = 0;
  self->_invalidated = 1;
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)setDelegate:(id)a3
{
  -[NSLock lock](self->_lock, "lock");
  self->_delegate = (MFSecureMIMECompositionManagerDelegate *)a3;
  -[NSLock unlock](self->_lock, "unlock");
}

- (MFSecureMIMECompositionManagerDelegate)delegate
{
  MFSecureMIMECompositionManagerDelegate *delegate;

  -[NSLock lock](self->_lock, "lock");
  delegate = self->_delegate;
  -[NSLock unlock](self->_lock, "unlock");
  return delegate;
}

- (void)setSendingAddress:(id)a3
{
  char v5;
  int v6;
  NSString *v7;
  NSObject *queue;
  BOOL v9;
  _BOOL4 v10;
  uint64_t signingStatus;
  _BOOL4 v12;
  uint64_t encryptionStatus;
  _QWORD v14[7];
  char v15;
  char v16;

  -[NSLock lock](self->_lock, "lock");
  if (!self->_invalidated && !-[NSString isEqualToString:](self->_sendingAddress, "isEqualToString:", a3))
  {
    v7 = (NSString *)objc_msgSend(a3, "copy");

    self->_sendingAddress = v7;
    if (self->_signingPolicy)
      v9 = v7 == 0;
    else
      v9 = 1;
    v5 = !v9;
    if (!v9)
      ++self->_signingStatusSemaphore;
    v10 = -[MFSecureMIMECompositionManager _updateSigningStatus_nts](self, "_updateSigningStatus_nts");
    if (self->_encryptionPolicy && self->_sendingAddress)
    {
      ++self->_encryptionStatusSemaphore;
      v6 = 1;
    }
    else
    {
      v6 = 0;
    }
    signingStatus = self->_signingStatus;
    v12 = -[MFSecureMIMECompositionManager _updateEncryptionStatus_nts](self, "_updateEncryptionStatus_nts");
    encryptionStatus = self->_encryptionStatus;
    -[NSLock unlock](self->_lock, "unlock");
    if (v10)
    {
      -[MFSecureMIMECompositionManager _notifyDelegateSigningStatusDidChange:identity:error:](self, "_notifyDelegateSigningStatusDidChange:identity:error:", signingStatus, 0, 0);
      if (!v12)
        goto LABEL_4;
    }
    else if (!v12)
    {
      goto LABEL_4;
    }
    -[MFSecureMIMECompositionManager _notifyDelegateEncryptionStatusDidChange:certsByRecipient:errorsByRecipient:identity:error:](self, "_notifyDelegateEncryptionStatusDidChange:certsByRecipient:errorsByRecipient:identity:error:", encryptionStatus, 0, 0, 0, 0);
    goto LABEL_4;
  }
  -[NSLock unlock](self->_lock, "unlock");
  v5 = 0;
  v6 = 0;
  v7 = 0;
LABEL_4:
  if ((v5 & 1) != 0 || v6)
  {
    queue = self->_queue;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __52__MFSecureMIMECompositionManager_setSendingAddress___block_invoke;
    v14[3] = &unk_1E81CB800;
    v14[4] = self;
    v14[5] = v7;
    v15 = v5;
    v16 = v6;
    v14[6] = a3;
    dispatch_async(queue, v14);
  }
}

uint64_t __52__MFSecureMIMECompositionManager_setSendingAddress___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_determineIdentitiesWithSendingAddress:forSigning:encryption:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), 1);
  if (*(_BYTE *)(a1 + 56))
    result = objc_msgSend(*(id *)(a1 + 32), "_determineSigningStatusWithSendingAddress:", *(_QWORD *)(a1 + 40));
  if (*(_BYTE *)(a1 + 57))
    return objc_msgSend(*(id *)(a1 + 32), "_determineEncryptionStatusWithSendingAddress:", *(_QWORD *)(a1 + 48));
  return result;
}

- (NSString)sendingAddress
{
  NSString *sendingAddress;

  -[NSLock lock](self->_lock, "lock");
  sendingAddress = self->_sendingAddress;
  -[NSLock unlock](self->_lock, "unlock");
  return sendingAddress;
}

- (MailAccount)sendingAccount
{
  return self->_sendingAccount;
}

- (int)signingPolicy
{
  return self->_signingPolicy;
}

- (int)encryptionPolicy
{
  return self->_encryptionPolicy;
}

- (void)_determineIdentitiesWithSendingAddress:(id)a3 forSigning:(BOOL)a4 encryption:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  const void *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a5;
  v6 = a4;
  v9 = 0;
  v11 = 0;
  v12 = 0;
  if (a4)
  {
    v9 = (const void *)objc_msgSend((id)objc_opt_class(), "copySigningIdentityForAccount:sendingAddress:error:", self->_sendingAccount, a3, &v12);
    if (v5)
      goto LABEL_3;
  }
  else if (a5)
  {
LABEL_3:
    v10 = (const void *)objc_msgSend((id)objc_opt_class(), "copyEncryptionIdentityForAccount:sendingAddress:error:", self->_sendingAccount, a3, &v11);
    goto LABEL_6;
  }
  v10 = 0;
LABEL_6:
  -[NSLock lock](self->_lock, "lock", v11);
  if (!self->_invalidated)
  {
    if (v6)
      -[MFSecureMIMECompositionManager _nts_setSigningIdentity:error:](self, "_nts_setSigningIdentity:error:", v9, v12);
    if (v5)
      -[MFSecureMIMECompositionManager _nts_setEncryptionIdentity:error:](self, "_nts_setEncryptionIdentity:error:", v10, v11);
  }
  -[NSLock unlock](self->_lock, "unlock");
  if (v9)
    CFRelease(v9);
  if (v10)
    CFRelease(v10);
}

- (void)_determineRevocationStatusWithIdentity:(__SecIdentity *)a3 sendingAddress:(id)a4
{
  MFError *v7;
  NSObject *v8;
  __SecIdentity *signingIdentity;
  _BOOL4 v10;
  int signingStatus;
  NSObject *queue;
  _QWORD v13[6];
  int v14;
  SecCertificateRef certificateRef;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  certificateRef = 0;
  SecIdentityCopyCertificate(a3, &certificateRef);
  if (certificateRef)
  {
    if (objc_msgSend((id)objc_opt_class(), "isRevokedCertificate:sendingAddress:", certificateRef, a4))
    {
      v7 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1052, 0);
      -[NSLock lock](self->_lock, "lock");
      if (!self->_signingStatusSemaphore
        && (signingIdentity = self->_signingIdentity) != 0
        && CFEqual(a3, signingIdentity))
      {
        -[MFSecureMIMECompositionManager _nts_setSigningIdentity:error:](self, "_nts_setSigningIdentity:error:", 0, v7);
        v10 = -[MFSecureMIMECompositionManager _updateSigningStatus_nts](self, "_updateSigningStatus_nts");
        signingStatus = self->_signingStatus;
        -[NSLock unlock](self->_lock, "unlock");
        if (v10)
        {
          queue = self->_queue;
          v13[0] = MEMORY[0x1E0C809B0];
          v13[1] = 3221225472;
          v13[2] = __88__MFSecureMIMECompositionManager__determineRevocationStatusWithIdentity_sendingAddress___block_invoke;
          v13[3] = &unk_1E81CB828;
          v14 = signingStatus;
          v13[4] = self;
          v13[5] = v7;
          dispatch_async(queue, v13);
        }
      }
      else
      {
        -[NSLock unlock](self->_lock, "unlock");
      }
    }
  }
  else
  {
    v8 = MFLogGeneral();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = a4;
      _os_log_impl(&dword_1C8839000, v8, OS_LOG_TYPE_INFO, "#SMIMEErrors SecIdentityCopyCertificate could not find certificate for %@", buf, 0xCu);
    }
  }
}

uint64_t __88__MFSecureMIMECompositionManager__determineRevocationStatusWithIdentity_sendingAddress___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateSigningStatusDidChange:identity:error:", *(unsigned int *)(a1 + 48), 0, *(_QWORD *)(a1 + 40));
}

- (void)_determineSigningStatusWithSendingAddress:(id)a3
{
  unint64_t signingStatusSemaphore;
  CFTypeRef v6;
  NSObject *global_queue;
  _BOOL4 v8;
  uint64_t signingStatus;
  _QWORD block[7];
  CFTypeRef v11;
  uint64_t v12;

  v11 = 0;
  v12 = 0;
  -[NSLock lock](self->_lock, "lock");
  signingStatusSemaphore = self->_signingStatusSemaphore;
  if (!signingStatusSemaphore)
    -[MFSecureMIMECompositionManager _determineSigningStatusWithSendingAddress:].cold.1();
  self->_signingStatusSemaphore = signingStatusSemaphore - 1;
  if (self->_invalidated
    || (-[MFSecureMIMECompositionManager _nts_copySigningIdentity:error:](self, "_nts_copySigningIdentity:error:", &v11, &v12), self->_signingStatusSemaphore))
  {
    -[NSLock unlock](self->_lock, "unlock");
  }
  else
  {
    v6 = v11;
    if (v11)
    {
      global_queue = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __76__MFSecureMIMECompositionManager__determineSigningStatusWithSendingAddress___block_invoke;
      block[3] = &unk_1E81CB850;
      block[5] = a3;
      block[6] = v6;
      block[4] = self;
      dispatch_async(global_queue, block);
    }
    v8 = -[MFSecureMIMECompositionManager _updateSigningStatus_nts](self, "_updateSigningStatus_nts");
    signingStatus = self->_signingStatus;
    -[NSLock unlock](self->_lock, "unlock");
    if (v8)
      -[MFSecureMIMECompositionManager _notifyDelegateSigningStatusDidChange:identity:error:](self, "_notifyDelegateSigningStatusDidChange:identity:error:", signingStatus, v11, v12);
  }
  if (v11)
    CFRelease(v11);
}

uint64_t __76__MFSecureMIMECompositionManager__determineSigningStatusWithSendingAddress___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_determineRevocationStatusWithIdentity:sendingAddress:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)_notifyDelegateSigningStatusDidChange:(int)a3 identity:(__SecIdentity *)a4 error:(id)a5
{
  uint64_t v7;
  MFSecureMIMECompositionManagerDelegate *v9;
  void *v10;
  id *v11;
  const __CFString **v12;
  uint64_t v13;
  const __CFString *v14;
  id v15;
  const __CFString *v16;
  _QWORD v17[2];

  v7 = *(_QWORD *)&a3;
  v17[1] = *MEMORY[0x1E0C80C00];
  v9 = -[MFSecureMIMECompositionManager delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (a4)
    {
      v16 = CFSTR("IdentityRef");
      v17[0] = a4;
      v10 = (void *)MEMORY[0x1E0C99D80];
      v11 = (id *)v17;
      v12 = &v16;
    }
    else
    {
      if (!a5)
      {
        v13 = 0;
        goto LABEL_7;
      }
      v14 = CFSTR("IdentityError");
      v15 = a5;
      v10 = (void *)MEMORY[0x1E0C99D80];
      v11 = &v15;
      v12 = &v14;
    }
    v13 = objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, 1);
LABEL_7:
    -[MFSecureMIMECompositionManagerDelegate secureMIMECompositionManager:signingStatusDidChange:context:](v9, "secureMIMECompositionManager:signingStatusDidChange:context:", self, v7, v13);
  }
}

- (BOOL)_updateSigningStatus_nts
{
  int signingStatus;
  int v3;

  signingStatus = self->_signingStatus;
  if (self->_signingPolicy)
  {
    if (self->_signingStatusSemaphore)
      v3 = 1;
    else
      v3 = 2 * (self->_signingIdentity == 0);
  }
  else
  {
    v3 = 2;
  }
  self->_signingStatus = v3;
  return signingStatus != v3;
}

- (void)_nts_setSigningIdentity:(__SecIdentity *)a3 error:(id)a4
{
  __SecIdentity *signingIdentity;
  __SecIdentity *v8;
  MFError *signingIdentityError;

  signingIdentity = self->_signingIdentity;
  if (signingIdentity != a3)
  {
    if (signingIdentity)
      CFRelease(signingIdentity);
    if (a3)
      v8 = (__SecIdentity *)CFRetain(a3);
    else
      v8 = 0;
    self->_signingIdentity = v8;
  }
  signingIdentityError = self->_signingIdentityError;
  if (signingIdentityError != a4)
  {

    self->_signingIdentityError = (MFError *)a4;
  }
}

- (void)_nts_copySigningIdentity:(__SecIdentity *)a3 error:(id *)a4
{
  void *signingIdentity;

  if (a3)
  {
    signingIdentity = self->_signingIdentity;
    if (signingIdentity)
      signingIdentity = (void *)CFRetain(signingIdentity);
    *a3 = (__SecIdentity *)signingIdentity;
  }
  if (a4)
    *a4 = self->_signingIdentityError;
}

- (int)signingStatus
{
  int signingStatus;

  -[NSLock lock](self->_lock, "lock");
  signingStatus = self->_signingStatus;
  -[NSLock unlock](self->_lock, "unlock");
  return signingStatus;
}

- (void)_determineEncryptionStatusWithSendingAddress:(id)a3
{
  unint64_t encryptionStatusSemaphore;
  unint64_t v5;
  BOOL v6;
  uint64_t encryptionStatus;
  CFTypeRef cf;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v10 = 0;
  v11 = 0;
  cf = 0;
  v9 = 0;
  -[NSLock lock](self->_lock, "lock", a3);
  encryptionStatusSemaphore = self->_encryptionStatusSemaphore;
  if (!encryptionStatusSemaphore)
    -[MFSecureMIMECompositionManager _determineEncryptionStatusWithSendingAddress:].cold.1();
  v5 = encryptionStatusSemaphore - 1;
  self->_encryptionStatusSemaphore = v5;
  if (v5)
    v6 = 0;
  else
    v6 = !self->_invalidated;
  if (v6 && -[MFSecureMIMECompositionManager _updateEncryptionStatus_nts](self, "_updateEncryptionStatus_nts"))
  {
    encryptionStatus = self->_encryptionStatus;
    -[MFSecureMIMECompositionManager _nts_copyEncryptionIdentity:error:certificatesByRecipient:errorsByRecipient:](self, "_nts_copyEncryptionIdentity:error:certificatesByRecipient:errorsByRecipient:", &cf, &v9, &v10, &v11);
    -[NSLock unlock](self->_lock, "unlock");
    -[MFSecureMIMECompositionManager _notifyDelegateEncryptionStatusDidChange:certsByRecipient:errorsByRecipient:identity:error:](self, "_notifyDelegateEncryptionStatusDidChange:certsByRecipient:errorsByRecipient:identity:error:", encryptionStatus, v10, v11, cf, v9);
    if (cf)
      CFRelease(cf);
  }
  else
  {
    -[NSLock unlock](self->_lock, "unlock");
  }
}

- (void)_determineEncryptionStatusWithNewRecipients:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t encryptionStatusSemaphore;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  NSMutableDictionary *errorsByRecipient;
  NSMutableDictionary *certificatesByRecipient;
  int v23;
  uint64_t encryptionStatus;
  _BOOL4 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  CFTypeRef cf;
  uint64_t v37;
  uint64_t v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v37 = 0;
  v38 = 0;
  v35 = 0;
  cf = 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(a3);
        v11 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        v30 = 0;
        v12 = objc_msgSend((id)objc_opt_class(), "copyEncryptionCertificatesForAccount:recipientAddress:error:", self->_sendingAccount, v11, &v30);
        if (v12)
        {
          v13 = (void *)v12;
          objc_msgSend(v5, "setObject:forKey:", v12, v11);

        }
        else if (v30)
        {
          objc_msgSend(v6, "setObject:forKey:", v30, v11);
        }
      }
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    }
    while (v8);
  }
  -[NSLock lock](self->_lock, "lock");
  encryptionStatusSemaphore = self->_encryptionStatusSemaphore;
  if (!encryptionStatusSemaphore)
    -[MFSecureMIMECompositionManager _determineEncryptionStatusWithNewRecipients:].cold.1();
  self->_encryptionStatusSemaphore = encryptionStatusSemaphore - 1;
  if (self->_invalidated)
    goto LABEL_26;
  v15 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v15, "minusSet:", self->_recipients);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v39, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j);
        objc_msgSend(v5, "removeObjectForKey:", v20);
        objc_msgSend(v6, "removeObjectForKey:", v20);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v39, 16);
    }
    while (v17);
  }

  errorsByRecipient = self->_errorsByRecipient;
  if (!errorsByRecipient)
  {
    errorsByRecipient = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    self->_errorsByRecipient = errorsByRecipient;
  }
  -[NSMutableDictionary addEntriesFromDictionary:](errorsByRecipient, "addEntriesFromDictionary:", v6);
  certificatesByRecipient = self->_certificatesByRecipient;
  if (!certificatesByRecipient)
  {
    certificatesByRecipient = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    self->_certificatesByRecipient = certificatesByRecipient;
  }
  -[NSMutableDictionary addEntriesFromDictionary:](certificatesByRecipient, "addEntriesFromDictionary:", v5);
  if (self->_encryptionStatusSemaphore)
  {
LABEL_26:
    v23 = 0;
    encryptionStatus = 1;
  }
  else
  {
    v25 = -[MFSecureMIMECompositionManager _updateEncryptionStatus_nts](self, "_updateEncryptionStatus_nts");
    encryptionStatus = self->_encryptionStatus;
    if (v25)
    {
      -[MFSecureMIMECompositionManager _nts_copyEncryptionIdentity:error:certificatesByRecipient:errorsByRecipient:](self, "_nts_copyEncryptionIdentity:error:certificatesByRecipient:errorsByRecipient:", &cf, &v35, &v37, &v38);
      v23 = 1;
    }
    else
    {
      v23 = 0;
    }
  }
  -[NSLock unlock](self->_lock, "unlock");

  if (v23)
    -[MFSecureMIMECompositionManager _notifyDelegateEncryptionStatusDidChange:certsByRecipient:errorsByRecipient:identity:error:](self, "_notifyDelegateEncryptionStatusDidChange:certsByRecipient:errorsByRecipient:identity:error:", encryptionStatus, v37, v38, cf, v35);
  if (cf)
    CFRelease(cf);
}

- (BOOL)_updateEncryptionStatus_nts
{
  int encryptionStatus;
  int v4;
  uint64_t v5;

  encryptionStatus = self->_encryptionStatus;
  if (!self->_encryptionPolicy)
    goto LABEL_7;
  if (!self->_encryptionStatusSemaphore)
  {
    if (self->_encryptionIdentity)
    {
      v5 = -[NSMutableSet count](self->_recipients, "count");
      if (v5 == -[NSMutableDictionary count](self->_certificatesByRecipient, "count"))
      {
        v4 = 0;
        goto LABEL_8;
      }
    }
LABEL_7:
    v4 = 2;
    goto LABEL_8;
  }
  v4 = 1;
LABEL_8:
  self->_encryptionStatus = v4;
  return encryptionStatus != v4;
}

- (void)_nts_setEncryptionIdentity:(__SecIdentity *)a3 error:(id)a4
{
  __SecIdentity *encryptionIdentity;
  __SecIdentity *v8;
  MFError *encryptionIdentityError;

  encryptionIdentity = self->_encryptionIdentity;
  if (encryptionIdentity != a3)
  {
    if (encryptionIdentity)
      CFRelease(encryptionIdentity);
    if (a3)
      v8 = (__SecIdentity *)CFRetain(a3);
    else
      v8 = 0;
    self->_encryptionIdentity = v8;
  }
  encryptionIdentityError = self->_encryptionIdentityError;
  if (encryptionIdentityError != a4)
  {

    self->_encryptionIdentityError = (MFError *)a4;
  }
}

- (void)_nts_copyEncryptionIdentity:(__SecIdentity *)a3 error:(id *)a4 certificatesByRecipient:(id *)a5 errorsByRecipient:(id *)a6
{
  void *encryptionIdentity;
  id v12;
  id v13;

  if (a3)
  {
    encryptionIdentity = self->_encryptionIdentity;
    if (encryptionIdentity)
      encryptionIdentity = (void *)CFRetain(encryptionIdentity);
    *a3 = (__SecIdentity *)encryptionIdentity;
  }
  if (a4)
    *a4 = self->_encryptionIdentityError;
  if (a5)
  {
    v12 = (id)-[NSMutableDictionary count](self->_certificatesByRecipient, "count");
    if (v12)
      v12 = (id)-[NSMutableDictionary copy](self->_certificatesByRecipient, "copy");
    *a5 = v12;
  }
  if (a6)
  {
    v13 = (id)-[NSMutableDictionary count](self->_errorsByRecipient, "count");
    if (v13)
      v13 = (id)-[NSMutableDictionary copy](self->_errorsByRecipient, "copy");
    *a6 = v13;
  }
}

- (void)_notifyDelegateEncryptionStatusDidChange:(int)a3 certsByRecipient:(id)a4 errorsByRecipient:(id)a5 identity:(__SecIdentity *)a6 error:(id)a7
{
  uint64_t v11;
  MFSecureMIMECompositionManagerDelegate *v13;
  id v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  id v19;

  v11 = *(_QWORD *)&a3;
  v13 = -[MFSecureMIMECompositionManager delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return;
  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v15 = v14;
  if (a4)
    objc_msgSend(v14, "setObject:forKey:", a4, CFSTR("CertificatesByRecipient"));
  if (a5)
    objc_msgSend(v15, "setObject:forKey:", a5, CFSTR("ErrorsByRecipient"));
  if (a6)
  {
    v16 = CFSTR("IdentityRef");
    v17 = v15;
    v18 = a6;
LABEL_11:
    objc_msgSend(v17, "setObject:forKey:", v18, v16);
    goto LABEL_12;
  }
  if (a7)
  {
    v16 = CFSTR("IdentityError");
    v17 = v15;
    v18 = a7;
    goto LABEL_11;
  }
LABEL_12:
  if (objc_msgSend(v15, "count"))
  {
    v19 = v15;
  }
  else
  {

    v15 = 0;
  }
  -[MFSecureMIMECompositionManagerDelegate secureMIMECompositionManager:encryptionStatusDidChange:context:](v13, "secureMIMECompositionManager:encryptionStatusDidChange:context:", self, v11, v15);
}

- (int)encryptionStatus
{
  int encryptionStatus;

  -[NSLock lock](self->_lock, "lock");
  encryptionStatus = self->_encryptionStatus;
  -[NSLock unlock](self->_lock, "unlock");
  return encryptionStatus;
}

- (NSSet)recipients
{
  NSSet *v3;

  -[NSLock lock](self->_lock, "lock");
  v3 = (NSSet *)(id)-[NSMutableSet copy](self->_recipients, "copy");
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (id)compositionSpecification
{
  id v3;
  _BOOL8 v4;
  _BOOL8 v5;
  __SecIdentity *signingIdentity;
  __SecIdentity *encryptionIdentity;
  __SecIdentity *v8;
  void *v9;

  -[NSLock lock](self->_lock, "lock");
  if (*(_OWORD *)&self->_encryptionStatusSemaphore == 0
    && -[MFSecureMIMECompositionManager _shouldAllowSend_nts](self, "_shouldAllowSend_nts"))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = -[MFSecureMIMECompositionManager _shouldSign_nts](self, "_shouldSign_nts");
    v5 = -[MFSecureMIMECompositionManager _shouldEncrypt_nts](self, "_shouldEncrypt_nts");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4), CFSTR("ShouldSign"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5), CFSTR("ShouldEncrypt"));
    if (v4)
    {
      signingIdentity = self->_signingIdentity;
      if (!signingIdentity)
        -[MFSecureMIMECompositionManager compositionSpecification].cold.1();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", signingIdentity, CFSTR("SigningIdentity"));
      encryptionIdentity = self->_encryptionIdentity;
      if (encryptionIdentity)
        objc_msgSend(v3, "setObject:forKeyedSubscript:", encryptionIdentity, CFSTR("EncryptionIdentity"));
    }
    if (v5)
    {
      v8 = self->_encryptionIdentity;
      if (!v8)
        -[MFSecureMIMECompositionManager compositionSpecification].cold.2();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("EncryptionIdentity"));
      if (-[NSMutableDictionary count](self->_certificatesByRecipient, "count"))
      {
        v9 = (void *)-[NSMutableDictionary copy](self->_certificatesByRecipient, "copy");
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("RecipientCertificates"));

      }
    }
  }
  else
  {
    v3 = 0;
  }
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (BOOL)shouldAllowSend
{
  BOOL v3;

  -[NSLock lock](self->_lock, "lock");
  v3 = -[MFSecureMIMECompositionManager _shouldAllowSend_nts](self, "_shouldAllowSend_nts");
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (BOOL)_shouldSign_nts
{
  return self->_signingPolicy && self->_signingStatus == 0;
}

- (BOOL)_shouldEncrypt_nts
{
  return self->_encryptionPolicy && self->_encryptionStatus == 0;
}

- (BOOL)_shouldAllowSend_nts
{
  if (self->_signingPolicy == 2 && self->_signingStatus)
    return 0;
  if (self->_encryptionPolicy == 2)
    return self->_encryptionStatus == 0;
  return 1;
}

+ (__SecIdentity)copySigningIdentityForAccount:(id)a3 sendingAddress:(id)a4 error:(id *)a5
{
  __SecIdentity *v7;
  __SecIdentity *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v7 = +[MFMessageKeychainManager copyIdentityForPersistentReference:error:](MFMessageKeychainManager, "copyIdentityForPersistentReference:error:", objc_msgSend(a3, "signingIdentityPersistentReferenceForAddress:", a4), &v11);
  v8 = v7;
  if (a5 && !v7)
  {
    if (v11)
    {
      v12 = *MEMORY[0x1E0CB3388];
      v13[0] = v11;
      v9 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    }
    else
    {
      v9 = 0;
    }
    *a5 = +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), 1052, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", MFLookupLocalizedString((uint64_t)CFSTR("SMIME_MISSING_SIGNING_IDENTITY_FORMAT"), (uint64_t)CFSTR("You can’t send signed messages because a signing identity for the address “%@” could not be found.  Go to the Advanced settings for this account to choose a signing identity."), CFSTR("Delayed")), a4), 0, v9);
  }
  return v8;
}

+ (__SecIdentity)copyEncryptionIdentityForAccount:(id)a3 sendingAddress:(id)a4 error:(id *)a5
{
  __SecIdentity *v7;
  __SecIdentity *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v7 = +[MFMessageKeychainManager copyIdentityForPersistentReference:error:](MFMessageKeychainManager, "copyIdentityForPersistentReference:error:", objc_msgSend(a3, "encryptionIdentityPersistentReferenceForAddress:", a4), &v11);
  v8 = v7;
  if (a5 && !v7)
  {
    if (v11)
    {
      v12 = *MEMORY[0x1E0CB3388];
      v13[0] = v11;
      v9 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    }
    else
    {
      v9 = 0;
    }
    *a5 = +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), 1052, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", MFLookupLocalizedString((uint64_t)CFSTR("SMIME_MISSING_ENCRYPTION_IDENTITY_FORMAT"), (uint64_t)CFSTR("You can’t send encrypted messages because an encryption identity for the address “%@” could not be found.  Go to the Advanced settings for this account to choose an encryption identity."), CFSTR("Delayed")), a4), 0, v9);
  }
  return v8;
}

+ (id)copyEncryptionCertificatesForAccount:(id)a3 recipientAddress:(id)a4 error:(id *)a5
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  const __CFData *v13;
  SecCertificateRef v14;
  SecCertificateRef v15;
  NSObject *v16;
  __SecCertificate *v17;
  __SecCertificate *v18;
  uint64_t v20;
  uint64_t v21;
  id *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  MFError *v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t buf[16];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v27 = 0;
  v7 = (void *)objc_msgSend(a3, "copyDataForRemoteEncryptionCertificatesForAddress:error:", a4, &v27);
  if (objc_msgSend(v7, "count"))
  {
    v22 = a5;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(v7);
          v13 = *(const __CFData **)(*((_QWORD *)&v23 + 1) + 8 * i);
          v14 = SecCertificateCreateWithData(0, v13);
          if (v14)
          {
            v15 = v14;
            v27 = checkCertificateExpiration((uint64_t)v14, (uint64_t)a4);
            if (!v27)
              objc_msgSend(v8, "addObject:", v15);
            CFRelease(v15);
          }
          else
          {
            v16 = MFLogGeneral();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v13;
              _os_log_impl(&dword_1C8839000, v16, OS_LOG_TYPE_INFO, "#SMIMEErrors SecCertificateCreateWithData() failed for %@", buf, 0xCu);
            }
            v27 = +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), 1035, MFLookupLocalizedString((uint64_t)CFSTR("MIME_GENERIC_REMOTE_ENCRYPTION_CERT_MESSAGE"), (uint64_t)CFSTR("An error occurred while retrieving the encryption certificate."), CFSTR("Delayed")), 0, 0);
          }
        }
        v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v10);
    }
    if (!objc_msgSend(v8, "count"))
    {

      v8 = 0;
    }
    a5 = v22;
  }
  else
  {
    *(_QWORD *)buf = 0;
    v17 = +[MFMessageKeychainManager copyEncryptionCertificateForAddress:error:](MFMessageKeychainManager, "copyEncryptionCertificateForAddress:error:", a4, buf);
    if (v17)
    {
      v18 = v17;
      v27 = checkCertificateExpiration((uint64_t)v17, (uint64_t)a4);
      if (v27)
        v8 = 0;
      else
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v18, 0);
      CFRelease(v18);
    }
    else if (v27)
    {
      v8 = 0;
    }
    else
    {
      if (*(_QWORD *)buf)
      {
        v28 = *MEMORY[0x1E0CB3388];
        v29 = *(_QWORD *)buf;
        v20 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
        v21 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", MFLookupLocalizedString((uint64_t)CFSTR("SMIME_OTHER_ENCRYPTION_CERT_ERROR_MESSAGE"), (uint64_t)CFSTR("An error occurred while searching for an encryption certificate for “%@” in your keychain."), CFSTR("Delayed")), a4);
      }
      else
      {
        v21 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", MFLookupLocalizedString((uint64_t)CFSTR("SMIME_MISSING_ENCRYPTION_CERT_MESSAGE"), (uint64_t)CFSTR("You can’t send encrypted messages because an encryption certificate for the address “%@” could not be found."), CFSTR("Delayed")), a4);
        v20 = 0;
      }
      v8 = 0;
      v27 = +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), 1035, v21, MFLookupLocalizedString((uint64_t)CFSTR("SMIME_CANT_ENCRYPT_TITLE"), (uint64_t)CFSTR("Unable to Encrypt"), CFSTR("Delayed")), v20);
    }
  }

  if (a5 && !v8 && v27)
    *a5 = v27;
  return v8;
}

+ (BOOL)isRevokedCertificate:(__SecCertificate *)a3 sendingAddress:(id)a4
{
  void *v6;
  __SecPolicy *v7;
  __SecPolicy *v8;
  SecPolicyRef Revocation;
  SecPolicyRef v10;
  uint64_t v11;
  BOOL v12;
  NSObject *v13;
  _BOOL4 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  SecTrustRef trust;
  uint8_t buf[4];
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  v7 = +[MFMessageKeychainManager copySMIMESigningPolicyForAddress:](MFMessageKeychainManager, "copySMIMESigningPolicyForAddress:", a4);
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v6, "addObject:", v7);
    CFRelease(v8);
  }
  Revocation = SecPolicyCreateRevocation(3uLL);
  if (Revocation)
  {
    v10 = Revocation;
    objc_msgSend(v6, "addObject:", Revocation);
    CFRelease(v10);
  }
  trust = 0;
  v11 = SecTrustCreateWithCertificates(a3, v6, &trust);

  if ((_DWORD)v11)
    v12 = 1;
  else
    v12 = trust == 0;
  if (v12)
  {
    v13 = MFLogGeneral();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (v14)
    {
      +[MFSecureMIMECompositionManager isRevokedCertificate:sendingAddress:].cold.2(v11, v13, v15, v16, v17, v18, v19, v20);
LABEL_15:
      LOBYTE(v14) = 0;
    }
  }
  else
  {
    v21 = MEMORY[0x1CAA35A78]();
    CFRelease(trust);
    v22 = MFLogGeneral();
    v23 = v22;
    if ((_DWORD)v21)
    {
      v14 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
      if (v14)
      {
        +[MFSecureMIMECompositionManager isRevokedCertificate:sendingAddress:].cold.1(v21, v23, v24, v25, v26, v27, v28, v29);
        goto LABEL_15;
      }
    }
    else
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        v33 = 0;
        _os_log_impl(&dword_1C8839000, v23, OS_LOG_TYPE_INFO, "#SMIMEErrors Revocation check succeeded (SecTrustResultType: %d)", buf, 8u);
      }
      LOBYTE(v14) = 1;
    }
  }
  return v14;
}

- (void)_determineSigningStatusWithSendingAddress:.cold.1()
{
  __assert_rtn("-[MFSecureMIMECompositionManager _determineSigningStatusWithSendingAddress:]", "MFSecureMIMECompositionManager.m", 409, "_signingStatusSemaphore > 0");
}

- (void)_determineEncryptionStatusWithSendingAddress:.cold.1()
{
  __assert_rtn("-[MFSecureMIMECompositionManager _determineEncryptionStatusWithSendingAddress:]", "MFSecureMIMECompositionManager.m", 532, "_encryptionStatusSemaphore > 0");
}

- (void)_determineEncryptionStatusWithNewRecipients:.cold.1()
{
  __assert_rtn("-[MFSecureMIMECompositionManager _determineEncryptionStatusWithNewRecipients:]", "MFSecureMIMECompositionManager.m", 583, "_encryptionStatusSemaphore > 0");
}

- (void)compositionSpecification
{
  __assert_rtn("-[MFSecureMIMECompositionManager compositionSpecification]", "MFSecureMIMECompositionManager.m", 777, "_encryptionIdentity");
}

+ (void)isRevokedCertificate:(uint64_t)a3 sendingAddress:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1C8839000, a2, a3, "#SMIMEErrors Revocation check failed with status %ld", a5, a6, a7, a8, 0);
}

+ (void)isRevokedCertificate:(uint64_t)a3 sendingAddress:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_1C8839000, a2, a3, "#SMIMEErrors SecTrustCreateWithCertificates returned %ld", a5, a6, a7, a8, 0);
}

@end
