@implementation MAAutoAssetSetNotifications

- (MAAutoAssetSetNotifications)init
{
  MAAutoAssetSetNotifications *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MAAutoAssetSetNotifications;
  result = -[MAAutoAssetSetNotifications init](&v3, sel_init);
  if (result)
  {
    result->_downloadedBecameIncomplete = 0;
    *(_QWORD *)&result->_atomicInstanceDiscovered = 0;
  }
  return result;
}

- (MAAutoAssetSetNotifications)initWithCoder:(id)a3
{
  id v4;
  MAAutoAssetSetNotifications *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MAAutoAssetSetNotifications;
  v5 = -[MAAutoAssetSetNotifications init](&v7, sel_init);
  if (v5)
  {
    v5->_atomicInstanceDiscovered = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("atomicInstanceDiscovered"));
    v5->_atomicInstanceAvailableForUse = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("atomicInstanceAvailableForUse"));
    v5->_lockUsageCheck = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("lockUsageCheck"));
    v5->_filesystemSpaceCritical = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("filesystemSpaceCritical"));
    v5->_atomicInstancePurged = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("atomicInstancePurged"));
    v5->_downloadPending = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("downloadPending"));
    v5->_downloadProgress = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("downloadProgress"));
    v5->_downloadAbandoned = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("downloadAbandoned"));
    v5->_downloadedBecameIncomplete = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("downloadedBecameIncomplete"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSetNotifications atomicInstanceDiscovered](self, "atomicInstanceDiscovered"), CFSTR("atomicInstanceDiscovered"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSetNotifications atomicInstanceAvailableForUse](self, "atomicInstanceAvailableForUse"), CFSTR("atomicInstanceAvailableForUse"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSetNotifications lockUsageCheck](self, "lockUsageCheck"), CFSTR("lockUsageCheck"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSetNotifications filesystemSpaceCritical](self, "filesystemSpaceCritical"), CFSTR("filesystemSpaceCritical"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSetNotifications atomicInstancePurged](self, "atomicInstancePurged"), CFSTR("atomicInstancePurged"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSetNotifications downloadPending](self, "downloadPending"), CFSTR("downloadPending"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSetNotifications downloadProgress](self, "downloadProgress"), CFSTR("downloadProgress"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSetNotifications downloadAbandoned](self, "downloadAbandoned"), CFSTR("downloadAbandoned"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSetNotifications downloadedBecameIncomplete](self, "downloadedBecameIncomplete"), CFSTR("downloadedBecameIncomplete"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  MAAutoAssetSetNotifications *v3;

  v3 = objc_alloc_init(MAAutoAssetSetNotifications);
  -[MAAutoAssetSetNotifications setAtomicInstanceDiscovered:](v3, "setAtomicInstanceDiscovered:", -[MAAutoAssetSetNotifications atomicInstanceDiscovered](self, "atomicInstanceDiscovered"));
  -[MAAutoAssetSetNotifications setAtomicInstanceAvailableForUse:](v3, "setAtomicInstanceAvailableForUse:", -[MAAutoAssetSetNotifications atomicInstanceAvailableForUse](self, "atomicInstanceAvailableForUse"));
  -[MAAutoAssetSetNotifications setLockUsageCheck:](v3, "setLockUsageCheck:", -[MAAutoAssetSetNotifications lockUsageCheck](self, "lockUsageCheck"));
  -[MAAutoAssetSetNotifications setFilesystemSpaceCritical:](v3, "setFilesystemSpaceCritical:", -[MAAutoAssetSetNotifications filesystemSpaceCritical](self, "filesystemSpaceCritical"));
  -[MAAutoAssetSetNotifications setAtomicInstancePurged:](v3, "setAtomicInstancePurged:", -[MAAutoAssetSetNotifications atomicInstancePurged](self, "atomicInstancePurged"));
  -[MAAutoAssetSetNotifications setDownloadPending:](v3, "setDownloadPending:", -[MAAutoAssetSetNotifications downloadPending](self, "downloadPending"));
  -[MAAutoAssetSetNotifications setDownloadProgress:](v3, "setDownloadProgress:", -[MAAutoAssetSetNotifications downloadProgress](self, "downloadProgress"));
  -[MAAutoAssetSetNotifications setDownloadAbandoned:](v3, "setDownloadAbandoned:", -[MAAutoAssetSetNotifications downloadAbandoned](self, "downloadAbandoned"));
  -[MAAutoAssetSetNotifications setDownloadedBecameIncomplete:](v3, "setDownloadedBecameIncomplete:", -[MAAutoAssetSetNotifications downloadedBecameIncomplete](self, "downloadedBecameIncomplete"));
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
  const __CFString *v13;
  void *v14;

  v14 = (void *)MEMORY[0x1E0CB3940];
  if (-[MAAutoAssetSetNotifications atomicInstanceDiscovered](self, "atomicInstanceDiscovered"))
    v3 = CFSTR("Y");
  else
    v3 = CFSTR("N");
  v13 = v3;
  if (-[MAAutoAssetSetNotifications atomicInstanceAvailableForUse](self, "atomicInstanceAvailableForUse"))
    v4 = CFSTR("Y");
  else
    v4 = CFSTR("N");
  if (-[MAAutoAssetSetNotifications lockUsageCheck](self, "lockUsageCheck"))
    v5 = CFSTR("Y");
  else
    v5 = CFSTR("N");
  if (-[MAAutoAssetSetNotifications filesystemSpaceCritical](self, "filesystemSpaceCritical"))
    v6 = CFSTR("Y");
  else
    v6 = CFSTR("N");
  if (-[MAAutoAssetSetNotifications atomicInstancePurged](self, "atomicInstancePurged"))
    v7 = CFSTR("Y");
  else
    v7 = CFSTR("N");
  if (-[MAAutoAssetSetNotifications downloadPending](self, "downloadPending"))
    v8 = CFSTR("Y");
  else
    v8 = CFSTR("N");
  if (-[MAAutoAssetSetNotifications downloadProgress](self, "downloadProgress"))
    v9 = CFSTR("Y");
  else
    v9 = CFSTR("N");
  if (-[MAAutoAssetSetNotifications downloadAbandoned](self, "downloadAbandoned"))
    v10 = CFSTR("Y");
  else
    v10 = CFSTR("N");
  if (-[MAAutoAssetSetNotifications downloadedBecameIncomplete](self, "downloadedBecameIncomplete"))
    v11 = CFSTR("Y");
  else
    v11 = CFSTR("N");
  return (id)objc_msgSend(v14, "stringWithFormat:", CFSTR("discovered:%@|availableForUse:%@|lockUsageCheck:%@|filesystemSpaceCritical:%@|purged:%@|downloadPending:%@|downloadProgress:%@|downloadAbandoned:%@|downloadBecameIncomplete:%@"), v13, v4, v5, v6, v7, v8, v9, v10, v11);
}

+ (id)notifyRegistrationName:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), CFSTR("com.apple.MobileAsset.AutoAssetAtomicNotification"), CFSTR("^"), a3);
}

+ (id)notifyRegistrationName:(id)a3 forAssetSetIdentifier:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@%@%@"), CFSTR("com.apple.MobileAsset.AutoAssetAtomicNotification"), CFSTR("^"), a4, CFSTR("^"), a3);
}

- (BOOL)atomicInstanceDiscovered
{
  return self->_atomicInstanceDiscovered;
}

- (void)setAtomicInstanceDiscovered:(BOOL)a3
{
  self->_atomicInstanceDiscovered = a3;
}

- (BOOL)atomicInstanceAvailableForUse
{
  return self->_atomicInstanceAvailableForUse;
}

- (void)setAtomicInstanceAvailableForUse:(BOOL)a3
{
  self->_atomicInstanceAvailableForUse = a3;
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

- (BOOL)atomicInstancePurged
{
  return self->_atomicInstancePurged;
}

- (void)setAtomicInstancePurged:(BOOL)a3
{
  self->_atomicInstancePurged = a3;
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

- (BOOL)downloadedBecameIncomplete
{
  return self->_downloadedBecameIncomplete;
}

- (void)setDownloadedBecameIncomplete:(BOOL)a3
{
  self->_downloadedBecameIncomplete = a3;
}

@end
