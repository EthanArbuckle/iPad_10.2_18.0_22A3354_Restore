@implementation DSConsensusDatum

- (DSConsensusDatum)initWithIdentifier:(id)a3 andConfidence:(unsigned __int8)a4 atTime:(id)a5
{
  id v9;
  id v10;
  DSConsensusDatum *v11;
  DSConsensusDatum *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)DSConsensusDatum;
  v11 = -[DSConsensusDatum init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_identifier, a3);
    v12->_confidence = a4;
    objc_storeStrong((id *)&v12->_time, a5);
  }

  return v12;
}

- (void)printInfo
{
  id v3;
  NSObject *v4;
  const char *v5;
  unsigned int confidence;
  const char *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v3, "setDateFormat:", CFSTR("yyyy-MM-dd 'at' HH:mm"));
  if (onceTokenDSConsensus != -1)
    dispatch_once(&onceTokenDSConsensus, &__block_literal_global);
  v4 = (id)logObjDSConsensus;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = -[NSString UTF8String](self->_identifier, "UTF8String");
    confidence = self->_confidence;
    if (confidence <= 6)
    {
      if (!self->_confidence)
      {
        v7 = "lowest";
        goto LABEL_16;
      }
      if (confidence == 4)
      {
        v7 = "low-medium";
        goto LABEL_16;
      }
    }
    else
    {
      switch(confidence)
      {
        case 7u:
          v7 = "medium";
          goto LABEL_16;
        case 0xBu:
          v7 = "medium-high";
          goto LABEL_16;
        case 0xFu:
          v7 = "highest";
LABEL_16:
          objc_msgSend(v3, "stringFromDate:", self->_time);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = 136315650;
          v10 = v5;
          v11 = 2080;
          v12 = v7;
          v13 = 2112;
          v14 = v8;
          _os_log_impl(&dword_217E3C000, v4, OS_LOG_TYPE_DEFAULT, "Consensus Datum with ID: %s, Confidence: %s, time: %@", (uint8_t *)&v9, 0x20u);

          goto LABEL_17;
      }
    }
    v7 = "?";
    goto LABEL_16;
  }
LABEL_17:

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (unsigned)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(unsigned __int8)a3
{
  self->_confidence = a3;
}

- (NSDate)time
{
  return self->_time;
}

- (void)setTime:(id)a3
{
  objc_storeStrong((id *)&self->_time, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
