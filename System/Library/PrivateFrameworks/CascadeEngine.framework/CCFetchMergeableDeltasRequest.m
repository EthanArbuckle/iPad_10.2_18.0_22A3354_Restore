@implementation CCFetchMergeableDeltasRequest

+ (id)fetchMergableDeltasRequestFromPeerToPeerMessage:(id)a3 stateVector:(id)a4 atomBatchVersion:(unint64_t)a5 isReciprocalRequest:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  CCFetchMergeableDeltasRequest *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  void *v17;
  CCFetchMergeableDeltasRequest *v18;

  v6 = a6;
  v9 = a4;
  v10 = a3;
  v11 = [CCFetchMergeableDeltasRequest alloc];
  objc_msgSend(v10, "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "device");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v10, "protocolVersion");
  objc_msgSend(v10, "walltime");
  v16 = v15;
  objc_msgSend(v10, "peerPublicKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[CCPeerToPeerMessage initWithSet:device:protocolVersion:wallTime:peerPublicKey:](v11, "initWithSet:device:protocolVersion:wallTime:peerPublicKey:", v12, v13, v14, v17, v16);
  -[CCFetchMergeableDeltasRequest setStateVector:](v18, "setStateVector:", v9);

  -[CCFetchMergeableDeltasRequest setAtomBatchVersion:](v18, "setAtomBatchVersion:", a5);
  -[CCFetchMergeableDeltasRequest setIsReciprocalRequest:](v18, "setIsReciprocalRequest:", v6);
  return v18;
}

- (id)initFromDictionary:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v22;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CCFetchMergeableDeltasRequest;
  v5 = -[CCPeerToPeerMessage initFromDictionary:](&v23, sel_initFromDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("atomBatchVersion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5[8] = objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isReciprocalRequest"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *((_BYTE *)v5 + 48) = objc_msgSend(v7, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("stateVector"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BDD1620];
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(v9, "unarchivedObjectOfClasses:fromData:error:", v10, v8, &v22);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v22;
    v13 = (void *)v5[7];
    v5[7] = v11;

    if (v12)
    {
      __biome_log_for_category();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[CCFetchMergeableDeltasRequest initFromDictionary:].cold.1((uint64_t)v12, v14, v15, v16, v17, v18, v19, v20);

    }
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  CKDistributedTimestampStateVector *stateVector;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;
  id v21;
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x24BDAC8D0];
  stateVector = self->_stateVector;
  v21 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", stateVector, 1, &v21);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v21;
  if (v5)
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[CCFetchMergeableDeltasRequest dictionaryRepresentation].cold.1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

  }
  v22[0] = CFSTR("stateVector");
  v13 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "data");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[0] = v13;
  v22[1] = CFSTR("atomBatchVersion");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_atomBatchVersion);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v14;
  v22[2] = CFSTR("isReciprocalRequest");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isReciprocalRequest);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");

  if (!v4)
  v20.receiver = self;
  v20.super_class = (Class)CCFetchMergeableDeltasRequest;
  -[CCPeerToPeerMessage dictionaryRepresentation](&v20, sel_dictionaryRepresentation);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addEntriesFromDictionary:", v18);

  return v17;
}

- (CKDistributedTimestampStateVector)stateVector
{
  return self->_stateVector;
}

- (void)setStateVector:(id)a3
{
  objc_storeStrong((id *)&self->_stateVector, a3);
}

- (unint64_t)atomBatchVersion
{
  return self->_atomBatchVersion;
}

- (void)setAtomBatchVersion:(unint64_t)a3
{
  self->_atomBatchVersion = a3;
}

- (BOOL)isReciprocalRequest
{
  return self->_isReciprocalRequest;
}

- (void)setIsReciprocalRequest:(BOOL)a3
{
  self->_isReciprocalRequest = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateVector, 0);
}

- (void)initFromDictionary:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_237B02000, a2, a3, "failed to unarchive CKDistributedTimestampStateVector with error %@", a5, a6, a7, a8, 2u);
}

- (void)dictionaryRepresentation
{
  OUTLINED_FUNCTION_0_3(&dword_237B02000, a2, a3, "failed to archive CKDistributedTimestampStateVector with error %@", a5, a6, a7, a8, 2u);
}

@end
