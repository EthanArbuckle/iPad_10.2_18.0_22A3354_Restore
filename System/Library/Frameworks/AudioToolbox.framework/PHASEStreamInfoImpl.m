@implementation PHASEStreamInfoImpl

- (PHASEStreamInfoImpl)initWithFormat:(id)a3 latencyInFrames:(unsigned int)a4
{
  id v7;
  PHASEStreamInfoImpl *v8;
  PHASEStreamInfoImpl *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PHASEStreamInfoImpl;
  v8 = -[PHASEStreamInfoImpl init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_format, a3);
    v9->_latencyInFrames = a4;
  }

  return v9;
}

- (PHASEStreamInfoImpl)initWithFormat:(id)a3 latencyInFrames:(unsigned int)a4 streamDescription:(id)a5
{
  id v9;
  id v10;
  PHASEStreamInfoImpl *v11;
  PHASEStreamInfoImpl *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PHASEStreamInfoImpl;
  v11 = -[PHASEStreamInfoImpl init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_format, a3);
    v12->_latencyInFrames = a4;
    objc_storeStrong((id *)&v12->_streamDescription, a5);
  }

  return v12;
}

- (AVAudioFormat)format
{
  return self->_format;
}

- (unsigned)latencyInFrames
{
  return self->_latencyInFrames;
}

- (NSDictionary)streamDescription
{
  return self->_streamDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamDescription, 0);
  objc_storeStrong((id *)&self->_format, 0);
}

@end
