@implementation MTROTASoftwareUpdateRequestorClusterDownloadErrorEvent

- (MTROTASoftwareUpdateRequestorClusterDownloadErrorEvent)init
{
  MTROTASoftwareUpdateRequestorClusterDownloadErrorEvent *v2;
  MTROTASoftwareUpdateRequestorClusterDownloadErrorEvent *v3;
  NSNumber *softwareVersion;
  NSNumber *bytesDownloaded;
  NSNumber *progressPercent;
  NSNumber *platformCode;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTROTASoftwareUpdateRequestorClusterDownloadErrorEvent;
  v2 = -[MTROTASoftwareUpdateRequestorClusterDownloadErrorEvent init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    softwareVersion = v2->_softwareVersion;
    v2->_softwareVersion = (NSNumber *)&unk_250591B18;

    bytesDownloaded = v3->_bytesDownloaded;
    v3->_bytesDownloaded = (NSNumber *)&unk_250591B18;

    progressPercent = v3->_progressPercent;
    v3->_progressPercent = 0;

    platformCode = v3->_platformCode;
    v3->_platformCode = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTROTASoftwareUpdateRequestorClusterDownloadErrorEvent *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;

  v4 = objc_alloc_init(MTROTASoftwareUpdateRequestorClusterDownloadErrorEvent);
  objc_msgSend_softwareVersion(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSoftwareVersion_(v4, v8, (uint64_t)v7);

  objc_msgSend_bytesDownloaded(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBytesDownloaded_(v4, v12, (uint64_t)v11);

  objc_msgSend_progressPercent(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setProgressPercent_(v4, v16, (uint64_t)v15);

  objc_msgSend_platformCode(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPlatformCode_(v4, v20, (uint64_t)v19);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: softwareVersion:%@; bytesDownloaded:%@; progressPercent:%@; platformCode:%@; >"),
    v5,
    self->_softwareVersion,
    self->_bytesDownloaded,
    self->_progressPercent,
    self->_platformCode);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)softwareVersion
{
  return self->_softwareVersion;
}

- (void)setSoftwareVersion:(NSNumber *)softwareVersion
{
  objc_setProperty_nonatomic_copy(self, a2, softwareVersion, 8);
}

- (NSNumber)bytesDownloaded
{
  return self->_bytesDownloaded;
}

- (void)setBytesDownloaded:(NSNumber *)bytesDownloaded
{
  objc_setProperty_nonatomic_copy(self, a2, bytesDownloaded, 16);
}

- (NSNumber)progressPercent
{
  return self->_progressPercent;
}

- (void)setProgressPercent:(NSNumber *)progressPercent
{
  objc_setProperty_nonatomic_copy(self, a2, progressPercent, 24);
}

- (NSNumber)platformCode
{
  return self->_platformCode;
}

- (void)setPlatformCode:(NSNumber *)platformCode
{
  objc_setProperty_nonatomic_copy(self, a2, platformCode, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platformCode, 0);
  objc_storeStrong((id *)&self->_progressPercent, 0);
  objc_storeStrong((id *)&self->_bytesDownloaded, 0);
  objc_storeStrong((id *)&self->_softwareVersion, 0);
}

@end
