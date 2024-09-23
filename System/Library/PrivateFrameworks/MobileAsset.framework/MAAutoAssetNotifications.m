@implementation MAAutoAssetNotifications

+ (id)notifyRegistrationName:(id)a3 forAssetType:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@%@%@"), CFSTR("com.apple.MobileAsset.AutoAssetNotification"), CFSTR("^"), a4, CFSTR("^"), a3);
}

- (MAAutoAssetNotifications)init
{
  MAAutoAssetNotifications *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MAAutoAssetNotifications;
  result = -[MAAutoAssetNotifications init](&v3, sel_init);
  if (result)
  {
    *(_WORD *)&result->_downloadProgress = 0;
    *(_QWORD *)&result->_newerVersionDiscovered = 0;
  }
  return result;
}

- (MAAutoAssetNotifications)initWithCoder:(id)a3
{
  id v4;
  MAAutoAssetNotifications *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MAAutoAssetNotifications;
  v5 = -[MAAutoAssetNotifications init](&v7, sel_init);
  if (v5)
  {
    v5->_newerVersionDiscovered = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("newerVersionDiscovered"));
    v5->_checkForNewerFailure = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("checkForNewerFailure"));
    v5->_contentAvailableForUse = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("contentAvailableForUse"));
    v5->_contentVersionRevoked = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("contentVersionRevoked"));
    v5->_lockUsageCheck = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("lockUsageCheck"));
    v5->_filesystemSpaceCritical = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("filesystemSpaceCritical"));
    v5->_assetPurged = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("assetPurged"));
    v5->_downloadPending = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("downloadPending"));
    v5->_downloadProgress = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("downloadProgress"));
    v5->_downloadAbandoned = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("downloadAbandoned"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetNotifications newerVersionDiscovered](self, "newerVersionDiscovered"), CFSTR("newerVersionDiscovered"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetNotifications checkForNewerFailure](self, "checkForNewerFailure"), CFSTR("checkForNewerFailure"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetNotifications contentAvailableForUse](self, "contentAvailableForUse"), CFSTR("contentAvailableForUse"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetNotifications contentVersionRevoked](self, "contentVersionRevoked"), CFSTR("contentVersionRevoked"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetNotifications lockUsageCheck](self, "lockUsageCheck"), CFSTR("lockUsageCheck"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetNotifications filesystemSpaceCritical](self, "filesystemSpaceCritical"), CFSTR("filesystemSpaceCritical"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetNotifications assetPurged](self, "assetPurged"), CFSTR("assetPurged"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetNotifications downloadPending](self, "downloadPending"), CFSTR("downloadPending"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetNotifications downloadProgress](self, "downloadProgress"), CFSTR("downloadProgress"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetNotifications downloadAbandoned](self, "downloadAbandoned"), CFSTR("downloadAbandoned"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  MAAutoAssetNotifications *v3;

  v3 = objc_alloc_init(MAAutoAssetNotifications);
  -[MAAutoAssetNotifications setNewerVersionDiscovered:](v3, "setNewerVersionDiscovered:", -[MAAutoAssetNotifications newerVersionDiscovered](self, "newerVersionDiscovered"));
  -[MAAutoAssetNotifications setCheckForNewerFailure:](v3, "setCheckForNewerFailure:", -[MAAutoAssetNotifications checkForNewerFailure](self, "checkForNewerFailure"));
  -[MAAutoAssetNotifications setContentAvailableForUse:](v3, "setContentAvailableForUse:", -[MAAutoAssetNotifications contentAvailableForUse](self, "contentAvailableForUse"));
  -[MAAutoAssetNotifications setContentVersionRevoked:](v3, "setContentVersionRevoked:", -[MAAutoAssetNotifications contentVersionRevoked](self, "contentVersionRevoked"));
  -[MAAutoAssetNotifications setLockUsageCheck:](v3, "setLockUsageCheck:", -[MAAutoAssetNotifications lockUsageCheck](self, "lockUsageCheck"));
  -[MAAutoAssetNotifications setFilesystemSpaceCritical:](v3, "setFilesystemSpaceCritical:", -[MAAutoAssetNotifications filesystemSpaceCritical](self, "filesystemSpaceCritical"));
  -[MAAutoAssetNotifications setAssetPurged:](v3, "setAssetPurged:", -[MAAutoAssetNotifications assetPurged](self, "assetPurged"));
  -[MAAutoAssetNotifications setDownloadPending:](v3, "setDownloadPending:", -[MAAutoAssetNotifications downloadPending](self, "downloadPending"));
  -[MAAutoAssetNotifications setDownloadProgress:](v3, "setDownloadProgress:", -[MAAutoAssetNotifications downloadProgress](self, "downloadProgress"));
  -[MAAutoAssetNotifications setDownloadAbandoned:](v3, "setDownloadAbandoned:", -[MAAutoAssetNotifications downloadAbandoned](self, "downloadAbandoned"));
  return v3;
}

- (id)summary
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;

  v16 = (void *)MEMORY[0x1E0CB3940];
  if (-[MAAutoAssetNotifications newerVersionDiscovered](self, "newerVersionDiscovered"))
    v3 = CFSTR("Y");
  else
    v3 = CFSTR("N");
  v15 = v3;
  if (-[MAAutoAssetNotifications checkForNewerFailure](self, "checkForNewerFailure"))
    v4 = CFSTR("Y");
  else
    v4 = CFSTR("N");
  v14 = v4;
  if (-[MAAutoAssetNotifications contentAvailableForUse](self, "contentAvailableForUse"))
    v5 = CFSTR("Y");
  else
    v5 = CFSTR("N");
  if (-[MAAutoAssetNotifications contentVersionRevoked](self, "contentVersionRevoked"))
    v6 = CFSTR("Y");
  else
    v6 = CFSTR("N");
  if (-[MAAutoAssetNotifications lockUsageCheck](self, "lockUsageCheck"))
    v7 = CFSTR("Y");
  else
    v7 = CFSTR("N");
  if (-[MAAutoAssetNotifications filesystemSpaceCritical](self, "filesystemSpaceCritical"))
    v8 = CFSTR("Y");
  else
    v8 = CFSTR("N");
  if (-[MAAutoAssetNotifications assetPurged](self, "assetPurged"))
    v9 = CFSTR("Y");
  else
    v9 = CFSTR("N");
  if (-[MAAutoAssetNotifications downloadPending](self, "downloadPending"))
    v10 = CFSTR("Y");
  else
    v10 = CFSTR("N");
  if (-[MAAutoAssetNotifications downloadProgress](self, "downloadProgress"))
    v11 = CFSTR("Y");
  else
    v11 = CFSTR("N");
  if (-[MAAutoAssetNotifications downloadAbandoned](self, "downloadAbandoned"))
    v12 = CFSTR("Y");
  else
    v12 = CFSTR("N");
  return (id)objc_msgSend(v16, "stringWithFormat:", CFSTR("discovered:%@|checkFail:%@|avail:%@|revoked:%@|usageCheck:%@|spaceCritical:%@|purged:%@|pending:%@|progress:%@|abandoned:%@"), v15, v14, v5, v6, v7, v8, v9, v10, v11, v12);
}

- (id)newSummaryDictionary
{
  id v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (-[MAAutoAssetNotifications newerVersionDiscovered](self, "newerVersionDiscovered"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  objc_msgSend(v3, "setSafeObject:forKey:", v4, CFSTR("newerVersionDiscovered"));
  if (-[MAAutoAssetNotifications checkForNewerFailure](self, "checkForNewerFailure"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v3, "setSafeObject:forKey:", v5, CFSTR("checkForNewerFailure"));
  if (-[MAAutoAssetNotifications contentAvailableForUse](self, "contentAvailableForUse"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v3, "setSafeObject:forKey:", v6, CFSTR("contentAvailableForUse"));
  if (-[MAAutoAssetNotifications contentVersionRevoked](self, "contentVersionRevoked"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v3, "setSafeObject:forKey:", v7, CFSTR("contentVersionRevoked"));
  if (-[MAAutoAssetNotifications lockUsageCheck](self, "lockUsageCheck"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v3, "setSafeObject:forKey:", v8, CFSTR("lockUsageCheck"));
  if (-[MAAutoAssetNotifications filesystemSpaceCritical](self, "filesystemSpaceCritical"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  objc_msgSend(v3, "setSafeObject:forKey:", v9, CFSTR("filesystemSpaceCritical"));
  if (-[MAAutoAssetNotifications assetPurged](self, "assetPurged"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  objc_msgSend(v3, "setSafeObject:forKey:", v10, CFSTR("assetPurged"));
  if (-[MAAutoAssetNotifications downloadPending](self, "downloadPending"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  objc_msgSend(v3, "setSafeObject:forKey:", v11, CFSTR("downloadPending"));
  if (-[MAAutoAssetNotifications downloadProgress](self, "downloadProgress"))
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  objc_msgSend(v3, "setSafeObject:forKey:", v12, CFSTR("downloadProgress"));
  if (-[MAAutoAssetNotifications downloadAbandoned](self, "downloadAbandoned"))
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  objc_msgSend(v3, "setSafeObject:forKey:", v13, CFSTR("downloadAbandoned"));
  return v3;
}

+ (id)notifyRegistrationName:(id)a3 forAssetType:(id)a4 forAssetSpecifier:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@%@%@%@%@"), CFSTR("com.apple.MobileAsset.AutoAssetNotification"), CFSTR("^"), a4, CFSTR("^"), a5, CFSTR("^"), a3);
}

- (BOOL)newerVersionDiscovered
{
  return self->_newerVersionDiscovered;
}

- (void)setNewerVersionDiscovered:(BOOL)a3
{
  self->_newerVersionDiscovered = a3;
}

- (BOOL)checkForNewerFailure
{
  return self->_checkForNewerFailure;
}

- (void)setCheckForNewerFailure:(BOOL)a3
{
  self->_checkForNewerFailure = a3;
}

- (BOOL)contentAvailableForUse
{
  return self->_contentAvailableForUse;
}

- (void)setContentAvailableForUse:(BOOL)a3
{
  self->_contentAvailableForUse = a3;
}

- (BOOL)contentVersionRevoked
{
  return self->_contentVersionRevoked;
}

- (void)setContentVersionRevoked:(BOOL)a3
{
  self->_contentVersionRevoked = a3;
}

- (BOOL)lockUsageCheck
{
  return self->_lockUsageCheck;
}

- (void)setLockUsageCheck:(BOOL)a3
{
  self->_lockUsageCheck = a3;
}

- (BOOL)filesystemSpaceCritical
{
  return self->_filesystemSpaceCritical;
}

- (void)setFilesystemSpaceCritical:(BOOL)a3
{
  self->_filesystemSpaceCritical = a3;
}

- (BOOL)assetPurged
{
  return self->_assetPurged;
}

- (void)setAssetPurged:(BOOL)a3
{
  self->_assetPurged = a3;
}

- (BOOL)downloadPending
{
  return self->_downloadPending;
}

- (void)setDownloadPending:(BOOL)a3
{
  self->_downloadPending = a3;
}

- (BOOL)downloadProgress
{
  return self->_downloadProgress;
}

- (void)setDownloadProgress:(BOOL)a3
{
  self->_downloadProgress = a3;
}

- (BOOL)downloadAbandoned
{
  return self->_downloadAbandoned;
}

- (void)setDownloadAbandoned:(BOOL)a3
{
  self->_downloadAbandoned = a3;
}

@end
