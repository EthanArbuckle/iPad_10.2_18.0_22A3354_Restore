@implementation SHSignature

+ (id)signatureFromData:(id)a3 atTime:(id)a4 error:(id *)a5
{
  return +[SHSignature signatureWithDataRepresentation:error:](SHSignature, "signatureWithDataRepresentation:error:", a3, a5);
}

+ (SHSignature)signatureWithDataRepresentation:(NSData *)dataRepresentation error:(NSError *)error
{
  NSData *v5;
  SHSignature *v6;

  v5 = dataRepresentation;
  v6 = -[SHSignature initWithDataRepresentation:error:]([SHSignature alloc], "initWithDataRepresentation:error:", v5, error);

  +[SHError remapErrorToClientErrorPointer:](SHError, "remapErrorToClientErrorPointer:", error);
  return v6;
}

- (SHSignature)initWithDataRepresentation:(NSData *)dataRepresentation error:(NSError *)error
{
  NSData *v6;
  void *v7;
  SHSignature *v8;
  void *v9;
  SHSignature *v10;
  objc_super v12;

  v6 = dataRepresentation;
  if (+[SHSignatureDataRepresentationValidator signatureDataIsValid:error:](SHSignatureDataRepresentationValidator, "signatureDataIsValid:error:", v6, error))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB1880]), "initWithHostTime:", mach_absolute_time());
    v12.receiver = self;
    v12.super_class = (Class)SHSignature;
    v8 = -[SHSignature init](&v12, sel_init);
    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SHSignature commonSetupWithID:dataRepresentation:startTime:](v8, "commonSetupWithID:dataRepresentation:startTime:", v9, v6, v7);

    }
    self = v8;

    v10 = self;
  }
  else
  {
    +[SHError remapErrorToClientErrorPointer:](SHError, "remapErrorToClientErrorPointer:", error);
    v10 = 0;
  }

  return v10;
}

- (SHSignature)initWithID:(id)a3 dataRepresentation:(id)a4 startTime:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  SHSignature *v12;
  SHSignature *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SHSignature;
  v12 = -[SHSignature init](&v15, sel_init);
  v13 = v12;
  if (v12)
    -[SHSignature commonSetupWithID:dataRepresentation:startTime:](v12, "commonSetupWithID:dataRepresentation:startTime:", v9, v10, v11);

  return v13;
}

- (void)commonSetupWithID:(id)a3 dataRepresentation:(id)a4 startTime:(id)a5
{
  NSUUID *v8;
  NSData *v9;
  AVAudioTime *v10;
  NSUUID *ID;
  AVAudioTime *time;
  AVAudioTime *v13;
  NSData *dataRepresentation;
  NSData *v15;
  NSDate *v16;
  NSDate *audioStartDate;
  NSUUID *v18;

  v8 = (NSUUID *)a3;
  v9 = (NSData *)a4;
  v10 = (AVAudioTime *)a5;
  ID = self->__ID;
  self->__ID = v8;
  v18 = v8;

  time = self->_time;
  self->_time = v10;
  v13 = v10;

  dataRepresentation = self->_dataRepresentation;
  self->_dataRepresentation = v9;
  v15 = v9;

  -[SHSignature _startDateBasedUponAudioTime:](self, "_startDateBasedUponAudioTime:", v13);
  v16 = (NSDate *)objc_claimAutoreleasedReturnValue();
  audioStartDate = self->_audioStartDate;
  self->_audioStartDate = v16;

}

- (SHSignature)init
{
  void *v3;
  void *v4;
  void *v5;
  SHSignature *v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB1880]), "initWithHostTime:", mach_absolute_time());
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE50], "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SHSignature initWithID:dataRepresentation:startTime:error:](self, "initWithID:dataRepresentation:startTime:error:", v4, v5, v3, 0);

  return v6;
}

- (id)_startDateBasedUponAudioTime:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (objc_msgSend(v4, "isHostTimeValid"))
  {
    objc_msgSend(MEMORY[0x24BDB1880], "secondsForHostTime:", mach_absolute_time());
    v6 = v5;
    objc_msgSend(MEMORY[0x24BDB1880], "secondsForHostTime:", objc_msgSend(v4, "hostTime"));
    v8 = v6 - v7;
    v9 = (void *)MEMORY[0x24BDBCE60];
  }
  else
  {
    v9 = (void *)MEMORY[0x24BDBCE60];
    -[SHSignature duration](self, "duration");
  }
  objc_msgSend(v9, "dateWithTimeIntervalSinceNow:", -v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSTimeInterval)duration
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  id v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[SHSignature dataRepresentation](self, "dataRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4)
    return 0.0;
  -[SHSignature dataRepresentation](self, "dataRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  +[SigCrop getSampleLength:error:](SigCrop, "getSampleLength:error:", v5, &v11);
  v7 = v6;
  v8 = v11;

  if (v8)
  {
    sh_log_object();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_impl(&dword_218BF1000, v9, OS_LOG_TYPE_ERROR, "Error getting signature duration, returning 0, %@", buf, 0xCu);
    }

  }
  return v7;
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (SHSignatureMetrics)metrics
{
  SHSignatureMetrics *metrics;
  SHSignatureMetrics *v4;
  void *v5;
  SHSignatureMetrics *v6;
  SHSignatureMetrics *v7;

  metrics = self->_metrics;
  if (!metrics)
  {
    v4 = [SHSignatureMetrics alloc];
    -[SHSignature audioStartDate](self, "audioStartDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SHSignatureMetrics initWithSessionStartDate:signatureRecordingOffset:](v4, "initWithSessionStartDate:signatureRecordingOffset:", v5, 0.0);
    v7 = self->_metrics;
    self->_metrics = v6;

    metrics = self->_metrics;
  }
  return metrics;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SHSignature)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SHSignature *v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SHSignatureCodingKeyData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("SHSignatureCodingHostTime"));
  v7 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("SHSignatureCodingSampleTime"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("SHSignatureCodingTimeSampleRate"));
  v9 = v8;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SHSignatureCodingKeyID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SHSignatureCodingMetrics"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SHSignatureCodingSignatureStartDate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDB1880], "timeWithHostTime:sampleTime:atRate:", v6, v7, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SHSignature initWithID:dataRepresentation:startTime:error:](self, "initWithID:dataRepresentation:startTime:error:", v10, v5, v13, 0);

  -[SHSignature setMetrics:](v14, "setMetrics:", v11);
  -[SHSignature setAudioStartDate:](v14, "setAudioStartDate:", v12);

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[SHSignature dataRepresentation](self, "dataRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("SHSignatureCodingKeyData"));

  -[SHSignature time](self, "time");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInt64:forKey:", objc_msgSend(v6, "hostTime"), CFSTR("SHSignatureCodingHostTime"));

  -[SHSignature time](self, "time");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInt64:forKey:", objc_msgSend(v7, "sampleTime"), CFSTR("SHSignatureCodingSampleTime"));

  -[SHSignature time](self, "time");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sampleRate");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("SHSignatureCodingTimeSampleRate"));

  -[SHSignature _ID](self, "_ID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("SHSignatureCodingKeyID"));

  -[SHSignature metrics](self, "metrics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("SHSignatureCodingMetrics"));

  -[SHSignature audioStartDate](self, "audioStartDate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("SHSignatureCodingSignatureStartDate"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  SHSignature *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SHSignature *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v5 = (void *)MEMORY[0x24BDB1880];
  -[SHSignature time](self, "time");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "sampleTime");
  -[SHSignature time](self, "time");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sampleRate");
  objc_msgSend(v5, "timeWithSampleTime:atRate:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = +[SHSignature allocWithZone:](SHSignature, "allocWithZone:", a3);
  -[SHSignature _ID](self, "_ID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copyWithZone:", a3);
  -[SHSignature dataRepresentation](self, "dataRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copyWithZone:", a3);
  v15 = -[SHSignature initWithID:dataRepresentation:startTime:error:](v10, "initWithID:dataRepresentation:startTime:error:", v12, v14, v9, 0);

  -[SHSignature metrics](self, "metrics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copyWithZone:", a3);
  -[SHSignature setMetrics:](v15, "setMetrics:", v17);

  -[SHSignature audioStartDate](self, "audioStartDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copyWithZone:", a3);
  -[SHSignature setAudioStartDate:](v15, "setAudioStartDate:", v19);

  return v15;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSignature duration](self, "duration");
  v7 = v6;
  v11.receiver = self;
  v11.super_class = (Class)SHSignature;
  -[SHSignature debugDescription](&v11, sel_debugDescription);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %.2fs %@"), v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSData)dataRepresentation
{
  return self->_dataRepresentation;
}

- (NSDate)audioStartDate
{
  return self->_audioStartDate;
}

- (void)setAudioStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_audioStartDate, a3);
}

- (AVAudioTime)time
{
  return self->_time;
}

- (void)setTime:(id)a3
{
  objc_storeStrong((id *)&self->_time, a3);
}

- (NSUUID)_ID
{
  return self->__ID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__ID, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_audioStartDate, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_dataRepresentation, 0);
}

@end
