@implementation AFMyriadAccessoryMetricMessage

- (AFMyriadAccessoryMetricMessage)initWithMetricData:(id)a3
{
  id v4;
  AFMyriadAccessoryMetricMessage *v5;
  AFMyriadAccessoryMetricMessage *v6;
  AFMyriadAccessoryMetricMessage *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFMyriadAccessoryMetricMessage;
  v5 = -[AFMyriadAccessoryMetricMessage init](&v9, sel_init);
  v6 = v5;
  if (v5
    && !-[AFMyriadAccessoryMetricMessage _decodeMetricDataPayload:decodedPayload:](v5, "_decodeMetricDataPayload:decodedPayload:", v4, &v5->_metric))
  {
    v7 = 0;
  }
  else
  {
    v7 = v6;
  }

  return v7;
}

- (AFMyriadAccessoryMetricMessage)initWithDataPayload:(id)a3
{
  id v4;
  AFMyriadAccessoryMetricMessage *v5;
  AFMyriadAccessoryMetricMessage *v6;
  AFMyriadAccessoryMetricMessage *v7;
  _BOOL4 v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AFMyriadAccessoryMetricMessage;
  v5 = -[AFMyriadAccessoryMetricMessage init](&v10, sel_init);
  v6 = v5;
  if (!v5)
  {
LABEL_4:
    v7 = v6;
    goto LABEL_6;
  }
  -[AFMyriadAccessoryMetricMessage _extractMetricDataFromDataPayload:](v5, "_extractMetricDataFromDataPayload:", v4);
  v7 = (AFMyriadAccessoryMetricMessage *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = -[AFMyriadAccessoryMetricMessage _decodeMetricDataPayload:decodedPayload:](v6, "_decodeMetricDataPayload:decodedPayload:", v7, &v6->_metric);

    if (!v8)
    {
      v7 = 0;
      goto LABEL_6;
    }
    goto LABEL_4;
  }
LABEL_6:

  return v7;
}

- (id)messageAsData
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  objc_msgSend(v3, "appendBytes:length:", &self->_metric, 232);
  return v3;
}

- (MyriadMetricsDataV1)messageAsStruct
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v3 = *(_OWORD *)&self->electionParticipantProductType[9];
  v4 = *(_OWORD *)&self->electionParticipantProductType[41];
  *(_OWORD *)&retstr->electionParticipantProductType[17] = *(_OWORD *)&self->electionParticipantProductType[25];
  *(_OWORD *)&retstr->electionParticipantProductType[33] = v4;
  *(_QWORD *)&retstr->electionParticipantProductType[49] = *(_QWORD *)&self[1].version;
  v5 = *(_OWORD *)&self->electionParticipantGoodnessScore[45];
  v6 = *(_OWORD *)&self->electionParticipantDeviceType[27];
  *(_OWORD *)&retstr->electionParticipantDeviceType[3] = *(_OWORD *)&self->electionParticipantDeviceType[11];
  *(_OWORD *)&retstr->electionParticipantDeviceType[19] = v6;
  *(_OWORD *)&retstr->electionParticipantDeviceType[35] = *(_OWORD *)&self->electionParticipantDeviceType[43];
  *(_OWORD *)&retstr->electionParticipantProductType[1] = v3;
  v7 = *(_OWORD *)&self->coordinationAllowed;
  v8 = *(_OWORD *)&self->electionParticipantGoodnessScore[13];
  *(_OWORD *)&retstr->previousDecisionTime = *(_OWORD *)&self->deviceGroup;
  *(_OWORD *)&retstr->electionParticipantGoodnessScore[5] = v8;
  *(_OWORD *)&retstr->electionParticipantGoodnessScore[21] = *(_OWORD *)&self->electionParticipantGoodnessScore[29];
  *(_OWORD *)&retstr->electionParticipantGoodnessScore[37] = v5;
  v9 = *(_OWORD *)&self->requestType;
  *(_OWORD *)&retstr->version = *(_OWORD *)&self->sessionId;
  *(_OWORD *)&retstr->eventType = v9;
  *(_OWORD *)&retstr->state = *(_OWORD *)&self->advDelay;
  *(_OWORD *)&retstr->advInterval = v7;
  return self;
}

- (unsigned)version
{
  return self->_metric.version;
}

- (unint64_t)sessionId
{
  return self->_metric.sessionId;
}

- (unsigned)eventType
{
  return self->_metric.eventType;
}

- (unint64_t)requestType
{
  return self->_metric.requestType;
}

- (unsigned)state
{
  return self->_metric.state;
}

- (double)advDelay
{
  return self->_metric.advDelay;
}

- (double)advInterval
{
  return self->_metric.advInterval;
}

- (BOOL)coordinationAllowed
{
  return self->_metric.coordinationAllowed != 0;
}

- (unsigned)winnerGoodnessScore
{
  return self->_metric.winnerGoodnessScore;
}

- (unsigned)winnerProductType
{
  return self->_metric.winnerProductType;
}

- (unsigned)winnerDeviceClass
{
  return self->_metric.winnerDeviceClass;
}

- (BOOL)homepodInvolved
{
  return self->_metric.homepodInvolved != 0;
}

- (BOOL)previousDecision
{
  return self->_metric.previousDecision != 0;
}

- (double)previousDecisionTime
{
  return self->_metric.previousDecisionTime;
}

- (unsigned)deviceGroup
{
  return self->_metric.deviceGroup;
}

- (BOOL)decision
{
  return self->_metric.decision != 0;
}

- (BOOL)lateToElection
{
  return self->_metric.lateToElection != 0;
}

- (unsigned)electionParticipantCount
{
  return self->_metric.electionParticipantCount;
}

- (char)electionParticipantGoodnessScore
{
  return (char *)self->_metric.electionParticipantGoodnessScore;
}

- (char)electionParticipantDeviceType
{
  return (char *)self->_metric.electionParticipantDeviceType;
}

- (char)electionParticipantProductType
{
  return (char *)self->_metric.electionParticipantProductType;
}

- (id)_extractMetricDataFromDataPayload:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a3;
  +[AFMyriadMetrics sharedInstance](AFMyriadMetrics, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isMyriadMetricsMessage:", v3);

  if (v5)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("accessoryMetrics"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_decodeMetricDataPayload:(id)a3 decodedPayload:(MyriadMetricsDataV1 *)a4
{
  id v5;
  void *v6;
  BOOL v7;
  unint64_t v8;
  size_t v9;
  NSObject *v10;
  NSObject *v12;
  char v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5 && objc_msgSend(v5, "length"))
  {
    v13 = 0;
    objc_msgSend(v6, "getBytes:range:", &v13, 0, 1);
    v7 = v13 != 0;
    if (v13)
    {
      v8 = objc_msgSend(v6, "length");
      *(_OWORD *)&a4->version = 0u;
      *(_OWORD *)&a4->eventType = 0u;
      if (v8 >= 0xE8)
        v9 = 232;
      else
        v9 = v8;
      *(_OWORD *)&a4->state = 0uLL;
      *(_OWORD *)&a4->advInterval = 0uLL;
      *(_OWORD *)&a4->previousDecisionTime = 0uLL;
      *(_OWORD *)&a4->electionParticipantGoodnessScore[5] = 0uLL;
      *(_OWORD *)&a4->electionParticipantGoodnessScore[21] = 0uLL;
      *(_OWORD *)&a4->electionParticipantGoodnessScore[37] = 0uLL;
      *(_OWORD *)&a4->electionParticipantDeviceType[3] = 0uLL;
      *(_OWORD *)&a4->electionParticipantDeviceType[19] = 0uLL;
      *(_OWORD *)&a4->electionParticipantDeviceType[35] = 0uLL;
      *(_OWORD *)&a4->electionParticipantProductType[1] = 0uLL;
      *(_OWORD *)&a4->electionParticipantProductType[17] = 0uLL;
      *(_OWORD *)&a4->electionParticipantProductType[33] = 0uLL;
      *(_QWORD *)&a4->electionParticipantProductType[49] = 0;
      memcpy(a4, (const void *)objc_msgSend(objc_retainAutorelease(v6), "bytes"), v9);
    }
    else
    {
      v12 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v15 = "-[AFMyriadAccessoryMetricMessage _decodeMetricDataPayload:decodedPayload:]";
        v16 = 1024;
        LODWORD(v17) = 0;
        _os_log_error_impl(&dword_19AF50000, v12, OS_LOG_TYPE_ERROR, "%s Analytics data has a invalid version %d", buf, 0x12u);
      }
    }
  }
  else
  {
    v10 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[AFMyriadAccessoryMetricMessage _decodeMetricDataPayload:decodedPayload:]";
      v16 = 2112;
      v17 = v6;
      _os_log_error_impl(&dword_19AF50000, v10, OS_LOG_TYPE_ERROR, "%s Invalid analytics data payload: %@", buf, 0x16u);
    }
    v7 = 0;
  }

  return v7;
}

@end
