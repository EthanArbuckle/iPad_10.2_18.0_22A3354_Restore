@implementation BLTPBProtobufSequenceNumberManager

- (BLTPBProtobufSequenceNumberManager)initWithServiceName:(id)a3 updateSequenceNumbersOnOutOfOrder:(BOOL)a4
{
  return -[BLTPBProtobufSequenceNumberManager initWithServiceName:updateSequenceNumbersOnOutOfOrder:duplicateCapacity:](self, "initWithServiceName:updateSequenceNumbersOnOutOfOrder:duplicateCapacity:", a3, a4, 8000);
}

- (BLTPBProtobufSequenceNumberManager)initWithServiceName:(id)a3 updateSequenceNumbersOnOutOfOrder:(BOOL)a4 duplicateCapacity:(unint64_t)a5
{
  id v8;
  BLTPBProtobufSequenceNumberManager *v9;
  NSLock *v10;
  NSLock *sequenceNumberAccess;
  uint64_t v12;
  NSString *serviceName;
  objc_super v15;

  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BLTPBProtobufSequenceNumberManager;
  v9 = -[BLTPBProtobufSequenceNumberManager init](&v15, sel_init);
  if (v9)
  {
    v10 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    sequenceNumberAccess = v9->_sequenceNumberAccess;
    v9->_sequenceNumberAccess = v10;

    v12 = objc_msgSend(v8, "copy");
    serviceName = v9->_serviceName;
    v9->_serviceName = (NSString *)v12;

    v9->_updateSequenceNumbersOnOutOfOrder = a4;
    -[BLTPBProtobufSequenceNumberManager _readSequenceNumbersFromStoreWithInitialDuplicateCapacity:](v9, "_readSequenceNumbersFromStoreWithInitialDuplicateCapacity:", a5);
  }

  return v9;
}

- (int64_t)setRecvSequenceNumber:(unint64_t)a3 recvSessionIdentifier:(id)a4 force:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  int64_t v10;
  NSUUID *recvSessionIdentifier;

  v5 = a5;
  v9 = a4;
  -[NSLock lock](self->_sequenceNumberAccess, "lock");
  if (v5)
  {
    -[BLTCircularBitBuffer clear](self->_duplicateEntries, "clear");
    objc_storeStrong((id *)&self->_recvSessionIdentifier, a4);
    self->_recvSequenceNumber = a3;
LABEL_3:
    -[BLTCircularBitBuffer setBit:atIndex:](self->_duplicateEntries, "setBit:atIndex:", 1, a3);
    v10 = 0;
    goto LABEL_23;
  }
  recvSessionIdentifier = self->_recvSessionIdentifier;
  if (!recvSessionIdentifier)
  {
    v10 = 0;
    goto LABEL_13;
  }
  if ((-[NSUUID isEqual:](recvSessionIdentifier, "isEqual:", v9) & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    v10 = 1;
    if (!self->_updateSequenceNumbersOnOutOfOrder)
      goto LABEL_23;
  }
  if (!self->_recvSessionIdentifier)
  {
LABEL_13:
    if (!v9)
      goto LABEL_15;
    goto LABEL_14;
  }
  if (v9 && self->_updateSequenceNumbersOnOutOfOrder)
LABEL_14:
    objc_storeStrong((id *)&self->_recvSessionIdentifier, a4);
LABEL_15:
  if (-[BLTPBProtobufSequenceNumberManager _isSequenceNumberInOrder:](self, "_isSequenceNumberInOrder:", a3))
  {
    self->_recvSequenceNumber = a3;
    if (v10)
    {
      v10 = 1;
      goto LABEL_23;
    }
    goto LABEL_3;
  }
  if (-[BLTCircularBitBuffer bitAtIndex:](self->_duplicateEntries, "bitAtIndex:", a3) == 1)
    v10 = 3;
  else
    v10 = 1;
  if (self->_updateSequenceNumbersOnOutOfOrder)
    self->_recvSequenceNumber = a3;
LABEL_23:
  -[BLTPBProtobufSequenceNumberManager _writeSequenceNumbersToStore](self, "_writeSequenceNumbersToStore");
  -[NSLock unlock](self->_sequenceNumberAccess, "unlock");

  return v10;
}

- (id)nextSendSequenceNumber
{
  void *v3;

  -[NSLock lock](self->_sequenceNumberAccess, "lock");
  ++self->_sendSequenceNumber;
  if (-[BLTPBProtobufSequenceNumberManager _writeSequenceNumbersToStore](self, "_writeSequenceNumbersToStore"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_sendSequenceNumber);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
    --self->_sendSequenceNumber;
  }
  -[NSLock unlock](self->_sequenceNumberAccess, "unlock");
  return v3;
}

- (BOOL)_isSequenceNumberInOrder:(unint64_t)a3
{
  unint64_t recvSequenceNumber;
  BOOL v4;
  uint64_t v5;

  recvSequenceNumber = self->_recvSequenceNumber;
  v4 = recvSequenceNumber >= a3;
  v5 = recvSequenceNumber - a3;
  return !v4 || v5 < 0;
}

- (id)_sequenceNumbersURL
{
  NSURL *sequenceNumbersURL;
  void *v4;
  NSURL *v5;
  NSURL *v6;

  sequenceNumbersURL = self->_sequenceNumbersURL;
  if (!sequenceNumbersURL)
  {
    -[NSString stringByAppendingString:](self->_serviceName, "stringByAppendingString:", CFSTR("-sequencenumbers.plist"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    BLTFileURLInPairingPath(v4);
    v5 = (NSURL *)objc_claimAutoreleasedReturnValue();
    v6 = self->_sequenceNumbersURL;
    self->_sequenceNumbersURL = v5;

    sequenceNumbersURL = self->_sequenceNumbersURL;
  }
  return sequenceNumbersURL;
}

- (void)_readSequenceNumbersFromStoreWithInitialDuplicateCapacity:(unint64_t)a3
{
  void *currentSessionIdentifier;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  BLTCircularBitBuffer *v15;
  BLTCircularBitBuffer *duplicateEntries;
  NSUUID *v17;
  BLTCircularBitBuffer *v18;
  BLTCircularBitBuffer *v19;
  NSUUID *v20;
  NSUUID *v21;
  NSUUID *v22;
  NSUUID *recvSessionIdentifier;
  unint64_t v24;
  BLTCircularBitBuffer *v25;
  BLTCircularBitBuffer *v26;
  void *v27;
  uint64_t v28;
  id v29;

  -[BLTPBProtobufSequenceNumberManager _sequenceNumbersURL](self, "_sequenceNumbersURL");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  if (!v29)
    goto LABEL_11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:", v29);
  currentSessionIdentifier = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(currentSessionIdentifier, "objectForKey:", CFSTR("send"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(currentSessionIdentifier, "objectForKey:", CFSTR("recv"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(currentSessionIdentifier, "objectForKey:", CFSTR("initial"));
  v28 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(currentSessionIdentifier, "objectForKey:", CFSTR("sessionState"));
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(currentSessionIdentifier, "objectForKey:", CFSTR("dupebytes"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(currentSessionIdentifier, "objectForKey:", CFSTR("dupeindex"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(currentSessionIdentifier, "objectForKey:", CFSTR("sendSession"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(currentSessionIdentifier, "objectForKey:", CFSTR("recvSession"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v6 || !v7 || !(v28 | v8) || !v9 || !v10 || !v11)
  {

LABEL_11:
    v15 = -[BLTCircularBitBuffer initWithCapacity:]([BLTCircularBitBuffer alloc], "initWithCapacity:", a3);
    duplicateEntries = self->_duplicateEntries;
    self->_duplicateEntries = v15;

    self->_sessionState = 1;
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v17 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    currentSessionIdentifier = self->_currentSessionIdentifier;
    self->_currentSessionIdentifier = v17;
    goto LABEL_12;
  }
  self->_sendSequenceNumber = objc_msgSend(v6, "unsignedLongLongValue");
  self->_recvSequenceNumber = objc_msgSend(v7, "unsignedLongLongValue");
  v27 = v7;
  if (v8)
    v14 = objc_msgSend((id)v8, "unsignedIntegerValue");
  else
    v14 = objc_msgSend((id)v28, "BOOLValue");
  self->_sessionState = v14;
  v18 = -[BLTCircularBitBuffer initWithData:andIndex:]([BLTCircularBitBuffer alloc], "initWithData:andIndex:", v9, objc_msgSend(v10, "unsignedLongLongValue"));
  v19 = self->_duplicateEntries;
  self->_duplicateEntries = v18;

  v20 = (NSUUID *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v11);
  v21 = self->_currentSessionIdentifier;
  self->_currentSessionIdentifier = v20;

  if (v13)
  {
    v22 = (NSUUID *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v13);
    recvSessionIdentifier = self->_recvSessionIdentifier;
    self->_recvSessionIdentifier = v22;

  }
  v24 = -[BLTCircularBitBuffer capacity](self->_duplicateEntries, "capacity");
  if (v24 != +[BLTCircularBitBuffer actualCapacity:](BLTCircularBitBuffer, "actualCapacity:", a3))
  {
    v25 = -[BLTCircularBitBuffer initWithCapacity:]([BLTCircularBitBuffer alloc], "initWithCapacity:", a3);
    v26 = self->_duplicateEntries;
    self->_duplicateEntries = v25;

  }
LABEL_12:

}

- (BOOL)_writeSequenceNumbersToStore
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSUUID *recvSessionIdentifier;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  BOOL v18;
  unint64_t sendSequenceNumber;
  void *v20;
  unint64_t recvSequenceNumber;
  void *v22;
  void *v23;
  int v25;
  unint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  void *v32;
  _QWORD v33[6];
  _QWORD v34[8];

  v34[6] = *MEMORY[0x24BDAC8D0];
  -[BLTPBProtobufSequenceNumberManager _sequenceNumbersURL](self, "_sequenceNumbersURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v33[0] = CFSTR("send");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_sendSequenceNumber);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v4;
    v33[1] = CFSTR("recv");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_recvSequenceNumber);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v5;
    v33[2] = CFSTR("sessionState");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_sessionState);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v34[2] = v6;
    v33[3] = CFSTR("dupeindex");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[BLTCircularBitBuffer beginIndex](self->_duplicateEntries, "beginIndex"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v34[3] = v7;
    v33[4] = CFSTR("dupebytes");
    -[BLTCircularBitBuffer bitVector](self->_duplicateEntries, "bitVector");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v34[4] = v8;
    v33[5] = CFSTR("sendSession");
    -[NSUUID UUIDString](self->_currentSessionIdentifier, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v34[5] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    recvSessionIdentifier = self->_recvSessionIdentifier;
    if (recvSessionIdentifier)
    {
      -[NSUUID UUIDString](recvSessionIdentifier, "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("recvSession"));

    }
    objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v11, 200, 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE50], "data");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "writeToURL:options:error:", v3, 0, 0);

    if (v16
      && objc_msgSend(v3, "setResourceValue:forKey:error:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDBCC68], 0)&& (objc_msgSend(v14, "writeToURL:options:error:", v3, 0x10000000, 0) & 1) != 0)
    {
      blt_ids_log();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = 1;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        sendSequenceNumber = self->_sendSequenceNumber;
        -[NSUUID UUIDString](self->_currentSessionIdentifier, "UUIDString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        recvSequenceNumber = self->_recvSequenceNumber;
        -[NSUUID UUIDString](self->_recvSessionIdentifier, "UUIDString");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 134218754;
        v26 = sendSequenceNumber;
        v27 = 2112;
        v28 = v20;
        v29 = 2048;
        v30 = recvSequenceNumber;
        v31 = 2112;
        v32 = v22;
        v18 = 1;
        _os_log_impl(&dword_2173D9000, v17, OS_LOG_TYPE_INFO, "Sequence numbers written. Send: %llu session: %@ Recv: %llu session: %@", (uint8_t *)&v25, 0x2Au);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "removeItemAtURL:error:", v3, 0);

      blt_ids_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[BLTPBProtobufSequenceNumberManager _writeSequenceNumbersToStore].cold.1(v17);
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (unint64_t)sessionState
{
  return self->_sessionState;
}

- (void)setSessionState:(unint64_t)a3
{
  self->_sessionState = a3;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSUUID)currentSessionIdentifier
{
  return self->_currentSessionIdentifier;
}

- (NSUUID)recvSessionIdentifier
{
  return self->_recvSessionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recvSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_currentSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_sequenceNumbersURL, 0);
  objc_storeStrong((id *)&self->_duplicateEntries, 0);
  objc_storeStrong((id *)&self->_sequenceNumberAccess, 0);
}

- (void)_writeSequenceNumbersToStore
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2173D9000, log, OS_LOG_TYPE_ERROR, "Error storing sequence numbers.", v1, 2u);
}

@end
