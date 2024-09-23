@implementation AFAudioState

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)AFAudioState;
  -[AFAudioState description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {audioSessionID = %u}"), v4, self->_audioSessionID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = -[AFAudioState init](+[AFAudioState allocWithZone:](AFAudioState, "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = self->_audioSessionID;
  return result;
}

- (AFAudioState)initWithCoder:(id)a3
{
  id v4;
  AFAudioState *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AFAudioState;
  v5 = -[AFAudioState init](&v8, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_audioSessionID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_audioSessionID = objc_msgSend(v6, "unsignedIntValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v3;
  uint64_t audioSessionID;
  id v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  audioSessionID = self->_audioSessionID;
  v5 = a3;
  objc_msgSend(v3, "numberWithUnsignedInt:", audioSessionID);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("_audioSessionID"));

}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (void)setAudioSessionID:(unsigned int)a3
{
  self->_audioSessionID = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
