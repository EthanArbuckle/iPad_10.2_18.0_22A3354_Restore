@implementation VSPrivacyVoucherLockbox

- (VSPrivacyVoucherLockbox)init
{
  VSPrivacyVoucherLockbox *v2;
  VSRemoteNotifier *v3;
  VSRemoteNotifier *remoteNotifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VSPrivacyVoucherLockbox;
  v2 = -[VSPrivacyVoucherLockbox init](&v6, sel_init);
  if (v2)
  {
    v3 = -[VSRemoteNotifier initWithNotificationName:]([VSRemoteNotifier alloc], "initWithNotificationName:", CFSTR("VSPrivacyConsentVouchersDidChangeNotification"));
    remoteNotifier = v2->_remoteNotifier;
    v2->_remoteNotifier = v3;

    -[VSRemoteNotifier setDelegate:](v2->_remoteNotifier, "setDelegate:", v2);
  }
  return v2;
}

- (void)remoteNotifier:(id)a3 didReceiveRemoteNotificationWithUserInfo:(id)a4
{
  -[VSPrivacyVoucherLockbox willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("unredeemedVouchers"), a4);
  -[VSPrivacyVoucherLockbox didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("unredeemedVouchers"));
}

- (void)issueVouchersForApps:(id)a3 providerID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[VSPrivacyVoucherLockbox removeAllVouchers](self, "removeAllVouchers");
  objc_msgSend(v7, "nonChannelApps");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "hasUserChannelList"))
    objc_msgSend(v7, "subscribedApps");
  else
    objc_msgSend(v7, "availableApps");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[VSPrivacyVoucherLockbox issueVouchersForAppDescriptions:providerID:](self, "issueVouchersForAppDescriptions:providerID:", v10, v6);
}

- (void)issueVouchersForAppDescriptions:(id)a3 providerID:(id)a4
{
  id v5;

  +[VSPrivacyVoucherLockbox getVouchersFromSelectedAppDescriptions:forProviderID:](VSPrivacyVoucherLockbox, "getVouchersFromSelectedAppDescriptions:forProviderID:", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[VSPrivacyVoucherLockbox issueVouchers:](self, "issueVouchers:", v5);

}

- (void)issueVouchers:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[VSPrivacyVoucherLockbox unredeemedVouchers](self, "unredeemedVouchers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "addObjectsFromArray:", v4);
  -[VSPrivacyVoucherLockbox setUnredeemedVouchers:](self, "setUnredeemedVouchers:", v6);

}

- (void)redeemVoucher:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VSPrivacyVoucherLockbox mutableArrayValueForKey:](self, "mutableArrayValueForKey:", CFSTR("unredeemedVouchers"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (id)_voucherArchiveURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  +[VSPersistentStorage defaultStorageDirectoryURL](VSPersistentStorage, "defaultStorageDirectoryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("VSPrivacyConsentVouchers.data"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The [[VSPersistentStorage defaultStorageDirectoryURL] URLByAppendingPathComponent:@\"VSPrivacyConsentVouchers.data\"] parameter must not be nil."));
  +[VSPersistentStorage defaultStorageDirectoryURL](VSPersistentStorage, "defaultStorageDirectoryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("VSPrivacyConsentVouchers.data"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setUnredeemedVouchers:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v4;
    _os_log_impl(&dword_1D2419000, v5, OS_LOG_TYPE_DEFAULT, "Setting unredeemed vouchers: %@", buf, 0xCu);
  }

  -[VSPrivacyVoucherLockbox undoManager](self, "undoManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[VSPrivacyVoucherLockbox unredeemedVouchers](self, "unredeemedVouchers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "prepareWithInvocationTarget:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUnredeemedVouchers:", v7);

  }
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSPrivacyVoucherLockbox _voucherArchiveURL](self, "_voucherArchiveURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v11 = objc_msgSend(v9, "writeToURL:options:error:", v10, 0, &v21);
  v12 = v21;

  if ((v11 & 1) == 0)
  {
    VSErrorLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[VSPrivacyVoucherLockbox setUnredeemedVouchers:].cold.1((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19);

  }
  -[VSPrivacyVoucherLockbox remoteNotifier](self, "remoteNotifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "postNotification");

}

- (NSArray)unredeemedVouchers
{
  void *v2;
  id v3;
  void *v4;
  int v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  id v33;
  uint8_t buf[8];
  id v35;
  id v36;
  _QWORD v37[3];

  v37[2] = *MEMORY[0x1E0C80C00];
  -[VSPrivacyVoucherLockbox _voucherArchiveURL](self, "_voucherArchiveURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  objc_msgSend(v2, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  if (v5)
  {
    v36 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v2, 0, &v36);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v36;
    if (v6)
    {
      v8 = v6;
      v35 = 0;
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v8, &v35);
      v10 = v35;
      v11 = v10;
      if (v9)
      {
        v33 = v10;
        v12 = v9;
        -[NSObject setDecodingFailurePolicy:](v12, "setDecodingFailurePolicy:", 1);
        v13 = (void *)MEMORY[0x1E0C99E60];
        v37[0] = objc_opt_class();
        v37[1] = objc_opt_class();
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setWithArray:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSObject decodeObjectOfClasses:forKey:](v12, "decodeObjectOfClasses:forKey:", v15, *MEMORY[0x1E0CB2CD0]);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          v18 = v16;
        }
        else
        {
          VSErrorLogObject();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            -[VSPrivacyVoucherLockbox unredeemedVouchers].cold.3(v31);

          v18 = (id)MEMORY[0x1E0C9AA60];
        }

        v11 = v33;
      }
      else
      {
        VSErrorLogObject();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[VSPrivacyVoucherLockbox unredeemedVouchers].cold.2((uint64_t)v11, v12, v25, v26, v27, v28, v29, v30);
        v18 = (id)MEMORY[0x1E0C9AA60];
      }

    }
    else
    {
      VSErrorLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[VSPrivacyVoucherLockbox unredeemedVouchers].cold.1((uint64_t)v7, v8, v19, v20, v21, v22, v23, v24);
      v18 = (id)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    VSDefaultLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2419000, v7, OS_LOG_TYPE_DEFAULT, "No vouchers file exists.", buf, 2u);
    }
    v18 = (id)MEMORY[0x1E0C9AA60];
  }

  return (NSArray *)v18;
}

- (void)removeAllVouchers
{
  -[VSPrivacyVoucherLockbox setUnredeemedVouchers:](self, "setUnredeemedVouchers:", MEMORY[0x1E0C9AA60]);
}

+ (id)getVouchersFromSelectedAppDescriptions:(id)a3 forProviderID:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  VSPrivacyConsentVoucher *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[4];
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v13, "adamID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringValue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          if (objc_msgSend(v13, "appType") == 2)
            goto LABEL_12;
          v16 = -[VSPrivacyConsentVoucher initWithAppAdamID:providerID:]([VSPrivacyConsentVoucher alloc], "initWithAppAdamID:providerID:", v15, v6);
          objc_msgSend(v7, "addObject:", v16);
        }
        else
        {
          VSErrorLogObject();
          v16 = (VSPrivacyConsentVoucher *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v16->super, OS_LOG_TYPE_ERROR))
            +[VSPrivacyVoucherLockbox getVouchersFromSelectedAppDescriptions:forProviderID:].cold.1(v22, v13, &v23, &v16->super);
        }

LABEL_12:
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v10);
  }

  return v7;
}

- (NSUndoManager)undoManager
{
  return self->_undoManager;
}

- (void)setUndoManager:(id)a3
{
  objc_storeStrong((id *)&self->_undoManager, a3);
}

- (VSRemoteNotifier)remoteNotifier
{
  return self->_remoteNotifier;
}

- (void)setRemoteNotifier:(id)a3
{
  objc_storeStrong((id *)&self->_remoteNotifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteNotifier, 0);
  objc_storeStrong((id *)&self->_undoManager, 0);
}

- (void)setUnredeemedVouchers:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2419000, a2, a3, "Unable to write vouchers: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)unredeemedVouchers
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D2419000, log, OS_LOG_TYPE_ERROR, "Unable to decode vouchers.", v1, 2u);
}

+ (void)getVouchersFromSelectedAppDescriptions:(_QWORD *)a3 forProviderID:(NSObject *)a4 .cold.1(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_1D2419000, a4, OS_LOG_TYPE_ERROR, "Could not create voucher for %@, missing adamID", a1, 0xCu);

}

@end
