@implementation MFSearchFetchResponseQueue

- (MFSearchFetchResponseQueue)init
{
  MFSearchFetchResponseQueue *v2;
  MFSearchFetchResponseQueue *v3;
  MFSearchFetchResponseQueue *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFSearchFetchResponseQueue;
  v2 = -[MFFetchResponseQueue init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->super._isSearching = 1;
    v4 = v2;
  }

  return v3;
}

- (BOOL)shouldAddUID:(unsigned int)a3
{
  MFLibraryIMAPStore *store;
  void *v4;
  void *v5;

  store = self->super._store;
  EFStringWithInt();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFLibraryIMAPStore messageForRemoteID:](store, "messageForRemoteID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5 == 0;
}

@end
