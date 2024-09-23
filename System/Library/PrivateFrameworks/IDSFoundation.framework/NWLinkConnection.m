@implementation NWLinkConnection

- (NWLinkConnection)initWithType:(unint64_t)a3 interfaceIndex:(unsigned int)a4 localEndpoint:(id)a5 remoteEndpoint:(id)a6
{
  id v11;
  id v12;
  NWLinkConnection *v13;
  NWLinkConnection *v14;
  NSMutableSet *v15;
  NSMutableSet *children;
  objc_super v18;

  v11 = a5;
  v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)NWLinkConnection;
  v13 = -[NWLinkConnection init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    if (!v13->_children)
    {
      v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      children = v14->_children;
      v14->_children = v15;

    }
    v14->_type = a3;
    v14->_interfaceIndex = a4;
    objc_storeStrong((id *)&v14->_localEndpoint, a5);
    objc_storeStrong((id *)&v14->_remoteEndpoint, a6);
    v14->_state = 0;
  }

  return v14;
}

- (NWLinkConnection)initWithType:(unint64_t)a3 interfaceIndex:(unsigned int)a4 localEndpoint:(id)a5 remoteEndpoint:(id)a6 isH2Connection:(BOOL)a7
{
  _BOOL4 v7;
  id v13;
  id v14;
  NWLinkConnection *v15;
  NWLinkConnection *v16;
  NSMutableSet *v17;
  NSMutableSet *children;
  uint64_t v19;
  objc_super v21;

  v7 = a7;
  v13 = a5;
  v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)NWLinkConnection;
  v15 = -[NWLinkConnection init](&v21, sel_init);
  v16 = v15;
  if (v15)
  {
    if (!v15->_children)
    {
      v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      children = v16->_children;
      v16->_children = v17;

    }
    v16->_type = a3;
    v16->_interfaceIndex = a4;
    v19 = 80;
    if (v7)
      v19 = 88;
    objc_storeStrong((id *)((char *)&v16->super.isa + v19), a5);
    objc_storeStrong((id *)&v16->_remoteEndpoint, a6);
    v16->_isH2Connection = v7;
    v16->_state = 0;
  }

  return v16;
}

- (NWLinkConnection)initWithBaseNWLinkConnection:(id)a3 type:(unint64_t)a4
{
  id v6;
  NWLinkConnection *v7;
  const char *v8;
  uint64_t v9;
  double v10;
  NWLinkConnection *v11;
  NSMutableSet *v12;
  NSMutableSet *children;
  const char *v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  OS_nw_endpoint *localEndpoint;
  const char *v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  OS_nw_endpoint *remoteEndpoint;
  const char *v24;
  uint64_t v25;
  double v26;
  const char *v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  NSString *sessionID;
  const char *v32;
  uint64_t v33;
  double v34;
  const char *v35;
  uint64_t v36;
  double v37;
  objc_super v39;

  v6 = a3;
  v39.receiver = self;
  v39.super_class = (Class)NWLinkConnection;
  v7 = -[NWLinkConnection init](&v39, sel_init);
  v11 = v7;
  if (v7)
  {
    if (!v7->_children)
    {
      v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      children = v11->_children;
      v11->_children = v12;

    }
    v11->_type = a4;
    v11->_interfaceIndex = objc_msgSend_interfaceIndex(v6, v8, v9, v10);
    objc_msgSend_localEndpoint(v6, v14, v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    localEndpoint = v11->_localEndpoint;
    v11->_localEndpoint = (OS_nw_endpoint *)v17;

    objc_msgSend_remoteEndpoint(v6, v19, v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    remoteEndpoint = v11->_remoteEndpoint;
    v11->_remoteEndpoint = (OS_nw_endpoint *)v22;

    v11->_supportsNAT64 = objc_msgSend_supportsNAT64(v6, v24, v25, v26);
    objc_msgSend_sessionID(v6, v27, v28, v29);
    v30 = objc_claimAutoreleasedReturnValue();
    sessionID = v11->_sessionID;
    v11->_sessionID = (NSString *)v30;

    v11->_isH2Connection = objc_msgSend_isH2Connection(v6, v32, v33, v34);
    v11->_hasRequiredInterface = objc_msgSend_hasRequiredInterface(v6, v35, v36, v37);
    v11->_state = 0;
  }

  return v11;
}

- (void)setConnection:(id)a3
{
  id v5;
  unint64_t id;

  objc_storeStrong((id *)&self->_connection, a3);
  v5 = a3;
  id = nw_connection_get_id();

  self->_connectionID = id;
}

- (BOOL)isConnected
{
  return self->_state == 1;
}

- (BOOL)hasDisconnected
{
  return self->_state - 3 < 2;
}

- (BOOL)hasFailed
{
  return self->_state == 4;
}

- (NWLinkConnection)parent
{
  return (NWLinkConnection *)objc_loadWeakRetained((id *)&self->_parent);
}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->_parent, a3);
}

- (NSMutableSet)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
  objc_storeStrong((id *)&self->_children, a3);
}

- (OS_nw_connection)connection
{
  return self->_connection;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)isH2Connection
{
  return self->_isH2Connection;
}

- (void)setIsH2Connection:(BOOL)a3
{
  self->_isH2Connection = a3;
}

- (unint64_t)connectionID
{
  return self->_connectionID;
}

- (BOOL)hasRequiredInterface
{
  return self->_hasRequiredInterface;
}

- (void)setHasRequiredInterface:(BOOL)a3
{
  self->_hasRequiredInterface = a3;
}

- (unsigned)interfaceIndex
{
  return self->_interfaceIndex;
}

- (OS_nw_endpoint)localEndpoint
{
  return self->_localEndpoint;
}

- (void)setLocalEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_localEndpoint, a3);
}

- (OS_nw_endpoint)cachedH2LocalEndpoint
{
  return self->_cachedH2LocalEndpoint;
}

- (OS_nw_endpoint)remoteEndpoint
{
  return self->_remoteEndpoint;
}

- (BOOL)supportsNAT64
{
  return self->_supportsNAT64;
}

- (void)setSupportsNAT64:(BOOL)a3
{
  self->_supportsNAT64 = a3;
}

- (BOOL)peelOffNewConnection
{
  return self->_peelOffNewConnection;
}

- (void)setPeelOffNewConnection:(BOOL)a3
{
  self->_peelOffNewConnection = a3;
}

- (unint64_t)disconnectionState
{
  return self->_disconnectionState;
}

- (void)setDisconnectionState:(unint64_t)a3
{
  self->_disconnectionState = a3;
}

- (BOOL)ignoreCancel
{
  return self->_ignoreCancel;
}

- (void)setIgnoreCancel:(BOOL)a3
{
  self->_ignoreCancel = a3;
}

- (double)scheduledDisconnectTime
{
  return self->_scheduledDisconnectTime;
}

- (void)setScheduledDisconnectTime:(double)a3
{
  self->_scheduledDisconnectTime = a3;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (unint64_t)transactionID
{
  return self->_transactionID;
}

- (void)setTransactionID:(unint64_t)a3
{
  self->_transactionID = a3;
}

- (unsigned)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(unsigned int)a3
{
  self->_messageType = a3;
}

- (IDSCapsuleParser)capsuleParser
{
  return self->_capsuleParser;
}

- (void)setCapsuleParser:(id)a3
{
  objc_storeStrong((id *)&self->_capsuleParser, a3);
}

- (BOOL)hasQUICStarted
{
  return self->_hasQUICStarted;
}

- (void)setHasQUICStarted:(BOOL)a3
{
  self->_hasQUICStarted = a3;
}

- (unsigned)channelNumber
{
  return self->_channelNumber;
}

- (void)setChannelNumber:(unsigned __int16)a3
{
  self->_channelNumber = a3;
}

- (unsigned)localQUICConnectionID
{
  return self->_localQUICConnectionID;
}

- (void)setLocalQUICConnectionID:(unsigned int)a3
{
  self->_localQUICConnectionID = a3;
}

- (OS_nw_parameters)quicPodParamaters
{
  return self->_quicPodParamaters;
}

- (void)setQuicPodParamaters:(id)a3
{
  objc_storeStrong((id *)&self->_quicPodParamaters, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSString)protocolStackDescription
{
  return self->_protocolStackDescription;
}

- (void)setProtocolStackDescription:(id)a3
{
  objc_storeStrong((id *)&self->_protocolStackDescription, a3);
}

- (OS_nw_content_context)contentContext
{
  return self->_contentContext;
}

- (void)setContentContext:(id)a3
{
  objc_storeStrong((id *)&self->_contentContext, a3);
}

- (BOOL)shouldTreatNextTryAsFirstTry
{
  return self->_shouldTreatNextTryAsFirstTry;
}

- (void)setShouldTreatNextTryAsFirstTry:(BOOL)a3
{
  self->_shouldTreatNextTryAsFirstTry = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentContext, 0);
  objc_storeStrong((id *)&self->_protocolStackDescription, 0);
  objc_storeStrong((id *)&self->_quicPodParamaters, 0);
  objc_storeStrong((id *)&self->_capsuleParser, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_remoteEndpoint, 0);
  objc_storeStrong((id *)&self->_cachedH2LocalEndpoint, 0);
  objc_storeStrong((id *)&self->_localEndpoint, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_destroyWeak((id *)&self->_parent);
}

@end
