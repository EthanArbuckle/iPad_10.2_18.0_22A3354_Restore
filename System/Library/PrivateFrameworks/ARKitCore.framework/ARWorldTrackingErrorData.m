@implementation ARWorldTrackingErrorData

- (ARWorldTrackingErrorData)initWithTimestamp:(double)a3
{
  ARWorldTrackingErrorData *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ARWorldTrackingErrorData;
  result = -[ARWorldTrackingErrorData init](&v5, sel_init);
  if (result)
    result->_timestamp = a3;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  double timestamp;
  id v5;

  timestamp = self->_timestamp;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("timestamp"), timestamp);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_errorCode, CFSTR("errorCode"));

}

- (ARWorldTrackingErrorData)initWithCoder:(id)a3
{
  id v4;
  ARWorldTrackingErrorData *v5;
  double v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ARWorldTrackingErrorData;
  v5 = -[ARWorldTrackingErrorData init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timestamp"));
    v5->_timestamp = v6;
    v5->_errorCode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("errorCode"));
  }

  return v5;
}

- (unint64_t)hash
{
  return (unint64_t)(self->_timestamp * 1000.0);
}

- (BOOL)isEqual:(id)a3
{
  double *v4;
  BOOL v5;

  v4 = (double *)a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && vabdd_f64(self->_timestamp, v4[1]) < 2.22044605e-16
    && self->_errorCode == *((_QWORD *)v4 + 2);

  return v5;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  self->_errorCode = a3;
}

@end
