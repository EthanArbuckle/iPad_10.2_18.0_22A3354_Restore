@implementation AVContentKeyPSSHRequestTracker

- (AVContentKeyPSSHRequestTracker)initWithRequestCount:(int64_t)a3
{
  AVContentKeyPSSHRequestTracker *v4;
  NSMutableArray *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVContentKeyPSSHRequestTracker;
  v4 = -[AVContentKeyPSSHRequestTracker init](&v7, sel_init);
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4->_totalExpectedRequestCount = a3;
    v4->_requests = v5;
  }
  return v4;
}

- (void)addRequest:(id)a3
{
  -[NSMutableArray addObject:](self->_requests, "addObject:", a3);
}

- (BOOL)haveAllRequestsBeenReceived
{
  int64_t totalExpectedRequestCount;

  totalExpectedRequestCount = self->_totalExpectedRequestCount;
  return totalExpectedRequestCount == -[NSMutableArray count](self->_requests, "count");
}

- (id)requests
{
  return self->_requests;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVContentKeyPSSHRequestTracker;
  -[AVContentKeyPSSHRequestTracker dealloc](&v3, sel_dealloc);
}

@end
