@implementation MCSessionPeerState

- (MCSessionPeerState)initWithPeer:(id)a3
{
  MCSessionPeerState *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MCSessionPeerState;
  v4 = -[MCSessionPeerState init](&v6, sel_init);
  if (v4)
  {
    v4->_peerID = (MCPeerID *)objc_msgSend(a3, "copy");
    v4->_state = 0;
    v4->_certificateDecision = 0;
    v4->_incomingStreams = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v4->_outgoingStreams = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v4->_outgoingStreamRequests = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MCSessionPeerState;
  -[MCSessionPeerState dealloc](&v3, sel_dealloc);
}

- (unsigned)newStreamID
{
  unsigned int newStreamID;
  unsigned int v4;

  objc_sync_enter(self);
  newStreamID = self->_newStreamID;
  self->_newStreamID = newStreamID + 1;
  v4 = newStreamID & 0x7FFFFFFF;
  objc_sync_exit(self);
  return v4;
}

- (unsigned)newStreamOpenRequestID
{
  unsigned int newStreamOpenRequestID;
  unsigned int v4;

  objc_sync_enter(self);
  newStreamOpenRequestID = self->_newStreamOpenRequestID;
  self->_newStreamOpenRequestID = newStreamOpenRequestID + 1;
  v4 = newStreamOpenRequestID & 0x7FFFFFFF;
  objc_sync_exit(self);
  return v4;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;
  const __CFString *v7;
  const char *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[MCPeerID displayNameAndPID](-[MCSessionPeerState peerID](self, "peerID"), "displayNameAndPID");
  v5 = +[MCSession stringForSessionState:](MCSession, "stringForSessionState:", -[MCSessionPeerState state](self, "state"));
  v6 = -[MCSessionPeerState certificateDecision](self, "certificateDecision");
  if (v6 > 3)
    v7 = CFSTR("?");
  else
    v7 = (const __CFString *)*((_QWORD *)&off_24C840B00 + v6);
  if (-[MCSessionPeerState connectPeerCalled](self, "connectPeerCalled"))
    v8 = "yes";
  else
    v8 = "no";
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("Peer:%@ State:%@ CertDecision:%@ ConnectPeerCalled:%s OstreamRequests:%d Ostreams:%d Istreams:%d."), v4, v5, v7, v8, -[NSMutableDictionary count](-[MCSessionPeerState outgoingStreamRequests](self, "outgoingStreamRequests"), "count"), -[NSMutableDictionary count](-[MCSessionPeerState outgoingStreams](self, "outgoingStreams"), "count"), -[NSMutableDictionary count](-[MCSessionPeerState incomingStreams](self, "incomingStreams"), "count"));
}

- (MCPeerID)peerID
{
  return self->_peerID;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSMutableDictionary)outgoingStreamRequests
{
  return self->_outgoingStreamRequests;
}

- (void)setOutgoingStreamRequests:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSMutableDictionary)incomingStreams
{
  return self->_incomingStreams;
}

- (void)setIncomingStreams:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSMutableDictionary)outgoingStreams
{
  return self->_outgoingStreams;
}

- (void)setOutgoingStreams:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSData)nearbyConnectionData
{
  return self->_nearbyConnectionData;
}

- (void)setNearbyConnectionData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)connectPeerCalled
{
  return self->_connectPeerCalled;
}

- (void)setConnectPeerCalled:(BOOL)a3
{
  self->_connectPeerCalled = a3;
}

- (int64_t)certificateDecision
{
  return self->_certificateDecision;
}

- (void)setCertificateDecision:(int64_t)a3
{
  self->_certificateDecision = a3;
}

@end
