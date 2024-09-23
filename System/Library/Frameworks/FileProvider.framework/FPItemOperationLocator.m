@implementation FPItemOperationLocator

- (id)description
{
  void *v2;
  void *v3;

  -[FPActionOperationLocator asFPItem](self, "asFPItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isProviderItem
{
  return 1;
}

- (id)identifier
{
  _FPLocationAgnosticID *v3;
  void *v4;
  _FPLocationAgnosticID *v5;

  v3 = [_FPLocationAgnosticID alloc];
  -[FPActionOperationLocator asFPItem](self, "asFPItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_FPLocationAgnosticID initWithItem:](v3, "initWithItem:", v4);

  return v5;
}

- (id)parentIdentifier
{
  _FPLocationAgnosticID *v3;
  void *v4;
  void *v5;
  _FPLocationAgnosticID *v6;

  v3 = [_FPLocationAgnosticID alloc];
  -[FPActionOperationLocator asFPItem](self, "asFPItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parentItemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_FPLocationAgnosticID initWithItemID:](v3, "initWithItemID:", v5);

  return v6;
}

- (id)filename
{
  void *v2;
  void *v3;

  -[FPActionOperationLocator asFPItem](self, "asFPItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filename");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)size
{
  void *v4;
  void *v5;
  unint64_t v6;

  if (-[FPItemOperationLocator isFolder](self, "isFolder"))
    return 0;
  -[FPActionOperationLocator asFPItem](self, "asFPItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "documentSize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  return v6;
}

- (BOOL)isMaterializedOnDisk
{
  return 0;
}

- (BOOL)isDownloaded
{
  void *v2;
  char v3;

  -[FPActionOperationLocator asFPItem](self, "asFPItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDownloaded");

  return v3;
}

- (BOOL)isFolder
{
  void *v2;
  char v3;

  -[FPActionOperationLocator asFPItem](self, "asFPItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFolder");

  return v3;
}

- (BOOL)requiresCrossDeviceCopy
{
  void *v2;
  void *v3;
  char v4;

  -[FPActionOperationLocator asFPItem](self, "asFPItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "providerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.filesystems.UserFS.FileProvider")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.SMBClientProvider.FileProvider"));

  return v4;
}

@end
