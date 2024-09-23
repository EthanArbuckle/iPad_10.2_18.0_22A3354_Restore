@implementation AVAudioSessionSpecification

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->clientIdentifier, 0);
}

- (unsigned)sourceSessionID
{
  return self->sourceSessionID;
}

- (unsigned)useCaseIdentifier
{
  return self->useCaseIdentifier;
}

- (unint64_t)sessionType
{
  return self->sessionType;
}

- (NSString)clientIdentifier
{
  return self->clientIdentifier;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)clientAuditToken
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var0[6];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[1].var0[2];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void)setSessionType:(unint64_t)a3
{
  self->sessionType = a3;
}

- (void)setSourceSessionID:(unsigned int)a3
{
  self->sourceSessionID = a3;
}

- (void)setClientIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setClientAuditToken:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_clientAuditToken.val[4] = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_clientAuditToken.val = v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", self->sessionType, CFSTR("sessionType"));
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &self->_clientAuditToken, 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("clientAuditToken"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->sourceSessionID, CFSTR("sourceSessionID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->clientIdentifier, CFSTR("clientIdentifier"));

}

- (AVAudioSessionSpecification)initWithCoder:(id)a3
{
  id v4;
  AVAudioSessionSpecification *v5;
  void *v6;
  uint64_t v7;
  NSString *clientIdentifier;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AVAudioSessionSpecification;
  v5 = -[AVAudioSessionSpecification init](&v10, sel_init);
  if (v5)
  {
    v5->sessionType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sessionType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientAuditToken"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getBytes:length:", &v5->_clientAuditToken, 32);
    v5->sourceSessionID = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("sourceSessionID"));
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("clientIdentifer"));
    v7 = objc_claimAutoreleasedReturnValue();
    clientIdentifier = v5->clientIdentifier;
    v5->clientIdentifier = (NSString *)v7;

  }
  return v5;
}

- (void)setUseCaseIdentifier:(unsigned int)a3
{
  self->useCaseIdentifier = a3;
}

- (BOOL)autoReconnect
{
  return self->autoReconnect;
}

- (void)setAutoReconnect:(BOOL)a3
{
  self->autoReconnect = a3;
}

@end
