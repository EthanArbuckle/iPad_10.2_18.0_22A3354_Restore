@implementation MPCPlaybackEngineEvent

- (int)threadPriority
{
  return self->_threadPriority;
}

- (int64_t)compare:(id)a3
{
  unint64_t timebase;
  unint64_t rawNanoSeconds;
  id v5;
  uint64_t v6;
  unint64_t v7;
  BOOL v8;
  int64_t v9;
  uint64_t v11;
  uint64_t v12;

  rawNanoSeconds = self->_monotonicTime.rawNanoSeconds;
  timebase = self->_monotonicTime.timebase;
  if (a3)
  {
    v5 = a3;
    objc_msgSend(v5, "monotonicTime");
    v6 = v12;
    objc_msgSend(v5, "monotonicTime");

    v7 = v11 + v6;
  }
  else
  {
    v7 = 0;
  }
  v8 = rawNanoSeconds + timebase >= v7;
  v9 = rawNanoSeconds + timebase > v7;
  if (v8)
    return v9;
  else
    return -1;
}

- ($C192BC3A89177E9F9906E5732115C753)monotonicTime
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var1;
  *(_OWORD *)&retstr->var2 = v3;
  *(_QWORD *)&retstr->var4 = self[2].var0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (MPCPlaybackEngineEvent)eventFromRowResult:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  MPCPlaybackEngineEvent *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  double v24;
  MPCPlaybackEngineEvent *v25;
  uint64_t v27;
  id v28;
  _BYTE buf[24];
  unint64_t v30;
  double v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_opt_self();
  v3 = (void *)MEMORY[0x24BDD1880];
  objc_msgSend(v2, "dataValueAtColumnIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "msv_UUIDWithData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "stringValueAtColumnIndex:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v2, "uint64ValueAtColumnIndex:", 2);
  v8 = objc_msgSend(v2, "uint64ValueAtColumnIndex:", 3);
  v9 = objc_msgSend(v2, "uint64ValueAtColumnIndex:", 4);
  v10 = objc_msgSend(v2, "uint64ValueAtColumnIndex:", 5);
  MSVGetKernelBootTime();
  v12 = v11;
  v13 = objc_msgSend(v2, "uint64ValueAtColumnIndex:", 6);
  v28 = 0;
  objc_msgSend(v2, "jsonValueAtColumnIndex:error:", 7, &v28);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v28;
  if (v15)
  {
    v16 = os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEventStream");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v2, "stringValueAtColumnIndex:", 6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v17;
      _os_log_impl(&dword_210BD8000, v16, OS_LOG_TYPE_FAULT, "[EVS:…] eventFromRowResult:… | failed to build event [json decode failure] error=%{public}@ payload=%{public}@", buf, 0x16u);

    }
    v18 = 0;
  }
  else
  {
    v27 = v13;
    v19 = v8;
    v20 = v7;
    v21 = v6;
    v22 = v5;
    if (v12 * 1000000000.0 == (double)v9)
      v23 = 3;
    else
      v23 = 1;
    v24 = (double)v10 / 1000000000.0;
    MPCPlaybackEngineEventPayloadFromPayloadJSON(v14);
    v16 = objc_claimAutoreleasedReturnValue();
    v25 = [MPCPlaybackEngineEvent alloc];
    *(_QWORD *)buf = v23;
    *(_QWORD *)&buf[8] = v20;
    v5 = v22;
    v6 = v21;
    *(_QWORD *)&buf[16] = v19;
    v30 = v9;
    v31 = v24;
    v18 = -[MPCPlaybackEngineEvent initWithType:payload:monotonicTime:threadPriority:identifier:](v25, "initWithType:payload:monotonicTime:threadPriority:identifier:", v21, v16, buf, v27, v5);
  }

  return v18;
}

- (MPCPlaybackEngineEvent)initWithType:(id)a3 payload:(id)a4 monotonicTime:(id *)a5 threadPriority:(int)a6 identifier:(id)a7
{
  id v14;
  id v15;
  id v16;
  MPCPlaybackEngineEvent *v17;
  MPCPlaybackEngineEvent *v18;
  __int128 v19;
  __int128 v20;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;

  v14 = a3;
  v15 = a4;
  v16 = a7;
  if (v14)
  {
    if (v15)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCPlaybackEngineEvent.m"), 116, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("payload"));

    if (v16)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCPlaybackEngineEvent.m"), 115, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("type"));

  if (!v15)
    goto LABEL_8;
LABEL_3:
  if (v16)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCPlaybackEngineEvent.m"), 117, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

LABEL_4:
  v25.receiver = self;
  v25.super_class = (Class)MPCPlaybackEngineEvent;
  v17 = -[MPCPlaybackEngineEvent init](&v25, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_type, a3);
    objc_storeStrong((id *)&v18->_payload, a4);
    objc_storeStrong((id *)&v18->_identifier, a7);
    v19 = *(_OWORD *)&a5->var0;
    v20 = *(_OWORD *)&a5->var2;
    v18->_monotonicTime.userSecondsSinceReferenceDate = a5->var4;
    *(_OWORD *)&v18->_monotonicTime.flags = v19;
    *(_OWORD *)&v18->_monotonicTime.rawNanoSeconds = v20;
    v18->_threadPriority = a6;
  }

  return v18;
}

- (NSString)type
{
  return self->_type;
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (NSDate)date
{
  return (NSDate *)objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", self->_monotonicTime.userSecondsSinceReferenceDate);
}

- (double)durationSinceEvent:(id)a3
{
  unint64_t rawNanoSeconds;
  uint64_t v4;
  uint64_t v6;

  rawNanoSeconds = self->_monotonicTime.rawNanoSeconds;
  if (a3)
  {
    objc_msgSend(a3, "monotonicTime");
    v4 = v6;
  }
  else
  {
    v4 = 0;
  }
  return (double)(uint64_t)(rawNanoSeconds - v4) / 1000000000.0;
}

- (id)previousItemEventWithCursor:(id)a3 type:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[MPCPlaybackEngineEvent payload](self, "payload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v15 = CFSTR("queue-item-id");
    -[MPCPlaybackEngineEvent payload](self, "payload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("queue-item-id"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "findPreviousEventWithType:matchingPayload:", v7, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)matchesPayload:(id)a3
{
  id v4;
  id v5;
  char v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 1;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __62__MPCPlaybackEngineEvent_MPCRTCEventConsumer__matchesPayload___block_invoke;
  v8[3] = &unk_24CAB3F58;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __62__MPCPlaybackEngineEvent_MPCRTCEventConsumer__matchesPayload___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v2 + 24))
  {
    v4 = *(void **)(a1 + 32);
    v5 = a2;
    objc_msgSend(v4, "payload");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 == v7)
      v8 = 1;
    else
      v8 = objc_msgSend(v6, "isEqual:", v7);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v8;

  }
  else
  {
    *(_BYTE *)(v2 + 24) = 0;
  }
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_identifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  char v6;
  NSUUID *identifier;
  NSUUID *v8;
  NSUUID *v9;
  NSUUID *v10;

  v4 = a3;
  if (v4 && (v5 = objc_opt_class(), v5 == objc_opt_class()))
  {
    identifier = self->_identifier;
    v8 = (NSUUID *)v4[2];
    v9 = identifier;
    v10 = v9;
    if (v9 == v8)
      v6 = 1;
    else
      v6 = -[NSUUID isEqual:](v9, "isEqual:", v8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD15D0];
  -[MPCPlaybackEngineEvent date](self, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF38], "defaultTimeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:timeZone:formatOptions:", v4, v5, 3955);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDD17C8];
  -[NSUUID MSVBase64UUIDString](self->_identifier, "MSVBase64UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("<MPCPlaybackEngineEvent: %@ %@ [%llu] %@>"), v8, v6, self->_monotonicTime.rawNanoSeconds + self->_monotonicTime.timebase, self->_type);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSDate)monotonicDate
{
  return (NSDate *)objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", vaddvq_f64(vdivq_f64(vcvtq_f64_u64(*(uint64x2_t *)&self->_monotonicTime.rawNanoSeconds), (float64x2_t)vdupq_n_s64(0x41CDCD6500000000uLL))));
}

- (unint64_t)monotonicTimeNanoSeconds
{
  return self->_monotonicTime.rawNanoSeconds;
}

- (id)earlierEvent:(id)a3
{
  MPCPlaybackEngineEvent *v4;
  MPCPlaybackEngineEvent *v5;
  MPCPlaybackEngineEvent *v6;

  v4 = (MPCPlaybackEngineEvent *)a3;
  if (-[MPCPlaybackEngineEvent compare:](self, "compare:", v4) == 1)
    v5 = v4;
  else
    v5 = self;
  v6 = v5;

  return v6;
}

- (double)timeIntervalSinceEvent:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v5 = v4;
  v6 = self->_monotonicTime.rawNanoSeconds + self->_monotonicTime.timebase;
  if (!v4)
  {
    v7 = 0;
    goto LABEL_5;
  }
  objc_msgSend(v4, "monotonicTime");
  objc_msgSend(v5, "monotonicTime");
  v7 = v11 + v12;
  if (v11 + v12 <= v6)
  {
LABEL_5:
    v8 = (double)(v6 - v7);
    goto LABEL_6;
  }
  v8 = -(double)(v11 + v12 - v6);
LABEL_6:
  v9 = v8 / 1000000000.0;

  return v9;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (unint64_t)machAbsoluteTime
{
  return self->_machAbsoluteTime;
}

@end
