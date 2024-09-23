@implementation CPLChangeSessionUpdate

- (CPLChangeSessionUpdate)initWithStore:(id)a3
{
  id v4;
  CPLChangeSessionUpdate *v5;
  uint64_t v6;
  NSString *libraryVersion;
  uint64_t v8;
  NSDate *queuedDate;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPLChangeSessionUpdate;
  v5 = -[CPLChangeSessionUpdate init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "createNewLibraryVersion");
    v6 = objc_claimAutoreleasedReturnValue();
    libraryVersion = v5->_libraryVersion;
    v5->_libraryVersion = (NSString *)v6;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = objc_claimAutoreleasedReturnValue();
    queuedDate = v5->_queuedDate;
    v5->_queuedDate = (NSDate *)v8;

  }
  return v5;
}

- (BOOL)applyToStore:(id)a3 error:(id *)a4
{
  return objc_msgSend(a3, "storeLibraryVersion:withError:", self->_libraryVersion, a4);
}

- (BOOL)discardFromStore:(id)a3 error:(id *)a4
{
  return 1;
}

- (CPLChangeSessionUpdate)initWithCoder:(id)a3
{
  id v4;
  CPLChangeSessionUpdate *v5;
  uint64_t v6;
  NSString *libraryVersion;
  uint64_t v8;
  NSDate *queuedDate;
  CPLChangeSessionUpdate *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CPLChangeSessionUpdate;
  v5 = -[CPLChangeSessionUpdate init](&v12, sel_init);
  if (!v5)
    goto LABEL_3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("libraryVersion"));
  v6 = objc_claimAutoreleasedReturnValue();
  libraryVersion = v5->_libraryVersion;
  v5->_libraryVersion = (NSString *)v6;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
  v8 = objc_claimAutoreleasedReturnValue();
  queuedDate = v5->_queuedDate;
  v5->_queuedDate = (NSDate *)v8;

  if (!v5->_libraryVersion)
    v10 = 0;
  else
LABEL_3:
    v10 = v5;

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *libraryVersion;
  id v5;

  libraryVersion = self->_libraryVersion;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", libraryVersion, CFSTR("libraryVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_queuedDate, CFSTR("date"));

}

- (id)storageForStatusInStore:(id)a3
{
  return 0;
}

- (id)pendingRecordChangeForClientCacheWithLocalScopedIdentifier:(id)a3
{
  return 0;
}

- (NSString)libraryVersion
{
  return self->_libraryVersion;
}

- (NSDate)queuedDate
{
  return self->_queuedDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuedDate, 0);
  objc_storeStrong((id *)&self->_libraryVersion, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
