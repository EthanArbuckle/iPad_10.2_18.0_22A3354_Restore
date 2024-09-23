@implementation MCSessionStream

- (void)dealloc
{
  objc_super v3;

  -[MCResourceProgressObserver invalidate](self->_observer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MCSessionStream;
  -[MCSessionStream dealloc](&v3, sel_dealloc);
}

- (MCPeerID)peerID
{
  return self->_peerID;
}

- (void)setPeerID:(id)a3
{
  self->_peerID = (MCPeerID *)a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unsigned)streamID
{
  return self->_streamID;
}

- (void)setStreamID:(unsigned int)a3
{
  self->_streamID = a3;
}

- (int)state
{
  return self->state;
}

- (void)setState:(int)a3
{
  self->state = a3;
}

- (int)fd
{
  return self->_fd;
}

- (void)setFd:(int)a3
{
  self->_fd = a3;
}

- (OS_dispatch_source)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  self->_source = (OS_dispatch_source *)a3;
}

- (BOOL)sourceSuspended
{
  return self->_sourceSuspended;
}

- (void)setSourceSuspended:(BOOL)a3
{
  self->_sourceSuspended = a3;
}

- (NSMutableData)incomingBuffer
{
  return self->_incomingBuffer;
}

- (void)setIncomingBuffer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (BOOL)progressUnbounded
{
  return self->_progressUnbounded;
}

- (void)setProgressUnbounded:(BOOL)a3
{
  self->_progressUnbounded = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (MCResourceDownloader)urlDownloader
{
  return self->_urlDownloader;
}

- (void)setUrlDownloader:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (MCResourceProgressObserver)observer
{
  return self->_observer;
}

- (void)setObserver:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

@end
