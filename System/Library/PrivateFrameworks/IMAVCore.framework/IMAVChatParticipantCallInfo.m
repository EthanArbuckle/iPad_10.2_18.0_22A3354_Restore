@implementation IMAVChatParticipantCallInfo

- (IMAVChatParticipantCallInfo)init
{
  IMAVChatParticipantCallInfo *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMAVChatParticipantCallInfo;
  result = -[IMAVChatParticipantCallInfo init](&v3, sel_init);
  if (result)
    result->_state = 0;
  return result;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  objc_super v41;

  objc_msgSend_setRelayInitiate_(self, a2, 0, v2, v3);
  objc_msgSend_setRelayUpdate_(self, v5, 0, v6, v7);
  objc_msgSend_setRelayCancel_(self, v8, 0, v9, v10);
  objc_msgSend_setLocalNATType_(self, v11, 0, v12, v13);
  objc_msgSend_setRemoteNATType_(self, v14, 0, v15, v16);
  objc_msgSend_setRemoteNATIP_(self, v17, 0, v18, v19);
  objc_msgSend_setLocalNATIP_(self, v20, 0, v21, v22);
  objc_msgSend_setRemoteSKEData_(self, v23, 0, v24, v25);
  objc_msgSend_setLocalSKEData_(self, v26, 0, v27, v28);
  objc_msgSend_setPeerCN_(self, v29, 0, v30, v31);
  objc_msgSend_setPeerProtocolVersion_(self, v32, 0, v33, v34);
  objc_msgSend_setRemoteICEData_(self, v35, 0, v36, v37);
  objc_msgSend_setLocalICEData_(self, v38, 0, v39, v40);
  v41.receiver = self;
  v41.super_class = (Class)IMAVChatParticipantCallInfo;
  -[IMAVChatParticipantCallInfo dealloc](&v41, sel_dealloc);
}

- (BOOL)isFinished
{
  return self->_state == 5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int isFinished;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int isBeingHandedOff;
  const char *v20;
  uint64_t v21;
  uint64_t v22;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v9 = objc_msgSend_state(self, v5, v6, v7, v8);
  isFinished = objc_msgSend_isFinished(self, v10, v11, v12, v13);
  isBeingHandedOff = objc_msgSend_isBeingHandedOff(self, v15, v16, v17, v18);
  return (id)objc_msgSend_stringWithFormat_(v3, v20, (uint64_t)CFSTR("<%@ %p state = %d, isFinished = %d, isBeingHandedOff = %d, callID = %d, inviteNeedsDelivery = %d>"), v21, v22, v4, self, v9, isFinished, isBeingHandedOff, self->_callID, self->_inviteNeedsDelivery);
}

- (NSDictionary)relayInitiate
{
  return self->_relayInitiate;
}

- (void)setRelayInitiate:(id)a3
{
  objc_storeStrong((id *)&self->_relayInitiate, a3);
}

- (NSDictionary)relayUpdate
{
  return self->_relayUpdate;
}

- (void)setRelayUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_relayUpdate, a3);
}

- (NSDictionary)relayCancel
{
  return self->_relayCancel;
}

- (void)setRelayCancel:(id)a3
{
  objc_storeStrong((id *)&self->_relayCancel, a3);
}

- (unsigned)callID
{
  return self->_callID;
}

- (void)setCallID:(unsigned int)a3
{
  self->_callID = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (BOOL)isBeingHandedOff
{
  return self->_isBeingHandedOff;
}

- (void)setIsBeingHandedOff:(BOOL)a3
{
  self->_isBeingHandedOff = a3;
}

- (NSData)remoteICEData
{
  return self->_remoteICEData;
}

- (void)setRemoteICEData:(id)a3
{
  objc_storeStrong((id *)&self->_remoteICEData, a3);
}

- (NSData)localICEData
{
  return self->_localICEData;
}

- (void)setLocalICEData:(id)a3
{
  objc_storeStrong((id *)&self->_localICEData, a3);
}

- (NSData)localSKEData
{
  return self->_localSKEData;
}

- (void)setLocalSKEData:(id)a3
{
  objc_storeStrong((id *)&self->_localSKEData, a3);
}

- (NSData)remoteSKEData
{
  return self->_remoteSKEData;
}

- (void)setRemoteSKEData:(id)a3
{
  objc_storeStrong((id *)&self->_remoteSKEData, a3);
}

- (NSString)peerCN
{
  return self->_peerCN;
}

- (void)setPeerCN:(id)a3
{
  objc_storeStrong((id *)&self->_peerCN, a3);
}

- (NSNumber)peerProtocolVersion
{
  return self->_peerProtocolVersion;
}

- (void)setPeerProtocolVersion:(id)a3
{
  objc_storeStrong((id *)&self->_peerProtocolVersion, a3);
}

- (NSNumber)localNATType
{
  return self->_localNATType;
}

- (void)setLocalNATType:(id)a3
{
  objc_storeStrong((id *)&self->_localNATType, a3);
}

- (NSNumber)remoteNATType
{
  return self->_remoteNATType;
}

- (void)setRemoteNATType:(id)a3
{
  objc_storeStrong((id *)&self->_remoteNATType, a3);
}

- (NSData)localNATIP
{
  return self->_localNATIP;
}

- (void)setLocalNATIP:(id)a3
{
  objc_storeStrong((id *)&self->_localNATIP, a3);
}

- (NSData)remoteNATIP
{
  return self->_remoteNATIP;
}

- (void)setRemoteNATIP:(id)a3
{
  objc_storeStrong((id *)&self->_remoteNATIP, a3);
}

- (BOOL)isAudioPaused
{
  return self->_isAudioPaused;
}

- (BOOL)isVideoPaused
{
  return self->_isVideoPaused;
}

- (void)setIsVideoPaused:(BOOL)a3
{
  self->_isVideoPaused = a3;
}

- (BOOL)isReinitiate
{
  return self->_isReinitiate;
}

- (void)setIsReinitiate:(BOOL)a3
{
  self->_isReinitiate = a3;
}

- (unint64_t)localConnectionType
{
  return self->_localConnectionType;
}

- (void)setLocalConnectionType:(unint64_t)a3
{
  self->_localConnectionType = a3;
}

- (unint64_t)remoteConnectionType
{
  return self->_remoteConnectionType;
}

- (void)setRemoteConnectionType:(unint64_t)a3
{
  self->_remoteConnectionType = a3;
}

- (BOOL)inviteNeedsDelivery
{
  return self->_inviteNeedsDelivery;
}

- (void)setInviteNeedsDelivery:(BOOL)a3
{
  self->_inviteNeedsDelivery = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteSKEData, 0);
  objc_storeStrong((id *)&self->_localSKEData, 0);
  objc_storeStrong((id *)&self->_peerProtocolVersion, 0);
  objc_storeStrong((id *)&self->_remoteNATType, 0);
  objc_storeStrong((id *)&self->_localNATType, 0);
  objc_storeStrong((id *)&self->_peerCN, 0);
  objc_storeStrong((id *)&self->_localICEData, 0);
  objc_storeStrong((id *)&self->_remoteICEData, 0);
  objc_storeStrong((id *)&self->_localNATIP, 0);
  objc_storeStrong((id *)&self->_remoteNATIP, 0);
  objc_storeStrong((id *)&self->_relayCancel, 0);
  objc_storeStrong((id *)&self->_relayUpdate, 0);
  objc_storeStrong((id *)&self->_relayInitiate, 0);
}

@end
