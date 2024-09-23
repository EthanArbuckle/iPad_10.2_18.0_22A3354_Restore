@implementation PHASEExternalStreamDebugInfo

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  _BOOL4 v9;

  v4 = a3;
  -[PHASEExternalStreamDebugInfo clientFormat](self, "clientFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v6)
    && (v7 = -[PHASEExternalStreamDebugInfo isInput](self, "isInput"), v7 == objc_msgSend(v4, "isInput")))
  {
    v9 = -[PHASEExternalStreamDebugInfo isStreamPaused](self, "isStreamPaused");
    v8 = v9 ^ objc_msgSend(v4, "isStreamPaused") ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_clientFormat, CFSTR("clientFormat"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_input, CFSTR("input"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_streamPaused, CFSTR("streamPaused"));

}

- (PHASEExternalStreamDebugInfo)initWithCoder:(id)a3
{
  id v4;
  PHASEExternalStreamDebugInfo *v5;
  uint64_t v6;
  AVAudioFormat *clientFormat;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHASEExternalStreamDebugInfo;
  v5 = -[PHASEExternalStreamDebugInfo init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientFormat"));
    v6 = objc_claimAutoreleasedReturnValue();
    clientFormat = v5->_clientFormat;
    v5->_clientFormat = (AVAudioFormat *)v6;

    v5->_input = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("input"));
    v5->_streamPaused = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("streamPaused"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<PHASEExternalStreamDebugInfo:%p, clientFormat=%@, isInput=%d, isStreamPaused=%d>"), self, self->_clientFormat, self->_input, self->_streamPaused);
}

- (void)setClientFormat:(id)a3
{
  objc_storeStrong((id *)&self->_clientFormat, a3);
}

- (void)setInput:(BOOL)a3
{
  self->_input = a3;
}

- (void)setStreamPaused:(BOOL)a3
{
  self->_streamPaused = a3;
}

- (AVAudioFormat)clientFormat
{
  return self->_clientFormat;
}

- (BOOL)isInput
{
  return self->_input;
}

- (BOOL)isStreamPaused
{
  return self->_streamPaused;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientFormat, 0);
}

@end
