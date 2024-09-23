@implementation CXChannelProviderConfiguration

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" audioSessionID=%u"), -[CXChannelProviderConfiguration audioSessionID](self, "audioSessionID"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[CXChannelProviderConfiguration isEqualToConfiguration:](self, "isEqualToConfiguration:", v4);

  return v5;
}

- (BOOL)isEqualToConfiguration:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  LODWORD(self) = -[CXChannelProviderConfiguration audioSessionID](self, "audioSessionID");
  v5 = objc_msgSend(v4, "audioSessionID");

  return (_DWORD)self == v5;
}

- (unint64_t)hash
{
  return -[CXChannelProviderConfiguration audioSessionID](self, "audioSessionID");
}

- (void)updateSanitizedCopy:(id)a3 withZone:(_NSZone *)a4
{
  id v5;

  v5 = a3;
  objc_msgSend(v5, "setAudioSessionID:", -[CXChannelProviderConfiguration audioSessionID](self, "audioSessionID"));

}

- (id)sanitizedCopy
{
  return -[CXChannelProviderConfiguration sanitizedCopyWithZone:](self, "sanitizedCopyWithZone:", 0);
}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  void *v5;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CXChannelProviderConfiguration updateSanitizedCopy:withZone:](self, "updateSanitizedCopy:withZone:", v5, a3);
  return v5;
}

- (void)updateCopy:(id)a3 withZone:(_NSZone *)a4
{
  id v6;

  v6 = a3;
  -[CXChannelProviderConfiguration updateSanitizedCopy:withZone:](self, "updateSanitizedCopy:withZone:", v6, a4);
  objc_msgSend(v6, "setAudioSessionID:", -[CXChannelProviderConfiguration audioSessionID](self, "audioSessionID"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CXChannelProviderConfiguration updateCopy:withZone:](self, "updateCopy:withZone:", v5, a3);
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CXChannelProviderConfiguration)initWithCoder:(id)a3
{
  id v4;
  CXChannelProviderConfiguration *v5;
  void *v6;

  v4 = a3;
  v5 = -[CXChannelProviderConfiguration init](self, "init");
  if (v5)
  {
    NSStringFromSelector(sel_audioSessionID);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_audioSessionID = objc_msgSend(v4, "decodeInt32ForKey:", v6);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  v5 = -[CXChannelProviderConfiguration audioSessionID](self, "audioSessionID");
  NSStringFromSelector(sel_audioSessionID);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInt32:forKey:", v5, v6);

}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (void)setAudioSessionID:(unsigned int)a3
{
  self->_audioSessionID = a3;
}

@end
