@implementation _IDSDataChannelLinkContext

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  const char *v6;
  uint64_t estimatedPerPacketConstantOverhead;
  uint64_t RATType;
  uint64_t maxBitrate;
  uint64_t remoteNetworkType;
  unint64_t v11;
  const char *v12;
  uint64_t remoteRATType;
  int64_t relayServerProvider;
  NSUInteger v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  uint64_t maxMTU;
  uint64_t networkType;
  const char *v22;
  uint64_t linkID;
  void *v24;

  linkID = self->_linkID;
  v24 = (void *)MEMORY[0x1E0CB3940];
  -[NSUUID UUIDString](self->_linkUUID, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUUID UUIDString](self->_QRSessionID, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = self->_connectionType - 1;
  if (v5 > 4)
    v6 = "---";
  else
    v6 = off_1E2C64C50[v5];
  v22 = v6;
  networkType = self->_networkType;
  maxMTU = self->_maxMTU;
  estimatedPerPacketConstantOverhead = self->_estimatedPerPacketConstantOverhead;
  RATType = self->_RATType;
  maxBitrate = self->_maxBitrate;
  remoteNetworkType = self->_remoteNetworkType;
  v11 = self->_remoteConnectionType - 1;
  if (v11 > 4)
    v12 = "---";
  else
    v12 = off_1E2C64C50[v11];
  remoteRATType = self->_remoteRATType;
  relayServerProvider = self->_relayServerProvider;
  v15 = -[NSData length](self->_relaySessionToken, "length");
  v16 = CFSTR("YES");
  if (self->_serverIsDegraded)
    v17 = CFSTR("YES");
  else
    v17 = CFSTR("NO");
  if (!self->_isVirtualRelayLink)
    v16 = CFSTR("NO");
  objc_msgSend(v24, "stringWithFormat:", CFSTR("<LinkContext %p> linkID %d (UUID:%@, QRSessionID:%@) networkType %u connectionType %s maxMTU %u estimatedConstantOverhead %u RATType %lu maxBitrate %u (remote networkType %u connectionType %s RATType %lu), relay(provider:%d, token:%dB) serverIsDegraded: %@ localLinkFlags 0x%x remoteLinkFlags 0x%x, localDataSoMask: %u, remoteDataSoMask: %u, virtualRelayLink: %@, delegatedLinkID %d, localInterfaceName: %@, relayProtocolStack: %@ connections: %@, qrExperiments: %@"), self, linkID, v3, v4, networkType, v22, maxMTU, estimatedPerPacketConstantOverhead, RATType, maxBitrate, remoteNetworkType, v12, remoteRATType, relayServerProvider, v15, v17,
    self->_localLinkFlags,
    self->_remoteLinkFlags,
    self->_localDataSoMask,
    self->_remoteDataSoMask,
    v16,
    self->_delegatedLinkID,
    self->_localInterfaceName,
    self->_relayProtocolStackDescription,
    self->_connections,
    self->_qrExperiments);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hbhDecryptionkey, 0);
  objc_storeStrong((id *)&self->_hbhEncryptionkey, 0);
  objc_storeStrong((id *)&self->_qrExperiments, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_relayProtocolStackDescription, 0);
  objc_storeStrong((id *)&self->_localInterfaceName, 0);
  objc_storeStrong((id *)&self->_relaySessionKey, 0);
  objc_storeStrong((id *)&self->_relaySessionToken, 0);
  objc_storeStrong((id *)&self->_QRSessionID, 0);
  objc_storeStrong((id *)&self->_linkUUID, 0);
}

@end
