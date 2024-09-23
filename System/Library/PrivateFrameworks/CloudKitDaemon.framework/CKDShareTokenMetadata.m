@implementation CKDShareTokenMetadata

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend_routingKey(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_copy(v7, v8, v9);
  v11 = (void *)v4[2];
  v4[2] = v10;

  objc_msgSend_shortSharingTokenData(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_copy(v14, v15, v16);
  v18 = (void *)v4[3];
  v4[3] = v17;

  objc_msgSend_privateTokenData(self, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_copy(v21, v22, v23);
  v25 = (void *)v4[5];
  v4[5] = v24;

  objc_msgSend_publicTokenData(self, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend_copy(v28, v29, v30);
  v32 = (void *)v4[4];
  v4[4] = v31;

  objc_msgSend_participantID(self, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend_copy(v35, v36, v37);
  v39 = (void *)v4[6];
  v4[6] = v38;

  return v4;
}

- (NSString)shortSharingToken
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_shortSharingTokenData(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_CKBase64URLSafeString(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSData)shortSharingTokenHashData
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  const void *v6;
  const char *v7;
  CC_LONG v8;
  const char *v9;
  void *v10;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend_shortSharingToken(self, a2, v2, 0, 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (const void *)objc_msgSend_UTF8String(v3, v4, v5);
  v8 = objc_msgSend_lengthOfBytesUsingEncoding_(v3, v7, 4);
  CC_SHA256(v6, v8, (unsigned __int8 *)&v12);
  objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v9, (uint64_t)&v12, 32);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v10;
}

- (NSString)routingKey
{
  return self->_routingKey;
}

- (void)setRoutingKey:(id)a3
{
  objc_storeStrong((id *)&self->_routingKey, a3);
}

- (NSData)shortSharingTokenData
{
  return self->_shortSharingTokenData;
}

- (void)setShortSharingTokenData:(id)a3
{
  objc_storeStrong((id *)&self->_shortSharingTokenData, a3);
}

- (BOOL)forceDSRefetch
{
  return self->_forceDSRefetch;
}

- (void)setForceDSRefetch:(BOOL)a3
{
  self->_forceDSRefetch = a3;
}

- (NSData)publicTokenData
{
  return self->_publicTokenData;
}

- (void)setPublicTokenData:(id)a3
{
  objc_storeStrong((id *)&self->_publicTokenData, a3);
}

- (NSData)privateTokenData
{
  return self->_privateTokenData;
}

- (void)setPrivateTokenData:(id)a3
{
  objc_storeStrong((id *)&self->_privateTokenData, a3);
}

- (NSString)participantID
{
  return self->_participantID;
}

- (void)setParticipantID:(id)a3
{
  objc_storeStrong((id *)&self->_participantID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantID, 0);
  objc_storeStrong((id *)&self->_privateTokenData, 0);
  objc_storeStrong((id *)&self->_publicTokenData, 0);
  objc_storeStrong((id *)&self->_shortSharingTokenData, 0);
  objc_storeStrong((id *)&self->_routingKey, 0);
}

@end
