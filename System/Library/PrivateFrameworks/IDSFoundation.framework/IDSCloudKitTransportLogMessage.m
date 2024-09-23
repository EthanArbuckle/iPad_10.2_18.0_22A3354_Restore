@implementation IDSCloudKitTransportLogMessage

- (ENGroupID)groupID
{
  uint64_t v2;
  double v3;
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  id v9;
  const char *v10;
  double v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  double v15;
  NSObject *v16;
  int v18;
  IDSCloudKitTransportLogMessage *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend_payload(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, (uint64_t)CFSTR("gI"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
LABEL_6:
    v14 = 0;
    goto LABEL_7;
  }
  v9 = objc_alloc(MEMORY[0x1E0D1F450]);
  v14 = (void *)objc_msgSend_initWithDataRepresentation_(v9, v10, (uint64_t)v8, v11);
  if (!v14)
  {
    objc_msgSend_cloudKit(IDSFoundationLog, v12, v13, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138478083;
      v19 = self;
      v20 = 2114;
      v21 = v8;
      _os_log_impl(&dword_19B949000, v16, OS_LOG_TYPE_DEFAULT, "Failed to create groupID from transportMessage {groupMessage: %{private}@, groupIDString: %{public}@", (uint8_t *)&v18, 0x16u);
    }

    goto LABEL_6;
  }
LABEL_7:

  return (ENGroupID *)v14;
}

- (NSString)recipientAlias
{
  uint64_t v2;
  double v3;
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  char *v12;
  uint64_t v13;
  double v14;

  objc_msgSend_payload(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, (uint64_t)CFSTR("tP"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend_cloudKit(IDSFoundationLog, v9, v10, v11);
    v12 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
      sub_19BAF7024(self, v12, v13, v14);

  }
  return (NSString *)v8;
}

- (NSString)senderAlias
{
  uint64_t v2;
  double v3;
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  char *v12;
  uint64_t v13;
  double v14;

  objc_msgSend_payload(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, (uint64_t)CFSTR("sP"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend_cloudKit(IDSFoundationLog, v9, v10, v11);
    v12 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
      sub_19BAF70A4(self, v12, v13, v14);

  }
  return (NSString *)v8;
}

- (IDSDestinationPushToken)destination
{
  uint64_t v2;
  double v3;
  void *v5;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  double v18;
  void *v19;
  NSObject *v20;

  objc_msgSend_payload(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v6, (uint64_t)CFSTR("t"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend_cloudKit(IDSFoundationLog, v9, v10, v11);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_19BAF7124();
    goto LABEL_9;
  }
  objc_msgSend_payload(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v12, v13, (uint64_t)CFSTR("sP"), v14);
  v15 = objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend_cloudKit(IDSFoundationLog, v16, v17, v18);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_19BAF7188();

LABEL_9:
    v19 = 0;
    goto LABEL_10;
  }
  objc_msgSend_destinationWithAlias_pushToken_(IDSDestination, v16, (uint64_t)v15, v18, v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return (IDSDestinationPushToken *)v19;
}

- (NSData)encryptedPayload
{
  uint64_t v2;
  double v3;
  void *v4;
  const char *v5;
  double v6;
  void *v7;

  objc_msgSend_payload(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v4, v5, (uint64_t)CFSTR("P"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v7;
}

- (NSString)cypherIdentifier
{
  uint64_t v2;
  double v3;
  void *v4;
  const char *v5;
  double v6;
  void *v7;

  objc_msgSend_payload(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v4, v5, (uint64_t)CFSTR("E"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_storeStrong((id *)&self->_payload, a3);
}

- (NSString)secondaryID
{
  return self->_secondaryID;
}

- (void)setSecondaryID:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryID, a3);
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceID, a3);
}

- (NSString)encryptionType
{
  return self->_encryptionType;
}

- (void)setEncryptionType:(id)a3
{
  objc_storeStrong((id *)&self->_encryptionType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionType, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_secondaryID, 0);
  objc_storeStrong((id *)&self->_payload, 0);
}

@end
