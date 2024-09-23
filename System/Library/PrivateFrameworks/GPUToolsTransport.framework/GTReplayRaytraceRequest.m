@implementation GTReplayRaytraceRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayRaytraceRequest)initWithCoder:(id)a3
{
  id v4;
  GTReplayRaytraceRequest *v5;
  GTReplayRaytraceRequest *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GTReplayRaytraceRequest;
  v5 = -[GTReplayRequest initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_streamRef = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("streamRef"));
    v5->_dispatchUID.uid = GTDispatchUIDDecode(v4, CFSTR("dispatchUID"));
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GTReplayRaytraceRequest;
  v4 = a3;
  -[GTReplayRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", self->_streamRef, CFSTR("streamRef"), v5.receiver, v5.super_class);
  GTDispatchUIDEncode(v4, self->_dispatchUID.uid, CFSTR("dispatchUID"));

}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v6.receiver = self;
  v6.super_class = (Class)GTReplayRaytraceRequest;
  -[GTReplayRaytraceRequest self](&v6, sel_self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)streamHandler
{
  return self->_streamHandler;
}

- (void)setStreamHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)streamRef
{
  return self->_streamRef;
}

- (void)setStreamRef:(unint64_t)a3
{
  self->_streamRef = a3;
}

- ($71565B17A5F3ED2E4525C95CCD99C39E)dispatchUID
{
  return ($71565B17A5F3ED2E4525C95CCD99C39E)self->_dispatchUID.uid;
}

- (void)setDispatchUID:(id)a3
{
  self->_dispatchUID.uid = a3.var1;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_streamHandler, 0);
}

@end
