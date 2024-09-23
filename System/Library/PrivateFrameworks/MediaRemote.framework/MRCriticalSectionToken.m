@implementation MRCriticalSectionToken

- (MRCriticalSectionToken)init
{
  MRCriticalSectionToken *v2;
  NSUUID *v3;
  NSUUID *requestID;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MRCriticalSectionToken;
  v2 = -[MRCriticalSectionToken init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
    requestID = v2->_requestID;
    v2->_requestID = v3;

    v2->_invalidated = 0;
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  if (!-[MRCriticalSectionToken invalidated](self, "invalidated"))
  {
    -[MRCriticalSectionToken requestID](self, "requestID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "copy");

    +[MRCriticalSectionCoordinator exitCriticalSectionUsingRequestID:](MRCriticalSectionCoordinator, "exitCriticalSectionUsingRequestID:", v4);
  }
  v5.receiver = self;
  v5.super_class = (Class)MRCriticalSectionToken;
  -[MRCriticalSectionToken dealloc](&v5, sel_dealloc);
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[MRCriticalSectionToken requestID](self, "requestID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("requestID: %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSUUID)requestID
{
  return self->_requestID;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestID, 0);
}

@end
