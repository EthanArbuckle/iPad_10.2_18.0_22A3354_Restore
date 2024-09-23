@implementation _TimeStampValue

- (_TimeStampValue)initWithTimeStamp:(double)a3 timeZone:(id)a4 formatPattern:(id)a5
{
  id v9;
  id v10;
  _TimeStampValue *v11;
  _TimeStampValue *v12;
  uint64_t v13;
  NSString *formatPattern;
  objc_super v16;

  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_TimeStampValue;
  v11 = -[_TimeStampValue init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_timeStamp = a3;
    objc_storeStrong((id *)&v11->_timeZone, a4);
    v13 = objc_msgSend(v10, "copy");
    formatPattern = v12->_formatPattern;
    v12->_formatPattern = (NSString *)v13;

  }
  return v12;
}

- (_TimeStampValue)initWithCoder:(id)a3
{
  id v4;
  _TimeStampValue *v5;
  double v6;
  uint64_t v7;
  NSTimeZone *timeZone;
  void *v9;
  uint64_t v10;
  NSString *formatPattern;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_TimeStampValue;
  v5 = -[_TimeStampValue init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timeStamp"));
    v5->_timeStamp = v6;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeZone"));
    v7 = objc_claimAutoreleasedReturnValue();
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSTimeZone *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("formatPattern"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    formatPattern = v5->_formatPattern;
    v5->_formatPattern = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double timeStamp;
  id v5;

  timeStamp = self->_timeStamp;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("timeStamp"), timeStamp);
  objc_msgSend(v5, "encodeObject:forKey:", self->_timeZone, CFSTR("timeZone"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_formatPattern, CFSTR("formatPattern"));

}

- (double)timeStamp
{
  return self->_timeStamp;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (NSString)formatPattern
{
  return self->_formatPattern;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatPattern, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
}

@end
