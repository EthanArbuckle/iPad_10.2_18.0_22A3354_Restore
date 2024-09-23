@implementation RPBroadcastConfiguration

- (RPBroadcastConfiguration)initWithCoder:(id)a3
{
  id v4;
  RPBroadcastConfiguration *v5;
  void *v6;
  double v7;
  uint64_t v8;
  NSDictionary *videoCompressionProperties;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RPBroadcastConfiguration;
  v5 = -[RPBroadcastConfiguration init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clipDuration"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v5->_clipDuration = v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("videoCompressionProperties"));
    v8 = objc_claimAutoreleasedReturnValue();
    videoCompressionProperties = v5->_videoCompressionProperties;
    v5->_videoCompressionProperties = (NSDictionary *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_clipDuration);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("clipDuration"));

  -[NSDictionary allValues](self->_videoCompressionProperties, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
    objc_msgSend(v7, "encodeObject:forKey:", self->_videoCompressionProperties, CFSTR("videoCompressionProperties"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSTimeInterval)clipDuration
{
  return self->_clipDuration;
}

- (void)setClipDuration:(NSTimeInterval)clipDuration
{
  self->_clipDuration = clipDuration;
}

- (NSDictionary)videoCompressionProperties
{
  return self->_videoCompressionProperties;
}

- (void)setVideoCompressionProperties:(NSDictionary *)videoCompressionProperties
{
  objc_storeStrong((id *)&self->_videoCompressionProperties, videoCompressionProperties);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoCompressionProperties, 0);
}

@end
