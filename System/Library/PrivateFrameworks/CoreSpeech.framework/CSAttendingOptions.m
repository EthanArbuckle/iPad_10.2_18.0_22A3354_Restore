@implementation CSAttendingOptions

- (CSAttendingOptions)initWithAttendingType:(int64_t)a3
{
  return -[CSAttendingOptions initWithAttendingType:startAttendingHostTime:useVAD:useOwnVoiceVAD:useBoron:startOfSpeechThresholdInMs:prependAudioDuration:timeoutThresholdInSec:triggerType:audioStreamHoldingDurationInSec:audioRecordType:deviceId:attendingListeningType:pauseDurationThreshold:maxPauseDelay:](self, "initWithAttendingType:startAttendingHostTime:useVAD:useOwnVoiceVAD:useBoron:startOfSpeechThresholdInMs:prependAudioDuration:timeoutThresholdInSec:triggerType:audioStreamHoldingDurationInSec:audioRecordType:deviceId:attendingListeningType:pauseDurationThreshold:maxPauseDelay:", a3, 0, 1, 0, 0, 1, 300.0, 700.0, 10.0, 5.0, 3000.0, 7000.0, 1, 0, 2);
}

- (CSAttendingOptions)initWithAttendingType:(int64_t)a3 startAttendingHostTime:(unint64_t)a4 useVAD:(BOOL)a5 useOwnVoiceVAD:(BOOL)a6 useBoron:(BOOL)a7 startOfSpeechThresholdInMs:(double)a8 prependAudioDuration:(double)a9 timeoutThresholdInSec:(double)a10 triggerType:(int64_t)a11 audioStreamHoldingDurationInSec:(double)a12 audioRecordType:(int64_t)a13 deviceId:(id)a14 attendingListeningType:(unint64_t)a15 pauseDurationThreshold:(double)a16 maxPauseDelay:(double)a17
{
  id v29;
  CSAttendingOptions *v30;
  CSAttendingOptions *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  objc_super v39;

  v29 = a14;
  v39.receiver = self;
  v39.super_class = (Class)CSAttendingOptions;
  v30 = -[CSAttendingOptions init](&v39, sel_init);
  v31 = v30;
  if (v30)
  {
    v30->_attendingType = a3;
    v30->_startAttendingHostTime = a4;
    v30->_useVAD = a5;
    v30->_useOwnVoiceVAD = 0;
    v30->_useBoron = a7;
    v32 = 300.0;
    if (a8 < 0.0)
      v33 = 300.0;
    else
      v33 = a8;
    v30->_startOfSpeechThresholdInMs = v33;
    v30->_startOfSpeechNearMissThresholdInMs = 120.0;
    if (a9 >= 0.0)
      v32 = a9;
    v34 = 10.0;
    if (a10 >= 0.0)
      v34 = a10;
    v30->_prependAudioDuration = v32;
    v30->_timeoutThresholdInSec = v34;
    v30->_triggerType = a11;
    v35 = 5.0;
    if (a12 >= 0.0)
      v35 = a12;
    v30->_audioStreamHoldingDurationInSec = v35;
    v30->_recordType = a13;
    objc_storeStrong((id *)&v30->_deviceId, a14);
    v31->_attendingListeningType = a15;
    v36 = 3000.0;
    if (a16 > 0.0)
      v36 = a16;
    v37 = 7000.0;
    if (a17 > 0.0)
      v37 = a17;
    v31->_pauseDurationThreshold = v36;
    v31->_maxPauseDelay = v37;
  }

  return v31;
}

- (id)copyWithRecordType:(int64_t)a3
{
  int64_t v5;
  unint64_t v6;
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  int64_t v16;
  double v17;
  double v18;
  void *v19;
  unint64_t v20;
  double v21;
  double v22;
  double v23;
  CSAttendingOptions *v24;
  CSAttendingOptions *v26;

  v26 = [CSAttendingOptions alloc];
  v5 = -[CSAttendingOptions attendingType](self, "attendingType");
  v6 = -[CSAttendingOptions startAttendingHostTime](self, "startAttendingHostTime");
  v7 = -[CSAttendingOptions useVAD](self, "useVAD");
  v8 = -[CSAttendingOptions useOwnVoiceVAD](self, "useOwnVoiceVAD");
  v9 = -[CSAttendingOptions useBoron](self, "useBoron");
  -[CSAttendingOptions startOfSpeechThresholdInMs](self, "startOfSpeechThresholdInMs");
  v11 = v10;
  -[CSAttendingOptions prependAudioDuration](self, "prependAudioDuration");
  v13 = v12;
  -[CSAttendingOptions timeoutThresholdInSec](self, "timeoutThresholdInSec");
  v15 = v14;
  v16 = -[CSAttendingOptions triggerType](self, "triggerType");
  -[CSAttendingOptions audioStreamHoldingDurationInSec](self, "audioStreamHoldingDurationInSec");
  v18 = v17;
  -[CSAttendingOptions deviceId](self, "deviceId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[CSAttendingOptions attendingListeningType](self, "attendingListeningType");
  -[CSAttendingOptions pauseDurationThreshold](self, "pauseDurationThreshold");
  v22 = v21;
  -[CSAttendingOptions maxPauseDelay](self, "maxPauseDelay");
  v24 = -[CSAttendingOptions initWithAttendingType:startAttendingHostTime:useVAD:useOwnVoiceVAD:useBoron:startOfSpeechThresholdInMs:prependAudioDuration:timeoutThresholdInSec:triggerType:audioStreamHoldingDurationInSec:audioRecordType:deviceId:attendingListeningType:pauseDurationThreshold:maxPauseDelay:](v26, "initWithAttendingType:startAttendingHostTime:useVAD:useOwnVoiceVAD:useBoron:startOfSpeechThresholdInMs:prependAudioDuration:timeoutThresholdInSec:triggerType:audioStreamHoldingDurationInSec:audioRecordType:deviceId:attendingListeningType:pauseDurationThreshold:maxPauseDelay:", v5, v6, v7, v8, v9, v16, v11, v13, v15, v18, v22, v23, a3, v19, v20);

  return v24;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  __CFString *v5;
  __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_attendingType - 1;
  if (v4 > 6)
    v5 = CFSTR("Default");
  else
    v5 = off_1E7C27688[v4];
  v6 = v5;
  objc_msgSend(v3, "appendFormat:", CFSTR("[type = %@]"), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR("[startAttendingHostTime = %llu]"), self->_startAttendingHostTime);
  if (self->_useVAD)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("[useVAD = %@]"), v7);
  if (self->_useOwnVoiceVAD)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("[useOwnVoiceVAD = %@]"), v8);
  if (self->_useBoron)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("[useBoron = %@]"), v9);
  objc_msgSend(v3, "appendFormat:", CFSTR("[startOfSpeechThresholdInMs = %.2f]"), *(_QWORD *)&self->_startOfSpeechThresholdInMs);
  objc_msgSend(v3, "appendFormat:", CFSTR("[startOfSpeechNearMissThresholdInMs = %.2f]"), *(_QWORD *)&self->_startOfSpeechNearMissThresholdInMs);
  objc_msgSend(v3, "appendFormat:", CFSTR("[prependAudioDuration = %.2f]"), *(_QWORD *)&self->_prependAudioDuration);
  objc_msgSend(v3, "appendFormat:", CFSTR("[timeoutThresholdInSec = %.2f]"), *(_QWORD *)&self->_timeoutThresholdInSec);
  objc_msgSend(v3, "appendFormat:", CFSTR("[triggerType = %lu]"), self->_triggerType);
  objc_msgSend(v3, "appendFormat:", CFSTR("[audioStreamHoldingDurationInSec = %.2f]"), *(_QWORD *)&self->_audioStreamHoldingDurationInSec);
  objc_msgSend(v3, "appendFormat:", CFSTR("[audioRecordType = %lld]"), self->_recordType);
  objc_msgSend(v3, "appendFormat:", CFSTR("[deviceId = %@]"), self->_deviceId);
  objc_msgSend(v3, "appendFormat:", CFSTR("[attendingListeningType = %lu]"), self->_attendingListeningType);
  objc_msgSend(v3, "appendFormat:", CFSTR("[pauseDurationThreshold = %.2f]"), *(_QWORD *)&self->_pauseDurationThreshold);
  objc_msgSend(v3, "appendFormat:", CFSTR("[maxPauseDelay = %.2f]"), *(_QWORD *)&self->_maxPauseDelay);
  return v3;
}

- (CSAttendingOptions)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  CSAttendingOptions *v37;
  uint64_t v39;
  uint64_t v40;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CSAttendingOptions:::attendingType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v4, "unsignedIntegerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CSAttendingOptions:::startAttendingHostTime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v5, "unsignedLongLongValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CSAttendingOptions:::useVAD"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CSAttendingOptions:::useOwnVoiceVAD"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CSAttendingOptions:::useBoron"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CSAttendingOptions:::startOfSpeechThresholdInMs"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CSAttendingOptions:::prependAudioDuration"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  v17 = v16;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CSAttendingOptions:::timeoutThresholdInSec"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "doubleValue");
  v20 = v19;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CSAttendingOptions:::triggerType"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "unsignedIntegerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CSAttendingOptions:::audioStreamHoldingDurationInSec"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "doubleValue");
  v25 = v24;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CSAttendingOptions:::audioRecordType"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "longLongValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CSAttendingOptions:::deviceId"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CSAttendingOptions:::attendingListeningType"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "unsignedIntegerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CSAttendingOptions:::pauseDurationThreshold"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "doubleValue");
  v33 = v32;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CSAttendingOptions:::maxPauseDelay"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "doubleValue");
  v36 = v35;

  v37 = -[CSAttendingOptions initWithAttendingType:startAttendingHostTime:useVAD:useOwnVoiceVAD:useBoron:startOfSpeechThresholdInMs:prependAudioDuration:timeoutThresholdInSec:triggerType:audioStreamHoldingDurationInSec:audioRecordType:deviceId:attendingListeningType:pauseDurationThreshold:maxPauseDelay:](self, "initWithAttendingType:startAttendingHostTime:useVAD:useOwnVoiceVAD:useBoron:startOfSpeechThresholdInMs:prependAudioDuration:timeoutThresholdInSec:triggerType:audioStreamHoldingDurationInSec:audioRecordType:deviceId:attendingListeningType:pauseDurationThreshold:maxPauseDelay:", v40, v39, v7, v9, v11, v22, v14, v17, v20, v25, v33, v36, v27, v28, v30);
  return v37;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  int64_t attendingType;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  attendingType = self->_attendingType;
  v6 = a3;
  objc_msgSend(v4, "numberWithInteger:", attendingType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("CSAttendingOptions:::attendingType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_startAttendingHostTime);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("CSAttendingOptions:::startAttendingHostTime"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_useVAD);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("CSAttendingOptions:::useVAD"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_useOwnVoiceVAD);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v10, CFSTR("CSAttendingOptions:::useOwnVoiceVAD"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_useBoron);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v11, CFSTR("CSAttendingOptions:::useBoron"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_startOfSpeechThresholdInMs);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v12, CFSTR("CSAttendingOptions:::startOfSpeechThresholdInMs"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_startOfSpeechNearMissThresholdInMs);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v13, CFSTR("CSAttendingOptions:::startOfSpeechNearMissThresholdInMs"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_prependAudioDuration);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v14, CFSTR("CSAttendingOptions:::prependAudioDuration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timeoutThresholdInSec);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v15, CFSTR("CSAttendingOptions:::timeoutThresholdInSec"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_triggerType);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v16, CFSTR("CSAttendingOptions:::triggerType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_audioStreamHoldingDurationInSec);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v17, CFSTR("CSAttendingOptions:::audioStreamHoldingDurationInSec"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_recordType);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v18, CFSTR("CSAttendingOptions:::audioRecordType"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_deviceId, CFSTR("CSAttendingOptions:::deviceId"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_attendingListeningType);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v19, CFSTR("CSAttendingOptions:::attendingListeningType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_pauseDurationThreshold);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v20, CFSTR("CSAttendingOptions:::pauseDurationThreshold"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_maxPauseDelay);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v21, CFSTR("CSAttendingOptions:::maxPauseDelay"));

}

- (int64_t)attendingType
{
  return self->_attendingType;
}

- (unint64_t)startAttendingHostTime
{
  return self->_startAttendingHostTime;
}

- (BOOL)useVAD
{
  return self->_useVAD;
}

- (BOOL)useOwnVoiceVAD
{
  return self->_useOwnVoiceVAD;
}

- (BOOL)useBoron
{
  return self->_useBoron;
}

- (double)startOfSpeechThresholdInMs
{
  return self->_startOfSpeechThresholdInMs;
}

- (double)startOfSpeechNearMissThresholdInMs
{
  return self->_startOfSpeechNearMissThresholdInMs;
}

- (double)prependAudioDuration
{
  return self->_prependAudioDuration;
}

- (double)timeoutThresholdInSec
{
  return self->_timeoutThresholdInSec;
}

- (int64_t)triggerType
{
  return self->_triggerType;
}

- (double)audioStreamHoldingDurationInSec
{
  return self->_audioStreamHoldingDurationInSec;
}

- (int64_t)recordType
{
  return self->_recordType;
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (unint64_t)attendingListeningType
{
  return self->_attendingListeningType;
}

- (double)pauseDurationThreshold
{
  return self->_pauseDurationThreshold;
}

- (double)maxPauseDelay
{
  return self->_maxPauseDelay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceId, 0);
}

+ (id)optionForFlexibleFollowupWithAudioRecordType:(int64_t)a3 deviceId:(id)a4
{
  id v5;
  CSAttendingOptions *v6;

  v5 = a4;
  v6 = -[CSAttendingOptions initWithAttendingType:startAttendingHostTime:useVAD:useOwnVoiceVAD:useBoron:startOfSpeechThresholdInMs:prependAudioDuration:timeoutThresholdInSec:triggerType:audioStreamHoldingDurationInSec:audioRecordType:deviceId:attendingListeningType:pauseDurationThreshold:maxPauseDelay:]([CSAttendingOptions alloc], "initWithAttendingType:startAttendingHostTime:useVAD:useOwnVoiceVAD:useBoron:startOfSpeechThresholdInMs:prependAudioDuration:timeoutThresholdInSec:triggerType:audioStreamHoldingDurationInSec:audioRecordType:deviceId:attendingListeningType:pauseDurationThreshold:maxPauseDelay:", 1, 0, 1, 0, 1, 1, 300.0, 500.0, 0.0, 5.0, 3000.0, 7000.0, a3, v5, 2);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
