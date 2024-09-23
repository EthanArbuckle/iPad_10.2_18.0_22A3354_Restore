@implementation CSAttendingTriggerInfo

- (CSAttendingTriggerInfo)initWithAttendingType:(int64_t)a3 detectedToken:(id)a4 triggerMachTime:(unint64_t)a5 triggerAbsStartSampleId:(unint64_t)a6 audioRecordType:(int64_t)a7 audioRecordDeviceId:(id)a8 amountOfSpeechDetectedInMs:(float)a9 triggerThresholdInMs:(float)a10
{
  id v19;
  id v20;
  CSAttendingTriggerInfo *v21;
  CSAttendingTriggerInfo *v22;
  objc_super v24;

  v19 = a4;
  v20 = a8;
  v24.receiver = self;
  v24.super_class = (Class)CSAttendingTriggerInfo;
  v21 = -[CSAttendingTriggerInfo init](&v24, sel_init);
  v22 = v21;
  if (v21)
  {
    v21->_attendingType = a3;
    objc_storeStrong((id *)&v21->_detectedToken, a4);
    v22->_triggerMachTime = a5;
    v22->_triggerAbsStartSampleId = a6;
    v22->_audioRecordType = a7;
    objc_storeStrong((id *)&v22->_deviceId, a8);
    v22->_amountOfSpeechDetectedInMs = a9;
    v22->_triggerThresholdInMs = a10;
  }

  return v22;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  __CFString *v5;
  __CFString *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_attendingType - 1;
  if (v4 > 6)
    v5 = CFSTR("Default");
  else
    v5 = off_1E7C27688[v4];
  v6 = v5;
  objc_msgSend(v3, "appendFormat:", CFSTR("[type = %@]"), v6);

  objc_msgSend(v3, "appendFormat:", CFSTR("[detectedToken = %@]"), self->_detectedToken);
  objc_msgSend(v3, "appendFormat:", CFSTR("[triggerMachTime = %llu]"), self->_triggerMachTime);
  objc_msgSend(v3, "appendFormat:", CFSTR("[triggerAbsStartSampleId = %llu]"), self->_triggerAbsStartSampleId);
  objc_msgSend(v3, "appendFormat:", CFSTR("[recordType = %llu]"), self->_audioRecordType);
  objc_msgSend(v3, "appendFormat:", CFSTR("[deviceId = %@]"), self->_deviceId);
  objc_msgSend(v3, "appendFormat:", CFSTR("[amountOfSpeechDetectedInMs = %f]"), self->_amountOfSpeechDetectedInMs);
  objc_msgSend(v3, "appendFormat:", CFSTR("[detectionThresholdInMs = %f]"), self->_triggerThresholdInMs);
  return v3;
}

- (CSAttendingTriggerInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  int v16;
  int v17;
  int v18;
  double v19;
  double v20;
  CSAttendingTriggerInfo *v21;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CSAttendingTriggerInfo:::attendingType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CSAttendingTriggerInfo:::detectedToken"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CSAttendingTriggerInfo:::triggerMachTime"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedLongLongValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CSAttendingTriggerInfo:::triggerAbsStartSampleId"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedLongLongValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CSAttendingTriggerInfo:::audioRecordType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "longLongValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CSAttendingTriggerInfo:::deviceId"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("CSAttendingTriggerInfo:::amountOfSpeechDetectedInMs"));
  v16 = v15;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("CSAttendingTriggerInfo:::detectionThresholdInMs"));
  v18 = v17;

  LODWORD(v19) = v16;
  LODWORD(v20) = v18;
  v21 = -[CSAttendingTriggerInfo initWithAttendingType:detectedToken:triggerMachTime:triggerAbsStartSampleId:audioRecordType:audioRecordDeviceId:amountOfSpeechDetectedInMs:triggerThresholdInMs:](self, "initWithAttendingType:detectedToken:triggerMachTime:triggerAbsStartSampleId:audioRecordType:audioRecordDeviceId:amountOfSpeechDetectedInMs:triggerThresholdInMs:", v6, v7, v9, v11, v13, v14, v19, v20);

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  int64_t attendingType;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v12;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  attendingType = self->_attendingType;
  v12 = a3;
  objc_msgSend(v4, "numberWithInteger:", attendingType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v6, CFSTR("CSAttendingTriggerInfo:::attendingType"));

  objc_msgSend(v12, "encodeObject:forKey:", self->_detectedToken, CFSTR("CSAttendingTriggerInfo:::detectedToken"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_triggerMachTime);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v7, CFSTR("CSAttendingTriggerInfo:::triggerMachTime"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_triggerAbsStartSampleId);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v8, CFSTR("CSAttendingTriggerInfo:::triggerAbsStartSampleId"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_audioRecordType);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v9, CFSTR("CSAttendingTriggerInfo:::audioRecordType"));

  objc_msgSend(v12, "encodeObject:forKey:", self->_deviceId, CFSTR("CSAttendingTriggerInfo:::deviceId"));
  *(float *)&v10 = self->_amountOfSpeechDetectedInMs;
  objc_msgSend(v12, "encodeFloat:forKey:", CFSTR("CSAttendingTriggerInfo:::amountOfSpeechDetectedInMs"), v10);
  *(float *)&v11 = self->_triggerThresholdInMs;
  objc_msgSend(v12, "encodeFloat:forKey:", CFSTR("CSAttendingTriggerInfo:::detectionThresholdInMs"), v11);

}

- (int64_t)attendingType
{
  return self->_attendingType;
}

- (NSString)detectedToken
{
  return self->_detectedToken;
}

- (unint64_t)triggerMachTime
{
  return self->_triggerMachTime;
}

- (unint64_t)triggerAbsStartSampleId
{
  return self->_triggerAbsStartSampleId;
}

- (int64_t)audioRecordType
{
  return self->_audioRecordType;
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (float)amountOfSpeechDetectedInMs
{
  return self->_amountOfSpeechDetectedInMs;
}

- (float)triggerThresholdInMs
{
  return self->_triggerThresholdInMs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceId, 0);
  objc_storeStrong((id *)&self->_detectedToken, 0);
}

+ (id)triggerInfoForServerInvoke
{
  CSAttendingTriggerInfo *v2;
  double v3;
  double v4;

  v2 = [CSAttendingTriggerInfo alloc];
  LODWORD(v3) = 0;
  LODWORD(v4) = 0;
  return -[CSAttendingTriggerInfo initWithAttendingType:detectedToken:triggerMachTime:triggerAbsStartSampleId:audioRecordType:audioRecordDeviceId:amountOfSpeechDetectedInMs:triggerThresholdInMs:](v2, "initWithAttendingType:detectedToken:triggerMachTime:triggerAbsStartSampleId:audioRecordType:audioRecordDeviceId:amountOfSpeechDetectedInMs:triggerThresholdInMs:", 0, 0, 0, 0, 5, 0, v3, v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
