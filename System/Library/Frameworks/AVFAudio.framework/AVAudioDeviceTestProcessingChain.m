@implementation AVAudioDeviceTestProcessingChain

- (void)encodeWithCoder:(id)a3
{
  NSURL *graphURL;
  id v5;

  graphURL = self->_graphURL;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", graphURL, CFSTR("graphURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_processingStripURL, CFSTR("processingStripURL"));

}

- (AVAudioDeviceTestProcessingChain)initWithCoder:(id)a3
{
  id v4;
  AVAudioDeviceTestProcessingChain *v5;
  uint64_t v6;
  NSURL *graphURL;
  uint64_t v8;
  NSURL *processingStripURL;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AVAudioDeviceTestProcessingChain;
  v5 = -[AVAudioDeviceTestProcessingChain init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("graphURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    graphURL = v5->_graphURL;
    v5->_graphURL = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("processingStripURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    processingStripURL = v5->_processingStripURL;
    v5->_processingStripURL = (NSURL *)v8;

  }
  return v5;
}

- (NSURL)graphURL
{
  return self->_graphURL;
}

- (void)setGraphURL:(id)a3
{
  objc_storeStrong((id *)&self->_graphURL, a3);
}

- (NSURL)processingStripURL
{
  return self->_processingStripURL;
}

- (void)setProcessingStripURL:(id)a3
{
  objc_storeStrong((id *)&self->_processingStripURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingStripURL, 0);
  objc_storeStrong((id *)&self->_graphURL, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
