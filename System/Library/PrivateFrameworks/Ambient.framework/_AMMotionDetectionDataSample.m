@implementation _AMMotionDetectionDataSample

+ (id)zeroMotionDataWithTimestamp:(double)a3
{
  _AMMotionDetectionDataSample *v4;

  v4 = objc_alloc_init(_AMMotionDetectionDataSample);
  -[_AMMotionDetectionDataSample setData:](v4, "setData:", &unk_250762708);
  -[_AMMotionDetectionDataSample setTimestampSeconds:](v4, "setTimestampSeconds:", a3);
  return v4;
}

- (id)description
{
  void *v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  NSUInteger v7;
  void *v8;
  void *v9;
  float v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NSArray count](self->_data, "count");
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = v4 - 1;
    do
    {
      v8 = (void *)MEMORY[0x24BDD17C8];
      -[NSArray objectAtIndexedSubscript:](self->_data, "objectAtIndexedSubscript:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "floatValue");
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%0.3f"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = CFSTR(" %@,");
      if (v7 == v6)
        v12 = CFSTR(" %@)");
      if (v6)
        v13 = v12;
      else
        v13 = CFSTR("( %@,");
      objc_msgSend(v3, "appendFormat:", v13, v11);

      ++v6;
    }
    while (v5 != v6);
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p : t=%0.3fs data=%@>"), objc_opt_class(), self, *(_QWORD *)&self->_timestampSeconds, v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSArray)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (double)timestampSeconds
{
  return self->_timestampSeconds;
}

- (void)setTimestampSeconds:(double)a3
{
  self->_timestampSeconds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
