@implementation ASDJobManagerOptions

- (id)copyWithZone:(_NSZone *)a3
{
  ASDJobManagerOptions *v5;
  uint64_t v6;
  NSString *persistenceIdentifier;

  v5 = -[ASDJobManagerOptions init](+[ASDJobManagerOptions allocWithZone:](ASDJobManagerOptions, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_persistenceIdentifier, "copyWithZone:", a3);
  persistenceIdentifier = v5->_persistenceIdentifier;
  v5->_persistenceIdentifier = (NSString *)v6;

  v5->_shouldFilterExternalOriginatedDownloads = self->_shouldFilterExternalOriginatedDownloads;
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDJobManagerOptions)initWithCoder:(id)a3
{
  id v4;
  ASDJobManagerOptions *v5;
  uint64_t v6;
  NSString *persistenceIdentifier;

  v4 = a3;
  v5 = -[ASDJobManagerOptions init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("persistenceIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    persistenceIdentifier = v5->_persistenceIdentifier;
    v5->_persistenceIdentifier = (NSString *)v6;

    v5->_shouldFilterExternalOriginatedDownloads = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldFilterExternalOriginatedDownloads"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *persistenceIdentifier;
  id v5;

  persistenceIdentifier = self->_persistenceIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", persistenceIdentifier, CFSTR("persistenceIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldFilterExternalOriginatedDownloads, CFSTR("shouldFilterExternalOriginatedDownloads"));

}

- (NSString)persistenceIdentifier
{
  return self->_persistenceIdentifier;
}

- (void)setPersistenceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)shouldFilterExternalOriginatedDownloads
{
  return self->_shouldFilterExternalOriginatedDownloads;
}

- (void)setShouldFilterExternalOriginatedDownloads:(BOOL)a3
{
  self->_shouldFilterExternalOriginatedDownloads = a3;
}

- (BOOL)shouldReportDownloadProgress
{
  return self->_shouldReportDownloadProgress;
}

- (void)setShouldReportDownloadProgress:(BOOL)a3
{
  self->_shouldReportDownloadProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistenceIdentifier, 0);
}

@end
