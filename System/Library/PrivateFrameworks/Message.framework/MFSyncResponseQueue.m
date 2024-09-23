@implementation MFSyncResponseQueue

- (BOOL)addItem:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  if (objc_msgSend(v4, "responseType") == 17)
  {
    objc_msgSend(v4, "fetchResults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7.receiver = self;
    v7.super_class = (Class)MFSyncResponseQueue;
    -[MFBufferedQueue addItem:](&v7, sel_addItem_, v5);

  }
  return 1;
}

- (BOOL)shouldSyncFlags
{
  return *(&self->super._isSearching + 1);
}

@end
