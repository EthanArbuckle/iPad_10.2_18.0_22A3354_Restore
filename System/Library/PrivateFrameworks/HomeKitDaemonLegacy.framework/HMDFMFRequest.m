@implementation HMDFMFRequest

- (HMDFMFRequest)initWithResponseTimerDelegate:(id)a3
{
  id v4;
  HMDFMFRequest *v5;
  void *v6;
  uint64_t v7;
  NSString *requestID;
  FMFSession *v9;
  FMFSession *fmfSession;
  uint64_t v11;
  HMFTimer *fmfSessionResponseTimer;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HMDFMFRequest;
  v5 = -[HMDFMFRequest init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = objc_claimAutoreleasedReturnValue();
    requestID = v5->_requestID;
    v5->_requestID = (NSString *)v7;

    v9 = (FMFSession *)objc_alloc_init(MEMORY[0x1E0D20260]);
    fmfSession = v5->_fmfSession;
    v5->_fmfSession = v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D286C8]), "initWithTimeInterval:options:", 1, 10.0);
    fmfSessionResponseTimer = v5->_fmfSessionResponseTimer;
    v5->_fmfSessionResponseTimer = (HMFTimer *)v11;

    -[HMFTimer setDelegate:](v5->_fmfSessionResponseTimer, "setDelegate:", v4);
  }

  return v5;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HMDFMFRequest requestID](self, "requestID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("[FMF-Request: %@]"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)requestID
{
  return self->_requestID;
}

- (FMFSession)fmfSession
{
  return self->_fmfSession;
}

- (HMFTimer)fmfSessionResponseTimer
{
  return self->_fmfSessionResponseTimer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fmfSessionResponseTimer, 0);
  objc_storeStrong((id *)&self->_fmfSession, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
}

@end
