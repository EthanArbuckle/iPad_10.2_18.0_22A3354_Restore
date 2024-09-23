@implementation HDCodableWorkoutSessionSyncTransaction

- (BOOL)hasSessionUUID
{
  return self->_sessionUUID != 0;
}

- (BOOL)hasConfiguration
{
  return self->_configuration != 0;
}

- (BOOL)hasGlobalState
{
  return self->_globalState != 0;
}

- (BOOL)hasArbitraryData
{
  return self->_arbitraryData != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HDCodableWorkoutSessionSyncTransaction;
  -[HDCodableWorkoutSessionSyncTransaction description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableWorkoutSessionSyncTransaction dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *sessionUUID;
  HDCodableWorkoutSessionConfiguration *configuration;
  void *v7;
  HDCodableWorkoutSessionGlobalState *globalState;
  void *v9;
  NSData *arbitraryData;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  sessionUUID = self->_sessionUUID;
  if (sessionUUID)
    objc_msgSend(v3, "setObject:forKey:", sessionUUID, CFSTR("sessionUUID"));
  configuration = self->_configuration;
  if (configuration)
  {
    -[HDCodableWorkoutSessionConfiguration dictionaryRepresentation](configuration, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("configuration"));

  }
  globalState = self->_globalState;
  if (globalState)
  {
    -[HDCodableWorkoutSessionGlobalState dictionaryRepresentation](globalState, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("globalState"));

  }
  arbitraryData = self->_arbitraryData;
  if (arbitraryData)
    objc_msgSend(v4, "setObject:forKey:", arbitraryData, CFSTR("arbitraryData"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableWorkoutSessionSyncTransactionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_sessionUUID)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_configuration)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_globalState)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_arbitraryData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_sessionUUID)
  {
    objc_msgSend(v4, "setSessionUUID:");
    v4 = v5;
  }
  if (self->_configuration)
  {
    objc_msgSend(v5, "setConfiguration:");
    v4 = v5;
  }
  if (self->_globalState)
  {
    objc_msgSend(v5, "setGlobalState:");
    v4 = v5;
  }
  if (self->_arbitraryData)
  {
    objc_msgSend(v5, "setArbitraryData:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_sessionUUID, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  v8 = -[HDCodableWorkoutSessionConfiguration copyWithZone:](self->_configuration, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[HDCodableWorkoutSessionGlobalState copyWithZone:](self->_globalState, "copyWithZone:", a3);
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[NSData copyWithZone:](self->_arbitraryData, "copyWithZone:", a3);
  v13 = (void *)v5[1];
  v5[1] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *sessionUUID;
  HDCodableWorkoutSessionConfiguration *configuration;
  HDCodableWorkoutSessionGlobalState *globalState;
  NSData *arbitraryData;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((sessionUUID = self->_sessionUUID, !((unint64_t)sessionUUID | v4[4]))
     || -[NSData isEqual:](sessionUUID, "isEqual:"))
    && ((configuration = self->_configuration, !((unint64_t)configuration | v4[2]))
     || -[HDCodableWorkoutSessionConfiguration isEqual:](configuration, "isEqual:"))
    && ((globalState = self->_globalState, !((unint64_t)globalState | v4[3]))
     || -[HDCodableWorkoutSessionGlobalState isEqual:](globalState, "isEqual:")))
  {
    arbitraryData = self->_arbitraryData;
    if ((unint64_t)arbitraryData | v4[1])
      v9 = -[NSData isEqual:](arbitraryData, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = -[NSData hash](self->_sessionUUID, "hash");
  v4 = -[HDCodableWorkoutSessionConfiguration hash](self->_configuration, "hash") ^ v3;
  v5 = -[HDCodableWorkoutSessionGlobalState hash](self->_globalState, "hash");
  return v4 ^ v5 ^ -[NSData hash](self->_arbitraryData, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  HDCodableWorkoutSessionConfiguration *configuration;
  uint64_t v6;
  HDCodableWorkoutSessionGlobalState *globalState;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  v9 = v4;
  if (v4[4])
  {
    -[HDCodableWorkoutSessionSyncTransaction setSessionUUID:](self, "setSessionUUID:");
    v4 = v9;
  }
  configuration = self->_configuration;
  v6 = v4[2];
  if (configuration)
  {
    if (!v6)
      goto LABEL_9;
    -[HDCodableWorkoutSessionConfiguration mergeFrom:](configuration, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[HDCodableWorkoutSessionSyncTransaction setConfiguration:](self, "setConfiguration:");
  }
  v4 = v9;
LABEL_9:
  globalState = self->_globalState;
  v8 = v4[3];
  if (globalState)
  {
    if (!v8)
      goto LABEL_15;
    -[HDCodableWorkoutSessionGlobalState mergeFrom:](globalState, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_15;
    -[HDCodableWorkoutSessionSyncTransaction setGlobalState:](self, "setGlobalState:");
  }
  v4 = v9;
LABEL_15:
  if (v4[1])
  {
    -[HDCodableWorkoutSessionSyncTransaction setArbitraryData:](self, "setArbitraryData:");
    v4 = v9;
  }

}

- (NSData)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionUUID, a3);
}

- (HDCodableWorkoutSessionConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (HDCodableWorkoutSessionGlobalState)globalState
{
  return self->_globalState;
}

- (void)setGlobalState:(id)a3
{
  objc_storeStrong((id *)&self->_globalState, a3);
}

- (NSData)arbitraryData
{
  return self->_arbitraryData;
}

- (void)setArbitraryData:(id)a3
{
  objc_storeStrong((id *)&self->_arbitraryData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_globalState, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_arbitraryData, 0);
}

@end
