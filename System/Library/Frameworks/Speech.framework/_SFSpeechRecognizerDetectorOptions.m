@implementation _SFSpeechRecognizerDetectorOptions

- (_SFSpeechRecognizerDetectorOptions)initWithDetectAfterTime:(double)a3
{
  _SFSpeechRecognizerDetectorOptions *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_SFSpeechRecognizerDetectorOptions;
  result = -[_SFSpeechRecognizerDetectorOptions init](&v5, sel_init);
  if (result)
    result->_detectAfterTime = a3;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("_detectAfterTime"), self->_detectAfterTime);
}

- (_SFSpeechRecognizerDetectorOptions)initWithCoder:(id)a3
{
  id v4;
  _SFSpeechRecognizerDetectorOptions *v5;
  double v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_SFSpeechRecognizerDetectorOptions;
  v5 = -[_SFSpeechRecognizerDetectorOptions init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_detectAfterTime"));
    v5->_detectAfterTime = v6;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _SFSpeechRecognizerDetectorOptions *v4;
  BOOL v5;

  v4 = (_SFSpeechRecognizerDetectorOptions *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else if (-[_SFSpeechRecognizerDetectorOptions isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = self->_detectAfterTime == v4->_detectAfterTime;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return *(_QWORD *)&self->_detectAfterTime;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<_SFSpeechRecognizerDetectorOptions: detectAfterTime %f>"), *(_QWORD *)&self->_detectAfterTime);
}

- (double)detectAfterTime
{
  return self->_detectAfterTime;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
