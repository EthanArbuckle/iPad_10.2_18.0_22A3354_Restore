@implementation MKHTTPServerTimingMetric

- (MKHTTPServerTimingMetric)initWithDuration:(double)a3
{
  MKHTTPServerTimingMetric *v4;
  MKHTTPServerTimingMetric *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MKHTTPServerTimingMetric;
  v4 = -[MKHTTPServerTimingMetric init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[MKHTTPServerTimingMetric setDuration:](v4, "setDuration:", a3);
  return v5;
}

- (MKHTTPServerTimingMetric)initWithDuration:(double)a3 desc:(id)a4
{
  id v6;
  MKHTTPServerTimingMetric *v7;
  MKHTTPServerTimingMetric *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)MKHTTPServerTimingMetric;
  v7 = -[MKHTTPServerTimingMetric init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[MKHTTPServerTimingMetric setDuration:](v7, "setDuration:", a3);
    -[MKHTTPServerTimingMetric setDesc:](v8, "setDesc:", v6);
  }

  return v8;
}

- (id)value
{
  uint64_t v4;

  if (-[NSString length](self->_desc, "length"))
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("desc=\"%@\";dur=%f"),
      self->_desc,
      *(_QWORD *)&self->_duration);
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("dur=%f"), *(_QWORD *)&self->_duration, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (NSString)desc
{
  return self->_desc;
}

- (void)setDesc:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desc, 0);
}

@end
