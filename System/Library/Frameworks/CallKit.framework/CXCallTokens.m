@implementation CXCallTokens

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" uplinkStreamToken=%ld"), -[CXCallTokens uplinkStreamToken](self, "uplinkStreamToken"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" downlinkStreamToken=%ld"), -[CXCallTokens downlinkStreamToken](self, "downlinkStreamToken"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" combinedAudioStreamToken=%ld"), -[CXCallTokens combinedAudioStreamToken](self, "combinedAudioStreamToken"));
  -[CXCallTokens streamTokensByParticipantID](self, "streamTokensByParticipantID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" streamTokensByParticipantID=%@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (id)sanitizedCopy
{
  return -[CXCallTokens sanitizedCopyWithZone:](self, "sanitizedCopyWithZone:", 0);
}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  return 0;
}

- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[CXCallTokens updateSanitizedCopy:withZone:](self, "updateSanitizedCopy:withZone:", v6, a4);
  objc_msgSend(v6, "setUplinkStreamToken:", -[CXCallTokens uplinkStreamToken](self, "uplinkStreamToken"));
  objc_msgSend(v6, "setDownlinkStreamToken:", -[CXCallTokens downlinkStreamToken](self, "downlinkStreamToken"));
  objc_msgSend(v6, "setCombinedAudioStreamToken:", -[CXCallTokens combinedAudioStreamToken](self, "combinedAudioStreamToken"));
  -[CXCallTokens streamTokensByParticipantID](self, "streamTokensByParticipantID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStreamTokensByParticipantID:", v7);

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CXCallTokens updateCopy:withZone:](self, "updateCopy:withZone:", v5, a3);
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXCallTokens)initWithCoder:(id)a3
{
  id v4;
  CXCallTokens *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSDictionary *streamTokensByParticipantID;

  v4 = a3;
  v5 = -[CXCallTokens init](self, "init");
  if (v5)
  {
    NSStringFromSelector(sel_uplinkStreamToken);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_uplinkStreamToken = objc_msgSend(v4, "decodeIntegerForKey:", v6);

    NSStringFromSelector(sel_downlinkStreamToken);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_downlinkStreamToken = objc_msgSend(v4, "decodeIntegerForKey:", v7);

    NSStringFromSelector(sel_combinedAudioStreamToken);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_combinedAudioStreamToken = objc_msgSend(v4, "decodeIntegerForKey:", v8);

    v9 = objc_opt_class();
    NSStringFromSelector(sel_streamTokensByParticipantID);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    streamTokensByParticipantID = v5->_streamTokensByParticipantID;
    v5->_streamTokensByParticipantID = (NSDictionary *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  int64_t v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  v5 = -[CXCallTokens uplinkStreamToken](self, "uplinkStreamToken");
  NSStringFromSelector(sel_uplinkStreamToken);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v5, v6);

  v7 = -[CXCallTokens downlinkStreamToken](self, "downlinkStreamToken");
  NSStringFromSelector(sel_downlinkStreamToken);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v7, v8);

  v9 = -[CXCallTokens combinedAudioStreamToken](self, "combinedAudioStreamToken");
  NSStringFromSelector(sel_combinedAudioStreamToken);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v9, v10);

  -[CXCallTokens streamTokensByParticipantID](self, "streamTokensByParticipantID");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_streamTokensByParticipantID);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, v11);

}

- (BOOL)isEqual:(id)a3
{
  CXCallTokens *v4;
  BOOL v5;

  v4 = (CXCallTokens *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[CXCallTokens isEqualToCallTokens:](self, "isEqualToCallTokens:", v4);
  }

  return v5;
}

- (BOOL)isEqualToCallTokens:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  v5 = -[CXCallTokens uplinkStreamToken](self, "uplinkStreamToken");
  if (v5 == objc_msgSend(v4, "uplinkStreamToken")
    && (v6 = -[CXCallTokens downlinkStreamToken](self, "downlinkStreamToken"),
        v6 == objc_msgSend(v4, "downlinkStreamToken"))
    && (v7 = -[CXCallTokens combinedAudioStreamToken](self, "combinedAudioStreamToken"),
        v7 == objc_msgSend(v4, "combinedAudioStreamToken")))
  {
    -[CXCallTokens streamTokensByParticipantID](self, "streamTokensByParticipantID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "streamTokensByParticipantID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8 == v9;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (int64_t)uplinkStreamToken
{
  return self->_uplinkStreamToken;
}

- (void)setUplinkStreamToken:(int64_t)a3
{
  self->_uplinkStreamToken = a3;
}

- (int64_t)downlinkStreamToken
{
  return self->_downlinkStreamToken;
}

- (void)setDownlinkStreamToken:(int64_t)a3
{
  self->_downlinkStreamToken = a3;
}

- (int64_t)combinedAudioStreamToken
{
  return self->_combinedAudioStreamToken;
}

- (void)setCombinedAudioStreamToken:(int64_t)a3
{
  self->_combinedAudioStreamToken = a3;
}

- (NSDictionary)streamTokensByParticipantID
{
  return self->_streamTokensByParticipantID;
}

- (void)setStreamTokensByParticipantID:(id)a3
{
  objc_storeStrong((id *)&self->_streamTokensByParticipantID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamTokensByParticipantID, 0);
}

@end
