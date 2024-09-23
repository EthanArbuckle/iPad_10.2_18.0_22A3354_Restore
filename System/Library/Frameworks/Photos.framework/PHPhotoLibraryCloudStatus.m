@implementation PHPhotoLibraryCloudStatus

- (PHPhotoLibraryCloudStatus)initWithCPLStatus:(id)a3
{
  id v5;
  PHPhotoLibraryCloudStatus *v6;
  PHPhotoLibraryCloudStatus *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHPhotoLibraryCloudStatus;
  v6 = -[PHPhotoLibraryCloudStatus init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_cplStatus, a3);

  return v7;
}

- (id)cplStatus
{
  return self->_cplStatus;
}

- (BOOL)isCloudSyncEnabled
{
  return self->_cplStatus != 0;
}

- (NSDate)lastSyncDate
{
  void *v2;
  void *v3;

  -[PHPhotoLibraryCloudStatus cplStatus](self, "cplStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastSuccessfulSyncDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (NSDate)firstSyncDate
{
  void *v2;
  void *v3;

  -[PHPhotoLibraryCloudStatus cplStatus](self, "cplStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "initialSyncDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (BOOL)isEqual:(id)a3
{
  PHPhotoLibraryCloudStatus *v4;
  PHPhotoLibraryCloudStatus *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  char IsEqual;

  v4 = (PHPhotoLibraryCloudStatus *)a3;
  if (self == v4)
  {
    IsEqual = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[PHPhotoLibraryCloudStatus isCloudSyncEnabled](self, "isCloudSyncEnabled");
      if (v6 == -[PHPhotoLibraryCloudStatus isCloudSyncEnabled](v5, "isCloudSyncEnabled")
        && (-[PHPhotoLibraryCloudStatus lastSyncDate](self, "lastSyncDate"),
            v7 = (void *)objc_claimAutoreleasedReturnValue(),
            -[PHPhotoLibraryCloudStatus lastSyncDate](v5, "lastSyncDate"),
            v8 = (void *)objc_claimAutoreleasedReturnValue(),
            v9 = PLObjectIsEqual(),
            v8,
            v7,
            v9))
      {
        -[PHPhotoLibraryCloudStatus firstSyncDate](self, "firstSyncDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHPhotoLibraryCloudStatus firstSyncDate](v5, "firstSyncDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        IsEqual = PLObjectIsEqual();

      }
      else
      {
        IsEqual = 0;
      }

    }
    else
    {
      IsEqual = 0;
    }
  }

  return IsEqual;
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PHPhotoLibraryCloudStatus;
  -[PHPhotoLibraryCloudStatus description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PHPhotoLibraryCloudStatus isCloudSyncEnabled](self, "isCloudSyncEnabled"))
    v4 = CFSTR("ENABLED");
  else
    v4 = CFSTR("DISABLED");
  -[PHPhotoLibraryCloudStatus lastSyncDate](self, "lastSyncDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPhotoLibraryCloudStatus firstSyncDate](self, "firstSyncDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(": %@ [last:%@ first:%@]"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cplStatus, 0);
}

@end
