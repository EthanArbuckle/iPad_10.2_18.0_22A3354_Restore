@implementation BLTRemoteRequestLogItem

+ (id)remoteRequestLogItemWithIDSTransmitIdentifier:(id)a3 IDSResponseIdentifier:(id)a4 requestDescription:(id)a5 sequenceNumber:(id)a6 sessionIdentifier:(id)a7 sessionState:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;

  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = objc_alloc_init((Class)a1);
  objc_msgSend(v19, "setIdsTransmitIdentifier:", v18);

  objc_msgSend(v19, "setIdsResponseIdentifier:", v17);
  objc_msgSend(v19, "setRequestDescription:", v16);

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setCacheDate:", v20);

  objc_msgSend(v19, "setSequenceNumber:", v15);
  objc_msgSend(v19, "setSessionIdentifier:", v14);

  objc_msgSend(v19, "setSessionState:", a8);
  return v19;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTRemoteRequestLogItem idsTransmitIdentifier](self, "idsTransmitIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v4, CFSTR("idsTransmitIdentifier"), 0);

  -[BLTRemoteRequestLogItem idsResponseIdentifier](self, "idsResponseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v6, CFSTR("idsResponseIdentifier"), 1);

  -[BLTRemoteRequestLogItem requestDescription](self, "requestDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v8, CFSTR("requestDescription"), 0);

  -[BLTRemoteRequestLogItem cacheDate](self, "cacheDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v10, CFSTR("cacheDate"), 0);

  -[BLTRemoteRequestLogItem sequenceNumber](self, "sequenceNumber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v12, CFSTR("sequenceNumber"), 0);

  -[BLTRemoteRequestLogItem sessionIdentifier](self, "sessionIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v14, CFSTR("sessionIdentifier"), 0);

  v16 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[BLTRemoteRequestLogItem sessionState](self, "sessionState"), CFSTR("sessionState"));
  objc_msgSend(v3, "build");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (NSString)idsTransmitIdentifier
{
  return self->_idsTransmitIdentifier;
}

- (void)setIdsTransmitIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)idsResponseIdentifier
{
  return self->_idsResponseIdentifier;
}

- (void)setIdsResponseIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)requestDescription
{
  return self->_requestDescription;
}

- (void)setRequestDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)cacheDate
{
  return self->_cacheDate;
}

- (void)setCacheDate:(id)a3
{
  objc_storeStrong((id *)&self->_cacheDate, a3);
}

- (NSNumber)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(id)a3
{
  objc_storeStrong((id *)&self->_sequenceNumber, a3);
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sessionIdentifier, a3);
}

- (unint64_t)sessionState
{
  return self->_sessionState;
}

- (void)setSessionState:(unint64_t)a3
{
  self->_sessionState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_sequenceNumber, 0);
  objc_storeStrong((id *)&self->_cacheDate, 0);
  objc_storeStrong(&self->_requestDescription, 0);
  objc_storeStrong((id *)&self->_idsResponseIdentifier, 0);
  objc_storeStrong((id *)&self->_idsTransmitIdentifier, 0);
}

@end
