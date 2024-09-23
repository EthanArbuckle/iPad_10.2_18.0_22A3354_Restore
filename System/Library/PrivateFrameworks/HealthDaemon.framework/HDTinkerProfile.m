@implementation HDTinkerProfile

- (HDTinkerProfile)initWithDirectoryPath:(id)a3 medicalIDDirectoryPath:(id)a4 daemon:(id)a5 profileIdentifier:(id)a6
{
  HDTinkerProfile *v6;
  HDAttachmentManager *v7;
  HDAttachmentManager *attachmentManager;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HDTinkerProfile;
  v6 = -[HDProfile initWithDirectoryPath:medicalIDDirectoryPath:daemon:profileIdentifier:](&v10, sel_initWithDirectoryPath_medicalIDDirectoryPath_daemon_profileIdentifier_, a3, a4, a5, a6);
  if (v6)
  {
    v7 = -[HDAttachmentManager initWithProfile:]([HDAttachmentManager alloc], "initWithProfile:", v6);
    attachmentManager = v6->_attachmentManager;
    v6->_attachmentManager = v7;

  }
  return v6;
}

- (void)awakeFromDisk
{
  void *v3;
  objc_super v4;
  _QWORD v5[5];

  if (!-[HDProfile testModeEnabled](self, "testModeEnabled"))
  {
    -[HDProfile database](self, "database");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __32__HDTinkerProfile_awakeFromDisk__block_invoke;
    v5[3] = &unk_1E6CE80E8;
    v5[4] = self;
    objc_msgSend(v3, "performWhenDataProtectedByFirstUnlockIsAvailable:", v5);

    v4.receiver = self;
    v4.super_class = (Class)HDTinkerProfile;
    -[HDProfile awakeFromDisk](&v4, sel_awakeFromDisk);
  }
}

void __32__HDTinkerProfile_awakeFromDisk__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cloudSyncManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v2, "shareOwnerParticipantWithError:", &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;

  if (!v3)
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB5370];
    v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR);
    if (v4)
    {
      if (v6)
      {
        v7 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v11 = v7;
        _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Failed to lookup share owner participant upon profile awake from disk; assuming it is set for this launch.",
          buf,
          0xCu);
      }
    }
    else
    {
      if (v6)
      {
        v8 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v11 = v8;
        _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "%{public}@: No share owner participant set after launch for this Tinker profile. Triggering deletion.", buf, 0xCu);
      }
      objc_msgSend(*(id *)(a1 + 32), "triggerDeletion");
    }
  }

}

- (id)pairedNRDeviceUUIDWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;

  HDTinkerKeyValueDomainWithProfile(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataForKey:error:", CFSTR("TinkerNRDeviceUUIDKey"), a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)setPairedNRDeviceUUID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;

  v6 = a3;
  HDTinkerKeyValueDomainWithProfile(self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = objc_msgSend(v7, "setData:forKey:error:", v8, CFSTR("TinkerNRDeviceUUIDKey"), a4);
  else
    v9 = 0;

  return v9;
}

- (id)dsidWithError:(id *)a3
{
  void *v4;
  void *v5;

  HDTinkerSyncedProtectedKeyValueDomainWithProfile(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberForKey:error:", CFSTR("TinkerDSIDKey"), a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)setDSID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  HDTinkerSyncedProtectedKeyValueDomainWithProfile(self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "setNumber:forKey:error:", v6, CFSTR("TinkerDSIDKey"), a4);

  return (char)a4;
}

- (id)attachmentManager
{
  return self->_attachmentManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentManager, 0);
}

@end
