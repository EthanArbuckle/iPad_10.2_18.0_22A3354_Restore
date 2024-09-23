@implementation ML3ClientImportSessionConfiguration

- (ML3ClientImportSessionConfiguration)init
{
  ML3ClientImportSessionConfiguration *v2;
  uint64_t v3;
  NSString *libraryPath;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ML3ClientImportSessionConfiguration;
  v2 = -[ML3ClientImportSessionConfiguration init](&v6, sel_init);
  if (v2)
  {
    +[ML3MusicLibrary autoupdatingSharedLibraryPath](ML3MusicLibrary, "autoupdatingSharedLibraryPath");
    v3 = objc_claimAutoreleasedReturnValue();
    libraryPath = v2->_libraryPath;
    v2->_libraryPath = (NSString *)v3;

    v2->_sourceType = 0;
    v2->_allowAccountMerging = 1;
    v2->_privacyContext = (ML3DatabasePrivacyContext *)+[ML3DatabasePrivacyContext sharedContext](ML3DatabasePrivacyContext, "sharedContext");
  }
  return v2;
}

- (ML3ClientImportSessionConfiguration)initWithCoder:(id)a3
{
  id v4;
  ML3ClientImportSessionConfiguration *v5;
  uint64_t v6;
  NSString *libraryPath;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ML3ClientImportSessionConfiguration;
  v5 = -[ML3ClientImportSessionConfiguration init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("libraryPath"));
    v6 = objc_claimAutoreleasedReturnValue();
    libraryPath = v5->_libraryPath;
    v5->_libraryPath = (NSString *)v6;

    v5->_sourceType = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("sourceType"));
    v5->_allowAccountMerging = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowAccountMerging"));
    v5->_privacyContext = (ML3DatabasePrivacyContext *)(id)objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("privacyContext"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *libraryPath;
  id v5;

  libraryPath = self->_libraryPath;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", libraryPath, CFSTR("libraryPath"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_sourceType, CFSTR("sourceType"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_allowAccountMerging, CFSTR("allowAccountMerging"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_privacyContext, CFSTR("privacyContext"));

}

- (NSString)libraryPath
{
  return self->_libraryPath;
}

- (void)setLibraryPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int)sourceType
{
  return self->_sourceType;
}

- (void)setSourceType:(int)a3
{
  self->_sourceType = a3;
}

- (unint64_t)operationCount
{
  return self->_operationCount;
}

- (void)setOperationCount:(unint64_t)a3
{
  self->_operationCount = a3;
}

- (BOOL)allowAccountMerging
{
  return self->_allowAccountMerging;
}

- (void)setAllowAccountMerging:(BOOL)a3
{
  self->_allowAccountMerging = a3;
}

- (ML3DatabasePrivacyContext)privacyContext
{
  return self->_privacyContext;
}

- (void)setPrivacyContext:(id)a3
{
  self->_privacyContext = (ML3DatabasePrivacyContext *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryPath, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
