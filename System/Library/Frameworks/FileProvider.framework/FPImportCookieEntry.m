@implementation FPImportCookieEntry

- (FPImportCookieEntry)initWithDomainPathRelativeToVolumeRoot:(id)a3 displayName:(id)a4 creationTime:(double)a5 andFileID:(unint64_t)a6
{
  id v11;
  id v12;
  FPImportCookieEntry *v13;
  FPImportCookieEntry *v14;
  objc_super v16;

  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)FPImportCookieEntry;
  v13 = -[FPImportCookieEntry init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_domainPathRelativeToVolumeRoot, a3);
    objc_storeStrong((id *)&v14->_displayName, a4);
    v14->_creationTime = a5;
    v14->_fileID = a6;
  }

  return v14;
}

- (FPImportCookieEntry)initWithDomainURL:(id)a3 displayName:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  FPImportCookieEntry *v11;
  uint64_t v13;

  v8 = a4;
  v13 = 0;
  FPPathRelativeToVolumeRoot(a3, &v13, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceReferenceDate");
    self = -[FPImportCookieEntry initWithDomainPathRelativeToVolumeRoot:displayName:creationTime:andFileID:](self, "initWithDomainPathRelativeToVolumeRoot:displayName:creationTime:andFileID:", v9, v8, v13);

    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *domainPathRelativeToVolumeRoot;
  id v5;

  domainPathRelativeToVolumeRoot = self->_domainPathRelativeToVolumeRoot;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", domainPathRelativeToVolumeRoot, CFSTR("_domainPathRelativeToVolumeRoot"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayName, CFSTR("_displayName"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_creationTime"), self->_creationTime);
  objc_msgSend(v5, "encodeInt64:forKey:", self->_fileID, CFSTR("_fileID"));

}

- (FPImportCookieEntry)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  FPImportCookieEntry *v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_fileID"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_domainPathRelativeToVolumeRoot"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_displayName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_creationTime"));
  v9 = v8;

  v10 = -[FPImportCookieEntry initWithDomainPathRelativeToVolumeRoot:displayName:creationTime:andFileID:](self, "initWithDomainPathRelativeToVolumeRoot:displayName:creationTime:andFileID:", v6, v7, v5, v9);
  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[FPImportCookieEntry displayName](self, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPImportCookieEntry domainPathRelativeToVolumeRoot](self, "domainPathRelativeToVolumeRoot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fp_obfuscatedPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FPImportCookieEntry fileID](self, "fileID");
  -[FPImportCookieEntry creationTime](self, "creationTime");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<n:%@ d:%@ f:%llu ct:%f>"), v4, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)domainPathRelativeToVolumeRoot
{
  return self->_domainPathRelativeToVolumeRoot;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (unint64_t)fileID
{
  return self->_fileID;
}

- (double)creationTime
{
  return self->_creationTime;
}

- (void)setCreationTime:(double)a3
{
  self->_creationTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_domainPathRelativeToVolumeRoot, 0);
}

@end
