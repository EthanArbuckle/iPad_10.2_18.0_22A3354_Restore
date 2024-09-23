@implementation _TempTokenTimestampValue

- (_TempTokenTimestampValue)initWithCoder:(id)a3
{
  id v4;
  _TempTokenTimestampValue *v5;
  double v6;
  uint64_t v7;
  NSString *formatPattern;
  uint64_t v9;
  NSTimeZone *timeZone;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_TempTokenTimestampValue;
  v5 = -[_TempTokenTimestampValue init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("timestamp"));
    v5->_timeStamp = v6;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("formatPattern"));
    v7 = objc_claimAutoreleasedReturnValue();
    formatPattern = v5->_formatPattern;
    v5->_formatPattern = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeZone"));
    v9 = objc_claimAutoreleasedReturnValue();
    timeZone = v5->_timeZone;
    v5->_timeZone = (NSTimeZone *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double timeStamp;
  id v5;

  timeStamp = self->_timeStamp;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("timestamp"), timeStamp);
  objc_msgSend(v5, "encodeObject:forKey:", self->_timeZone, CFSTR("timeZone"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_formatPattern, CFSTR("formatPattern"));

}

- (double)timeStamp
{
  return self->_timeStamp;
}

- (void)setTimeStamp:(double)a3
{
  self->_timeStamp = a3;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_timeZone, a3);
}

- (NSString)formatPattern
{
  return self->_formatPattern;
}

- (void)setFormatPattern:(id)a3
{
  objc_storeStrong((id *)&self->_formatPattern, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatPattern, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
}

@end
