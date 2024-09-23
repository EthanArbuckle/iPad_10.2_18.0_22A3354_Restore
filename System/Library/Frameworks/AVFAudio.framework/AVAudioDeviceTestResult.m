@implementation AVAudioDeviceTestResult

- (AVAudioDeviceTestResult)initWithData:(id)a3 inputID:(int64_t)a4 outputID:(int64_t)a5 sampleRate:(double)a6 correlationValue:(double)a7
{
  id v13;
  AVAudioDeviceTestResult *v14;
  AVAudioDeviceTestResult *v15;
  objc_super v17;

  v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AVAudioDeviceTestResult;
  v14 = -[AVAudioDeviceTestResult init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_data, a3);
    v15->_inputID = a4;
    v15->_outputID = a5;
    v15->_sampleRate = a6;
    v15->_correlationValue = a7;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *data;
  id v5;

  data = self->_data;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", data, CFSTR("data"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_outputID, CFSTR("outputID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_inputID, CFSTR("inputID"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("sampleRate"), self->_sampleRate);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("correlationValue"), self->_correlationValue);

}

- (AVAudioDeviceTestResult)initWithCoder:(id)a3
{
  id v4;
  AVAudioDeviceTestResult *v5;
  uint64_t v6;
  NSData *data;
  double v8;
  double v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AVAudioDeviceTestResult;
  v5 = -[AVAudioDeviceTestResult init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
    v6 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v6;

    v5->_outputID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("outputID"));
    v5->_inputID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("inputID"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("sampleRate"));
    v5->_sampleRate = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("correlationValue"));
    v5->_correlationValue = v9;
  }

  return v5;
}

- (int64_t)inputID
{
  return self->_inputID;
}

- (void)setInputID:(int64_t)a3
{
  self->_inputID = a3;
}

- (int64_t)outputID
{
  return self->_outputID;
}

- (void)setOutputID:(int64_t)a3
{
  self->_outputID = a3;
}

- (NSData)data
{
  return self->_data;
}

- (double)sampleRate
{
  return self->_sampleRate;
}

- (void)setSampleRate:(double)a3
{
  self->_sampleRate = a3;
}

- (double)correlationValue
{
  return self->_correlationValue;
}

- (void)setCorrelationValue:(double)a3
{
  self->_correlationValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
