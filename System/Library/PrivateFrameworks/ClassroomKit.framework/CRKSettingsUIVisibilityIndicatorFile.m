@implementation CRKSettingsUIVisibilityIndicatorFile

+ (id)fileURL
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1580], "crk_nonContainerizedHomeDirectoryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("Library/studentd/settingsUIVisible"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CRKSettingsUIVisibilityIndicatorFile)init
{
  CRKSettingsUIVisibilityIndicatorFile *v2;
  CRKFileBackedMarker *v3;
  void *v4;
  uint64_t v5;
  CRKMarker *mFileMarker;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRKSettingsUIVisibilityIndicatorFile;
  v2 = -[CRKSettingsUIVisibilityIndicatorFile init](&v8, sel_init);
  if (v2)
  {
    v3 = [CRKFileBackedMarker alloc];
    objc_msgSend((id)objc_opt_class(), "fileURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[CRKFileBackedMarker initWithFileURL:](v3, "initWithFileURL:", v4);
    mFileMarker = v2->mFileMarker;
    v2->mFileMarker = (CRKMarker *)v5;

  }
  return v2;
}

- (BOOL)exists
{
  return -[CRKMarker exists](self->mFileMarker, "exists");
}

- (BOOL)createWithError:(id *)a3
{
  return -[CRKMarker createWithError:](self->mFileMarker, "createWithError:", a3);
}

- (BOOL)deleteWithError:(id *)a3
{
  return -[CRKMarker deleteWithError:](self->mFileMarker, "deleteWithError:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFileMarker, 0);
}

@end
