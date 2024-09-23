@implementation MNTraceBookmark

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNTraceBookmark)initWithCoder:(id)a3
{
  id v4;
  MNTraceBookmark *v5;
  double v6;
  uint64_t v7;
  NSData *imageData;
  MNTraceBookmark *v9;

  v4 = a3;
  v5 = -[MNTraceBookmark init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_timestamp"));
    v5->_timestamp = v6;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_imageData"));
    v7 = objc_claimAutoreleasedReturnValue();
    imageData = v5->_imageData;
    v5->_imageData = (NSData *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double timestamp;
  id v5;

  timestamp = self->_timestamp;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_timestamp"), timestamp);
  objc_msgSend(v5, "encodeObject:forKey:", self->_imageData, CFSTR("_imageData"));

}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
  objc_storeStrong((id *)&self->_imageData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageData, 0);
}

@end
