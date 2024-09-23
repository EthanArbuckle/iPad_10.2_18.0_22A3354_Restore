@implementation SHSignatureMetrics

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SHSignatureMetrics)initWithSessionStartDate:(id)a3 signatureRecordingOffset:(double)a4
{
  id v7;
  SHSignatureMetrics *v8;
  SHSignatureMetrics *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SHSignatureMetrics;
  v8 = -[SHSignatureMetrics init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_sessionStartDate, a3);
    v9->_signatureRecordingOffset = a4;
  }

  return v9;
}

- (SHSignatureMetrics)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  SHSignatureMetrics *v9;
  SHSignatureMetrics *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionStartDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("recordingSource"));
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("signatureRecordingOffset"));
  v8 = v7;

  v9 = -[SHSignatureMetrics initWithSessionStartDate:signatureRecordingOffset:](self, "initWithSessionStartDate:signatureRecordingOffset:", v5, v8);
  v10 = v9;
  if (v9)
    v9->_recordingSource = v6;

  return v10;
}

- (double)sessionDuration
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[SHSignatureMetrics sessionStartDate](self, "sessionStartDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSignatureMetrics sessionStartDate](self, "sessionStartDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v5);
    v7 = v6;

  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SHSignatureMetrics sessionStartDate](self, "sessionStartDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("sessionStartDate"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[SHSignatureMetrics recordingSource](self, "recordingSource"), CFSTR("recordingSource"));
  -[SHSignatureMetrics signatureRecordingOffset](self, "signatureRecordingOffset");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("signatureRecordingOffset"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  SHSignatureMetrics *v5;
  void *v6;
  void *v7;
  SHSignatureMetrics *v8;

  v5 = +[SHSignatureMetrics allocWithZone:](SHSignatureMetrics, "allocWithZone:");
  -[SHSignatureMetrics sessionStartDate](self, "sessionStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[SHSignatureMetrics signatureRecordingOffset](self, "signatureRecordingOffset");
  v8 = -[SHSignatureMetrics initWithSessionStartDate:signatureRecordingOffset:](v5, "initWithSessionStartDate:signatureRecordingOffset:", v7);

  -[SHSignatureMetrics setRecordingSource:](v8, "setRecordingSource:", -[SHSignatureMetrics recordingSource](self, "recordingSource"));
  return v8;
}

- (int64_t)recordingSource
{
  return self->_recordingSource;
}

- (void)setRecordingSource:(int64_t)a3
{
  self->_recordingSource = a3;
}

- (NSDate)sessionStartDate
{
  return self->_sessionStartDate;
}

- (double)signatureRecordingOffset
{
  return self->_signatureRecordingOffset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionStartDate, 0);
}

@end
