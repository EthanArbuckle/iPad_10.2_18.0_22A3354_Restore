@implementation CSEndpointLatencyInfo

- (CSEndpointLatencyInfo)initWithRequestMHUUID:(id)a3
{
  id v4;
  CSEndpointLatencyInfo *v5;
  uint64_t v6;
  NSString *requestMHUUID;
  uint64_t v8;
  NSMutableArray *trailingPktLatencies;
  uint64_t v10;
  NSMutableArray *trailingPktSpeechLatencies;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CSEndpointLatencyInfo;
  v5 = -[CSEndpointLatencyInfo init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    requestMHUUID = v5->_requestMHUUID;
    v5->_requestMHUUID = (NSString *)v6;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 10);
    v8 = objc_claimAutoreleasedReturnValue();
    trailingPktLatencies = v5->_trailingPktLatencies;
    v5->_trailingPktLatencies = (NSMutableArray *)v8;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 10);
    v10 = objc_claimAutoreleasedReturnValue();
    trailingPktSpeechLatencies = v5->_trailingPktSpeechLatencies;
    v5->_trailingPktSpeechLatencies = (NSMutableArray *)v10;

    v5->_numOfAudioPackets = 0;
    v5->_numOfValidTrailingPackets = 0;
    v5->_numOfValidTrailingSpeechPackets = 0;
  }

  return v5;
}

- (void)addPktInfoWithTimestamp:(unint64_t)a3 arrivalTimestamp:(unint64_t)a4 currentMachTime:(unint64_t)a5
{
  double v9;
  double v10;
  unint64_t numOfAudioPackets;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  double v15;
  NSObject *v16;
  void *v17;
  int v18;
  const char *v19;
  __int16 v20;
  double v21;
  __int16 v22;
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  CSMachAbsoluteTimeGetTimeInterval();
  v10 = v9;
  numOfAudioPackets = self->_numOfAudioPackets;
  self->_numOfAudioPackets = numOfAudioPackets + 1;
  if (!numOfAudioPackets)
  {
    v12 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v18 = 136315394;
      v19 = "-[CSEndpointLatencyInfo addPktInfoWithTimestamp:arrivalTimestamp:currentMachTime:]";
      v20 = 2050;
      v21 = v10 * 1000.0;
      _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_DEFAULT, "%s %{public}.2f ms after firstBufferStart", (uint8_t *)&v18, 0x16u);
    }
  }
  if (v10 <= 10.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10 * 1000.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray setObject:atIndexedSubscript:](self->_trailingPktLatencies, "setObject:atIndexedSubscript:", v14, self->_numOfValidTrailingPackets % 0xA);

    ++self->_numOfValidTrailingPackets;
  }
  else
  {
    v13 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v18 = 136315650;
      v19 = "-[CSEndpointLatencyInfo addPktInfoWithTimestamp:arrivalTimestamp:currentMachTime:]";
      v20 = 2050;
      v21 = *(double *)&a5;
      v22 = 2050;
      v23 = a3;
      _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_DEFAULT, "%s Invalid timestamp (currentMachTime: %{public}llu timestamp: %{public}llu)", (uint8_t *)&v18, 0x20u);
    }
  }
  CSMachAbsoluteTimeGetTimeInterval();
  if (a4 && v15 > 10.0)
  {
    v16 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v18 = 136315650;
      v19 = "-[CSEndpointLatencyInfo addPktInfoWithTimestamp:arrivalTimestamp:currentMachTime:]";
      v20 = 2050;
      v21 = *(double *)&a5;
      v22 = 2050;
      v23 = a4;
      _os_log_impl(&dword_1C2614000, v16, OS_LOG_TYPE_DEFAULT, "%s Invalid timestamp (currentMachTime: %{public}llu arrivalTimestamp: %{public}llu)", (uint8_t *)&v18, 0x20u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15 * 1000.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray setObject:atIndexedSubscript:](self->_trailingPktSpeechLatencies, "setObject:atIndexedSubscript:", v17, self->_numOfValidTrailingSpeechPackets % 0xA);

    ++self->_numOfValidTrailingSpeechPackets;
  }
}

- (void)report
{
  void *v3;
  void *v4;
  NSObject *v5;
  unint64_t numOfAudioPackets;
  unint64_t numOfValidTrailingPackets;
  unint64_t numOfValidTrailingSpeechPackets;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  unint64_t v17;
  __int16 v18;
  unint64_t v19;
  __int16 v20;
  unint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D19260], "distributionDictionary:", self->_trailingPktLatencies);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D19260], "distributionDictionary:", self->_trailingPktSpeechLatencies);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    numOfAudioPackets = self->_numOfAudioPackets;
    numOfValidTrailingPackets = self->_numOfValidTrailingPackets;
    numOfValidTrailingSpeechPackets = self->_numOfValidTrailingSpeechPackets;
    v14 = 136316418;
    v15 = "-[CSEndpointLatencyInfo report]";
    v16 = 2050;
    v17 = numOfAudioPackets;
    v18 = 2050;
    v19 = numOfValidTrailingPackets;
    v20 = 2050;
    v21 = numOfValidTrailingSpeechPackets;
    v22 = 2114;
    v23 = v3;
    v24 = 2114;
    v25 = v4;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s numOfAudioPackets: %{public}lu, numOfValidTrailingPackets: %{public}lu, numOfValidTrailingSpeechPackets: %{public}lu, \ntrailingPktLatencies: %{public}@ \ntrailingPktSpeechLatencies: %{public}@", (uint8_t *)&v14, 0x3Eu);
  }
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (objc_msgSend(v3, "count"))
    objc_msgSend(v9, "setObject:forKey:", v3, CFSTR("TrailingPktLatency"));
  if (objc_msgSend(v4, "count"))
    objc_msgSend(v9, "setObject:forKey:", v4, CFSTR("TrailingPktSpeechLatency"));
  if (self->_firstPktLatency > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("FirstPktLatency"));

  }
  if (objc_msgSend(v9, "count"))
  {
    -[CSEndpointLatencyInfo _emitMHEndpointLatencyInfo:withRequestMHUUID:](self, "_emitMHEndpointLatencyInfo:withRequestMHUUID:", v9, self->_requestMHUUID);
    v11 = objc_alloc(MEMORY[0x1E0CFE7D8]);
    objc_msgSend(MEMORY[0x1E0CFE8E0], "currentContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithInstanceContext:", v12);

    objc_msgSend(v13, "logEventWithType:context:", 4712, v9);
  }

}

- (void)_emitMHEndpointLatencyInfo:(id)a3 withRequestMHUUID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  int v24;
  const char *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = (void *)objc_msgSend(v5, "copy");
    v8 = objc_alloc_init(MEMORY[0x1E0D99AA8]);
    objc_msgSend(v7, "objectForKey:", CFSTR("FirstPktLatency"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v7, "objectForKey:", CFSTR("FirstPktLatency"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "floatValue");
      v12 = v11;

      LODWORD(v13) = v12;
      objc_msgSend(v8, "setFirstPacketLatencyInNs:", objc_msgSend(MEMORY[0x1E0D19118], "millisecondsToNs:", v13));
    }
    objc_msgSend(v7, "objectForKey:", CFSTR("TrailingPktLatency"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v7, "objectForKey:", CFSTR("TrailingPktLatency"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[CSEndpointLoggingHelper getMHStatisticDistributionInfoFromDictionary:](CSEndpointLoggingHelper, "getMHStatisticDistributionInfoFromDictionary:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTrailingPacketLatency:", v16);

    }
    objc_msgSend(v7, "objectForKey:", CFSTR("TrailingPktSpeechLatency"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v7, "objectForKey:", CFSTR("TrailingPktSpeechLatency"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[CSEndpointLoggingHelper getMHStatisticDistributionInfoFromDictionary:](CSEndpointLoggingHelper, "getMHStatisticDistributionInfoFromDictionary:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setCoreSpeechTrailingPacketLatency:", v19);

    }
    +[CSEndpointLoggingHelper getMHClientEventByMhUUID:](CSEndpointLoggingHelper, "getMHClientEventByMhUUID:", v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setEndpointLatencyInfoReported:", v8);
    objc_msgSend(MEMORY[0x1E0D97898], "sharedStream");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "emitMessage:", v20);

    v22 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v24 = 136315394;
      v25 = "-[CSEndpointLatencyInfo _emitMHEndpointLatencyInfo:withRequestMHUUID:]";
      v26 = 2112;
      v27 = v6;
      _os_log_impl(&dword_1C2614000, v22, OS_LOG_TYPE_DEFAULT, "%s Submit MHEndpointLatencyInfoReportedEvent to SELF for MH ID: %@", (uint8_t *)&v24, 0x16u);
    }

  }
  else
  {
    v23 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v24 = 136315138;
      v25 = "-[CSEndpointLatencyInfo _emitMHEndpointLatencyInfo:withRequestMHUUID:]";
      _os_log_error_impl(&dword_1C2614000, v23, OS_LOG_TYPE_ERROR, "%s MHID not set, skipping SELF Logging", (uint8_t *)&v24, 0xCu);
    }
  }

}

- (double)firstPktLatency
{
  return self->_firstPktLatency;
}

- (void)setFirstPktLatency:(double)a3
{
  self->_firstPktLatency = a3;
}

- (NSString)requestMHUUID
{
  return self->_requestMHUUID;
}

- (void)setRequestMHUUID:(id)a3
{
  objc_storeStrong((id *)&self->_requestMHUUID, a3);
}

- (NSMutableArray)trailingPktSpeechLatencies
{
  return self->_trailingPktSpeechLatencies;
}

- (void)setTrailingPktSpeechLatencies:(id)a3
{
  objc_storeStrong((id *)&self->_trailingPktSpeechLatencies, a3);
}

- (NSMutableArray)trailingPktLatencies
{
  return self->_trailingPktLatencies;
}

- (void)setTrailingPktLatencies:(id)a3
{
  objc_storeStrong((id *)&self->_trailingPktLatencies, a3);
}

- (unint64_t)numOfAudioPackets
{
  return self->_numOfAudioPackets;
}

- (void)setNumOfAudioPackets:(unint64_t)a3
{
  self->_numOfAudioPackets = a3;
}

- (unint64_t)numOfValidTrailingPackets
{
  return self->_numOfValidTrailingPackets;
}

- (void)setNumOfValidTrailingPackets:(unint64_t)a3
{
  self->_numOfValidTrailingPackets = a3;
}

- (unint64_t)numOfValidTrailingSpeechPackets
{
  return self->_numOfValidTrailingSpeechPackets;
}

- (void)setNumOfValidTrailingSpeechPackets:(unint64_t)a3
{
  self->_numOfValidTrailingSpeechPackets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingPktLatencies, 0);
  objc_storeStrong((id *)&self->_trailingPktSpeechLatencies, 0);
  objc_storeStrong((id *)&self->_requestMHUUID, 0);
}

@end
