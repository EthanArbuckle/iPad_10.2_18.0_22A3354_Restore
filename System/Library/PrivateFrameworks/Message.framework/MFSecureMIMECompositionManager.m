@implementation MFSecureMIMECompositionManager

- (MFSecureMIMECompositionManager)init
{
  return -[MFSecureMIMECompositionManager initWithSendingAccount:signingPolicy:encryptionPolicy:](self, "initWithSendingAccount:signingPolicy:encryptionPolicy:", 0, 0, 0);
}

- (MFSecureMIMECompositionManager)initWithSigningPolicy:(int64_t)a3 encryptionPolicy:(int64_t)a4
{
  return -[MFSecureMIMECompositionManager initWithSendingAccount:signingPolicy:encryptionPolicy:](self, "initWithSendingAccount:signingPolicy:encryptionPolicy:", 0, a3, a4);
}

- (MFSecureMIMECompositionManager)initWithSendingAccount:(id)a3 signingPolicy:(int64_t)a4 encryptionPolicy:(int64_t)a5
{
  id v9;
  MFSecureMIMECompositionManager *v10;
  uint64_t v11;
  NSLock *lock;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  uint64_t v15;
  objc_super v17;

  v9 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MFSecureMIMECompositionManager;
  v10 = -[MFSecureMIMECompositionManager init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D460A8]), "initWithName:andDelegate:", CFSTR("MFSecureMIMECompositionManager_lock"), 0);
    lock = v10->_lock;
    v10->_lock = (NSLock *)v11;

    v13 = dispatch_queue_create("com.apple.mobilemail.MFSecureMIMECompositionManagerQueue", 0);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v10->_sendingAccount, a3);
    v10->_signingPolicy = a4;
    v10->_encryptionPolicy = a5;
    if (a4)
    {
      if (v10->_signingStatusSemaphore)
        v15 = 1;
      else
        v15 = 2 * (v10->_signingIdentity == 0);
    }
    else
    {
      v15 = 2;
    }
    v10->_signingStatus = v15;
    -[MFSecureMIMECompositionManager _updateEncryptionStatus_nts]((_BOOL8)v10);
  }

  return v10;
}

- (BOOL)_updateEncryptionStatus_nts
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (result)
  {
    v1 = result;
    v2 = *(_QWORD *)(result + 120);
    if (*(_QWORD *)(result + 104))
    {
      if (*(_QWORD *)(result + 128))
      {
        v3 = 1;
LABEL_9:
        *(_QWORD *)(v1 + 120) = v3;
        return v2 != v3;
      }
      if (*(_QWORD *)(result + 56))
      {
        v4 = objc_msgSend(*(id *)(result + 72), "count");
        if (v4 == objc_msgSend(*(id *)(v1 + 88), "count"))
        {
          v3 = 0;
          goto LABEL_9;
        }
      }
    }
    v3 = 2;
    goto LABEL_9;
  }
  return result;
}

- (void)dealloc
{
  __SecIdentity *signingIdentity;
  __SecIdentity *encryptionIdentity;
  objc_super v5;

  signingIdentity = self->_signingIdentity;
  if (signingIdentity)
    CFRelease(signingIdentity);
  encryptionIdentity = self->_encryptionIdentity;
  if (encryptionIdentity)
    CFRelease(encryptionIdentity);
  v5.receiver = self;
  v5.super_class = (Class)MFSecureMIMECompositionManager;
  -[MFSecureMIMECompositionManager dealloc](&v5, sel_dealloc);
}

- (void)addRecipients:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 updated;
  _BOOL4 v7;
  int64_t encryptionStatus;
  NSMutableSet *recipients;
  NSMutableSet *v10;
  NSMutableSet *v11;
  int64_t encryptionPolicy;
  NSObject *queue;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_msgSend(v4, "copy");
    -[NSLock lock](self->_lock, "lock");
    if (self->_invalidated)
    {
      updated = 0;
      v7 = 0;
      encryptionStatus = 0xAAAAAAAAAAAAAAAALL;
    }
    else
    {
      recipients = self->_recipients;
      if (!recipients)
      {
        v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
        v11 = self->_recipients;
        self->_recipients = v10;

        recipients = self->_recipients;
      }
      -[NSMutableSet unionSet:](recipients, "unionSet:", v5);
      encryptionPolicy = self->_encryptionPolicy;
      v7 = encryptionPolicy != 0;
      if (encryptionPolicy)
        ++self->_encryptionStatusSemaphore;
      updated = -[MFSecureMIMECompositionManager _updateEncryptionStatus_nts]((_BOOL8)self);
      encryptionStatus = self->_encryptionStatus;
    }
    -[NSLock unlock](self->_lock, "unlock");
    if (updated)
      -[MFSecureMIMECompositionManager _notifyDelegateEncryptionStatusDidChange:certsByRecipient:errorsByRecipient:identity:error:](self, encryptionStatus, 0, 0, 0, 0);
    if (v7)
    {
      queue = self->_queue;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __48__MFSecureMIMECompositionManager_addRecipients___block_invoke;
      v14[3] = &unk_1E4E88EE8;
      v14[4] = self;
      v15 = v5;
      dispatch_async(queue, v14);

    }
  }

}

- (void)_notifyDelegateEncryptionStatusDidChange:(void *)a3 certsByRecipient:(void *)a4 errorsByRecipient:(id)a5 identity:(void *)a6 error:
{
  id v11;
  id v12;
  void *v13;
  id v14;
  const __CFString *v15;
  id v16;

  v16 = a3;
  v11 = a4;
  v12 = a6;
  if (a1)
  {
    objc_msgSend(a1, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
LABEL_15:

      goto LABEL_16;
    }
    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (v16)
      objc_msgSend(v14, "setObject:forKey:", v16, CFSTR("CertificatesByRecipient"));
    if (v11)
      objc_msgSend(v14, "setObject:forKey:", v11, CFSTR("ErrorsByRecipient"));
    if (a5)
    {
      v15 = CFSTR("IdentityRef");
    }
    else
    {
      if (!v12)
      {
LABEL_12:
        if (!objc_msgSend(v14, "count"))
        {

          v14 = 0;
        }
        objc_msgSend(v13, "secureMIMECompositionManager:encryptionStatusDidChange:context:", a1, a2, v14);

        goto LABEL_15;
      }
      v15 = CFSTR("IdentityError");
      a5 = v12;
    }
    objc_msgSend(v14, "setObject:forKey:", a5, v15);
    goto LABEL_12;
  }
LABEL_16:

}

void __48__MFSecureMIMECompositionManager_addRecipients___block_invoke(uint64_t a1)
{
  -[MFSecureMIMECompositionManager _determineEncryptionStatusWithNewRecipients:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (void)_determineEncryptionStatusWithNewRecipients:(uint64_t)a1
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  _BOOL4 updated;
  id v29;
  id v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  CFTypeRef cf;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v29 = a2;
  if (a1)
  {
    cf = 0;
    v3 = (void *)objc_opt_class();
    v4 = *(_QWORD *)(a1 + 24);
    objc_msgSend(v29, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0;
    v6 = (void *)objc_msgSend(v3, "copyEncryptionCertificatesForAccount:recipientAddresses:errorsByAddress:", v4, v5, &v37);
    v7 = v37;
    v8 = (void *)objc_msgSend(v6, "mutableCopy");

    v9 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(*(id *)(a1 + 8), "lock");
    v10 = *(_QWORD *)(a1 + 128);
    if (!v10)
      __assert_rtn("-[MFSecureMIMECompositionManager _determineEncryptionStatusWithNewRecipients:]", "MFSecureMIMECompositionManager.m", 571, "_encryptionStatusSemaphore > 0");
    *(_QWORD *)(a1 + 128) = v10 - 1;
    if (*(_BYTE *)(a1 + 144))
    {
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 1;
    }
    else
    {
      v16 = (void *)objc_msgSend(v29, "mutableCopy");
      objc_msgSend(v16, "minusSet:", *(_QWORD *)(a1 + 72));
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v17 = v16;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v34 != v19)
              objc_enumerationMutation(v17);
            v21 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
            objc_msgSend(v8, "removeObjectForKey:", v21, v29);
            objc_msgSend(v9, "removeObjectForKey:", v21);
          }
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
        }
        while (v18);
      }

      v22 = *(void **)(a1 + 80);
      if (!v22)
      {
        v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v24 = *(void **)(a1 + 80);
        *(_QWORD *)(a1 + 80) = v23;

        v22 = *(void **)(a1 + 80);
      }
      objc_msgSend(v22, "addEntriesFromDictionary:", v9, v29);
      v25 = *(void **)(a1 + 88);
      if (!v25)
      {
        v26 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v27 = *(void **)(a1 + 88);
        *(_QWORD *)(a1 + 88) = v26;

        v25 = *(void **)(a1 + 88);
      }
      objc_msgSend(v25, "addEntriesFromDictionary:", v8);
      if (*(_QWORD *)(a1 + 128))
      {
        v11 = 0;
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 1;
      }
      else
      {
        updated = -[MFSecureMIMECompositionManager _updateEncryptionStatus_nts](a1);
        v15 = *(_QWORD *)(a1 + 120);
        if (updated)
        {
          v31 = 0;
          v32 = 0;
          v30 = 0;
          -[MFSecureMIMECompositionManager _nts_copyEncryptionIdentity:error:certificatesByRecipient:errorsByRecipient:](a1, &cf, &v32, &v31, &v30);
          v14 = v32;
          v13 = v31;
          v12 = v30;
          v11 = 1;
        }
        else
        {
          v11 = 0;
          v12 = 0;
          v13 = 0;
          v14 = 0;
        }
      }

    }
    objc_msgSend(*(id *)(a1 + 8), "unlock", v29);
    if (v11)
      -[MFSecureMIMECompositionManager _notifyDelegateEncryptionStatusDidChange:certsByRecipient:errorsByRecipient:identity:error:]((void *)a1, v15, v13, v12, (id)cf, v14);
    if (cf)
      CFRelease(cf);

  }
}

- (void)removeRecipients:(id)a3
{
  int v4;
  void *v5;
  void *v6;
  void *v7;
  MFError *v8;
  int64_t encryptionStatus;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __SecIdentity *encryptionIdentity;
  id v15;

  v15 = a3;
  -[NSLock lock](self->_lock, "lock");
  if (self->_invalidated)
  {
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    encryptionStatus = 0xAAAAAAAAAAAAAAAALL;
    goto LABEL_21;
  }
  objc_msgSend(v15, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[NSMutableDictionary count](self->_errorsByRecipient, "count");
  v12 = -[NSMutableDictionary count](self->_certificatesByRecipient, "count");
  -[NSMutableSet minusSet:](self->_recipients, "minusSet:", v15);
  -[NSMutableDictionary removeObjectsForKeys:](self->_errorsByRecipient, "removeObjectsForKeys:", v10);
  -[NSMutableDictionary removeObjectsForKeys:](self->_certificatesByRecipient, "removeObjectsForKeys:", v10);
  if (!self->_encryptionStatusSemaphore)
  {
    if (-[MFSecureMIMECompositionManager _updateEncryptionStatus_nts]((_BOOL8)self)
      || -[NSMutableDictionary count](self->_certificatesByRecipient, "count") != v12)
    {
      encryptionStatus = self->_encryptionStatus;
    }
    else
    {
      v13 = -[NSMutableDictionary count](self->_errorsByRecipient, "count");
      encryptionStatus = self->_encryptionStatus;
      if (v13 == v11)
      {
        v4 = 0;
        v5 = 0;
        v6 = 0;
        v7 = 0;
        v8 = 0;
        goto LABEL_20;
      }
    }
    if (-[NSMutableDictionary count](self->_errorsByRecipient, "count"))
      v5 = (void *)-[NSMutableDictionary copy](self->_errorsByRecipient, "copy");
    else
      v5 = 0;
    if (-[NSMutableDictionary count](self->_certificatesByRecipient, "count"))
      v6 = (void *)-[NSMutableDictionary copy](self->_certificatesByRecipient, "copy");
    else
      v6 = 0;
    encryptionIdentity = self->_encryptionIdentity;
    if (encryptionIdentity)
    {
      v7 = (void *)CFRetain(encryptionIdentity);
      v8 = 0;
    }
    else
    {
      v8 = self->_encryptionIdentityError;
      v7 = 0;
    }
    v4 = 1;
    goto LABEL_20;
  }
  v4 = 0;
  v5 = 0;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  encryptionStatus = 0xAAAAAAAAAAAAAAAALL;
LABEL_20:

LABEL_21:
  -[NSLock unlock](self->_lock, "unlock");
  if (v4)
    -[MFSecureMIMECompositionManager _notifyDelegateEncryptionStatusDidChange:certsByRecipient:errorsByRecipient:identity:error:](self, encryptionStatus, v6, v5, v7, v8);
  if (v7)
    CFRelease(v7);

}

- (void)invalidate
{
  -[NSLock lock](self->_lock, "lock");
  objc_storeWeak((id *)&self->_delegate, 0);
  self->_invalidated = 1;
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)setDelegate:(id)a3
{
  id obj;

  obj = a3;
  -[NSLock lock](self->_lock, "lock");
  objc_storeWeak((id *)&self->_delegate, obj);
  -[NSLock unlock](self->_lock, "unlock");

}

- (MFSecureMIMECompositionManagerDelegate)delegate
{
  id WeakRetained;

  -[NSLock lock](self->_lock, "lock");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[NSLock unlock](self->_lock, "unlock");
  return (MFSecureMIMECompositionManagerDelegate *)WeakRetained;
}

- (void)setSendingAddress:(id)a3
{
  id v4;
  _BOOL4 v5;
  _BOOL4 updated;
  _BOOL4 v7;
  int v8;
  void *v9;
  int64_t encryptionStatus;
  int64_t v11;
  NSObject *queue;
  NSString *sendingAddress;
  unint64_t signingStatusSemaphore;
  int64_t signingStatus;
  _QWORD v16[5];
  id v17;
  id v18;
  BOOL v19;
  char v20;

  v4 = a3;
  -[NSLock lock](self->_lock, "lock");
  if (self->_invalidated || -[NSString isEqualToString:](self->_sendingAddress, "isEqualToString:", v4))
  {
    v5 = 0;
    updated = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    encryptionStatus = 0xAAAAAAAAAAAAAAAALL;
    v11 = 0xAAAAAAAAAAAAAAAALL;
  }
  else
  {
    v9 = (void *)objc_msgSend(v4, "copy");
    objc_storeStrong((id *)&self->_sendingAddress, v9);
    if (self->_signingPolicy)
    {
      sendingAddress = self->_sendingAddress;
      v7 = sendingAddress != 0;
      signingStatusSemaphore = self->_signingStatusSemaphore;
      if (sendingAddress)
        self->_signingStatusSemaphore = ++signingStatusSemaphore;
      signingStatus = self->_signingStatus;
      if (signingStatusSemaphore)
        v11 = 1;
      else
        v11 = 2 * (self->_signingIdentity == 0);
    }
    else
    {
      v7 = 0;
      signingStatus = self->_signingStatus;
      v11 = 2;
    }
    self->_signingStatus = v11;
    v5 = signingStatus != v11;
    if (self->_encryptionPolicy && self->_sendingAddress)
    {
      ++self->_encryptionStatusSemaphore;
      v8 = 1;
    }
    else
    {
      v8 = 0;
    }
    updated = -[MFSecureMIMECompositionManager _updateEncryptionStatus_nts]((_BOOL8)self);
    encryptionStatus = self->_encryptionStatus;
  }
  -[NSLock unlock](self->_lock, "unlock");
  if (v5)
    -[MFSecureMIMECompositionManager _notifyDelegateSigningStatusDidChange:identity:error:](self, v11, 0, 0);
  if (updated)
    -[MFSecureMIMECompositionManager _notifyDelegateEncryptionStatusDidChange:certsByRecipient:errorsByRecipient:identity:error:](self, encryptionStatus, 0, 0, 0, 0);
  if ((v7 | v8) == 1)
  {
    queue = self->_queue;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __52__MFSecureMIMECompositionManager_setSendingAddress___block_invoke;
    v16[3] = &unk_1E4E8E9F8;
    v16[4] = self;
    v17 = v9;
    v19 = v7;
    v20 = v8;
    v18 = v4;
    dispatch_async(queue, v16);

  }
}

- (void)_notifyDelegateSigningStatusDidChange:(uint64_t)a3 identity:(void *)a4 error:
{
  id v7;
  void *v8;
  const __CFString **v9;
  id *v10;
  void *v11;
  const __CFString *v12;
  id v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (a1)
  {
    objc_msgSend(a1, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
LABEL_9:

      goto LABEL_10;
    }
    if (a3)
    {
      v14 = CFSTR("IdentityRef");
      v15[0] = a3;
      v9 = &v14;
      v10 = (id *)v15;
    }
    else
    {
      if (!v7)
      {
        v11 = 0;
        goto LABEL_8;
      }
      v12 = CFSTR("IdentityError");
      v13 = v7;
      v9 = &v12;
      v10 = &v13;
    }
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
    objc_msgSend(v8, "secureMIMECompositionManager:signingStatusDidChange:context:", a1, a2, v11);

    goto LABEL_9;
  }
LABEL_10:

}

void __52__MFSecureMIMECompositionManager_setSendingAddress___block_invoke(uint64_t a1)
{
  -[MFSecureMIMECompositionManager _determineIdentitiesWithSendingAddress:forSigning:encryption:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(unsigned __int8 *)(a1 + 56), 1);
  if (*(_BYTE *)(a1 + 56))
    -[MFSecureMIMECompositionManager _determineSigningStatusWithSendingAddress:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  if (*(_BYTE *)(a1 + 57))
    -[MFSecureMIMECompositionManager _determineEncryptionStatusWithSendingAddress:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 48));
}

- (void)_determineIdentitiesWithSendingAddress:(int)a3 forSigning:(int)a4 encryption:
{
  id v7;
  void *v8;
  uint64_t v9;
  const void *v10;
  id v11;
  id v12;
  const void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;

  v7 = a2;
  if (!a1)
    goto LABEL_17;
  if (!a3)
  {
    v10 = 0;
    v11 = 0;
    if (!a4)
      goto LABEL_4;
LABEL_6:
    v14 = (void *)objc_opt_class();
    v15 = *(_QWORD *)(a1 + 24);
    v16 = 0;
    v13 = (const void *)objc_msgSend(v14, "copyEncryptionIdentityForAccount:sendingAddress:error:", v15, v7, &v16);
    v12 = v16;
    goto LABEL_7;
  }
  v8 = (void *)objc_opt_class();
  v9 = *(_QWORD *)(a1 + 24);
  v17 = 0;
  v10 = (const void *)objc_msgSend(v8, "copySigningIdentityForAccount:sendingAddress:error:", v9, v7, &v17);
  v11 = v17;
  if (a4)
    goto LABEL_6;
LABEL_4:
  v12 = 0;
  v13 = 0;
LABEL_7:
  objc_msgSend(*(id *)(a1 + 8), "lock");
  if (!*(_BYTE *)(a1 + 144))
  {
    if (a3)
      -[MFSecureMIMECompositionManager _nts_setSigningIdentity:error:](a1, v10, v11);
    if (a4)
      -[MFSecureMIMECompositionManager _nts_setEncryptionIdentity:error:](a1, v13, v12);
  }
  objc_msgSend(*(id *)(a1 + 8), "unlock");
  if (v10)
    CFRelease(v10);
  if (v13)
    CFRelease(v13);

LABEL_17:
}

- (void)_determineSigningStatusWithSendingAddress:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  CFTypeRef v5;
  _BOOL4 v6;
  id v7;
  const void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD block[5];
  id v13;
  CFTypeRef v14;

  v3 = a2;
  if (!a1)
    goto LABEL_16;
  objc_msgSend(*(id *)(a1 + 8), "lock");
  v4 = *(_QWORD *)(a1 + 136);
  if (!v4)
    __assert_rtn("-[MFSecureMIMECompositionManager _determineSigningStatusWithSendingAddress:]", "MFSecureMIMECompositionManager.m", 417, "_signingStatusSemaphore > 0");
  *(_QWORD *)(a1 + 136) = v4 - 1;
  if (*(_BYTE *)(a1 + 144))
  {
    v5 = 0;
    v6 = 0;
    v7 = 0;
  }
  else
  {
    v8 = *(const void **)(a1 + 40);
    if (v8)
      v5 = CFRetain(v8);
    else
      v5 = 0;
    v7 = objc_retainAutorelease(*(id *)(a1 + 48));
    if (!*(_QWORD *)(a1 + 136))
    {
      if (v5)
      {
        dispatch_get_global_queue(0, 0);
        v10 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __76__MFSecureMIMECompositionManager__determineSigningStatusWithSendingAddress___block_invoke;
        block[3] = &unk_1E4E8AD18;
        block[4] = a1;
        v14 = v5;
        v13 = v3;
        dispatch_async(v10, block);

      }
      v11 = *(_QWORD *)(a1 + 112);
      if (*(_QWORD *)(a1 + 96))
      {
        if (*(_QWORD *)(a1 + 136))
          v9 = 1;
        else
          v9 = 2 * (*(_QWORD *)(a1 + 40) == 0);
      }
      else
      {
        v9 = 2;
      }
      *(_QWORD *)(a1 + 112) = v9;
      v6 = v11 != v9;
      goto LABEL_11;
    }
    v6 = 0;
  }
  v9 = 1;
LABEL_11:
  objc_msgSend(*(id *)(a1 + 8), "unlock");
  if (v6)
    -[MFSecureMIMECompositionManager _notifyDelegateSigningStatusDidChange:identity:error:]((void *)a1, v9, (uint64_t)v5, v7);
  if (v5)
    CFRelease(v5);

LABEL_16:
}

- (void)_determineEncryptionStatusWithSendingAddress:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  id v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  _BOOL4 updated;
  id v12;
  id v13;
  id v14;
  CFTypeRef cf;

  v3 = a2;
  if (a1)
  {
    cf = 0;
    objc_msgSend(*(id *)(a1 + 8), "lock");
    v4 = *(_QWORD *)(a1 + 128);
    if (!v4)
      __assert_rtn("-[MFSecureMIMECompositionManager _determineEncryptionStatusWithSendingAddress:]", "MFSecureMIMECompositionManager.m", 533, "_encryptionStatusSemaphore > 0");
    v5 = 0;
    v6 = 0;
    v7 = 1;
    v8 = v4 - 1;
    *(_QWORD *)(a1 + 128) = v8;
    if (v8)
    {
      v9 = 0;
      v10 = 0;
    }
    else
    {
      v9 = 0;
      v10 = 0;
      if (!*(_BYTE *)(a1 + 144))
      {
        updated = -[MFSecureMIMECompositionManager _updateEncryptionStatus_nts](a1);
        v7 = *(_QWORD *)(a1 + 120);
        if (updated)
        {
          v13 = 0;
          v14 = 0;
          v12 = 0;
          -[MFSecureMIMECompositionManager _nts_copyEncryptionIdentity:error:certificatesByRecipient:errorsByRecipient:](a1, &cf, &v14, &v13, &v12);
          v10 = v14;
          v9 = v13;
          v5 = v12;
          v6 = 1;
        }
        else
        {
          v6 = 0;
          v5 = 0;
          v9 = 0;
          v10 = 0;
        }
      }
    }
    objc_msgSend(*(id *)(a1 + 8), "unlock");
    if (v6)
      -[MFSecureMIMECompositionManager _notifyDelegateEncryptionStatusDidChange:certsByRecipient:errorsByRecipient:identity:error:]((void *)a1, v7, v9, v5, (id)cf, v10);
    if (cf)
      CFRelease(cf);

  }
}

- (NSString)sendingAddress
{
  NSString *v3;

  -[NSLock lock](self->_lock, "lock");
  v3 = self->_sendingAddress;
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (MailAccount)sendingAccount
{
  return self->_sendingAccount;
}

- (int64_t)signingPolicy
{
  return self->_signingPolicy;
}

- (int64_t)encryptionPolicy
{
  return self->_encryptionPolicy;
}

- (void)_nts_setSigningIdentity:(void *)a3 error:
{
  id v6;
  const void *v7;
  CFTypeRef v8;
  id v9;

  v6 = a3;
  if (a1)
  {
    v9 = v6;
    v7 = *(const void **)(a1 + 40);
    if (v7 != a2)
    {
      if (v7)
        CFRelease(v7);
      if (a2)
        v8 = CFRetain(a2);
      else
        v8 = 0;
      *(_QWORD *)(a1 + 40) = v8;
    }
    objc_storeStrong((id *)(a1 + 48), a3);
    v6 = v9;
  }

}

- (void)_nts_setEncryptionIdentity:(void *)a3 error:
{
  id v6;
  const void *v7;
  CFTypeRef v8;
  id v9;

  v6 = a3;
  if (a1)
  {
    v9 = v6;
    v7 = *(const void **)(a1 + 56);
    if (v7 != a2)
    {
      if (v7)
        CFRelease(v7);
      if (a2)
        v8 = CFRetain(a2);
      else
        v8 = 0;
      *(_QWORD *)(a1 + 56) = v8;
    }
    objc_storeStrong((id *)(a1 + 64), a3);
    v6 = v9;
  }

}

- (void)_determineTrustStatusForSigningIdentity:(void *)a3 sendingAddress:
{
  id v5;
  OSStatus v6;
  unsigned int v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  const void *v13;
  uint64_t v14;
  _QWORD v15[5];
  NSObject *v16;
  uint64_t v17;
  SecCertificateRef certificateRef;

  v5 = a3;
  if (a1)
  {
    certificateRef = 0;
    v6 = SecIdentityCopyCertificate(a2, &certificateRef);
    if (!certificateRef)
    {
      v12 = v6;
      MFLogGeneral();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[MFSecureMIMECompositionManager _determineTrustStatusForSigningIdentity:sendingAddress:].cold.1((uint64_t)v5, v12, v8);
      goto LABEL_11;
    }
    v7 = objc_msgSend((id)objc_opt_class(), "evaluateTrustForSigningCertificate:sendingAddress:", certificateRef, v5);
    CFRelease(certificateRef);
    if (v7 <= 7 && ((1 << v7) & 0xCD) != 0)
    {
      +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1052, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 8), "lock");
      if (!*(_QWORD *)(a1 + 136) && (v13 = *(const void **)(a1 + 40)) != 0 && CFEqual(a2, v13))
      {
        -[MFSecureMIMECompositionManager _nts_setSigningIdentity:error:](a1, 0, v8);
        v14 = *(_QWORD *)(a1 + 112);
        if (*(_QWORD *)(a1 + 96))
        {
          if (*(_QWORD *)(a1 + 136))
            v10 = 1;
          else
            v10 = 2 * (*(_QWORD *)(a1 + 40) == 0);
        }
        else
        {
          v10 = 2;
        }
        *(_QWORD *)(a1 + 112) = v10;
        v9 = v14 != v10;
      }
      else
      {
        v9 = 0;
        v10 = 1;
      }
      objc_msgSend(*(id *)(a1 + 8), "unlock");
      if (v9)
      {
        v11 = *(NSObject **)(a1 + 16);
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __89__MFSecureMIMECompositionManager__determineTrustStatusForSigningIdentity_sendingAddress___block_invoke;
        v15[3] = &unk_1E4E8AD18;
        v15[4] = a1;
        v17 = v10;
        v8 = v8;
        v16 = v8;
        dispatch_async(v11, v15);

      }
LABEL_11:

    }
  }

}

void __89__MFSecureMIMECompositionManager__determineTrustStatusForSigningIdentity_sendingAddress___block_invoke(uint64_t a1)
{
  -[MFSecureMIMECompositionManager _notifyDelegateSigningStatusDidChange:identity:error:](*(void **)(a1 + 32), *(_QWORD *)(a1 + 48), 0, *(void **)(a1 + 40));
}

void __76__MFSecureMIMECompositionManager__determineSigningStatusWithSendingAddress___block_invoke(uint64_t a1)
{
  -[MFSecureMIMECompositionManager _determineTrustStatusForSigningIdentity:sendingAddress:](*(_QWORD *)(a1 + 32), *(__SecIdentity **)(a1 + 48), *(void **)(a1 + 40));
}

- (int64_t)signingStatus
{
  int64_t signingStatus;

  -[NSLock lock](self->_lock, "lock");
  signingStatus = self->_signingStatus;
  -[NSLock unlock](self->_lock, "unlock");
  return signingStatus;
}

- (void)_nts_copyEncryptionIdentity:(_QWORD *)a3 error:(_QWORD *)a4 certificatesByRecipient:(_QWORD *)a5 errorsByRecipient:
{
  CFTypeRef v10;
  id v11;
  id v12;

  if (a1)
  {
    if (a2)
    {
      v10 = *(CFTypeRef *)(a1 + 56);
      if (v10)
        v10 = CFRetain(v10);
      *a2 = v10;
    }
    if (a3)
      *a3 = objc_retainAutorelease(*(id *)(a1 + 64));
    if (a4)
    {
      if (!objc_msgSend(*(id *)(a1 + 88), "count"))
      {
        *a4 = 0;
        if (!a5)
          return;
        goto LABEL_12;
      }
      v11 = objc_retainAutorelease((id)objc_msgSend(*(id *)(a1 + 88), "copy"));
      *a4 = v11;

    }
    if (!a5)
      return;
LABEL_12:
    if (objc_msgSend(*(id *)(a1 + 80), "count"))
    {
      v12 = objc_retainAutorelease((id)objc_msgSend(*(id *)(a1 + 80), "copy"));
      *a5 = v12;

    }
    else
    {
      *a5 = 0;
    }
  }
}

- (int64_t)encryptionStatus
{
  int64_t encryptionStatus;

  -[NSLock lock](self->_lock, "lock");
  encryptionStatus = self->_encryptionStatus;
  -[NSLock unlock](self->_lock, "unlock");
  return encryptionStatus;
}

- (NSSet)recipients
{
  void *v3;

  -[NSLock lock](self->_lock, "lock");
  v3 = (void *)-[NSMutableSet copy](self->_recipients, "copy");
  -[NSLock unlock](self->_lock, "unlock");
  return (NSSet *)v3;
}

- (id)compositionSpecification
{
  void *v3;
  id v5;
  _BOOL8 v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  __SecIdentity *signingIdentity;
  __SecIdentity *encryptionIdentity;
  __SecIdentity *v12;
  void *v13;
  const char *v14;
  int v15;

  -[NSLock lock](self->_lock, "lock");
  if (*(_OWORD *)&self->_encryptionStatusSemaphore == 0
    && (self->_signingPolicy != 2 || !self->_signingStatus)
    && (self->_encryptionPolicy != 2 || !self->_encryptionStatus))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (self->_signingPolicy)
      v6 = self->_signingStatus == 0;
    else
      v6 = 0;
    if (self->_encryptionPolicy)
      v7 = self->_encryptionStatus == 0;
    else
      v7 = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("ShouldSign"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("ShouldEncrypt"));

    if (v6)
    {
      signingIdentity = self->_signingIdentity;
      if (!signingIdentity)
      {
        v14 = "_signingIdentity";
        v15 = 735;
        goto LABEL_25;
      }
      objc_msgSend(v5, "setObject:forKeyedSubscript:", signingIdentity, CFSTR("SigningIdentity"));
      encryptionIdentity = self->_encryptionIdentity;
      if (encryptionIdentity)
        objc_msgSend(v5, "setObject:forKeyedSubscript:", encryptionIdentity, CFSTR("EncryptionIdentity"));
    }
    if (!v7)
    {
LABEL_22:
      v3 = v5;
      goto LABEL_3;
    }
    v12 = self->_encryptionIdentity;
    if (v12)
    {
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("EncryptionIdentity"));
      if (-[NSMutableDictionary count](self->_certificatesByRecipient, "count"))
      {
        v13 = (void *)-[NSMutableDictionary copy](self->_certificatesByRecipient, "copy");
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("RecipientCertificates"));

      }
      goto LABEL_22;
    }
    v14 = "_encryptionIdentity";
    v15 = 746;
LABEL_25:
    __assert_rtn("-[MFSecureMIMECompositionManager compositionSpecification]", "MFSecureMIMECompositionManager.m", v15, v14);
  }
  v3 = 0;
LABEL_3:
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (BOOL)shouldAllowSend
{
  BOOL v3;

  -[NSLock lock](self->_lock, "lock");
  v3 = (self->_signingPolicy != 2 || !self->_signingStatus)
    && (self->_encryptionPolicy != 2 || self->_encryptionStatus == 0);
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

+ (__SecIdentity)copySigningIdentityForAccount:(id)a3 sendingAddress:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  __SecIdentity *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  objc_msgSend(a3, "signingIdentityPersistentReferenceForAddress:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v9 = +[MFMessageKeychainManager copyIdentityForPersistentReference:error:](MFMessageKeychainManager, "copyIdentityForPersistentReference:error:", v8, &v17);
  v10 = v17;
  v11 = v10;
  if (a5 && !v9)
  {
    if (v10)
    {
      v18 = *MEMORY[0x1E0CB3388];
      v19[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    v13 = (void *)MEMORY[0x1E0CB3940];
    MFLookupLocalizedString(CFSTR("SMIME_MISSING_SIGNING_IDENTITY_FORMAT"), CFSTR("You can’t send signed messages because a signing identity for the address “%@” could not be found. Go to the Advanced settings for this account to choose a signing identity."), CFSTR("Delayed"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", v14, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), 1052, v15, 0, v12);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

+ (__SecIdentity)copyEncryptionIdentityForAccount:(id)a3 sendingAddress:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  __SecIdentity *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  objc_msgSend(a3, "encryptionIdentityPersistentReferenceForAddress:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v9 = +[MFMessageKeychainManager copyIdentityForPersistentReference:error:](MFMessageKeychainManager, "copyIdentityForPersistentReference:error:", v8, &v17);
  v10 = v17;
  v11 = v10;
  if (a5 && !v9)
  {
    if (v10)
    {
      v18 = *MEMORY[0x1E0CB3388];
      v19[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    v13 = (void *)MEMORY[0x1E0CB3940];
    MFLookupLocalizedString(CFSTR("SMIME_MISSING_ENCRYPTION_IDENTITY_FORMAT"), CFSTR("You can’t send encrypted messages because an encryption identity for the address “%@” could not be found. Go to the Advanced settings for this account to choose an encryption identity."), CFSTR("Delayed"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", v14, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), 1052, v15, 0, v12);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

+ (id)copyEncryptionCertificatesForAccount:(id)a3 recipientAddresses:(id)a4 errorsByAddress:(id *)a5
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const __CFData *v14;
  SecCertificateRef v15;
  SecCertificateRef v16;
  NSObject *v17;
  void *v18;
  __SecCertificate *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v30;
  uint64_t v31;
  id obj;
  id v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  id v37;
  uint64_t i;
  void *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  uint8_t buf[4];
  const __CFData *v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v49 = 0;
  v30 = a4;
  v35 = (void *)objc_msgSend(a3, "copyDataForRemoteEncryptionCertificatesForAddresses:errors:");
  v37 = 0;
  if (!v37)
    v37 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v33 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v30;
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
  if (v36)
  {
    v34 = *(_QWORD *)v46;
    v31 = *MEMORY[0x1E0CB3388];
    do
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v46 != v34)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v35, "objectForKeyedSubscript:", v6);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        if (objc_msgSend(v39, "count"))
        {
          v43 = 0u;
          v44 = 0u;
          v41 = 0u;
          v42 = 0u;
          v8 = v39;
          v9 = 0;
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
          if (v10)
          {
            v11 = *(_QWORD *)v42;
            do
            {
              v12 = 0;
              v13 = v9;
              do
              {
                if (*(_QWORD *)v42 != v11)
                  objc_enumerationMutation(v8);
                v14 = *(const __CFData **)(*((_QWORD *)&v41 + 1) + 8 * v12);
                v15 = SecCertificateCreateWithData(0, v14);
                v16 = v15;
                if (v15)
                {
                  checkCertificateExpiration((uint64_t)v15, v6);
                  v9 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v9)
                    objc_msgSend(v7, "addObject:", v16);
                  CFRelease(v16);
                }
                else
                {
                  MFLogGeneral();
                  v17 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    v53 = v14;
                    _os_log_impl(&dword_1A4F90000, v17, OS_LOG_TYPE_INFO, "#SMIMEErrors SecCertificateCreateWithData() failed for %@", buf, 0xCu);
                  }

                  MFLookupLocalizedString(CFSTR("MIME_GENERIC_REMOTE_ENCRYPTION_CERT_MESSAGE"), CFSTR("An error occurred while retrieving the encryption certificate."), CFSTR("Delayed"));
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), 1035, v18, 0, 0);
                  v9 = (void *)objc_claimAutoreleasedReturnValue();

                }
                ++v12;
                v13 = v9;
              }
              while (v10 != v12);
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
            }
            while (v10);
          }
        }
        else
        {
          v40 = 0;
          v19 = +[MFMessageKeychainManager copyEncryptionCertificateForAddress:error:](MFMessageKeychainManager, "copyEncryptionCertificateForAddress:error:", v6, &v40);
          v20 = v40;
          v8 = v20;
          if (v19)
          {
            checkCertificateExpiration((uint64_t)v19, v6);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v9)
              objc_msgSend(v7, "addObject:", v19);
            CFRelease(v19);
          }
          else
          {
            if (v20)
            {
              v50 = v31;
              v51 = v20;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
              v21 = objc_claimAutoreleasedReturnValue();
              v22 = (void *)MEMORY[0x1E0CB3940];
              MFLookupLocalizedString(CFSTR("SMIME_OTHER_ENCRYPTION_CERT_ERROR_MESSAGE"), CFSTR("An error occurred while searching for an encryption certificate for “%@” in your keychain."), CFSTR("Delayed"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "stringWithFormat:", v23, v6);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = (void *)v21;
            }
            else
            {
              v26 = (void *)MEMORY[0x1E0CB3940];
              MFLookupLocalizedString(CFSTR("SMIME_MISSING_ENCRYPTION_CERT_MESSAGE"), CFSTR("You can’t send encrypted messages because an encryption certificate for the address “%@” could not be found."), CFSTR("Delayed"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "stringWithFormat:", v23, v6);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = 0;
            }

            MFLookupLocalizedString(CFSTR("SMIME_CANT_ENCRYPT_TITLE"), CFSTR("Unable to Encrypt"), CFSTR("Delayed"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), 1035, v24, v27, v25);
            v9 = (void *)objc_claimAutoreleasedReturnValue();

          }
        }

        if (v9)
          objc_msgSend(v37, "setObject:forKeyedSubscript:", v9, v6);
        if (objc_msgSend(v7, "count"))
        {
          objc_msgSend(v33, "setObject:forKeyedSubscript:", v7, v6);
          objc_msgSend(v37, "setObject:forKeyedSubscript:", 0, v6);
        }

      }
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
    }
    while (v36);
  }

  if (a5)
    *a5 = (id)objc_msgSend(v37, "copy");

  return v33;
}

+ (unsigned)evaluateTrustForSigningCertificate:(__SecCertificate *)a3 sendingAddress:(id)a4
{
  id v5;
  void *v6;
  __SecPolicy *v7;
  SecPolicyRef Revocation;
  OSStatus v9;
  NSObject *v10;
  unsigned int v11;
  SecTrustRef trust;

  v5 = a4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
  v7 = +[MFMessageKeychainManager copySMIMESigningPolicyForAddress:](MFMessageKeychainManager, "copySMIMESigningPolicyForAddress:", v5);
  if (v7)
  {
    objc_msgSend(v6, "addObject:", v7);
    CFRelease(v7);
  }
  Revocation = SecPolicyCreateRevocation(3uLL);
  if (Revocation)
  {
    objc_msgSend(v6, "addObject:", Revocation);
    CFRelease(Revocation);
  }
  trust = 0;
  v9 = SecTrustCreateWithCertificates(a3, v6, &trust);
  if (v9 || !trust)
  {
    MFLogGeneral();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[MFSecureMIMECompositionManager evaluateTrustForSigningCertificate:sendingAddress:].cold.1(v9, v10);
    v11 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D1E790], "evaluateTrust:withOptions:signerEmailAddress:", trust, 0, v5);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = -[NSObject trustResult](v10, "trustResult");
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_certificatesByRecipient, 0);
  objc_storeStrong((id *)&self->_errorsByRecipient, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_encryptionIdentityError, 0);
  objc_storeStrong((id *)&self->_signingIdentityError, 0);
  objc_storeStrong((id *)&self->_sendingAddress, 0);
  objc_storeStrong((id *)&self->_sendingAccount, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (void)_determineTrustStatusForSigningIdentity:(os_log_t)log sendingAddress:.cold.1(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  _os_log_error_impl(&dword_1A4F90000, log, OS_LOG_TYPE_ERROR, "#SMIMEErrors SecIdentityCopyCertificate could not find certificate for %@, returned %d", (uint8_t *)&v3, 0x12u);
}

+ (void)evaluateTrustForSigningCertificate:(int)a1 sendingAddress:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_1A4F90000, a2, OS_LOG_TYPE_ERROR, "#SMIMEErrors SecTrustCreateWithCertificates returned %ld", (uint8_t *)&v2, 0xCu);
}

@end
